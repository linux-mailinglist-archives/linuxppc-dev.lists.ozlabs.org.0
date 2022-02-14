Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 463B34B3FBE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 03:42:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxpQd61Z1z3bbn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 13:42:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FZ765lD0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FZ765lD0; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxpPz0t0Wz2yfh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 13:41:26 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id
 k60-20020a17090a4cc200b001b932781f3eso8582506pjh.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 18:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=z7kShygQGpUZ+981WdwwM+bjxkSwThliigTgcgZ4q8Y=;
 b=FZ765lD0sJGFCpm3+Jb7CNLNzVKB5MradNNPr/6q7MCgQJP5FdYx2y5U2d7cptTRyr
 H7I+Vy8wr0sy6NHM40+U8rgeiriCwJlw57u608Kfbnf2NESJTKpTFGFeEMhcNjojOd21
 DXvgNoAt4a0Fn8mCWFtgsZnqaX26GDFu/QpUNL63Qw9KBcrtcM4VAaFywh5xiyAGL9gN
 W8+ytecjbdV69CiEMTUPEaqAdHlcsVgq6k1Ufb9BFksVFvyigZmErgoyaocJluo6qpwK
 OPrccIVVtz1BMj4UJfa7eib6bLA+FQtf46i/u7ZJECyjV83K9YufUlAYlLCsvO+poozH
 ZzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=z7kShygQGpUZ+981WdwwM+bjxkSwThliigTgcgZ4q8Y=;
 b=HWrjC13vlTRCT84qwwL6uEUPgxh8b7mJ58qjhN3wve004RehUxahARRF95CRv9JsZM
 5lbXBRUV6peUEAo0Qpnxg3L2cnH0gTmM8Po6NutIDkZmyUQABwC1vyCxU76dR2ySf7SP
 RC+hm3xFZJtFabIdwP+qZmVn81/7aVWRp2LG54btzFM7Pty538Rss/xf0cJPIdIsyhSo
 EiJkcvCwSeFPNpKNMaOU89hv4Wir70+d+IkIPU4OiSScomTjaEXJ0Zst38ZJXIYkqYJs
 rGYWTyzVGn1QM8ni+crCjH7Y0tc+C7gJ5nCYJbi1GF3Nv7t3hNlOqv9EH5eSzNGsANBO
 DgOA==
X-Gm-Message-State: AOAM531mMRQeas7B9OKM3Wp6E8TqG/GRxAwUK7lNnkZGlwtM+ljZMdif
 PKL4AS3KTSMkK9TrFf2UrWXYuXLOaf5MnA==
X-Google-Smtp-Source: ABdhPJx6jfaw+WQ7DzhRBMPuvo+vTWOEb8QTwNegf6e8kDIFxsJbDX5HhrAJ7dPkAbSv5zrr1pEGaQ==
X-Received: by 2002:a17:903:3009:: with SMTP id
 o9mr12255023pla.163.1644806483690; 
 Sun, 13 Feb 2022 18:41:23 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id y42sm34247303pfa.5.2022.02.13.18.41.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 18:41:23 -0800 (PST)
Date: Mon, 14 Feb 2022 12:41:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 03/10] powerpc/pseries/vas: Save LPID in
 pseries_vas_window struct
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <df3c8452ec619744bdd5a0fde901645537c1b7b4.camel@linux.ibm.com>
In-Reply-To: <df3c8452ec619744bdd5a0fde901645537c1b7b4.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644805860.xhvkad4duc.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of January 22, 2022 5:55 am:
>=20
> The kernel sets the VAS window with partition PID when is opened in
> the hypervisor. During DLPAR operation, windows can be closed and
> reopened in the hypervisor when the credit is available. So saves
> this PID in pseries_vas_window struct when the window is opened
> initially and reuse it later during DLPAR operation.

This probably shouldn't be called lpid, while you're changing it.
"partition PID" and "LPAR PID" is also confusing. I know the name
somewhat comes from the specifiction, but pid/PID would be fine,
it's clear we are talking about "this LPAR" when in pseries code.

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 7 ++++---
>  arch/powerpc/platforms/pseries/vas.h | 1 +
>  2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c
> b/arch/powerpc/platforms/pseries/vas.c
> index d2c8292bfb33..2ef56157634f 100644
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
> @@ -115,7 +114,7 @@ static int h_modify_vas_window(struct
> pseries_vas_window *win)
>  	 */
>  	do {
>  		rc =3D plpar_hcall_norets(H_MODIFY_VAS_WINDOW,
> -					win->vas_win.winid, lpid, 0,
> +					win->vas_win.winid, win->lpid,
> 0,
>  					VAS_MOD_WIN_FLAGS, 0);
> =20
>  		rc =3D hcall_return_busy_check(rc);
> @@ -125,7 +124,7 @@ static int h_modify_vas_window(struct
> pseries_vas_window *win)
>  		return 0;
> =20
>  	pr_err("H_MODIFY_VAS_WINDOW error: %ld, winid %u lpid %u\n",
> -			rc, win->vas_win.winid, lpid);
> +			rc, win->vas_win.winid, win->lpid);
>  	return -EIO;
>  }
> =20
> @@ -338,6 +337,8 @@ static struct vas_window *vas_allocate_window(int
> vas_id, u64 flags,
>  		}
>  	}
> =20
> +	txwin->lpid =3D mfspr(SPRN_PID);
> +
>  	/*
>  	 * Allocate / Deallocate window hcalls and setup / free IRQs
>  	 * have to be protected with mutex.
> diff --git a/arch/powerpc/platforms/pseries/vas.h
> b/arch/powerpc/platforms/pseries/vas.h
> index fa7ce74f1e49..0538760d13be 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -115,6 +115,7 @@ struct pseries_vas_window {
>  	u64 domain[6];		/* Associativity domain Ids */
>  				/* this window is allocated */
>  	u64 util;
> +	u32 lpid;

Comment could be "PID associated with this window".

BTW, is the TID parameter deprecated? Doesn't seem that we use that.

Thanks,
Nick
