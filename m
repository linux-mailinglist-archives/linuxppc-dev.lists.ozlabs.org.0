Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C59A44C0FAA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 10:55:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3WcW0YM2z3cQY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 20:55:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GbYnQQeU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GbYnQQeU; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3Wbq60MCz2xsS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 20:54:46 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id l8so18136577pls.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 01:54:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=eDjZFiKDYU654cC5jz7aMa4gZQ72K1bQ4WFxHSe2GP8=;
 b=GbYnQQeU+CyX8H6ngd/2mjU1yawG9c7uw1CEvXBealOIruk9RXATd0D3jtpDrzakx/
 HjuhYN3X6w9yp/CtPfDy7MZSygit358LnEYIfb/PCXyCavIORzFMnk3Kj6Lt6W4oC70R
 Hku6ix2G+t9deY3xHmbuX8WdcJtiA9gZNFRQh0UkF72IDgC3UofJl/cbX4Rp9aW+t6G8
 L3Q04zUZgWLaggVt9xWVZP/b37+djbDOCFIZ+1xuR/w+P74JZeh4Ga5b3LsZLZcwyYzL
 1Ufh38Ow26jEsliU8gqVZL0IyrdCcdtHzTyb0TpzyahRMBTftwGUFptykHEjMTz0kmib
 pGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=eDjZFiKDYU654cC5jz7aMa4gZQ72K1bQ4WFxHSe2GP8=;
 b=hIZoRO4yZRkJ1WBRRrUFUqUAJNyZ4RRT5/CU/kWQEZ0HN1zsi9mnHqIs2uQGSc9vQl
 4ti637HIXV5WbGcwkPLMKQl08/zmj5BXRcUX+5ruKXTrzfggLUnZatPEyDxJlKnJor/t
 WRx80Upb8Hd43W4qPQOYRlC8fUBSIdj9atFenk6nHTONcI647FO1iBskeov6R+JD9mt3
 +7Rz90Z6paOmizU9v8zAA6CXwZCjrsRwBUJ/vkmKSRa4M7gUhuH/usWpcRKltTu8t0qM
 JV40F/yC4Dolzrn+7GG2rdXCySA1sWoJ9nTEkNNPs2RdqJF4twVRAC3YgHzgP4orKoFS
 4odA==
X-Gm-Message-State: AOAM532uWCYtXAzjf9imt8kGP5PclIxBBRoJfyxtg67ZB1MfmL+bA/dB
 tADw0VmzPQWYxRVQO/c+RjI=
X-Google-Smtp-Source: ABdhPJzbeSCzC2FxvBkq6z+4QIBdVAddEG52IpIoMG5vCmU1H8nvJKEA7LSBtaUMLPiK12AMCQl5ug==
X-Received: by 2002:a17:902:ea81:b0:14f:a4ce:ef79 with SMTP id
 x1-20020a170902ea8100b0014fa4ceef79mr15764684plb.136.1645610083892; 
 Wed, 23 Feb 2022 01:54:43 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id b11sm23794534pgs.55.2022.02.23.01.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 01:54:43 -0800 (PST)
Date: Wed, 23 Feb 2022 19:54:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 2/4] powerpc/pseries/vas: Modify reconfig open/close
 functions for migration
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
 <fb9f17bd5ee7a4df453138769b709c60cdc42641.camel@linux.ibm.com>
In-Reply-To: <fb9f17bd5ee7a4df453138769b709c60cdc42641.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645609170.yvpqkmicgp.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 6:05 am:
>=20
> VAS is a hardware engine stays on the chip. So when the partition
> migrates, all VAS windows on the source system have to be closed
> and reopen them on the destination after migration.
>=20
> This patch make changes to the current reconfig_open/close_windows
> functions to support migration:
> - Set VAS_WIN_MIGRATE_CLOSE to the window status when closes and
>   reopen windows with the same status during resume.
> - Continue to close all windows even if deallocate HCALL failed
>   (should not happen) since no way to stop migration with the
>   current LPM implementation.

Hmm.  pseries_migrate_partition *can* fail?

> - If the DLPAR CPU event happens while migration is in progress,
>   set VAS_WIN_NO_CRED_CLOSE to the window status. Close window
>   happens with the first event (migration or DLPAR) and Reopen
>   window happens only with the last event (migration or DLPAR).

Can DLPAR happen while migration is in progress? Couldn't
this cause your source and destination credits to go out of
whack?

