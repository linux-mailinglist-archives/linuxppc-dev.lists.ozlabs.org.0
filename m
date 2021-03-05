Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B40832E1E7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 06:54:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsH4b184Nz3dC5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 16:54:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=bS/oHgGI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=bS/oHgGI; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsH480fkhz3cK7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 16:54:15 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id p21so622464pgl.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 21:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JqUWCFyVuv0H2Wh1BTSETwqA0oM5AW2lC5rIk29qh1I=;
 b=bS/oHgGIBkdHm6OegfLS7TFqld9dU5de2E+0ipeJ5c2DZJwTCXhv/sFEchETupGEwx
 hoYdm/2aWKpups3NTFDHU9b/DwCMkFHppV34jjZSnukXUNsneXqxdGlwt8v2DM9q3P5j
 C/GhlR9i0bLOnOAWBBb2PKGeA9rwpGoA+/6Ys=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JqUWCFyVuv0H2Wh1BTSETwqA0oM5AW2lC5rIk29qh1I=;
 b=gnchGUPAIp+fOTnFg/xTjjUPFrjoOBYD+Wf89sajuasage4AVn3eHoMhJ8t9ExF5TX
 HFoiJFEiLuOeFMt1LP6RP5kw4UJ+To8WlCcjnC0l4zyIA5ZPo8tvWHqg5im/9t1pe+Jq
 Ikh1IkCsVTR/WEn/dcuO3s0HYGJ7Vi2YXLNwweD6ry7PhF1fJde0yol/ZYDWIb5ZiqDZ
 E4GKjMTOkHHF4oB7VGtAr9mTb3L9J4bXOfy/YEHnWIxr4TfNnRCyisiKSWDa+XDyt+0z
 9ElUse4qYfT6I1zWoZhFWqVqqbNrCs8qU84/cWejeV6qu2P2bmXyn3z1J3C1LON6M5nA
 dAIQ==
X-Gm-Message-State: AOAM530WKi/Xweoc3eInDjdB4zMa4SWXStl5ubjeKREE0i2MQPLYu1PI
 f4UFZQFs5tz5skRcZsUTgPJ8OQ==
X-Google-Smtp-Source: ABdhPJyDGpsAz2tWTfFnOll45AyL/0CTz1s+BVgn7s9QJrjRSPCA4m2s2JubFx5gysYvABv9uM+tDQ==
X-Received: by 2002:a63:cc05:: with SMTP id x5mr6778459pgf.254.1614923651586; 
 Thu, 04 Mar 2021 21:54:11 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id n184sm1192954pfd.205.2021.03.04.21.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 21:54:11 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 07/37] KVM: PPC: Book3S 64: Move GUEST_MODE_SKIP test
 into KVM
In-Reply-To: <20210225134652.2127648-8-npiggin@gmail.com>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-8-npiggin@gmail.com>
Date: Fri, 05 Mar 2021 16:54:08 +1100
Message-ID: <87o8fy87sv.fsf@linkitivity.dja.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

> -	.if IKVM_SKIP
> -89:	mtocrf	0x80,r9
> -	ld	r10,IAREA+EX_CTR(r13)
> -	mtctr	r10
> -	ld	r9,IAREA+EX_R9(r13)
> -	ld	r10,IAREA+EX_R10(r13)
> -	ld	r11,IAREA+EX_R11(r13)
> -	ld	r12,IAREA+EX_R12(r13)
> -	.if IHSRR_IF_HVMODE
> -	BEGIN_FTR_SECTION
> -	b	kvmppc_skip_Hinterrupt
> -	FTR_SECTION_ELSE
> -	b	kvmppc_skip_interrupt
> -	ALT_FTR_SECTION_END_IFSET(CPU_FTR_HVMODE | CPU_FTR_ARCH_206)

I was initially concerned that you were pulling out the complexities
around IHSRR_IF_HVMODE, but I checked exceptions-64s.S and the only
exception handler that sets IHSRR_IF_HVMODE is hardware_interrupt and
that does not set IKVM_SKIP, so we are indeed fine to not keep this
complex little asm section.

> -	.elseif IHSRR
> -	b	kvmppc_skip_Hinterrupt
> -	.else
> -	b	kvmppc_skip_interrupt
> -	.endif
> -	.endif
>  .endm

> +/*
> + * KVM uses a trick where it is running in MSR[HV]=1 mode in real-mode with the
> + * guest MMU context loaded, and it sets KVM_GUEST_MODE_SKIP and enables
> + * MSR[DR]=1 while leaving MSR[IR]=0, so it continues to fetch HV instructions
> + * but loads and stores will access the guest context. This is used to load
> + * the faulting instruction without walking page tables.
> + *
> + * However the guest context may not be able to translate, or it may cause a
> + * machine check or other issue, which will result in a fault in the host
> + * (even with KVM-HV).
> + *
> + * These faults are caught here and if the fault was (or was likely) due to
> + * that load, then we just return with the PC advanced +4 and skip the load,
> + * which then goes via the slow path.
> + */

This is a really helpful comment! Thanks!

> +.Lmaybe_skip:
> +	cmpwi	r12,BOOK3S_INTERRUPT_MACHINE_CHECK
> +	beq	1f
> +	cmpwi	r12,BOOK3S_INTERRUPT_DATA_STORAGE
> +	beq	1f
> +	cmpwi	r12,BOOK3S_INTERRUPT_DATA_SEGMENT
> +	beq	1f
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +	/* HSRR interrupts have 2 added to trap vector */
> +	cmpwi	r12,BOOK3S_INTERRUPT_H_DATA_STORAGE | 0x2

This took me by surprise for a while, but I checked how it works in
exceptions-64s.S and indeed the GEN_KVM macro will add 0x2 to the IVEC
if IHSRR is set, and it is set for h_data_storage.

So this checks out to me.

I have checked, to the best of my limited assembler capabilities that
the logic before and after matches. It seems good to me.

On that limited basis,
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel


> +	beq	2f
> +#endif
> +	b	.Lno_skip
> +1:	mfspr	r9,SPRN_SRR0
> +	addi	r9,r9,4
> +	mtspr	SPRN_SRR0,r9
> +	ld	r12,HSTATE_SCRATCH0(r13)
> +	ld	r9,HSTATE_SCRATCH2(r13)
> +	GET_SCRATCH0(r13)
> +	RFI_TO_KERNEL
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +2:	mfspr	r9,SPRN_HSRR0
> +	addi	r9,r9,4
> +	mtspr	SPRN_HSRR0,r9
> +	ld	r12,HSTATE_SCRATCH0(r13)
> +	ld	r9,HSTATE_SCRATCH2(r13)
> +	GET_SCRATCH0(r13)
> +	HRFI_TO_KERNEL
> +#endif
> -- 
> 2.23.0
