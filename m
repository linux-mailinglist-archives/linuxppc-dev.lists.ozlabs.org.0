Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 345E96D09E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 17:40:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnSKj0z3Kz3fBv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 02:40:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CDadiUse;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CDadiUse;
	dkim-atps=neutral
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnSJn43hrz3c8G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 02:39:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680190761; x=1711726761;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2y+Qd+RESrzEa/F9wmN52tzUziPss+ZxjSltCa9P/hk=;
  b=CDadiUseP1WuKfP71C6XeaejIssdG4+TnK3pIAI+TYJHYvKlbBk7k7l7
   J96oQtDlQPiAzIKd+i1/1XGxje+IbBqiGrVHCZh8ccmDYiZF06gH+WXdJ
   koy7ouP2E95566Pm0ixBcIf7SAa5+x7xAUYRKhNmkLC0IbfICu5qAH3tu
   MkCg0eNORThCk0rNv4VeGOjqfCZajDXqM7wADi471nIaiJ+nfUF9Zbj25
   woJnHjNCYEiJAcxruzMUt9IthzqC3wty+5vom8ZFSqlgYafP2pUOAC7ya
   gru4YVne8ZY/patY4ISezOoF2Vd8IHy9qqbLn0Zq68s9bUTEEtxvFO/Ck
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="368984330"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="368984330"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 08:39:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678241953"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; 
   d="scan'208";a="678241953"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 08:38:56 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1phuMV-00AURJ-0P;
	Thu, 30 Mar 2023 18:38:51 +0300
Date: Thu, 30 Mar 2023 18:38:50 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: kernel test robot <oliver.sang@intel.com>
Subject: Re: [PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take
 less arguments
Message-ID: <ZCWtCpQBAM7oR6ra@smile.fi.intel.com>
References: <20230323173610.60442-4-andriy.shevchenko@linux.intel.com>
 <202303302009.55848372-oliver.sang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202303302009.55848372-oliver.sang@intel.com>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, linux-pci@vger.kernel.org, Dominik Brodowski <linux@dominikbrodowski.net>, linux-mips@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>, Andrew Lunn <andrew@lunn.ch>, sparclinux@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>, lkp@intel.com, Yoshinori Sato <ysato@users.sourceforge.jp>, Gregory Clement <gregory.clement@bootlin.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Russell King <linux@armlinux.org.uk>, linux-acpi@vger.kernel.org, Bjorn Helgaas <helgaas@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, xen-devel@lists.xenproject.org, Matt Turner <mattst88@gmail.com>, Anatolij Gustschin <agust@denx.de>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Niklas Schnelle <schnelle@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Ivan Kokshaysky <ink@jurassic
 .park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, oe-lkp@lists.linux.dev, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 30, 2023 at 09:24:21PM +0800, kernel test robot wrote:
> 
> Greeting,
> 
> FYI, we noticed various errors such like
>     "i40e: probe of 0000:3d:00.0 failed with error -12"
> due to commit (built with gcc-11):
> 
> commit: d23d5938fd7ced817d6aa1ff86cd671ebbaebfc2 ("[PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take less arguments")
> url: https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/kernel-h-Split-out-COUNT_ARGS-and-CONCATENATE/20230324-013857
> base: https://git.kernel.org/cgit/linux/kernel/git/pci/pci.git next
> patch link: https://lore.kernel.org/all/20230323173610.60442-4-andriy.shevchenko@linux.intel.com/
> patch subject: [PATCH v7 3/6] PCI: Allow pci_bus_for_each_resource() to take less arguments
> 
> in testcase: boot
> 
> on test machine: 96 threads 2 sockets Intel(R) Xeon(R) Gold 6252 CPU @ 2.10GHz (Cascade Lake) with 512G memory
> 
> caused below changes (please refer to attached dmesg/kmsg for entire log/backtrace):
> 
> 
> If you fix the issue, kindly add following tag
> | Reported-by: kernel test robot <oliver.sang@intel.com>
> | Link: https://lore.kernel.org/oe-lkp/202303302009.55848372-oliver.sang@intel.com

Thanks, that is useful test!

-- 
With Best Regards,
Andy Shevchenko


