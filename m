Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A3C6015A06A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 06:16:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HSYW4KhhzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 16:16:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=WX4MMqoC; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HSWc2sshzDqHF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 16:15:08 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id 6so587900pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 21:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=0/wD13yJK7jwOHCxMTW/hx8rEr8SQv9VAJe25Qhk3/g=;
 b=WX4MMqoCxzs+8O2VBx85PU6rkkiSxXWqhujN3bDPugZpic2SR+RYEZrN5WeWNmeM3D
 tQJ9sl6SaqjZ9dVIZRJ34vAFVopuUYaW/P+DPfDjdtjKKZwC2z4cDg3gvuEW+MYbTN0S
 VWDcLFmE3U9yqG7425sLA8oRQPDgWjaPd0AO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=0/wD13yJK7jwOHCxMTW/hx8rEr8SQv9VAJe25Qhk3/g=;
 b=Q4Fv2Ll7t/Dzw2P1AQAM3+u5LRywiegm7uSYuF1Aq7zw/qeGylnHiE6ZzdzXjAWsVf
 0RFdWGHrvAe+rFEpun0pQGQ3jZYKYAUPd1ylasr0WSLUyKiZlcq2VYK0GRZjFSaTM2va
 v9dtFLLcsWjjCTGQUVpAJtk4cyec8PEO8SKV4A6EAWeFMa1txLmueINQMbJaUOOJ5QxO
 93WHEAESNhnrOa6in7/a2OZZ/Q0vHb+z9viDxSNywSc+6diM66pojCnA6xrw4MhRIt3Z
 KtVU2v2KigQN9VzxutRlTixucG9V+44mk+aOAM19EWu19tdIlnuB7WNM+KNVtNPh68Lu
 bOoA==
X-Gm-Message-State: APjAAAXoqIPZzybRsz7A4+rm/sRhg0uRjtaQbarFBRcUcvq7Kzo6VDG7
 U71soA/vmjmxTN1RIDv9nKQ7TSCkCvo=
X-Google-Smtp-Source: APXvYqyab26/V9WWXeKfQYS7/ldIJSvF8LGhTH4tGrqYjhETQymHHig+1tCDyHWCtVroP8trt9Y8dg==
X-Received: by 2002:a63:f648:: with SMTP id u8mr10687139pgj.148.1581484504184; 
 Tue, 11 Feb 2020 21:15:04 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-65dc-9b98-63a7-c7a4.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:65dc:9b98:63a7:c7a4])
 by smtp.gmail.com with ESMTPSA id c15sm6200730pfo.137.2020.02.11.21.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Feb 2020 21:15:03 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: setup_64: hack around kcov + devicetree
 limitations
In-Reply-To: <20200212045014.1678-1-dja@axtens.net>
References: <20200212045014.1678-1-dja@axtens.net>
Date: Wed, 12 Feb 2020 16:15:00 +1100
Message-ID: <875zgcgze3.fsf@dja-thinkpad.axtens.net>
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
Cc: ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> So: create a fake task and preload it into our fake PACA. Load the paca
> just into r13 (local_paca) before we call into dt_cpu_ftrs_init. This fake
> task persists just for the first part of the setup process before we set
> up the real PACAs.

mpe has asked for this to be fixed in a different way, so I'll respin
with that change.

Daniel

>
> Translations get switched on once we leave early_setup, so I think we'd
> already catch any other cases where the PACA or task aren't set up.
>
> Fixes: fb0b0a73b223 ("powerpc: Enable kcov")
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Daniel Axtens <dja@axtens.net>
>
> ---
>
> I haven't made the setup conditional on kcov being compiled in, but I
> guess I could if we think it's worth it?
> ---
>  arch/powerpc/kernel/setup_64.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index e05e6dd67ae6..26f1b8539f8e 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -281,7 +281,18 @@ void __init record_spr_defaults(void)
>  
>  void __init early_setup(unsigned long dt_ptr)
>  {
> -	static __initdata struct paca_struct boot_paca;
> +	/*
> +	 * We need to get something valid into local_paca/r13 asap if we
> +	 * are using kcov. dt_cpu_ftrs_init will call coverage-enabled code
> +	 * in the generic dt library, and that will try to call in_task().
> +	 * We need a minimal paca that at least provides a valid __current.
> +	 * We can't use the usual initialise/setup/fixup path as that relies
> +	 * on a CPU feature.
> +	 */
> +	static __initdata struct task_struct task = {};
> +	static __initdata struct paca_struct boot_paca = { .__current = &task };
> +
> +	local_paca = &boot_paca;
>  
>  	/* -------- printk is _NOT_ safe to use here ! ------- */
>  
> -- 
> 2.20.1
