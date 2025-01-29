Return-Path: <linuxppc-dev+bounces-5663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E31A217A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 07:14:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjX1R3G9bz2yyC;
	Wed, 29 Jan 2025 17:14:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738131275;
	cv=none; b=GWIHH6D2PpzsXk8tB7EtcnqP7afDoPm+Hf1uX+/tTc5tP3X8+SBtNquWJG9PeTiqiVXQ5dlwRvZbWb8SViBeSDg2wrXbQe4cz4B8dm8tZg8FwkZ9+QUU2x63LQi28Bp4+uTI++nS9PJQng1NgZwHNHl6xLhzB+8rXXIlbHHfvwSVm/uOv7BzHcny7IEQxCDnXet/F4HH85MoQZWi1oiLfPq+Z166tt6fr/QLCwPj0W4UAYJ+qKHGe5L6x2Exvu0oLk70dMPvLA/z5Ea+/g/n30f2u7ReT60qGbcdeIHtJ3K6tfTWQEXR3m8OugUl2nxwvlR2lih8YcQaCf7sJq2Q6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738131275; c=relaxed/relaxed;
	bh=XkmUrIUEsRWysikV6FEbJ78SxnsQkg3H6JLLeYfDd88=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=YCJ8Na3kGGmO/cThhaxIJoheVXuNmGl7w310x1LjDcsUCdprl/4LzdoKdXLKyfA9fQ2ELqM4EF8IY2r8NRS4FDlBdRS46NMQJET+yMoHBCeJ4QL7+NDI2f8cgNcdQ9H6PW2mRh31ZDZnNESSVRPyz4PDmCbXv0YXg3tGlLY/7OU4AV2yihSAQj4diswMB8s0xBZXMkcMglho4cUEJ2T6ztfoJszSXycoCX68qj/vhzmFJJAxqdsEl3FI/Bw0ASnargyvcSlfhTfd+2ZckEERExQ+1fS/eQl9LVj7VBvj0VJKC2qAGd+ZLVoidja+iN2svEo7pz0V0Y96/tZSjlUkpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eWt8sIgW; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=eWt8sIgW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjX1Q2xQCz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 17:14:32 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-215770613dbso82351565ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 22:14:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738131271; x=1738736071; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XkmUrIUEsRWysikV6FEbJ78SxnsQkg3H6JLLeYfDd88=;
        b=eWt8sIgWVcsU6usE0CX9oFBmIy4LSWx09RJ2R82bxvOhRVe/UOvpJzeRjtkFK8ByAk
         NNLZ4yYdtjwybKRFoPiYUUlRKeETmBiITW8/Zlqb5HTZJGYEN/t9JRSkvcgcVh0fpfT8
         h3Ga6n0RVozDhOHIfVBHKeCaz0t+X4wzwyavFXwqiFSOBIA0BNwsjtUcqNve36GRW1/z
         YmV4SnykuHvaJkbCD5vV43RIcyj8v/S1ieEWK00RdtXGEzVTf5UdHK+zBxToPtv5XZsy
         bJr+1nWz688vkFkKfIXUmPU7beUpOiSTqQzawguf5OziaTZh0ewVoRlz0QOl+VQVs5vM
         +xtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738131271; x=1738736071;
        h=in-reply-to:references:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XkmUrIUEsRWysikV6FEbJ78SxnsQkg3H6JLLeYfDd88=;
        b=T8BCLMnalBgbtZTDLRTJ8/IqiLwz2J+TWkeWazz4/Wr1NYoEht/jZ/NqXihtO8Etmb
         NOV9gwgiPo0q+WFnFAo6EtbaVgZtBVAguSGmQP0K559+UvpDG8vEnB7CRdY9qKDvcN4l
         gMgVKU4OAi9+dvJS9U6O5ZlbsQhYSHRKz2nYYHukR4J1cRIWLlBWJX5V6503WdGJNG3a
         wHThGAOGJNlF7u2YlnhQpoYV/6wsze+TyEt7nqybpIIrKfdGvX31nOYqbjXU193IY04G
         L8G/nZhWj+Y1VH2uw13w1K9ccQSPlPR7pcl50ofQ2x/RUXNGET0YwETSkE4yy74Oz/t9
         DzTg==
X-Forwarded-Encrypted: i=1; AJvYcCXJYxNtWrwq/X2JuMb7rFRNVUtIytJrbUVTdMO4PK1nvo4o7e8ybmOuwb98wqO6hva9dT2VZIZELR3iWHQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNe/lqx4UflpO97/+EvBWv0oNBKr5sShNxFFF5WrYcSgG0DMwD
	UrG1SzmtN+BRz2+nHTMyYLh3pv3Q9wYrDln47/BLrT3sVUL8A7ZY34iIeS0/
X-Gm-Gg: ASbGncuX4nXh3n4r6+tyIZxFUcKXL/ehXqp4QaFw3ZBS4ML3hD7jr6q8af/UCCFRt4o
	pwbwFFbDZ6zzc2hZonwGHU87LlVtqkSu0/Q/VljpUXlnJun2U+5NaMKtGW87VmvGVmJGHLVcpLh
	HNZEx4y40aSdKxll4Z3oO9o68ASCSMURHwdXippNxM1Po6cj6iw8Ud408P7kjD8UYiGnMp+gUZH
	SxDw+n5ci2eI6I6HbOi0q3e+yNsMMGFCT1q2Pz/1uh/rFS3qp5W3qDJbfe23w7koTuPbsZYTGdW
	y/j0t5dQ
