Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96A834B401E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:09:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxq2V5w5lz3cP3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 14:09:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZA3Hm2X2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZA3Hm2X2; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxq1q5hxxz3089
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 14:09:01 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id i21so25417994pfd.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 19:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=DMHK0KUTDIj8zL2gac2HfTI0mdlrUfMEL8Chb7GxtW0=;
 b=ZA3Hm2X2mJAypbEWOMcBk9tbsBuaQ8pEFr5VRRrNogZ3bhHmQsv6xnrs5Wgqa7do+B
 bz2DFr1aaEsGCLd1YIc4+v3VjFYDY+L/Bxwaz75YjDni3TyNoErlxu/r2QhzflQ/Hg8D
 cK8nqnnBS5hVs6HjX+XaseoMSblo9xtWgiBM/54KFhO/KNfqYAu1sHfOglYAC2CG3WiS
 NBrhGTnoqRjHjcRsKShl50bZmHGvGZCDqVIA1tC29G7A4LaOfVYv787IIslevPO1HHde
 g7wZpcqmnUQfzocfQgIl4od56kXyw2P7VLcDmDk688s0GXXQxW74yhyrF7wzeBvmU7EO
 a+MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=DMHK0KUTDIj8zL2gac2HfTI0mdlrUfMEL8Chb7GxtW0=;
 b=vNF7PxXjRlYpAKCwMEpgBRaUxOZ0jFvPW/jEHj/31mr2liHWibV05ASkCGgB3m9kTE
 rvY3S+eG4QDbfdBZQe6/6IN0/pkAqRT55IRdt9ZC4xkPOY6UqS+6KrbvGhuxJds12OG5
 Ui7rP0prlgujblzKmsWOPCrzEdxR1eFfnD7mFwzd+ZAB1RcVTQlWG/9E6KHEPYagJ10B
 pudBQUnnDZKraver7jnkiCmiRGp/HfBSQ/i9RC4CpBVsy0abqeOftv6ETpqDZzN76+cv
 jIW+bugKPFgrSDPmh1Km/br2O2Yr9JauC+jBu0vv0KeqSUas91DJchSzNKe1xSgnzX49
 tmWg==
X-Gm-Message-State: AOAM533Y3cxLXoT3QlJ1/NEz2qHygutQdq0eUc+LahZFrEPwjmehAq07
 TZZ68dRtByZ3o/RA+J/5+ac=
X-Google-Smtp-Source: ABdhPJwPpF24//dDYUZj7WARbHylevD1mLK4JJ6bONuZGB3SXN4kXaSGu90gWiVcZHZhQSWWU9N7jw==
X-Received: by 2002:a63:d40a:: with SMTP id a10mr10045421pgh.30.1644808139173; 
 Sun, 13 Feb 2022 19:08:59 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id pj14sm2054612pjb.43.2022.02.13.19.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 19:08:58 -0800 (PST)
Date: Mon, 14 Feb 2022 13:08:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 04/10] powerpc/pseries/vas: Reopen windows with DLPAR
 core add
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <623ab91d97fdc6affde8de34e9b0e59ae8dd2d81.camel@linux.ibm.com>
In-Reply-To: <623ab91d97fdc6affde8de34e9b0e59ae8dd2d81.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644806607.n8posebbp0.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of January 22, 2022 5:56 am:
>=20
> VAS windows can be closed in the hypervisor due to lost credits
> when the core is removed. If these credits are available later
> for core add, reopen these windows and set them active. When the
> kernel sees page fault on the paste address, it creates new mapping
> on the new paste address. Then the user space can continue to use
> these windows and send HW compression requests to NX successfully.

Any reason to put this before the close windows patch? It would be
more logical to put it afterwards AFAIKS.

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h          |  16 +++
>  arch/powerpc/platforms/book3s/vas-api.c |   1 +
>  arch/powerpc/platforms/pseries/vas.c    | 144 ++++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/vas.h    |   8 +-
>  4 files changed, 163 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 57573d9c1e09..f1efe86563cc 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -29,6 +29,19 @@
>  #define VAS_THRESH_FIFO_GT_QTR_FULL	2
>  #define VAS_THRESH_FIFO_GT_EIGHTH_FULL	3
> =20
> +/*
> + * VAS window status
> + */
> +#define VAS_WIN_ACTIVE		0x0	/* Used in platform independent */
> +					/* vas mmap() */
> +/* The hypervisor returns these values */
> +#define VAS_WIN_CLOSED		0x00000001
> +#define VAS_WIN_INACTIVE	0x00000002 /* Inactive due to HW failure */
> +#define VAS_WIN_MOD_IN_PROCESS	0x00000003 /* Process of being modified, =
*/

While you're moving these and adding a comment, it would be good to=20
list what hcalls they are relevant to. H_QUERY_VAS_WINDOW (which is not
used anywhere yet?) These are also a 1-byte field, so '0x00', '0x01' etc
would be more appropriate.

