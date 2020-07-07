Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDF8216398
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 04:08:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B15Sd3xQmzDqgx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 12:08:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B15Qm0R5zzDqRJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 12:06:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=YwcARj7v; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B15Ql6Ndzz8t4p
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 12:06:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B15Ql60cMz9sRf; Tue,  7 Jul 2020 12:06:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=YwcARj7v; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B15Ql3yHBz9sRR
 for <linuxppc-dev@ozlabs.org>; Tue,  7 Jul 2020 12:06:38 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id t11so12888192pfq.11
 for <linuxppc-dev@ozlabs.org>; Mon, 06 Jul 2020 19:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=ufAMLYZ5uV6bHta35HYJH1XfzcRlJb5HFWlT4qXEYfo=;
 b=YwcARj7v1GayRBLXaoyXzW79MNuNWyyF5vyLq1cIB7n9Y3VhKk3KvpBJF0dJ/fGjWG
 Y2vIYLCAwyATgtfbWA+BrcFEyx7ttSCb2IDdkfYIBwFNYc6GSEetLR/sKHvbA2hgK3qI
 HSd+WUnLi00yppS1fmG+Jf7N1PukSZK6ulkDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=ufAMLYZ5uV6bHta35HYJH1XfzcRlJb5HFWlT4qXEYfo=;
 b=Y7oWCw+XI4QGZ4Sh36f2o5V8whMCpMk5VHCwuBfv/zUtz8eQjPxvZw4Y10JdtYMm3B
 jUJsBMnYZvqyJYjCKYjRyxeI2BSX4zavsWf6hHsLI7OKxLAvsEksZunW4XP4D1QLXrKL
 bvtdBIo/NAkPMCUejLneqcP9nE+xpZimcqXbpgsEaVT8nEy/57EeUQ/Fyj0OSTPjWdMH
 ecAzdZYM6Npio4hywcnIxItYnoZKP5/2sAsA/fB6j09fDcdJATv6VxYen8Aa59unxIxn
 NCpwTF5pYS1QlbKY9ONXICxCZausz9wMUpfOHz8wrmN36I6zX8cQxx/C09iMOI4TKUrg
 79rA==
X-Gm-Message-State: AOAM533V4ZIxUZfeviVBwzd/YCTSJq5d/gqO8H9VfxHkhyp/770bVhAJ
 A8XyKVSWNT23qdkTLnVtTSiMvQ==
X-Google-Smtp-Source: ABdhPJzLFy1WJWtquEz3mBN0TcABoY5qRw+cnTVC6hS+qEfcSZKtVrJWb+JBCTwkkizgqQEp5HWd9A==
X-Received: by 2002:a63:182:: with SMTP id 124mr40086924pgb.288.1594087595729; 
 Mon, 06 Jul 2020 19:06:35 -0700 (PDT)
Received: from localhost
 (2001-44b8-1113-6700-4ddf-cfaf-3be5-4008.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:4ddf:cfaf:3be5:4008])
 by smtp.gmail.com with ESMTPSA id g9sm19308737pfm.151.2020.07.06.19.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jul 2020 19:06:35 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nayna Jain <nayna@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH] powerpc/pseries: detect secure and trusted boot state of
 the system.
In-Reply-To: <1593882535-21368-1-git-send-email-nayna@linux.ibm.com>
References: <1593882535-21368-1-git-send-email-nayna@linux.ibm.com>
Date: Tue, 07 Jul 2020 12:06:32 +1000
Message-ID: <87a70c3wpj.fsf@dja-thinkpad.axtens.net>
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
Cc: Nayna Jain <nayna@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Nayna!

I'm hoping to get better public documentation for this soon as it's not
documented in a public PAPR yet.

Until then:

The values of ibm,secure-boot under PowerVM are:

 0 - disabled
 
 1 - audit mode only. This patch ignores this value for Linux, which I
     think is the appropriate thing to do.

 2 - enabled and enforcing

 3-9 - enabled, OS-defined behaviour. In this patch we map all these
       values to enabled and enforcing. Again I think this is the
       appropriate thing to do.

ibm,trusted-boot isn't published by a current PowerVM LPAR but will be
published in future. (Currently, trusted boot state is inferred by the
presence or absense of a vTPM.) It's simply 1 = enabled, 0 = disabled.

As for this patch specifically, with the very small nits below,

Reviewed-by: Daniel Axtens <dja@axtens.net>

> -	node = get_ppc_fw_sb_node();
> -	enabled = of_property_read_bool(node, "os-secureboot-enforcing");
> +	if (machine_is(powernv)) {
> +		node = get_ppc_fw_sb_node();
> +		enabled =
> +		    of_property_read_bool(node, "os-secureboot-enforcing");
> +		of_node_put(node);
> +	}
>  
> -	of_node_put(node);
> +	if (machine_is(pseries)) {
Maybe this should be an else if?

> +		secureboot = of_get_property(of_root, "ibm,secure-boot", NULL);
> +		if (secureboot)
> +			enabled = (*secureboot > 1) ? true : false;
> +	}
>  
>  	pr_info("Secure boot mode %s\n", enabled ? "enabled" : "disabled");
>  
> @@ -38,11 +48,20 @@ bool is_ppc_trustedboot_enabled(void)
>  {
>  	struct device_node *node;
>  	bool enabled = false;
> +	const u32 *trustedboot;
>  
> -	node = get_ppc_fw_sb_node();
> -	enabled = of_property_read_bool(node, "trusted-enabled");
> +	if (machine_is(powernv)) {
> +		node = get_ppc_fw_sb_node();
> +		enabled = of_property_read_bool(node, "trusted-enabled");
> +		of_node_put(node);
> +	}
>  
> -	of_node_put(node);
> +	if (machine_is(pseries)) {
Likewise.
> +		trustedboot =
> +		    of_get_property(of_root, "ibm,trusted-boot", NULL);
> +		if (trustedboot)
> +			enabled = (*trustedboot > 0) ? true : false;

Regards,
Daniel

