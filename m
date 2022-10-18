Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD75260266B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 10:06:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ms5zd5ZWPz3blY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Oct 2022 19:06:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pxFWLStT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ms5yg74Fyz2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Oct 2022 19:05:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pxFWLStT;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ms5yg5lFmz4xGQ;
	Tue, 18 Oct 2022 19:05:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1666080347;
	bh=nJcCJx2iHQ//Uv4G7NwnxuFW5e8wX6/IG2DRMhdAEd0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=pxFWLStTUi6wfTSn/VuXzokWPuQytpdMBMKf8jU4r2sdDvyENkQyBFqhyvuEe9SQp
	 /i3VGn8dxoyd2rRWCGwegqwyiMnnPomR2RvUJ/D5FNrPEpvZpdovpoYq7jgDdYekfg
	 VirysaplBy7Ag2bG57GXcuzljOEUZXYLQJj8IpwwyFx0ah9FORnSmEmhSS1IsD24H1
	 y1jC4F7v6kS5cAPeZV2QH5v7mF+Sg02KmmJdPAvNiUA9OwEqRrv3LTilNs+fqXZHFs
	 ZLa85gcQJFXS6Z2pW1nVKaqowIPXe+H0OAbCAbPydOztMyAoRPzSxybvgNhX/Rpk7N
	 6a06ka+B6fbZw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH] powerpc/hv-gpci: Fix hv_gpci event list
In-Reply-To: <20220920163843.233822-1-kjain@linux.ibm.com>
References: <20220920163843.233822-1-kjain@linux.ibm.com>
Date: Tue, 18 Oct 2022 19:05:46 +1100
Message-ID: <87pmeplfol.fsf@mpe.ellerman.id.au>
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
> supports counter_info_version 0x8 or above.
>
> Patch fixes the hv_gpci event list by adding a new attribute
> group called "hv_gpci_event_attrs_v6" and a "EVENT_ENABLE"
> macro to enable these events for platform firmware
> that supports counter_info_version 0x6 or below.

Does this handle CPUs booted in compat mode?

ie. where the firmware is newer but the kernel is told to behave as if
the CPU is an older version - so cpu_has_feature() doesn't necessarily
match the underlying hardware.

Is there some reason the event list is populated based on the CPU
features rather than by calling the hypervisor and asking what version
is supported?

> Fixes: 97bf2640184f4 ("powerpc/perf/hv-gpci: add the remaining gpci
> requests")

Please don't wrap the fixes tag.

cheers

> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  arch/powerpc/perf/hv-gpci-requests.h |  4 ++++
>  arch/powerpc/perf/hv-gpci.c          |  9 +++++++--
>  arch/powerpc/perf/hv-gpci.h          |  1 +
>  arch/powerpc/perf/req-gen/perf.h     | 17 +++++++++++++++++
>  4 files changed, 29 insertions(+), 2 deletions(-)
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
> index 5eb60ed5b5e8..065a01812b3e 100644
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
> @@ -353,6 +353,11 @@ static int hv_gpci_init(void)
>  	/* sampling not supported */
>  	h_gpci_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
>  
> +	if (cpu_has_feature(CPU_FTR_ARCH_207S))
> +		event_group.attrs = hv_gpci_event_attrs;
> +	else
> +		event_group.attrs = hv_gpci_event_attrs_v6;
> +
>  	r = perf_pmu_register(&h_gpci_pmu, h_gpci_pmu.name, -1);
>  	if (r)
>  		return r;
> diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
> index 4d108262bed7..866172c1651c 100644
> --- a/arch/powerpc/perf/hv-gpci.h
> +++ b/arch/powerpc/perf/hv-gpci.h
> @@ -26,6 +26,7 @@ enum {
>  #define REQUEST_FILE "../hv-gpci-requests.h"
>  #define NAME_LOWER hv_gpci
>  #define NAME_UPPER HV_GPCI
> +#define EVENT_ENABLE	1
>  #include "req-gen/perf.h"
>  #undef REQUEST_FILE
>  #undef NAME_LOWER
> diff --git a/arch/powerpc/perf/req-gen/perf.h b/arch/powerpc/perf/req-gen/perf.h
> index fa9bc804e67a..78d407e3fcc6 100644
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
