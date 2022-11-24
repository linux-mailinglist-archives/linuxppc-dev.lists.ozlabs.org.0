Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7810C6377F5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 12:49:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHx9x2gGCz3f3Z
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 22:49:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DfyHx+j7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHx9316w9z3cG9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 22:48:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=DfyHx+j7;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4NHx900Lk9z4wgr;
	Thu, 24 Nov 2022 22:48:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1669290532;
	bh=I7ed4hXl9O15lvszue8Ee2Pd6CPSfarADxZ5R7xHObU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=DfyHx+j7nq0jR2T+B4tfYvykyFmWy8dElQ87jJVMB30us5C1kvEFG4cfYSs8YLXmS
	 jR93Axzp2PM5wzUmtUXwFJytRGl/qzGxL6am2WnBrxqC7WTncPPDvrt33F8fRcB+vk
	 ZCd+oni1YZMsdbAGxVcUtbTD+aGyB0YV3ROOQH69lbxrKGhnAZf14UfA8vIqstkzyY
	 +Pal4mPP5ou5Wahin/4gTcgHqHvF733BnZutSsRi+Wp8gBi+rQJUF8UmSN/GkXgBtf
	 b0Nf558KWalOGHxrkZc5TfamYhXz7wi0FAxIu/uX+8xpSBp6LBMQ+DbUDS9dF3Kyun
	 9naA9xE9Li6Nw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/hv-gpci: Fix hv_gpci event list
In-Reply-To: <20221028154806.141272-1-kjain@linux.ibm.com>
References: <20221028154806.141272-1-kjain@linux.ibm.com>
Date: Thu, 24 Nov 2022 22:48:49 +1100
Message-ID: <87wn7kbmji.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kajol Jain <kjain@linux.ibm.com> writes:
> Based on getPerfCountInfo v1.018 documentation, some of the
> hv_gpci events got deprecated for platforms firmware that
                 ^                  ^
                 were               platform

> supports counter_info_version 0x8 or above.
>
> Patch fixes the hv_gpci event list by adding a new attribute
  ^
  Fix the ...

> group called "hv_gpci_event_attrs_v6" and a "EVENT_ENABLE"

Can we please give that macro a more descriptive name?

EVENT_ENABLE implies it enables/disables all events, but it's only
certain ones.

