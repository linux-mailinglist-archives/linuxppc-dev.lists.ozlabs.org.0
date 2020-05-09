Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FFA1CBEB0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 10:03:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49K07x5LvHzDqnG
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 18:03:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49K06N75RkzDqB4
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 18:02:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NV1PuQy1; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 49K06N6JWhz9C0m
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 18:02:20 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 49K06N5xFWz9sSt; Sat,  9 May 2020 18:02:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NV1PuQy1; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 49K06N54K3z9sSc;
 Sat,  9 May 2020 18:02:20 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id a7so5333315pju.2;
 Sat, 09 May 2020 01:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=hixDxwUSTNOTtNQOL5d4ctxSNzQBZeI63lOSp1Px788=;
 b=NV1PuQy1xoa/paELZrBUy8Ivnnq8EQSP9Vk5FHDGAJ9EMFHFB1+kgJbDIkiZq2Adzz
 Lnc2SotQHeDVzrzbHrM69ycQEUDu3n7ozOzolC8llFVh9cYIR/Z5HjBr1pbBtB1Ksnhe
 XUD6nwVpcBT8N0J7uLeShM6oWpnxL7fHpFZuhTdtwZSrZR1kxR8KD5p8MDITF8ElAKUI
 6ZQOKRg3SSrtsBThrs5fffDNWbYM7IOO4EiRkFCAOfeOCd1B5OeJCTLzH9rISohRSoOM
 4F0JQehh1L2B1DxqskSEtbIwHqO2VG5RAp6OjY0ZTyYT7LDrnc4bPUfnKSZoW+hXjQur
 3w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=hixDxwUSTNOTtNQOL5d4ctxSNzQBZeI63lOSp1Px788=;
 b=ankQAuVnOKFPXT5liDAYy+JtBdpxU4Lx+2LcZAHE+/GhZ/1ymE0N3y7y+PGO347UFm
 kXooQdiYqKQTygyxD4iR82aAHLNZrLKa8czSnYA7J/dPgr8laIUEeB7DivCbs13al0eX
 RCVJl4BdyvVSc0/5+V1+mll0MnyLC2363a9tTuGi+v1bXzs1q6X6hojcJri3l0NpLfWq
 DH8im4UyYOlGAfSVjFAn3M1NMy+psRTVWZ3f1QBpatqMxaAkAyk+xiPXPG+hCHVzqvAW
 5OHEQqxT0r65w9X4I9XobnfMyiwxa3yXLOnrlj8ggtr3R47XLA/HEcvorW7D9lrjYzOS
 9z7A==
X-Gm-Message-State: AGi0Pua8KgFd7EGSJyXlbITNV9REWXFlwdLwl7LG1KYrCH4JtavohJRQ
 Y76SiG8mYRUkSn9ZQ/n9XVU2mNO9
X-Google-Smtp-Source: APiQypJ6YLQCaQfzZRTzC0yv24kOwGmK6H/WfOGhCvOmwDBSDMom/JceeP5khygbmq5HxE48MKjigA==
X-Received: by 2002:a17:90a:eb05:: with SMTP id
 j5mr10519791pjz.86.1589011338039; 
 Sat, 09 May 2020 01:02:18 -0700 (PDT)
Received: from localhost (61-68-214-199.tpgi.com.au. [61.68.214.199])
 by smtp.gmail.com with ESMTPSA id gq6sm4189928pjb.54.2020.05.09.01.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 01:02:17 -0700 (PDT)
Date: Sat, 09 May 2020 18:02:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH RFC 4/4] powerpc/radix: Add support for microwatt's PRTBL
 SPR
To: Anton Blanchard <anton@ozlabs.org>, Benjamin Herrenschmidt
 <benh@ozlabs.org>, linuxppc-dev@ozlabs.org, Michael Neuling
 <mikey@neuling.org>, Paul Mackerras <paulus@ozlabs.org>
References: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
 <20200509050458.GE1464954@thinks.paulus.ozlabs.org>
In-Reply-To: <20200509050458.GE1464954@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1589011153.5kb0ydv2kx.astroid@bobo.none>
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

Excerpts from Paul Mackerras's message of May 9, 2020 3:04 pm:
> Microwatt currently doesn't implement hypervisor mode and therefore
> doesn't implement the partition table.  It does implement the process
> table and radix page table walks.
>=20
> This adds code to write the base address of the process table to the
> PRTBL SPR, which has been assigned SPR 720 for now, as that is in the
> range of SPR numbers assigned for experimental use.  PRTBL is only
> written when we have neither the FW_FEATURE_LPAR feature nor the
> CPU_FTR_HVMODE feature.

What do you think about adding a FW_FEATURE and/or CPU_FTR for
microwatt?

No big deal now, but I'm sure you'll be adding other things.

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
> index 1aa46dff0957..6ea3fc42740d 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -721,6 +721,7 @@
>  #endif
>  #define SPRN_TIR	0x1BE	/* Thread Identification Register */
>  #define SPRN_PTCR	0x1D0	/* Partition table control Register */
> +#define SPRN_PRTBL	0x2D0	/* Process table pointer */
>  #define SPRN_PSPB	0x09F	/* Problem State Priority Boost reg */
>  #define SPRN_PTEHI	0x3D5	/* 981 7450 PTE HI word (S/W TLB load) */
>  #define SPRN_PTELO	0x3D6	/* 982 7450 PTE LO word (S/W TLB load) */
> diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/b=
ook3s64/radix_pgtable.c
> index dd1bea45325c..2e6a376c9d82 100644
> --- a/arch/powerpc/mm/book3s64/radix_pgtable.c
> +++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
> @@ -600,10 +600,15 @@ void __init radix__early_init_mmu(void)
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
> 2.25.3
>=20
>=20
