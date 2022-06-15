Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D778954C794
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 13:36:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNNYd4J7Mz3cgg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 21:36:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Mhjp7FPY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.152; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=Mhjp7FPY;
	dkim-atps=neutral
X-Greylist: delayed 453 seconds by postgrey-1.36 at boromir; Wed, 15 Jun 2022 21:36:02 AEST
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNNXy2cDbz3bqg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 21:36:02 +1000 (AEST)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4LNNN34jqmz9sRK;
	Wed, 15 Jun 2022 13:28:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1655292499;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8jwqW10cqVS6fTjfeUNcmemKbh/h4CrxEgSPdPMGt+Y=;
	b=Mhjp7FPYrGu+fRre/e3oZuLVkbqMaG/lhC3jwo9PhGKMsxjtCfaqkmasXAJxAu4/acIX4Q
	NImi/m6yDUnlQC4oGgBrYt5RrOvyI5+L5Jz7bn/9mY9avzSS53wLIy1akVmmiDUdzvfH/r
	Nlt5fCbg2OFbzn9FV/NW1Sz3eiFhLXVpwUjKuzFVKSiMX3j6+QV155gHh5tZkN/116gpf7
	uFh30bKnYmf4vFAg3CJjO+47GlRuYpyc1wT/OnuDRkKersjuN6AOazhcfAEka56J3X7Cwq
	g7ajAwWDORGAA5xuCUxO+DuiwPS3SRtwe0ub2Z3+pCWDQTzjlOc8MNUUdkZflA==
Date: Wed, 15 Jun 2022 13:28:16 +0200
From: "Erhard F." <erhard_f@mailbox.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [Bug 216095] New: sysfs: cannot create duplicate filename
 '/devices/platform/of-display'
Message-ID: <20220615132816.197c6657@yea>
In-Reply-To: <87zgifbazm.fsf@mpe.ellerman.id.au>
References: <bug-216095-206035@https.bugzilla.kernel.org/>
	<87zgifbazm.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: gymutrjp8wffnxg5xmut7jqwme339p35
X-MBO-RS-ID: 032f32d6927706a612c
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
Cc: linuxppc-dev@lists.ozlabs.org, tzimmermann@suse.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Jun 2022 00:01:01 +1000
Michael Ellerman <mpe@ellerman.id.au> wrote:

> Hi Erhard,
> 
> This is presumably caused by:
> 
>   52b1b46c39ae ("of: Create platform devices for OF framebuffers")
> 
> Can you try the patch below?
> 
> cheers
> 
> 
> diff --git a/drivers/of/platform.c b/drivers/of/platform.c
> index 3507095a69f6..a70ff9df5cb9 100644
> --- a/drivers/of/platform.c
> +++ b/drivers/of/platform.c
> @@ -556,7 +556,7 @@ static int __init of_platform_default_populate_init(void)
>  			if (!of_get_property(node, "linux,opened", NULL) ||
>  			    !of_get_property(node, "linux,boot-display", NULL))
>  				continue;
> -			dev = of_platform_device_create(node, "of-display", NULL);
> +			dev = of_platform_device_create(node, NULL, NULL);
>  			if (WARN_ON(!dev))
>  				return -ENOMEM;
>  			boot_display = node;
> @@ -565,7 +565,7 @@ static int __init of_platform_default_populate_init(void)
>  		for_each_node_by_type(node, "display") {
>  			if (!of_get_property(node, "linux,opened", NULL) || node == boot_display)
>  				continue;
> -			of_platform_device_create(node, "of-display", NULL);
> +			of_platform_device_create(node, NULL, NULL);
>  		}
>  
>  	} else {
> 

Hi Michael!

Applied your patch on top of v5.19-rc2 and can confirm it works, thanks!

Also the "Using unsupported 1920x1080 (null) at a0008000, depth=8, pitch=2048" later on is gone in the dmesg.

Cheers
