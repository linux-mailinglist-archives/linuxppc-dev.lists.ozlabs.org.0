Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 24924FB2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 16:14:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tk770W9jzDqS7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2019 00:14:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.20; helo=mga02.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tk2V0pWgzDqRD
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2019 00:10:40 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Apr 2019 07:10:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,414,1549958400"; d="scan'208";a="342158227"
Received: from smile.fi.intel.com (HELO smile) ([10.237.72.86])
 by fmsmga006.fm.intel.com with ESMTP; 30 Apr 2019 07:10:31 -0700
Received: from andy by smile with local (Exim 4.92)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1hLTSn-0006VO-Gw; Tue, 30 Apr 2019 17:10:29 +0300
Date: Tue, 30 Apr 2019 17:10:29 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH 22/41] drivers: tty: serial: cpm_uart: fix logging calls
Message-ID: <20190430141029.GK9224@smile.fi.intel.com>
References: <1556369542-13247-1-git-send-email-info@metux.net>
 <1556369542-13247-23-git-send-email-info@metux.net>
 <a00ba23b-e73e-c964-a6d0-347cb605b8c8@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a00ba23b-e73e-c964-a6d0-347cb605b8c8@c-s.fr>
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
Cc: lorenzo.pieralisi@arm.com, linux-ia64@vger.kernel.org, macro@linux-mips.org,
 linuxppc-dev@lists.ozlabs.org, andrew@aj.id.au, gregkh@linuxfoundation.org,
 slemieux.tyco@gmail.com, liviu.dudau@arm.com, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux@prisktech.co.nz, matthias.bgg@gmail.com,
 khilman@baylibre.com, linux-serial@vger.kernel.org, sudeep.holla@arm.com,
 sparclinux@vger.kernel.org, jacmet@sunsite.dk,
 linux-amlogic@lists.infradead.org, vz@mleia.com, "Enrico Weigelt,
 metux IT consult" <info@metux.net>, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 05:59:04PM +0200, Christophe Leroy wrote:
> Le 27/04/2019 à 14:52, Enrico Weigelt, metux IT consult a écrit :
> > Fix checkpatch warnings by using pr_err():
> > 
> >      WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> >      #109: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:109:
> >      +		printk(KERN_ERR
> > 
> >      WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> >      #128: FILE: drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c:128:
> >      +		printk(KERN_ERR
> > 
> >      WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> >      +           printk(KERN_ERR
> > 
> >      WARNING: Prefer [subsystem eg: netdev]_err([subsystem]dev, ... then dev_err(dev, ... then pr_err(...  to printk(KERN_ERR ...
> >      +           printk(KERN_ERR
> > 
> > Signed-off-by: Enrico Weigelt <info@metux.net>
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
> 
> But is that really worth doing those changes ?
> 
> If we want to do something useful, wouldn't it make more sense to introduce
> the use of dev_err() in order to identify the faulting device in the message
> ?

+1 for switching to dev_*().

-- 
With Best Regards,
Andy Shevchenko


