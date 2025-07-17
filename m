Return-Path: <linuxppc-dev+bounces-10311-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D95CAB097B7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 01:27:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bjpxd6j3tz30WF;
	Fri, 18 Jul 2025 09:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752794869;
	cv=none; b=O/fIpZQkBgRMqT+KfddNOVwH9IdbD8Hkm5z4cA2oz7ZorBoRvt0OpndYmpmt4KL4mXrmcxl5BpmdWA6uaO7LrUWQy6lpecrPQkypP2sAQjgQjC+NwcStlhJLbZc3k3hQRYv5KHJPzUYHvfa8pYH6q6P19E1IhN9j/gBoXs6tnUGtU2aVIx76oYeGmOZpTu9xjmqnEoZ53iJxCQC2DhhwLY8wj/lts86nMceIykNy7znmktr6gNocPWIsEgqU2lfi+wlPTmOQm6W3BPg33XFn9xHB1gIOvnGDDCuiSL5OJnc327AZj7LFdcYpQxPAoXvE5j8z1RD7aKRwloUN7HRx1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752794869; c=relaxed/relaxed;
	bh=0yfbdeYxOA15AdyygNPn3eSRR78YscKVsp3Cq2zIbDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ZXT3/m4IS20nklPmLmB8PE1geyUgKCh/ahzAB5Gvz2oedHClbpOAnxiri2bmwGWxyHtqkLwYoTlITJd/yfTQs7hbI5YnmQ5lPz7RVkbrjZZfQ4lLzDxxDuwweIi50/c7lp+xoNC+TLkeoCi839CencZMMb7z7Y1BTUADWps9bHkLFpJyXFtGN6Zt6U9FgD/sX50BT6d8RZIuyjPyu9eJe9crHtTTRszGbhfLhNvUXHvBEJAjjoS+SsvifRZE+AEnTBXS8y4zMHWZO0aOuzFLLrOVfSj6KX4meJgx6zdQaTTKsuTLWglFHgKT/U9lnrYKA1eOJOQW+HCoJKVBJ4qXMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a8YGUGNi; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a8YGUGNi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bjpxd2Pr2z30RK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 09:27:49 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B39586020A;
	Thu, 17 Jul 2025 23:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48E97C4CEE3;
	Thu, 17 Jul 2025 23:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752794866;
	bh=p0MagdDdWIYiV7kWUeC2SQBLjV/Zj1bBydkf6E4DF48=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=a8YGUGNiC15dATsGZXMiATuiAhkjO0M3CLSjwT8Rp/2WernKImAKFMQMYzp0OvLf3
	 4kpfh8Umx4A6GNKQUrp+McM4MBz2/KqbUIPkiYDHHBFY3p7y/ab73Rr4sDqffWKOEu
	 Yo06aJEGc574l31kabrqte/6LZiW/u9Sa+ZUoQFh0cPiJOW5piWGJw3/su3xH7d5c5
	 DA4T/kX9OZht1pMiANvQlIbDjE7FNZqeJX3qjrDY6XRJShCh/rlrKO3HyCOW4denS/
	 1a2a9wIgWhJf7b9Ftun+015iWSiluo831KNm7SfotdOSjeW4YyeDe9K/FM5ElJApk7
	 zo34Hk2Oq9wnw==
Date: Thu, 17 Jul 2025 18:27:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v3 5/6] PCI: pnv_php: Fix surprise plug detection and
 recovery
Message-ID: <20250717232745.GA2662794@bhelgaas>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <171044224.1359864.1752615546988.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 04:39:06PM -0500, Timothy Pearson wrote:
> The existing PowerNV hotplug code did not handle surprise plug events
> correctly, leading to a complete failure of the hotplug system after
> device removal and a required reboot to detect new devices.

> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -4,12 +4,14 @@
>   *
>   * Copyright Gavin Shan, IBM Corporation 2016.
>   * Copyright (C) 2025 Raptor Engineering, LLC
> + * Copyright (C) 2025 Raptor Computing Systems, LLC

Just to double-check that you want both copyright lines here?

