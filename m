Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E5764227C91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 12:09:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9vTt00b9zDq97
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 20:09:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VWeKQJ3k; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9vSF6Jn4zDqc1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 20:08:29 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id f18so2276462wml.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 03:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=3i1mQ/Zezq9LK6X9U1deAdFDQ4CgwEryGtilTDVv9uw=;
 b=VWeKQJ3kWE70PzDbuE074NHmuY4GFfKAcmqLu7MHEa+dFzAuvdVhqPLmSVlTUchRZ4
 8zo6IDD83ezCfl4hwZuRdRRD3jXBYIsIDW2RdRLWIk4c+gyNqk8MEPWjym2sZvbgPRgJ
 AKvSLMQ5zhI12GwVp8mVpTQ5PjleotYnIOgoY1B10U7YP3pk3SE6kcky+F0d5+n3PcRo
 eS3emqx1Tl2WnyuWawGAz8w2VIEhGUXvpX8rMXCgycSLPl2gdDX0OjGPrlzVgZkJgdVr
 UlyUgrWu8xLCjhrjXhVf6sykXUYddpIQ1G5xLbChfkYfFNgKArzd13cViRIqXHKt7OhV
 zlGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=3i1mQ/Zezq9LK6X9U1deAdFDQ4CgwEryGtilTDVv9uw=;
 b=Z8VgEAeJ7AKhWURORHkaKJ56NFrJWsp/xJBlVXW2myILzd8CPYWIXygyH5ix3HuSqr
 suOhnq54ZM0XqzRGtFvgRG87Fw5pKigN+wWjXchemmXvYTDMoY8AOkBE21UdyI4M/tXL
 yXylyPpdwDXo1bGWLK4aN7O/e3m4LB8sN9xavqjfhW8sZ0ix/hqnyZQsgo+RlyKZ4O0t
 GN4IB/G1j7zo+Osht1P4MKVjxKC/cyfniFwzylmvk3WrAM7PXUw5BmlJJtBkIThWMmvo
 Wul7T3XqYm4GQh0XW+jnNZFK+goUWM9zAncdbSUyI4aAhYxL9FRPDOhr4kTYsdpTYPiP
 WaYg==
X-Gm-Message-State: AOAM530qCBRJs250jeD7znj10bSwagrT+Bu36O32F7MfOR9jRGhdcFd0
 VtCEtwF8gx4wfgmhQZ8po1M=
X-Google-Smtp-Source: ABdhPJx7nLCQGqzBR/9q8xvjNmery1mLlo3HyHhNR7mF+pbeh+L+0ZuebMz+S6Ew5XSZ9ndNZ8ddxw==
X-Received: by 2002:a1c:6246:: with SMTP id w67mr3266078wmb.42.1595326106900; 
 Tue, 21 Jul 2020 03:08:26 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id u186sm2806271wmu.10.2020.07.21.03.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 03:08:26 -0700 (PDT)
Date: Tue, 21 Jul 2020 20:08:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3] powerpc/pseries: Avoid using addr_to_pfn in realmode
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200720080335.21049-1-ganeshgr@linux.ibm.com>
In-Reply-To: <20200720080335.21049-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1595325962.zikec6nkw7.astroid@bobo.none>
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
Cc: aneesh.kumar@linux.ibm.com, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ganesh Goudar's message of July 20, 2020 6:03 pm:
> When an UE or memory error exception is encountered the MCE handler
> tries to find the pfn using addr_to_pfn() which takes effective
> address as an argument, later pfn is used to poison the page where
> memory error occurred, recent rework in this area made addr_to_pfn
> to run in realmode, which can be fatal as it may try to access
> memory outside RMO region.
>=20
> To fix this have separate functions for realmode and virtual mode
> handling and let addr_to_pfn to run in virtual mode.

You didn't really explain what you moved around. You added some
helper functions, but what does it actually do differently now? Can you=20
explain that in the changelog?

Thanks,
Nick

