Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 846106D76E7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 10:29:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PryV64drkz3cF7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 18:29:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fwPVLNfC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fwPVLNfC;
	dkim-atps=neutral
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PryTC3p5Lz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 18:28:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680683327; x=1712219327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wrn29fWEWUh9DQE7oDLC0JoUgdEFYGWX1tgF9OvmiyE=;
  b=fwPVLNfCSBBIQ3/lOy6KgoCoj5Ng49PdfkiIC61dMQV+9vk2K4CELZIO
   z89Yw0F2NXGP12zr3uSbhQEyix3OX7tIZDrGgaOuJ9R6v0fZdBCmj1z46
   TVxf+Reb7fJLH3uho7TCmnmWLXPI2C1gj2ivX2HjLASLH1MGcC8hOZMQI
   zl5N3N0FpvYLJcgKp2BhfFg0TGW3SisBdAuVcljvPhyB99hIj0snhCeL+
   f+fuLRyCv7HcUotuUJumc/xzF8VmL3zDSnrz05Pd5+jNNWeNm9pjzujUD
   Q4kn0Twmde0Pyf3YWocTKnV6R43wMZ2N3Bel0XUjDW+p69ckpCihZn/MH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="344113424"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="344113424"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 01:28:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="751192534"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="751192534"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga008.fm.intel.com with ESMTP; 05 Apr 2023 01:28:32 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pjyVH-00CkZe-2G;
	Wed, 05 Apr 2023 11:28:27 +0300
Date: Wed, 5 Apr 2023 11:28:27 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Message-ID: <ZC0xK4YJrKga7akk@smile.fi.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
 <20230404161101.GA3554747@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230404161101.GA3554747@bhelgaas>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@
 physik.fu-berlin.de>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 04, 2023 at 11:11:01AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 30, 2023 at 07:24:27PM +0300, Andy Shevchenko wrote:
> > Provide two new helper macros to iterate over PCI device resources and
> > convert users.
> > 
> > Looking at it, refactor existing pci_bus_for_each_resource() and convert
> > users accordingly.
> > 
> > Note, the amount of lines grew due to the documentation update.
> > 
> > Changelog v8:
> > - fixed issue with pci_bus_for_each_resource() macro (LKP)
> > - due to above added a new patch to document how it works
> > - moved the last patch to be #2 (Philippe)
> > - added tags (Philippe)
> > 
> > Changelog v7:
> > - made both macros to share same name (Bjorn)
> 
> I didn't actually request the same name for both; I would have had no
> idea how to even do that :)
> 
> v6 had:
> 
>   pci_dev_for_each_resource_p(dev, res)
>   pci_dev_for_each_resource(dev, res, i)
> 
> and I suggested:
> 
>   pci_dev_for_each_resource(dev, res)
>   pci_dev_for_each_resource_idx(dev, res, i)
> 
> because that pattern is used elsewhere.

Ah, sorry I misinterpreted your suggestion (I thought that at the end of
the day you wanted the macro to be less intrusive, so we change less code,
that's why I interpreted it the way described in the Changelog).

> But you figured out how to do
> it, and having one name is even better, so thanks for that extra work!

You are welcome!

> > - split out the pci_resource_n() conversion (Bjorn)
> > 
> > Changelog v6:
> > - dropped unused variable in PPC code (LKP)
> > 
> > Changelog v5:
> > - renamed loop variable to minimize the clash (Keith)
> > - addressed smatch warning (Dan)
> > - addressed 0-day bot findings (LKP)
> > 
> > Changelog v4:
> > - rebased on top of v6.3-rc1
> > - added tag (Krzysztof)
> > 
> > Changelog v3:
> > - rebased on top of v2 by Mika, see above
> > - added tag to pcmcia patch (Dominik)
> > 
> > Changelog v2:
> > - refactor to have two macros
> > - refactor existing pci_bus_for_each_resource() in the same way and
> >   convert users
> > 
> > Andy Shevchenko (6):
> >   kernel.h: Split out COUNT_ARGS() and CONCATENATE()
> >   PCI: Introduce pci_resource_n()
> >   PCI: Document pci_bus_for_each_resource() to avoid confusion
> >   PCI: Allow pci_bus_for_each_resource() to take less arguments
> >   EISA: Convert to use less arguments in pci_bus_for_each_resource()
> >   pcmcia: Convert to use less arguments in pci_bus_for_each_resource()

...

> Applied 2-7 to pci/resource for v6.4, thanks, I really like this!

Btw, can you actually drop patch 7, please?
After I have updated the documentation I have realised that why the first
chunk is invalid. It needs mode careful check and rework.

> I omitted
> 
>   [1/7] kernel.h: Split out COUNT_ARGS() and CONCATENATE()"
> 
> only because it's not essential to this series and has only a trivial
> one-line impact on include/linux/pci.h.

I'm not sure I understood what exactly "essentiality" means to you, but
I included that because it makes the split which can be used later by
others and not including kernel.h in the header is the objective I want
to achieve. Without this patch the achievement is going to be deferred.
Yet, this, as you have noticed, allows to compile and use the macros in
the rest of the patches.

P.S. Thank you for the review and application of the rest!

-- 
With Best Regards,
Andy Shevchenko


