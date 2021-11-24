Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 589F045C116
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 14:11:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HzhHK1mNvz3cJ9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 00:11:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j68mt/0F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=j68mt/0F; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HzhFp6JXqz2yZd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 00:10:36 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id v19so1811890plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Nov 2021 05:10:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=oVXLRxExfEHr4OD1FpEMSV5bDw9qODnyYnIGDaqvJCI=;
 b=j68mt/0Fh5A5bW4oiDdYaCfbx0jRfbPM+kTA54TfOV5DCKVESKVtGxbsx/B95spubJ
 p8HPDyI0uFYeuZDKeo9toBloBh4QbnZIKbUc6lZEpCPEnzliz52iftTDELxOPcjJwrR0
 hxNsczAR4aCGocas3K+iPhtZtDOS32XZFi6RGR3MKjcvDjojnkDL/MSRuNIOuwceu4fs
 wXREPx44f6CvCJdLaCoQqaibPoQJpl/7hV4EPqgbBURVtvL6/+93sCLBioa+SWkrcWnR
 bDlX2nmxUwdxRZg55XNv072WqVp+3/Ex2Pv+cdoczq0Rz4wroIO/bO4mRgMybNOs0tkI
 sOkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=oVXLRxExfEHr4OD1FpEMSV5bDw9qODnyYnIGDaqvJCI=;
 b=SmqE92cMU+ZXal8KsCr7JWlKsRG54lM1FiVoTNaNBWrbwGo70w+K80gvDSbRkLIVYE
 4sQhWeA5fOnGOZOqq04YZoxYSBea9dhg6+VrZ3UpvBVM1ZhCroQIleYF3sh3n5wy5To6
 Dixpa832ZTVtSeTLQKpnmFKwOabHt2aRimtknWXYh57dSu5iFNb49V4Dd9I2jdqn1yNg
 J+6Pq4IIZ7C0iJSLLzp8WEOdbfDmFQ5JcM51DjVam2CWJICGr2zQyq2ONYBlH9ke+pRc
 a/rEp5FnF+jl2lqgGrTx8kYka2VEuu/bEv7uW+UG2SIGhQFErOGbsFI6qwP4998VmVDZ
 vO9Q==
X-Gm-Message-State: AOAM530V7vDH2RQP6dEosGnGzcCkzuBn1ftTf5lUA28sVMCHfEuXPd3u
 sGZFl4PLgWVn+uHL43WMPXkRHP7rVgw=
X-Google-Smtp-Source: ABdhPJy+HtprqIuT2FzdzqOgNcoALByqV1Uyarb47mCFoiE5c7F1xIRPaOFrSa69KkTnJLmv4pdMsg==
X-Received: by 2002:a17:90a:c506:: with SMTP id
 k6mr8740495pjt.74.1637759433905; 
 Wed, 24 Nov 2021 05:10:33 -0800 (PST)
Received: from localhost ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id g5sm4565389pjt.15.2021.11.24.05.10.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 05:10:33 -0800 (PST)
Date: Wed, 24 Nov 2021 23:10:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 2/2] pseries/mce: Refactor the pseries mce handling code
To: Ganesh Goudar <ganeshgr@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20211124095500.98656-1-ganeshgr@linux.ibm.com>
 <20211124095500.98656-2-ganeshgr@linux.ibm.com>
