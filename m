Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDA584EF2C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 04:01:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLorM+eu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWJXK4pGlz3btZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 14:01:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OLorM+eu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.20; helo=mgamail.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 64 seconds by postgrey-1.37 at boromir; Fri, 09 Feb 2024 14:00:40 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWJWX4wpdz2yk5
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 14:00:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707447640; x=1738983640;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=PTVvWQ7Ht9Slv9xMxIk/jSv15ZL89NIpuRtDUZ3FhUw=;
  b=OLorM+eujtKfI62yOYueULYNk7+UQWTmGdXWv8zI28qxuKdajgiKl1B4
   H0z8rGqjRlhTWkJnuVjOmk8oPvzzG9MPQgPY4EuMmd4rNNy8RkHX1Q9X8
   8YxfF2AlhHaXjpYDHWzyHumVg4e+a3E5p0YTq/Oz7xnXXP8QlQGwQzbga
   CyJgfljtXpwIeEpnW2KC9bwYwXLJb8Kl4US+Ia+JoLc/uDcEK6f4sklD3
   pwq0FZrL0fqV9Cmc+YAFMWVhWOwUMG/ovjFYsn9iWH0M45xSZelV3NoHV
   E+oGqyfJ/vYFFa0DaV+OHkChz77YimyZSBq147CtJjdbpQG9Q6kVSZxzL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="395787018"
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="395787018"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 18:59:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,255,1701158400"; 
   d="scan'208";a="6460503"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 18:59:28 -0800
Date: Thu, 8 Feb 2024 19:00:46 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: alexs@kernel.org
Subject: Re: [PATCH v4 5/5] sched: rename SD_SHARE_PKG_RESOURCES to
 SD_SHARE_LLC
Message-ID: <20240209030046.GB10494@ranerica-svr.sc.intel.com>
References: <20240207034704.935774-4-alexs@kernel.org>
 <20240207035840.936676-1-alexs@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240207035840.936676-1-alexs@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Miaohe Lin <linmiaohe@huawei.com>, Srikar Dronamraju <srikar@linux.vnet.ibm.com>, Yicong Yang <yangyicong@hisilicon.com>, Ben Segall <bsegall@google.com>, Mark Rutland <mark.rutland@arm.com>, Valentin Schneider <vschneid@redhat.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Frederic Weisbecker <frederic@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Steven Rostedt <rostedt@goodmis.org>, Josh Poimboeuf <jpoimboe@kernel.org>, Barry Song <song.bao.hua@hisilicon.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, linux-kernel@vger.kernel.org, "Gautham R . Shenoy" <gautham.shenoy@amd.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 07, 2024 at 11:58:40AM +0800, alexs@kernel.org wrote:
> From: Alex Shi <alexs@kernel.org>
> 
> SD_CLUSTER shares the CPU resources like llc tags or l2 cache, that's
> easy confuse with SD_SHARE_PKG_RESOURCES. So let's specifical point
> what the latter shares: LLC. That would reduce some confusing.
> 
> Suggested-by: Valentin Schneider <vschneid@redhat.com>
> Signed-off-by: Alex Shi <alexs@kernel.org>

FWIW, Reviewed-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
