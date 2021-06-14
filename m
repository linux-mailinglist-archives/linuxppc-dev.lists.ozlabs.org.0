Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF7E3A5BBB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 04:56:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3GLS2HK7z308y
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Jun 2021 12:56:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PSySaHBw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52c;
 helo=mail-pg1-x52c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PSySaHBw; dkim-atps=neutral
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com
 [IPv6:2607:f8b0:4864:20::52c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3GKv4kl7z2xv8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Jun 2021 12:56:02 +1000 (AEST)
Received: by mail-pg1-x52c.google.com with SMTP id t9so7486178pgn.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Jun 2021 19:56:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=27YWm6xE21DWZZHAPAIeizbyLM9Bqjjw5LVmLjzIXvk=;
 b=PSySaHBwXGM9HoEr+eaxQP8kSXGA7FdRWx/WI51aJEkavccOEPeSqfNEf6qN1De/lM
 aPiqg0fduF1GdprgR+e5l+otTfh43KGC2MVE1yF1xxMElWXTxPCezrhqYmCdslpYBbVF
 gYoHoN7m1EXYFajl1S3O74Qfv6ur36bhEwv5tjoRgi3+kWJcuP6zUmyjFkeDBYi6YFSQ
 wqgZXLFAsjw+3hgKe7GQRTpQRE1Io48PW9ARZpVWBpG4BYA9bCaN948RVS0woBAWYxt/
 Rdzow4kV/2jwQr84TdWeVVf9dS2uHLO/wbyN/1z8zNU5fG0HiQgXPqRHfNG1cA/slxpw
 F7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=27YWm6xE21DWZZHAPAIeizbyLM9Bqjjw5LVmLjzIXvk=;
 b=IVa1+PK53hU3RHHA5aTItTH2wm9kqbD5mX6FFQsJ0waXAEcgYNqZWwMSBauojkj3VS
 0lPOz5WZXfD7MURMnk87QRCxYF/rJaGdlKF6cu+n7NYN6vndZfCT41lfj659NjWIdJTH
 Nc470iB/bJlG0XsSCwZwTOhknnuKyLX24Lq0TKSCu0BW6sBIrLTmqg8j/iZFUEI8P2uN
 EFj20eQy8GtcEikQLncUqEAHSIg3LzJzNuS1hLjvH27S+lU97HVTfmTUqF74PJ+66D66
 bioAXzDsv319VJSzd9c1Mgtp0/RwKL+1Ako99JmqBO4brF1ofqoAfosC+HbuoTivvJwT
 KhaA==
X-Gm-Message-State: AOAM532uEehTxycNOHbWMkoRbsSzXhT7FetRlfqqR9Qj1WLqKAbZ1JHZ
 zQe1iBvyHfaBch3OTJtDgRs=
X-Google-Smtp-Source: ABdhPJzIujYGkWnMDL6fYmYuCKjgx6G+AipAQENEO5dhnpR+rv2+2J5aYZpZoON1MJfeLpF1ImqFiA==
X-Received: by 2002:aa7:96d0:0:b029:2e9:fea1:c9c1 with SMTP id
 h16-20020aa796d00000b02902e9fea1c9c1mr19287982pfq.67.1623639358745; 
 Sun, 13 Jun 2021 19:55:58 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id ep6sm15293135pjb.24.2021.06.13.19.55.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Jun 2021 19:55:58 -0700 (PDT)
Date: Mon, 14 Jun 2021 12:55:53 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 12/17] powerpc/pseries/vas: Integrate API with
 open/close windows
