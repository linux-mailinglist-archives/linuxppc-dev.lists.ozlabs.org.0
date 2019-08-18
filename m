Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C51C291459
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2019 05:50:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46B34843TZzDrfY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Aug 2019 13:50:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46B32X5sb8zDrP8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Aug 2019 13:49:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46B32X1f6Hz9s00;
 Sun, 18 Aug 2019 13:49:08 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/64s: remplement power4_idle code in C
In-Reply-To: <20190711022404.18132-1-npiggin@gmail.com>
References: <20190711022404.18132-1-npiggin@gmail.com>
Date: Sun, 18 Aug 2019 13:49:03 +1000
Message-ID: <8736hz6sls.fsf@concordia.ellerman.id.au>
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
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index eee5bef736c8..64d5ffbb07d1 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -2286,15 +2286,6 @@ USE_FIXED_SECTION(virt_trampolines)
>  __end_interrupts:
>  DEFINE_FIXED_SYMBOL(__end_interrupts)
>  
> -#ifdef CONFIG_PPC_970_NAP
> -EXC_COMMON_BEGIN(power4_fixup_nap)
> -	andc	r9,r9,r10
> -	std	r9,TI_LOCAL_FLAGS(r11)
> -	ld	r10,_LINK(r1)		/* make idle task do the */
> -	std	r10,_NIP(r1)		/* equivalent of a blr */
> -	blr
> -#endif

This breaks ppc64_defconfig build with:

ERROR: start_text address is c000000000008100, should be c000000000008000

Due to:

c000000000008000 <0000001a.long_branch.power4_fixup_nap>:
c000000000008000:       48 03 5a b4     b       c00000000003dab4 <power4_fixup_nap>


Moving power4_fixup_nap back into exceptions-64s.S seems to fix it.

cheers
