Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDA834A15B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 07:03:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6BGv6Rknz3bpS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 17:03:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=OIUEqK7S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=OIUEqK7S; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6BGR60SRz30Cb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 17:02:52 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id l3so4163723pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Mar 2021 23:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=Hs9OgF31bMON2rPAD0tIeR6wNV10U38bJiGXIHf5UOw=;
 b=OIUEqK7S1YRl3jUepx5bdUjpwjMzjf1s9/+ifSprr+jrcdJknDJ9DcFvV7/lqoD7vy
 454f8j+EdYyEUe4+8vtnY90vxaz+y44BjNZZ+KxIwikxHnpYodTCmjrkOTR9qs5B8xgL
 zqePz9LzrIFdmsCx0V6Um+qv0rLC7209kDvNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=Hs9OgF31bMON2rPAD0tIeR6wNV10U38bJiGXIHf5UOw=;
 b=aGRaZSrSr4ow/Oskzv4iN39tOiU8xg087EEDe2bmX/bbk9ydUvYM9npB1iFzcWaIMz
 iOuGD20IGizg16UgqRsW0wi0MW6iTip0RF/gCwWB5+iOvOW5wCgrKDZjqj0DnxIbUTLL
 FHgTbahhKTk9ZABEX5rQ7sMSE22TN0QAE4HPWHG9lsddy4q45O/FN8/HW6SD5+cfYdW8
 JUsvta9ZCh6bTLZ/z0wR4ywHHKByIfBWTi5o/PDiAozUg5S9zbpDWmuLfTAKIc76Qzex
 GF9/Tg1/l/Fbah2Qvm07Ch2KTUgeO7WtY4EsKwPSfpy65NUmJK9aOEhY8PqhOFy3b3iJ
 sjCA==
X-Gm-Message-State: AOAM531AVqNy4BkhCZVGyM7e9WJDmepMg2JrJsF3aX3sQ5AsmlDdu2sc
 8mcPJowiRhx1AnKLthYso7VEVw==
X-Google-Smtp-Source: ABdhPJyb9vEQTn14Ygn7ph6wsyHte+vZpEhCWA7YO0ZLL4Ybk2CFwm5mHZTO4rXc61h8McUbl0WXPw==
X-Received: by 2002:a63:1303:: with SMTP id i3mr10528838pgl.32.1616738570584; 
 Thu, 25 Mar 2021 23:02:50 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-39c5-e677-fdb8-5d64.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:39c5:e677:fdb8:5d64])
 by smtp.gmail.com with ESMTPSA id i7sm7347282pgq.16.2021.03.25.23.02.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 23:02:50 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Aditya Srivastava <yashsri421@gmail.com>, leitao@debian.org
Subject: Re: [PATCH] crypto: vmx: fix incorrect kernel-doc comment syntax in
 files
In-Reply-To: <20210320202525.12562-1-yashsri421@gmail.com>
References: <20210320202525.12562-1-yashsri421@gmail.com>
Date: Fri, 26 Mar 2021 17:02:47 +1100
Message-ID: <87o8f678qg.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: rdunlap@infradead.org, herbert@gondor.apana.org.au, corbet@lwn.net,
 linux-kernel-mentees@lists.linuxfoundation.org, nayna@linux.ibm.com,
 linux-kernel@vger.kernel.org, yashsri421@gmail.com, pfsmorigo@gmail.com,
 linux-crypto@vger.kernel.org, lukas.bulwahn@gmail.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aditya,

Thanks for your patch!

> The opening comment mark '/**' is used for highlighting the beginning of
> kernel-doc comments.
> There are certain files in drivers/crypto/vmx, which follow this syntax,
> but the content inside does not comply with kernel-doc.
> Such lines were probably not meant for kernel-doc parsing, but are parsed
> due to the presence of kernel-doc like comment syntax(i.e, '/**'), which
> causes unexpected warnings from kernel-doc.
>
> E.g., presence of kernel-doc like comment in the header line for
> drivers/crypto/vmx/vmx.c causes this warning by kernel-doc:
>
> "warning: expecting prototype for Routines supporting VMX instructions on the Power 8(). Prototype was for p8_init() instead"

checkpatch (scripts/checkpatch.pl --strict -g HEAD) complains about this line:
WARNING: Possible unwrapped commit description (prefer a maximum 75 chars per line)
but checkpatch should be ignored here, as you did the right thing by not
breaking an error message across multiple lines.

> Similarly for other files too.
>
> Provide a simple fix by replacing such occurrences with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.

This makes sense.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

>
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
> * Applies perfectly on next-20210319
>
>  drivers/crypto/vmx/aes.c     | 2 +-
>  drivers/crypto/vmx/aes_cbc.c | 2 +-
>  drivers/crypto/vmx/aes_ctr.c | 2 +-
>  drivers/crypto/vmx/aes_xts.c | 2 +-
>  drivers/crypto/vmx/ghash.c   | 2 +-
>  drivers/crypto/vmx/vmx.c     | 2 +-
>  6 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/crypto/vmx/aes.c b/drivers/crypto/vmx/aes.c
> index d05c02baebcf..ec06189fbf99 100644
> --- a/drivers/crypto/vmx/aes.c
> +++ b/drivers/crypto/vmx/aes.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * AES routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/aes_cbc.c b/drivers/crypto/vmx/aes_cbc.c
> index d88084447f1c..ed0debc7acb5 100644
> --- a/drivers/crypto/vmx/aes_cbc.c
> +++ b/drivers/crypto/vmx/aes_cbc.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * AES CBC routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/aes_ctr.c b/drivers/crypto/vmx/aes_ctr.c
> index 79ba062ee1c1..9a3da8cd62f3 100644
> --- a/drivers/crypto/vmx/aes_ctr.c
> +++ b/drivers/crypto/vmx/aes_ctr.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * AES CTR routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/aes_xts.c b/drivers/crypto/vmx/aes_xts.c
> index 9fee1b1532a4..dabbccb41550 100644
> --- a/drivers/crypto/vmx/aes_xts.c
> +++ b/drivers/crypto/vmx/aes_xts.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * AES XTS routines supporting VMX In-core instructions on Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/ghash.c b/drivers/crypto/vmx/ghash.c
> index 14807ac2e3b9..5bc5710a6de0 100644
> --- a/drivers/crypto/vmx/ghash.c
> +++ b/drivers/crypto/vmx/ghash.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/**
> +/*
>   * GHASH routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015, 2019 International Business Machines Inc.
> diff --git a/drivers/crypto/vmx/vmx.c b/drivers/crypto/vmx/vmx.c
> index a40d08e75fc0..7eb713cc87c8 100644
> --- a/drivers/crypto/vmx/vmx.c
> +++ b/drivers/crypto/vmx/vmx.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0-only
> -/**
> +/*
>   * Routines supporting VMX instructions on the Power 8
>   *
>   * Copyright (C) 2015 International Business Machines Inc.
> -- 
> 2.17.1