Why do you need two close window types, what if you finish
LPM and just open as many as possible regardless how they
are closed?

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/vas.h       |  2 +
>  arch/powerpc/platforms/pseries/vas.c | 88 ++++++++++++++++++++++------
>  2 files changed, 73 insertions(+), 17 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/va=
s.h
> index 6baf7b9ffed4..83afcb6c194b 100644
> --- a/arch/powerpc/include/asm/vas.h
> +++ b/arch/powerpc/include/asm/vas.h
> @@ -36,6 +36,8 @@
>  					/* vas mmap() */
>  /* Window is closed in the hypervisor due to lost credit */
>  #define VAS_WIN_NO_CRED_CLOSE	0x00000001
> +/* Window is closed due to migration */
> +#define VAS_WIN_MIGRATE_CLOSE	0x00000002
> =20
>  /*
>   * Get/Set bit fields
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index 3bb219f54806..fbcf311da0ec 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -457,11 +457,12 @@ static int vas_deallocate_window(struct vas_window =
*vwin)
>  	mutex_lock(&vas_pseries_mutex);
>  	/*
>  	 * VAS window is already closed in the hypervisor when
> -	 * lost the credit. So just remove the entry from
> -	 * the list, remove task references and free vas_window
> +	 * lost the credit or with migration. So just remove the entry
> +	 * from the list, remove task references and free vas_window
>  	 * struct.
>  	 */
> -	if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) {
> +	if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) &&
> +		!(win->vas_win.status & VAS_WIN_MIGRATE_CLOSE)) {
>  		rc =3D deallocate_free_window(win);
>  		if (rc) {
>  			mutex_unlock(&vas_pseries_mutex);
> @@ -578,12 +579,14 @@ static int __init get_vas_capabilities(u8 feat, enu=
m vas_cop_feat_type type,
>   * by setting the remapping to new paste address if the window is
>   * active.
>   */
> -static int reconfig_open_windows(struct vas_caps *vcaps, int creds)
> +static int reconfig_open_windows(struct vas_caps *vcaps, int creds,
> +				 bool migrate)
>  {
>  	long domain[PLPAR_HCALL9_BUFSIZE] =3D {VAS_DEFAULT_DOMAIN_ID};
>  	struct vas_cop_feat_caps *caps =3D &vcaps->caps;
>  	struct pseries_vas_window *win =3D NULL, *tmp;
>  	int rc, mv_ents =3D 0;
> +	int flag;
> =20
>  	/*
>  	 * Nothing to do if there are no closed windows.
> @@ -602,8 +605,10 @@ static int reconfig_open_windows(struct vas_caps *vc=
aps, int creds)
>  	 * (dedicated). If 1 core is added, this LPAR can have 20 more
>  	 * credits. It means the kernel can reopen 20 windows. So move
>  	 * 20 entries in the VAS windows lost and reopen next 20 windows.
> +	 * For partition migration, reopen all windows that are closed
> +	 * during resume.
>  	 */
> -	if (vcaps->nr_close_wins > creds)
> +	if ((vcaps->nr_close_wins > creds) && !migrate)
>  		mv_ents =3D vcaps->nr_close_wins - creds;
> =20
>  	list_for_each_entry_safe(win, tmp, &vcaps->list, win_list) {
> @@ -613,12 +618,35 @@ static int reconfig_open_windows(struct vas_caps *v=
caps, int creds)
>  		mv_ents--;
>  	}
> =20
> +	/*
> +	 * Open windows if they are closed only with migration or
> +	 * DLPAR (lost credit) before.
> +	 */
> +	if (migrate)
> +		flag =3D VAS_WIN_MIGRATE_CLOSE;
> +	else
> +		flag =3D VAS_WIN_NO_CRED_CLOSE;
> +
>  	list_for_each_entry_safe_from(win, tmp, &vcaps->list, win_list) {
> +		/*
> +		 * This window is closed with DLPAR and migration events.
> +		 * So reopen the window with the last event.
> +		 * The user space is not suspended with the current
> +		 * migration notifier. So the user space can issue DLPAR
> +		 * CPU hotplug while migration in progress. In this case
> +		 * this window will be opened with the last event.
> +		 */
> +		if ((win->vas_win.status & VAS_WIN_NO_CRED_CLOSE) &&
> +			(win->vas_win.status & VAS_WIN_MIGRATE_CLOSE)) {
> +			win->vas_win.status &=3D ~flag;
> +			continue;
> +		}
> +
>  		/*
>  		 * Nothing to do on this window if it is not closed
> -		 * with VAS_WIN_NO_CRED_CLOSE
> +		 * with this flag
>  		 */
> -		if (!(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE))
> +		if (!(win->vas_win.status & flag))
>  			continue;
> =20
>  		rc =3D allocate_setup_window(win, (u64 *)&domain[0],
> @@ -634,7 +662,7 @@ static int reconfig_open_windows(struct vas_caps *vca=
ps, int creds)
>  		/*
>  		 * Set window status to active
>  		 */
> -		win->vas_win.status &=3D ~VAS_WIN_NO_CRED_CLOSE;
> +		win->vas_win.status &=3D ~flag;
>  		mutex_unlock(&win->vas_win.task_ref.mmap_mutex);
>  		win->win_type =3D caps->win_type;
>  		if (!--vcaps->nr_close_wins)
> @@ -661,20 +689,32 @@ static int reconfig_open_windows(struct vas_caps *v=
caps, int creds)
>   * the user space to fall back to SW compression and manage with the
>   * existing windows.
>   */
> -static int reconfig_close_windows(struct vas_caps *vcap, int excess_cred=
s)
> +static int reconfig_close_windows(struct vas_caps *vcap, int excess_cred=
s,
> +									bool migrate)
>  {
>  	struct pseries_vas_window *win, *tmp;
>  	struct vas_user_win_ref *task_ref;
>  	struct vm_area_struct *vma;
> -	int rc =3D 0;
> +	int rc =3D 0, flag;
> +
> +	if (migrate)
> +		flag =3D VAS_WIN_MIGRATE_CLOSE;
> +	else
> +		flag =3D VAS_WIN_NO_CRED_CLOSE;
> =20
>  	list_for_each_entry_safe(win, tmp, &vcap->list, win_list) {
>  		/*
>  		 * This window is already closed due to lost credit
> -		 * before. Go for next window.
> +		 * or for migration before. Go for next window.
> +		 * For migration, nothing to do since this window
> +		 * closed for DLPAR and will be reopened even on
> +		 * the destination system with other DLPAR operation.
>  		 */
> -		if (win->vas_win.status & VAS_WIN_NO_CRED_CLOSE)
> +		if ((win->vas_win.status & VAS_WIN_MIGRATE_CLOSE) ||
> +			(win->vas_win.status & VAS_WIN_NO_CRED_CLOSE)) {
> +			win->vas_win.status |=3D flag;
>  			continue;
> +		}
> =20
>  		task_ref =3D &win->vas_win.task_ref;
>  		mutex_lock(&task_ref->mmap_mutex);
> @@ -683,7 +723,7 @@ static int reconfig_close_windows(struct vas_caps *vc=
ap, int excess_creds)
>  		 * Number of available credits are reduced, So select
>  		 * and close windows.
>  		 */
> -		win->vas_win.status |=3D VAS_WIN_NO_CRED_CLOSE;
> +		win->vas_win.status |=3D flag;
> =20
>  		mmap_write_lock(task_ref->mm);
>  		/*
> @@ -706,12 +746,24 @@ static int reconfig_close_windows(struct vas_caps *=
vcap, int excess_creds)
>  		 * later when the process issued with close(FD).
>  		 */
>  		rc =3D deallocate_free_window(win);
> -		if (rc)
> +		/*
> +		 * This failure is from the hypervisor.
> +		 * No way to stop migration for these failures.
> +		 * So ignore error and continue closing other windows.
> +		 */
> +		if (rc && !migrate)
>  			return rc;
> =20
>  		vcap->nr_close_wins++;
> =20
> -		if (!--excess_creds)
> +		/*
> +		 * For migration, do not depend on lpar_creds in case if
> +		 * mismatch with the hypervisor value (should not happen).
> +		 * So close all active windows in the list and will be
> +		 * reopened windows based on the new lpar_creds on the
> +		 * destination system during resume.
> +		 */
> +		if (!migrate && !--excess_creds)
>  			break;
>  	}
> =20
> @@ -761,7 +813,8 @@ int vas_reconfig_capabilties(u8 type)
>  		 * target, reopen windows if they are closed due to
>  		 * the previous DLPAR (core removal).
>  		 */
> -		rc =3D reconfig_open_windows(vcaps, new_nr_creds - old_nr_creds);
> +		rc =3D reconfig_open_windows(vcaps, new_nr_creds - old_nr_creds,
> +					   false);
>  	} else {
>  		/*
>  		 * # active windows is more than new LPAR available
> @@ -771,7 +824,8 @@ int vas_reconfig_capabilties(u8 type)
>  		nr_active_wins =3D vcaps->nr_open_windows - vcaps->nr_close_wins;
>  		if (nr_active_wins > new_nr_creds)
>  			rc =3D reconfig_close_windows(vcaps,
> -					nr_active_wins - new_nr_creds);
> +					nr_active_wins - new_nr_creds,
> +					false);
>  	}
> =20
>  out:
> --=20
> 2.27.0
>=20
>=20
>=20
