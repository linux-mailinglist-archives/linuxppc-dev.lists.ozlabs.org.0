Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C48647F2F2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 11:20:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLg162Vnnz3c9T
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 21:20:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EViq9QyF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EViq9QyF; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLg0T5sy3z2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 21:19:53 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 l10-20020a17090a384a00b001b22190e075so8391636pjf.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 02:19:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Mmel+tedTB5YoX4P4ksLym5gFTM6R7kIIMKU3ZsytT4=;
 b=EViq9QyF5bkZ8SrPmK7akPsIuSMFVLwkKPcwN8h3cwazrkHAl4sWkYCw6+kOz4HVzK
 k9mtU3FFEye/DehlYSZaBhCmYxKotH4hsjUb6QFBTsdjwGRYCMri2AKIqqj7MMmfqN1L
 ETNBgVlCWpc7l4HTbYv8tc+RZLnFTcviGyYyndDKI5UVUQK57/vIlyfFxHud+gFAwrYL
 ACQMkuIahakpTeCj9mSugkxlcyhen70N0YApZxPw3w/HO/y0gtoiCR+UKo6dtRMdxEOa
 ofjwUVH877G+4OST3nxmcKRJCj3UxBEVF5FOa1Gfqs4uRh4Ip7Unj2T1UJq0GsVeJa5G
 kQXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Mmel+tedTB5YoX4P4ksLym5gFTM6R7kIIMKU3ZsytT4=;
 b=zTiJMlCKhYtV4mxoYdwKHK0/yDKKdjUcXIJceWMLh7KQQjjyvrXll44fICM1JsksGf
 nOVLyKFWx0PdQNzstvXli9waJoCEro2/fEbue+j6UXTd9OXABaeEZ836E924QUmihlX2
 Hl+zpIw0JXiZlL00Y366JIzVQVwgSH+tb9ZGUDC9pzf3V8+R3dc0ZEB5M8nxNllvrt0r
 evl+uO9lsrX23Ejx223bUbdkE8iqyNtMJJcIT3Lpb0MzZougvpjUeHoXqumaK+nxlW6p
 /IXvtcdaxft9aZjhZdrby2osJKpukywSGEhnH15dDgpALqXgjoLUJUOn+U01gyqawXjN
 36eQ==
X-Gm-Message-State: AOAM5305c5i566SapH+7YfAou8E+6GhX9S6PbbvVrGsSEkpOfnpEYbjd
 hLvhMeLMkUcpxnt0afUZSZjt0FWWAso=
X-Google-Smtp-Source: ABdhPJzsyc1mrnzfjOO4+nvy5y65RBO5OAbaQDrHXl6t4XfaFHAQtA3Nqvsmt3Kc3pe08E85BqMqIQ==
X-Received: by 2002:a17:90b:3b83:: with SMTP id pc3mr668375pjb.3.1640427591720; 
 Sat, 25 Dec 2021 02:19:51 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id u5sm12119210pfk.67.2021.12.25.02.19.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:19:51 -0800 (PST)
Date: Sat, 25 Dec 2021 20:19:46 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/3] KVM: PPC: Book3S HV: Delay setting of kvm ops
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20211223211931.3560887-1-farosas@linux.ibm.com>
 <20211223211931.3560887-3-farosas@linux.ibm.com>
In-Reply-To: <20211223211931.3560887-3-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1640427464.ji8lnut0io.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of December 24, 2021 7:19 am:
> Delay the setting of kvm_hv_ops until after all init code has
> completed. This avoids leaving the ops still accessible if the init
> fails.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>

Also looks okay to me but KVM init has lots of details. IIRC Alexey may=20
have run into a related issue with ops being set too early (or was it=20
cleared too late?)

Thanks,
Nick

> ---
>  arch/powerpc/kvm/book3s_hv.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 9f4765951733..53400932f5d8 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -6087,9 +6087,6 @@ static int kvmppc_book3s_init_hv(void)
>  	}
>  #endif
> =20
> -	kvm_ops_hv.owner =3D THIS_MODULE;
> -	kvmppc_hv_ops =3D &kvm_ops_hv;
> -
>  	init_default_hcalls();
> =20
>  	init_vcore_lists();
> @@ -6105,10 +6102,15 @@ static int kvmppc_book3s_init_hv(void)
>  	}
> =20
>  	r =3D kvmppc_uvmem_init();
> -	if (r < 0)
> +	if (r < 0) {
>  		pr_err("KVM-HV: kvmppc_uvmem_init failed %d\n", r);
> +		return r;
> +	}
> =20
> -	return r;
> +	kvm_ops_hv.owner =3D THIS_MODULE;
> +	kvmppc_hv_ops =3D &kvm_ops_hv;
> +
> +	return 0;
>  }
> =20
>  static void kvmppc_book3s_exit_hv(void)
> --=20
> 2.33.1
>=20
>=20
