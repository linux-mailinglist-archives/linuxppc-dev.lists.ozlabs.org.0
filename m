Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF563A733D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 03:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3r0S5zBtz30Dl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 11:12:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CjBjOapB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=srs0=3lgx=lj=gmail.com=npiggin@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CjBjOapB; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3r0201Z9z2ysk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:12:33 +1000 (AEST)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by ozlabs.org (Postfix) with ESMTP id 4G3qzz0SXGz9sWF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 11:12:31 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G3qzy70tXz9sWD; Tue, 15 Jun 2021 11:12:30 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CjBjOapB; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4G3qzy65BSz9sW8;
 Tue, 15 Jun 2021 11:12:29 +1000 (AEST)
Received: by mail-pj1-x102a.google.com with SMTP id g24so10797505pji.4;
 Mon, 14 Jun 2021 18:12:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=LuhbSAr440UsIbfvV63fzcbedLHUwic6y1cGovGQYKw=;
 b=CjBjOapBR2QwmD9lM+iE8qQ812SrCuKTRhQdqdRXV6G/AoJ+A7MDWxgdDbF97zTL5A
 tVAVn7JQ5m+lwtwtmhy50F0BknXbYQ9wCGeKrRaMLSHUy0GbhkHps5mitO0Vg74KaaJH
 UFzLCntf5aFliYm4vQYdp+1cFoiJ0FBr6uidPWAVCnxSbexrrhII00nEf7UzmKvxnIex
 DJZ+drmq9koRkXyomMWmeehXF8Z3pSu3yfYKf91FHyEhN4uaR7umVxhqIlmaIFr6KWdo
 qWdbb62UDsD/2SUf0hwQ2Yq8h6Xy3ySz/YCIuXrED0YgkKhCRh+4ajhiECnINefOxMjH
 Jl1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=LuhbSAr440UsIbfvV63fzcbedLHUwic6y1cGovGQYKw=;
 b=qzRqkXxTQukVG85wowYKXIzLYyFPgMjSc9zHAJDzHpL+dLuyoVnDMuUXTgidl3zzHX
 UFBb1e9hViC/2FpkR7bOckI5EIRUA4xh/22QzEh2BCsloEfUPEPvKtNq4Gi3i0f1XlfX
 byqxKpDtGZCGdbAA+ycERpzwlTuvrgGHC+8VFIWiEwy9ETuVrIsc+RBxfb8pBAbDfeEv
 xiaPIBK/xZHW/1Wj0Ew/HoC1D6KA3xeaJ7M4dIdgNCx4dp1b7CBZZW5Eg69F/VUq6X16
 Tj3REeykL1VEK4B9ji6InhiFkoFminlsM80Oei8moPsaIBnscbEd/+FFXwXCYuQskL02
 WR3A==
X-Gm-Message-State: AOAM530zjimWRpoL0Nzp4PMgDAgZSG2aT5aPoPGyNWu+4E8a8VehSMRN
 d3F7iQd4+UKl0cCiZhVBdmNrn34xzbw=
X-Google-Smtp-Source: ABdhPJxm+VpQMJmeGvq/1spcHPk/BAv0jwxK2yC/gUlhqeCLyU/t2dXW/na5Zh49+4AOonMm8xWMRg==
X-Received: by 2002:a17:902:f203:b029:107:d4cb:f840 with SMTP id
 m3-20020a170902f203b0290107d4cbf840mr1534823plc.41.1623719546001; 
 Mon, 14 Jun 2021 18:12:26 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id p14sm14757925pgb.2.2021.06.14.18.12.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Jun 2021 18:12:25 -0700 (PDT)
Date: Tue, 15 Jun 2021 11:12:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 03/11] powerpc/radix: Add support for microwatt's PRTBL SPR
To: linuxppc-dev@ozlabs.org, Paul Mackerras <paulus@ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMffP+s93uYSaU3J@thinks.paulus.ozlabs.org>
In-Reply-To: <YMffP+s93uYSaU3J@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1623719194.0n4wcgijzy.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 15, 2021 8:59 am:
> Microwatt currently doesn't implement hypervisor mode and therefore
> doesn't implement the partition table.  It does implement the process
> table and radix page table walks.
>=20
> This adds code to write the base address of the process table to the
> PRTBL SPR,

Is there a particular reason you haven't called it PRTCR or similar to=20
match PTCR?

> which has been assigned SPR 720 for now, as that is in the
> range of SPR numbers assigned for experimental use.  PRTBL is only
> written when we have neither the FW_FEATURE_LPAR feature nor the
> CPU_FTR_HVMODE feature.

Seems like reasonable architecture for a non-HV platform.

Could it have a comment to say it's not architected, and a microwatt
ifdef until that changes?

The patch also does avoid touching LPCR or initing amor...

Thanks,
Nick

>=20
> Signed-off-by: Paul Mackerras <paulus@ozlabs.org>
> ---
>  arch/powerpc/include/asm/reg.h           |  1 +
>  arch/powerpc/mm/book3s64/radix_pgtable.c | 13 +++++++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index da103e92c112..3200a2522d6c 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -729,6 +729,7 @@
>  #endif
>  #define SPRN_TIR	0x1BE	/* Thread Identification Register */
>  #define SPRN_PTCR	0x1D0	/* Partition table control Register */
> +#define SPRN_PRTBL	0x2D0	/* Process table pointer */
>  #define SPRN_PSPB	0x09F	/* Problem State Priority Boost reg */
>  #define SPRN_PTEHI	0x3D5	/* 981 7450 PTE HI word (S/W TLB load) */
>  #define SPRN_PTELO	0x3D6	/* 982 7450 PTE LO word (S/W TLB load) */
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/b=
ook3s64/radix_pgtable.c
> index 98f0b243c1ab..6595859173a7 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -646,10 +646,15 @@ void __init radix__early_init_mmu(void)
>  	radix_init_pgtable();
> =20
>  	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
> -		lpcr =3D mfspr(SPRN_LPCR);
> -		mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
> -		radix_init_partition_table();
> -		radix_init_amor();
> +		if (cpu_has_feature(CPU_FTR_HVMODE)) {
> +			lpcr =3D mfspr(SPRN_LPCR);
> +			mtspr(SPRN_LPCR, lpcr | LPCR_UPRT | LPCR_HR);
> +			radix_init_partition_table();
> +			radix_init_amor();
> +		} else {
> +			mtspr(SPRN_PRTBL, (__pa(process_tb) |
> +					   (PRTB_SIZE_SHIFT - 12)));
> +		}
>  	} else {
>  		radix_init_pseries();
>  	}
> --=20
> 2.31.1
>=20
>=20
