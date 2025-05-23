Return-Path: <linuxppc-dev+bounces-8920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 984B0AC2726
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 May 2025 18:07:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b3qmS75Jsz302b;
	Sat, 24 May 2025 02:07:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748016424;
	cv=none; b=Me404D+snCq5XEWK29p/BdGo3W85l6jVqOV++FqH6cEH7zgFXq6SuHGlkKKf9sWgFt2kTb1FZRkq83EnqV9ysj3qtIhs6gyXwnlfO8vGGGGWBboHKY+3BUD1R0LcsFgFFOpq+rT3foge4XmbQ6XR4h/dK2s00uvBEofIZoW4vcOgATePE3abRi5cbpuNTjNvj+6a9HLiFU5Zm/PIpoAy+YXQ3DkbOnyaP9D+E8Xo5EiOO6744Fp1vRRBhjgDEf0su6Le4E67Ak64lqUsedp/toGylrPK59cqn65mlwYYkTTJgq9PZz4jFpi55TZzm7e9MnJXPndREiJbmXLQNc49dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748016424; c=relaxed/relaxed;
	bh=GbTry3W066LABriXKhfx8bq8jOAJRIN/sRrhhbEm8AE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=C5ajREbFglrLAEG8Z0vL3o9TrBbkBsovDBtPj7MY13tlHhlwDQbENqgsO/g4ozXAK8djsReZrh4XrQJ/AXVFEC57FO5ITAI9tv7Kr/GrZm9j+7jViE5J9yn+rWJHBCCjH1DGza+bqf3bQdoPYjcRukqhbJ5RYQH1mqS9m0mM8UwKA+fjrHZ6R+bzO2/KNMNUf+sbZYGX0exQFLVu3BOKKczAzDKjN01CFM2XnGB6TZkKQNNzNFtnlL9FZgvk8IqXF7m2x2/KOQBmuwqzRwgvq10QAnU85N4WPMS7OLQJeVb7cKjyw0iWeJatgnYG7y77RdY02CNGmjeVGBxvgZ3H2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HJ4BTRSD; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HJ4BTRSD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b3qmS1ZFlz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 May 2025 02:07:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 58C4A629CD;
	Fri, 23 May 2025 16:07:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDD81C4CEEB;
	Fri, 23 May 2025 16:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748016420;
	bh=U5OXlf+RyqrwgHycF2mts31Fb7vitn7wTynxz3ykuCU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=HJ4BTRSD/0E+TS5UteGvWOxf6R8OzJOt1+4nzoXPvNCXRD/8S/RNGcPwi58jotavi
	 +4tTV8FqgSGUtL4GoCwxkaJlgejTdf4aMBX+IvZvWOvMGbFhSXdQDkVOjBmkXvR+S0
	 A9qINpvL88R5Q+bWhPSmHHFrdVJ+9gSC/jPZH+EcX4uP/DMIfwsHCfFm9iq1abQET6
	 gC/+8VnoGgTxoCZucgiciaTMBy20nqlu9TLHLQhvg72dAthv2ZWiMbew4qxHxAyn8+
	 SzSxhptlarY55XjN3O70l0VVUIkvlIvZApk9gVoyDSbZldmkqtr6C0gwS5Jw4QzCt1
	 chp6pa8W4pWGQ==
Date: Fri, 23 May 2025 11:06:58 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH v8 18/20] PCI/AER: Ratelimit correctable and non-fatal
 error logging
Message-ID: <20250523160658.GA1559366@bhelgaas>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb9bca3e-cb0a-41e9-bf7f-0889eb3f3c47@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 22, 2025 at 04:56:56PM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 5/22/25 4:21 PM, Bjorn Helgaas wrote:
> > From: Jon Pan-Doh <pandoh@google.com>
> > 
> > Spammy devices can flood kernel logs with AER errors and slow/stall
> > execution. Add per-device ratelimits for AER correctable and non-fatal
> > uncorrectable errors that use the kernel defaults (10 per 5s).  Logging of
> > fatal errors is not ratelimited.

> > +static int aer_ratelimit(struct pci_dev *dev, unsigned int severity)
> > +{
> > +	struct ratelimit_state *ratelimit;
> > +
> > +	if (severity == AER_FATAL)
> > +		return 1;	/* AER_FATAL not ratelimited */
> > +
> > +	if (severity == AER_CORRECTABLE)
> > +		ratelimit = &dev->aer_info->correctable_ratelimit;
> > +	else
> > +		ratelimit = &dev->aer_info->nonfatal_ratelimit;
> > +
> > +	return __ratelimit(ratelimit);
> > +}
> > +
> 
> Why not combine severity checks? May be something like below:
> 
>     switch (severity) {
>     case AER_NONFATAL:
>         return __ratelimit(&dev->aer_info->nonfatal_ratelimit);
>     case AER_CORRECTABLE:
>         return __ratelimit(&dev->aer_info->correctable_ratelimit);
>     default:
>         return 1; /* Don't rate-limit fatal errors */
>     }

Beautiful, adopted, thank you!

