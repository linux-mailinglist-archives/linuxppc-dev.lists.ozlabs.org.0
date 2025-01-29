Return-Path: <linuxppc-dev+bounces-5664-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D80A217A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2025 07:21:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjX9X429Sz2yyR;
	Wed, 29 Jan 2025 17:21:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738131696;
	cv=none; b=N9X5j5AuS39ZXJ4OgLYLclGdBp+RJ65G08K2zSD9I5g1makuXbDyIbJKpgclLEXGVd9kGCnfAPCey9hdpUVrFSxL/6duutj6sgjmCGJf2hcMpG0An/wfjga0YncZ72SalsPtX5/Kh+J1480rfD6U2pSxX6gDKLsEKgRuzhDGVla4nrLURPls16Q1eKdGVTBDchzBzYAC6GjfQdOrKPUt7oSn/0rq6vVQT0UbSO1MWvVm+n54aDW5vgqXLKt4Rqh0lJfQohljUpy/5McdzDi5l3KXjKanmm/QJgIYONsW2SLZG8QffhsU3Uf4hhhfT1dkZ4dhRRNNwpCNcy85qsP5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738131696; c=relaxed/relaxed;
	bh=f+k14XdPzXMIE5MVaii+lsmbVkX+PY7+XJbHWcRVS3s=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Subject:
	 References:In-Reply-To; b=lGqqZ5WA322iBKAHHxz5irbVI2wKjcMY7+GrIJHjxvvk6By+6DEchrmsU6UEcNQZNDwJwM/5Bi2RBZA3htxtOTy+jgBiTegHwNaPzlgawXJEuFzfmKW6GkXKHoNhy7kRAd3EEiyXagMY7CtN2ymP4yIICfUv3yN/N+FzqYf/YpyIz2FHt3PJMoDfOXbjPr6VvISIAo9r3XFmOwCNT0j8P06mr1oYQEwaCavX7EgQ/9XJHXjg+og4SxQFvx3Cni4c11Hx/ZJvsKvFOk9B70Cyt1pEaTHIPUPjaTIEuGCkPDaubuwiJaTz3A3+uNNDxamKiWfll502GhwyRLu0fbslpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ljBJoQi6; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ljBJoQi6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YjX9W4l8Mz2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 17:21:34 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2164b1f05caso111939175ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 22:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738131692; x=1738736492; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f+k14XdPzXMIE5MVaii+lsmbVkX+PY7+XJbHWcRVS3s=;
        b=ljBJoQi66qJlhPc+kLeX7iAn2vMqUiYKnINyYNMp+DV4Avmb28XgRLl+PAPOLemDw0
         ENbDXeWiYdUhkfmrvfpo4wNQ5NVtf4evqZN8DNxps/2JnP2cssONF652dMeUXfinVRzv
         3jFdEGI2ePYlpaXTaCdwzCYu+8Jn9ie8XJ39MuLOkXyAeC1UDcJ31o9yUczuru3lepNw
         xMPoaRr98zG4jDSxINAVR6reTBn3FEF12MaZ+Ynn96ch7wnV+shYvHNtBYmGHaeO8qiR
         tazFGlUa08o+iWac/3uR7TNdUXOSfjAwiQ88QIFes0MxiraHn2JWXn/T2G2gkIUd3GG1
         Ebzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738131692; x=1738736492;
        h=in-reply-to:references:subject:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f+k14XdPzXMIE5MVaii+lsmbVkX+PY7+XJbHWcRVS3s=;
        b=jwPBfXZhaEWmRlqApdjgHn2sjyOWNRW/CeCBtWZoYwgRRAj9EdyLQTc2y3T03RAK2s
         KJ1gXWvi7KpsiHK+nW80VnNONyclNZhzDfsJMvfMJyKYOs6WOpbBfuqQTlf30Oa8evLr
         U6QErU+jmbBU4DCSidgMuN/RNcSilevarxF45o4OMA6xghNGRDZsxyMV3N4eAQlIZPHI
         U8/hSY+6CDY6fv+wpU9/2UX/ZH1O6tbIv3oWMI/Mhc5zIlqA7MjflNPI86wydssUpQED
         5z+1ttfEbnRkQZtIzvQXKuDfH5qZRE3rI2Zxbw7iPQp3k8aDwgmXmRnHVnXxtpHCgPDQ
         1ePg==
