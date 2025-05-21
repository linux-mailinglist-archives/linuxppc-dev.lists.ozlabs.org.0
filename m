Return-Path: <linuxppc-dev+bounces-8855-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAFEAC0058
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 01:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2n9c6j9Xz2yf9;
	Thu, 22 May 2025 09:06:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747868804;
	cv=none; b=lpuPTQHIB4suju26pYUIcohyUmqdvWRKFoi34Jip12BZDycjupG8AJEWxl+vmiE1Ss81fTnjQgvSl8uKGhU7oB5QBe5XvDTK3MmV8eys1le5qI+3z/NNxzDxfDTR2SSDOzKiOUHs0G4/UbpVUGM056py3HJDCNMvA7XKzsFCruAHsX7YHKVs/+7gmc2M+tauCqrgwKoh3TUkaBPa65XYGiVWorQP8oApVl/11JRpQMSgPMN6j/LS5IB0XLtiSdIYm1IUcnhdShFiGm7gDXozU5uQXQtw4LZPwlqpzSdB5Vm+uxkLioHUFcVNqL8X59Yfk5SoX4wo/t5ZEfMhjBuG6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747868804; c=relaxed/relaxed;
	bh=aBBnhscgYOw23uomK9YvENoEMVX+IkCNI73cf8rAgGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=QbZ9h3mN4k3ywF9I2XHzqJXyn51gLMMIRuJvvIwC5yaiPjGSX6Cefp0gXFdSmy5P7EX9mSEBCIMqx1bkE0PlkpYnCwn088vJpp3bj707J99HymttUUPRWWjUF33/cLU8BHRmi4wgy8y/ELIeNU6xZ6ivJ/E3JggUt1gOel2ej4AMegh5+8ycYgABZBa5mLWnSBBwxbwmwDNte/crvcer/cP+Yb19CCyeW/PoEjxvzs2lfbSDu96MdfOTdjLYxAqRzaf3OiA1om/cRY34N3G5W80vszZ+VsRszHv6ZjRplZubb+0MWeqDYh53IsfQrHwa4v0K+2bmMY5ZILlwHEs+qg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SsUde9Z2; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SsUde9Z2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2n9c0wXhz2yf4
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 09:06:44 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B7206A4F439;
	Wed, 21 May 2025 23:06:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 369B4C4CEEA;
	Wed, 21 May 2025 23:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747868801;
	bh=NEfRGNGqd+jQ4ZBng1dfzvjrKmSVR+/dtJx0zlR93Ws=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=SsUde9Z2FPViWIrd9w4gBW4lxhWaZCxVaNRIUwfdG98emO4Q0nTSUmtVGXUa/K62u
	 4kDvqYBFgk5Vjli1GmKSnXNG4CCjkJGZlKPPLZ0hPDXPQCA7vKajIGUWEHeubI/6IP
	 T3+Xzs0eQp22gYrGHaPWQVYwKpqEuMPINy2sIw5udEBO4KjiUXbfhZ8rXJoJrTrohp
	 aZRTX4UJs/vAqJ5qq0sxK4MBdIZiOapIz0SWEPizirFpYHQrC1plIDGXVtml7qj9x6
	 PCZVBQGvP4tg6eiVTFEXiLhWk7M90tWuK+VjhuxZRZH5dYupM94ZZhZcJjt9KUFzL2
	 TnwGOmuLP9dRw==
Date: Wed, 21 May 2025 18:06:39 -0500
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
Subject: Re: [PATCH v7 15/17] PCI/AER: Ratelimit correctable and non-fatal
 error logging
Message-ID: <20250521230639.GA1452526@bhelgaas>
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
In-Reply-To: <ac30a88d-7139-40ce-ae3c-34ef12c939a5@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 20, 2025 at 03:33:45PM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 5/20/25 2:50 PM, Bjorn Helgaas wrote:
> > From: Jon Pan-Doh <pandoh@google.com>
> > 
> > Spammy devices can flood kernel logs with AER errors and slow/stall
> > execution. Add per-device ratelimits for AER correctable and non-fatal
> > uncorrectable errors that use the kernel defaults (10 per 5s).  Logging of
> > fatal errors is not ratelimited.

> > +	/* Ratelimits for errors */
> > +	struct ratelimit_state cor_log_ratelimit;
> > +	struct ratelimit_state uncor_log_ratelimit;
> 
> Nit: Do you think we should name it as nonfatal_log_ratelimit?

Maybe so.  We can always change this internal name, so I guess the
important part is the sysfs filename
("/sys/bus/pci/devices/<dev>/aer/ratelimit_burst_uncor_log").

"ratelimit_burst_nonfatal_log" is not quite parallel with
"ratelimit_burst_cor_log" the way "ratelimit_burst_uncor_log" is.

But it's definitely true that the underlying PCIe Messages are
ERR_COR, ERR_NONFATAL, and ERR_FATAL.

So I think this is more than a nit, and you're right that we should
use "cor" and "nonfatal" somehow.

I'll work on that tomorrow.

