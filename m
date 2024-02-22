Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4311885FD0A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 16:51:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3NZv4TS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgd0x1976z3vXP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 02:51:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N3NZv4TS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.9; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tgd0C6p7Dz3cp1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 02:50:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708617052; x=1740153052;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=LtZSACAXUNjJ5/i2hJMB9PJg2gM46nS3S99u+jVf0ok=;
  b=N3NZv4TSFjbX7y7oDgPgqHqkjw6ZFkuAacZk29XsFvRiSUgV/8ojpI2f
   5VUaoy/xGg4YkADY+Ki6rpsn0aVNrCQS/ptFjdXcHfWK4eLOjxIiGWYRL
   zotMQRWWjBjVb6awTAS2XpT8n4fYA0CYK3j1K80+d+GQlZKMcfm9rnc8w
   yJZFgn7utzKz393XZ0As7xDOSd+lvgnrDv9N/E1tRZ8zGyOwFXRb5g4dv
   e+Eh3DQ53th9sPlog4wGyLMiDJZB93SjiQQbzKeR7wkSEhu0nwXDwtPEj
   Wo+UWIMdX2o5SK3CKH1l1R7uHGJVyVD+FB9b5RVLS9rK+fTUW6T+YwrNv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="13551088"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="13551088"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:50:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="827566298"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="827566298"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:50:44 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdBLN-00000006fVD-0oAA;
	Thu, 22 Feb 2024 17:50:41 +0200
Date: Thu, 22 Feb 2024 17:50:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 0/5] Add support for QMC HDLC
Message-ID: <ZddtUJqer3zLGc-B@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240222142219.441767-1-herve.codina@bootlin.com>
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

On Thu, Feb 22, 2024 at 03:22:13PM +0100, Herve Codina wrote:
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
> 
> Compared to the previous iteration:
>   https://lore.kernel.org/linux-kernel/20240212075646.19114-1-herve.codina@bootlin.com/
> this v4 series mainly:

From my point of view after addressing the few non-critical issues
the v4 will be final. Thank you!

-- 
With Best Regards,
Andy Shevchenko