X-Google-Smtp-Source: AGHT+IEnKHmq/2h61X3+c6iV5bjdl22nXSPtGSK66O167+0PUokMTx2yuwudCI6sw6jdrjIHytpgBw==
X-Received: by 2002:a17:902:e742:b0:215:a97a:c6bb with SMTP id d9443c01a7336-21dd7c65891mr29196205ad.12.1738131270797;
        Tue, 28 Jan 2025 22:14:30 -0800 (PST)
Received: from localhost ([1.146.123.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3fa9b6asm91165505ad.106.2025.01.28.22.14.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 22:14:30 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 29 Jan 2025 16:14:25 +1000
Message-Id: <D7EC3ZZ2E3YY.5ALSOA646CK4@gmail.com>
Subject: Re: [PATCH 4/5] powerpc: Define config option for processors
 without broadcast TLBIE
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paul Mackerras" <paulus@ozlabs.org>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.19.0
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lf-OrrbRe5Q0O-@thinks.paulus.ozlabs.org>
In-Reply-To: <Z5lf-OrrbRe5Q0O-@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Jan 29, 2025 at 8:53 AM AEST, Paul Mackerras wrote:
> Power ISA v3.1 implementations in the Linux Compliancy Subset and
> lower are not required to implement broadcast TLBIE, and in fact
> Microwatt doesn't.  To avoid the need to specify "disable_tlbie" on
> the kernel command line on SMP Microwatt systems, this defines a
> config option that asserts that broadcast TLBIE should never be used
> (the kernel will instead use IPIs to trigger local TLBIEs on other
> CPUs when required).
>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/mm/book3s64/pgtable.c       | 10 ++++++++--
>  arch/powerpc/platforms/Kconfig.cputype   | 12 ++++++++++++
>  arch/powerpc/platforms/microwatt/Kconfig |  1 +
>  3 files changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s6=
4/pgtable.c
> index 374542528080..14ee96e2a581 100644
> --- a/arch/powerpc/mm/book3s64/pgtable.c
> +++ b/arch/powerpc/mm/book3s64/pgtable.c
> @@ -588,10 +588,16 @@ int pmd_move_must_withdraw(struct spinlock *new_pmd=
_ptl,
>  }
>  #endif
> =20
> +#ifndef CONFIG_PPC_RADIX_NO_BROADCAST_TLBIE

Hate to bikeshed, but would it be annoying to make this an affirmative
option?

> +#define DEFAULT_TLBIE_ENABLE	true
> +#else
> +#define DEFAULT_TLBIE_ENABLE	false
> +#endif
> +
>  /*
>   * Does the CPU support tlbie?
>   */
> -bool tlbie_capable __read_mostly =3D true;
> +bool tlbie_capable __read_mostly =3D DEFAULT_TLBIE_ENABLE;
>  EXPORT_SYMBOL(tlbie_capable);
> =20
>  /*
> @@ -599,7 +605,7 @@ EXPORT_SYMBOL(tlbie_capable);
>   * address spaces? tlbie may still be used for nMMU accelerators, and fo=
r KVM
>   * guest address spaces.
>   */
> -bool tlbie_enabled __read_mostly =3D true;
> +bool tlbie_enabled __read_mostly =3D DEFAULT_TLBIE_ENABLE;
> =20
>  static int __init setup_disable_tlbie(char *str)
>  {
> diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platfo=
rms/Kconfig.cputype
> index 1453ccc900c4..bd2a4e46ab34 100644
> --- a/arch/powerpc/platforms/Kconfig.cputype
> +++ b/arch/powerpc/platforms/Kconfig.cputype
> @@ -449,6 +449,18 @@ config PPC_RADIX_MMU_DEFAULT
> =20
>  	  If you're unsure, say Y.
> =20
> +config PPC_RADIX_NO_BROADCAST_TLBIE
> +	depends on PPC_RADIX_MMU
> +	help
> +	  Power ISA v3.1 implementations in the Linux Compliancy Subset
> +	  and lower are not required to implement broadcast TLBIE
> +	  instructions, that is, a TLB invalidation instruction
> +	  performed on one CPU is not required to operate on the TLBs
> +	  in all CPUs in the system.  Instead, the kernel does an IPI
> +	  to each relevant CPU to get it to do a local TLBIE instruction.
> +	  Select this option to force global invalidations to be done via
> +	  IPIs unconditionally.

... when using radix MMU. Hash MMU requires broadcast TLBIE.

Nitpicks aside, looks okay to me.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> +
>  config PPC_KERNEL_PREFIXED
>  	depends on PPC_HAVE_PREFIXED_SUPPORT
>  	depends on CC_HAS_PREFIXED
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/plat=
forms/microwatt/Kconfig
> index 5e41adadac1f..1d5cc1ae3636 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -7,6 +7,7 @@ config PPC_MICROWATT
>  	select PPC_ICP_NATIVE
>  	select PPC_UDBG_16550
>  	select COMMON_CLK
> +	select PPC_RADIX_NO_BROADCAST_TLBIE
>  	help
>            This option enables support for FPGA-based Microwatt implement=
ations.
> =20


