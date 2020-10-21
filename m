Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 29232295126
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Oct 2020 18:54:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CGc601J6dzDqHw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Oct 2020 03:54:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx2.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CGc3t0vS8zDqSQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Oct 2020 03:52:25 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6AEDDAE7D;
 Wed, 21 Oct 2020 16:52:20 +0000 (UTC)
Date: Wed, 21 Oct 2020 18:52:18 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Subject: Re: [RFC PATCH 0/4] powerpc/papr_scm: Add support for reporting
 NVDIMM performance statistics
Message-ID: <20201021165218.GO29778@kitsune.suse.cz>
References: <20200518110814.145644-1-vaibhav@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200518110814.145644-1-vaibhav@linux.ibm.com>
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
Cc: Santosh Sivaraj <santosh@fossix.org>, linux-nvdimm@lists.01.org,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

apparently this has not received any (public) comments.

Maybe resend without the RFC status?

Clearly the kernel interface must be defined first, and then ndctl can
follow and make use of it.

Thanks

Michal

On Mon, May 18, 2020 at 04:38:10PM +0530, Vaibhav Jain wrote:
> The patch-set proposes to add support for fetching and reporting
> performance statistics for PAPR compliant NVDIMMs as described in
> documentation for H_SCM_PERFORMANCE_STATS hcall Ref[1]. The patch-set
> also implements mechanisms to expose NVDIMM performance stats via
> sysfs and newly introduced PDSMs[2] for libndctl.
> 
> This patch-set combined with corresponding ndctl and libndctl changes
> proposed at Ref[3] should enable user to fetch PAPR compliant NVDIMMs
> using following command:
> 
>  # ndctl list -D --stats
> [
>   {
>     "dev":"nmem0",
>     "stats":{
>       "Controller Reset Count":2,
>       "Controller Reset Elapsed Time":603331,
>       "Power-on Seconds":603931,
>       "Life Remaining":"100%",
>       "Critical Resource Utilization":"0%",
>       "Host Load Count":5781028,
>       "Host Store Count":8966800,
>       "Host Load Duration":975895365,
>       "Host Store Duration":716230690,
>       "Media Read Count":0,
>       "Media Write Count":6313,
>       "Media Read Duration":0,
>       "Media Write Duration":9679615,
>       "Cache Read Hit Count":5781028,
>       "Cache Write Hit Count":8442479,
>       "Fast Write Count":8969912
>     }
>   }
> ]
> 
> The patchset is dependent on existing patch-set "[PATCH v7 0/5]
> powerpc/papr_scm: Add support for reporting nvdimm health" available
> at Ref[2] that adds support for reporting PAPR compliant NVDIMMs in
> 'papr_scm' kernel module.
> 
> Structure of the patch-set
> ==========================
> 
> The patch-set starts with implementing functionality in papr_scm
> module to issue H_SCM_PERFORMANCE_STATS hcall, fetch & parse dimm
> performance stats and exposing them as a PAPR specific libnvdimm
> attribute named 'perf_stats'
> 
> Patch-2 introduces a new PDSM named FETCH_PERF_STATS that can be
> issued by libndctl asking papr_scm to issue the
> H_SCM_PERFORMANCE_STATS hcall using helpers introduced earlier and
> storing the results in a dimm specific perf-stats-buffer.
> 
> Patch-3 introduces a new PDSM named READ_PERF_STATS that can be
> issued by libndctl to read the perf-stats-buffer in an incremental
> manner to workaround the 256-bytes envelop limitation of libnvdimm.
> 
> Finally Patch-4 introduces a new PDSM named GET_PERF_STAT that can be
> issued by libndctl to read values of a specific NVDIMM performance
> stat like "Life Remaining".
> 
> References
> ==========
> [1] Documentation/powerpc/papr_hcals.rst
> 
> [2] https://lore.kernel.org/linux-nvdimm/20200508104922.72565-1-vaibhav@linux.ibm.com/
> 
> [3] https://github.com/vaibhav92/ndctl/tree/papr_scm_stats_v1
> 
> Vaibhav Jain (4):
>   powerpc/papr_scm: Fetch nvdimm performance stats from PHYP
>   powerpc/papr_scm: Add support for PAPR_SCM_PDSM_FETCH_PERF_STATS
>   powerpc/papr_scm: Implement support for PAPR_SCM_PDSM_READ_PERF_STATS
>   powerpc/papr_scm: Add support for PDSM GET_PERF_STAT
> 
>  Documentation/ABI/testing/sysfs-bus-papr-scm  |  27 ++
>  arch/powerpc/include/uapi/asm/papr_scm_pdsm.h |  60 +++
>  arch/powerpc/platforms/pseries/papr_scm.c     | 391 ++++++++++++++++++
>  3 files changed, 478 insertions(+)
> 
> -- 
> 2.26.2
> 
