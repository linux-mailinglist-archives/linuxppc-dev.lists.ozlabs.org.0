Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90CDF6D7BFF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 13:51:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps2zd3Rncz3cT4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 21:51:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AcHFfKGO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.31; helo=mga06.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AcHFfKGO;
	dkim-atps=neutral
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps2yg21JRz3bTJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 21:51:05 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680695467; x=1712231467;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CNsMJe3NJRh194M0JTRSE7YPi2b+rJpnYVMeT8Rmlsg=;
  b=AcHFfKGOby3VlEYHE8H18ypAxk3bukBg1na1l1BX/+jzjNMh+CzTulB4
   eSgXqIVO5d5TxTVW4et0ByQKqWUNii4qm6DdwnzReyztXQa93aq1Ek+cx
   q7zizqXlbQfCKX/kQubtu/VOhu6pk5PxhEsNVJrc6Z6ceuX9G1jcY6ubs
   R75MpKi9QtqHM0TYamKVISb9AxFdhUOUGE/LHRh69vSv6vcmlHUqFAyar
   BLjP3SVXtcsliQdVzKvycGpLNgZaz13cmBAHqowLgYU688OGqrWcAmz0h
   ZDFTg89Oyute+BZIp8iag2I3sYOFPwcZfw98qFvOxP4sSiY6A9CvDZ48D
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="405207776"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="405207776"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2023 04:51:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10670"; a="797887729"
X-IronPort-AV: E=Sophos;i="5.98,319,1673942400"; 
   d="scan'208";a="797887729"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP; 05 Apr 2023 04:50:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pk1f5-00ColQ-2n;
	Wed, 05 Apr 2023 14:50:47 +0300
Date: Wed, 5 Apr 2023 14:50:47 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
	"Maciej W. Rozycki" <macro@orcam.me.uk>,
	Juergen Gross <jgross@suse.com>,
	Dominik Brodowski <linux@dominikbrodowski.net>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-pci@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v8 5/7] PCI: Allow pci_bus_for_each_resource() to take
 less arguments
Message-ID: <ZC1glzw4F9F8zCK+@smile.fi.intel.com>
References: <20230330162434.35055-1-andriy.shevchenko@linux.intel.com>
 <20230330162434.35055-6-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230330162434.35055-6-andriy.shevchenko@linux.intel.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Stefano Stabellini <sstabellini@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Gregory Clement <gregory.clement@bootlin.com>, Richard Henderson <richard.henderson@linaro.org>, Russell King <linux@armlinux.org.uk>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Rich Felker <dalias@libc.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Miguel Ojeda <ojeda@kernel.org>, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, "David S. Miller" <davem@davemloft.net>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 30, 2023 at 07:24:32PM +0300, Andy Shevchenko wrote:
> Refactor pci_bus_for_each_resource() in the same way as it's done in
> pci_dev_for_each_resource() case. This will allow to hide iterator
> inside the loop, where it's not used otherwise.
> 
> No functional changes intended.

Bjorn, this has wrong author in your tree:

https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git/commit/?h=resource&id=46dbad19a59e0dd8f1e7065e5281345797fbb365

Or did I misinterpret something?

-- 
With Best Regards,
Andy Shevchenko