>=20
> Without this fix following kernel crash is seen on hitting UE.
>=20
> [  485.128036] Oops: Kernel access of bad area, sig: 11 [#1]
> [  485.128040] LE SMP NR_CPUS=3D2048 NUMA pSeries
> [  485.128047] Modules linked in:
> [  485.128067] CPU: 15 PID: 6536 Comm: insmod Kdump: loaded Tainted: G OE=
 5.7.0 #22
> [  485.128074] NIP:  c00000000009b24c LR: c0000000000398d8 CTR: c00000000=
0cd57c0
> [  485.128078] REGS: c000000003f1f970 TRAP: 0300   Tainted: G OE (5.7.0)
> [  485.128082] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 28008284  XER: 0=
0000001
> [  485.128088] CFAR: c00000000009b190 DAR: c0000001fab00000 DSISR: 400000=
00 IRQMASK: 1
> [  485.128088] GPR00: 0000000000000001 c000000003f1fbf0 c000000001634300 =
0000b0fa01000000
> [  485.128088] GPR04: d000000002220000 0000000000000000 00000000fab00000 =
0000000000000022
> [  485.128088] GPR08: c0000001fab00000 0000000000000000 c0000001fab00000 =
c000000003f1fc14
> [  485.128088] GPR12: 0000000000000008 c000000003ff5880 d000000002100008 =
0000000000000000
> [  485.128088] GPR16: 000000000000ff20 000000000000fff1 000000000000fff2 =
d0000000021a1100
> [  485.128088] GPR20: d000000002200000 c00000015c893c50 c000000000d49b28 =
c00000015c893c50
> [  485.128088] GPR24: d0000000021a0d08 c0000000014e5da8 d0000000021a0818 =
000000000000000a
> [  485.128088] GPR28: 0000000000000008 000000000000000a c0000000017e2970 =
000000000000000a
> [  485.128125] NIP [c00000000009b24c] __find_linux_pte+0x11c/0x310
> [  485.128130] LR [c0000000000398d8] addr_to_pfn+0x138/0x170
> [  485.128133] Call Trace:
> [  485.128135] Instruction dump:
> [  485.128138] 3929ffff 7d4a3378 7c883c36 7d2907b4 794a1564 7d294038 794a=
f082 3900ffff
> [  485.128144] 79291f24 790af00e 78e70020 7d095214 <7c69502a> 2fa30000 41=
9e011c 70690040
> [  485.128152] ---[ end trace d34b27e29ae0e340 ]---
>=20
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
> V2: Leave bare metal code and save_mce_event as is.
>=20
> V3: Have separate functions for realmode and virtual mode handling.
> ---
>  arch/powerpc/platforms/pseries/ras.c | 119 ++++++++++++++++-----------
>  1 file changed, 70 insertions(+), 49 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platform=
s/pseries/ras.c
> index f3736fcd98fc..32fe3fad86b8 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -522,18 +522,55 @@ int pSeries_system_reset_exception(struct pt_regs *=
regs)
>  	return 0; /* need to perform reset */
>  }
> =20
> +static int mce_handle_err_realmode(int disposition, u8 error_type)
> +{
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (disposition =3D=3D RTAS_DISP_NOT_RECOVERED) {
> +		switch (error_type) {
> +		case	MC_ERROR_TYPE_SLB:
> +		case	MC_ERROR_TYPE_ERAT:
> +			/*
> +			 * Store the old slb content in paca before flushing.
> +			 * Print this when we go to virtual mode.
> +			 * There are chances that we may hit MCE again if there
> +			 * is a parity error on the SLB entry we trying to read
> +			 * for saving. Hence limit the slb saving to single
> +			 * level of recursion.
> +			 */
> +			if (local_paca->in_mce =3D=3D 1)
> +				slb_save_contents(local_paca->mce_faulty_slbs);
> +			flush_and_reload_slb();
> +			disposition =3D RTAS_DISP_FULLY_RECOVERED;
> +			break;
> +		default:
> +			break;
> +		}
> +	} else if (disposition =3D=3D RTAS_DISP_LIMITED_RECOVERY) {
> +		/* Platform corrected itself but could be degraded */
> +		pr_err("MCE: limited recovery, system may be degraded\n");
> +		disposition =3D RTAS_DISP_FULLY_RECOVERED;
> +	}
> +#endif
> +	return disposition;
> +}
> =20
> -static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log =
*errp)
> +static int mce_handle_err_virtmode(struct pt_regs *regs,
> +				   struct rtas_error_log *errp,
> +				   struct pseries_mc_errorlog *mce_log,
> +				   int disposition)
>  {
>  	struct mce_error_info mce_err =3D { 0 };
> -	unsigned long eaddr =3D 0, paddr =3D 0;
> -	struct pseries_errorlog *pseries_log;
> -	struct pseries_mc_errorlog *mce_log;
> -	int disposition =3D rtas_error_disposition(errp);
>  	int initiator =3D rtas_error_initiator(errp);
>  	int severity =3D rtas_error_severity(errp);
> +	unsigned long eaddr =3D 0, paddr =3D 0;
>  	u8 error_type, err_sub_type;
> =20
> +	if (!mce_log)
> +		goto out;
> +
> +	error_type =3D mce_log->error_type;
> +	err_sub_type =3D rtas_mc_error_sub_type(mce_log);
> +
>  	if (initiator =3D=3D RTAS_INITIATOR_UNKNOWN)
>  		mce_err.initiator =3D MCE_INITIATOR_UNKNOWN;
>  	else if (initiator =3D=3D RTAS_INITIATOR_CPU)
> @@ -572,18 +609,7 @@ static int mce_handle_error(struct pt_regs *regs, st=
ruct rtas_error_log *errp)
>  	mce_err.error_type =3D MCE_ERROR_TYPE_UNKNOWN;
>  	mce_err.error_class =3D MCE_ECLASS_UNKNOWN;
> =20
> -	if (!rtas_error_extended(errp))
> -		goto out;
> -
> -	pseries_log =3D get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
> -	if (pseries_log =3D=3D NULL)
> -		goto out;
> -
> -	mce_log =3D (struct pseries_mc_errorlog *)pseries_log->data;
> -	error_type =3D mce_log->error_type;
> -	err_sub_type =3D rtas_mc_error_sub_type(mce_log);
> -
> -	switch (mce_log->error_type) {
> +	switch (error_type) {
>  	case MC_ERROR_TYPE_UE:
>  		mce_err.error_type =3D MCE_ERROR_TYPE_UE;
>  		mce_common_process_ue(regs, &mce_err);
> @@ -683,37 +709,32 @@ static int mce_handle_error(struct pt_regs *regs, s=
truct rtas_error_log *errp)
>  		mce_err.error_type =3D MCE_ERROR_TYPE_UNKNOWN;
>  		break;
>  	}
> +out:
> +	save_mce_event(regs, disposition =3D=3D RTAS_DISP_FULLY_RECOVERED,
> +		       &mce_err, regs->nip, eaddr, paddr);
> +	return disposition;
> +}
> =20
> -#ifdef CONFIG_PPC_BOOK3S_64
> -	if (disposition =3D=3D RTAS_DISP_NOT_RECOVERED) {
> -		switch (error_type) {
> -		case	MC_ERROR_TYPE_SLB:
> -		case	MC_ERROR_TYPE_ERAT:
> -			/*
> -			 * Store the old slb content in paca before flushing.
> -			 * Print this when we go to virtual mode.
> -			 * There are chances that we may hit MCE again if there
> -			 * is a parity error on the SLB entry we trying to read
> -			 * for saving. Hence limit the slb saving to single
> -			 * level of recursion.
> -			 */
> -			if (local_paca->in_mce =3D=3D 1)
> -				slb_save_contents(local_paca->mce_faulty_slbs);
> -			flush_and_reload_slb();
> -			disposition =3D RTAS_DISP_FULLY_RECOVERED;
> -			break;
> -		default:
> -			break;
> -		}
> -	} else if (disposition =3D=3D RTAS_DISP_LIMITED_RECOVERY) {
> -		/* Platform corrected itself but could be degraded */
> -		printk(KERN_ERR "MCE: limited recovery, system may "
> -		       "be degraded\n");
> -		disposition =3D RTAS_DISP_FULLY_RECOVERED;
> -	}
> -#endif
> +static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log =
*errp)
> +{
> +	struct pseries_errorlog *pseries_log;
> +	struct pseries_mc_errorlog *mce_log =3D NULL;
> +	int disposition =3D rtas_error_disposition(errp);
> +	u8 error_type, err_sub_type;
> +
> +	if (!rtas_error_extended(errp))
> +		goto out;
> +
> +	pseries_log =3D get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
> +	if (!pseries_log)
> +		goto out;
> +
> +	mce_log =3D (struct pseries_mc_errorlog *)pseries_log->data;
> +	error_type =3D mce_log->error_type;
> +	err_sub_type =3D rtas_mc_error_sub_type(mce_log);
> +
> +	disposition =3D mce_handle_err_realmode(disposition, error_type);
> =20
> -out:
>  	/*
>  	 * Enable translation as we will be accessing per-cpu variables
>  	 * in save_mce_event() which may fall outside RMO region, also
> @@ -724,10 +745,10 @@ static int mce_handle_error(struct pt_regs *regs, s=
truct rtas_error_log *errp)
>  	 * Note: All the realmode handling like flushing SLB entries for
>  	 *       SLB multihit is done by now.
>  	 */
> +out:
>  	mtmsr(mfmsr() | MSR_IR | MSR_DR);
> -	save_mce_event(regs, disposition =3D=3D RTAS_DISP_FULLY_RECOVERED,
> -			&mce_err, regs->nip, eaddr, paddr);
> -
> +	disposition =3D mce_handle_err_virtmode(regs, errp, mce_log,
> +					      disposition);
>  	return disposition;
>  }
> =20
> --=20
> 2.17.2
>=20
>=20