In-Reply-To: <20211124095500.98656-2-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1637759013.aa9l8cb1io.astroid@bobo.none>
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
Cc: mahesh@linux.ibm.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Ganesh Goudar's message of November 24, 2021 7:55 pm:
> Now that we are no longer switching on the mmu in realmode
> mce handler, Revert the commit 4ff753feab02("powerpc/pseries:
> Avoid using addr_to_pfn in real mode") partially, which
> introduced functions mce_handle_err_virtmode/realmode() to
> separate mce handler code which needed translation to enabled.
>=20
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/ras.c | 122 +++++++++++----------------
>  1 file changed, 49 insertions(+), 73 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platform=
s/pseries/ras.c
> index 8613f9cc5798..62e1519b8355 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -511,58 +511,17 @@ int pSeries_system_reset_exception(struct pt_regs *=
regs)
>  	return 0; /* need to perform reset */
>  }
> =20
> -static int mce_handle_err_realmode(int disposition, u8 error_type)
> -{
> -#ifdef CONFIG_PPC_BOOK3S_64
> -	if (disposition =3D=3D RTAS_DISP_NOT_RECOVERED) {
> -		switch (error_type) {
> -		case	MC_ERROR_TYPE_ERAT:
> -			flush_erat();
> -			disposition =3D RTAS_DISP_FULLY_RECOVERED;
> -			break;
> -		case	MC_ERROR_TYPE_SLB:
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
> -		pr_err("MCE: limited recovery, system may be degraded\n");
> -		disposition =3D RTAS_DISP_FULLY_RECOVERED;
> -	}
> -#endif
> -	return disposition;
> -}
> -
> -static int mce_handle_err_virtmode(struct pt_regs *regs,
> -				   struct rtas_error_log *errp,
> -				   struct pseries_mc_errorlog *mce_log,
> -				   int disposition)
> +static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log =
*errp)
>  {
>  	struct mce_error_info mce_err =3D { 0 };
> +	unsigned long eaddr =3D 0, paddr =3D 0;
> +	struct pseries_errorlog *pseries_log;
> +	struct pseries_mc_errorlog *mce_log;
> +	int disposition =3D rtas_error_disposition(errp);
>  	int initiator =3D rtas_error_initiator(errp);
>  	int severity =3D rtas_error_severity(errp);
> -	unsigned long eaddr =3D 0, paddr =3D 0;
>  	u8 error_type, err_sub_type;
> =20
> -	if (!mce_log)
> -		goto out;
> -
> -	error_type =3D mce_log->error_type;
> -	err_sub_type =3D rtas_mc_error_sub_type(mce_log);
> -
>  	if (initiator =3D=3D RTAS_INITIATOR_UNKNOWN)
>  		mce_err.initiator =3D MCE_INITIATOR_UNKNOWN;
>  	else if (initiator =3D=3D RTAS_INITIATOR_CPU)
> @@ -588,6 +547,8 @@ static int mce_handle_err_virtmode(struct pt_regs *re=
gs,
>  		mce_err.severity =3D MCE_SEV_SEVERE;
>  	else if (severity =3D=3D RTAS_SEVERITY_ERROR)
>  		mce_err.severity =3D MCE_SEV_SEVERE;
> +	else if (severity =3D=3D RTAS_SEVERITY_FATAL)
> +		mce_err.severity =3D MCE_SEV_FATAL;
>  	else
>  		mce_err.severity =3D MCE_SEV_FATAL;
> =20

What's this hunk for?

> @@ -599,7 +560,18 @@ static int mce_handle_err_virtmode(struct pt_regs *r=
egs,
>  	mce_err.error_type =3D MCE_ERROR_TYPE_UNKNOWN;
>  	mce_err.error_class =3D MCE_ECLASS_UNKNOWN;
> =20
> -	switch (error_type) {
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
> +	switch (mce_log->error_type) {
>  	case MC_ERROR_TYPE_UE:
>  		mce_err.error_type =3D MCE_ERROR_TYPE_UE;
>  		mce_common_process_ue(regs, &mce_err);
> @@ -692,41 +664,45 @@ static int mce_handle_err_virtmode(struct pt_regs *=
regs,
>  		mce_err.error_type =3D MCE_ERROR_TYPE_DCACHE;
>  		break;
>  	case MC_ERROR_TYPE_I_CACHE:
> -		mce_err.error_type =3D MCE_ERROR_TYPE_ICACHE;
> +		mce_err.error_type =3D MCE_ERROR_TYPE_DCACHE;
>  		break;

And this one. Doesn't look right.

>  	case MC_ERROR_TYPE_UNKNOWN:
>  	default:
>  		mce_err.error_type =3D MCE_ERROR_TYPE_UNKNOWN;
>  		break;
>  	}
> +
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

I would prefer if you just keep the mce_handle_err_realmode function=20
(can rename it if you want). It's actually changed a bit since the
patch being reverted so we don't want to undo that.

Thanks,
Nick
