Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 537F7605754
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 08:32:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MtHpH0Bnmz3dtY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Oct 2022 17:32:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FpWLTKWk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FpWLTKWk;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MtHnG1cyFz3bjh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Oct 2022 17:31:45 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29K67HVD000394;
	Thu, 20 Oct 2022 06:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=bwOU/pXE7NvDZA1UipSxtnnxUTqxlUtOygcE3SO0UII=;
 b=FpWLTKWk9I75mNtuUKBkYk68stq+HNV4+TgJDZpkPg51aOwwBIzDReWwNPDREgX7iCB5
 fPbhLldnDdyezTT3ukRkSoTjKXIkzDRXXy9uIfKAPHPxpdt6KmsrxktSPwK18MrAImsF
 IT7kv/cXaLUBuAyN8cskApjX6vpOqJJQkw4lEWFiy2wL0WWBCXp/qgVboTDLXw3gEYWQ
 H/5sbCYsTN5aBEU9hyllynNYGrtQ3vcVP28CI1UztMrwgPyEgrd0O/sbIFsz95Oa9GJQ
 O7jfq6Mx4Z4Z+azJcSOlzqKo8QiL22fiHUqKJ4qY1VVzt4eCbREXdWAcVqajyWX9qIMu iA== 
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kayyc9w7u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 06:31:39 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29K6Kaci011788;
	Thu, 20 Oct 2022 06:31:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03fra.de.ibm.com with ESMTP id 3k7mg9e8um-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Oct 2022 06:31:37 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29K6VZog8127038
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Oct 2022 06:31:35 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 528AAA4062;
	Thu, 20 Oct 2022 06:31:35 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BD7BA4054;
	Thu, 20 Oct 2022 06:31:34 +0000 (GMT)
Received: from [9.43.37.240] (unknown [9.43.37.240])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 20 Oct 2022 06:31:33 +0000 (GMT)
Message-ID: <c9503bef-12a1-5169-9b1e-db58f409ae40@linux.ibm.com>
Date: Thu, 20 Oct 2022 12:01:33 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH] powerpc/hv-gpci: Fix hv_gpci event list
To: Michael Ellerman <mpe@ellerman.id.au>, Kajol Jain <kjain@linux.ibm.com>
References: <20220920163843.233822-1-kjain@linux.ibm.com>
 <87pmeplfol.fsf@mpe.ellerman.id.au>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <87pmeplfol.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: uzO_qb7sPELXhVAv0r3ExjZgYVSQKDyS
X-Proofpoint-ORIG-GUID: uzO_qb7sPELXhVAv0r3ExjZgYVSQKDyS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-10-20_01,2022-10-19_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 phishscore=0 mlxlogscore=999 malwarescore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210200037
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/18/22 1:35 PM, Michael Ellerman wrote:
> Kajol Jain <kjain@linux.ibm.com> writes:
>> Based on getPerfCountInfo v1.018 documentation, some of the
>> hv_gpci events got deprecated for platforms firmware that
>> supports counter_info_version 0x8 or above.
>>
>> Patch fixes the hv_gpci event list by adding a new attribute
>> group called "hv_gpci_event_attrs_v6" and a "EVENT_ENABLE"
>> macro to enable these events for platform firmware
>> that supports counter_info_version 0x6 or below.
> Does this handle CPUs booted in compat mode?
Nice catch. Sorry I missed that part completely during internal review. 
my bad.
> ie. where the firmware is newer but the kernel is told to behave as if
> the CPU is an older version - so cpu_has_feature() doesn't necessarily
> match the underlying hardware.
>
> Is there some reason the event list is populated based on the CPU
> features rather than by calling the hypervisor and asking what version
> is supported?
I will review the hcall doc again for that option.

