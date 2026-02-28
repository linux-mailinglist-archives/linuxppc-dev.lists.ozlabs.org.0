Return-Path: <linuxppc-dev+bounces-17451-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aMmdK9Txomky8QQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17451-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 14:47:00 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EEDC1C34ED
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 14:46:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNRM23lC5z3bmc;
	Sun, 01 Mar 2026 00:46:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772286414;
	cv=none; b=GZ8NAJnbbC5GQxuNxklc0C7Kv/ms58xK8p5FpdzFZzNKYpkix7h1gGkDKxK+YGu3AV4Xih7RdMO8wQNx/HVY6oYbKe7+H4hiVLR6RLknkXEvVePzxHwWqdhIjTRasTOc0yzxWBcJkYAa+GE1Jxl2Ae4e4CPU2Nn8VgJm9A5/epXBskQ0Whw39Wstscy5rpu2k/nya0rOhWqOs2FZ7JM70Z3KxTtNfNDDJz8mc1Rq/LhM7nsP/YLF00SESovlyZJmWEdTuUptLQ9+fYheMQFBiwsL4Isy8YbSyMLC1tMTz+Fo5W2ZCFddFiGI4gtlVv+eP7QY9ffgQLtmDCyo6zOYLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772286414; c=relaxed/relaxed;
	bh=0EXJKQ8KgtoZoI2jIZ7waJGT1vVb8Eepe+V8HPryizQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k8IlR6LbwmQe7xC7hQuP0W8wn68AodyXQnqAdrK1xy/vhGEHY/B6PVWwS+VdupOIn/JELTjARcdfiomPU3A5bO6/Avefg+K7QpmOEGmfadrX+Ciu9rh8wfH5Ku+O6kdZvbbjoou7Hq60njzSrv0PLpZtBtKFS/DaveLxaQAjrzvlwlORAfl2TaaXINcHsryj+efrKE2lV/Cy8aln/VJE7Mn4+Vl4o3iQiLDxiwXRPl6E/9T18b7/LB8x+wNJo/eJCmQAGYVVbg1nAhcOXcFvpSKumKfgWKqMHKnaW1cSLJU/vfj9fXTN3yCSZao+SXSeTeiXSFmoePjcBsco+UGWAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rgOOaLKc; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rgOOaLKc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNRM06ChFz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 01 Mar 2026 00:46:51 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61SDjoPq2612896;
	Sat, 28 Feb 2026 13:46:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0EXJKQ
	8KgtoZoI2jIZ7waJGT1vVb8Eepe+V8HPryizQ=; b=rgOOaLKcnwkp9J35cdBDUf
	lCHPdkUzz5Vyzwb3HzWiwUg0zsFc0WXpScsOfZ7uW38Aex6UC76IMQWpQerTwxW9
	l8UrdT0EM4yrHSZAwdwN5mCWsqjpV1ePxBfqjrND6P1fu+GOsiwlybzpWv8QaJSc
	F4tUYexie9FTSeFKsvrQYj+wsTR/WmT1Nf3krpGnu7vXY8Kwba8NylOc1UcPgFMl
	6U2G1cFI12w/pCHjRgXSSmtNwA0SSkOeDuBU2GUHxOdsRI9q0d+0/lZfjZNwIgB0
	IjJ9xBcsEjTpie1HXiK+NoQ/e9cghsCr3NBysykbjMEQIi1LmB1KPH+y3sgSG7jw
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckskbgxa7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:46:31 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61SAjDH7004541;
	Sat, 28 Feb 2026 13:46:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfs8kej94-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 28 Feb 2026 13:46:30 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61SDkQQo43319576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Feb 2026 13:46:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E20B42004B;
	Sat, 28 Feb 2026 13:46:26 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40FCC20043;
	Sat, 28 Feb 2026 13:46:24 +0000 (GMT)