X-Forwarded-Encrypted: i=1; AJvYcCUQJHK9TB7+a7yjiDgByu0Quyy55n96n7aMo+FvZbe79h0DlzQE39UTcQTrs9YRgbILbXHzi5EWHYcaBwA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywhcgjpfm1KH9WQ9skfQZm+gxYrkokNRVwg9vWQDKWxNYvXfO1S
	AENUhROPHBIPaSPIXK63b3QNvjRhET9LaF1xPeX/PgSnZ8jWOdVpYGiyMX+Y
X-Gm-Gg: ASbGncv9zRWYyuAPyBNXHHV/WRBdfjxIyi7aQv20u6MmNf1j21Hwl0GSxXEQpq2Yb0O
	GcGMWvzT34WMQzZ6Ajxacq01zda7uF4bw7wYgG0fjA+i8oSV9+u6azGd5ZoNd/aTc75htrziV1u
	a+16lqhk2ZGK4YyFeZG1OioNzBuSZ6DDUT0nULJWs0v2DOHzWcHG6xtP2+V0miYBlDS6AgrqYaf
	j7mv1Buuor+CX9uEh/7GeetCvnUM9vKlfqm9KqW69a6LVMDs9Rx7R6NhfAsNOP4PQYwDH3fQMJC
	8Ctu0pyY
X-Google-Smtp-Source: AGHT+IGup1E2a0pGuLJHxumyXTkKKSkGKAHLdbzsrg0FstGF1KWSI37xnaKzzwJvU3hDjoGXTEg8mg==
X-Received: by 2002:a17:902:d549:b0:215:a7e4:8475 with SMTP id d9443c01a7336-21dd7d64c6bmr35147085ad.24.1738131692110;
        Tue, 28 Jan 2025 22:21:32 -0800 (PST)
Received: from localhost ([1.146.123.110])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da4141536sm91136415ad.156.2025.01.28.22.21.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jan 2025 22:21:31 -0800 (PST)
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
Date: Wed, 29 Jan 2025 16:21:26 +1000
Message-Id: <D7EC9DL1YW6K.5NFBT1W937FK@gmail.com>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Paul Mackerras" <paulus@ozlabs.org>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 5/5] powerpc/microwatt: Add SMP support
X-Mailer: aerc 0.19.0
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lgTN0aA_yiETne@thinks.paulus.ozlabs.org>
In-Reply-To: <Z5lgTN0aA_yiETne@thinks.paulus.ozlabs.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed Jan 29, 2025 at 8:55 AM AEST, Paul Mackerras wrote:
> This adds support for Microwatt systems with more than one core, and
> updates the device tree for a 2-core version.  (This does not prevent
> the kernel from running on a single-core system.)
>
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>

Well, I'm impressed you added SMP :)

What happens with a 1 CPU system? Do we time out waiting for secondaries
and continue, or is there something more graceful?