maddy
>
>> Fixes: 97bf2640184f4 ("powerpc/perf/hv-gpci: add the remaining gpci
>> requests")
> Please don't wrap the fixes tag.
>
> cheers
>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>   arch/powerpc/perf/hv-gpci-requests.h |  4 ++++
>>   arch/powerpc/perf/hv-gpci.c          |  9 +++++++--
>>   arch/powerpc/perf/hv-gpci.h          |  1 +
>>   arch/powerpc/perf/req-gen/perf.h     | 17 +++++++++++++++++
>>   4 files changed, 29 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/perf/hv-gpci-requests.h b/arch/powerpc/perf/hv-gpci-requests.h
>> index 8965b4463d43..baef3d082de9 100644
>> --- a/arch/powerpc/perf/hv-gpci-requests.h
>> +++ b/arch/powerpc/perf/hv-gpci-requests.h
>> @@ -79,6 +79,7 @@ REQUEST(__field(0,	8,	partition_id)
>>   )
>>   #include I(REQUEST_END)
>>   
>> +#ifdef EVENT_ENABLE
>>   /*
>>    * Not available for counter_info_version >= 0x8, use
>>    * run_instruction_cycles_by_partition(0x100) instead.
>> @@ -92,6 +93,7 @@ REQUEST(__field(0,	8,	partition_id)
>>   	__count(0x10,	8,	cycles)
>>   )
>>   #include I(REQUEST_END)
>> +#endif
>>   
>>   #define REQUEST_NAME system_performance_capabilities
>>   #define REQUEST_NUM 0x40
>> @@ -103,6 +105,7 @@ REQUEST(__field(0,	1,	perf_collect_privileged)
>>   )
>>   #include I(REQUEST_END)
>>   
>> +#ifdef EVENT_ENABLE
>>   #define REQUEST_NAME processor_bus_utilization_abc_links
>>   #define REQUEST_NUM 0x50
>>   #define REQUEST_IDX_KIND "hw_chip_id=?"
>> @@ -194,6 +197,7 @@ REQUEST(__field(0,	4,	phys_processor_idx)
>>   	__count(0x28,	8,	instructions_completed)
>>   )
>>   #include I(REQUEST_END)
>> +#endif
>>   
>>   /* Processor_core_power_mode (0x95) skipped, no counters */
>>   /* Affinity_domain_information_by_virtual_processor (0xA0) skipped,
>> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
>> index 5eb60ed5b5e8..065a01812b3e 100644
>> --- a/arch/powerpc/perf/hv-gpci.c
>> +++ b/arch/powerpc/perf/hv-gpci.c
>> @@ -70,9 +70,9 @@ static const struct attribute_group format_group = {
>>   	.attrs = format_attrs,
>>   };
>>   
>> -static const struct attribute_group event_group = {
>> +static struct attribute_group event_group = {
>>   	.name  = "events",
>> -	.attrs = hv_gpci_event_attrs,
>> +	/* .attrs is set in init */
>>   };
>>   
>>   #define HV_CAPS_ATTR(_name, _format)				\
>> @@ -353,6 +353,11 @@ static int hv_gpci_init(void)
>>   	/* sampling not supported */
>>   	h_gpci_pmu.capabilities |= PERF_PMU_CAP_NO_INTERRUPT;
>>   
>> +	if (cpu_has_feature(CPU_FTR_ARCH_207S))
>> +		event_group.attrs = hv_gpci_event_attrs;
>> +	else
>> +		event_group.attrs = hv_gpci_event_attrs_v6;
>> +
>>   	r = perf_pmu_register(&h_gpci_pmu, h_gpci_pmu.name, -1);
>>   	if (r)
>>   		return r;
>> diff --git a/arch/powerpc/perf/hv-gpci.h b/arch/powerpc/perf/hv-gpci.h
>> index 4d108262bed7..866172c1651c 100644
>> --- a/arch/powerpc/perf/hv-gpci.h
>> +++ b/arch/powerpc/perf/hv-gpci.h
>> @@ -26,6 +26,7 @@ enum {
>>   #define REQUEST_FILE "../hv-gpci-requests.h"
>>   #define NAME_LOWER hv_gpci
>>   #define NAME_UPPER HV_GPCI
>> +#define EVENT_ENABLE	1
>>   #include "req-gen/perf.h"
>>   #undef REQUEST_FILE
>>   #undef NAME_LOWER
>> diff --git a/arch/powerpc/perf/req-gen/perf.h b/arch/powerpc/perf/req-gen/perf.h
>> index fa9bc804e67a..78d407e3fcc6 100644
>> --- a/arch/powerpc/perf/req-gen/perf.h
>> +++ b/arch/powerpc/perf/req-gen/perf.h
>> @@ -139,6 +139,23 @@ PMU_EVENT_ATTR_STRING(							\
>>   #define REQUEST_(r_name, r_value, r_idx_1, r_fields)			\
>>   	r_fields
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
>> + * counter_info_version 0x8 or above.
>> + * Undefining macro EVENT_ENABLE, to disable the addition of deprecated
>> + * events in "hv_gpci_event_attrs" attribute group, for platforms that
>> + * supports counter_info_version 0x8 or above.
>> + */
>> +#undef EVENT_ENABLE
>> +
>> +/* Generate event list for platforms with counter_info_version 0x8 or above*/
>>   static __maybe_unused struct attribute *hv_gpci_event_attrs[] = {
>>   #include REQUEST_FILE
>>   	NULL
>> -- 
>> 2.31.1
