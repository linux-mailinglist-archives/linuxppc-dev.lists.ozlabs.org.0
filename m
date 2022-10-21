Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0589B607E98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Oct 2022 21:02:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MvDP75Xm4z3dwh
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Oct 2022 06:02:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cmREGR46;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=cmREGR46;
	dkim-atps=neutral
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MvDNB1b2Nz3brh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Oct 2022 06:01:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666378906; x=1697914906;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KEST6tJWT2v7gvYlEM0LvQZkO/ctHEeheF3BY2Di7TQ=;
  b=cmREGR46jMlgcrUOQJDedDHRM3SRpB9UE6I8nN5O/N0LRIgJgyDCTMCw
   CFJUGN/i+aKSAdIePDOs0HG3viZhkIVdU/tGfAcXDUsgDRC3Sf0E/wv51
   4kXzpoEuSDyFmyn5pHms5/gToidJir6BQWVXksHhJ33wcOk4souScmpQk
   Zd/tc1YsyWLdb2wKs7Sir9gfOStGETgN8vrmjyua7s+wvHFSZ/uvxV9XT
   FSc/7wMR0GMaueveoHgJRrhFJlu7l/TMhAAmGn0WKu4Vw6NIiipaGLTIw
   PIw9Xm8tOxuTSD5GxS7XTPhOqJu+xP7vt6HZ7myvBD95Xmnr1Nlp2vtGz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="305815049"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; 
   d="scan'208";a="305815049"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2022 12:01:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="959756321"
X-IronPort-AV: E=Sophos;i="5.95,202,1661842800"; 
   d="scan'208";a="959756321"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 21 Oct 2022 12:01:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1olxGw-0009M9-1o;
	Fri, 21 Oct 2022 22:01:34 +0300
Date: Fri, 21 Oct 2022 22:01:34 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpiolib: more cleanups to get rid of of_node
Message-ID: <Y1LsjgEHXz621by6@smile.fi.intel.com>
References: <20221005152947.71696-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005152947.71696-1-andriy.shevchenko@linux.intel.com>
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

On Wed, Oct 05, 2022 at 06:29:45PM +0300, Andy Shevchenko wrote:
> One more user outside of GPIO library and pin control folders needs
> to be updated to use fwnode instead of of_node. To make this easier
> introduce a helper in property.h and convert the user.
> 
> Note, the helper will be useful not only for the current users,
> but any future ones that want to replace of_device_is_compatible()
> with analogous fwnode API.
> 
> Changelog v2:
> - placed new helper correctly in the property.h

Any comments on the series?

-- 
With Best Regards,
Andy Shevchenko


