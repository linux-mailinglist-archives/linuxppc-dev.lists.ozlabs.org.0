Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E5C34C2B6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 06:41:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F80Jk5gJrz30Ft
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 15:41:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=o8szlM9a;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=o8szlM9a; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F80JH3vjhz300P
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 15:40:47 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F80J93n3Rz9sRf;
 Mon, 29 Mar 2021 15:40:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616992841;
 bh=G60lHAAr37lzMBojMKI2HtnHi8Y2w5i/4lFFa8V/oLk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=o8szlM9a7XiPuRNdbZQl4KgkVR1gxnnhIGeTMFfmPzIfFPTxFUYNgHXh331qNotSB
 ERjm8ZWn3cwV0w3ibBZHDumxqHZ7ay+kC0yu+ziRY8NDfBBp7TneIGchIR/gLfjMGH
 b+Wlo4PnOT/z9I7VtzpUmB58l5pEN/CscHhlZfaGLyWs9GKIrw1uAvnn9tqP0BFT5E
 XAlfU6e3vGhm4rw4EIXxbFa3IduEjRE9hWPXNbH9VlbBCRe2O6dqdEnnTICI2xO6CR
 eKoG6fNGOzmWyeXLB43uVUAcYSDVciYiJxHhjVI2geWiiO/Q8Qsps1U/y8btjOG2AS
 LJh38RBCseVYQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
In-Reply-To: <20210312012044.3660743-1-npiggin@gmail.com>
References: <20210312012044.3660743-1-npiggin@gmail.com>
Date: Mon, 29 Mar 2021 15:40:36 +1100
Message-ID: <87y2e6fu7v.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> There is no need for this to be in asm, use the new intrrupt entry wrapper.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Hopefully this works on a real G5 now, but I couldn't reproduce the
> problem with QEMU.

It still prevents my G5 from booting.

Next time someone is in the office I'll ask them to check the display to
see if there's an oops.

cheers
