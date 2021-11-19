Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A91456CBA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 10:48:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HwX0X4LKDz3bjB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 20:48:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.126; helo=mga18.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HwX061jBFz2xtf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 20:47:49 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="221267859"
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="221267859"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 01:46:46 -0800
X-IronPort-AV: E=Sophos;i="5.87,247,1631602800"; d="scan'208";a="473489603"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 01:46:42 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mo0Tb-008UhS-My; Fri, 19 Nov 2021 11:46:35 +0200
Date: Fri, 19 Nov 2021 11:46:35 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Peiwei Hu <jlu.hpw@foxmail.com>
Subject: Re: [PATCH] powerpc/prom_init: fix the improper check of prom_getprop
Message-ID: <YZdye4k/5a8bUXU7@smile.fi.intel.com>
References: <tencent_BA28CC6897B7C95A92EB8C580B5D18589105@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_BA28CC6897B7C95A92EB8C580B5D18589105@qq.com>
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
Cc: masahiroy@kernel.org, rafael.j.wysocki@intel.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, adobriyan@gmail.com,
 paulus@samba.org, clg@kaod.org, aneesh.kumar@linux.ibm.com, trivial@kernel.org,
 linuxppc-dev@lists.ozlabs.org, ardb@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 19, 2021 at 05:12:18PM +0800, Peiwei Hu wrote:
> prom_getprop() can return PROM_ERROR. Binary operator can not identify it.

Fixes: 94d2dde738a5 ("[POWERPC] Efika: prune fixups and make them more carefull")

?

P.S. Try to use my script [1] to send patches, it should be smart enough to not
include my name, for example.

[1]: https://github.com/andy-shev/home-bin-tools/blob/master/ge2maintainer.sh

-- 
With Best Regards,
Andy Shevchenko


