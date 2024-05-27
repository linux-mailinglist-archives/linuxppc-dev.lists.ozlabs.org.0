Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 6FDF08CFC9A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 11:16:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VnqXT02ZKz3gJy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 May 2024 19:07:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=anjalik@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VnqX13Hjcz2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2024 19:06:41 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 44R8qgkE002132;
	Mon, 27 May 2024 09:06:36 GMT
DKIM-Signature: =?UTF-8?Q?v=3D1;_a=3Drsa-sha256;_c=3Drelaxed/relaxed;_d=3Dibm.com;_h=3Dcc?=
 =?UTF-8?Q?:content-transfer-encoding:content-type:date:from:in-reply-to:m?=
 =?UTF-8?Q?essage-id:mime-version:references:subject:to;_s=3Dpp1;_bh=3D9VN?=
 =?UTF-8?Q?GgwJp0/qAvI1UvmSQ9pLb1afIenqCAYLigWrCnVo=3D;_b=3DkPCiNS4pwddak8?=
 =?UTF-8?Q?X+7bL4X0UOLVKbjhlYf9c0uHw8p7OtprVjtzNDsam0mILpL2BdBLPR_6B/qWXJ9?=
 =?UTF-8?Q?D9LkxSFpjZw41TgS4T0XBPlVxA448IrCEFa0cEDmzFpk1vw1yxCcWyEUbvBP_3T?=
 =?UTF-8?Q?jPx2uHWZQTIudBOUWXs3r2eZ/6w4wFlZqErq55nNdbmxsYhJJqXA8iWp7ZlsI3H?=
 =?UTF-8?Q?/QK_wcm0l1/x2mk9Yh8kLMTAyf9adDX5U7cprO5WTJZ44eBJc00LpYBSZ/oOHuo?=
 =?UTF-8?Q?0I6DQHKCS_h/MeTUJ2ONNJ347bF8/MX80SLzY7EysIlB5r6fAZEAIergyCu636k?=
 =?UTF-8?Q?+loo2Qfu7Vc6Xgx_WQ=3D=3D_?=
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ycq1y0155-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 09:06:35 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 44R8XdNR004505;
	Mon, 27 May 2024 09:06:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ybuanr2ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 27 May 2024 09:06:35 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 44R96TWj47907202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 May 2024 09:06:31 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A98C2004F;
	Mon, 27 May 2024 09:06:29 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 74EA620049;
	Mon, 27 May 2024 09:06:28 +0000 (GMT)
Received: from [9.204.205.198] (unknown [9.204.205.198])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 27 May 2024 09:06:28 +0000 (GMT)
Message-ID: <917f58e9-b002-4c71-b714-2d4a201f4038@linux.ibm.com>
Date: Mon, 27 May 2024 14:36:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc/perf: Set cpumode flags using sample address
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20240517094607.422166-1-anjalik@linux.ibm.com>
 <87ed9r4qoy.fsf@mail.lhotse>
