Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8B5466BAE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Dec 2021 22:29:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J4pxM3sFlz3bXc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 08:29:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.120; helo=mga04.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J4pws60Knz2yX8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Dec 2021 08:28:44 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="235579174"
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="235579174"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 13:27:39 -0800
X-IronPort-AV: E=Sophos;i="5.87,282,1631602800"; d="scan'208";a="500916052"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2021 13:27:37 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mstb9-001Xbx-7o; Thu, 02 Dec 2021 23:26:35 +0200
Date: Thu, 2 Dec 2021 23:26:34 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Leo Li <leoyang.li@nxp.com>
Subject: Re: [PATCH v2 3/3] soc: fsl: Replace kernel.h with the necessary
 inclusions
Message-ID: <Yak6Co4lO761HmWG@smile.fi.intel.com>
References: <20211110105952.62013-1-andriy.shevchenko@linux.intel.com>
 <20211110105952.62013-3-andriy.shevchenko@linux.intel.com>
 <YZJExzxJ4j8g6jEY@smile.fi.intel.com>
 <AS8PR04MB8946B4800AE34258F7F2BA688F989@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <YZN7+UlXtJi8/i1L@smile.fi.intel.com>
 <YZ0WlMyS36Gj565C@smile.fi.intel.com>
 <CADRPPNT3yhr3jAPZm=hcON3nd97eLSrkWqFBV6kh6W5gf0w3Xg@mail.gmail.com>
 <YaiS2iHCrGkXgTdX@smile.fi.intel.com>
 <AS8PR04MB894640E4FF4EB7D01604049E8F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AS8PR04MB894640E4FF4EB7D01604049E8F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Qiang Zhao <qiang.zhao@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 02, 2021 at 08:01:54PM +0000, Leo Li wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Thursday, December 2, 2021 3:33 AM
> > On Wed, Dec 01, 2021 at 01:41:16PM -0600, Li Yang wrote:
> > > On Tue, Nov 23, 2021 at 10:32 AM Andy Shevchenko
> > > <andriy.shevchenko@linux.intel.com> wrote:

...

> > > The build test is good.  I have applied it for next.  Thanks.
> > 
> > Thanks, what about MAINTAINERS updates? I don't see them neither in next
> > nor in your tree.
> 
> I am ok with these MAINTAINERS updates.  I thought you want to send them directly to Linus.  I can take them if you like.

I was just pointing out that it would be good that you (as a maintainer of SOC
FSL) have them applied and pushed for the current cycle, but they are not code
fixes anyway, so it's not critical.

TL;DR: Yes, please take them, thanks!

-- 
With Best Regards,
Andy Shevchenko


