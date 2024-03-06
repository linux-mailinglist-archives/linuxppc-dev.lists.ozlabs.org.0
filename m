Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A57408737DE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:39:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fUdRUsLv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqYS7341rz3vYw
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:39:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fUdRUsLv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqYRL3FWCz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 00:38:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709732303; x=1741268303;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=G2rmJ+Q2gQEQNdkWWv7W1eo2pFGNMfvC8toDVdsvsyM=;
  b=fUdRUsLvd20meb/kGLwQ0W7y9MetShSE2RWfbAJ8P7332uJFE0b96E9b
   ja+kp5e9DC4LHjfzyN/vvl+AUr2A6RgQXuLT57+xTgMFzG89xJj8ewZol
   acXGAX3N6i+Q3nGdglIVGajO79sB9bJv3UGpWGPjQQyI/iioOxFwlPRxM
   I5KQ2ClFJOi4d+AGVkZpR0b9tp/9KCVqAQh2IB/6LuAdBQPBsfHmCCxW9
   P+ZW4LOjtAga228AIODoir3OSKzImdAAd+m0lQg9lNp18ew/r8GtcopJv
   Svt5zpe4haqGNp31mtbN92VMvicgiPnx4nCze5HvzNVlxWZMcPTTuA1zc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4207663"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4207663"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 05:38:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="914178599"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="914178599"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 05:38:13 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rhrTG-0000000AHH6-1kPA;
	Wed, 06 Mar 2024 15:38:10 +0200
Date: Wed, 6 Mar 2024 15:38:10 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v6 1/5] net: wan: Add support for QMC HDLC
Message-ID: <Zehxwo2wCLkZBQzc@smile.fi.intel.com>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
 <20240306080726.167338-2-herve.codina@bootlin.com>
 <ZehvV6kCD3RCumAL@yury-ThinkPad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZehvV6kCD3RCumAL@yury-ThinkPad>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Herve Codina <herve.codina@bootlin.com>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 06, 2024 at 05:27:51AM -0800, Yury Norov wrote:
> On Wed, Mar 06, 2024 at 09:07:17AM +0100, Herve Codina wrote:

...

> It's minor, but you can avoid conditionals doing something like:
> 
> 		netdev->stats.rx_over_errors += !!(flags & QMC_RX_FLAG_HDLC_OVF);

This is harder to read. And IIUC net subsystem dislikes the proposed one
(I tried to submit a patch to clarify some boolean types vs. integer ones
 and it was rejected because of the reason I have mentioned).

-- 
With Best Regards,
Andy Shevchenko


