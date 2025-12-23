Return-Path: <linuxppc-dev+bounces-14954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B06CD99C2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Dec 2025 15:24:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbHLr6gnbz2yFY;
	Wed, 24 Dec 2025 01:24:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766499844;
	cv=none; b=da6aXIq8nudZMvNvMtOQM/21IBKj9eZvceqCQC7sb/sB/irqgc8eKFTtWpQ0Yr1BLW1ah0QCm7yylsMI0WyimdFpArLyI+btPvxBs0CxvYgUoIMrJgeLNOAbq6kUMlxiok+uYvzWB5SzxXheO0uPEhlFn0p+SoX79WwPyeC1CruzT3cfdfEt6uhmNz23NY6VPEbVoJRgvLUX7P8gj8zdR8y39hxxOPT68ZwCRpyGlUOeHpUOS08+CeTkkQgK0f/nEHDf8dBXV4OU8XPTgkA17cXThhH+hiAtKfN3iXKXDUg9YdjikbTr3fydGGX+rdmnkATqr/+6KXNWHs55VKQZUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766499844; c=relaxed/relaxed;
	bh=ICmam0m9XXB2moqNxOPa2+pC0cmBSXKD1nCIxD4Mx1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EA0KiaySDyVBHBWxoGXLAriRMxd+xtHPUjAp0nRjeP4Ds5/T5LnCHlypddLthfW6/BT6KPbl6oa2FE5wPhqjOrTpShusuDBtKPZQOvfiY0P2MuPI7W5JmDTNXGgpUGfTCct32zYwCRnDYGcvuEkVgbjMJf8PO72w2kduz49iH5Pe4r7yBeqrdSu9BOstP7dP+E5AQKHov8B2hOKzYbgM8SmiNCNPpnvFhDaGakXjsixDqvC+sbCNgL93luKEmFYNk96aJ1+P2+YKPTzPdftUV9l6w+XkvYgJfZZrCuAYdOV3hNvTWoGi7F9Pt9N99NZG1zI8iblPqZhRULuQr96vEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T2BqBSVE; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=T2BqBSVE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=johan@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbHLr0g77z2xlP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 01:24:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 93A0640806;
	Tue, 23 Dec 2025 14:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67551C113D0;
	Tue, 23 Dec 2025 14:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766499841;
	bh=LVIPzMudx/3KFt0kpQO0KjKHpoGH1y/OUS9xlATtlVo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=T2BqBSVEvD8+egd2DKh0M7CRaA07nAPvAIGKjOh7dXuv92V35/4lUGDfIix3vJJOH
	 czLv1diFXWHMpuNqZOAhFZChYdIuHY+tDBVVzzZgV5ZlNznGxvTOBj6gQ1HZL+1RRn
	 ciFQUYyqf9ZKutUfnwb+tzowRzQc7rx3Dnlf3nyXGwKLfaDfs8gstN7zHth8wwAEiH
	 gMsEdVuEdYYz49ksnN/blIurAI7UHMrJ/fUJlv9jQWJ0mwlo0EGyuRVKwHnBJsV5vW
	 0TnFS3XwiqLf4367PRa9pYG5wOO3w6CGtBH57P6Vvf4JrokPtbdx3aetWFutDVt6nM
	 w0H5zVnptbNpA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1vY3Is-0000000036w-41rb;
	Tue, 23 Dec 2025 15:23:59 +0100
Date: Tue, 23 Dec 2025 15:23:58 +0100
From: Johan Hovold <johan@kernel.org>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aUql_tZisfH8E1bq@hovoldconsulting.com>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
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
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Dec 23, 2025 at 11:02:22AM +0100, Bartosz Golaszewski wrote:
> It's been another year of discussing the object life-time problems at
> conferences. I2C is one of the offenders and its problems are more
> complex than those of some other subsystems. It seems the revocable[1]
> API may make its way into the kernel this year but even with it in
> place, I2C won't be able to use it as there's currently nothing to
> *revoke*. The struct device is embedded within the i2c_adapter struct
> whose lifetime is tied to the provider device being bound to its driver.
> 
> Fixing this won't be fast and easy but nothing's going to happen if we
> don't start chipping away at it. The ultimate goal in order to be able
> to use an SRCU-based solution (revocable or otherwise) is to convert the
> embedded struct device in struct i2c_adapter into an __rcu pointer that
> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.

No, this is not the way to do it. You start with designing and showing
what the end result will look like *before* you start rewriting world
like you are doing here.

We should not be making driver code less readable just to address some
really niche corner cases like hot pluggable i2c controllers.

But in any case, don't get ahead of things by posting changes that we
most likely don't want in the end anyway.

> This series addresses the usage of adap->dev in device printk() helpers
> (dev_err() et al). It introduces a set of i2c-specific helpers and
> starts using them across bus drivers. For now just 12 patches but I'll
> keep on doing it if these get accepted. Once these get upstream for
> v6.20/7.0, we'll be able to also start converting i2c drivers outside of
> drivers/i2c/.

Same comment applies to the other two series you posted today.

Johan

