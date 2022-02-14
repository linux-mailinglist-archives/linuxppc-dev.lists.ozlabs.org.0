Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BD24B4030
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxqJ72Q1Hz3cN4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 14:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=UcEFwnLU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d;
 helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=UcEFwnLU; dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxqHW1xFPz2xX8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 14:20:55 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id z17so9475255plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 19:20:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=RpX6E2RwDaApkSd3LLYEUgJFFDze+4HxaPyxK3XF+EU=;
 b=UcEFwnLUjJafPiLMLHc6wTj9LxBnxVTBwzxED9fXUF+HdF2B5dPfkwB7A+Yf4WgQbg
 YiPF4o+5dtIujMxK2FwnNKpo0BG/bo34pQW+ammFSDd0+2Gx51digeUvmkBYcmbF1Ruo
 I3pkZrKFGiFEC0TWTsOsO1bG3UaYpIH19pKEzVcFxB+OwVErzt/9MoZlqXMRxHphRioB
 HzwTFp1fXgDTmDGSaoPlgFXMrH1lP/ftPZGruuEx5ILtC3QwFFHor8j7E6JH9kORXEwW
 lTYxfMWeBHMyWeHe/UoghwaYlT1McfO6dhCi4JrwdaL7zK4tKyS9QfPyohFlsjsA288C
 rGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=RpX6E2RwDaApkSd3LLYEUgJFFDze+4HxaPyxK3XF+EU=;
 b=4XsnGN7FJnznRKuH9ClWbnT1Z2NYPIqlie+LTMn/usnAH6gDcxRlh80Nnt/vOD3JU4
 BAYJphX/aoZJ4ITa0CMtdOANNPnMC7E2pSp+PuRJhpPzxcLosGzvLLIBMxqHAe0jGDGP
 pls3o1yfeQCI5wi9wB0FxMhwV9fbI2iQKwbksZWULylTouO9i/0mQ9tRPqFREJTPxrFp
 MXRZIhZCpBplwuehvuiqmzI47dFFHVuEwfYtc8jTv+XKePoxnJp2wkO0n35gcuv09YES
 psl23/9FgJD7kXGvF3o0+NX2cfZhS6LMc7EJzGEp9vqx5rfUwouIbrys+Flb9rdCvk2k
 7lNA==
X-Gm-Message-State: AOAM533KZ+pxyDv8U9ShzrGuFLa6UT9uIU72F88ALV37WkkTglHJJVoI
 u063dV2XvlxTJF7whak+lo0=
X-Google-Smtp-Source: ABdhPJxObjSRO3nxmGti84PjfmoVVyRdQw9HeslI34Lz02vJgmz66Fj3LmtIT5lciFYHzO0TWT/FsA==
X-Received: by 2002:a17:902:b189:: with SMTP id
 s9mr3911792plr.36.1644808852532; 
 Sun, 13 Feb 2022 19:20:52 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id d13sm13999170pfj.205.2022.02.13.19.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 19:20:52 -0800 (PST)
Date: Mon, 14 Feb 2022 13:20:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 06/10] powerpc/vas: Map paste address only if window is
 active
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <4ecd08a1b92590d6220920245c23526a68dc531c.camel@linux.ibm.com>
In-Reply-To: <4ecd08a1b92590d6220920245c23526a68dc531c.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644808630.pfiol54rgg.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of January 22, 2022 5:58 am:
>=20
> The paste address mapping is done with mmap() after the window is
> opened with ioctl. But the window can be closed due to lost credit
> due to core removal before mmap(). So if the window is not active,
> return mmap() failure with -EACCES and expects the user space reissue
> mmap() when the window is active or open new window when the credit
> is available.
>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/book3s/vas-api.c | 21 ++++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index a63fd48e34a7..2d06bd1b1935 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -379,10 +379,27 @@ static int coproc_mmap(struct file *fp, struct vm_a=
rea_struct *vma)
>  		return -EACCES;
>  	}
> =20
> +	/*
> +	 * The initial mapping is done after the window is opened
> +	 * with ioctl. But this window might have been closed
> +	 * due to lost credit (core removal on PowerVM) before mmap().

What does "initial mapping" mean?

mapping ~=3D mmap, in kernel speak.

You will have to differentiate the concepts.

> +	 * So if the window is not active, return mmap() failure
> +	 * with -EACCES and expects the user space reconfigure (mmap)
> +	 * window when it is active again or open new window when
> +	 * the credit is available.
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
> @@ -401,6 +418,8 @@ static int coproc_mmap(struct file *fp, struct vm_are=
a_struct *vma)
> =20
>  	txwin->task_ref.vma =3D vma;
> =20
> +out:
> +	mutex_unlock(&txwin->task_ref.mmap_mutex);

If the hypervisor can revoke a window at any point with DLPAR, it's not=20
clear *why* this is needed. The hypervisor could cause your window to=20
close right after this mmap() returns, right? So an explanation for=20
exactly what this patch is needed for beyond that would help.

Thanks,
Nick
