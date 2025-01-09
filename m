Return-Path: <linuxppc-dev+bounces-4920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B069A07C39
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 16:45:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTTdh5HkPz3bNs;
	Fri, 10 Jan 2025 02:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::333"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736437544;
	cv=none; b=oWhxduddDUPgEOGgjyZXB/A2wduCzcJMJHUlUyPCimo+V9NQtdldqob0wS1vCzuyHhmdFWfnOz/12gjELOTh0Pu9mHR27MATe4RYmg5AqEtJyeAaN2OZHJqQa+0D/UT9Pefq7/nMLXjeuRM/Hf545YtxrQ6drmW5kFSGjjBwB4ktHDPjCWqwfqqvxNe77aiHUFhDtX1aoimhvpvZZyWL2hKphThjP6Oc3Sc5Tl0tbTWL83bpY4OzOew8OhjSQCZ71spZhORL8R7janGCToqsJyLKxfNzayjgrOVpJg2c7x3mWFiehEuUDgTmK36hiIILM1DyRB2yoTsVN1u/pifoCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736437544; c=relaxed/relaxed;
	bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TXy8j1wJwIYfHyqlPjiOrUcmFeWiDIIO14Wmw4dEVWUp8LfM7HvsO7f9y9nE1nTMsZR9GHydegNlf3SwCmEna0qllsNulcaC6N6i339YDarP71F8MKQH6rRcuxAIyHR7png60GlrEV8EazWWT5EBnA/59PtUVECf83apY7creXI1np5szeHw6gz75g5dqD7TrAWXC5sZ+OR+llK37FcXVyw1KRqvL/pHzcBM/BVcFeEzjq7klvCzkrvj/TtZ+/Sc/yVKG0aD84vJqIjrVbtl1Qy5sdot96RJz8M+o0Q/JIZrhZp8lZy5aBM7//lHf0/PSReyEC8Y/ZNjYoAlB3k2KQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=minyard.net; dkim=pass (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VLRawCBX; dkim-atps=neutral; spf=none (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=corey@minyard.net; receiver=lists.ozlabs.org) smtp.mailfrom=minyard.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=minyard.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=minyard-net.20230601.gappssmtp.com header.i=@minyard-net.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=VLRawCBX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=minyard.net (client-ip=2607:f8b0:4864:20::333; helo=mail-ot1-x333.google.com; envelope-from=corey@minyard.net; receiver=lists.ozlabs.org)
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com [IPv6:2607:f8b0:4864:20::333])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTTdf3LkXz3bNm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 02:45:41 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id 46e09a7af769-721d213e2aeso270497a34.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jan 2025 07:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1736437536; x=1737042336; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
        b=VLRawCBXoCpQ0Y6NZ9A3uAt06Zaa9sN1zIcLiVNbwR7zw4Jg2xglD/dgT6vdsWMgWm
         0LIVXGbt0avwkyBM9Ah03h6XIQ9wsM6BYYL/kDfvf/IFQt5/tdGI5xuRAdrzNk7dKzeg
         iyB6Enz1U+cqRjamPY2Ezm6c+lwFf8pdfUFO238msSA5+3r+/bmKYr7EaaybhH0k9/5T
         QqRgksEOn4BNdFizx0/VR/XX0ODQ/5i5VdgMo9MqZddZ6+C1sE35ydYVEdB69RICzuec
         E6kut4eFi57hC0cxSZ62kCrE4hpXmm1AcByucgSTCBHL3NiDaOp89otoclMplCIGxX0v
         +/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437536; x=1737042336;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
        b=bPj0EGKarwuSHwcouAAZ1LaH3hWAZG8dT8slbV0j3iVVm/h8QyLZb+auTMdFIhoZTQ
         kAkhpjFQYVErGhv5t9a1nvB+yMcrn5r/JRTZNnTUpF1uG74U8JXK7Vcnwc4doRJkwBD3
         azhzwu92GMxYTkFXAqUFEuI8gruRHtEZYd7IEpA7ebICKNGOSC32H4VlCubEJseCwtvu
         cfBtuIt7s2oMzNFRiYOpKJwPnO9E5FaIbX7SOV6M95xzgCu5kIFGNlbkUswAdXVklSnh
         1z9g5E1JRsTVvFRr1V+y6mSxaWww6//us+3YnfXXEPMAe+7doQ8tHJ3uUKQiQAu9+E2k
         s21A==
X-Forwarded-Encrypted: i=1; AJvYcCXgnGNL+10ck77paRXUZ/hyYqSsvuF6PM/Ao6F4KN25+XuvO+ZILynDK+rmA9F363sNh66H3E561mGkrhs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1qxYcgqVvGXys7aQTljIcB7KFsh79jp5yJ6VinMH16+hdyn1F
	a2atCRHT5vOLNrEcCbHGRtwHLEmgVpF2zVhBY+mP4HwDD56dNFZK4lPPOhDWrOM=
X-Gm-Gg: ASbGncuDuyoAh9Pv82l3MtxHv9RpUPsoSmPSrOQFvP7TrQuna/TdNho/Gih/k1oEZ9g
	phzJ+/hUNpg7S34VOv7D3oD1+fZB5HvIMdcAi70ruGbfvThvsk93GqlqAle1Eo6yapvBIS98VVc
	35toEw258THt4CQbFLRpxA9XVQt3Wu/YhhbzBVieQaZ2vG+LxZBvMOYBgJcZTii024jRuc59jaK
	r0eupmn/GUavah1bGpgOtTRCWHsXSwSBTgeX9CKLl4CjvKhnJeKWhnII7VF
X-Google-Smtp-Source: AGHT+IHELUnxP9ZvL+e2Ztemz39I9ORoPYZLTVwEa+XG73J5uz7w7yM0cuXu9KZqTaUsGk+1/+jmGA==
X-Received: by 2002:a05:6830:6610:b0:716:a95d:9ef with SMTP id 46e09a7af769-721e2e000d6mr4949630a34.2.1736437534534;
        Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:9076:47eb:1e0a:16fb])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882625f0esm386258eaf.9.2025.01.09.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Date: Thu, 9 Jan 2025 09:45:27 -0600
From: Corey Minyard <corey@minyard.net>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org,
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
	io-uring@vger.kernel.org, bpf@vger.kernel.org,
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
Message-ID: <Z3_vF3I453flXoZv@mail.minyard.net>
Reply-To: corey@minyard.net
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 09, 2025 at 02:16:39PM +0100, Joel Granados wrote:
> Add the const qualifier to all the ctl_tables in the tree except the
> ones in ./net dir. The "net" sysctl code is special as it modifies the
> arrays before passing it on to the registration function.
> 
...
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
> index 941d2dcc8c9d..de84f59468a9 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -650,7 +650,7 @@ static struct ipmi_smi_watcher smi_watcher = {
>  #ifdef CONFIG_PROC_FS
>  #include <linux/sysctl.h>
>  
> -static struct ctl_table ipmi_table[] = {
> +static const struct ctl_table ipmi_table[] = {
>  	{ .procname	= "poweroff_powercycle",
>  	  .data		= &poweroff_powercycle,
>  	  .maxlen	= sizeof(poweroff_powercycle),

For the IPMI portion:

Acked-by: Corey Minyard <cminyard@mvista.com>


