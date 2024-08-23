Return-Path: <linuxppc-dev+bounces-483-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAEE95DE9D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Aug 2024 16:55:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wrg3m6K4qz2yDl;
	Sun, 25 Aug 2024 00:55:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.19
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724430408;
	cv=none; b=baBO4K8bLDcSTl37UiUiJ6FdyIThsZkkly5QH+mx+91InVOJ1Rpqqovtd74GP8hlqolgX4jUOUZxubJnnMFubzjBURLBnfXU9FmJBA2Ivw47sAxXQ+YheYRmNykZ60vlNn5eSQYVb7xSHNvTpgV4d8wbLnF54r+mRLeJQIr/j3XYvpuzLVpIV/zlH3n/oKsHSeuFKXukKiuCpBmXGtdzs8V0rJEUWM98s3x7s13/YKnloZWrq8lJoyHEE5nmwL3uDzYeW8OHlbKQXnIybDqD0VrCety4t1LbIRwDcR5lS/7+Nb7dJUuq4zzrv31KtSu6nCHyHtuXTPk3qSxfVU1vvw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724430408; c=relaxed/relaxed;
	bh=1tgCp52BeQ3GuQFGGw9oRJf5OSpB1kNiXmptQPSBOGg=;
	h=X-Greylist:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization; b=cs8BA/tUrM7u7pvyT0CHoOTUOwrxEDVDMkUoWYeC7cjKtcqLbysDGWNXV9a+lXIDANYG1P/+ShnQqEipr5w2zX7pxGCIG6hTKE6zx04/Jf304g5pol1V7s9Lrtzf1/M6fkkdYaxdd2hlefJgDUiF4LvR6r536BDMXgDmH7K2tZwRoj5KKTCLE8J6sMX1Vw752408ObQt2bRCWhs//xmo9MNIbsqIT7V3AnFuG7+lXxTev0tUoJSiokzRDEfbCfmHPSQcHlMKi+7zc0TDIH9ZysYecENKvck4WPlI/338cBoXl/2G+EQaRAaIkhBtxVb3bk2qVVU2WXtWzlSQxKx/8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yp3qPSba; dkim-atps=neutral; spf=pass (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Yp3qPSba;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.19; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Sat, 24 Aug 2024 02:26:46 AEST
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr57B08NTz2yhM;
	Sat, 24 Aug 2024 02:26:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724430407; x=1755966407;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3XMbUYBDHmzNIbQnFO5jFhgJPAAWpbvUV37uWE91XYY=;
  b=Yp3qPSbaquNhdZljkmVEWyYgsanJyua0HJejIbWnRzV+1giJONvk+UtH
   Y4GPIosXInSMAwI9rv7nvYMrxs7VXqMkGn2joWjlsyqLFWsQgtTXSUu+O
   +Cp/hK6X9wdb5Qy17efxLsaCLlX7m+6UwvUiJr4zcUG2+xATb+v9zZ/Xq
   cp++g3+uNqM+s/AEIXkaBVG0OFF5vXl0R9Ibc8rx6MKvfUVJtXnoNxMFo
   dsVFtPzKJ2RcNGnq+Yfub5kkRmaN+kjl7My/33Yk0j3cGK8wPdpkk1Db6
   89qBLDQ4djT4zr/XMBOls8Mkdl1cz+pOu9PaUW+aeAOH/lytBxlYpsDEz
   Q==;
X-CSE-ConnectionGUID: DlKAphOiTyWRQwFSfyf8ZQ==
X-CSE-MsgGUID: JWyjluTTSRyG1N/Imqr6kg==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="22504148"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="22504148"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 09:25:35 -0700
X-CSE-ConnectionGUID: TyAhmqenSA+fGrOHJsVz6g==
X-CSE-MsgGUID: lexLTyUnSgSoAmUAGKiMPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="61694525"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 09:25:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1shX5I-00000000r8v-11Le;
	Fri, 23 Aug 2024 19:24:20 +0300
Date: Fri, 23 Aug 2024 19:24:19 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Russell King <linux@armlinux.org.uk>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org,
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Subject: Re: [PATCH 0/9] AT24 EEPROM MTD Support
Message-ID: <Zsi3s9XithGEROwX@smile.fi.intel.com>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Jul 01, 2024 at 03:53:39PM +0200, Marco Felsch wrote:
> This series adds the intial support to handle EEPROMs via the MTD layer
> as well. This allow the user-space to have separate paritions since
> EEPROMs can become quite large nowadays.
> 
> With this patchset applied EEPROMs can be accessed via:
>   - legacy 'eeprom' device
>   - nvmem device
>   - mtd device(s)
> 
> The patchset targets only the AT24 (I2C) EEPROMs since I have no access
> to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.
> 
> Note: I'm not familiar with Kconfig symbol migration so I don't know if
> the last patch is required at the moment. Please be notified that the
> list of recipients is quite large due to the defconfig changes.

FWIW, I think that MTD is *not* the place for EEPROMs.

Yeah, we have the driver spread over the kernel for EEPROMs (mostly due to
historical reasons and absence an umbrella subsystem for them), but it's not
the reason to hack them into something which is not quite suitable.

If NVMEM needs to be updated and may cover these cases after all (and do not
forget about *small* size EEPROMs that most likely appear on the devices with
limited amount of resources!) in a reasonable size and performance, why not?

-- 
With Best Regards,
Andy Shevchenko



