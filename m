Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB516757F11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 16:10:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DN7XKMRA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R51736RXqz3c4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jul 2023 00:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=DN7XKMRA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 66 seconds by postgrey-1.37 at boromir; Wed, 19 Jul 2023 00:09:22 AEST
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R516B3LNnz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jul 2023 00:09:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689689362; x=1721225362;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YhzlfQtbZbvU7crsK9NP3Zkf40qmEHwn35CPkp07c3s=;
  b=DN7XKMRAiHbN3poXB2X02Zl0+2c1N4WKi8F0jrANLxUjscnHBI53doIA
   CEUX9ina3slCa+QzEeHjKptcFXmpaQaF4Xw5BYvWQbFNC0MJlm5E4UZi2
   FSyV+Q1TPzj0y3qIZoxM+JEtKh3Nb+ID8Dtk97xmfT6GXm/RSFCw4BMqp
   t78InjyEJG/Bac4prSJtoVk39YkyrZwhmZft52kturvwnetAVNQSqSXgL
   AkhEHu9/CFXKWVOd6z/wNyJloQP7bogeaDxOs/vRwRGzQz2Q4l/4AtiBj
   fQT/Nok0aL2BVmMwo8c+hZMSfcEZwC+PQ83XW1kR0ied+F95Pik9O6qlc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="397053557"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="397053557"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jul 2023 07:08:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10775"; a="758804280"
X-IronPort-AV: E=Sophos;i="6.01,214,1684825200"; 
   d="scan'208";a="758804280"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP; 18 Jul 2023 07:08:06 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1qLlMy-00GQUQ-0w;
	Tue, 18 Jul 2023 17:08:04 +0300
Date: Tue, 18 Jul 2023 17:08:04 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: hanyu001@208suo.com
Subject: Re: [PATCH] platforms: 52xx: Remove space after '(' and before ')'
Message-ID: <ZLacxHz/IGgketWx@smile.fi.intel.com>
References: <tencent_ADAD5C6DD5F9824047356B25D53801910A06@qq.com>
 <c5c33e6e390f6784b5599b8ea13b8e01@208suo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c5c33e6e390f6784b5599b8ea13b8e01@208suo.com>
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
Cc: kw@linux.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, bhelgaas@google.com, agust@denx.de, mika.westerberg@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 18, 2023 at 05:02:39PM +0800, hanyu001@208suo.com wrote:
> The patch fixes the following errors detected by checkpatch:
> 
> platforms/52xx/mpc52xx_pci.c:346:ERROR: space prohibited after that open
> parenthesis '('
> platforms/52xx/mpc52xx_pci.c:347:ERROR: space prohibited after that open
> parenthesis '('
> platforms/52xx/mpc52xx_pci.c:348:ERROR: space prohibited before that close
> parenthesis ')'

First of all, your patch is mangled and may not be applied.
Second, we usually don't do this kind of patches at all.
Besides the fact that we don't run checkpatch on the files
which are already in upstream (esp. so-o-o old as this one).

NAK.

...

> +    if ((dev->vendor == PCI_VENDOR_ID_MOTOROLA) &&
> +         (dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200
> +          || dev->device == PCI_DEVICE_ID_MOTOROLA_MPC5200B)) {

Also note, you can move this to use pci_match_id().
That kind of patch might be approved.

-- 
With Best Regards,
Andy Shevchenko


