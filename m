Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8796C8737E3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:39:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WlHq0du2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqYT41tKwz3vfD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:39:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WlHq0du2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqYSM4RfMz3cPX
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 00:39:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709732355; x=1741268355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=EWzERcgJ3gRSC618OjmqDgGRixGjDHjDqIOjuHDHl/E=;
  b=WlHq0du2yUiwq5ulaFoLmB7fLCzqyTcpFr1Acpzut+w5t+5G03TybQgT
   tJHo9f1XQHjmY4BhZmmxiCF3tVZ4WemfbniVgFRpxSRKlEojYNc1GTS0S
   7gD1LFVMjlAi+gLBZjcmQUHp57iuNuIPfqwV/h5pcCV38JqXQyI4vRLZE
   q1ga9xHHL0C/cT6kfpJMCCnTl8ULW7XZm0HMXjAwbxdLA0LpYjMxd8mUj
   qQjJhteG0gfltnW6LH124lc2J1FzZ4X5FSVlqku6hplvOdpNHCH62ZNDw
   xB6qSrcEl17vlI+7BCJ/g0QUew7OlCieNsfja2zLm3Oafm6zBJtomiCmM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="4207819"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="4207819"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 05:39:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11004"; a="914178648"
X-IronPort-AV: E=Sophos;i="6.06,208,1705392000"; 
   d="scan'208";a="914178648"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2024 05:39:09 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rhrUA-0000000AHHd-3JzQ;
	Wed, 06 Mar 2024 15:39:06 +0200
Date: Wed, 6 Mar 2024 15:39:06 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v6 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
Message-ID: <Zehx-v7h38TPJWwe@smile.fi.intel.com>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
 <20240306080726.167338-4-herve.codina@bootlin.com>
 <Zehrd/VgW5AnfJEu@yury-ThinkPad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zehrd/VgW5AnfJEu@yury-ThinkPad>
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

On Wed, Mar 06, 2024 at 05:11:19AM -0800, Yury Norov wrote:
> On Wed, Mar 06, 2024 at 09:07:19AM +0100, Herve Codina wrote:

...

> Signed-off-by: Yury Norov <yury.norov@gmail.com>

Why? Shouldn't be Acked-by?

> Would you like to move this with the rest of the series? If so please
> pull my Sof-by, otherwise I can move it with bitmap-for-next.

-- 
With Best Regards,
Andy Shevchenko


