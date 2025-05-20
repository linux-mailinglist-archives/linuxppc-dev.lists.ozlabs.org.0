Return-Path: <linuxppc-dev+bounces-8771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6397ABE5FE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 May 2025 23:25:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b26zL3ZX7z304f;
	Wed, 21 May 2025 07:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747776334;
	cv=none; b=o2tcoPXam8sSGvVU4/knBhe/nvcU9GjaSiX0eiWggK+CxCNRcbx3UbWZKlWMdBdgkLWSGy4Wg7AUn0/7JE0a1WE/EO38lUTGfooh8OgS/7dL+yCO97h/MMp3INsElZvawzT+rgNjOc49o3OvWnYCGJ+/rpx1jEupCNDkFahHzJya0D1BZHcgV3FZgqMe+iT6yS9H1AtT6Em9+MPJppan9KJ5FCaX22lQUCk3e0DfvhjD9HqTuc368NxkMrr+bcJXBDNGpVviPogcleav6tne8Ggnq7uYWcMeq+LgAg//tDlFN9+Pht1GcrGb0rftWoPSKnXDlADU8IMEPVjDEF3wkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747776334; c=relaxed/relaxed;
	bh=kVhf8xffV63jdb3NAiLynPw5Es+HcX4wmuRl/E6Dapg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Ro/1IIzNxzWaedYi+Y/yOlXlcYf4HQ7gAfttJipTdGKF5hZj701HdrUJyJX45UYP8G71pyWaA+7aBVP6a0zuZ6HNVyt4Ij2EZ8d1U03bYVJEimYZV5BdtToIKGBX/PgpqHCGyxm0KElFAXMoTplvwZlI6P88kjhTMQH84IhlNDmuDHkm0LMA3t7Wqdvx8pcswL5sNwwenA5aotKF7s8H3wPjfK764hvXMp/b6YaCYCMew1aYIrHgzcSEohss6WbSzYooVRj9T4rawhAfOb3mf1ruvVwPSA5fGDxHk7+0fBERRKrTni+oJ0SfcbAx16xHAixHwZwbM36vlU9hqUrnCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k/zc6R9g; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=k/zc6R9g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b26zK6Q7Vz3024
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 May 2025 07:25:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 449DE4A383;
	Tue, 20 May 2025 21:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E87F9C4CEED;
	Tue, 20 May 2025 21:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747776331;
	bh=FCNh0IptjSh80eH+CVfsMlmlvLVALzpv2FwtcV3n7ag=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=k/zc6R9g4IGcsWMS5g9FRrSbMEwAuPBO6xeTI3aYQvkDIPrw7jEYQf4eBXcLbuKep
	 ApH4aK8G6zlw/+k3RK6TmGTaMvBCaZEPKHiLx9l+2TKrfRtzvgGeOmSTuh+VjH9+mo
	 Yf1fz2Gemqi+t399nvUmwGCdAe2NC0jPcqA8hpOR0qZ+rrYX+3NAJ5urb7UWc9Sls0
	 0syMfuk5Wyp+7qUt7+oYqj+D8kfI8+J0qbii876QDCXqqPrH29Nsk5bvDdc2w9xQDx
	 xEjdFycI8TT8esLLQqMXgJ5WP2DukC52mLK1C+59BEuXXqtgGcfBbbnQFxJ+02MPvk
	 zA5MVGPdjhymQ==
Date: Tue, 20 May 2025 16:25:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
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
Subject: Re: [PATCH v6 13/16] PCI/AER: Rename struct aer_stats to aer_report
Message-ID: <20250520212529.GA1301402@bhelgaas>
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
In-Reply-To: <8624dd16-83a3-4fd3-a5d9-a79c50236e58@linux.intel.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 19, 2025 at 08:30:09PM -0700, Sathyanarayanan Kuppuswamy wrote:
> 
> On 5/19/25 2:35 PM, Bjorn Helgaas wrote:
> > From: Karolina Stolarek <karolina.stolarek@oracle.com>
> > 
> > Update name to reflect the broader definition of structs/variables that are
> > stored (e.g. ratelimits). This is a preparatory patch for adding rate limit
> > support.
> > 
> > Link: https://lore.kernel.org/r/20250321015806.954866-6-pandoh@google.com
> > Signed-off-by: Karolina Stolarek <karolina.stolarek@oracle.com>
> > Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
> > ---
> 
> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> >   drivers/pci/pcie/aer.c | 50 +++++++++++++++++++++---------------------
> >   include/linux/pci.h    |  2 +-
> >   2 files changed, 26 insertions(+), 26 deletions(-)
> > 
> > diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> > index 06a7dda20846..da62032bf024 100644
> > --- a/drivers/pci/pcie/aer.c
> > +++ b/drivers/pci/pcie/aer.c
> > @@ -54,11 +54,11 @@ struct aer_rpc {
> >   	DECLARE_KFIFO(aer_fifo, struct aer_err_source, AER_ERROR_SOURCES_MAX);
> >   };
> > -/* AER stats for the device */
> > -struct aer_stats {
> > +/* AER report for the device */
> > +struct aer_report {
> 
> For me aer_report also sounds like stats like struct. I prefer
> aer_info, but it is up to you.

I tend to agree and can imagine a future where we might collect the
stats, ratelimits, and maybe aer_capability_regs into a per-device AER
structure.  "aer_info" seems like a decent generic name, so I did
s/\<aer_stats\>/aer_info/

