Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C02C6C6BF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 16:11:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pj82628cCz3fFM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 02:11:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MIhFTlJ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.100; helo=mga07.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MIhFTlJ0;
	dkim-atps=neutral
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pj81673bDz3cj9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 02:10:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679584251; x=1711120251;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pTI3sfGhxuNt+eJ92X/zV2v4CxfKcZ1sf1RhNp36ij0=;
  b=MIhFTlJ07PDxcZK1/sHIXtUyPoW3qDwbD7Lp+ZR4HsNj5c2eEMg//5ne
   0D+DbmNLREVNSQKu7F/LEdT+I4iGUjhhMO4qlMVN69JYGhCcn9tPnH4ul
   mAW6lwuNj5ZBBYVPpFvNMbsRo+zjaXb6VD8CT+NM+L2NMZcPpk75QYu7L
   Brafr2u5lvTpfF2tVfAs+EUKtKvJNyeVILg/Y6S8OF401bLiS17S8aAca
   JjEiIbCVXZytkRzJuqWMBpyv1p4pbn/6A2zxVcdAmEL+zBXCP6hX9MPXr
   RgA5YOpVLXj4jqDeaBd1bsnS4FfJnOggVAh1i4ZKiC82S4Kz33StOHQAf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="404419872"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="404419872"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2023 08:09:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10658"; a="793046100"
X-IronPort-AV: E=Sophos;i="5.98,285,1673942400"; 
   d="scan'208";a="793046100"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 23 Mar 2023 08:08:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pfMYZ-007YBs-1j;
	Thu, 23 Mar 2023 17:08:47 +0200
Date: Thu, 23 Mar 2023 17:08:47 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [PATCH v6 1/4] PCI: Introduce pci_dev_for_each_resource()
Message-ID: <ZBxrfy83MRjnReAs@smile.fi.intel.com>
References: <ZBxiaflGTeK8Jlgx@smile.fi.intel.com>
 <20230323150238.GA2550157@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230323150238.GA2550157@bhelgaas>
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
 physik.fu-berlin.de>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 23, 2023 at 10:02:38AM -0500, Bjorn Helgaas wrote:
> On Thu, Mar 23, 2023 at 04:30:01PM +0200, Andy Shevchenko wrote:

...

> I poked around looking for similar patterns elsewhere with:
> 
>   git grep "#define.*for_each_.*_p("
>   git grep "#define.*for_each_.*_idx("
> 
> I didn't find any other "_p" iterators and just a few "_idx" ones, so
> my hope is to follow what little precedent there is, as well as
> converge on the basic "*_for_each_resource()" iterators and remove the
> "_idx()" versions over time by doing things like the
> pci_claim_resource() change.

The p is heavily used in the byte order conversion helpers.

> What do you think?  If it seems like excessive churn, we can do it
> as-is and still try to reduce the use of the index variable over time.

I think _p has a precedent as well. But I can think about it a bit, maybe
we can come up with something smarter.

-- 
With Best Regards,
Andy Shevchenko


