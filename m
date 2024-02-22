Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3287185FE8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 17:57:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UFMz9Kat;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgfSt0sHXz3vX7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 03:57:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UFMz9Kat;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgfS4346wz3dHD
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 03:56:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708620996; x=1740156996;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=huc/iR8sXK46IqfaL7hOgtCi7xC9fXmaG1/DxLXN/s4=;
  b=UFMz9KatITb48RfwFqebNjNFvUmHqRbXtIPvy8S3jwvdc31CIDDajMkf
   QT2m/hAmMNdObUazIKIjdCAWa4VGcQ4R1j5/0epGz35sNHeXP+0VHiMIf
   OCmdkZKzMBPkROOhsqA0ssNVpfE8H7RLuVuySrVCNL1l2LrWRoAJE2KvB
   HR87bvwPcma190yIAJ1jOi6yCpsoPSj9pmkefy9Xmv71+oMzb8tMSj/6C
   cWsA+StIs41lyoCU/+LJgY14MpbySo5o6mngsW00k6w4bcXyfTIgyb+d5
   NK4Gc1op6YnWHD8rJWWNQhaONsQ7/9maS6YrqnZJZgOB7NIS55BsIWTfb
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="6679415"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="6679415"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:56:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913555622"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="913555622"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 08:56:29 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdCN0-00000006gK3-18Lx;
	Thu, 22 Feb 2024 18:56:26 +0200
Date: Thu, 22 Feb 2024 18:56:26 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 1/5] net: wan: Add support for QMC HDLC
Message-ID: <Zdd8ukxdhH16vRDJ@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
 <20240222142219.441767-2-herve.codina@bootlin.com>
 <ZddoQTg32unJJ_qP@smile.fi.intel.com>
 <20240222174501.4cbe03ab@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222174501.4cbe03ab@bootlin.com>
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, Yury Norov <yury.norov@gmail.com>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 22, 2024 at 05:45:01PM +0100, Herve Codina wrote:
> On Thu, 22 Feb 2024 17:29:05 +0200
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> > On Thu, Feb 22, 2024 at 03:22:14PM +0100, Herve Codina wrote:

...

> > > +	spin_lock_irqsave(&qmc_hdlc->tx_lock, flags);  
> > 
> > Why not using cleanup.h from day 1?
> 
> I don't know about cleanup.h.
> Can you tell me more ?
> How should I use it ?
> 
> > > +end:  
> > 
> > This label, in particular, will not be needed with above in place.
> > 
> > > +	spin_unlock_irqrestore(&qmc_hdlc->tx_lock, flags);
> > > +	return ret;
> > > +}  

Here are the examples:
6191e49de389 ("pinctrl: baytrail: Simplify code with cleanup helpers")
1d1b4770d4b6 ("platform/x86/intel/vsec: Use cleanup.h")
e2eeddefb046 ("pstore: inode: Convert mutex usage to guard(mutex)")

Some advanced stuff:
ced085ef369a ("PCI: Introduce cleanup helpers for device reference counts and locks")

Hope this helps.

-- 
With Best Regards,
Andy Shevchenko