Received: from [9.124.209.149] (unknown [9.124.209.149])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 28 Feb 2026 13:46:23 +0000 (GMT)
Message-ID: <6a0fc7ec-591e-4f23-b0f2-aec9aea88621@linux.ibm.com>
Date: Sat, 28 Feb 2026 19:16:22 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: powerpc/fadump: CMA init is failing
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Mike Rapoport <rppt@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Donet Tom <donettom@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-mm@kvack.org
References: <4c338a29-d190-44f3-8874-6cfa0a031f0b@linux.ibm.com>
 <87o6lagljy.ritesh.list@gmail.com> <aaIDkB2xLABDyV1y@kernel.org>
 <87ms0th9xt.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87ms0th9xt.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: 64-aI1JSamPa6-OAXTjSFOkfn4ujOU34
X-Authority-Analysis: v=2.4 cv=b66/I9Gx c=1 sm=1 tr=0 ts=69a2f1b7 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=V8glGbnc2Ofi9Qvn3v5h:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=47IChveiNnVNrxUg3wQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI4MDA1MCBTYWx0ZWRfX2DF1OSDfsUT/
 ZYtsLcbSEit8DeUesUF/nKYn3Esq4ytJOBtNbtLetsiUYJOOD3PvBtv61FTuQmESBLnSyYYzrie
 l7AbG8/mR4YA4Yi8JEDELsWV/eFgFg7rqZWuZYzWtwKRFnNA6zy8OPFEWmBT81DqOvl6O6h/7aB
 OrvxFmwY6H5hsjsNubJaNfqc13lPHHUKAUp/6oE6BbYwLECUutRlHP7rcK5CcU4Fno2m4vraF7m
 N3TZ6CWLk1mVbfzYI9oQb85A7cSev4vfBocvaKRwr5b4pqehKi5XyWK9n1chVg1z5Ey+T9kruQS
 SPLoJfoIi0x7hGdtprWo1ksvVqs9M1OXMIFkn7EBR2HQFMCrptcj5XjRjtrHFWrpuTRV/LrGirw
 w1ehCXAW6hBITQLj0jhzdb67OPX4rI47EDoXFZV7yNVxF5UCMLaFwK/yJFaAdtOZzC/nt4m613q
 zrqrGk5po2cVcDYLZYA==
X-Proofpoint-GUID: HnsQ0w4ztJoCl79kBZBod7RF8wisJzvH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-28_01,2026-02-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602280050
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17451-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,1.201.195.198:email,54.174.64.0:email];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ritesh.list@gmail.com,m:rppt@kernel.org,m:maddy@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:mpe@ellerman.id.au,m:donettom@linux.ibm.com,m:hbathini@linux.ibm.com,m:mahesh@linux.ibm.com,m:linux-mm@kvack.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5EEDC1C34ED
X-Rspamd-Action: no action

Hello Ritesh,