> ---
>  arch/powerpc/boot/dts/microwatt.dts          | 34 ++++++++++++++++++--
>  arch/powerpc/platforms/microwatt/Kconfig     |  2 +-
>  arch/powerpc/platforms/microwatt/Makefile    |  1 +
>  arch/powerpc/platforms/microwatt/microwatt.h |  1 +
>  arch/powerpc/platforms/microwatt/setup.c     | 10 ++++++
>  5 files changed, 45 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/boot/dts/microwatt.dts b/arch/powerpc/boot/dts/=
microwatt.dts
> index 6e575e841a7b..89281dc975b3 100644
> --- a/arch/powerpc/boot/dts/microwatt.dts
> +++ b/arch/powerpc/boot/dts/microwatt.dts
> @@ -142,6 +142,36 @@ PowerPC,Microwatt@0 {
>  			ibm,mmu-lpid-bits =3D <12>;
>  			ibm,mmu-pid-bits =3D <20>;
>  		};
> +
> +		PowerPC,Microwatt@1 {
> +			i-cache-sets =3D <2>;
> +			ibm,dec-bits =3D <64>;
> +			reservation-granule-size =3D <64>;
> +			clock-frequency =3D <100000000>;
> +			timebase-frequency =3D <100000000>;
> +			i-tlb-sets =3D <1>;
> +			ibm,ppc-interrupt-server#s =3D <1>;
> +			i-cache-block-size =3D <64>;
> +			d-cache-block-size =3D <64>;
> +			d-cache-sets =3D <2>;
> +			i-tlb-size =3D <64>;
> +			cpu-version =3D <0x990000>;
> +			status =3D "okay";
> +			i-cache-size =3D <0x1000>;
> +			ibm,processor-radix-AP-encodings =3D <0x0c 0xa0000010 0x20000015 0x40=
00001e>;
> +			tlb-size =3D <0>;
> +			tlb-sets =3D <0>;
> +			device_type =3D "cpu";
> +			d-tlb-size =3D <128>;
> +			d-tlb-sets =3D <2>;
> +			reg =3D <1>;
> +			general-purpose;
> +			64-bit;
> +			d-cache-size =3D <0x1000>;
> +			ibm,chip-id =3D <0>;
> +			ibm,mmu-lpid-bits =3D <12>;
> +			ibm,mmu-pid-bits =3D <20>;
> +		};
>  	};
> =20
>  	soc@c0000000 {
> @@ -154,8 +184,8 @@ soc@c0000000 {
> =20
>  		interrupt-controller@4000 {
>  			compatible =3D "openpower,xics-presentation", "ibm,ppc-xicp";
> -			ibm,interrupt-server-ranges =3D <0x0 0x1>;
> -			reg =3D <0x4000 0x100>;
> +			ibm,interrupt-server-ranges =3D <0x0 0x2>;
> +			reg =3D <0x4000 0x10 0x4010 0x10>;
>  		};
> =20
>  		ICS: interrupt-controller@5000 {
> diff --git a/arch/powerpc/platforms/microwatt/Kconfig b/arch/powerpc/plat=
forms/microwatt/Kconfig
> index 1d5cc1ae3636..8911ea7cf12e 100644
> --- a/arch/powerpc/platforms/microwatt/Kconfig
> +++ b/arch/powerpc/platforms/microwatt/Kconfig
> @@ -1,6 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  config PPC_MICROWATT
> -	depends on PPC_BOOK3S_64 && !SMP
> +	depends on PPC_BOOK3S_64
>  	bool "Microwatt SoC platform"
>  	select PPC_XICS
>  	select PPC_ICS_NATIVE
> diff --git a/arch/powerpc/platforms/microwatt/Makefile b/arch/powerpc/pla=
tforms/microwatt/Makefile
> index 116d6d3ad3f0..d973b2ab4042 100644
> --- a/arch/powerpc/platforms/microwatt/Makefile
> +++ b/arch/powerpc/platforms/microwatt/Makefile
> @@ -1 +1,2 @@
>  obj-y	+=3D setup.o rng.o
> +obj-$(CONFIG_SMP) +=3D smp.o

Hmm.... `git add arch/powerpc/platforms/microwatt/smp.c` ?

> diff --git a/arch/powerpc/platforms/microwatt/microwatt.h b/arch/powerpc/=
platforms/microwatt/microwatt.h
> index 335417e95e66..891aa2800768 100644
> --- a/arch/powerpc/platforms/microwatt/microwatt.h
> +++ b/arch/powerpc/platforms/microwatt/microwatt.h
> @@ -3,5 +3,6 @@
>  #define _MICROWATT_H
> =20
>  void microwatt_rng_init(void);
> +void microwatt_init_smp(void);
> =20
>  #endif /* _MICROWATT_H */
> diff --git a/arch/powerpc/platforms/microwatt/setup.c b/arch/powerpc/plat=
forms/microwatt/setup.c
> index 97828a99780d..d966bf1f57f7 100644
> --- a/arch/powerpc/platforms/microwatt/setup.c
> +++ b/arch/powerpc/platforms/microwatt/setup.c
> @@ -29,6 +29,15 @@ static int __init microwatt_populate(void)
>  }
>  machine_arch_initcall(microwatt, microwatt_populate);
> =20
> +static int __init microwatt_probe(void)
> +{
> +	/* Main reason for having this is to start the other CPU(s) */
> +#ifdef CONFIG_SMP
> +	microwatt_init_smp();
> +#endif

Could use

	if (IS_ENABLED(CONFIG_SMP))
		microwatt_init_smp();

Thanks,
Nick

> +	return 1;
> +}
> +
>  static void __init microwatt_setup_arch(void)
>  {
>  	microwatt_rng_init();
> @@ -45,6 +54,7 @@ static void microwatt_idle(void)
>  define_machine(microwatt) {
>  	.name			=3D "microwatt",
>  	.compatible		=3D "microwatt-soc",
> +	.probe			=3D microwatt_probe,
>  	.init_IRQ		=3D microwatt_init_IRQ,
>  	.setup_arch		=3D microwatt_setup_arch,
>  	.progress		=3D udbg_progress,


