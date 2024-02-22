Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2603485FCB0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 16:41:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xj0uvqvU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgcnH0l1Lz3dXY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 02:41:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Xj0uvqvU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.15; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgcmY736Wz30NP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 02:40:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708616446; x=1740152446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NhgsP69e5xaKaQR3joSaVyGX8rbvAFpibr82fzzEjYs=;
  b=Xj0uvqvURQUU+KAN1aiTM1IfXSdWJx1axIwVQTKMXAB5+f1V9mwozCDY
   T/nI5DFtoEN2+1GpgZ6kq4w5DTBnUoraNAwjbDtMEPE1Pp59Oy9YOpWjv
   qefiX3p5HI91gkYaJPMYkvY2icttfsc40GuuQ2EoSOXWtN3r83BEtA877
   6+WSoCUcWXO86TUW9BUE2DBDaUaphAX2Uv33aH/zA6ZtZiutPuaBJNqEO
   cnAzp/dUDtw7C822e7bdTMfUDC9nIeb87OJrMKOysMV3/yqFcoQtelZwU
   FsLxaicjhwsI5zfsL1cal8LYd6/wo+CU1hotWBt4zOx3SbvhxnJIhfeE8
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="2985699"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="2985699"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:40:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10992"; a="913544497"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="913544497"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 07:40:39 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rdBBc-00000006fMg-2Odk;
	Thu, 22 Feb 2024 17:40:36 +0200
Date: Thu, 22 Feb 2024 17:40:36 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Herve Codina <herve.codina@bootlin.com>
Subject: Re: [PATCH v4 3/5] lib/bitmap: Introduce bitmap_scatter() and
 bitmap_gather() helpers
Message-ID: <Zddq9P6B1Qy3MAlr@smile.fi.intel.com>
References: <20240222142219.441767-1-herve.codina@bootlin.com>
 <20240222142219.441767-4-herve.codina@bootlin.com>
 <Zddqr3aN4rU-upai@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zddqr3aN4rU-upai@smile.fi.intel.com>
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

On Thu, Feb 22, 2024 at 05:39:27PM +0200, Andy Shevchenko wrote:
> On Thu, Feb 22, 2024 at 03:22:16PM +0100, Herve Codina wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

> > The original work was done by Andy Shevchenko.
> 
> Mine SoB is enough for a credit, but thank you :-)

That said, you forgot to add your Co-developed-by.

-- 
With Best Regards,
Andy Shevchenko