> macro to enable these events for platform firmware
> that supports counter_info_version 0x6 or below. And assigning
> the hv_gpci event list based on output counter info version
> of underlying plaform.
>
> Fixes: 97bf2640184f ("powerpc/perf/hv-gpci: add the remaining gpci requests")
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog:
>
> v1 -> v2
> - As suggested by Michael Ellerman, using counter_info_version value
>   rather then cpu_has_feature() to assign hv-gpci event list.
>
>  arch/powerpc/perf/hv-gpci-requests.h |  4 ++++
>  arch/powerpc/perf/hv-gpci.c          | 35 ++++++++++++++++++++++++++--
>  arch/powerpc/perf/hv-gpci.h          |  1 +
>  arch/powerpc/perf/req-gen/perf.h     | 17 ++++++++++++++
>  4 files changed, 55 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/perf/hv-gpci-requests.h b/arch/powerpc/perf/hv-gpci-requests.h
> index 8965b4463d43..baef3d082de9 100644
> --- a/arch/powerpc/perf/hv-gpci-requests.h
> +++ b/arch/powerpc/perf/hv-gpci-requests.h
> @@ -79,6 +79,7 @@ REQUEST(__field(0,	8,	partition_id)
>  )
>  #include I(REQUEST_END)
>  
> +#ifdef EVENT_ENABLE
>  /*
>   * Not available for counter_info_version >= 0x8, use
>   * run_instruction_cycles_by_partition(0x100) instead.
> @@ -92,6 +93,7 @@ REQUEST(__field(0,	8,	partition_id)
>  	__count(0x10,	8,	cycles)
>  )
>  #include I(REQUEST_END)
> +#endif
>  
>  #define REQUEST_NAME system_performance_capabilities
>  #define REQUEST_NUM 0x40
> @@ -103,6 +105,7 @@ REQUEST(__field(0,	1,	perf_collect_privileged)
>  )
>  #include I(REQUEST_END)
>  
> +#ifdef EVENT_ENABLE
>  #define REQUEST_NAME processor_bus_utilization_abc_links
>  #define REQUEST_NUM 0x50
>  #define REQUEST_IDX_KIND "hw_chip_id=?"
> @@ -194,6 +197,7 @@ REQUEST(__field(0,	4,	phys_processor_idx)
>  	__count(0x28,	8,	instructions_completed)
>  )
>  #include I(REQUEST_END)
> +#endif
>  
>  /* Processor_core_power_mode (0x95) skipped, no counters */
>  /* Affinity_domain_information_by_virtual_processor (0xA0) skipped,
> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
> index 5eb60ed5b5e8..6eeabf3975e5 100644
> --- a/arch/powerpc/perf/hv-gpci.c
> +++ b/arch/powerpc/perf/hv-gpci.c
> @@ -70,9 +70,9 @@ static const struct attribute_group format_group = {
>  	.attrs = format_attrs,
>  };
>  
> -static const struct attribute_group event_group = {
> +static struct attribute_group event_group = {
>  	.name  = "events",
> -	.attrs = hv_gpci_event_attrs,
> +	/* .attrs is set in init */
>  };
>  
>  #define HV_CAPS_ATTR(_name, _format)				\
> @@ -330,6 +330,7 @@ static int hv_gpci_init(void)
>  	int r;
>  	unsigned long hret;
>  	struct hv_perf_caps caps;
> +	struct hv_gpci_request_buffer *arg;
>  
>  	hv_gpci_assert_offsets_correct();
>  
> @@ -353,6 +354,36 @@ static int hv_gpci_init(void)
>  	/* sampling not supported */
>  	h_gpci_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
>  
> +	arg = (void *)get_cpu_var(hv_gpci_reqb);
> +	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
> +
> +	/*
> +	 * hcall H_GET_PERF_COUNTER_INFO populates the output
> +	 * counter_info_version value based on the system hypervisor.
> +	 * Pass the counter request 0x10 corresponds to request type
                                         ^
                                         which
> +	 * 'Dispatch_timebase_by_processor', to get the supported
> +	 * counter_info_version.
> +	 */
> +	arg->params.counter_request = cpu_to_be32(0x10);
> +
> +	r = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
> +			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
> +	if (r) {
> +		pr_devel("hcall failed, can't get supported counter_info_version: 0x%x\n", r);
> +		arg->params.counter_info_version_out = 0x8;
> +	}
> +
> +	/*
> +	 * Use counter_info_version_out value to assign
> +	 * required hv-gpci event list.
> +	 */
> +	if (arg->params.counter_info_version_out >= 0x8)
> +		event_group.attrs = hv_gpci_event_attrs;
> +	else
> +		event_group.attrs = hv_gpci_event_attrs_v6;
> +
> +	put_cpu_var(hv_gpci_reqb);
> +
>  	r = perf_pmu_register(&h_gpci_pmu, h_gpci_pmu.name, -1);
>  	if (r)
>  		return r;
> diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
> index 4d108262bed7..10aba0ccb434 100644
> --- a/arch/powerpc/perf/hv-gpci.h
> +++ b/arch/powerpc/perf/hv-gpci.h
> @@ -26,6 +26,7 @@ enum {
>  #define REQUEST_FILE "../hv-gpci-requests.h"
>  #define NAME_LOWER hv_gpci
>  #define NAME_UPPER HV_GPCI
> +#define EVENT_ENABLE
>  #include "req-gen/perf.h"
>  #undef REQUEST_FILE
>  #undef NAME_LOWER
> diff --git a/arch/powerpc/perf/req-gen/perf.h b/arch/powerpc/perf/req-gen/perf.h
> index fa9bc804e67a..e0b355931271 100644
> --- a/arch/powerpc/perf/req-gen/perf.h
> +++ b/arch/powerpc/perf/req-gen/perf.h
> @@ -139,6 +139,23 @@ PMU_EVENT_ATTR_STRING(							\
>  #define REQUEST_(r_name, r_value, r_idx_1, r_fields)			\
>  	r_fields
>  
> +/* Generate event list for platforms with counter_info_version 0x6 or below */
> +static __maybe_unused struct attribute *hv_gpci_event_attrs_v6[] = {
> +#include REQUEST_FILE
> +	NULL
> +};
> +
> +/*
> + * Based on getPerfCountInfo v1.018 documentation, some of the hv-gpci
> + * events got deprecated for platforms firmware that supports

Same wording as in the change log.

> + * counter_info_version 0x8 or above.
> + * Undefining macro EVENT_ENABLE, to disable the addition of deprecated
> + * events in "hv_gpci_event_attrs" attribute group, for platforms that
> + * supports counter_info_version 0x8 or above.
> + */
> +#undef EVENT_ENABLE
> +
> +/* Generate event list for platforms with counter_info_version 0x8 or above*/
>  static __maybe_unused struct attribute *hv_gpci_event_attrs[] = {
>  #include REQUEST_FILE
>  	NULL
> -- 
> 2.31.1

cheers
