Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F18257F86C0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 00:36:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UiE6y+V9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScWbK0dRrz3vc8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 10:36:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UiE6y+V9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScWZR1B0jz3cTX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 10:35:57 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1cfabcbda7bso4846715ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 15:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700868950; x=1701473750; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8rCTuOTZLjqU1EAi1Ot/Eoexb0bjF9zepY/pVrUGWrc=;
        b=UiE6y+V90iIUaJJ/8yOqpMX1zz8SYoNl3MYiG+PSorMa2CYmn9GIth8JEjV8bJyItK
         +3Y06hY5aiUIwiOOSZ8qf2jp4u7APTjNwErM9lH6Zyjiff2ab9WsN+yDi9okW8BWuXY5
         906IwPG9zP9f8OwWmyhE7j3Pf9yZKHPkRytWZ2w5gRpybAQ36B4iJSw7/wG+UNyVM7ub
         10LNOT5VdocHZPFGcsfsk5gjAUe55eSNioBmLRtzZbHtdqNP0EGmh5m4EYQ1qym6SoB+
         WHwil5IKnKwp9q5ofFY3kZICoq5gskX2992NHVqebzYthC//rqpdN/c+2WSG35+Ji/SY
         I2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700868950; x=1701473750;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8rCTuOTZLjqU1EAi1Ot/Eoexb0bjF9zepY/pVrUGWrc=;
        b=cquBCtFm2WmhlxiLEbdavAuDP1/gu2CeNh1gAQUxp2X25dCOi3vVo7sKWCspNmrrO0
         JcpHzag05G9yBDO3bg2p7IQxv2wqbsBS1zdfQiACFeepJdpstqS8tTsiOwo1IkbL3ucT
         qIvYYgFWVKzcJwP3jICaQEj2hZvxbnMRFHrLmfJVzqaDsvrauyv0Jm64EpmsqUOZjEGl
         lZfUQRl70oHqC8ufHXnG1ZmS51zOHmjT7SWn2PvwTxNbmADC2M4HqXqpoFw89ReMA4ol
         5kU+IP+XTawKcc4Pbnf4IROCp0zUsUEMV7+6IpscMkfAbtjqaYnYOD1Y1Y7I/ChXYOSo
         q+Zg==
X-Gm-Message-State: AOJu0YyHjkCe/WYNX+qwsXhxoVnhhgz0B6TImQj25HOVSfZPS/issPYV
	alAr8oJHwxtiKC295Q0EvKE=
X-Google-Smtp-Source: AGHT+IHAQJ2ELJ94l1wPHi56ly0865tGTj4Uqv/dSxGe9cSb6rmoKUkYL5F50RyySSQjayJuQ7H48A==
X-Received: by 2002:a17:902:868c:b0:1ce:b83f:bd0c with SMTP id g12-20020a170902868c00b001ceb83fbd0cmr8557698plo.7.1700868949824;
        Fri, 24 Nov 2023 15:35:49 -0800 (PST)
Received: from localhost (121-44-66-27.tpgi.com.au. [121.44.66.27])
        by smtp.gmail.com with ESMTPSA id gx1-20020a17090b124100b0027e289ac436sm3453860pjb.8.2023.11.24.15.35.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Nov 2023 15:35:49 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Nov 2023 09:35:41 +1000
Message-Id: <CX7FPX15PN0F.W7PEA51B0KD6@wheely>
Subject: Re: [PATCH v1] powerpc: Add PVN support for HeXin C2000 processor
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Zhao Ke" <ke.zhao@shingroup.cn>, <mpe@ellerman.id.au>,
 <christophe.leroy@csgroup.eu>, <fbarrat@linux.ibm.com>,
 <ajd@linux.ibm.com>, <arnd@arndb.de>, <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.15.2
