Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF63FC30B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 09:10:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GzJGr684Rz2yLb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 17:09:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fK1iDvnl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fK1iDvnl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GzJG32DM8z2xsY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Aug 2021 17:09:14 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17V74L2G118641; Tue, 31 Aug 2021 03:08:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=+bIp3EjeGA1W2bAHX0kjOfjB7DQcWPAz7dF0IjEuQ44=;
 b=fK1iDvnldaQiuIVu8gLigr4MB+rnGLtsy2icNI2rHjyHnrw3RGw87yvePtOBrog0dbqN
 jYI3zfMGL7cMkSRKV3obaCRJGm6kWelpJH2KNcZ0DZf5O3/Zobt5M/2PhKCYutnhewme
 gcyq9csVMPHh8ZB3TsD7DVAg5yU1wuzFi99i7NsQUWYrTXkVLhxWsZUJvOdRPEDVPB71
 8qqSN3g0RQCxR2AWtjF5U8LDm3Kcaukw3owFlQgo1//TPe5BrJigm+pq8KJ6Ea4XAzcf
 cHzohX2+pIsPbQ8UsEpfHpMhqOcy3N5kZDLYqUalxb4J4/iV+mBH0vvKSpqd1feEkdlY Hg== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3asbatx93x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 03:08:53 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17V72U99014829;
 Tue, 31 Aug 2021 07:08:52 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 3aqcscq7cx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Aug 2021 07:08:52 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17V78pKc10093200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Aug 2021 07:08:51 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B730A112061;
 Tue, 31 Aug 2021 07:08:51 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70ADB11206B;
 Tue, 31 Aug 2021 07:08:48 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.43.60.127])
 by b01ledav004.gho.pok.ibm.com (Postfix) with SMTP;
 Tue, 31 Aug 2021 07:08:47 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id DD9A82E4149; Tue, 31 Aug 2021 12:38:41 +0530 (IST)
Date: Tue, 31 Aug 2021 12:38:41 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/smp: Fix a crash while booting kvm guest
 with nr_cpus=2
Message-ID: <20210831070841.GA19192@in.ibm.com>
References: <20210826100401.412519-1-srikar@linux.vnet.ibm.com>
 <20210826100401.412519-2-srikar@linux.vnet.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210826100401.412519-2-srikar@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QQfFoLiA3iOV2zqZclxdiuLjKiKS4PRb
X-Proofpoint-ORIG-GUID: QQfFoLiA3iOV2zqZclxdiuLjKiKS4PRb
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-31_03:2021-08-30,
 2021-08-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015
 malwarescore=0 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108310041
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

On Thu, Aug 26, 2021 at 03:33:59PM +0530, Srikar Dronamraju wrote:
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
> similar options. Handle the case where num_possible_cpus() is not an
> exact multiple of  threads_per_core.
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


This looks good to me.
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

> ---
> Changelog: v1 -> v2:
> v1: - https://lore.kernel.org/linuxppc-dev/20210821092419.167454-2-srikar@linux.vnet.ibm.com/t/#u
> Handled comment from Gautham Shenoy
> [ Updated to use DIV_ROUND_UP instead of max to handle more situations ]
> 
>  arch/powerpc/kernel/smp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index 6c6e4d934d86..bf11b3c4eb28 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -1074,7 +1074,7 @@ void __init smp_prepare_cpus(unsigned int max_cpus)
>  	}
> 
>  	if (cpu_to_chip_id(boot_cpuid) != -1) {
> -		int idx = num_possible_cpus() / threads_per_core;
> +		int idx = DIV_ROUND_UP(num_possible_cpus(), threads_per_core);
> 
>  		/*
>  		 * All threads of a core will all belong to the same core,
> -- 
> 2.18.2
> 
