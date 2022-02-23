Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0A24C0D14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 08:12:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3S0Y3gJDz3cNH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 18:12:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iU3vjE8g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=iU3vjE8g; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3Rzw0s27z30NP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:11:53 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id x11so17832122pll.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 23:11:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=V/Le1+OnWCqfL8uhhA8iYD6H0GRQLOXY9fbzyZ30V3U=;
 b=iU3vjE8gsGjdjERCBuxJDTkPXM6NffjpPCMKghb4faflLWCyUU5WPLr4XQMj4R/AOU
 gOAz4GYFeivFj984FhT9Wk37uup5XlNI50iBua3C76J8OVWY+o8aMc1c3zdOGZ2fLj3l
 jFqtYcqnj5vJCnH5+8T+g9RJXuw1472rMNeMpS91PXGWMssO+PgdUY6A94JLqovllCne
 QADQnxqBk5we7oGNfpPSdtpAIDfXX9Woeb2soDJeAk2ynubjZSBu7XWZNgi6AalcMY8x
 RQbhA73PxAAlKCyaYvSNRXXQiTLN4y/P/QMrrYgAhXcdhyR1dnCQHrwg5zCyTVJGMp2p
 rY1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=V/Le1+OnWCqfL8uhhA8iYD6H0GRQLOXY9fbzyZ30V3U=;
 b=BuHK9BePdBOKmp7A2V3SP30jmLxyzPWKqKhIUWcUPFsdqvL/l2n4XMU/be/KpafBgV
 Iq4zajye+Y7bkWIdkaZEMysYVbw9DVBEiRiDLU7DmpfbtOWZ8i+a1O/Jj+hyJ5jo2kGs
 6CicqnCgVH2k5+930GPYgCbw12SlBT/gHcOYLu57kg7wJFIVMAs/NZ8RxcJB/z5v0l4O
 KoENMogscGlL2ru8Jirni+oj/ExFm4oasU6/0BWDrB8GQyk2r8dMMfdieE8KqXaBjXK1
 nWHzIxGAl/Oa1l/SfcTdVM1g/n+pPGnC8HGcWnfOCDwFO+3Q47gmOuXbOk6tcK1rHKvz
 tTIw==
X-Gm-Message-State: AOAM530mJe4XR7b+joBHja7yyAHL0wHZ7PhCbK9OOdGq9HdFRM1dL3+K
 N2egvAc2LcrFBUY5S9haFAAT98sz1orRZw==
X-Google-Smtp-Source: ABdhPJx6mEN51GFsAW5UNVnWego7QNjT6pn4BicuKCouz9nKJeAdD0ANmyluDtYqprP1lqWgDNG5cw==
X-Received: by 2002:a17:90a:2c0c:b0:1b9:fa47:1caf with SMTP id
 m12-20020a17090a2c0c00b001b9fa471cafmr7929660pjd.34.1645600311618; 
 Tue, 22 Feb 2022 23:11:51 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id t1sm20336600pfj.115.2022.02.22.23.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:11:51 -0800 (PST)
Date: Wed, 23 Feb 2022 17:11:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 5/9] powerpc/vas: Map paste address only if window is
 active
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <2a2cac9d210f5a79b3db0adfb92a92525c6287b6.camel@linux.ibm.com>
In-Reply-To: <2a2cac9d210f5a79b3db0adfb92a92525c6287b6.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645600074.ct2ke47u09.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of February 20, 2022 5:59 am:
>=20
> The paste address mapping is done with mmap() after the window is
> opened with ioctl. If the window is closed by OS in the hypervisor
> due to DLPAR after this mmap(), the paste instruction returns

I don't think the changelog was improved here.

The window is closed by the OS in response to a DLPAR operation
by the hypervisor? The OS can't be in the hypervisor.


> failure until the OS reopens this window again. But before mmap(),
> DLPAR core removal can happen which causes the corresponding
> window in-active. So if the window is not active, return mmap()
> failure with -EACCES and expects the user space reissue mmap()
> when the window is active or open a new window when the credit
> is available.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/book3s/vas-api.c | 20 +++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index f3e421511ea6..eb4489b2b46b 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -496,10 +496,26 @@ static int coproc_mmap(struct file *fp, struct vm_a=
rea_struct *vma)
>  		return -EACCES;
>  	}
> =20
> +	/*
> +	 * The initial mmap is done after the window is opened
> +	 * with ioctl. But before mmap(), this window can be closed in
> +	 * the hypervisor due to lost credit (core removal on pseries).
> +	 * So if the window is not active, return mmap() failure with
> +	 * -EACCES and expects the user space reissue mmap() when it
> +	 * is active again or open new window when the credit is available.
> +	 */
> +	mutex_lock(&txwin->task_ref.mmap_mutex);
> +	if (txwin->status !=3D VAS_WIN_ACTIVE) {
> +		pr_err("%s(): Window is not active\n", __func__);
> +		rc =3D -EACCES;
> +		goto out;
> +	}
> +
>  	paste_addr =3D cp_inst->coproc->vops->paste_addr(txwin);
>  	if (!paste_addr) {
>  		pr_err("%s(): Window paste address failed\n", __func__);
> -		return -EINVAL;
> +		rc =3D -EINVAL;
> +		goto out;
>  	}
> =20
>  	pfn =3D paste_addr >> PAGE_SHIFT;
> @@ -519,6 +535,8 @@ static int coproc_mmap(struct file *fp, struct vm_are=
a_struct *vma)
>  	txwin->task_ref.vma =3D vma;
>  	vma->vm_ops =3D &vas_vm_ops;
> =20
> +out:
> +	mutex_unlock(&txwin->task_ref.mmap_mutex);

Did we have an explanation or what mmap_mutex is protecting? Sorry if=20
you explained it and I forgot -- would be good to have a small comment
(what is it protecting against).

Thanks,
Nick
