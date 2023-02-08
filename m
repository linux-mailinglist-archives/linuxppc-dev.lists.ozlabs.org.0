Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C0CA68FADD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 00:07:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBwcN6VKSz3fcl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 10:07:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y4e0GXgw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Y4e0GXgw;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBnR64lWFz2yXJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 04:43:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675878210; x=1707414210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+jF3CDzzwW6yo4ozmXcRNVjpZY0lFCu8o1UhbMtHcsA=;
  b=Y4e0GXgwjSGXZjGrelID+VOuLCkKLYwedTS4ePmJyuhSQ2N8KwISYU/0
   V9N8OjBdX8dK3zLWu/uiVRpDvd6sLIYga7XB732Y53DZVUhc8FX0hALhM
   GJ4LS6PsfI9Y/+2xZt3DnfUVPsLL6hYDEMXPXeuyNLp3TB8KMkxV8uQ0h
   aFQJGbfn7GEfN6kFE654giieMM9lenptiAff+I5h7fCqg8l5PvBzsudAA
   z/Kf3x+1pQ4YVsaD+YujEPylp101ji2gt7Jti+ZpMRi4m8D7W19KpcObB
   GeEW3Znk4JMMLHmYEsjtbUtqBY5ws/sgeMOS3CnJ8npz3bVWKuBr1uGY4
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="317876327"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="317876327"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2023 09:43:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="996219805"
X-IronPort-AV: E=Sophos;i="5.97,281,1669104000"; 
   d="scan'208";a="996219805"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 08 Feb 2023 09:43:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1pPoTH-004EYe-0x;
	Wed, 08 Feb 2023 19:43:03 +0200
Date: Wed, 8 Feb 2023 19:43:02 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v4 02/18] ARM: s3c24xx: Use the right include
Message-ID: <Y+PfJr4l4U3DYpWT@smile.fi.intel.com>
References: <20230208173343.37582-1-andriy.shevchenko@linux.intel.com>
 <20230208173343.37582-3-andriy.shevchenko@linux.intel.com>
 <30234963-33e5-e2d7-a6ef-112e89efbdd0@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30234963-33e5-e2d7-a6ef-112e89efbdd0@linaro.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Mailman-Approved-At: Thu, 09 Feb 2023 09:48:32 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Alexander Aring <alex.aring@gmail.com>, Rich Felker <dalias@libc.org>, Devarsh Thakkar <devarsht@ti.com>, linux-doc@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>, Eric Dumazet <edumazet@google.com>, Thierry Reding <thierry.reding@gmail.com>, Alim Akhtar <alim.akhtar@samsung.com>, Miquel Raynal <miquel.raynal@bootlin.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Li Yang <leoyang.li@nxp.com>, Frank Rowand <frowand.list@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Qiang Zhao <qiang.zhao@nxp.com>, linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-samsung-soc@vger.kernel.org, Alex Shi <alexs@kernel.org>, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, linux-sh@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>, Lee Jones <lee@kernel.org>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Russell King <linux@armlinux.org.uk>, Jonatha
 n Hunter <jonathanh@nvidia.com>, linux-acpi@vger.kernel.org, SHA-cyfmac-dev-list@infineon.com, Geert Uytterhoeven <geert@linux-m68k.org>, Vincenzo Palazzo <vincenzopalazzodev@gmail.com>, linux-input@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>, Thierry Reding <treding@nvidia.com>, Kalle Valo <kvalo@kernel.org>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, Arend van Spriel <aspriel@gmail.com>, Nicholas Piggin <npiggin@gmail.com>, Hante Meuleman <hante.meuleman@broadcom.com>, linux-gpio@vger.kernel.org, linux-m68k@lists.linux-m68k.org, Yanteng Si <siyanteng@loongson.cn>, linux-tegra@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Franky Lin <franky.lin@broadcom.com>, brcm80211-dev-list.pdl@broadcom.com, Keerthy <j-keerthy@ti.com>, Yoshinori Sato <ysato@users.sourceforge.jp
 >, Mun Yew Tham <mun.yew.tham@intel.com>, Dipen Patel <dipenp@nvidia.com>, linux-wpan@vger.kernel.org, linux-doc-tw-discuss@lists.sourceforge.net, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, Michael Walle <michael@walle.cc>, Rob Herring <robh+dt@kernel.org>, netdev@vger.kernel.org, Aaro Koskinen <aaro.koskinen@iki.fi>, Hu Haowen <src.res@email.cn>, linuxppc-dev@lists.ozlabs.org, Gregory Clement <gregory.clement@bootlin.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 08, 2023 at 06:39:12PM +0100, Krzysztof Kozlowski wrote:
> On 08/02/2023 18:33, Andy Shevchenko wrote:

...

> It's not s3c24xx anymore, so subject prefix:
> ARM: s3c64xx:

Fixed locally, thanks.

-- 
With Best Regards,
Andy Shevchenko