To: Haren Myneni <haren@linux.ibm.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <58c2f9debeff2ff6515ea950ebdd6483c147c843.camel@linux.ibm.com>
In-Reply-To: <58c2f9debeff2ff6515ea950ebdd6483c147c843.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1623638159.6pp87imz6a.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of June 13, 2021 9:02 pm:
>=20
> This patch adds VAS window allocatioa/close with the corresponding
> hcalls. Also changes to integrate with the existing user space VAS
> API and provide register/unregister functions to NX pseries driver.
>=20
> The driver register function is used to create the user space
> interface (/dev/crypto/nx-gzip) and unregister to remove this entry.
>=20
> The user space process opens this device node and makes an ioctl
> to allocate VAS window. The close interface is used to deallocate
> window.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h          |   4 +
>  arch/powerpc/platforms/pseries/Makefile |   1 +
>  arch/powerpc/platforms/pseries/vas.c    | 223 ++++++++++++++++++++++++
>  3 files changed, 228 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index eefc758d8cd4..9d5646d721c4 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -254,6 +254,10 @@ struct vas_all_caps {
>  	u64     feat_type;
>  };
> =20
> +int h_query_vas_capabilities(const u64 hcall, u8 query_type, u64 result)=
;
> +int vas_register_api_pseries(struct module *mod,
> +			     enum vas_cop_type cop_type, const char *name);
> +void vas_unregister_api_pseries(void);
>  #endif
> =20
>  /*
> diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platf=
orms/pseries/Makefile
> index c8a2b0b05ac0..4cda0ef87be0 100644
> --- a/arch/powerpc/platforms/pseries/Makefile
> +++ b/arch/powerpc/platforms/pseries/Makefile
> @@ -30,3 +30,4 @@ obj-$(CONFIG_PPC_SVM)		+=3D svm.o
>  obj-$(CONFIG_FA_DUMP)		+=3D rtas-fadump.o
> =20
>  obj-$(CONFIG_SUSPEND)		+=3D suspend.o
> +obj-$(CONFIG_PPC_VAS)		+=3D vas.o
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index 98109a13f1c2..fe375f7a7029 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -10,6 +10,7 @@
>  #include <linux/export.h>
>  #include <linux/types.h>
>  #include <linux/delay.h>
> +#include <linux/slab.h>
>  #include <asm/machdep.h>
>  #include <asm/hvcall.h>
>  #include <asm/plpar_wrappers.h>
> @@ -187,6 +188,228 @@ int h_query_vas_capabilities(const u64 hcall, u8 qu=
ery_type, u64 result)
>  		return -EIO;
>  	}
>  }
> +EXPORT_SYMBOL_GPL(h_query_vas_capabilities);
> +
> +/*
> + * Allocate window and setup IRQ mapping.
> + */
> +static int allocate_setup_window(struct pseries_vas_window *txwin,
> +				 u64 *domain, u8 wintype)
> +{
> +	int rc;
> +
> +	rc =3D h_allocate_vas_window(txwin, domain, wintype, DEF_WIN_CREDS);
> +	if (rc)
> +		return rc;
> +
> +	txwin->vas_win.wcreds_max =3D DEF_WIN_CREDS;
> +
> +	return 0;
> +}
> +
> +static struct vas_window *vas_allocate_window(struct vas_tx_win_open_att=
r *uattr,
> +					      enum vas_cop_type cop_type)
> +{
> +	long domain[PLPAR_HCALL9_BUFSIZE] =3D {VAS_DEFAULT_DOMAIN_ID};
> +	struct vas_ct_caps *ct_caps;
> +	struct vas_caps *caps;
> +	struct pseries_vas_window *txwin;
> +	int rc;
> +
> +	txwin =3D kzalloc(sizeof(*txwin), GFP_KERNEL);
> +	if (!txwin)
> +		return ERR_PTR(-ENOMEM);
> +
> +	/*
> +	 * A VAS window can have many credits which means that many
> +	 * requests can be issued simultaneously. But phyp restricts
> +	 * one credit per window.
> +	 * phyp introduces 2 different types of credits:
> +	 * Default credit type (Uses normal priority FIFO):
> +	 *	A limited number of credits are assigned to partitions
> +	 *	based on processor entitlement. But these credits may be
> +	 *	over-committed on a system depends on whether the CPUs
> +	 *	are in shared or dedicated modes - that is, more requests
> +	 *	may be issued across the system than NX can service at
> +	 *	once which can result in paste command failure (RMA_busy).
> +	 *	Then the process has to resend requests or fall-back to
> +	 *	SW compression.
> +	 * Quality of Service (QoS) credit type (Uses high priority FIFO):
> +	 *	To avoid NX HW contention, the system admins can assign
> +	 *	QoS credits for each LPAR so that this partition is
> +	 *	guaranteed access to NX resources. These credits are
> +	 *	assigned to partitions via the HMC.
> +	 *	Refer PAPR for more information.
> +	 *
> +	 * Allocate window with QoS credits if user requested. Otherwise
> +	 * default credits are used.
> +	 */
> +	if (uattr->flags & VAS_TX_WIN_FLAG_QOS_CREDIT)
> +		caps =3D &vascaps[VAS_GZIP_QOS_FEAT_TYPE];
> +	else
> +		caps =3D &vascaps[VAS_GZIP_DEF_FEAT_TYPE];
> +
> +	ct_caps =3D &caps->caps;
> +
> +	if (atomic_inc_return(&ct_caps->used_lpar_creds) >
> +			atomic_read(&ct_caps->target_lpar_creds)) {
> +		pr_err("Credits are not available to allocate window\n");
> +		rc =3D -EINVAL;
> +		goto out;
> +	}
> +
> +	/*
> +	 * The user space is requesting to allocate a window on a VAS
> +	 * instance (or chip) where the process is executing.
> +	 * On powerVM, domain values are passed to pHyp to select chip /
> +	 * VAS instance. Useful if the process is affinity to NUMA node.
> +	 * pHyp selects VAS instance if VAS_DEFAULT_DOMAIN_ID (-1) is
> +	 * passed for domain values.
> +	 */

s/powerVM/PowerVM
s/pHyp/PowerVM

You could also just call it the hypervisor. KVM may not implement the=20
hcalls now, but in future it could.

> +	if (uattr->vas_id =3D=3D -1) {

Should the above comment fit under here? vas_id =3D=3D -1 means userspace=20
asks for any VAS but preferably a local one?

> +		/*
> +		 * To allocate VAS window, pass same domain values returned
> +		 * from this HCALL.
> +		 */

Then you could merge it with this comment and make it a bit clearer:
the h_allocate_vas_window hcall is defined to take a domain as
specified by h_home_node_associativity, so no conversions or unpacking
needs to be done.

> +		rc =3D plpar_hcall9(H_HOME_NODE_ASSOCIATIVITY, domain,
> +				  VPHN_FLAG_VCPU, smp_processor_id());
> +		if (rc !=3D H_SUCCESS) {
> +			pr_err("HCALL(%x): failed with ret(%d)\n",
> +			       H_HOME_NODE_ASSOCIATIVITY, rc);
> +			goto out;
> +		}
> +	}
> +
> +	/*
> +	 * Allocate / Deallocate window HCALLs and setup / free IRQs
> +	 * have to be protected with mutex.
> +	 * Open VAS window: Allocate window HCALL and setup IRQ
> +	 * Close VAS window: Deallocate window HCALL and free IRQ
> +	 *	The hypervisor waits until all NX requests are
> +	 *	completed before closing the window. So expects OS
> +	 *	to handle NX faults, means IRQ can be freed only
> +	 *	after the deallocate window HCALL is returned.
> +	 * So once the window is closed with deallocate HCALL before
> +	 * the IRQ is freed, it can be assigned to new allocate
> +	 * HCALL with the same fault IRQ by the hypervisor. It can
> +	 * result in setup IRQ fail for the new window since the
> +	 * same fault IRQ is not freed by the OS.
> +	 */
> +	mutex_lock(&vas_pseries_mutex);

Why? What's the mutex protecting here?

> +	rc =3D allocate_setup_window(txwin, (u64 *)&domain[0],
> +				   ct_caps->win_type);

If you define the types to be the same, can you avoid this casting?
allocate_setup_window specifically needs an array of=20
PLPAR_HCALL9_BUFSIZE longs.

> +	mutex_unlock(&vas_pseries_mutex);
> +	if (rc)
> +		goto out;
> +
> +	/*
> +	 * Modify window and it is ready to use.
> +	 */
> +	rc =3D h_modify_vas_window(txwin);
> +	if (!rc)
> +		rc =3D get_vas_user_win_ref(&txwin->vas_win.task_ref);
> +	if (rc)
> +		goto out_free;
> +
> +	vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
> +	txwin->win_type =3D ct_caps->win_type;
> +	mutex_lock(&vas_pseries_mutex);
> +	list_add(&txwin->win_list, &caps->list);
> +	mutex_unlock(&vas_pseries_mutex);
> +
> +	return &txwin->vas_win;
> +
> +out_free:
> +	h_deallocate_vas_window(txwin->vas_win.winid);

No mutex here in this deallocate hcall.

I suspect you don't actually need the mutex for the hcalls themselves,=20
but the list manipulations. I would possibly consider putting=20
used_lpar_creds under that same lock rather than making it atomic and
playing lock free games, unless you really need to.

Also... "creds". credentials? credits, right? Don't go through and=20
change everything now, but not skimping on naming helps a lot with
reading code that you're not familiar with. All the vas/nx stuff
could probably do with a pass to make the names a bit easier.

(creds isn't so bad, "ct" for "coprocessor type" is pretty obscure=20
though).

Thanks,
Nick

> +out:
> +	atomic_dec(&ct_caps->used_lpar_creds);
> +	kfree(txwin);
> +	return ERR_PTR(rc);
> +}
> +
> +static u64 vas_paste_address(struct vas_window *vwin)
> +{
> +	struct pseries_vas_window *win;
> +
> +	win =3D container_of(vwin, struct pseries_vas_window, vas_win);
> +	return win->win_addr;
> +}
> +
> +static int deallocate_free_window(struct pseries_vas_window *win)
> +{
> +	int rc =3D 0;
> +
> +	rc =3D h_deallocate_vas_window(win->vas_win.winid);
> +
> +	return rc;
> +}
> +
> +static int vas_deallocate_window(struct vas_window *vwin)
> +{
> +	struct pseries_vas_window *win;
> +	struct vas_ct_caps *caps;
> +	int rc =3D 0;
> +
> +	if (!vwin)
> +		return -EINVAL;
> +
> +	win =3D container_of(vwin, struct pseries_vas_window, vas_win);
> +
> +	/* Should not happen */
> +	if (win->win_type >=3D VAS_MAX_FEAT_TYPE) {
> +		pr_err("Window (%u): Invalid window type %u\n",
> +				vwin->winid, win->win_type);
> +		return -EINVAL;
> +	}
> +
> +	caps =3D &vascaps[win->win_type].caps;
> +	mutex_lock(&vas_pseries_mutex);
> +	rc =3D deallocate_free_window(win);
> +	if (rc) {
> +		mutex_unlock(&vas_pseries_mutex);
> +		return rc;
> +	}
> +
> +	list_del(&win->win_list);
> +	atomic_dec(&caps->used_lpar_creds);
> +	mutex_unlock(&vas_pseries_mutex);
> +
> +	put_vas_user_win_ref(&vwin->task_ref);
> +	mm_context_remove_vas_window(vwin->task_ref.mm);
> +
> +	kfree(win);
> +	return 0;
> +}
> +
> +static const struct vas_user_win_ops vops_pseries =3D {
> +	.open_win	=3D vas_allocate_window,	/* Open and configure window */
> +	.paste_addr	=3D vas_paste_address,	/* To do copy/paste */
> +	.close_win	=3D vas_deallocate_window, /* Close window */
> +};
> +
> +/*
> + * Supporting only nx-gzip coprocessor type now, but this API code
> + * extended to other coprocessor types later.
> + */
> +int vas_register_api_pseries(struct module *mod, enum vas_cop_type cop_t=
ype,
> +			     const char *name)
> +{
> +	int rc;
> +
> +	if (!copypaste_feat)
> +		return -ENOTSUPP;
> +
> +	rc =3D vas_register_coproc_api(mod, cop_type, name, &vops_pseries);
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(vas_register_api_pseries);
> +
> +void vas_unregister_api_pseries(void)
> +{
> +	vas_unregister_coproc_api();
> +}
> +EXPORT_SYMBOL_GPL(vas_unregister_api_pseries);
> =20
>  /*
>   * Get the specific capabilities based on the feature type.
> --=20
> 2.18.2
>=20
>=20
>=20
