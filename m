Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AA5F5755
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 17:20:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjJD60fSyz3c87
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 02:20:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gtyhx3t7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=gtyhx3t7;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjJC73QrLz2xrK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 02:19:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1664983171; x=1696519171;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MhpH7OK6hRIKWqO2KUFUVILuqkRWDlod+ealvOdarCM=;
  b=gtyhx3t7vXLyD/LXAsYvnRksHG/Ae3Hhp083Eplk7NVge4ovqTfUuzW3
   0vjfwuFsmG5pjAFB1HmOfL2LpxiGq2R37bxnKt+tRRZecwLEVD1v8v6h0
   KT786p0AwJbpsC/4QTlerAgwMOQeH6sL8q9EqOPcfjM9C00McfWCtXKxs
   3qZnVKizVoUOaBAcApwyTEo9008b/Jgv3KSXURhNU6fVKryL66I+A2Xt3
   mEvRl/KdgPg0cxS4oqWT8I/Sf4oHdb6ZbATj8ac8jfzmVGV5gkvzl1U2K
   okh/DXqV9rrgsO85hV7CeiHjsP6lB9igUYJZuZGs1pZwk5dK3zFXP9fcp
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="290430557"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="290430557"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2022 08:19:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10491"; a="602041976"
X-IronPort-AV: E=Sophos;i="5.95,161,1661842800"; 
   d="scan'208";a="602041976"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga006.jf.intel.com with ESMTP; 05 Oct 2022 08:19:24 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1og6B9-002iJB-02;
	Wed, 05 Oct 2022 18:19:23 +0300
Date: Wed, 5 Oct 2022 18:19:22 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v1 1/2] device property: Introduce
 fwnode_device_is_compatible() helper
Message-ID: <Yz2genlaPcji+XKp@smile.fi.intel.com>
References: <20221005143812.33503-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005143812.33503-1-andriy.shevchenko@linux.intel.com>
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
Cc: Daniel Scally <djrscally@gmail.com>, Li Yang <leoyang.li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 05, 2022 at 05:38:11PM +0300, Andy Shevchenko wrote:
> The fwnode_device_is_compatible() helper searches for the
> given string in the "compatible" string array property and,
> if found, returns true.

Scratch this, it has some flaws.

-- 
With Best Regards,
Andy Shevchenko


