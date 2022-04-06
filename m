Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 046A24F5EC4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 15:04:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYPqD0Mnwz3bXD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 23:04:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nkRDyZ8k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=nkRDyZ8k; dkim-atps=neutral
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYPpW2cyMz2yHp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 23:03:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649250227; x=1680786227;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pFQJLYTSIUtGGDkRMNXfH9mNCTySCEkxZaPD/bR+QOY=;
 b=nkRDyZ8kN1cXn2mL3mOiaV7l5+xbZqmVYSa61GwSpXtxw4HBm8MxnvQh
 5VNh+jxShpthXD5PTyRbA3qPapKHwBuFre3nM1Czfntz74ybFYOUtUQe8
 h56vYdnpjotA08Doc9Bp0GYNOFchz+x8Mp/KCLYFiKhVoTV4OiDXJTCHk
 NQqMW1iS48YPogCn7EK4CaW8eScqF6IwXGE2hACyfu8J9wRLSKrDDtgJp
 gqjiPmNpM7bTsV158wOVxRit7dohUcKwUQPQURiycnxJJsYpKExZSs00b
 V3vWamoG4o1FYtf5ez+RKR8x8kHAtpljZHEK1zkhkCZrpj40RLJ9aYjRw A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="240969531"
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; d="scan'208";a="240969531"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 06:02:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,239,1643702400"; d="scan'208";a="524459107"
Received: from smile.fi.intel.com ([10.237.72.54])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Apr 2022 06:02:39 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1nc5HX-000EG4-V0; Wed, 06 Apr 2022 16:01:07 +0300
Date: Wed, 6 Apr 2022 16:01:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 1/1] powerpc/83xx/mpc8349emitx: Get rid of of_node
 assignment
Message-ID: <Yk2PE7+oEEtGri95@smile.fi.intel.com>
References: <20220323174342.56187-1-andriy.shevchenko@linux.intel.com>
 <CACRpkdbUWE8knM=9uUVLTX792Y8_J1aPj4KtFh=yJxaKi+ZqRw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbUWE8knM=9uUVLTX792Y8_J1aPj4KtFh=yJxaKi+ZqRw@mail.gmail.com>
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
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, linux-kernel@vger.kernel.org,
 Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 28, 2022 at 03:16:08PM +0200, Linus Walleij wrote:
> On Wed, Mar 23, 2022 at 6:43 PM Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Let GPIO library to assign of_node from the parent device.
> > This allows to move GPIO library and drivers to use fwnode
> > APIs instead of being stuck with OF-only interfaces.
> >
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> That's a nice patch.
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks!

Can we have this applied now?

-- 
With Best Regards,
Andy Shevchenko


