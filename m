Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 335A671EEF2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 18:28:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QXBQT6K2Hz3dxY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 02:28:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DXyv5Jd8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DXyv5Jd8;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QXBPb5nWrz3cj7
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 02:27:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685636868; x=1717172868;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Re3XUbJYE5wz7BKtwG+m2aCGFJz7ak2dDNPkBnP/kmg=;
  b=DXyv5Jd8EvnelQT+WD7qmdduZ4wHScauIm50WY1huSbZ9BBhAAjKLwiR
   fW4qrOJcTZWGcTIYHKUpXXI/O45Vz4mk7+6apqrSsMdWYQACyoWVOXLI5
   mkLAxtb4VsUnzUGT8LMEmRD3bdttQqod0IwvMSPqgtom6Oz9goiwBHQ2V
   DVzWH34437+QP77b2UX17eUcxDaOFg/v/Voy7u8v4Pkw/zHov9uzOeiii
   89XsthAwtY3slFOUeTDYQd4m1Pp9QPYaGLYVj093J4Pz4+2IaSzZuCAkE
   evk6ZZ3T049RTwGImhYBlldnHt2QnqQkNnyuUNixXJ5srZpxd9pvfsax0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="345169938"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="345169938"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2023 09:27:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10728"; a="657859553"
X-IronPort-AV: E=Sophos;i="6.00,210,1681196400"; 
   d="scan'208";a="657859553"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga003.jf.intel.com with ESMTP; 01 Jun 2023 09:27:34 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1q4l98-000SZF-0S;
	Thu, 01 Jun 2023 19:27:30 +0300
Date: Thu, 1 Jun 2023 19:27:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jonas Gorski <jonas.gorski@gmail.com>
Subject: Re: [PATCH v8 0/7] Add pci_dev_for_each_resource() helper and update
 users
Message-ID: <ZHjG8cBIdZsjhDOe@smile.fi.intel.com>
References: <ZF6YIezraETr9iNM@bhelgaas>
 <ZHZpcli2UmdzHgme@bhelgaas>
 <CAOiHx==5YWhDiZP2PyHZiJrmtqRzvqCqoSO59RwuYuR85BezBg@mail.gmail.com>
 <ZHjGik12vSFgi1eO@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZHjGik12vSFgi1eO@smile.fi.intel.com>
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
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, =?iso-8859-1?Q?Micka=EBl_Sala=FCn?= <mic@digikod.net>, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, linux-alpha@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 01, 2023 at 07:25:46PM +0300, Andy Shevchenko wrote:
> On Wed, May 31, 2023 at 08:48:35PM +0200, Jonas Gorski wrote:
> > On Tue, 30 May 2023 at 23:34, Bjorn Helgaas <helgaas@kernel.org> wrote:
> > > On Fri, May 12, 2023 at 02:48:51PM -0500, Bjorn Helgaas wrote:

...

> > > Where are we at?  Are we going to ignore this because some Coverity
> > > reports are false positives?
> > 
> > Looking at the code I understand where coverity is coming from:
> > 
> > #define __pci_dev_for_each_res0(dev, res, ...)                         \
> >        for (unsigned int __b = 0;                                      \
> >             res = pci_resource_n(dev, __b), __b < PCI_NUM_RESOURCES;   \
> >             __b++)
> > 
> >  res will be assigned before __b is checked for being less than
> > PCI_NUM_RESOURCES, making it point to behind the array at the end of
> > the last loop iteration.
> 
> Which is fine and you stumbled over the same mistake I made, that's why the
> documentation has been added to describe why the heck this macro is written
> the way it's written.
> 
> Coverity sucks.
> 
> > Rewriting the test expression as
> > 
> > __b < PCI_NUM_RESOURCES && (res = pci_resource_n(dev, __b));
> > 
> > should avoid the (coverity) warning by making use of lazy evaluation.
> 
> Obviously NAK.
> 
> > It probably makes the code slightly less performant as res will now be
> > checked for being not NULL (which will always be true), but I doubt it
> > will be significant (or in any hot paths).

Oh my god, I mistakenly read this as bus macro, sorry for my rant,
it's simply wrong.

-- 
With Best Regards,
Andy Shevchenko


