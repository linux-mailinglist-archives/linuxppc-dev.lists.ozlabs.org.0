Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D73334F8D31
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 07:00:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KZQzw6VF8z3bcQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Apr 2022 15:00:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IznRb0XF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IznRb0XF; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KZQzC2yhgz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Apr 2022 14:59:50 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2381q7n0002141; 
 Fri, 8 Apr 2022 04:59:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=XJ6WitWzHBEqrCdRQXhKiTSJGQfk88Xq0/BD/OfmpBA=;
 b=IznRb0XFNNiJ/njb+hq8IgVyFq+TXF7VNO9F2Gl+bgtx2guEw/6ggJu2hZzVo9e0L3mG
 VT7kpVP1KBV2i1IBJI7+agZ8Hau3HE1KLMOY8oMkxxE1IgiDzaEf8P7Do3GzoDeJ0iHL
 xOJ8oo9bVFIPxMtxKt/9K7nK+yGVjBJ+umhvEaSw/I9F6g41f5MORpRky2P3fTVMfh3u
 qg9fOCUH/lQsRfy2BPf4l3MfGQZGDv6xIMAqEOnGyt9VZuaeVLlHL2LS3u/5j07/ThGc
 jN+4b874t9A5Fs5zoiam+D2j3MBpcAlJ1ghJ1WgIi4hg4HPKRdsxXpiOmJe/TQuLoRU9 Cw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fabs0tnn1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 04:59:43 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2384vDnC001774;
 Fri, 8 Apr 2022 04:59:41 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3f6e493155-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 04:59:41 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2384xcau10682822
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 04:59:38 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 502A942049;
 Fri,  8 Apr 2022 04:59:38 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D39A4204C;
 Fri,  8 Apr 2022 04:59:37 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.1.46])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  8 Apr 2022 04:59:37 +0000 (GMT)
Date: Fri, 8 Apr 2022 10:29:34 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH] powerpc/fadump: save CPU reg data in vmcore when PHYP
 terminates LPAR
Message-ID: <20220408045934.s7u4qizpy6qxquzm@in.ibm.com>
References: <20220404182137.59231-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220404182137.59231-1-hbathini@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aIbw6YB8vLNR04ZOoQZJKACqT_GzvfcV
X-Proofpoint-ORIG-GUID: aIbw6YB8vLNR04ZOoQZJKACqT_GzvfcV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_01,2022-04-07_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 adultscore=0 mlxlogscore=999 bulkscore=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 malwarescore=0 clxscore=1011 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080024
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-04-04 23:51:37 Mon, Hari Bathini wrote:
> An LPAR can be terminated by the POWER Hypervisor (PHYP) for various
> reasons. If FADump was configured when PHYP terminates the LPAR,
> platform-assisted dump is initiated to save the kernel dump. But CPU
> register data would not be processed/saved in the vmcore in such case
> because CPU mask is set in crash_fadump() at the time of kernel crash
> and it remains unset in this case with LPAR being terminated by PHYP
> abruptly.
> 
> To get around the problem, initialize cpu_mask to cpu_possible_mask
> so as to ensure all possible CPUs' register data is processed for the
> vmcore generated on PHYP terminated LPAR. Also, rename the crash info
> member variable from online_mask to cpu_mask as it doesn't necessarily
> have to be online CPU mask always.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/fadump-internal.h   | 2 +-
>  arch/powerpc/kernel/fadump.c                 | 7 ++++++-
>  arch/powerpc/platforms/pseries/rtas-fadump.c | 2 +-
>  3 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
> index 81bcb9abb371..27f9e11eda28 100644
> --- a/arch/powerpc/include/asm/fadump-internal.h
> +++ b/arch/powerpc/include/asm/fadump-internal.h
> @@ -50,7 +50,7 @@ struct fadump_crash_info_header {
>  	u64		elfcorehdr_addr;
>  	u32		crashing_cpu;
>  	struct pt_regs	regs;
> -	struct cpumask	online_mask;
> +	struct cpumask	cpu_mask;
>  };
>  
>  struct fadump_memory_range {
> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
> index 65562c4a0a69..8343c0b14277 100644
> --- a/arch/powerpc/kernel/fadump.c
> +++ b/arch/powerpc/kernel/fadump.c
> @@ -728,7 +728,7 @@ void crash_fadump(struct pt_regs *regs, const char *str)
>  	else
>  		ppc_save_regs(&fdh->regs);
>  
> -	fdh->online_mask = *cpu_online_mask;
> +	fdh->cpu_mask = *cpu_online_mask;
>  
>  	/*
>  	 * If we came in via system reset, wait a while for the secondary
> @@ -1164,6 +1164,11 @@ static unsigned long init_fadump_header(unsigned long addr)
>  	fdh->elfcorehdr_addr = addr;
>  	/* We will set the crashing cpu id in crash_fadump() during crash. */
>  	fdh->crashing_cpu = FADUMP_CPU_UNKNOWN;
> +	/*
> +	 * When LPAR is terminated by PYHP, ensure all possible CPUs'
> +	 * register data is processed while exporting the vmcore.
> +	 */
> +	fdh->cpu_mask = *cpu_possible_mask;

Looks good to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.

>  
>  	return addr;
>  }
> diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
> index 35f9cb602c30..617c0f3b1f4f 100644
> --- a/arch/powerpc/platforms/pseries/rtas-fadump.c
> +++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
> @@ -351,7 +351,7 @@ static int __init rtas_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
>  		/* Lower 4 bytes of reg_value contains logical cpu id */
>  		cpu = (be64_to_cpu(reg_entry->reg_value) &
>  		       RTAS_FADUMP_CPU_ID_MASK);
> -		if (fdh && !cpumask_test_cpu(cpu, &fdh->online_mask)) {
> +		if (fdh && !cpumask_test_cpu(cpu, &fdh->cpu_mask)) {
>  			RTAS_FADUMP_SKIP_TO_NEXT_CPU(reg_entry);
>  			continue;
>  		}
> -- 
> 2.35.1
> 

-- 
Mahesh J Salgaonkar