On 28/02/26 08:05, Ritesh Harjani (IBM) wrote:
> Mike Rapoport <rppt@kernel.org> writes:
>
>> Hi Ritesh,
>>
>> On Fri, Feb 27, 2026 at 10:39:53PM +0530, Ritesh Harjani wrote:
>>> Sourabh Jain <sourabhjain@linux.ibm.com> writes:
>>>
>>>> I noticed CMA init for fadump crashkernel memory is failing.
>>>>
>>>> [    0.000000] cma: pageblock_order not yet initialized. Called during
>>>> early boot?
>>>> [    0.000000] fadump: Failed to init cma area for firmware-assisted
>>>> dump,-22
>>>>
>>>>
>>>> kernel command-line:
>>>> BOOT_IMAGE=(ieee1275//vdevice/v-scsi@30000070/disk@8100000000000000,msdos2)/vmlinuz-7.0.0-rc1+
>>>> root=/dev/mapper/rhel_ltcden3--lp12-root ro
>>>> rd.lvm.lv=rhel_ltcden3-lp12/root rd.lvm.lv=rhel_ltcden3-lp12/swap
>>>> fadump=on crashkernel=3G
>>>>
>>>>
>>>> Same issue with kdump CMA reservation:
>>>>
>>>> [    0.000000][    T0] cma: pageblock_order not yet initialized. Called
>>>> during early boot?
>>> Good that we added those debug prints ;)
>>>
>>> I think I know what went wrong, as part of this arch,mm consolidation
>>> patch series [1], I think the order of initialization is changed.
>>>
>>> With this patch the new order is ...
>>> start_kernel()
>>>      - setup_arch()
>>>         - xxx_cma_reserve();
>>>      - mm_core_init_early()
>>>         - free_area_init()
>>>            - sparse_init()
>>>               - set_pageblock_order() // this sets the pageblock_order.
>>>
>>> Whereas earlier set_pageblock_order() was called from initmem_init(),
>>> just before cma reservations were being made.
>>>
>>> start_kernel()
>>>      - setup_arch()
>>>         - initmem_init()
>>>           - sparse_init()
>>>             - set_pageblock_order();  // this sets the pageblock_order
>>>         - xxx_cma_reserve();
>>>
>>> So that means, pageblock_order is not initialized before these cma
>>> reservation function calls, hence we are seeing these failures.
>>>
>>> setup_arch() {
>>>      ...
>>>
>>> 	/*
>>> 	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
>>> 	 * hugetlb. These must be called after initmem_init(), so that
>>> 	 * pageblock_order is initialised.
>>> 	 */
>>> 	fadump_cma_init();
>>> 	kdump_cma_reserve();
>>> 	kvm_cma_reserve();
>>>
>>>      ...
>>> }
>>>
>>>
>>> So what if we do..
>>>
>>> start_kernel() {
>>>    ...
>>> 	setup_arch(&command_line);
>>> 	mm_core_init_early();
>>>      setup_arch_post_mm_core_init(); // and here we call CMA reservation functions ?
>>   
>> Unless I'm missing something these cma reservations can be moved to
>> arch_mm_preinit().
>> It runs after mm_core_init_early() and before memblock moves the free
>> memory to the buddy.
>>
> Right. I think, we should be able to use that...
>
> @Sourabh,
>
> I don't have access to the systems (travelling back...). Could you
> please give this a try?
>
>
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index cb5b73adc250..b1761909c23f 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -35,7 +35,6 @@
>   #include <linux/of_irq.h>
>   #include <linux/hugetlb.h>
>   #include <linux/pgtable.h>
> -#include <asm/kexec.h>
>   #include <asm/io.h>
>   #include <asm/paca.h>
>   #include <asm/processor.h>
> @@ -995,15 +994,6 @@ void __init setup_arch(char **cmdline_p)
>   
>   	initmem_init();
>   
> -	/*
> -	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM and
> -	 * hugetlb. These must be called after initmem_init(), so that
> -	 * pageblock_order is initialised.
> -	 */
> -	fadump_cma_init();
> -	kdump_cma_reserve();
> -	kvm_cma_reserve();
> -
>   	early_memtest(min_low_pfn << PAGE_SHIFT, max_low_pfn << PAGE_SHIFT);
>   
>   	if (ppc_md.setup_arch)
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index 29bf347f6012..5ba947e4fe37 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -30,6 +30,10 @@
>   #include <asm/setup.h>
>   #include <asm/fixmap.h>
>   
> +#include <asm/fadump.h>
> +#include <asm/kexec.h>
> +#include <asm/kvm_ppc.h>
> +
>   #include <mm/mmu_decl.h>
>   
>   unsigned long long memory_limit __initdata;
> @@ -268,6 +272,16 @@ void __init paging_init(void)
>   
>   void __init arch_mm_preinit(void)
>   {
> +
> +	/*
> +	 * Reserve large chunks of memory for use by CMA for kdump, fadump, KVM
> +	 * and hugetlb. These must be called after pageblock_order is
> +	 * initialised.
> +	 */
> +	fadump_cma_init();
> +	kdump_cma_reserve();
> +	kvm_cma_reserve();
> +
>   	/*
>   	 * book3s is limited to 16 page sizes due to encoding this in
>   	 * a 4-bit field for slices.

The above changes fix the issue. CMA initialization now works for both 
kdump and fadump.

Thanks for the fix.

- Sourabh Jain

