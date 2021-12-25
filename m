Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 893FC47F2F5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 11:23:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLg4V2Vx6z307B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 21:23:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dgUfnVEY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=dgUfnVEY; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLg3m3g37z2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 21:22:42 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id i6so2049504pla.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 02:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=zABYTDkRCXD7YnSXgmckKl0di++lyiV/wtKOsAFdCOU=;
 b=dgUfnVEYoIapnOPCJtUrxkMGMD/CuvqBZMI09usIzRTm0Uc2X6cDr0VOValV3AdNbK
 suvBbVrDCtUHTO2t4a9+ttMSI11kJB40HTfM4vW9I/Bpe0eh6HdHzWnjjkikgGAlZMpK
 f35XeVHPI9E8propq0NzZFh5yRu8H8etXkfPabNH7Ih42JdhqgycZRJbwyUwHG81tRM3
 XJfm5RB4/hjU78k2gtX5rwHehKBT8gCd+LdDjmTk887h1kx9Lc9jAw/m+oy4qAllq2DM
 4QuRXrCsrW6958ATkyRvgzD9Xpy/aqjLO4cWwKJm53tYeHEzo2EMcAsNiRccZG+4fxbe
 1pww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zABYTDkRCXD7YnSXgmckKl0di++lyiV/wtKOsAFdCOU=;
 b=MyV8Qc8CAf6micjJh7znLR9EVzE54I7h+NQX0L/kVh7jC1EPfaH6+8chBfb72BOU4b
 h42xdwEIvkXzqxl1Mt2gRQgTM+ybfUgOX9wo0wqOFIO0CMzPCfpW20M5v2jcKAJhtlOi
 7MtIsIObfpZ35ua8ztxX6K59u0TB+HFteEGa/wN28PHdR+NqmZmBAdqVtDVPH6wN6lQ8
 zvIMubG8J5EWI8fQO1RMygvjL2eiwflY25fqGqXNkhoek8Hyrv2jyzk8K5HjzzoKbcJ4
 QwxGXTbB78mXWrbkTbATMybzFhEcrKUd8E8yBploKl8voIrxaY3z97xzL9RdBmlOAXeR
 sByw==
X-Gm-Message-State: AOAM533Tt1jP1oe3w04+Rdv/gFnHIFQbKPd3cMpS5brE8gs+YL+JO1uA
 lsNgYnSgWw0jfNR/9bMteg4=
X-Google-Smtp-Source: ABdhPJxTkMdALYld74m+geG63p9dWNi1p2dnSIkU414Kd1BPqXanEBoDifWvzO2prhNFG7aFQRMNbw==
X-Received: by 2002:a17:90b:360e:: with SMTP id
 ml14mr12131878pjb.135.1640427759397; 
 Sat, 25 Dec 2021 02:22:39 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id k8sm12766668pfu.72.2021.12.25.02.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:22:39 -0800 (PST)
Date: Sat, 25 Dec 2021 20:22:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] KVM: PPC: Book3S HV: Free allocated memory if module
 init fails
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20211223211931.3560887-1-farosas@linux.ibm.com>
 <20211223211931.3560887-4-farosas@linux.ibm.com>
In-Reply-To: <20211223211931.3560887-4-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1640427594.mim1kqxpi8.astroid@bobo.none>
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
> The module's exit function is not called when the init fails, we need
> to do cleanup before returning.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 53400932f5d8..2d79298e7ca4 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -6065,7 +6065,7 @@ static int kvmppc_book3s_init_hv(void)
> =20
>  	r =3D kvm_init_subcore_bitmap();
>  	if (r)
> -		return r;
> +		goto err;
> =20
>  	/*
>  	 * We need a way of accessing the XICS interrupt controller,
> @@ -6080,7 +6080,8 @@ static int kvmppc_book3s_init_hv(void)
>  		np =3D of_find_compatible_node(NULL, NULL, "ibm,opal-intc");
>  		if (!np) {
>  			pr_err("KVM-HV: Cannot determine method for accessing XICS\n");
> -			return -ENODEV;
> +			r =3D -ENODEV;
> +			goto err;
>  		}
>  		/* presence of intc confirmed - node can be dropped again */
>  		of_node_put(np);
> @@ -6093,12 +6094,12 @@ static int kvmppc_book3s_init_hv(void)
> =20
>  	r =3D kvmppc_mmu_hv_init();
>  	if (r)
> -		return r;
> +		goto err;
> =20
>  	if (kvmppc_radix_possible()) {
>  		r =3D kvmppc_radix_init();
>  		if (r)
> -			return r;
> +			goto err;
>  	}
> =20
>  	r =3D kvmppc_uvmem_init();
> @@ -6111,6 +6112,12 @@ static int kvmppc_book3s_init_hv(void)
>  	kvmppc_hv_ops =3D &kvm_ops_hv;
> =20
>  	return 0;
> +
> +err:
> +	kvmhv_nested_exit();
> +	kvmppc_radix_exit();

These should both be callable without init functions succeeding
so this looks right to me.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

> +
> +	return r;
>  }
> =20
>  static void kvmppc_book3s_exit_hv(void)
> --=20
> 2.33.1
>=20
>=20