> +					   /* deallocated, or quiesced */
> +/* Linux status bits */
> +#define VAS_WIN_NO_CRED_CLOSE	0x00000004 /* Window is closed due to */
> +					   /* lost credit */

This is mixing a user defined bit field with hcall API value field. You
also AFAIKS as yet don't fill in the hypervisor status anywhere.

I would make this it's own field entirely. A boolean would be nice, if
possible.

>  /*
>   * Get/Set bit fields
>   */
> @@ -59,6 +72,8 @@ struct vas_user_win_ref {
>  	struct pid *pid;	/* PID of owner */
>  	struct pid *tgid;	/* Thread group ID of owner */
>  	struct mm_struct *mm;	/* Linux process mm_struct */
> +	struct mutex mmap_mutex;	/* protects paste address mmap() */
> +					/* with DLPAR close/open windows */
>  };
> =20
>  /*
> @@ -67,6 +82,7 @@ struct vas_user_win_ref {
>  struct vas_window {
>  	u32 winid;
>  	u32 wcreds_max;	/* Window credits */
> +	u32 status;
>  	enum vas_cop_type cop;
>  	struct vas_user_win_ref task_ref;
>  	char *dbgname;
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index 4d82c92ddd52..2b0ced611f32 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -316,6 +316,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, un=
signed long arg)
>  		return PTR_ERR(txwin);
>  	}
> =20
> +	mutex_init(&txwin->task_ref.mmap_mutex);
>  	cp_inst->txwin =3D txwin;
> =20
>  	return 0;
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index 2ef56157634f..d9ff73d7704d 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -501,6 +501,7 @@ static int __init get_vas_capabilities(u8 feat, enum =
vas_cop_feat_type type,
>  	memset(vcaps, 0, sizeof(*vcaps));
>  	INIT_LIST_HEAD(&vcaps->list);
> =20
> +	vcaps->feat =3D feat;
>  	caps =3D &vcaps->caps;
> =20
>  	rc =3D h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, feat,
> @@ -539,6 +540,145 @@ static int __init get_vas_capabilities(u8 feat, enu=
m vas_cop_feat_type type,
>  	return 0;
>  }
> =20
> +/*
> + * VAS windows can be closed due to lost credits when the core is
> + * removed. So reopen them if credits are available due to DLPAR
> + * core add and set the window active status. When NX sees the page
> + * fault on the unmapped paste address, the kernel handles the fault
> + * by setting the remapping to new paste address if the window is
> + * active.
> + */
> +static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
> +{
> +	long domain[PLPAR_HCALL9_BUFSIZE] =3D {VAS_DEFAULT_DOMAIN_ID};
> +	struct vas_cop_feat_caps *caps =3D &vcaps->caps;
> +	struct pseries_vas_window *win =3D NULL, *tmp;
> +	int rc, mv_ents =3D 0;
> +
> +	/*
> +	 * Nothing to do if there are no closed windows.
> +	 */
> +	if (!vcaps->close_wins)
> +		return 0;
> +
> +	/*
> +	 * For the core removal, the hypervisor reduces the credits
> +	 * assigned to the LPAR and the kernel closes VAS windows
> +	 * in the hypervisor depends on reduced credits. The kernel
> +	 * uses LIFO (the last windows that are opened will be closed
> +	 * first) and expects to open in the same order when credits
> +	 * are available.
> +	 * For example, 40 windows are closed when the LPAR lost 2 cores
> +	 * (dedicated). If 1 core is added, this LPAR can have 20 more
> +	 * credits. It means the kernel can reopen 20 windows. So move
> +	 * 20 entries in the VAS windows lost and reopen next 20 windows.
> +	 */
> +	if (vcaps->close_wins > creds)
> +		mv_ents =3D vcaps->close_wins - creds;
> +
> +	list_for_each_entry_safe(win, tmp, &vcaps->list, win_list) {
> +		if (!mv_ents)
> +			break;
> +
> +		mv_ents--;
> +	}
> +
> +	list_for_each_entry_safe_from(win, tmp, &vcaps->list, win_list) {
> +		/*
> +		 * Nothing to do on this window if it is not closed
> +		 * with VAS_WIN_NO_CRED_CLOSE
> +		 */
> +		if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE))
> +			continue;
> +
> +		rc =3D allocate_setup_window(win, (u64 *)&domain[0],
> +					   caps->win_type);
> +		if (rc)
> +			return rc;
> +
> +		rc =3D h_modify_vas_window(win);
> +		if (rc)
> +			goto out;
> +
> +		mutex_lock(&win->vas_win.task_ref.mmap_mutex);
> +		/*
> +		 * Set window status to active
> +		 */
> +		win->vas_win.status &=3D ~VAS_WIN_NO_CRED_CLOSE;
> +		mutex_unlock(&win->vas_win.task_ref.mmap_mutex);

What's the mutex protecting? If status can change, what happens if it=20
changed between checking it above and this point?

> +		win->win_type =3D caps->win_type;
> +		if (!--vcaps->close_wins)
> +			break;
> +	}
> +
> +	return 0;
> +out:
> +	/*
> +	 * Window modify HCALL failed. So close the window to the
> +	 * hypervisor and return.
> +	 */
> +	free_irq_setup(win);
> +	h_deallocate_vas_window(win->vas_win.winid);
> +	return rc;
> +}
> +
> +/*
> + * Get new VAS capabilities when the core add/removal configuration
> + * changes. Reconfig window configurations based on the credits
> + * availability from this new capabilities.
> + */
> +static int vas_reconfig_capabilties(u8 type)
> +{
> +	struct hv_vas_cop_feat_caps *hv_caps;
> +	struct vas_cop_feat_caps *caps;
> +	int lpar_creds, new_creds;
> +	struct vas_caps *vcaps;
> +	int rc =3D 0;
> +
> +	if (type >=3D VAS_MAX_FEAT_TYPE) {
> +		pr_err("Invalid credit type %d\n", type);
> +		return -EINVAL;
> +	}
> +
> +	vcaps =3D &vascaps[type];
> +	caps =3D &vcaps->caps;
> +
> +	hv_caps =3D kmalloc(sizeof(*hv_caps), GFP_KERNEL);
> +	if (!hv_caps)
> +		return -ENOMEM;
> +
> +	mutex_lock(&vas_pseries_mutex);
> +	rc =3D h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES, vcaps->feat,
> +				      (u64)virt_to_phys(hv_caps));
> +	if (rc)
> +		goto out;
> +
> +	new_creds =3D be16_to_cpu(hv_caps->target_lpar_creds);
> +
> +	lpar_creds =3D atomic_read(&caps->target_creds);

