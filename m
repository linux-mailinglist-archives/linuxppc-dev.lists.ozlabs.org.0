Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D845C4C0CE4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 08:00:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Rl913jgz3bV1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 18:00:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=X0VkdKRr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434;
 helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=X0VkdKRr; dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3RkT0nbCz30DX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:00:15 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id z16so14490739pfh.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 23:00:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=8akCTSsIwZkdvTC2e+zxcB6FJR27elQMvHWdwBq+R10=;
 b=X0VkdKRrcorzOtV/ILbu7xY7966XoZw3X4UZud7bVfFCnZG5yQy0UErXRGkyZ3TXPb
 quKRS782exktK6+j8zp1jfa0GtSWSp2pqC8ywmzgrGcxBqaEjI/33f9P+NmMUCa1C/aB
 BoDfpuiK0N4JSc3iABVnZXVE/hiOJ2Z/BSGG5pdiGTgWluRKnwXrjDMfcA1YN+LfAffv
 erD/pqLhzAg22L5I9iR0zNm3S+mJMbRthemIh2yVbYTW3ZTgace3+kC6qMlkPiZntYiE
 zLT8MAhJAWLTKLdflyeW17n6NUtZG9D5jMyvwGAhpVICTWM4katGsEr7bK7Def2Cv9O3
 c5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8akCTSsIwZkdvTC2e+zxcB6FJR27elQMvHWdwBq+R10=;
 b=kDJ4gX/6KzqwcEipvOH+iBxJku1GJi3j4ohmQlmV4fhEfwjT0Efb6o/x9IMUFGCdAb
 fV2CKq1lH7oKpSXsUQJR1Lj47ojcPaVagXn7MQtB6WwvlRT2KXZcmb+EhjXmC3S3r9Yf
 CzrnfmDQDf91m7DbBFdtUP0OfUrujRumwHoxOG6JCIikRXDB+NcKoF7qtmmHzSTgEArW
 d4otHeunCpvSzCdlS6gs7jogHXYHd93wBA1pQmDTZiqfCANVSFOiMR5PYb37JmaoRgh/
 10ffcSM7yO325+1kYSE+NUwBzBg/gQL9oP/S6mFhAGd4ewp6s8U7lgTyOud1kpIYyIG4
 KRkQ==
X-Gm-Message-State: AOAM533c+C5xBksdF3yjN+Jx1pEDUvinyuS3sFzkwoCQfGEvFjC5oSXu
 /uuUQCOME6QALvdplXlHWFs=
X-Google-Smtp-Source: ABdhPJyjZo2JCaufCt4tUi7X/7djH1gdz9Hlld9w6ZUgGrCbxRjkgN5vGQ/R8g5aJs7AK4zkcYECNw==
X-Received: by 2002:a63:7709:0:b0:36c:8c3c:1199 with SMTP id
 s9-20020a637709000000b0036c8c3c1199mr22617810pgc.580.1645599612506; 
 Tue, 22 Feb 2022 23:00:12 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id f8sm16616274pfv.100.2022.02.22.23.00.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:00:12 -0800 (PST)
Date: Wed, 23 Feb 2022 17:00:07 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 2/9] powerpc/pseries/vas: Save PID in
 pseries_vas_window struct
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <5f709998f609b477d9f975c32bef775f45e61185.camel@linux.ibm.com>
In-Reply-To: <5f709998f609b477d9f975c32bef775f45e61185.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645599574.ncjieunpqo.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 5:55 am:
>=20
> The kernel sets the VAS window with PID when it is opened in
> the hypervisor. During DLPAR operation, windows can be closed and
> reopened in the hypervisor when the credit is available. So saves
> this PID in pseries_vas_window struct when the window is opened
> initially and reuse it later during DLPAR operation.

Thanks for renaming it lpid->pid and adding the comment.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 9 +++++----
>  arch/powerpc/platforms/pseries/vas.h | 1 +
>  2 files changed, 6 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index 18aae037ffe9..1035446f985b 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -107,7 +107,6 @@ static int h_deallocate_vas_window(u64 winid)
>  static int h_modify_vas_window(struct pseries_vas_window *win)
>  {
>  	long rc;
> -	u32 lpid =3D mfspr(SPRN_PID);
> =20
>  	/*
>  	 * AMR value is not supported in Linux VAS implementation.
> @@ -115,7 +114,7 @@ static int h_modify_vas_window(struct pseries_vas_win=
dow *win)
>  	 */
>  	do {
>  		rc =3D plpar_hcall_norets(H_MODIFY_VAS_WINDOW,
> -					win->vas_win.winid, lpid, 0,
> +					win->vas_win.winid, win->pid, 0,
>  					VAS_MOD_WIN_FLAGS, 0);
> =20
>  		rc =3D hcall_return_busy_check(rc);
> @@ -124,8 +123,8 @@ static int h_modify_vas_window(struct pseries_vas_win=
dow *win)
>  	if (rc =3D=3D H_SUCCESS)
>  		return 0;
> =20
> -	pr_err("H_MODIFY_VAS_WINDOW error: %ld, winid %u lpid %u\n",
> -			rc, win->vas_win.winid, lpid);
> +	pr_err("H_MODIFY_VAS_WINDOW error: %ld, winid %u pid %u\n",
> +			rc, win->vas_win.winid, win->pid);
>  	return -EIO;
>  }
> =20
> @@ -338,6 +337,8 @@ static struct vas_window *vas_allocate_window(int vas=
_id, u64 flags,
>  		}
>  	}
> =20
> +	txwin->pid =3D mfspr(SPRN_PID);
> +
>  	/*
>  	 * Allocate / Deallocate window hcalls and setup / free IRQs
>  	 * have to be protected with mutex.
> diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platform=
s/pseries/vas.h
> index d6ea8ab8b07a..2872532ed72a 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -114,6 +114,7 @@ struct pseries_vas_window {
>  	u64 domain[6];		/* Associativity domain Ids */
>  				/* this window is allocated */
>  	u64 util;
> +	u32 pid;		/* PID associated with this window */
> =20
>  	/* List of windows opened which is used for LPM */
>  	struct list_head win_list;
> --=20
> 2.27.0
>=20
>=20
>=20
