Return-Path: <linuxppc-dev+bounces-8854-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8D2AC003B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 May 2025 00:59:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b2n1Z3krlz2ydv;
	Thu, 22 May 2025 08:59:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747868386;
	cv=none; b=MPK4PZr4uP0aefWkaKPkXts96r8ss0k+BE+AOTGbFLn3Tc7nPqJ5UkY1eFLo/kbvd71wX7zBSZ1eOFJjUfWOhNqSF5tjPhyqB+HNIcjjfYijmzSHU+JMdxcB0dmde1rIXEzHuNTdr9vTZ0O6uyQWslqZxFDoZ159ywIBQgli67WDw5VHCiOVeqhWUrrxo3UjiUGonb3f//Khm4BlBwGgVmTCMyM+v5XNGaQa+ab2xbMLawLgizbr2dObFRURGdScfDmd+iltNbx8IrzHFiT2vndLnS1DOQZTKNlM+xvsOAKwlOwb4jgC38hkezRp8oIHnlEi5NXl8lO5RKJ9GMA/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747868386; c=relaxed/relaxed;
	bh=ZR/kDHwPURIh29TjVAWZdEOXSxYann+CiU+0lOdJ4Yw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=OMLkBe59akUWCv6C270Uv0Nm2sidDKyfrbDSj7CqzqgjLp4eUbJP2wnMG2teQ4krfjKNqKTOdiI7ciwv7Tt3vrghFJ6PSa0WolU3qJjd42f+sNsjkeiLFxBo0M4lzpVzbLPHlQheCBc7ynYyP0bvGny2uiJUzPDRxIho8jIjRQUNcd1XdJhvfzgJrqT5ZlMgbRm4/vkJDlpCn6AleHxQ+SzahRGfMFOzutuvLiWK6pSd+DD/g1C3vlHQY+XDT4fmIwMth1DzvPfEMYuyqSt0H+8jsn8ajRrURxMivVYbz9EvtAOyg/Mvo4kYtftHUceXoVp97Qku1kacq9i4OlUvow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iazKkXCX; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iazKkXCX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b2n1Y582Hz2ydt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 May 2025 08:59:45 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D1D2B5C5A6B;
	Wed, 21 May 2025 22:57:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7092BC4CEE4;
	Wed, 21 May 2025 22:59:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747868383;
	bh=IbhrjqjCd+IL+OzZrKr4UCUXAEgx35sVZsX2gaP8Cs8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=iazKkXCXaj/wq12Dr4QVfxGACmZ2mHC0jptz6htAaLWZf9BN+4m5ku+D+0PA8AemS
	 B9ycUgm/A7JPDBgVLs+RIf3beXTuqVbQrIWcQbNPP2mhgdmXQnsToMEqxmQkLFo4mc
	 Sxiu/jdiTMhKHTjeRcrzen6HOsu1AdPAri+wB5TPB85CzPopbBUZyT+BQNjaz3LjF5
	 JD6VLT4AfBZJFQPGJtJwQJuQbx1YlTPUWSEnoTAAhJyX4thfIbsgQGlf92hrqUDcAK
	 GtmjihJFKjDmOlHGMBPLgKMHKcgemgh9+R0Ihwj/HxQip7+fGb3HKT8BGlWn8EiKWy
	 igNF5NhEiqbzw==
Date: Wed, 21 May 2025 17:59:42 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-pci@vger.kernel.org, Jon Pan-Doh <pandoh@google.com>,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	Weinan Liu <wnliu@google.com>,
	Martin Petersen <martin.petersen@oracle.com>,
	Ben Fuller <ben.fuller@oracle.com>,
	Drew Walton <drewwalton@microsoft.com>,
	Anil Agrawal <anilagrawal@meta.com>,
	Tony Luck <tony.luck@intel.com>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Lukas Wunner <lukas@wunner.de>, Sargun Dhillon <sargun@meta.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Kai-Heng Feng <kaihengf@nvidia.com>,
	Keith Busch <kbusch@kernel.org>, Robert Richter <rrichter@amd.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Shiju Jose <shiju.jose@huawei.com>,
	Dave Jiang <dave.jiang@intel.com>, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v7 17/17] PCI/AER: Add sysfs attributes for log ratelimits
Message-ID: <20250521225942.GA1452275@bhelgaas>
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
In-Reply-To: <20250521114600.00007010@huawei.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 21, 2025 at 11:46:00AM +0100, Jonathan Cameron wrote:
> On Tue, 20 May 2025 16:50:34 -0500
> Bjorn Helgaas <helgaas@kernel.org> wrote:
> 
> > From: Jon Pan-Doh <pandoh@google.com>
> > 
> > Allow userspace to read/write log ratelimits per device (including
> > enable/disable). Create aer/ sysfs directory to store them and any
> > future aer configs.
> ...

> There is some relatively new SYSFS infra that I think will help
> make this slightly nicer by getting rid of the extra directory when
> there is nothing to be done with it.

> > +#define aer_ratelimit_burst_attr(name, ratelimit)			\
> > +	static ssize_t							\
> > +	name##_show(struct device *dev, struct device_attribute *attr,	\
> > +		    char *buf)						\
> > +{									\
> 
> A little odd looking to indent this less than the line above.

Yep, fixed.

> > +const struct attribute_group aer_attr_group = {
> > +	.name = "aer",
> > +	.attrs = aer_attrs,
> > +	.is_visible = aer_attrs_are_visible,
> > +};
> 
> There are a bunch of macros to simplify cases where
> a whole group is either enabled or not and make the group
> itself go away if there is nothing to be shown.
> 
> DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE() combined with
> SYSFS_GROUP_VISIBLE() around the assignment does what we
> want here I think.
> 
> Whilst we can't retrofit that stuff onto existing ABI
> as someone may be assuming directory presence, we can
> make sysfs less cluttered for new stuff.
> 
> Maybe I'm missing why that doesn't work here though!

Is this something we can fix later, or are we locking ourselves into
user-visible ABI that's hard to change?  I'm kind of against the wall
relative to the v6.16 merge window and haven't had time to dig into
this part.

