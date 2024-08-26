Return-Path: <linuxppc-dev+bounces-533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BC195EE85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 12:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsn8504jsz2yMv;
	Mon, 26 Aug 2024 20:33:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724668404;
	cv=none; b=Cvbxb6EyBZufgJdSAIE4lJiWlw8JZkO97TaA4cxV4d7LBuqyNfx3VRatIt4jHpjsf1oTXXJmy75iiccJKrNoyHIYEphE1rUM545bsnYjGhMdVA40m9s2LWTj9B6ZI8vlQFhSw4lL2tFtk9IGh6krQAiTmHZa6lPLcziwil9/ibMxzvCBDmZdqSZd+VCkm2v3elxw+7cXRQjcUzQBQLThlG9lJ5nkGZZ3ad0pWxRaygbUlZz6gc3J6iMK6ofK7bbkCN6dhZacqXWnjEdyE+bpqn9F4siOOrhOfkcMc8cHjeChlJy5h3Tmor5dFMUV1kSA9Zfkn3v1suzW2OnuetwhQA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724668404; c=relaxed/relaxed;
	bh=okBsmIRRsjrgFRIKVjJuBx4Ep3cJGc18c8OQ+v6lf/E=;
	h=DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:X-IronPort-AV:
	 X-IronPort-AV:Received:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization; b=NNtkxm6QsC+Zkj1k8yLtbxD1w39xrpf0fKGwXGIYL2hYZLxZCWlUwuBesHLt4oqaeSgVv2frli5duHL2pjb1qrXVeKhtOXaHbvRXg4vNAiz5Qy/qhg6bjRmrkeWXTFS/TDaONYrvwG4+f9rJtHnr1WDHwyPv8zbwiCMEwYFXJ2ZDyt7H1YVxmKCPYEiK0sTpBEzJ7KZT892Na69cCvb7Ez/wer5QCrzEcPhEx0d0478xBcnzU6WydpXSI+xVMTkVNQL/65ymFxGkiaKkuYzaN754pSa1ItjN6bzb9qSB9+PJdaW3E2n6sIxQk1Tk74dj1GTnKpHmUa5PXmeQ3y1c2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com; dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C2vGqVIr; dkim-atps=neutral; spf=pass (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org) smtp.mailfrom=intel.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C2vGqVIr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=intel.com (client-ip=192.198.163.16; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsn816rY8z2yD8;
	Mon, 26 Aug 2024 20:33:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724668403; x=1756204403;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8gNhFuofD5zWGUNIriljHUVsJipVG7nNNSIviq4tVXY=;
  b=C2vGqVIr3qUGTi7scRllQjLu6UqkVHgajVUCvfnhCANX776pHmx/Op2e
   ZhpcxBNQyobxElj4io+BsGYL9hZMQw6w13VtLywqudNZfYwnqGHVH9g7T
   t077QJ+yG5AipEyeie81Ys3JDQuCHshb0/rB8as2lHWW5y1Yng+dqzCay
   TNVV1mE5mlYXsVMuKNtlH/CWhON15M60NxhA5oUNGfoP3R/+xPn0sgE/u
   TogzQ2hlkX8bwoKjEb5vZibhkMt2NMBx75ikkVXJA/jDJlOkPT9XpKczc
   lnJ6xvpb+4PNj/6AbTA0dg012fn7S/V9jSGFj/z8yEHYKslSNldXjrLW/
   A==;
X-CSE-ConnectionGUID: os0fng5dSDuQ42z2eOrc5Q==
X-CSE-MsgGUID: Lmv+mgKmRUiGv14ZVo6paA==
X-IronPort-AV: E=McAfee;i="6700,10204,11175"; a="13208724"
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="13208724"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:33:13 -0700
X-CSE-ConnectionGUID: i7pAAaNJSrSUyr5xtjco/A==
X-CSE-MsgGUID: cTuMYcAhT2+25aitr3/fAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,177,1719903600"; 
   d="scan'208";a="62517541"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2024 03:33:01 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andriy.shevchenko@intel.com>)
	id 1siX1d-00000001pi8-1NQC;
	Mon, 26 Aug 2024 13:32:41 +0300
Date: Mon, 26 Aug 2024 13:32:26 +0300
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
Message-ID: <ZsxZuvY9MLyjog-y@smile.fi.intel.com>
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <Zsi3s9XithGEROwX@smile.fi.intel.com>
 <20240826075110.u3cxc6dootou72eq@pengutronix.de>
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
In-Reply-To: <20240826075110.u3cxc6dootou72eq@pengutronix.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Mon, Aug 26, 2024 at 09:51:10AM +0200, Marco Felsch wrote:
> On 24-08-23, Andy Shevchenko wrote:
> > On Mon, Jul 01, 2024 at 03:53:39PM +0200, Marco Felsch wrote:
> > > This series adds the intial support to handle EEPROMs via the MTD layer
> > > as well. This allow the user-space to have separate paritions since
> > > EEPROMs can become quite large nowadays.
> > > 
> > > With this patchset applied EEPROMs can be accessed via:
> > >   - legacy 'eeprom' device
> > >   - nvmem device
> > >   - mtd device(s)
> > > 
> > > The patchset targets only the AT24 (I2C) EEPROMs since I have no access
> > > to AT25 (SPI) EEPROMs nor to one of the other misc/eeprom/* devices.
> > > 
> > > Note: I'm not familiar with Kconfig symbol migration so I don't know if
> > > the last patch is required at the moment. Please be notified that the
> > > list of recipients is quite large due to the defconfig changes.
> > 
> > FWIW, I think that MTD is *not* the place for EEPROMs.
> > 
> > Yeah, we have the driver spread over the kernel for EEPROMs (mostly due to
> > historical reasons and absence an umbrella subsystem for them), but it's not
> > the reason to hack them into something which is not quite suitable.
> 
> Thank you for you input. There are two things to mention:
>  1st) I send a RFC patch and asked for feedback and all I got was: looks
>       okay, please send a proper patch [1] which I did.

I was on a long vacation, I haven't had time or even wishes to look at the
patches or patch series. Sorry for that.

Second point, RFC means "request for comments", here is mine. It's up to the
maintainers and you on how to proceed it.

>  2nd) I don't see the hacky part in this patchset.

I haven't talked about patchset, I have talked about architectural / design
point of view. I read the discussion and to me it seems like it solves the
issue with a quite big hammer. If you can prove that on embedded systems with
limited resources it is not a problem, just mention that in the cover letter.

> Anyway the customer doesn't need the nvmem-partitions anymore and
> therefore this patchset can be seen as obsolote.
> 
> [1] https://lore.kernel.org/lkml/20231201144441.imk7rrjnv2dugo7p@pengutronix.de/T/#m1e0e5778448971b50a883f62bd95622f6422b9a2
> 
> > If NVMEM needs to be updated and may cover these cases after all (and do not
> > forget about *small* size EEPROMs that most likely appear on the devices with
> > limited amount of resources!) in a reasonable size and performance, why not?

-- 
With Best Regards,
Andy Shevchenko



