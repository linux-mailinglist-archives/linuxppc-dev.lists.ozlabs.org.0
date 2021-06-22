Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6143B051A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 14:46:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8R3b1tjxz3bvX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 22:46:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=134.134.136.24; helo=mga09.intel.com;
 envelope-from=andriy.shevchenko@linux.intel.com; receiver=<UNKNOWN>)
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir;
 Tue, 22 Jun 2021 22:46:16 AEST
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8R3D5ZxTz303P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 22:46:16 +1000 (AEST)
IronPort-SDR: IjGhdG0rdlt7FGeQrTIwR6quib99bORI9I6wzemkBuWo32al7Wqk9UQ3oYJ8DGbPVehFojAzSl
 4VvTpQi0k7cw==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="206989469"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="206989469"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 05:45:02 -0700
IronPort-SDR: ot5riLILubcp9FdnvIW72TgEJmFvdk1aZs/O4Umcr1P7WFxm4JOa/zlVTVmYyhPuHBFOfLxNUR
 mpnffwHKjPSg==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="423305835"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 05:45:01 -0700
Received: from andy by smile with local (Exim 4.94.2)
 (envelope-from <andriy.shevchenko@linux.intel.com>)
 id 1lvflw-004TIM-NR; Tue, 22 Jun 2021 15:44:56 +0300
Date: Tue, 22 Jun 2021 15:44:56 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] powerpc/papr_scm: Properly handle UUID types and
 API
Message-ID: <YNHbSGzdgQh+6F+O@smile.fi.intel.com>
References: <20210616134303.58185-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616134303.58185-1-andriy.shevchenko@linux.intel.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 16, 2021 at 04:43:03PM +0300, Andy Shevchenko wrote:
> Parse to and export from UUID own type, before dereferencing.
> This also fixes wrong comment (Little Endian UUID is something else)
> and should eliminate the direct strict types assignments.

Any comments on this version? Can it be applied?

> Fixes: 43001c52b603 ("powerpc/papr_scm: Use ibm,unit-guid as the iset cookie")
> Fixes: 259a948c4ba1 ("powerpc/pseries/scm: Use a specific endian format for storing uuid from the device tree")
> Cc: Oliver O'Halloran <oohall@gmail.com>
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> v2: added missed header (Vaibhav), updated comment (Aneesh),
>     rewrite part of the commit message to avoid mentioning the Sparse

-- 
With Best Regards,
Andy Shevchenko