Content-Language: en-US
From: Anjali K <anjalik@linux.ibm.com>
In-Reply-To: <87ed9r4qoy.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jfmINDppSwKX_h6toa5p_sIW73IvRIcb
X-Proofpoint-ORIG-GUID: jfmINDppSwKX_h6toa5p_sIW73IvRIcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-26_09,2024-05-24_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 spamscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2405010000 definitions=main-2405270074
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
Cc: kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 24/05/24 12:55, Michael Ellerman wrote:
> Hi Anjali,
>
> Anjali K <anjalik@linux.ibm.com> writes:
>> Currently in some cases, when the sampled instruction address register
>> latches to a specific address during sampling, there is an inconsistency
>> in the privilege bits captured in the sampled event register.
>  
> I don't really like "inconsistency", it's vague.
>
> The sampled address is correct, and the privilege bits are incorrect.
>
> If someone is offended by that wording you can direct them to me :)
>
>> For example, a snippet from the perf report on a power10 system is:
>> Overhead  Address             Command       Shared Object      Symbol
>> ........  ..................  ............  .................  .......................
>>      2.41%  0x7fff9f94a02c      null_syscall  [unknown]          [k] 0x00007fff9f94a02c
>>      2.20%  0x7fff9f94a02c      null_syscall  libc.so.6          [.] syscall
>>
>> perf_get_misc_flags() function looks at the privilege bits to return
>> the corresponding flags to be used for the address symbol and these
>> privilege bit details are read from the sampled event register. In the
>> above snippet, address "0x00007fff9f94a02c" is shown as "k" (kernel) due
>> to the inconsistent privilege bits captured in the sampled event register.
>  
> "incorrect privilege bits"
>
>> To address this case, the proposed fix is to additionally check whether the
>  
> "To address this case check whether the"
>
>> sampled address is in the kernel area. Since this is specific to the latest
>> platform, a new pmu flag is added called "PPMU_P10" and is used to
>> contain the proposed fix.
> You should explain why this fix replaces the existing P10_DD1 logic.
>
>> Signed-off-by: Anjali K <anjalik@linux.ibm.com>
>> ---
>> Changelog:
>> V1->V2:
>> Fixed the build warning reported by the kernel test bot
>> Added a new flag PPMU_P10 and used it instead of PPMU_ARCH_31 to restrict
>> the changes to the current platform (Power10)
>>
>>  arch/powerpc/include/asm/perf_event_server.h |  1 +
>>  arch/powerpc/perf/core-book3s.c              | 43 ++++++++------------
>>  arch/powerpc/perf/power10-pmu.c              |  3 +-
>>  3 files changed, 20 insertions(+), 27 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
>> index e2221d29fdf9..12f7bfb4cab1 100644
>> --- a/arch/powerpc/include/asm/perf_event_server.h
>> +++ b/arch/powerpc/include/asm/perf_event_server.h
>> @@ -90,6 +90,7 @@ struct power_pmu {
>>  #define PPMU_ARCH_31		0x00000200 /* Has MMCR3, SIER2 and SIER3 */
>>  #define PPMU_P10_DD1		0x00000400 /* Is power10 DD1 processor version */
>>  #define PPMU_HAS_ATTR_CONFIG1	0x00000800 /* Using config1 attribute */
>> +#define PPMU_P10			0x00001000 /* For power10 pmu */
>   
> Can you put PPMU_P10 immediately after PPMU_P10_DD1. It's OK to renumber
> PPMU_HAS_ATTR_CONFIG1.
>
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
>> index 6b5f8a94e7d8..8a2677463a73 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -266,31 +266,12 @@ static inline u32 perf_flags_from_msr(struct pt_regs *regs)
>>  static inline u32 perf_get_misc_flags(struct pt_regs *regs)
>>  {
>>  	bool use_siar = regs_use_siar(regs);
>> -	unsigned long mmcra = regs->dsisr;
>> -	int marked = mmcra & MMCRA_SAMPLE_ENABLE;
>> +	unsigned long siar = mfspr(SPRN_SIAR);
>  
> We shouldn't read SPRN_SIAR until we know it will be used.
>
>> +	unsigned long addr;
>>  
>>  	if (!use_siar)
>>  		return perf_flags_from_msr(regs);
>>  
>> -	/*
>> -	 * Check the address in SIAR to identify the
>> -	 * privilege levels since the SIER[MSR_HV, MSR_PR]
>> -	 * bits are not set for marked events in power10
>> -	 * DD1.
>> -	 */
>> -	if (marked && (ppmu->flags & PPMU_P10_DD1)) {
>> -		unsigned long siar = mfspr(SPRN_SIAR);
>> -		if (siar) {
>> -			if (is_kernel_addr(siar))
>> -				return PERF_RECORD_MISC_KERNEL;
>> -			return PERF_RECORD_MISC_USER;
>> -		} else {
>> -			if (is_kernel_addr(regs->nip))
>> -				return PERF_RECORD_MISC_KERNEL;
>> -			return PERF_RECORD_MISC_USER;
>> -		}
>> -	}
>> -
>>  	/*
>>  	 * If we don't have flags in MMCRA, rather than using
>>  	 * the MSR, we intuit the flags from the address in
>> @@ -298,19 +279,29 @@ static inline u32 perf_get_misc_flags(struct pt_regs *regs)
>>  	 * results
>>  	 */
>>  	if (ppmu->flags & PPMU_NO_SIPR) {
>> -		unsigned long siar = mfspr(SPRN_SIAR);
>>  		if (is_kernel_addr(siar))
>>  			return PERF_RECORD_MISC_KERNEL;
>>  		return PERF_RECORD_MISC_USER;
>>  	}
>>  
>>  	/* PR has priority over HV, so order below is important */
>> -	if (regs_sipr(regs))
>> -		return PERF_RECORD_MISC_USER;
>> -
>> -	if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
>> +	if (regs_sipr(regs)) {
>> +		if (!(ppmu->flags & PPMU_P10))
>> +			return PERF_RECORD_MISC_USER;
>> +	} else if (regs_sihv(regs) && (freeze_events_kernel != MMCR0_FCHV))
>>  		return PERF_RECORD_MISC_HYPERVISOR;
>>  
>> +	/*
>> +	 * Check the address in SIAR to identify the
>> +	 * privilege levels since the SIER[MSR_HV, MSR_PR]
>> +	 * bits are not set correctly in power10 sometimes
>> +	 */
>> +	if (ppmu->flags & PPMU_P10) {
>> +		addr = siar ? siar : regs->nip;
>> +		if (!is_kernel_addr(addr))
>> +			return PERF_RECORD_MISC_USER;
>> +	}
>> +
>>  	return PERF_RECORD_MISC_KERNEL;
>>  }
> cheers

Thank you for reviewing. I will address the review comments and send the next version of the patch.
Anjali K


