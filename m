Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A02A21AF68
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 08:28:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B335H70WGzDqC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 16:28:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B333C2y3JzDrCQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 16:26:31 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06A63iTB080547; Fri, 10 Jul 2020 02:26:26 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 326j8397bx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 02:26:26 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06A6P39R001486;
 Fri, 10 Jul 2020 06:26:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma02fra.de.ibm.com with ESMTP id 326bcf0bju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 06:26:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06A6P7kn43253922
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jul 2020 06:25:07 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07E5511C05C;
 Fri, 10 Jul 2020 06:25:07 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9B7211C04A;
 Fri, 10 Jul 2020 06:25:05 +0000 (GMT)
Received: from [9.199.58.157] (unknown [9.199.58.157])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 10 Jul 2020 06:25:05 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf: Add kernel support for new MSR[HV PR] bits
 in trace-imc.
To: Anju T Sudhakar <anju@linux.vnet.ibm.com>, mpe@ellerman.id.au
References: <20200703063626.1412544-1-anju@linux.vnet.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <ae6ea9d9-c334-a6f6-3bce-e03b90a5f4ae@linux.ibm.com>
Date: Fri, 10 Jul 2020 11:55:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200703063626.1412544-1-anju@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_01:2020-07-09,
 2020-07-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007100040
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/3/20 12:06 PM, Anju T Sudhakar wrote:
> IMC trace-mode record has MSR[HV PR] bits added in the third DW.
> These bits can be used to set the cpumode for the instruction pointer
> captured in each sample.
>                                                                             
> Add support in kernel to use these bits to set the cpumode for
> each sample.
>                   

Changes looks fine to me.
Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

>                                                            
> Signed-off-by: Anju T Sudhakar <anju@linux.vnet.ibm.com>
> ---
>   arch/powerpc/include/asm/imc-pmu.h |  5 +++++
>   arch/powerpc/perf/imc-pmu.c        | 29 ++++++++++++++++++++++++-----
>   2 files changed, 29 insertions(+), 5 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/imc-pmu.h b/arch/powerpc/include/asm/imc-pmu.h
> index 4da4fcba0684..4f897993b710 100644
> --- a/arch/powerpc/include/asm/imc-pmu.h
> +++ b/arch/powerpc/include/asm/imc-pmu.h
> @@ -99,6 +99,11 @@ struct trace_imc_data {
>    */
>   #define IMC_TRACE_RECORD_TB1_MASK      0x3ffffffffffULL
>
> +/*
> + * Bit 0:1 in third DW of IMC trace record
> + * specifies the MSR[HV PR] values.
> + */
> +#define IMC_TRACE_RECORD_VAL_HVPR(x)	((x) >> 62)
>
>   /*
>    * Device tree parser code detects IMC pmu support and
> diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
> index cb50a9e1fd2d..310922fed9eb 100644
> --- a/arch/powerpc/perf/imc-pmu.c
> +++ b/arch/powerpc/perf/imc-pmu.c
> @@ -1178,11 +1178,30 @@ static int trace_imc_prepare_sample(struct trace_imc_data *mem,
>   	header->size = sizeof(*header) + event->header_size;
>   	header->misc = 0;
>
> -	if (is_kernel_addr(data->ip))
> -		header->misc |= PERF_RECORD_MISC_KERNEL;
> -	else
> -		header->misc |= PERF_RECORD_MISC_USER;
> -
> +	if (cpu_has_feature(CPU_FTRS_POWER9)) {
> +		if (is_kernel_addr(data->ip))
> +			header->misc |= PERF_RECORD_MISC_KERNEL;
> +		else
> +			header->misc |= PERF_RECORD_MISC_USER;
> +	} else {
> +		switch (IMC_TRACE_RECORD_VAL_HVPR(mem->val)) {
> +		case 0:/* when MSR HV and PR not set in the trace-record */
> +			header->misc |= PERF_RECORD_MISC_GUEST_KERNEL;
> +			break;
> +		case 1: /* MSR HV is 0 and PR is 1 */
> +			header->misc |= PERF_RECORD_MISC_GUEST_USER;
> +			break;
> +		case 2: /* MSR Hv is 1 and PR is 0 */
> +			header->misc |= PERF_RECORD_MISC_HYPERVISOR;
> +			break;
> +		case 3: /* MSR HV is 1 and PR is 1 */
> +			header->misc |= PERF_RECORD_MISC_USER;
> +			break;
> +		default:
> +			pr_info("IMC: Unable to set the flag based on MSR bits\n");
> +			break;
> +		}
> +	}
>   	perf_event_header__init_id(header, data, event);
>
>   	return 0;

