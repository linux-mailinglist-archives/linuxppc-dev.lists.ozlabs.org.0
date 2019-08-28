Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 240829FF2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 12:10:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JM1S1L5jzDr1K
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 20:10:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.intel.com
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JLyr10d6zDqjY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 20:07:46 +1000 (AEST)
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Aug 2019 03:07:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,440,1559545200"; d="scan'208";a="210115035"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by fmsmga002.fm.intel.com with ESMTP; 28 Aug 2019 03:07:40 -0700
Received: from andy by smile with local (Exim 4.92.1)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1i2urb-0006RD-2L; Wed, 28 Aug 2019 13:07:39 +0300
Date: Wed, 28 Aug 2019 13:07:39 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Subject: Re: [PATCH v1 2/2] PCI/AER: Update parameter descriptions to satisfy
 kernel-doc validator
Message-ID: <20190828100739.GJ2680@smile.fi.intel.com>
References: <20190827151823.75312-1-andriy.shevchenko@linux.intel.com>
 <20190827151823.75312-2-andriy.shevchenko@linux.intel.com>
 <71eb8108-61a7-2815-4082-75c21f8bbf03@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <71eb8108-61a7-2815-4082-75c21f8bbf03@linux.intel.com>
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 27, 2019 at 10:06:54AM -0700, Kuppuswamy Sathyanarayanan wrote:
> 
> On 8/27/19 8:18 AM, Andy Shevchenko wrote:
> > Kernel-doc validator complains:
> > 
> > aer.c:207: warning: Function parameter or member 'str' not described in 'pcie_ecrc_get_policy'
> > aer.c:1209: warning: Function parameter or member 'irq' not described in 'aer_isr'
> > aer.c:1209: warning: Function parameter or member 'context' not described in 'aer_isr'
> > aer.c:1209: warning: Excess function parameter 'work' description in 'aer_isr'
> > 
> > Fix the above accordingly.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> Reviewed-by: Kuppuswamy Sathyanarayanan
> <sathyanarayanan.kuppuswamy@linux.intel.com>

Thanks!
JFYI: Keep your tag on one line. Some bots require this IIRC (patchwork).

-- 
With Best Regards,
Andy Shevchenko


