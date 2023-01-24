Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A056F678F35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 05:17:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1DFw40hpz3cFt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 15:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=prWn9Ruf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=prWn9Ruf;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1DF053R5z30RT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 15:16:35 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id m3-20020a17090a414300b00229ef93c5b0so12201098pjg.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jan 2023 20:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1urGv0mHJ7YJYJNJOzM1m8Twx0srW6ZZUopL2pa7yvk=;
        b=prWn9RufzbUdIxdrCBTqxlvlDhB2nZTXXo9FuZLk4bJa65H6zYekYGRzNiJNrKfZg3
         UgcSiCo/D69OjJEYuwoEmgNLA/VYs7dl9gumw8ynQnWf651mpvbumodhdQt7UhERqwM3
         fdM9/jmZ84IoEds5rX0kzv4rhs/lb8m3RV1uZZvoj+dqRJ/3eiEBUk71T+MmMCtFvCmG
         3VCkyxjbVOQtfwTXVRiXK1+x2JYWpNPqugwwyEMBPdfk0M+zTNMYCAnP8ujfNu9IC+om
         KP67nyALTqSNFyHPgM/Ik2eE3iXITmzFBuLiLAUWanZlt/st1Wf0K3YKnS0pcvk0yQ10
         9SAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1urGv0mHJ7YJYJNJOzM1m8Twx0srW6ZZUopL2pa7yvk=;
        b=Jf6Iu9HOk+A1aqvaI1kuAr2Rd1Ro04mCvl6fsQWgSmm4NocoscflQTgHwpD1uLs3n5
         6jw+g63tl0AmpzgIlODdZVbLq5gbsFv+q/NAZGcWGOICh044eWzchb1di/jOWpS+E4J6
         cCuX+h4ja4twFrl7+1g5qmIKRP0Qmi/AU+rS5YKoSf9YuXatQ1donM1t9i3I9Jh82Vbh
         4CYZc2gmySrfkdX43/lc6PPoIm6nTJEKXqPtNCP6O4SSlslm1w5ckQojWzPLOBY+4bYG
         5s3w1hhvs8MDd1oF0YIAAH8TbqulANvE/oM9Vp7bAZc5RzSIg3n6so6ngDmRsJj5vQel
         Tv5g==
X-Gm-Message-State: AFqh2kqBiAvOBsfIBdwpAV7nhpKCwNz3gdjlvXSECFKC7XyQC+xDiQPU
	DHyTIMb/7ziMQ1IMzzk+2nE=
X-Google-Smtp-Source: AMrXdXuSVtrTllW9RCM77BotoTrsr7sGbJ91c+Msy2yWlokuP6tycoBTZ9CnrNQiDLj02Dfj8ugNzg==
X-Received: by 2002:a05:6a20:4c8a:b0:b8:8e17:901c with SMTP id fq10-20020a056a204c8a00b000b88e17901cmr24234111pzb.52.1674533792376;
        Mon, 23 Jan 2023 20:16:32 -0800 (PST)
Received: from localhost (121-44-64-35.tpgi.com.au. [121.44.64.35])
        by smtp.gmail.com with ESMTPSA id b20-20020a170902d31400b0019603cb63d4sm487043plc.280.2023.01.23.20.16.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 20:16:31 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Jan 2023 14:16:24 +1000
Message-Id: <CQ04OOT6CW1A.MCLZN2B4BTWK@bobo>
Subject: Re: [PATCH v4 16/24] powerpc/pseries: Implement signed update for
 PLPKS objects
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Donnellan" <ajd@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-integrity@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
 <20230120074306.1326298-17-ajd@linux.ibm.com>
