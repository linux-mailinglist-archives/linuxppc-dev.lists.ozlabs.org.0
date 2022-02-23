Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 695F54C0FCB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 11:04:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Wps51qLz3cPj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 21:04:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dKjCjNLs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dKjCjNLs; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3WpC6r7Xz2xKT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 21:03:47 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id 195so19450991pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 02:03:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=iPZ0beQ1JXcHX2iZMd9HYE9xPf5EKazyao6fC2n7juk=;
 b=dKjCjNLs+1oeZW2OyR3C8zwt+1jWxOtw3qF93zR1TQWhJK/UtjhlFGL9sl43leJL77
 wC3pNgTCHesfBxfqPX6yZGSaQmahoXYVVvjevXEGioP/achpkDkPxuSULm/INIjCZea9
 jCxJE/9LkgaCj9+e3tahWxJhJLunHp0yGoRDi02eAgjY472bggx6pxLk/beS/inhIHT5
 6yuhlumXsEGVED187ZZHZSluPoibr1E0ABsrA2CtbQoBPvhGtsbR4lJtVchoU0oA23ty
 cm2In7TO84Kjd55kYLGUo0R7+hauW/NzCiQ4MpIGOlgIUJWGRMYJXa0TVczDHGsIVh7g
 q26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=iPZ0beQ1JXcHX2iZMd9HYE9xPf5EKazyao6fC2n7juk=;
 b=ebDozeegKVqXbQpYFbTQLiH83SU618WU1i6MP+LmBHGuLUdFjiCXXxIitYSlkbkqJ/
 Lh/8m2k1nPzntZoYblIT062PGjF6iNHEh1Ygr5ZCtlxyMV90k2ZWjk1zoRJg8BCxCD8h
 RAzrIm4Ym1n3SZjHuTHbKnnjx4xEOewIGQkbcedUQoQGm1XY3+5lx9Gkl6cK7bQKHiZT
 UGfVJReO9PrJk2NtZE8ASxFZmjNALwBrtBLlQXltMlRju8DmBGsnBsNxHWkOsj8a2WrS
 L5v2BL97p1Nm7P4XFHVfUCU9soMdieLEc76n4MSr0lXYCj+wVOEMSWUcyRRNS5WVIBBH
 4WbQ==
X-Gm-Message-State: AOAM532GDSUyb6umpFtV337mOL0e7h0hXX6UyUV9rTjfE3E1GxoayM17
 /2S2VSVlAAsmrESElC5jy7Sy/uziTlM=
X-Google-Smtp-Source: ABdhPJzxxADTbHZrQWLCuii5JMMlQc8RD/fsikXiSvHnCzaD8ohBfE5rje8JBO10pDaYMKSZYhgIgg==
X-Received: by 2002:a63:c112:0:b0:364:12c8:8673 with SMTP id
 w18-20020a63c112000000b0036412c88673mr23117903pgf.576.1645610625306; 
 Wed, 23 Feb 2022 02:03:45 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a17090a7d1500b001b968e82819sm2272676pjl.10.2022.02.23.02.03.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 02:03:45 -0800 (PST)
Date: Wed, 23 Feb 2022 20:03:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 3/4] powerpc/pseries/vas: Add VAS migration handler
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
 <2769e401eaa7bfc165c5e468c35d4e7bf4f6b62e.camel@linux.ibm.com>
In-Reply-To: <2769e401eaa7bfc165c5e468c35d4e7bf4f6b62e.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645610108.s180pzifa4.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 6:06 am:
>=20
> Since the VAS windows belong to the VAS hardware resource, the
> hypervisor expects the partition to close them on source partition
> and reopen them after the partition migrated on the destination
> machine.
>=20
> This handler is called before pseries_suspend() to close these
> windows and again invoked after migration. All active windows
> for both default and QoS types will be closed and mark them
> in-active and reopened after migration with this handler.
> During the migration, the user space receives paste instruction
> failure if it issues copy/paste on these in-active windows.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/mobility.c |  5 ++
>  arch/powerpc/platforms/pseries/vas.c      | 86 +++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/vas.h      |  6 ++
>  3 files changed, 97 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/pla=
tforms/pseries/mobility.c
> index 85033f392c78..70004243e25e 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -26,6 +26,7 @@
>  #include <asm/machdep.h>
>  #include <asm/rtas.h>
>  #include "pseries.h"
> +#include "vas.h"	/* vas_migration_handler() */
>  #include "../../kernel/cacheinfo.h"
> =20
>  static struct kobject *mobility_kobj;
> @@ -669,12 +670,16 @@ static int pseries_migrate_partition(u64 handle)
>  	if (ret)
>  		return ret;
> =20
> +	vas_migration_handler(VAS_SUSPEND);

Not sure if there is much point having a "handler" like this that only
takes two operations. vas_migration_begin()/vas_migration_end() is
better isn't it?

Other question is why can't the suspend handler return error and handle
it here?

