Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034FF4B3F39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 03:15:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxnqg3YcDz3bP9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 13:15:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qfCXD8Uq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f;
 helo=mail-pj1-x102f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qfCXD8Uq; dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jxnq33w7Yz30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 13:14:37 +1100 (AEDT)
Received: by mail-pj1-x102f.google.com with SMTP id m7so13195943pjk.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 18:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=xrtoLJ5J549pujtiwpbIbMkZnhiuCZ4WzmBRZ6hluNQ=;
 b=qfCXD8UqUusIAyujfYGuYuZR9gqfK4vC6rk+lJnuyYrOVBMg795Ic+M0baZcdDJrSZ
 mmyOiZ0gms3FzRuD5X3isi3JnvQeIqWsdeiXKyCvuevKcMuL/4AjW8XyqNCv7Fj2wML1
 3kfYxlXzEfYbPiwUeg5V+ZREUyDba8otD2SbDTYo7vLLtE/9Bld1PejKVZw6AorAolW7
 ns6L8dXeOjftycJm5MAorC3McizxSIZEBwsD4uk9Agi5dq1xcuaMYPin2Ad7cHAc9wbw
 cQAhD3i/+r5ReUxcx/tP8BnAmmzPA83qESynPtq3p4WEuYpCDs7oROwC3lIb499ErD7K
 2imQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=xrtoLJ5J549pujtiwpbIbMkZnhiuCZ4WzmBRZ6hluNQ=;
 b=QzQmX+xNGPHbwJ5LjMS09YRVK5ylBzBHw/l+8YHRrCFAzF0GDAq9hdDHCYVWAu5ZAf
 xwjGmuMsqxw8A8sHi3YOgFsfWcvXGsTMyIYzcIh0idx/zs85TGy2rAzqweNoRC2VNRir
 v8CH37PvDh9pfz7bLNSdwQIaMXJRUDdAuxljOokgpU2Aoll23QWheJG46oUyHJCeMv/u
 eGIfzZUgJgifXyNoxP95/TfGOl61aldVIblgVMM/IQVUlqqL+Vjv8mgb5uA8tmdXBYW0
 wVtQBwBNJt7FjSKFRoDrov+QJXczKMRCABifEm4sfQ9Y9InuyTX6AmyzLwAww3+CI347
 uD4w==
X-Gm-Message-State: AOAM532ebA6ulQhovNiD/9fvXYPjDw6Ny2us1ZKRdkiltE6lX7xPdVGB
 4w45w/IQtY3GrIvBV3nZan8=
X-Google-Smtp-Source: ABdhPJzhLPY+sMauUUlclRcl/HP8uzc48vmjc2y/Vc0XTE6eYnO9qSrExCmjy2nnIKxnGw9i/jCp7g==
X-Received: by 2002:a17:90a:f0d4:: with SMTP id
 fa20mr12165934pjb.1.1644804874736; 
 Sun, 13 Feb 2022 18:14:34 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id x12sm24281249pgp.25.2022.02.13.18.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 18:14:34 -0800 (PST)
Date: Mon, 14 Feb 2022 12:14:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 01/10] powerpc/pseries/vas: Use common names in VAS
 capability structure
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <1de60767b71bcc714cf613ff8f660afc430a0720.camel@linux.ibm.com>
In-Reply-To: <1de60767b71bcc714cf613ff8f660afc430a0720.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644804791.k88oankrue.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of January 22, 2022 5:54 am:
>=20
> target/used/avail_creds provides credits usage to user space via
> sysfs and the same interface can be used on PowerNV in future.
> Remove "lpar" from these names so that applicable on both PowerVM
> and PowerNV.

But not in this series? This is just to save you having to do more
renaming later?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>=20
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 10 +++++-----
>  arch/powerpc/platforms/pseries/vas.h |  6 +++---
>  2 files changed, 8 insertions(+), 8 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platform=
s/pseries/vas.c
> index d243ddc58827..c0737379cc7b 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -310,8 +310,8 @@ static struct vas_window *vas_allocate_window(int vas=
_id, u64 flags,
> =20
>  	cop_feat_caps =3D &caps->caps;
> =20
> -	if (atomic_inc_return(&cop_feat_caps->used_lpar_creds) >
> -			atomic_read(&cop_feat_caps->target_lpar_creds)) {
> +	if (atomic_inc_return(&cop_feat_caps->used_creds) >
> +			atomic_read(&cop_feat_caps->target_creds)) {
>  		pr_err("Credits are not available to allocate window\n");
>  		rc =3D -EINVAL;
>  		goto out;
> @@ -385,7 +385,7 @@ static struct vas_window *vas_allocate_window(int vas=
_id, u64 flags,
>  	free_irq_setup(txwin);
>  	h_deallocate_vas_window(txwin->vas_win.winid);
>  out:
> -	atomic_dec(&cop_feat_caps->used_lpar_creds);
> +	atomic_dec(&cop_feat_caps->used_creds);
>  	kfree(txwin);
>  	return ERR_PTR(rc);
>  }
> @@ -445,7 +445,7 @@ static int vas_deallocate_window(struct vas_window *v=
win)
>  	}
> =20
>  	list_del(&win->win_list);
> -	atomic_dec(&caps->used_lpar_creds);
> +	atomic_dec(&caps->used_creds);
>  	mutex_unlock(&vas_pseries_mutex);
> =20
>  	put_vas_user_win_ref(&vwin->task_ref);
> @@ -521,7 +521,7 @@ static int __init get_vas_capabilities(u8 feat, enum =
vas_cop_feat_type type,
>  	}
>  	caps->max_lpar_creds =3D be16_to_cpu(hv_caps->max_lpar_creds);
>  	caps->max_win_creds =3D be16_to_cpu(hv_caps->max_win_creds);
> -	atomic_set(&caps->target_lpar_creds,
> +	atomic_set(&caps->target_creds,
>  		   be16_to_cpu(hv_caps->target_lpar_creds));
>  	if (feat =3D=3D VAS_GZIP_DEF_FEAT) {
>  		caps->def_lpar_creds =3D be16_to_cpu(hv_caps->def_lpar_creds);
> diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platform=
s/pseries/vas.h
> index 4ecb3fcabd10..fa7ce74f1e49 100644
> --- a/arch/powerpc/platforms/pseries/vas.h
> +++ b/arch/powerpc/platforms/pseries/vas.h
> @@ -72,9 +72,9 @@ struct vas_cop_feat_caps {
>  	};
>  	/* Total LPAR available credits. Can be different from max LPAR */
>  	/* credits due to DLPAR operation */
> -	atomic_t	target_lpar_creds;
> -	atomic_t	used_lpar_creds; /* Used credits so far */
> -	u16		avail_lpar_creds; /* Remaining available credits */
> +	atomic_t	target_creds;
> +	atomic_t	used_creds;	/* Used credits so far */
> +	u16		avail_creds;	/* Remaining available credits */
>  };
> =20
>  /*
> --=20
> 2.27.0
>=20
>=20
>=20
