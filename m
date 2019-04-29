Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C097FE39F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 15:22:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44t51K5CnkzDqRh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 23:22:29 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44t4y63fSczDqQl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 23:19:41 +1000 (AEST)
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Apr 2019 06:19:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,409,1549958400"; d="scan'208";a="146675438"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by orsmga003.jf.intel.com with ESMTP; 29 Apr 2019 06:19:32 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hL6Bu-0008Ek-Oe; Mon, 29 Apr 2019 16:19:30 +0300
Date: Mon, 29 Apr 2019 16:19:30 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Subject: Re: [PATCH 37/41] drivers: tty: serial: 8250: simplify io resource
 size computation
Message-ID: <20190429131930.GE9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-38-git-send-email-info@metux.net>
 <20190428152103.GP9224@smile.fi.intel.com>
 <431b36fe-3071-fcfd-b04e-b4b293e79a80@metux.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <431b36fe-3071-fcfd-b04e-b4b293e79a80@metux.net>
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

On Mon, Apr 29, 2019 at 08:48:53AM +0200, Enrico Weigelt, metux IT consult wrote:
> On 28.04.19 17:21, Andy Shevchenko wrote:

> >> +#define SERIAL_RT2880_IOSIZE	0x100
> > 
> > And why this is in the header file and not in corresponding C one?
> 
> hmm, no particular reason, maybe just an old habit to put definitions
> into .h files ;-)
> 
> I can move it to 8250_of.c if you like me to.

Please, do.

-- 
With Best Regards,
Andy Shevchenko