> +
>  	ret =3D pseries_suspend(handle);
>  	if (ret =3D=3D 0)
>  		post_mobility_fixup();
>  	else
>  		pseries_cancel_migration(handle, ret);
> =20
> +	vas_migration_handler(VAS_RESUME);
> +
>  	return ret;
>  }
> =20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index fbcf311da0ec..df22827969db 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -869,6 +869,92 @@ static struct notifier_block pseries_vas_nb =3D {
>  	.notifier_call =3D pseries_vas_notifier,
>  };
> =20
> +/*
> + * For LPM, all windows have to be closed on the source partition
> + * before migration and reopen them on the destination partition
> + * after migration. So closing windows during suspend and
> + * reopen them during resume.
> + */
> +int vas_migration_handler(int action)
> +{
> +	struct vas_cop_feat_caps *caps;
> +	int old_nr_creds, new_nr_creds =3D 0;
> +	struct vas_caps *vcaps;
> +	int i, rc =3D 0;
> +
> +	/*
> +	 * NX-GZIP is not enabled. Nothing to do for migration.
> +	 */
> +	if (!copypaste_feat)
> +		return rc;
> +
> +	mutex_lock(&vas_pseries_mutex);
> +
> +	for (i =3D 0; i < VAS_MAX_FEAT_TYPE; i++) {
> +		vcaps =3D &vascaps[i];
> +		caps =3D &vcaps->caps;
> +		old_nr_creds =3D atomic_read(&caps->nr_total_credits);
> +
> +		rc =3D h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
> +					      vcaps->feat,
> +					      (u64)virt_to_phys(&hv_cop_caps));
> +		if (!rc) {
> +			new_nr_creds =3D be16_to_cpu(hv_cop_caps.target_lpar_creds);
> +			/*
> +			 * Should not happen. But incase print messages, close
> +			 * all windows in the list during suspend and reopen
> +			 * windows based on new lpar_creds on the destination
> +			 * system.
> +			 */
> +			if (old_nr_creds !=3D new_nr_creds) {
> +				pr_err("state(%d): lpar creds: %d HV lpar creds: %d\n",
> +					action, old_nr_creds, new_nr_creds);
> +				pr_err("Used creds: %d, Active creds: %d\n",
> +					atomic_read(&caps->nr_used_credits),
> +					vcaps->nr_open_windows - vcaps->nr_close_wins);

Error messages should have some vague use to the administrator even if=20
you don't expect it or they aren't expected to know much.

"VAS NX error during LPM: credit mismatch blah"

Otherwise if it's a Linux or hypervisor bug then make it a WARN_ON, at=20
least then by convention the administrator knows that should be reported
and it's (possibly) non-fatal.

Thanks,
Nick

> +			}
> +		} else {
> +			pr_err("state(%d): Get VAS capabilities failed with %d\n",
> +				action, rc);
> +			/*
> +			 * We can not stop migration with the current lpm
> +			 * implementation. So continue closing all windows in
> +			 * the list (during suspend) and return without
> +			 * opening windows (during resume) if VAS capabilities
> +			 * HCALL failed.
> +			 */
> +			if (action =3D=3D VAS_RESUME)
> +				goto out;
> +		}
> +
> +		switch (action) {
> +		case VAS_SUSPEND:
> +			rc =3D reconfig_close_windows(vcaps, vcaps->nr_open_windows,
> +							true);
> +			break;
> +		case VAS_RESUME:
> +			atomic_set(&caps->nr_total_credits, new_nr_creds);
> +			rc =3D reconfig_open_windows(vcaps, new_nr_creds, true);
> +			break;
> +		default:
> +			/* should not happen */
> +			pr_err("Invalid migration action %d\n", action);
> +			rc =3D -EINVAL;
> +			goto out;
> +		}
> +
> +		/*
> +		 * Ignore errors during suspend and return for resume.
> +		 */
> +		if (rc && (action =3D=3D VAS_RESUME))
> +			goto out;
> +	}
> +
> +out:
> +	mutex_unlock(&vas_pseries_mutex);
> +	return rc;
> +}
> +
>  static int __init pseries_vas_init(void)
>  {
>  	struct hv_vas_all_caps *hv_caps;
> diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platform=
s/pseries/vas.h
> index 4ddb1001a0aa..f7568d8c6ab0 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -33,6 +33,11 @@
>  #define VAS_GZIP_QOS_CAPABILITIES	0x56516F73477A6970
>  #define VAS_GZIP_DEFAULT_CAPABILITIES	0x56446566477A6970
> =20
> +enum vas_migrate_action {
> +	VAS_SUSPEND,
> +	VAS_RESUME,
> +};
> +
>  /*
>   * Co-processor feature - GZIP QoS windows or GZIP default windows
>   */
> @@ -132,4 +137,5 @@ struct pseries_vas_window {
>  int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
>  int vas_reconfig_capabilties(u8 type);
>  int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
> +int vas_migration_handler(int action);
>  #endif /* _VAS_H */
> --=20
> 2.27.0
>=20
>=20
>=20
