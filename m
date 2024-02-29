Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1E386CCD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 16:24:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FihuNdik;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlw4M36cDz3vb8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Mar 2024 02:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FihuNdik;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.20; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tlw3f5RtFz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Mar 2024 02:23:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709220223; x=1740756223;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0sy2ZSHMsNmRgHSSClE033djjcb7leBzhQfmozV+T4E=;
  b=FihuNdik0llLAxStExblaGmBQJ9h9IoZrof/cn9xDMZ/15D6x89n+uj9
   UtRN8kzkxkBlc3scN2VQ78fIMvuQvj19JVLqe5L24fGAjWtH/rd2R1Iht
   LNMiFZc0BnvsrVPolqFy9l4LXpRt3PJ1VXXTXyA1CDD1aqKG2/Ad5f6aC
   Fv7PZUFSgPHZ756S6bSfyXuzem8hmakfk584mjQt2jsMIdpxsYCET6Ez2
   rGhJsh+c2yENz90r8cu5wdspISzni8qfjD9JsOtFcDr2YLi9SpYTFjyHM
   qAyPtvTQjQSejFyltsAiP0cthJgjXcPRKVfKQdrGDu7v+vwXSTwF301Av
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3575064"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3575064"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:23:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="913984426"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="913984426"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 07:23:36 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rfiFw-00000008hib-27Mq;
	Thu, 29 Feb 2024 17:23:32 +0200
Date: Thu, 29 Feb 2024 17:23:32 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v5 0/5] Add support for QMC HDLC
Message-ID: <ZeChdAsAhrC8a75t@smile.fi.intel.com>
References: <20240229141554.836867-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240229141554.836867-1-herve.codina@bootlin.com>
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

On Thu, Feb 29, 2024 at 03:15:48PM +0100, Herve Codina wrote:
> Hi,
> 
> This series introduces the QMC HDLC support.
> 
> Patches were previously sent as part of a full feature series and were
> previously reviewed in that context:
> "Add support for QMC HDLC, framer infrastructure and PEF2256 framer" [1]
> 
> In order to ease the merge, the full feature series has been split and
> needed parts were merged in v6.8-rc1:
>  - "Prepare the PowerQUICC QMC and TSA for the HDLC QMC driver" [2]
>  - "Add support for framer infrastructure and PEF2256 framer" [3]
> 
> This series contains patches related to the QMC HDLC part (QMC HDLC
> driver):
>  - Introduce the QMC HDLC driver (patches 1 and 2)
>  - Add timeslots change support in QMC HDLC (patch 3)
>  - Add framer support as a framer consumer in QMC HDLC (patch 4)
> 
> Compare to the original full feature series, a modification was done on
> patch 3 in order to use a coherent prefix in the commit title.
> 
> I kept the patches unsquashed as they were previously sent and reviewed.
> Of course, I can squash them if needed.

I think it's a good series and next version will be final. The only question is
possible use of the returned values from bitmap_scatter()/bitmap_gather(), the
rest are minors.

Feel free to add
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
to patches 4 and 5.

-- 
With Best Regards,
Andy Shevchenko


