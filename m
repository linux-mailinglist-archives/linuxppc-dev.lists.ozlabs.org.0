Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B0944B402A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:17:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxqCz5xSHz3cPP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 14:17:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aV0hIS+R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aV0hIS+R; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxqCJ14KQz3bP1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 14:17:13 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id i6so25014280pfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 19:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=DLeKvhUtNjg7mSF9cpH0lvOtWMo2An+6EmywAw3aYTQ=;
 b=aV0hIS+ROBOiFz4ybRsZ19xR6FsH/q/EDvxAHuV0DkxUScF3RG65mB1BojIGHYLr8t
 cq3WLdPLYCj8CrkTNu+Q7Uap61wSTggx+i3wMlQTnzwEm1U0XmxkX0FWHEAxW3zfn97r
 DMZdUOuswiH6Qp5p010GxLi+N4bjufz6+NUHMSFEGiVv5UGIZws6vAng2DQJyhrSeG3U
 UAgR1CKZuwx//S1n0uUSpVtyR82SVnkyc8pHo4cJ2d8Gm9At/cwxN3DyHC/QgvV7XmkH
 0F7XLz1FxYYT3kfl1RBunRNE3E89GBOZmM9hoP4mAgdVWguuEOVp4fCsWz9R9z6LOlp1
 3zng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=DLeKvhUtNjg7mSF9cpH0lvOtWMo2An+6EmywAw3aYTQ=;
 b=in9o+lPZy0DNpWHMVOgUjl7M9KBk9T3C+V+J1r+Mi1iE1xp2nROWWsAfFnh4goEtte
 eTAid0iAxl8+Y4qhdl2TKXP04ZBhSmHiUmMzHXduA7HNdEn3VhLp2kUJPF/Pc7Wk2sMk
 W56eHwG3ysWhqSozcAeJ9b0LqBHyUamNAG3dmFw8GW5FTsbAZx/jxlqJXD8Is3ZdFeSH
 8g5Ski8ENBgengXDSNC9mLkZptV8pzD8zyRvyoyUKOsImKUrqgrHwxWZNkExyr8W3XvJ
 Q1T+UzKKP2Y3r1qqR6jeLUiXmWn+Br2WQQ+SpqwoB36j539pPXmuUO2Ri+Azv6pU8b/e
 dePg==
X-Gm-Message-State: AOAM531COMh7h4Qrgop0Fgghd9gUFC49Kq+BOIA4TqUDimWhQnRTaiS/
 ozW8qcMdPf7mSJamUtJ1fSA=
X-Google-Smtp-Source: ABdhPJz6cwnBZs7dMeIstZ0PDrmKBKqR5iNFoN/Yz0IjdNLcL0q3jvgrVc04hqB6aNQjWPuoupm4Hw==
X-Received: by 2002:a63:475e:: with SMTP id w30mr10181429pgk.175.1644808632219; 
 Sun, 13 Feb 2022 19:17:12 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id n37sm15676083pgl.48.2022.02.13.19.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 19:17:11 -0800 (PST)
Date: Mon, 14 Feb 2022 13:17:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 05/10] powerpc/pseries/vas: Close windows with DLPAR
 core removal
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <5bf38aba31d340f7a4a662f82746b1784891673b.camel@linux.ibm.com>
In-Reply-To: <5bf38aba31d340f7a4a662f82746b1784891673b.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644806848.01buhj7y5b.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of January 22, 2022 5:57 am:
>=20
> The hypervisor reduces the available credits if the core is removed
> from the LPAR. So there is possibility of using excessive credits
> (windows) in the LPAR and the hypervisor expects the system to close
> the excessive windows. Even though the user space can continue to use
> these windows to send compression requests to NX, the hypervisor expects
> the LPAR to reduce these windows usage so that NX load can be equally
> distributed across all LPARs in the system.
>=20
> When the DLPAR notifier is received, get the new VAS capabilities from
> the hypervisor and close the excessive windows in the hypervisor. Also
> the kernel unmaps the paste address so that the user space receives paste
> failure until these windows are active with the later DLPAR (core add).