References: <20231123093611.98313-1-ke.zhao@shingroup.cn>
In-Reply-To: <20231123093611.98313-1-ke.zhao@shingroup.cn>
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
Cc: luming.yu@shingroup.cn, kvm@vger.kernel.org, dawei.li@shingroup.cn, linux-kernel@vger.kernel.org, shenghui.qu@shingroup.cn, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Nov 23, 2023 at 7:36 PM AEST, Zhao Ke wrote:
> HeXin Tech Co. has applied for a new PVN from the OpenPower Community
> for its new processor C2000. The OpenPower has assigned a new PVN
> and this newly assigned PVN is 0x0066, add pvr register related
> support for this PVN.
>
> Signed-off-by: Zhao Ke <ke.zhao@shingroup.cn>
> Link: https://discuss.openpower.foundation/t/how-to-get-a-new-pvr-for-pro=
cessors-follow-power-isa/477/10
> ---
> 	v0 -> v1:
> 	- Fix .cpu_name with the correct description
> ---
> ---
>  arch/powerpc/include/asm/reg.h            |  1 +
>  arch/powerpc/kernel/cpu_specs_book3s_64.h | 15 +++++++++++++++
>  arch/powerpc/kvm/book3s_pr.c              |  1 +
>  arch/powerpc/mm/book3s64/pkeys.c          |  3 ++-
>  arch/powerpc/platforms/powernv/subcore.c  |  3 ++-
>  drivers/misc/cxl/cxl.h                    |  3 ++-
>  6 files changed, 23 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/re=
g.h
> index 4ae4ab9090a2..7fd09f25452d 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1361,6 +1361,7 @@
>  #define PVR_POWER8E	0x004B
>  #define PVR_POWER8NVL	0x004C
>  #define PVR_POWER8	0x004D
> +#define PVR_HX_C2000	0x0066
>  #define PVR_POWER9	0x004E
>  #define PVR_POWER10	0x0080
>  #define PVR_BE		0x0070
> diff --git a/arch/powerpc/kernel/cpu_specs_book3s_64.h b/arch/powerpc/ker=
nel/cpu_specs_book3s_64.h
> index c370c1b804a9..367c9f6d9be5 100644
> --- a/arch/powerpc/kernel/cpu_specs_book3s_64.h
> +++ b/arch/powerpc/kernel/cpu_specs_book3s_64.h
> @@ -238,6 +238,21 @@ static struct cpu_spec cpu_specs[] __initdata =3D {
>  		.machine_check_early	=3D __machine_check_early_realmode_p8,
>  		.platform		=3D "power8",
>  	},
> +	{	/* 2.07-compliant processor, HeXin C2000 processor */
> +		.pvr_mask		=3D 0xffffffff,
> +		.pvr_value		=3D 0x00660000,
> +		.cpu_name		=3D "POWER8 (raw)",

If this is a raw mode, it should go with the raw POWER8 entry.
The raw vs architected entries are already out of order with
POWER6, but we should fix that too.

You may want your PVR mask to follow the other raw examples too,
but it depends on how you foresee PVR being used. Using 0xffff0000
allows you to increment the low part of the PVR and existing
kernels will continue to match it. You can then add a specific
match for the older version if you need to add special handling
for it (e.g., see how POWER9 is handled).

Do you want .cpu_name to be "POWER8 (raw)"? You could call it
"HX-C2000", as Michael suggested earlier.

> +		.cpu_features		=3D CPU_FTRS_POWER8,
> +		.cpu_user_features	=3D COMMON_USER_POWER8,
> +		.cpu_user_features2	=3D COMMON_USER2_POWER8,
> +		.mmu_features		=3D MMU_FTRS_POWER8,
> +		.icache_bsize		=3D 128,
> +		.dcache_bsize		=3D 128,
> +		.cpu_setup		=3D __setup_cpu_power8,
> +		.cpu_restore		=3D __restore_cpu_power8,
> +		.machine_check_early	=3D __machine_check_early_realmode_p8,
> +		.platform		=3D "power8",
> +	},
>  	{	/* 3.00-compliant processor, i.e. Power9 "architected" mode */
>  		.pvr_mask		=3D 0xffffffff,
>  		.pvr_value		=3D 0x0f000005,
> diff --git a/arch/powerpc/kvm/book3s_pr.c b/arch/powerpc/kvm/book3s_pr.c
> index 9118242063fb..5b92619a05fd 100644
> --- a/arch/powerpc/kvm/book3s_pr.c
> +++ b/arch/powerpc/kvm/book3s_pr.c
> @@ -604,6 +604,7 @@ static void kvmppc_set_pvr_pr(struct kvm_vcpu *vcpu, =
u32 pvr)
>  	case PVR_POWER8:
>  	case PVR_POWER8E:
>  	case PVR_POWER8NVL:
> +	case PVR_HX_C2000:
>  	case PVR_POWER9:
>  		vcpu->arch.hflags |=3D BOOK3S_HFLAG_MULTI_PGSIZE |
>  			BOOK3S_HFLAG_NEW_TLBIE;
> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/=
pkeys.c
> index 125733962033..c38f378e1942 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -89,7 +89,8 @@ static int __init scan_pkey_feature(void)
>  			unsigned long pvr =3D mfspr(SPRN_PVR);
> =20
>  			if (PVR_VER(pvr) =3D=3D PVR_POWER8 || PVR_VER(pvr) =3D=3D PVR_POWER8E=
 ||
> -			    PVR_VER(pvr) =3D=3D PVR_POWER8NVL || PVR_VER(pvr) =3D=3D PVR_POWE=
R9)
> +			    PVR_VER(pvr) =3D=3D PVR_POWER8NVL || PVR_VER(pvr) =3D=3D PVR_POWE=
R9 ||
> +				PVR_VER(pvr) =3D=3D PVR_HX_C2000)
>  				pkeys_total =3D 32;
>  		}
>  	}
> diff --git a/arch/powerpc/platforms/powernv/subcore.c b/arch/powerpc/plat=
forms/powernv/subcore.c
> index 191424468f10..58e7331e1e7e 100644
> --- a/arch/powerpc/platforms/powernv/subcore.c
> +++ b/arch/powerpc/platforms/powernv/subcore.c
> @@ -425,7 +425,8 @@ static int subcore_init(void)
> =20
>  	if (pvr_ver !=3D PVR_POWER8 &&
>  	    pvr_ver !=3D PVR_POWER8E &&
> -	    pvr_ver !=3D PVR_POWER8NVL)
> +	    pvr_ver !=3D PVR_POWER8NVL &&
> +		pvr_ver !=3D PVR_HX_C2000)
>  		return 0;
> =20
>  	/*
> diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
> index 0562071cdd4a..9ac2991b29c7 100644
> --- a/drivers/misc/cxl/cxl.h
> +++ b/drivers/misc/cxl/cxl.h
> @@ -836,7 +836,8 @@ static inline bool cxl_is_power8(void)
>  {
>  	if ((pvr_version_is(PVR_POWER8E)) ||
>  	    (pvr_version_is(PVR_POWER8NVL)) ||
> -	    (pvr_version_is(PVR_POWER8)))
> +	    (pvr_version_is(PVR_POWER8)) ||
> +		(pvr_version_is(PVR_HX_C2000)))
>  		return true;
>  	return false;
>  }

These should follow the same alignment pattern as the other lines.

Thanks,
Nick

