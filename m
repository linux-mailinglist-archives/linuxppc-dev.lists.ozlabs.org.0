Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D84261615E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 12:02:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2P9f5XY3z3cGv
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Nov 2022 22:02:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X/yUMd3C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mga02.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=X/yUMd3C;
	dkim-atps=neutral
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2P8j10l6z2xl6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Nov 2022 22:01:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667386901; x=1698922901;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=d5QvCOMsjMBr33OdD5oCaZxykkRV0ETIs7RVP9U9RZc=;
  b=X/yUMd3CIERjFf01mDmpy4GhppiF3xGyGiH7/A8HV9ldXzmOdD4bS0m9
   wrFIg+vHKbGlRjtCmCCBI+dq7v19+MMOJyA8XHPg1hM77ZkXafqAhJicJ
   Ob105Q2t3VZFZmO/Q13ularMUtbaaNU+w8qYVfIc8jCRhaVJ+MMH/YvgP
   0CxJ+IdDrlE+YBKEhLzOf/y0KKsrR5kBCYYa5W9+lu1afBCECLV7IbcqV
   ORv0VzKPgX3dA5ehc40yXUfdzMPICZdo04joOoxR89rqfVNktFVIw8ovI
   41ovUH7M4BC3+MjLgMTTSSf403Y5B6oF1m0aX1fPe/u0Wv8PbYDJ6GTfI
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="296820624"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="296820624"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2022 04:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10518"; a="634222033"
X-IronPort-AV: E=Sophos;i="5.95,232,1661842800"; 
   d="scan'208";a="634222033"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga002.jf.intel.com with ESMTP; 02 Nov 2022 04:01:33 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1oqBUx-0068pG-1t;
	Wed, 02 Nov 2022 13:01:31 +0200
Date: Wed, 2 Nov 2022 13:01:31 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 0/2] gpiolib: more cleanups to get rid of of_node
Message-ID: <Y2JOCyWZfWnWZWHv@smile.fi.intel.com>
References: <20221005152947.71696-1-andriy.shevchenko@linux.intel.com>
 <Y1LsjgEHXz621by6@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y1LsjgEHXz621by6@smile.fi.intel.com>
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

On Fri, Oct 21, 2022 at 10:01:34PM +0300, Andy Shevchenko wrote:
> On Wed, Oct 05, 2022 at 06:29:45PM +0300, Andy Shevchenko wrote:
> > One more user outside of GPIO library and pin control folders needs
> > to be updated to use fwnode instead of of_node. To make this easier
> > introduce a helper in property.h and convert the user.
> > 
> > Note, the helper will be useful not only for the current users,
> > but any future ones that want to replace of_device_is_compatible()
> > with analogous fwnode API.
> > 
> > Changelog v2:
> > - placed new helper correctly in the property.h
> 
> Any comments on the series?

I'm going to apply this to my branch with Sakari's tag since there is no answer
from PPC maintainers for a month.

-- 
With Best Regards,
Andy Shevchenko


