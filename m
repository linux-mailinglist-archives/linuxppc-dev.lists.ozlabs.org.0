Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E1C50CAC6
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 15:43:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlstF3kV4z3bdP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 23:43:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E8Qf0rsb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlssZ4rQlz2yLJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 23:42:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=E8Qf0rsb; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KlssS6MyJz4xNl;
 Sat, 23 Apr 2022 23:42:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1650721357;
 bh=3C84ccftDy9PVflkyViujWf+bf2fZBGJWRvoGbxG78Y=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=E8Qf0rsbg2AmYN3VZ5Qbq04Kd93P+e7QcYX938BlW0MGhPm7LSsGT709miZJvRR4K
 VGur63wHMpRA6g2+DdVY9c9eh7Z1RIDpHE+d5KVLGIw9z6EKB6cEJBHgonac988AfC
 MusaEn47ZdylpoKSs2n1v7EQwmJS3qeh1IZAsUhmQH62RHZ3KUBnQPRuANhw21p2E0
 GBvaOSV3I+fSP/rQHzIMn8OkNCyazaf8XVwl+4G1Y7Iqmit4msjPaMSaQPuu05OIuW
 DDNdQdKQhZROfPopqfJlMnwyPMEwmeFV2uXvxiZjACOMVxJ8XGuPWGDBSdMYHFXWEc
 veJEk/csNuIIw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christoph Hellwig <hch@lst.de>, akpm@linux-foundation.org
Subject: Re: [PATCH] net: unexport csum_and_copy_{from,to}_user
In-Reply-To: <20220421070440.1282704-1-hch@lst.de>
References: <20220421070440.1282704-1-hch@lst.de>
Date: Sat, 23 Apr 2022 23:42:30 +1000
Message-ID: <87o80r9ard.fsf@mpe.ellerman.id.au>
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
Cc: netdev@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christoph Hellwig <hch@lst.de> writes:
> csum_and_copy_from_user and csum_and_copy_to_user are exported by
> a few architectures, but not actually used in modular code.  Drop
> the exports.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/alpha/lib/csum_partial_copy.c   | 1 -
>  arch/m68k/lib/checksum.c             | 2 --
>  arch/powerpc/lib/checksum_wrappers.c | 2 --
>  arch/x86/lib/csum-wrappers_64.c      | 2 --
>  4 files changed, 7 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
