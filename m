Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B88FC26AA0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Sep 2020 18:46:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrTdJ0KgXzDqLt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 02:46:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BrTb75Z67zDqQ4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 02:44:15 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BrTZx101cz9v0J7;
 Tue, 15 Sep 2020 18:44:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id zHdRjFjT5igo; Tue, 15 Sep 2020 18:44:09 +0200 (CEST)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BrTZx02WCz9tyY2;
 Tue, 15 Sep 2020 18:44:09 +0200 (CEST)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id A166E8A6; Tue, 15 Sep 2020 18:46:07 +0200 (CEST)
Received: from 37-167-83-250.coucou-networks.fr
 (37-167-83-250.coucou-networks.fr [37.167.83.250]) by messagerie.si.c-s.fr
 (Horde Framework) with HTTP; Tue, 15 Sep 2020 18:46:07 +0200
Date: Tue, 15 Sep 2020 18:46:07 +0200
Message-ID: <20200915184607.Horde._j-BRtSmJ6vRGSRwLWoN7Q2@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: =?utf-8?b?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH v2 2/7] powerpc/prom: Introduce early_reserve_mem_old()
References: <20200914211007.2285999-1-clg@kaod.org>
 <20200914211007.2285999-3-clg@kaod.org>
In-Reply-To: <20200914211007.2285999-3-clg@kaod.org>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

C=C3=A9dric Le Goater <clg@kaod.org> a =C3=A9crit=C2=A0:

> and condition its call with IS_ENABLED(CONFIG_PPC32). This fixes a
> compile error with W=3D1.
>
> arch/powerpc/kernel/prom.c: In function =E2=80=98early_reserve_mem=E2=80=
=99:
> arch/powerpc/kernel/prom.c:625:10: error: variable =E2=80=98reserve_map=
=E2=80=99 set=20=20
>=20but not used [-Werror=3Dunused-but-set-variable]
>   __be64 *reserve_map;
>           ^~~~~~~~~~~
> cc1: all warnings being treated as errors
>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>

@csgroup.eu instead of @c-s.fr please

> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/kernel/prom.c | 37 ++++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)

That's a lot of changes for a tiny warning.

You could make it easy by just replacing the #ifdef by:

         if (!IS_ENABLED(CONFIG_PPC32))
                 return;

>
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index d8a2fb87ba0c..c958b67cf1a5 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -620,27 +620,14 @@ static void __init early_reserve_mem_dt(void)
>  	}
>  }
>
> -static void __init early_reserve_mem(void)
> +static void __init early_reserve_mem_old(void)

Why _old ? Do you mean ppc32 are old ? Modern ADSL boxes like for=20=20
instance=20the famous French freebox have powerpc32 microcontroller.
Eventually you could name it _ppc32, but I don't think that's the good=20=
=20
way,=20see above.

Christophe

>  {
>  	__be64 *reserve_map;
>
>  	reserve_map =3D (__be64 *)(((unsigned long)initial_boot_params) +
>  			fdt_off_mem_rsvmap(initial_boot_params));
>
> -	/* Look for the new "reserved-regions" property in the DT */
> -	early_reserve_mem_dt();
> -
> -#ifdef CONFIG_BLK_DEV_INITRD
> -	/* Then reserve the initrd, if any */
> -	if (initrd_start && (initrd_end > initrd_start)) {
> -		memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
> -			ALIGN(initrd_end, PAGE_SIZE) -
> -			ALIGN_DOWN(initrd_start, PAGE_SIZE));
> -	}
> -#endif /* CONFIG_BLK_DEV_INITRD */
> -
> -#ifdef CONFIG_PPC32
> -	/*
> +	/*
>  	 * Handle the case where we might be booting from an old kexec
>  	 * image that setup the mem_rsvmap as pairs of 32-bit values
>  	 */
> @@ -658,9 +645,25 @@ static void __init early_reserve_mem(void)
>  			DBG("reserving: %x -> %x\n", base_32, size_32);
>  			memblock_reserve(base_32, size_32);
>  		}
> -		return;
>  	}
> -#endif
> +}
> +
> +static void __init early_reserve_mem(void)
> +{
> +	/* Look for the new "reserved-regions" property in the DT */
> +	early_reserve_mem_dt();
> +
> +#ifdef CONFIG_BLK_DEV_INITRD
> +	/* Then reserve the initrd, if any */
> +	if (initrd_start && (initrd_end > initrd_start)) {
> +		memblock_reserve(ALIGN_DOWN(__pa(initrd_start), PAGE_SIZE),
> +			ALIGN(initrd_end, PAGE_SIZE) -
> +			ALIGN_DOWN(initrd_start, PAGE_SIZE));
> +	}
> +#endif /* CONFIG_BLK_DEV_INITRD */
> +
> +	if (IS_ENABLED(CONFIG_PPC32))
> +		early_reserve_mem_old();
>  }
>
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> --
> 2.25.4