The changelog needs work. Unmapping the window and the ramifications of
that needs more description here or in comments.

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h          |   1 +
>  arch/powerpc/platforms/book3s/vas-api.c |   2 +
>  arch/powerpc/platforms/pseries/vas.c    | 117 ++++++++++++++++++++++--
>  arch/powerpc/platforms/pseries/vas.h    |   1 +
>  4 files changed, 112 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index f1efe86563cc..ddc05a8fc2e3 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -74,6 +74,7 @@ struct vas_user_win_ref {
>  	struct mm_struct *mm;	/* Linux process mm_struct */
>  	struct mutex mmap_mutex;	/* protects paste address mmap() */
>  					/* with DLPAR close/open windows */
> +	struct vm_area_struct *vma;	/* Save VMA and used in DLPAR ops */
>  };
> =20
>  /*
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index 2b0ced611f32..a63fd48e34a7 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -399,6 +399,8 @@ static int coproc_mmap(struct file *fp, struct vm_are=
a_struct *vma)
>  	pr_devel("%s(): paste addr %llx at %lx, rc %d\n", __func__,
>  			paste_addr, vma->vm_start, rc);
> =20
> +	txwin->task_ref.vma =3D vma;
> +
>  	return rc;
>  }
> =20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index d9ff73d7704d..75ccd0a599ec 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -370,13 +370,28 @@ static struct vas_window *vas_allocate_window(int v=
as_id, u64 flags,
>  	if (rc)
>  		goto out_free;
> =20
> -	vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
>  	txwin->win_type =3D cop_feat_caps->win_type;
>  	mutex_lock(&vas_pseries_mutex);
> -	list_add(&txwin->win_list, &caps->list);
> +	/*
> +	 * Possible to loose the acquired credit with DLPAR core

s/loose/lose/g

> +	 * removal after the window is opened. So if there are any
> +	 * closed windows (means with lost credits), do not give new
> +	 * window to user space. New windows will be opened only
> +	 * after the existing windows are reopened when credits are
> +	 * available.
> +	 */
> +	if (!caps->close_wins) {
> +		list_add(&txwin->win_list, &caps->list);
> +		caps->num_wins++;
> +		mutex_unlock(&vas_pseries_mutex);
> +		vas_user_win_add_mm_context(&txwin->vas_win.task_ref);
> +		return &txwin->vas_win;
> +	}
>  	mutex_unlock(&vas_pseries_mutex);
> =20
> -	return &txwin->vas_win;
> +	put_vas_user_win_ref(&txwin->vas_win.task_ref);
> +	rc =3D -EBUSY;
> +	pr_err("No credit is available to allocate window\n");
> =20
>  out_free:
>  	/*
> @@ -439,14 +454,24 @@ static int vas_deallocate_window(struct vas_window =
*vwin)
> =20
>  	caps =3D &vascaps[win->win_type].caps;
>  	mutex_lock(&vas_pseries_mutex);
> -	rc =3D deallocate_free_window(win);
> -	if (rc) {
> -		mutex_unlock(&vas_pseries_mutex);
> -		return rc;
> -	}
> +	/*
> +	 * VAS window is already closed in the hypervisor when
> +	 * lost the credit. So just remove the entry from
> +	 * the list, remove task references and free vas_window
> +	 * struct.
> +	 */
> +	if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) {
> +		rc =3D deallocate_free_window(win);
> +		if (rc) {
> +			mutex_unlock(&vas_pseries_mutex);
> +			return rc;
> +		}
> +	} else
> +		vascaps[win->win_type].close_wins--;
> =20
>  	list_del(&win->win_list);
>  	atomic_dec(&caps->used_creds);
> +	vascaps[win->win_type].num_wins--;
>  	mutex_unlock(&vas_pseries_mutex);
> =20
>  	put_vas_user_win_ref(&vwin->task_ref);
> @@ -622,6 +647,72 @@ static int reconfig_open_windows(struct vas_caps *vc=
aps, int creds)
>  	return rc;
>  }
> =20
> +/*
> + * The hypervisor reduces the available credits if the LPAR lost core. I=
t
> + * means the excessive windows should not be active and the user space
> + * should not be using these windows to send compression requests to NX.
> + * So the kernel closes the excessive windows and unmap the paste addres=
s
> + * such that the user space receives paste instruction failure. Then up =
to
> + * the user space to fall back to SW compression and manage with the
> + * existing windows.
> + */
> +static int reconfig_close_windows(struct vas_caps *vcap, int excess_cred=
s)
> +{
> +	struct pseries_vas_window *win, *tmp;
> +	struct vas_user_win_ref *task_ref;
> +	struct vm_area_struct *vma;
> +	int rc =3D 0;
> +
> +	list_for_each_entry_safe(win, tmp, &vcap->list, win_list) {
> +		/*
> +		 * This window is already closed due to lost credit
> +		 * before. Go for next window.
> +		 */
> +		if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE)
> +			continue;
> +
> +		task_ref =3D &win->vas_win.task_ref;
> +		mutex_lock(&task_ref->mmap_mutex);
> +		vma =3D task_ref->vma;
> +		/*
> +		 * Number of available credits are reduced, So select
> +		 * and close windows.
> +		 */
> +		win->vas_win.status |=3D VAS_WIN_NO_CRED_CLOSE;
> +
> +		mmap_write_lock(task_ref->mm);
> +		/*
> +		 * vma is set in the original mapping. But this mapping
> +		 * is done with mmap() after the window is opened with ioctl.
> +		 * so we may not see the original mapping if the core remove
> +		 * is done before the original mmap() and after the ioctl.
> +		 */
> +		if (vma)
> +			zap_page_range(vma, vma->vm_start,
> +					vma->vm_end - vma->vm_start);
> +
> +		mmap_write_unlock(task_ref->mm);
> +		mutex_unlock(&task_ref->mmap_mutex);
> +		/*
> +		 * Close VAS window in the hypervisor, but do not
> +		 * free vas_window struct since it may be reused
> +		 * when the credit is available later (DLPAR with
> +		 * adding cores). This struct will be used
> +		 * later when the process issued with close(FD).
> +		 */
> +		rc =3D deallocate_free_window(win);
> +		if (rc)
> +			return rc;
> +
> +		vcap->close_wins++;
> +
> +		if (!--excess_creds)
> +			break;
> +	}
> +
> +	return 0;
> +}
> +
>  /*
>   * Get new VAS capabilities when the core add/removal configuration
>   * changes. Reconfig window configurations based on the credits
> @@ -633,7 +724,7 @@ static int vas_reconfig_capabilties(u8 type)
>  	struct vas_cop_feat_caps *caps;
>  	int lpar_creds, new_creds;
>  	struct vas_caps *vcaps;
> -	int rc =3D 0;
> +	int rc =3D 0, active_wins;
> =20
>  	if (type >=3D VAS_MAX_FEAT_TYPE) {
>  		pr_err("Invalid credit type %d\n", type);
> @@ -671,6 +762,14 @@ static int vas_reconfig_capabilties(u8 type)
>  		 * the previous DLPAR (core removal).
>  		 */
>  		rc =3D reconfig_open_windows(vcaps, new_creds - lpar_creds);
> +	} else {
> +		/*
> +		 * # active windows is more than new LPAR available
> +		 * credits. So close the excessive windows.
> +		 */
> +		active_wins =3D vcaps->num_wins - vcaps->close_wins;
> +		if (active_wins > new_creds)
> +			rc =3D reconfig_close_windows(vcaps, active_wins - new_creds);
>  	}
> =20
>  out:
> diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platform=
s/pseries/vas.h
> index 45b62565955b..8ce9b84693e8 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -79,6 +79,7 @@ struct vas_caps {
>  	struct vas_cop_feat_caps caps;
>  	struct list_head list;	/* List of open windows */
>  	int close_wins;		/* closed windows in the hypervisor for DLPAR */
> +	int num_wins;		/* Number of windows opened */

num -> nr is usually best.

And I know you like to abbreviate names, but it helps unfamiliar readers=20
to use a few more letters. num_wins -> nr_windows or even better=20
nr_open_windows.

Same comment about location of the field. Also it's not quite clear to=20
me what the relationship is between your open windows here and used=20
credits in the vas_cop_feat_caps structure. In other comments and=20
changelogs you use credit and window interchangeably.


>  	u8 feat;		/* Feature type */
>  };
> =20
> --=20
> 2.27.0
>=20
>=20
>=20
