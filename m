Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB2B6C7B27
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 10:22:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjcD86ysXz3fSh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 20:22:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MZ4I2U6i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MZ4I2U6i;
	dkim-atps=neutral
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjcCD6dhwz3fFM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 20:21:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679649673; x=1711185673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=Zv6p5PxBUIwRGR/FQTKCtRGfcJDPVTzeoNo7mhbkHhY=;
  b=MZ4I2U6inIy02FjMozYrQ1OgG1SIEYnUccmCPAmXCnkbeqp6zolhRsKC
   U2ujPh3qJVckuTBwto/enz5fbvXXsdWxRAqJw9/33qgQGackWDsNYb97F
   CMb2icl45ffum8/53Qev7Vlqyh9QPpo/k9/CDKeGW7vs+zRMKj+M+hA3C
   pU8q/XrfCRHFFymgo48cYHlcLGk00+bU8XpFFvPeL64H0Dk0tv0t2NO+I
   XoYDfzkslo40ANAOHT+4Nw4t3hkUcIY4cO4LpUqEyHnwR4fLRqaYLLvx6
   qd3UAYlUehhVtAPuBVRM0B5rIv3HNtETufTfX+8GjpRGZLUY4F7Fe/065
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="320129750"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="320129750"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2023 02:21:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="771814725"
X-IronPort-AV: E=Sophos;i="5.98,287,1673942400"; 
   d="scan'208";a="771814725"
Received: from smile.fi.intel.com ([10.237.72.54])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Mar 2023 02:20:59 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pfdbS-007qWb-1l;
	Fri, 24 Mar 2023 11:20:54 +0200
Date: Fri, 24 Mar 2023 11:20:54 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Subject: Re: [PATCH v7 6/6] PCI: Make use of pci_resource_n()
Message-ID: <ZB1rdkOgwwSC2Pxf@smile.fi.intel.com>
References: <20230323173610.60442-1-andriy.shevchenko@linux.intel.com>
 <20230323173610.60442-7-andriy.shevchenko@linux.intel.com>
 <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1722e75c-bc06-4a34-5e12-fa3622ed86a3@linaro.org>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 24, 2023 at 10:08:39AM +0100, Philippe Mathieu-Daudé wrote:
> On 23/3/23 18:36, Andy Shevchenko wrote:
> > Replace open-coded implementations of pci_resource_n() in pci.h.

...

> >   #define pci_resource_n(dev, bar)	(&(dev)->resource[(bar)])
> > -#define pci_resource_start(dev, bar)	((dev)->resource[(bar)].start)
> > -#define pci_resource_end(dev, bar)	((dev)->resource[(bar)].end)
> > -#define pci_resource_flags(dev, bar)	((dev)->resource[(bar)].flags)
> > -#define pci_resource_len(dev,bar) \
> > -	((pci_resource_end((dev), (bar)) == 0) ? 0 :	\
> > -							\
> > -	 (pci_resource_end((dev), (bar)) -		\
> > -	  pci_resource_start((dev), (bar)) + 1))
> > +#define pci_resource_start(dev, bar)	(pci_resource_n(dev, bar)->start)
> > +#define pci_resource_end(dev, bar)	(pci_resource_n(dev, bar)->end)
> > +#define pci_resource_flags(dev, bar)	(pci_resource_n(dev, bar)->flags)
> > +#define pci_resource_len(dev,bar)					\
> > +	(pci_resource_end((dev), (bar)) ? 				\
> > +	 resource_size(pci_resource_n((dev), (bar))) : 0)
> 
> Seems (to me) more logical to have this patch as "PCI: Introduce
> pci_resource_n()" ordered before your patch #2 "PCI: Introduce
> pci_dev_for_each_resource()".

Either way works for me. Bjorn, what do you like?

> Here as #6 or as #2:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thank you!

-- 
With Best Regards,
Andy Shevchenko


