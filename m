Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0A11757C9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 10:57:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WFtj5h4vzDqj4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 20:57:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WFrR6xY4zDqXl
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Mar 2020 20:55:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=L3pFQ9NLTXNxgalOAVVXDxBAPiPNjQ1YAk86r0HAYHg=; b=ZUf3riTbabd9Lifttnyb2Ado8j
 5jUbZCdBR+/ICa6BGmWdfGfrLsiyFLzHa4aBs+APAk8ONw0vofiUBw05W3v6aeQ07Tz0n58nX4Y8n
 3Mi75pAdtRLMlYmDbnSKcnyroP2XkIz1uHgoxEKbjFjf0BZy9Ni5gV9epsacPOW050FnMeIDlglht
 W/IKVoyHwMKSIR3FLL1v19WMNqu6+f2XaRx4apI0wdItmdLvBZ7/yq69MMzN1zulnlI69cgoXxKVE
 RFpuyK6/WquHujE+6aw78k6EQMS6kF9wUH5k/8wj6cv8EBftvl/Y4k+5FdmELmI/EcgdS9mq1q0PP
 xNoLvMlg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j8hnC-0006ER-IT; Mon, 02 Mar 2020 09:55:18 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 7B9093012C3;
 Mon,  2 Mar 2020 10:53:18 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id E82B0202A4098; Mon,  2 Mar 2020 10:55:15 +0100 (CET)
Date: Mon, 2 Mar 2020 10:55:15 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [RFC 02/11] perf/core: Data structure to present hazard data
Message-ID: <20200302095515.GR18400@hirez.programming.kicks-ass.net>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302052355.36365-3-ravi.bangoria@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200302052355.36365-3-ravi.bangoria@linux.ibm.com>
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
Cc: mark.rutland@arm.com, ak@linux.intel.com, maddy@linux.ibm.com,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 eranian@google.com, adrian.hunter@intel.com, robert.richter@amd.com,
 yao.jin@linux.intel.com, mingo@redhat.com, paulus@samba.org, acme@kernel.org,
 namhyung@kernel.org, kim.phillips@amd.com, linuxppc-dev@lists.ozlabs.org,
 alexey.budankov@linux.intel.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 02, 2020 at 10:53:46AM +0530, Ravi Bangoria wrote:
> From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> 
> Introduce new perf sample_type PERF_SAMPLE_PIPELINE_HAZ to request kernel
> to provide cpu pipeline hazard data. Also, introduce arch independent
> structure 'perf_pipeline_haz_data' to pass hazard data to userspace. This
> is generic structure and arch specific data needs to be converted to this
> format.
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  include/linux/perf_event.h            |  7 ++++++
>  include/uapi/linux/perf_event.h       | 32 ++++++++++++++++++++++++++-
>  kernel/events/core.c                  |  6 +++++
>  tools/include/uapi/linux/perf_event.h | 32 ++++++++++++++++++++++++++-
>  4 files changed, 75 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
> index 547773f5894e..d5b606e3c57d 100644
> --- a/include/linux/perf_event.h
> +++ b/include/linux/perf_event.h
> @@ -1001,6 +1001,7 @@ struct perf_sample_data {
>  	u64				stack_user_size;
>  
>  	u64				phys_addr;
> +	struct perf_pipeline_haz_data	pipeline_haz;
>  } ____cacheline_aligned;
>  
>  /* default value for data source */
> @@ -1021,6 +1022,12 @@ static inline void perf_sample_data_init(struct perf_sample_data *data,
>  	data->weight = 0;
>  	data->data_src.val = PERF_MEM_NA;
>  	data->txn = 0;
> +	data->pipeline_haz.itype = PERF_HAZ__ITYPE_NA;
> +	data->pipeline_haz.icache = PERF_HAZ__ICACHE_NA;
> +	data->pipeline_haz.hazard_stage = PERF_HAZ__PIPE_STAGE_NA;
> +	data->pipeline_haz.hazard_reason = PERF_HAZ__HREASON_NA;
> +	data->pipeline_haz.stall_stage = PERF_HAZ__PIPE_STAGE_NA;
> +	data->pipeline_haz.stall_reason = PERF_HAZ__SREASON_NA;
>  }

NAK, Don't touch anything outside of the first cacheline here.
