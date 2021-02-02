Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4645430D063
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:44:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjbz3hFhzDqm6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:43:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVLhj1BhGzDq8W
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 21:31:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LzeUqkRm; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DVLhh1pSXz9vFB;
 Tue,  2 Feb 2021 21:31:48 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1612261908;
 bh=JuePySg4dvC1vNBXBhd6zw84fZMgcuih6ehxVEdH+gI=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LzeUqkRm9gkm9Vshtms9B9q/tDJrcKEjwYcVTGyt9pMR8lMdKfQcvdJgRsbwVYKZJ
 IRRmOKyku+QbiDYxRXY5uwJEXZer5da4Vc8qWjL8jf8AIr5UYvCTcdYM/fb7dDPd4y
 ss8kFGXBqGfLH0EJ9diWIuRCY2Dve2sJUzGoCL5Wk2+V1q1pAjj/inxBBowsr09FbN
 /S6EGlp2AvWuu85VMHETq0Dke1tl+Wa0xozq1wjChhe/URl1jJ1zJEigf8BJTpGYRR
 i00p+Jvn/w/tlrlhJA9EV3AMo+PSiff57MylG57wKAQi8RZMrDUjS/mE7mSUERkway
 wJZDQdunAiP0Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v7 42/42] powerpc/64s: power4 nap fixup in C
In-Reply-To: <20210130130852.2952424-43-npiggin@gmail.com>
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-43-npiggin@gmail.com>
Date: Tue, 02 Feb 2021 21:31:43 +1100
Message-ID: <878s86dals.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> There is no need for this to be in asm, use the new intrrupt entry wrapper.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/interrupt.h   | 15 +++++++++
>  arch/powerpc/include/asm/processor.h   |  1 +
>  arch/powerpc/include/asm/thread_info.h |  6 ++++
>  arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
>  arch/powerpc/kernel/idle_book3s.S      |  4 +++
>  5 files changed, 26 insertions(+), 45 deletions(-)

Something in here is making my G5 not boot.

I don't know what the problem is because that machine is in the office,
and I am not, and it has no serial console.

I tried turning on pstore but it doesn't record anything :/

cheers
