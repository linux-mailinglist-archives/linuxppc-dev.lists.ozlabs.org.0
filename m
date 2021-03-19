Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B09E34122C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 02:35:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1mgc0Mbwz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:35:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=EtZ8Z1Lj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431;
 helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=EtZ8Z1Lj; dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1mg85qL8z2yyv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 12:35:32 +1100 (AEDT)
Received: by mail-pf1-x431.google.com with SMTP id 11so4749370pfn.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 18:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=bCPOnnCu04BjIlPujNpmwrArUIiCcqvZ5KiZA4QYua4=;
 b=EtZ8Z1LjTyVKFmhmyxr6nLayeEagbInan/1gA6U+jmO1PvpHpETEk8gB+MbWAdLPII
 BjWAkHFtUqJ7P/ej/XerRB8ia56IJSYU9GL1HlMyYoym+/LwfG6cowG/L0vkNZ9aeOcu
 tFUvC91+9a7JNJa6pM0t2UNUGK/6namvjw1SUjDcNE9JMUwTymZCRYKcmLmQumkQs3tp
 py7rJZ7spHuPITe2+b7JxYtIAZ4Lz5jg+anuz03yogv8LRycySI/JaDuj5H/YSmHnU7f
 J6owHL/1bY878YyVQnWSFiby5by5Nt2OxQlk8CEoKiDP6w4BQ8BE6bCBARPCxugD2O03
 GX8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=bCPOnnCu04BjIlPujNpmwrArUIiCcqvZ5KiZA4QYua4=;
 b=kHmP1W6yVv6UXmkmr38UpbkmszjoQ6a/BMdHGB279mWEry6CHo+a9B95IxCtXdRied
 pP7JjvjEW/YboynM3SzlErwtXZWxmgL3iDjBxitsYjFGuSasOaR/HPl60im6DEwL8NON
 ni1+8xX3l86eRdplyoigkPrUYxOgDFfun1U/1tOyocPd/vw5I9NQxtF6b7F9Dw6hIKOy
 Oj4OIFj8qw4ydz0SYbPH1vr3vHfTqSTy3cqzCtcV93rWIUQnjCEGC2qQNA7IO4nZzvkU
 tvZ+kZ/ahzuYJQFUzRY38G2tozVt7QIubjirCxpQSwv35Vdf70XUTWrvmRFTCtBr5eur
 qjRg==
X-Gm-Message-State: AOAM533sRkahFxKW4ZKCLKv+D/JbLdbrn3Qyj82S83Q8nmm9+28k4RAb
 pQTxhv3P4h+m03DsbeGFRxA=
X-Google-Smtp-Source: ABdhPJx+BJbFo6gpnUEFwLb6O8Nh00TsgkhCeXEnECN2xdRmywaFXG30kWveyVOAn46OC0iJ6r4g7A==
X-Received: by 2002:a63:f754:: with SMTP id f20mr9094145pgk.382.1616117729069; 
 Thu, 18 Mar 2021 18:35:29 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id q95sm3643901pjq.20.2021.03.18.18.35.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 18:35:28 -0700 (PDT)
Date: Fri, 19 Mar 2021 11:35:21 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 3/8] powerpc/head-64: do less gas-specific stuff with
 sections
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 llvmlinux@lists.linuxfoundation.org
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-4-dja@axtens.net>
In-Reply-To: <20210225031006.1204774-4-dja@axtens.net>
MIME-Version: 1.0
Message-Id: <1616117567.yp42753pbq.astroid@bobo.none>
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

Excerpts from Daniel Axtens's message of February 25, 2021 1:10 pm:
> Reopening the section without specifying the same flags breaks
> the llvm integrated assembler. Don't do it: just specify all the
> flags all the time.

I don't have a problem with this but llvm might want to track the issue=20
if it aims to be compatible with gas if you haven't alread opened an=20
issue.

When you fix the patch (perhaps add a quick comment as well?), then

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

>=20
> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>  arch/powerpc/include/asm/head-64.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/head-64.h b/arch/powerpc/include/as=
m/head-64.h
> index 4cb9efa2eb21..7d8ccab47e86 100644
> --- a/arch/powerpc/include/asm/head-64.h
> +++ b/arch/powerpc/include/asm/head-64.h
> @@ -15,10 +15,10 @@
>  .macro define_data_ftsec name
>  	.section ".head.data.\name\()","a",@progbits
>  .endm
> -.macro use_ftsec name
> -	.section ".head.text.\name\()"
> -.endm
> -
> +//.macro use_ftsec name
> +//	.section ".head.text.\name\()"
> +//.endm
> +#define use_ftsec define_ftsec
>  /*
>   * Fixed (location) sections are used by opening fixed sections and emit=
ting
>   * fixed section entries into them before closing them. Multiple fixed s=
ections
> --=20
> 2.27.0
>=20
>=20
