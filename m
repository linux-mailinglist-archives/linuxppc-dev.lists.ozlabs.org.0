Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D3AA4C0D4E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 08:29:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3SMr4sf4z3bYq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 18:29:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ORaB1wlk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::435;
 helo=mail-pf1-x435.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ORaB1wlk; dkim-atps=neutral
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3SMB6sDzz2x9d
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:28:38 +1100 (AEDT)
Received: by mail-pf1-x435.google.com with SMTP id y5so14518497pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 23:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5E1PhWXXdIeic6AY2nl7yjcYX9GQhIoVjafhujzaysQ=;
 b=ORaB1wlkVNCzZ0/EN9rHlYriViWIYpMiM2EGIPL1BJBl74Xnt//oY1vZdP3fNdRWTQ
 KTxlpy46gDtFdkNlBFHkhjPanXKrGvEPIwLi5kdvVYR7UDArly5yd0rZCsbB8V9THok2
 U6ZVn3U871FJp4ZWVaXbdP2aRN7/ZtiYWILtIjPum5xAix2I/9BrCyrc7oqLt9WatlZ7
 iK4PgxjCstU+uM9ggBa41dQyWkaPtnP6nrvKpm0341CRamSfIN24VeRUdyVN5WxzKcCW
 FXGqO9qe4Ec2ZRlzmwbk7S1FduC+ISjA91JIxmAix0ZhNr6oZ9bUewQodSm6xctdC2Cz
 LYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5E1PhWXXdIeic6AY2nl7yjcYX9GQhIoVjafhujzaysQ=;
 b=Dxk5TkGESobTsExmHYax5nthdLFdKOXmOzrufvDy4QHeNDlVHq0SgDneCqd54d9gZZ
 ox8d4aUYrUuRnrCJM+wBAcmyqG0CuYS8tNKVQCDttTJImI/M3v3pUc9j20w2idqzW8WT
 c1Ol4CvekXHVmB3edfH0FGLf5o4AcVBNOICnUARwwzGKK7TstyHgAfQlhNMI74qIq++h
 H37ZLKrUYa2SE98vQO7irh9EU11LtImma3p9xto7IlBRGADrdLcZ56/Q9ibPGEevoNw8
 Gl13JkxcBFDkxeAndTCFECRdzJwtKvRRl9l3yyDq7kuzEzGev+5gMdXHPgKzjlZtVG7K
 2kLA==
X-Gm-Message-State: AOAM531kJBQT+SZ4Osskt80b0SGE3NMvQwfonIJhWGS90vis8H0aYZVb
 KTUwodJSPW5f3lWDakBPFgo=
X-Google-Smtp-Source: ABdhPJzBbC7fz/ZVzAIQHpNS8yfIyLiO8kQO5ocne7SPju//KUy/CGOR3z0xuC4ifZkvmKPPww2zDw==
X-Received: by 2002:a63:914b:0:b0:373:520f:d03b with SMTP id
 l72-20020a63914b000000b00373520fd03bmr22654120pge.123.1645601315871; 
 Tue, 22 Feb 2022 23:28:35 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id r72sm13407600pgr.80.2022.02.22.23.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:28:35 -0800 (PST)
Date: Wed, 23 Feb 2022 17:28:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 7/9] powerpc/pseries/vas: Reopen windows with DLPAR
 core add
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <a54ce2973c12602a73468446076115746fe71cf3.camel@linux.ibm.com>
In-Reply-To: <a54ce2973c12602a73468446076115746fe71cf3.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645601119.3ay9nmf9qs.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 6:01 am:
>=20
> VAS windows can be closed in the hypervisor due to lost credits
> when the core is removed and the kernel gets fault for NX
> requests on these in-active windows. If these credits are
> available later for core add, reopen these windows and set them
> active. When the OS sees page faults on these active windows,
> it creates mapping on the new paste address. Then the user space
> can continue to use these windows and send HW compression
> requests to NX successfully.

Just for my own ignorance, what happens if userspace does not get
another page fault on that window? Presumably when it gets a page
fault it changes to an available window and doesn't just keep
re-trying. So in what situation does it attempt to re-access a
faulting window?

Thanks,
Nick

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 91 +++++++++++++++++++++++++++-
>  1 file changed, 90 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index a297720bcdae..96178dd58adf 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -565,6 +565,88 @@ static int __init get_vas_capabilities(u8 feat, enum=
 vas_cop_feat_type type,
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
> +	if (!vcaps->nr_close_wins)
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
> +	if (vcaps->nr_close_wins > creds)
> +		mv_ents =3D vcaps->nr_close_wins - creds;
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
> +		win->win_type =3D caps->win_type;
> +		if (!--vcaps->nr_close_wins)
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
>  /*
>   * The hypervisor reduces the available credits if the LPAR lost core. I=
t
>   * means the excessive windows should not be active and the user space
> @@ -673,7 +755,14 @@ static int vas_reconfig_capabilties(u8 type)
>  	 * closed / reopened. Hold the vas_pseries_mutex so that the
>  	 * the user space can not open new windows.
>  	 */
> -	if (old_nr_creds >  new_nr_creds) {
> +	if (old_nr_creds <  new_nr_creds) {
> +		/*
> +		 * If the existing target credits is less than the new
> +		 * target, reopen windows if they are closed due to
> +		 * the previous DLPAR (core removal).
> +		 */
> +		rc =3D reconfig_open_windows(vcaps, new_nr_creds - old_nr_creds);
> +	} else {
>  		/*
>  		 * # active windows is more than new LPAR available
>  		 * credits. So close the excessive windows.
> --=20
> 2.27.0
>=20
>=20
>=20