NBD but it would be slightly clearer that new_creds is the absolute=20
value not the number of new credits if you call these two
new_nr_creds and old_nr_creds or prev_nr_creds.

> +
> +	atomic_set(&caps->target_creds, new_creds);
> +	/*
> +	 * The total number of available credits may be decreased or
> +	 * inceased with DLPAR operation. Means some windows have to be
> +	 * closed / reopened. Hold the vas_pseries_mutex so that the
> +	 * the user space can not open new windows.
> +	 */
> +	if (lpar_creds <  new_creds) {
> +		/*
> +		 * If the existing target credits is less than the new
> +		 * target, reopen windows if they are closed due to
> +		 * the previous DLPAR (core removal).
> +		 */
> +		rc =3D reconfig_open_windows(vcaps, new_creds - lpar_creds);
> +	}
> +
> +out:
> +	mutex_unlock(&vas_pseries_mutex);
> +	kfree(hv_caps);
> +	return rc;
> +}
> +
>  /*
>   * Total number of default credits available (target_credits)
>   * in LPAR depends on number of cores configured. It varies based on
> @@ -565,6 +705,10 @@ static int pseries_vas_notifier(struct notifier_bloc=
k *nb,
>  	if (!intserv)
>  		return NOTIFY_OK;
> =20
> +	rc =3D vas_reconfig_capabilties(VAS_GZIP_DEF_FEAT_TYPE);
> +	if (rc)
> +		pr_err("Failed reconfig VAS capabilities with DLPAR\n");
> +
>  	return rc;
>  }
> =20
> diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platform=
s/pseries/vas.h
> index 0538760d13be..45b62565955b 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -21,12 +21,6 @@
>  #define VAS_MOD_WIN_FLAGS	(VAS_MOD_WIN_JOBS_KILL | VAS_MOD_WIN_DR | \
>  				VAS_MOD_WIN_PR | VAS_MOD_WIN_SF)
> =20
> -#define VAS_WIN_ACTIVE		0x0
> -#define VAS_WIN_CLOSED		0x1
> -#define VAS_WIN_INACTIVE	0x2	/* Inactive due to HW failure */
> -/* Process of being modified, deallocated, or quiesced */
> -#define VAS_WIN_MOD_IN_PROCESS	0x3
> -
>  #define VAS_COPY_PASTE_USER_MODE	0x00000001
>  #define VAS_COP_OP_USER_MODE		0x00000010
> =20
> @@ -84,6 +78,8 @@ struct vas_cop_feat_caps {
>  struct vas_caps {
>  	struct vas_cop_feat_caps caps;
>  	struct list_head list;	/* List of open windows */
> +	int close_wins;		/* closed windows in the hypervisor for DLPAR */

'nr_closed_wins'

This does not look like a capability. Although I guess neither do some
of the fields (used_creds) in vas_cop_feat_caps. Why not at least put
this there with the rest of those credits fields?

Thanks,
Nick

> +	u8 feat;		/* Feature type */
>  };
> =20
>  /*
> --=20
> 2.27.0
>=20
>=20
>=20
