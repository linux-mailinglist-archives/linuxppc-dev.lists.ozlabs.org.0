Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E87FDCF0B8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 04:01:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46nLDw0lHyzDqNX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 13:01:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="KW7KGo2U"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46nLBp4sLxzDqB0
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2019 12:59:44 +1100 (AEDT)
Received: by mail-pl1-x642.google.com with SMTP id d22so7755899pll.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Oct 2019 18:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=DmlzkCLkrTPP7trQ5L6es07ny6jOa5vt8PSD2f6cCsA=;
 b=KW7KGo2Ues0AOLfs8rsyFsmLXZI+qaMq4et+4ZbR3M+/yxuM/NNQkzqRl+wAGMx0nr
 MHcdMT3Uu0jvhynpNs0d6z2pIBIRKhxQ6FnkZshwEyPnuL4wLs+LKWW1/i6d0ELA1krb
 0K29nbyTbCmwwmqrgqRZHOz4271yQO8mPtmP4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=DmlzkCLkrTPP7trQ5L6es07ny6jOa5vt8PSD2f6cCsA=;
 b=VBK+uDQ2lQXGLH30F/s1Do02VmWfN6UKZMe+39wHw9KwaRimGi15shKG4uW4PRPKUg
 nd201SbPGfdZfXq6BgK+FPFsjbPgkhSyROt1vF9szb24P3ttd/pc11IgU62PYZ2m+ZZx
 y4WV7Ka37pjdRS4ABGy4O6bdiEx/5sg6HQCVkbq45ZFmFOGRtzsWPmkIT/6uAvyraD6G
 1E1EIl7vkJn+qvuS+rWmPDjvKsNo9H8A+GyMUcU/MTqKa1aVyUhkt5elaRAiHOQSw6sp
 oDHYJ4JMqjAKwVM7lgQsnIYiuig5YJumKZLbucCdTFDlTkH7VjYaKHGKu/Q4B0GMFuEC
 0J9g==
X-Gm-Message-State: APjAAAUM7wls/AXbdjhbnCNAyB/GsM8xTfStZcB59YT7bJtvRoigaiR7
 sG0fY7PsaUoBr7j/W4B8NGJQ6A==
X-Google-Smtp-Source: APXvYqxEhUW4EpdxFN5NN8MZ4fbFn/0NhMptJtJUOIUZBGc7Muyh5mwKBTt+Hs7ZgbNtdAPH2WQ74Q==
X-Received: by 2002:a17:902:684a:: with SMTP id
 f10mr21214242pln.91.1570499981769; 
 Mon, 07 Oct 2019 18:59:41 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id t21sm25232pgi.87.2019.10.07.18.59.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 18:59:40 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 3/4] powerpc/mm/ptdump: debugfs handler for W+X checks
 at runtime
In-Reply-To: <20191004075050.73327-4-ruscur@russell.cc>
References: <20191004075050.73327-1-ruscur@russell.cc>
 <20191004075050.73327-4-ruscur@russell.cc>
Date: Tue, 08 Oct 2019 12:59:37 +1100
Message-ID: <87sgo4q9o6.fsf@dja-thinkpad.axtens.net>
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
Cc: ajd@linux.ibm.com, npiggin@gmail.com, joel@jms.id.au, rashmica.g@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Russell Currey <ruscur@russell.cc> writes:

> Very rudimentary, just
>
> 	echo 1 > [debugfs]/check_wx_pages
>
> and check the kernel log.  Useful for testing strict module RWX.

I was very confused that this requires the boot-time testing to be
enabled to appear in debugfs. Could you change the kconfig snippet for 
PPC_DEBUG_WX to mention the runtime testing?

Kind regards,
Daniel

>
> Also fixed a typo.
>
> Signed-off-by: Russell Currey <ruscur@russell.cc>
> ---
>  arch/powerpc/mm/ptdump/ptdump.c | 31 +++++++++++++++++++++++++------
>  1 file changed, 25 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index 2f9ddc29c535..0547cd9f264e 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -4,7 +4,7 @@
>   *
>   * This traverses the kernel pagetables and dumps the
>   * information about the used sections of memory to
> - * /sys/kernel/debug/kernel_pagetables.
> + * /sys/kernel/debug/kernel_page_tables.
>   *
>   * Derived from the arm64 implementation:
>   * Copyright (c) 2014, The Linux Foundation, Laura Abbott.
> @@ -409,16 +409,35 @@ void ptdump_check_wx(void)
>  	else
>  		pr_info("Checked W+X mappings: passed, no W+X pages found\n");
>  }
> +
> +static int check_wx_debugfs_set(void *data, u64 val)
> +{
> +	if (val != 1ULL)
> +		return -EINVAL;
> +
> +	ptdump_check_wx();
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(check_wx_fops, NULL, check_wx_debugfs_set, "%llu\n");
>  #endif
>  
>  static int ptdump_init(void)
>  {
> -	struct dentry *debugfs_file;
> -
>  	populate_markers();
>  	build_pgtable_complete_mask();
> -	debugfs_file = debugfs_create_file("kernel_page_tables", 0400, NULL,
> -			NULL, &ptdump_fops);
> -	return debugfs_file ? 0 : -ENOMEM;
> +
> +	if (!debugfs_create_file("kernel_page_tables", 0400, NULL,
> +				 NULL, &ptdump_fops))
> +		return -ENOMEM;
> +
> +#ifdef CONFIG_PPC_DEBUG_WX
> +	if (!debugfs_create_file("check_wx_pages", 0200, NULL,
> +				 NULL, &check_wx_fops))
> +		return -ENOMEM;
> +#endif
> +
> +	return 0;
>  }
>  device_initcall(ptdump_init);
> -- 
> 2.23.0
