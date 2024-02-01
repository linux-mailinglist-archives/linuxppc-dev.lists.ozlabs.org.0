Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD18845336
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 09:56:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ezr2zegE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TQXnq4Hdqz3cXG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Feb 2024 19:56:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ezr2zegE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=akanksha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TQTx70kqhz2yk6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Feb 2024 17:47:38 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41162eBu024658;
	Thu, 1 Feb 2024 06:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=n2sWO98dVDCiqjxcXhlero1aLXrqThLynPXjGycLrZE=;
 b=ezr2zegE/3/3/yt2OQfxdTmMorO3BENJSaE1OUsfVU3R9zZPo06ISWfXWZCyYOYTWsFl
 tmO1lpewU2Sjsnd0c0ntJs80v/PiUbiafmjhvjPdZgKy1HhHg2puGgEtiAlQlpmnV1o2
 6JIAUlRcaU4l2Aa7tbTwanSyKdSsyhC84ogLCMDBnPyVvb2hdaNfBNlPZsixw5sxxmRH
 fZZ1uWhKpuy+5LVtxlLdtFw65uiRIfl2+z2BaNadN/rix+Co23efbeSpMtYVx9a1bQ4R
 xchGx35hPGRsvnzALRu23X8ZcG7JNHGEaftu8SipyEPRum9V8R5kV8FMcoss3AhrcBRi 8Q== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w05p6h1bh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 06:47:32 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4115gt8G017746;
	Thu, 1 Feb 2024 06:47:30 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vwcj02nyt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Feb 2024 06:47:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4116lR0328836178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Feb 2024 06:47:27 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 657DF20043;
	Thu,  1 Feb 2024 06:47:27 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 599F020040;
	Thu,  1 Feb 2024 06:47:26 +0000 (GMT)
Received: from [9.109.204.147] (unknown [9.109.204.147])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Feb 2024 06:47:26 +0000 (GMT)
Message-ID: <43a500ba-b1c5-4048-a244-71fb6698be53@linux.ibm.com>
Date: Thu, 1 Feb 2024 12:17:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/hv-gpci: Fix the hcall return value checks in
 single_gpci_request function
Content-Language: en-US
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20240131112600.121482-1-kjain@linux.ibm.com>
From: Akanksha J N <akanksha@linux.ibm.com>
In-Reply-To: <20240131112600.121482-1-kjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Xzg5rzfJs1Y-6oxh8Jvgy4s3ljojvvDT
X-Proofpoint-ORIG-GUID: Xzg5rzfJs1Y-6oxh8Jvgy4s3ljojvvDT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-31_10,2024-01-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1011 adultscore=0 spamscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402010053
X-Mailman-Approved-At: Thu, 01 Feb 2024 19:55:54 +1100
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
Cc: atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 31/01/24 4:56 pm, Kajol Jain wrote:

> Running event hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
> in one of the system throws below error:
>
>   ---Logs---
>   # perf list | grep hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles
>    hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=?/[Kernel PMU event]
>
>
>   # perf stat -v -e hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ sleep 2
> Using CPUID 00800200
> Control descriptor is not initialized
> Warning:
> hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ event is not supported by the kernel.
> failed to read counter hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
>
>   Performance counter stats for 'system wide':
>
>     <not supported>      hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/
>
>         2.000700771 seconds time elapsed
>
> The above error is because of the hcall failure as required
> permission "Enable Performance Information Collection" is not set.
> Based on current code, single_gpci_request function did not check the
> error type incase hcall fails and by default returns EINVAL. But we can
> have other reasons for hcall failures like H_AUTHORITY/H_PARAMETER for which
> we need to act accordingly.
> Fix this issue by adding new checks in the single_gpci_request function.
>
> Result after fix patch changes:
>
>   # perf stat -e hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ sleep 2
> Error:
> No permission to enable hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=0/ event.
>
> Fixes: 220a0c609ad1 ("powerpc/perf: Add support for the hv gpci (get performance counter info) interface")
> Reported-by: Akanksha J N <akanksha@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

Tested the patch on Power10 system, and the fix works fine.

# ./perf stat -v -e hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=1/ sleep 2
Control descriptor is not initialized
hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=1/: 0 2001246376 2001246376
  Performance counter stats for 'system wide':
                  0      hv_gpci/dispatch_timebase_by_processor_processor_time_in_timebase_cycles,phys_processor_idx=1/
        2.001250313 seconds time elapsed

Tested-by: Akanksha J N <akanksha@linux.ibm.com>

> ---
>   arch/powerpc/perf/hv-gpci.c | 29 +++++++++++++++++++++++++----
>   1 file changed, 25 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
> index 27f18119fda1..101060facd81 100644
> --- a/arch/powerpc/perf/hv-gpci.c
> +++ b/arch/powerpc/perf/hv-gpci.c
> @@ -695,7 +695,17 @@ static unsigned long single_gpci_request(u32 req, u32 starting_index,
>   
>   	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO,
>   			virt_to_phys(arg), HGPCI_REQ_BUFFER_SIZE);
> -	if (ret) {
> +
> +	/*
> +	 * ret value as 'H_PARAMETER' corresponds to 'GEN_BUF_TOO_SMALL',
> +	 * which means that the current buffer size cannot accommodate
> +	 * all the information and a partial buffer returned.
> +	 * Since in this function we are only accessing data for a given starting index,
> +	 * we don't need to accommodate whole data and can get required count by
> +	 * accessing very first entry.
> +	 * Hence hcall fails only incase the ret value is other than H_SUCCESS or H_PARAMETER.
> +	 */
> +	if (ret && (ret != H_PARAMETER)) {
>   		pr_devel("hcall failed: 0x%lx\n", ret);
>   		goto out;
>   	}
> @@ -724,7 +734,7 @@ static u64 h_gpci_get_value(struct perf_event *event)
>   					event_get_offset(event),
>   					event_get_length(event),
>   					&count);
> -	if (ret)
> +	if (ret && (ret != H_PARAMETER))
>   		return 0;
>   	return count;
>   }
> @@ -759,6 +769,7 @@ static int h_gpci_event_init(struct perf_event *event)
>   {
>   	u64 count;
>   	u8 length;
> +	unsigned long ret;
>   
>   	/* Not our event */
>   	if (event->attr.type != event->pmu->type)
> @@ -789,13 +800,23 @@ static int h_gpci_event_init(struct perf_event *event)
>   	}
>   
>   	/* check if the request works... */
> -	if (single_gpci_request(event_get_request(event),
> +	ret = single_gpci_request(event_get_request(event),
>   				event_get_starting_index(event),
>   				event_get_secondary_index(event),
>   				event_get_counter_info_version(event),
>   				event_get_offset(event),
>   				length,
> -				&count)) {
> +				&count);
> +
> +	/*
> +	 * ret value as H_AUTHORITY implies that partition is not permitted to retrieve
> +	 * performance information, and required to set
> +	 * "Enable Performance Information Collection" option.
> +	 */
> +	if (ret == H_AUTHORITY)
> +		return -EPERM;
> +
> +	if (ret && (ret != H_PARAMETER)) {
>   		pr_devel("gpci hcall failed\n");
>   		return -EINVAL;
>   	}
