Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D8F670061F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 12:58:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHm3146XRz3fX4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 20:58:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g4BrRDZ2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=g4BrRDZ2;
	dkim-atps=neutral
X-Greylist: delayed 65 seconds by postgrey-1.36 at boromir; Fri, 12 May 2023 20:57:53 AEST
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHm290lx9z3bxC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 20:57:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683889073; x=1715425073;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aTme5qDkFV7Mcp0uaOboKBbeV5ze/dqrLO9cBA/tElE=;
  b=g4BrRDZ26SRO3RPeMPtYnW28fyTalpC6MNLSxqO2S3AwyV1LP3PIekYQ
   +WfTsS0/yBfl5eh1rMt05RyEMGjFEFKh/rYWcGBdtB0ThbarlNNw4uJ+g
   nh3W/rd2Kx9MrS09fXFEPZPm0TrFEEwNcXDgfgO9Qs6g004vyuFS3mt/L
   mPeloXQJbPpw+e3LzwnAaOQm6i3K0r71den818DHoAURSQ7ynQdB8qmDa
   Ju9OL1hLoZ/qDXczLs5p/drnEZGPBhDeX+NhRUwQSHZN8zu5F0W9PtwV3
   EuCcbRBghyS0b+/sRRC7sbBswz+Gj4GZZDLM7FAEtfxPYbelXtxtknr2R
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="414132462"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="414132462"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2023 03:56:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="812041055"
X-IronPort-AV: E=Sophos;i="5.99,269,1677571200"; 
   d="scan'208";a="812041055"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 12 May 2023 03:56:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pxQRq-0004Zv-0i;
	Fri, 12 May 2023 13:56:30 +0300
Date: Fri, 12 May 2023 13:56:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Message-ID: <ZF4bXaz2r75dlA5g@smile.fi.intel.com>
References: <20230404161101.GA3554747@bhelgaas>
 <20230509182122.GA1259567@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509182122.GA1259567@bhelgaas>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-kernel@vger.kernel.org, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian
  Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-mips@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 09, 2023 at 01:21:22PM -0500, Bjorn Helgaas wrote:
> On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> > On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > > Provide two new helper macros to iterate over PCI device resources and
> > > convert users.
> 
> > Applied 2-7 to pci/resource for v6.4, thanks, I really like this!
> 
> This is 09cc90063240 ("PCI: Introduce pci_dev_for_each_resource()")
> upstream now.
> 
> Coverity complains about each use,

It needs more clarification here. Use of reduced variant of the macro or all of
them? If the former one, then I can speculate that Coverity (famous for false
positives) simply doesn't understand `for (type var; var ...)` code.

>	sample below from
> drivers/pci/vgaarb.c.  I didn't investigate at all, so it might be a
> false positive; just FYI.
> 
> 	  1. Condition screen_info.capabilities & (2U /* 1 << 1 */), taking true branch.
>   556        if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
>   557                base |= (u64)screen_info.ext_lfb_base << 32;
>   558
>   559        limit = base + size;
>   560
>   561        /* Does firmware framebuffer belong to us? */
> 	  2. Condition __b < PCI_NUM_RESOURCES, taking true branch.
> 	  3. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.
> 	  6. Condition __b < PCI_NUM_RESOURCES, taking true branch.
> 	  7. cond_at_most: Checking __b < PCI_NUM_RESOURCES implies that __b may be up to 16 on the true branch.
> 	  8. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.
> 	  11. incr: Incrementing __b. The value of __b may now be up to 17.
> 	  12. alias: Assigning: r = &pdev->resource[__b]. r may now point to as high as element 17 of pdev->resource (which consists of 17 64-byte elements).
> 	  13. Condition __b < PCI_NUM_RESOURCES, taking true branch.
> 	  14. Condition (r = &pdev->resource[__b]) , (__b < PCI_NUM_RESOURCES), taking true branch.
>   562        pci_dev_for_each_resource(pdev, r) {
> 	  4. Condition resource_type(r) != 512, taking true branch.
> 	  9. Condition resource_type(r) != 512, taking true branch.
> 
>   CID 1529911 (#1 of 1): Out-of-bounds read (OVERRUN)
>   15. overrun-local: Overrunning array of 1088 bytes at byte offset 1088 by dereferencing pointer r. [show details]
>   563                if (resource_type(r) != IORESOURCE_MEM)
> 	  5. Continuing loop.
> 	  10. Continuing loop.
>   564                        continue;

-- 
With Best Regards,
Andy Shevchenko


