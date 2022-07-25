Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FAC857F9A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 08:51:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LrrLg1ybyz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 16:51:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SQ4dHzjS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LrrL43CTNz3bZP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jul 2022 16:51:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SQ4dHzjS;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LrrL206Bbz4xD0;
	Mon, 25 Jul 2022 16:51:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1658731884;
	bh=Cq8bprSGytnq2wIOB6aqNZj7GK3JK47zvUvRs+fgQm4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SQ4dHzjSQVr6SQ8wG7VrnKMJ6yPNI7yp4dfApyCrgCSvRQ4dd2JzPWqGRBHv+SqYB
	 pTr5y8lGQXXQPWdR1+3/oHhaAPDoybW29W3objiWdq7anBqYbTI05SsCmVgUCNGzjj
	 I3tyc5sxmqGtpM5F+U/kim/dfMcE05BxOnj61gFuucMIeEKK/s0/YH/iAZzt3709Q2
	 EdLvJCB8U53InTde6PO+wfQ3lwIdtji6Fddg0Woxz85+UH74bV5X1NdtzjNV5FcIy6
	 yOk1JqM6NP6Ttlz//q96UKGru1D3mgAHupUSGc04EFIvk+QKnXKjLWFBnmzzayjkIN
	 mWMMRZflV+h6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: wangjianli <wangjianli@cdjrlc.com>, benh@kernel.crashing.org,
 paulus@samba.org, Julia.Lawall@inria.fr, liubo03@inspur.com
Subject: Re: [PATCH] powerpc/kvm: fix repeated words in comments Delete the
 redundant word 'that'.
In-Reply-To: <20220724062920.1551-1-wangjianli@cdjrlc.com>
References: <20220724062920.1551-1-wangjianli@cdjrlc.com>
Date: Mon, 25 Jul 2022 16:51:19 +1000
Message-ID: <87bktdd6s8.fsf@mpe.ellerman.id.au>
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
Cc: wangjianli <wangjianli@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

wangjianli <wangjianli@cdjrlc.com> writes:
> Signed-off-by: wangjianli <wangjianli@cdjrlc.com>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_hv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_hv.c b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> index 514fd45c1994..73c6db20cd8a 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_hv.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_hv.c
> @@ -1601,7 +1601,7 @@ long kvm_vm_ioctl_resize_hpt_commit(struct kvm *kvm,
>   * is valid, it is written to the HPT as if an H_ENTER with the
>   * exact flag set was done.  When the invalid count is non-zero
>   * in the header written to the stream, the kernel will make
> - * sure that that many HPTEs are invalid, and invalidate them
> + * sure that many HPTEs are invalid, and invalidate them
>   * if not.

The existing wording is correct:

 "the kernel will make sure that ... that many HPTEs are invalid"

cheers
