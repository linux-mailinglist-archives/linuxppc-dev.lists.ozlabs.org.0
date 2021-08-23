Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89E7C3F44CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 08:12:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtMN73bJRz2xrR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 16:12:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jrKrXmuI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jrKrXmuI; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtMMP1P2Nz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 16:11:45 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17N694iL036200; Mon, 23 Aug 2021 02:11:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=tMr0cLOBJmpyST74kslXklXXF5FGpx/HsHAfwTlKacc=;
 b=jrKrXmuIFXqvy2niTYA4Am2PaHlsPhapT0N7o71iCTg1ZaOpTppc7i8VsHj0VAy347Kz
 KLLk7RO785ZOqXf2Hu1sBQm23JylfnRfrcCcWADAAXcvhoTqiXaAa7MUTTRNAferCpT5
 q5ZfnSHfkwwE9waAwsAwBOFwO9cpTKX4e7iOxr+fofIjlud3gATL2xmWw0hYhCTpcEa5
 5xsg4SSBYTHjRSTbQAUyH+vOEc8ohS4aLhnBJhdw9yqbrnNVoKDGwyNnBrC5ugQ5LklF
 aUY99B2M5UC9s+9FtBpNqr3St9002quzYtkYp1ROkJ3+zUyLHQlPjp9i4JTDsf+McI4/ zg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3akefynaw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 02:11:29 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17N670To003381;
 Mon, 23 Aug 2021 06:11:28 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 3ajs4afru5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 06:11:28 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17N6BRqo52822450
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 06:11:27 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4622F13608F;
 Mon, 23 Aug 2021 06:11:27 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94B8D13606E;
 Mon, 23 Aug 2021 06:11:26 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.77.198.36])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 06:11:26 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E95262E318C; Mon, 23 Aug 2021 11:41:22 +0530 (IST)
Date: Mon, 23 Aug 2021 11:41:22 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Fix a crash while booting kvm guest
 with nr_cpus=2
Message-ID: <20210823061122.GC8104@in.ibm.com>
References: <20210821092419.167454-1-srikar@linux.vnet.ibm.com>
 <20210821092419.167454-2-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210821092419.167454-2-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gHyvwhrHSXONj5uopOT7Tyu7ZvHRM7u7
X-Proofpoint-GUID: gHyvwhrHSXONj5uopOT7Tyu7ZvHRM7u7
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_02:2021-08-20,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 clxscore=1011 phishscore=0 mlxscore=0 malwarescore=0
 bulkscore=0 spamscore=0 impostorscore=0 mlxlogscore=999 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230034
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 21, 2021 at 02:54:17PM +0530, Srikar Dronamraju wrote:
> Aneesh reported a crash with a fairly recent upstream kernel when
> booting kernel whose commandline was appended with nr_cpus=2
> 
> 1:mon> e
> cpu 0x1: Vector: 300 (Data Access) at [c000000008a67bd0]
>     pc: c00000000002557c: cpu_to_chip_id+0x3c/0x100
>     lr: c000000000058380: start_secondary+0x460/0xb00
>     sp: c000000008a67e70
>    msr: 8000000000001033
>    dar: 10
>  dsisr: 80000
>   current = 0xc00000000891bb00
>   paca    = 0xc0000018ff981f80   irqmask: 0x03   irq_happened: 0x01
>     pid   = 0, comm = swapper/1
> Linux version 5.13.0-rc3-15704-ga050a6d2b7e8 (kvaneesh@ltc-boston8) (gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34) #433 SMP Tue May 25 02:38:49 CDT 2021
> 1:mon> t
> [link register   ] c000000000058380 start_secondary+0x460/0xb00
> [c000000008a67e70] c000000008a67eb0 (unreliable)
> [c000000008a67eb0] c0000000000589d4 start_secondary+0xab4/0xb00
> [c000000008a67f90] c00000000000c654 start_secondary_prolog+0x10/0x14
> 
> Current code assumes that num_possible_cpus() is always greater than
> threads_per_core. However this may not be true when using nr_cpus=2 or
> similar options. Handle the case where num_possible_cpus is smaller than
> threads_per_core.
>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Valentin Schneider <valentin.schneider@arm.com>
> Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> Cc: Vincent Guittot <vincent.guittot@linaro.org>
> Fixes: c1e53367dab1 ("powerpc/smp: Cache CPU to chip lookup")
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Debugged-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 6c6e4d934d86..3d6874fe1937 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1074,7 +1074,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	}
> 
>  	if (cpu_to_chip_id(boot_cpuid) != -1) {
> -		int idx = num_possible_cpus() / threads_per_core;
> +		int idx = max((int)num_possible_cpus() / threads_per_core, 1);

I think this code was assuming that num_possible_cpus() is a multiple
of threads_per_core.

So, on a system with threads_per_core=8, if we pass nr_cpus=10, we
will still get idx=1. Thus, we will allocate only one entry in
chip_id_lookup_table[] even though there are two cores and
chip_id_lookup_table[] is expected to have one entry per core.

Is this a valid scenario ? If yes, should we use

   idx = DIV_ROUND_UP(num_possible_cpus, threads_per_core);

?

> 
>  		/*
>  		 * All threads of a core will all belong to the same core,
> -- 
> 2.18.2
> 

--
Thanks and Regards
gautham.
