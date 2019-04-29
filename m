Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C517BE6B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:41:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t85S2lBtzDqQX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 01:41:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t8415YMPzDqH5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:40:00 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 08:39:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,410,1549958400"; d="scan'208";a="295503882"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by orsmga004.jf.intel.com with ESMTP; 29 Apr 2019 08:39:51 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hL8Nh-0001DD-6k; Mon, 29 Apr 2019 18:39:49 +0300
Date: Mon, 29 Apr 2019 18:39:49 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 36/41] drivers: tty: serial: 8250: store mmio resource
 size in port struct
Message-ID: <20190429153949.GV9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-37-git-send-email-info@metux.net>
 <20190428151848.GO9224@smile.fi.intel.com>
 <4bab941a-c2f2-7f1c-9bc2-86c63f171c25@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bab941a-c2f2-7f1c-9bc2-86c63f171c25@metux.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sparclinux@vger.kernel.org, lorenzo.pieralisi@arm.com,
 linux-ia64@vger.kernel.org, linux-serial@vger.kernel.org, andrew@aj.id.au,
 gregkh@linuxfoundation.org, sudeep.holla@arm.com, liviu.dudau@arm.com,
 linux-kernel@vger.kernel.org, vz@mleia.com, linux@prisktech.co.nz,
 linuxppc-dev@lists.ozlabs.org, khilman@baylibre.com, macro@linux-mips.org,
 slemieux.tyco@gmail.com, matthias.bgg@gmail.com, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 04:55:05PM +0200, Enrico Weigelt, metux IT consult wrote:
> On 28.04.19 17:18, Andy Shevchenko wrote:
> > On Sat, Apr 27, 2019 at 02:52:17PM +0200, Enrico Weigelt, metux IT consult wrote:

> >> -	int ret = 0;
> > 
> > This and Co is a separate change that can be done in its own patch.
> 
> I don't really understand :(
> Do you mean the splitting off the retval part from the rest ?

You do two things here: one of them is removing ret and other relative changes.
This should be split to a separate patch.

> > You may increase readability by introducing temporary variables
> > 
> > 	... mapbase = port->mapbase;
> > 	... mapsize = port->mapsize;
> > 	...
> > 	port->membase = ioremap_nocache(mapbase, mapsize);
> > 	...
> 
> Is that really necessary ? Maybe it's just my personal taste, but I
> don't feel the more more verbose one is really easier to read.

Up to Greg. For me it's harder to read all those port-> in several parameters.


-- 
With Best Regards,
Andy Shevchenko