In-Reply-To: <20230120074306.1326298-17-ajd@linux.ibm.com>
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
Cc: gjoyce@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, sudhakar@linux.ibm.com, ruscur@russell.cc, joel@jms.id.au, bgray@linux.ibm.com, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jan 20, 2023 at 5:42 PM AEST, Andrew Donnellan wrote:
> From: Nayna Jain <nayna@linux.ibm.com>
>
> The Platform Keystore provides a signed update interface which can be use=
d
> to create, replace or append to certain variables in the PKS in a secure
> fashion, with the hypervisor requiring that the update be signed using th=
e
> Platform Key.
>
> Implement an interface to the H_PKS_SIGNED_UPDATE hcall in the plpks
> driver to allow signed updates to PKS objects.
>
> (The plpks driver doesn't need to do any cryptography or otherwise handle
> the actual signed variable contents - that will be handled by userspace
> tooling.)
>
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>
> [ajd: split patch, add timeout handling and misc cleanups]
> Co-developed-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
>
> ---
>
> v3: Merge plpks fixes and signed update series with secvar series
>
>     Fix error code handling in plpks_confirm_object_flushed() (ruscur)
>
>     Pass plpks_var struct to plpks_signed_update_var() by reference (mpe)
>
>     Consistent constant naming scheme (ruscur)
>
> v4: Fix MAX_HCALL_OPCODE rebasing issue (npiggin)
> ---
>  arch/powerpc/include/asm/hvcall.h      |  1 +
>  arch/powerpc/include/asm/plpks.h       |  5 ++
>  arch/powerpc/platforms/pseries/plpks.c | 71 ++++++++++++++++++++++++--
>  3 files changed, 72 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm=
/hvcall.h
> index 95fd7f9485d5..c099780385dd 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -335,6 +335,7 @@
>  #define H_RPT_INVALIDATE	0x448
>  #define H_SCM_FLUSH		0x44C
>  #define H_GET_ENERGY_SCALE_INFO	0x450
> +#define H_PKS_SIGNED_UPDATE	0x454
>  #define H_WATCHDOG		0x45C
>  #define MAX_HCALL_OPCODE	H_WATCHDOG
> =20
> diff --git a/arch/powerpc/include/asm/plpks.h b/arch/powerpc/include/asm/=
plpks.h
> index 7c5f51a9af7c..e7204e6c0ca4 100644
> --- a/arch/powerpc/include/asm/plpks.h
> +++ b/arch/powerpc/include/asm/plpks.h
> @@ -68,6 +68,11 @@ struct plpks_var_name_list {
>  	struct plpks_var_name varlist[];
>  };
> =20
> +/**
> + * Updates the authenticated variable. It expects NULL as the component.
> + */
> +int plpks_signed_update_var(struct plpks_var *var, u64 flags);
> +
>  /**
>   * Writes the specified var and its data to PKS.
>   * Any caller of PKS driver should present a valid component type for
> diff --git a/arch/powerpc/platforms/pseries/plpks.c b/arch/powerpc/platfo=
rms/pseries/plpks.c
> index 1189246b03dc..796ed5544ee5 100644
> --- a/arch/powerpc/platforms/pseries/plpks.c
> +++ b/arch/powerpc/platforms/pseries/plpks.c
> @@ -81,6 +81,12 @@ static int pseries_status_to_err(int rc)
>  		err =3D -ENOENT;
>  		break;
>  	case H_BUSY:
> +	case H_LONG_BUSY_ORDER_1_MSEC:
> +	case H_LONG_BUSY_ORDER_10_MSEC:
> +	case H_LONG_BUSY_ORDER_100_MSEC:
> +	case H_LONG_BUSY_ORDER_1_SEC:
> +	case H_LONG_BUSY_ORDER_10_SEC:
> +	case H_LONG_BUSY_ORDER_100_SEC:
>  		err =3D -EBUSY;
>  		break;
>  	case H_AUTHORITY:

This is a bit sad to maintain here. It's duplicating bits with
hvcs_convert, and a bunch of open coded places. Probably not the
series to do anything about. Would be nice if we could standardise
it though.

> @@ -184,14 +190,17 @@ static struct label *construct_label(char *componen=
t, u8 varos, u8 *name,
>  				     u16 namelen)
>  {
>  	struct label *label;
> -	size_t slen;
> +	size_t slen =3D 0;
> =20
>  	if (!name || namelen > PLPKS_MAX_NAME_SIZE)
>  		return ERR_PTR(-EINVAL);
> =20
> -	slen =3D strlen(component);
> -	if (component && slen > sizeof(label->attr.prefix))
> -		return ERR_PTR(-EINVAL);
> +	// Support NULL component for signed updates
> +	if (component) {
> +		slen =3D strlen(component);
> +		if (slen > sizeof(label->attr.prefix))
> +			return ERR_PTR(-EINVAL);
> +	}

Is this already a bug? Code checks for component !=3D NULL but previously
calls strlen which would oops on NULL component AFAIKS. Granted nothing
is actually using any of this these days.

It already seems like it's supposed to be allowed to rad NULL component
with read_var though? Why the differences, why not always allow NULL
component? (I assume there is some reason, I just don't know anything
about secvar or secure boot).

> =20
>  	// The label structure must not cross a page boundary, so we align to t=
he next power of 2
>  	label =3D kzalloc(roundup_pow_of_two(sizeof(*label)), GFP_KERNEL);
> @@ -397,6 +406,58 @@ static int plpks_confirm_object_flushed(struct label=
 *label,
>  	return pseries_status_to_err(rc);
>  }
> =20
> +int plpks_signed_update_var(struct plpks_var *var, u64 flags)
> +{
> +	unsigned long retbuf[PLPAR_HCALL9_BUFSIZE] =3D {0};
> +	int rc;
> +	struct label *label;
> +	struct plpks_auth *auth;
> +	u64 continuetoken =3D 0;
> +	u64 timeout =3D 0;
> +
> +	if (!var->data || var->datalen <=3D 0 || var->namelen > PLPKS_MAX_NAME_=
SIZE)
> +		return -EINVAL;
> +
> +	if (!(var->policy & PLPKS_SIGNEDUPDATE))
> +		return -EINVAL;
> +
> +	auth =3D construct_auth(PLPKS_OS_OWNER);
> +	if (IS_ERR(auth))
> +		return PTR_ERR(auth);
> +
> +	label =3D construct_label(var->component, var->os, var->name, var->name=
len);
> +	if (IS_ERR(label)) {
> +		rc =3D PTR_ERR(label);
> +		goto out;
> +	}
> +
> +	do {
> +		rc =3D plpar_hcall9(H_PKS_SIGNED_UPDATE, retbuf,
> +				  virt_to_phys(auth), virt_to_phys(label),
> +				  label->size, var->policy, flags,
> +				  virt_to_phys(var->data), var->datalen,
> +				  continuetoken);
> +
> +		continuetoken =3D retbuf[0];
> +		if (pseries_status_to_err(rc) =3D=3D -EBUSY) {
> +			int delay_ms =3D get_longbusy_msecs(rc);
> +			mdelay(delay_ms);
> +			timeout +=3D delay_ms;
> +		}
> +		rc =3D pseries_status_to_err(rc);
> +	} while (rc =3D=3D -EBUSY && timeout < PLPKS_MAX_TIMEOUT);
> +
> +	if (!rc)
> +		rc =3D plpks_confirm_object_flushed(label, auth);
> +
> +	kfree(label);
> +out:
> +	kfree(auth);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL(plpks_signed_update_var);

Sorry I missed it before -- can this be a _GPL export?

Thanks,
Nick
