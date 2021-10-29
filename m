Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C28D043FFF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Oct 2021 17:57:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HgnBX5Wnbz3cNZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 02:57:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.31; helo=mga06.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgnB74zGWz2xF5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 02:57:18 +1100 (AEDT)
X-IronPort-AV: E=McAfee;i="6200,9189,10151"; a="291526977"
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="291526977"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 08:56:15 -0700
X-IronPort-AV: E=Sophos;i="5.87,193,1631602800"; d="scan'208";a="448407220"
Received: from smile.fi.intel.com ([10.237.72.184])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2021 08:56:13 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1mgUEV-0024Em-3w; Fri, 29 Oct 2021 18:55:55 +0300
Date: Fri, 29 Oct 2021 18:55:54 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v1 1/1] soc: fsl: Replace kernel.h with the necessary
 inclusions
Message-ID: <YXwZihLk1njsBNT4@smile.fi.intel.com>
References: <20211027153354.81129-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211027153354.81129-1-andriy.shevchenko@linux.intel.com>
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
Cc: Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 27, 2021 at 06:33:54PM +0300, Andy Shevchenko wrote:
> When kernel.h is used in the headers it adds a lot into dependency hell,
> especially when there are circular dependencies are involved.
> 
> Replace kernel.h inclusion with the list of what is really being used.

Seems nobody from PPC took this patch.
Any idea who can take it?

-- 
With Best Regards,
Andy Shevchenko


