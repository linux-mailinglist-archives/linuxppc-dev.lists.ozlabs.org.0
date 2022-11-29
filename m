Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA3A63BE49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 11:54:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLzkL27MPz30R1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 21:54:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TRuc7Wby;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TRuc7Wby;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLzjM2827z30R1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 21:53:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2ATAmhCJ030653;
	Tue, 29 Nov 2022 10:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=O5CQb3WQEZPIAcxWx6nyEJTohWf90tcBGIkw5y549fU=;
 b=TRuc7WbyiflRWMTP5PBC8W954qRHhBd6nkbBCW5+KG2ulni0zXklcMys/vCX9t4yj3+k
 t8uih+viKUt5+VXwJYxTBEvAx5tFj/cFvkhVJnVGTle63k47fynWU9z4d19ysK+npEVG
 2e0gcijN29DlWBF33jL33NybPICT1JcZKJYIUCJXnouOk8Of+siPLparPuuiJ0VfJHAB
 X8yCk/lHHWEUtdA+dRy4jldxhFU5zdp7eWgsVHoxGV6rzum8yjGapJbMo8ilgOS4hcAC
 i08r515/tuJ0UV/SWui4GLP/4uFxjWPbe4aIMaBYmvYZwO+kyADwWcG9ia66rjczYyPH kQ== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m5gnj82wm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 10:53:52 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2ATAZj1O018509;
	Tue, 29 Nov 2022 10:53:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3m3ae9bvr8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 29 Nov 2022 10:53:50 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2ATArl0f22610558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 29 Nov 2022 10:53:47 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5604A405B;
	Tue, 29 Nov 2022 10:53:47 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6949FA4054;
	Tue, 29 Nov 2022 10:53:46 +0000 (GMT)
Received: from [9.43.28.132] (unknown [9.43.28.132])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 29 Nov 2022 10:53:46 +0000 (GMT)
Message-ID: <cbd13517-f9dc-8615-8f1e-b240a70e0303@linux.ibm.com>
Date: Tue, 29 Nov 2022 16:23:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2] powerpc/hv-gpci: Fix hv_gpci event list
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>
References: <20221028154806.141272-1-kjain@linux.ibm.com>
 <87wn7kbmji.fsf@mpe.ellerman.id.au>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <87wn7kbmji.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: H9OTPZiVSM9Hrqen-6it8r0Y77jjRGRq
X-Proofpoint-ORIG-GUID: H9OTPZiVSM9Hrqen-6it8r0Y77jjRGRq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-29_07,2022-11-29_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211290065
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/24/22 17:18, Michael Ellerman wrote:
> Kajol Jain <kjain@linux.ibm.com> writes:
>> Based on getPerfCountInfo v1.018 documentation, some of the
>> hv_gpci events got deprecated for platforms firmware that
>                  ^                  ^
>                  were               platform
> 
>> supports counter_info_version 0x8 or above.
>>
>> Patch fixes the hv_gpci event list by adding a new attribute
>   ^
>   Fix the ...
> 
>> group called "hv_gpci_event_attrs_v6" and a "EVENT_ENABLE"
> 
> Can we please give that macro a more descriptive name?
> 
> EVENT_ENABLE implies it enables/disables all events, but it's only
> certain ones.

Hi Michael,
     Thanks for the review comments, I will make these changes in next
version.

Thanks,
Kajol Jain

