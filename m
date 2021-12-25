Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E881C47F2DF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 11:12:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JLfqS6N9Pz3050
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Dec 2021 21:12:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fCOlEI4m;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fCOlEI4m; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JLfpn53kjz2ynj
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 21:11:29 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id w7so7517918plp.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Dec 2021 02:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0YHu/2JD1es6X2xdXKLmtOf+SLMnQKDA9EbCF6bIP2M=;
 b=fCOlEI4mu4NkFmdf2hu9TCYO1HJNFLtCoxA9r+vZO+DG1SSOnwjlGHZvsRgCrvoCcv
 sWL4e25EUSEfv9bfXQH40djFCX5czSWtOWDo01D5KuQ5SntxvsAa55DED2updJlXXHlD
 8beWWFDTabFrl2rtgggKteEa1ltjWix8gRnccqXi3dLHSheFz+7kMmFDHvt88f8oFiXU
 zSL/gK5a9Qv/7aNpbsdDdIYMTyq1ow+nri5EE4FWPrDBzaeBCU1MUjA1LkihJ4KexCEw
 1PNaPWqGQG8N5LLt02RbSursavIf8k9m+5ipO70qyOCNblU2Xd+Mt1hqow24l5pEowjT
 iq6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0YHu/2JD1es6X2xdXKLmtOf+SLMnQKDA9EbCF6bIP2M=;
 b=Yv6YW+lBHF6l2T2ZZUXR3AiVb+Olq9wNW1dptVZLHGOF5GYiLqi/ouBy9oCPLT2LXj
 ZqSvUs36etCSVFhWWW4Jz7K6KUI/LRghGW8bmnsdLs6NdHYH7p9kARIppXv6qyhe08L9
 mnmoQSRJmmUCFnHf0oavYCMG8CRejbR+ksjXpbyU0/N4roE+mvNc3K62zpOUq+Gksogc
 5nWj17Rp0IIdztchlvIAkFYt6bD1Xr+GrMMBqVgsHbbJ9+BbGJMbAOcI2VWXn7EPB4g3
 pHtvxxablZZiM0gpepaf0cdrU5ddkIBEsE2irNXHydDgk0alZE2WoJuA1pml2TU6hO73
 bMfw==
X-Gm-Message-State: AOAM530lUzSnrruQ5k+ivl8pS4onIC74YIj2JUpaa8HXpFzmH80yyLq4
 NJKHmo3tT8M2egHEFTHn+aw=
X-Google-Smtp-Source: ABdhPJzs50zsQcRFLgvW45AQ26iOkp3IR2DKgvclOIjicDOFtboSMD/4oGY6K2nqq+XWQfbHgOH8Xg==
X-Received: by 2002:a17:90a:9a8a:: with SMTP id
 e10mr11778732pjp.145.1640427086981; 
 Sat, 25 Dec 2021 02:11:26 -0800 (PST)
Received: from localhost (121-44-67-22.tpgi.com.au. [121.44.67.22])
 by smtp.gmail.com with ESMTPSA id om3sm13632155pjb.49.2021.12.25.02.11.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Dec 2021 02:11:26 -0800 (PST)
Date: Sat, 25 Dec 2021 20:11:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/3] KVM: PPC: Book3S HV: Stop returning internal values
 to userspace
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20211223211528.3560711-1-farosas@linux.ibm.com>
 <20211223211528.3560711-2-farosas@linux.ibm.com>
In-Reply-To: <20211223211528.3560711-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1640427040.a29n3heze5.astroid@bobo.none>
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of December 24, 2021 7:15 am:
> Our kvm_arch_vcpu_ioctl_run currently returns the RESUME_HOST values
> to userspace, against the API of the KVM_RUN ioctl which returns 0 on
> success.
>=20
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
> This was noticed while enabling the kvm selftests for powerpc. There's
> an assert at the _vcpu_run function when we return a value different
> from the expected.

That's nasty. Looks like qemu never touches the return value except if
it was < 0, so hopefully should be okay.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kvm/powerpc.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index a72920f4f221..1e130bb087c4 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -1849,6 +1849,14 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
>  #ifdef CONFIG_ALTIVEC
>  out:
>  #endif
> +
> +	/*
> +	 * We're already returning to userspace, don't pass the
> +	 * RESUME_HOST flags along.
> +	 */
> +	if (r > 0)
> +		r =3D 0;
> +
>  	vcpu_put(vcpu);
>  	return r;
>  }
> --=20
> 2.33.1
>=20
>=20
