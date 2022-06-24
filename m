Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321A0559AAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 15:51:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LTz7B0Mtdz3cgZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jun 2022 23:51:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Jb0pkru7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LTz6Z6V50z30QW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jun 2022 23:51:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Jb0pkru7;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LTz6Z3qClz4xYN;
	Fri, 24 Jun 2022 23:51:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1656078662;
	bh=oTQkrMVJjt9EFA7jY/+HvD1PmcUsgMzdT0WBxm7qFlY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Jb0pkru7qVZfM+PMt4Dfr8VurMJOHeRAvPY/uMveLTYz8umtAmiPooaZ4r6A4t75D
	 HA64ybK+kKyblBE7WWPVNNU8oO69dShg+HZmwBX88SZK0eTE4V03DM21hgiQYeSI5i
	 8paJdPjkhd9KLJZLsgtGXsIPJ/WYnYqU+sd5yQSyzA38UasOgElq4HYg5ttJpfVzvs
	 Q7T449bRU7TCc02MfCzoAVeALni7QZ789IHre0E73JZpxNDuJRzZC6dqqOnXlevzLS
	 x4gpDvbdkYfnFurJix/orIJSY6U7F+ikDR8sw/ejL2vgkxPoJCjsMzdeuH4MDd8PFG
	 hhnvXFVEnHjCQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Scott Cheloha <cheloha@linux.ibm.com>, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v2 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
In-Reply-To: <20220602175353.68942-5-cheloha@linux.ibm.com>
References: <20220602175353.68942-1-cheloha@linux.ibm.com>
 <20220602175353.68942-5-cheloha@linux.ibm.com>
Date: Fri, 24 Jun 2022 23:51:01 +1000
Message-ID: <87sfnu41bu.fsf@mpe.ellerman.id.au>
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru, Scott Cheloha <cheloha@linux.ibm.com>, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scott Cheloha <cheloha@linux.ibm.com> writes:
...
> +
> +static struct platform_driver pseries_wdt_driver = {
> +	.driver = {
> +		.name = DRV_NAME,
> +		.owner = THIS_MODULE,

That owner assignment is not required.

It's set for you by platform_driver_register() via
module_platform_driver().

cheers