> 
>> macro to enable these events for platform firmware
>> that supports counter_info_version 0x6 or below. And assigning
>> the hv_gpci event list based on output counter info version
>> of underlying plaform.
>>
>> Fixes: 97bf2640184f ("powerpc/perf/hv-gpci: add the remaining gpci requests")
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> Changelog:
>>
>> v1 -> v2
>> - As suggested by Michael Ellerman, using counter_info_version value
>>   rather then cpu_has_feature() to assign hv-gpci event list.
>>
>>  arch/powerpc/perf/hv-gpci-requests.h |  4 ++++
>>  arch/powerpc/perf/hv-gpci.c          | 35 ++++++++++++++++++++++++++--
>>  arch/powerpc/perf/hv-gpci.h          |  1 +
>>  arch/powerpc/perf/req-gen/perf.h     | 17 ++++++++++++++
>>  4 files changed, 55 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/perf/hv-gpci-requests.h b/arch/powerpc/perf/hv-gpci-requests.h
>> index 8965b4463d43..baef3d082de9 100644
>> --- a/arch/powerpc/perf/hv-gpci-requests.h
>> +++ b/arch/powerpc/perf/hv-gpci-requests.h
>> @@ -79,6 +79,7 @@ REQUEST(__field(0,	8,	partition_id)
>>  )
>>  #include I(REQUEST_END)
>>  
>> +#ifdef EVENT_ENABLE
>>  /*
>>   * Not available for counter_info_version >= 0x8, use
>>   * run_instruction_cycles_by_partition(0x100) instead.
>> @@ -92,6 +93,7 @@ REQUEST(__field(0,	8,	partition_id)
>>  	__count(0x10,	8,	cycles)
>>  )
>>  #include I(REQUEST_END)
>> +#endif
>>  
>>  #define REQUEST_NAME system_performance_capabilities
>>  #define REQUEST_NUM 0x40
>> @@ -103,6 +105,7 @@ REQUEST(__field(0,	1,	perf_collect_privileged)
>>  )
>>  #include I(REQUEST_END)
>>  
>> +#ifdef EVENT_ENABLE
>>  #define REQUEST_NAME processor_bus_utilization_abc_links
>>  #define REQUEST_NUM 0x50
>>  #define REQUEST_IDX_KIND "hw_chip_id=?"
>> @@ -194,6 +197,7 @@ REQUEST(__field(0,	4,	phys_processor_idx)
>>  	__count(0x28,	8,	instructions_completed)
>>  )
>>  #include I(REQUEST_END)
>> +#endif
>>  
>>  /* Processor_core_power_mode (0x95) skipped, no counters */
>>  /* Affinity_domain_information_by_virtual_processor (0xA0) skipped,
>> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
>> index 5eb60ed5b5e8..6eeabf3975e5 100644
>> --- a/arch/powerpc/perf/hv-gpci.c
>> +++ b/arch/powerpc/perf/hv-gpci.c
>> @@ -70,9 +70,9 @@ static const struct attribute_group format_group = {
>>  	.attrs = format_attrs,
>>  };
>>  
>> -static const struct attribute_group event_group = {
>> +static struct attribute_group event_group = {
>>  	.name  = "events",
>> -	.attrs = hv_gpci_event_attrs,
>> +	/* .attrs is set in init */
>>  };
>>  
>>  #define HV_CAPS_ATTR(_name, _format)				\
>> @@ -330,6 +330,7 @@ static int hv_gpci_init(void)
>>  	int r;
>>  	unsigned long hret;
>>  	struct hv_perf_caps caps;
>> +	struct hv_gpci_request_buffer *arg;
>>  
>>  	hv_gpci_assert_offsets_correct();
>>  
>> @@ -353,6 +354,36 @@ static int hv_gpci_init(void)
>>  	/* sampling not supported */
>>  	h_gpci_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
>>  
>> +	arg = (void *)get_cpu_var(hv_gpci_reqb);
>> +	memset(arg, 0, HGPCI_REQ_BUFFER_SIZE);
>> +
>> +	/*
>> +	 * hcall H_GET_PERF_COUNTER_INFO populates the output
>> +	 * counter_info_version value based on the system hypervisor.
>> +	 * Pass the counter request 0x10 corresponds to request type
>                                          ^
>                                          which
>> +	 * 'Dispatch_timebase_by_processor', to get the supported
>> +	 * counter_info_version.
>> +	 */
>> +	arg->params.counter_request = cpu_to_be32(0x10);
>> +
>> +	r = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
>> +			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
>> +	if (r) {
>> +		pr_devel("hcall failed, can't get supported counter_info_version: 0x%x\n", r);
>> +		arg->params.counter_info_version_out = 0x8;
>> +	}
>> +
>> +	/*
>> +	 * Use counter_info_version_out value to assign
>> +	 * required hv-gpci event list.
>> +	 */
>> +	if (arg->params.counter_info_version_out >= 0x8)
>> +		event_group.attrs = hv_gpci_event_attrs;
>> +	else
>> +		event_group.attrs = hv_gpci_event_attrs_v6;
>> +
>> +	put_cpu_var(hv_gpci_reqb);
>> +
>>  	r = perf_pmu_register(&h_gpci_pmu, h_gpci_pmu.name, -1);
>>  	if (r)
>>  		return r;
>> diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
>> index 4d108262bed7..10aba0ccb434 100644
>> --- a/arch/powerpc/perf/hv-gpci.h
>> +++ b/arch/powerpc/perf/hv-gpci.h
>> @@ -26,6 +26,7 @@ enum {
>>  #define REQUEST_FILE "../hv-gpci-requests.h"
>>  #define NAME_LOWER hv_gpci
>>  #define NAME_UPPER HV_GPCI
>> +#define EVENT_ENABLE
>>  #include "req-gen/perf.h"
>>  #undef REQUEST_FILE
>>  #undef NAME_LOWER
>> diff --git a/arch/powerpc/perf/req-gen/perf.h b/arch/powerpc/perf/req-gen/perf.h
>> index fa9bc804e67a..e0b355931271 100644
>> --- a/arch/powerpc/perf/req-gen/perf.h
>> +++ b/arch/powerpc/perf/req-gen/perf.h
>> @@ -139,6 +139,23 @@ PMU_EVENT_ATTR_STRING(							\
>>  #define REQUEST_(r_name, r_value, r_idx_1, r_fields)			\
>>  	r_fields
>>  
>> +/* Generate event list for platforms with counter_info_version 0x6 or below */
>> +static __maybe_unused struct attribute *hv_gpci_event_attrs_v6[] = {
>> +#include REQUEST_FILE
>> +	NULL
>> +};
>> +
>> +/*
>> + * Based on getPerfCountInfo v1.018 documentation, some of the hv-gpci
>> + * events got deprecated for platforms firmware that supports
> 
> Same wording as in the change log.
> 
>> + * counter_info_version 0x8 or above.
>> + * Undefining macro EVENT_ENABLE, to disable the addition of deprecated
>> + * events in "hv_gpci_event_attrs" attribute group, for platforms that
>> + * supports counter_info_version 0x8 or above.
>> + */
>> +#undef EVENT_ENABLE
>> +
>> +/* Generate event list for platforms with counter_info_version 0x8 or above*/
>>  static __maybe_unused struct attribute *hv_gpci_event_attrs[] = {
>>  #include REQUEST_FILE
>>  	NULL
>> -- 
>> 2.31.1
> 
> cheers
