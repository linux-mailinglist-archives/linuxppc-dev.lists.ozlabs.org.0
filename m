Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A66017D106E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 15:22:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+nTgB+i;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBlck35BBz3dlT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Oct 2023 00:22:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+nTgB+i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBlbs5Sw2z3cNN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Oct 2023 00:21:45 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39KCu0RV022006;
	Fri, 20 Oct 2023 13:21:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=cn3A9D3vs6gY2tISNgTA79RuBjXE7FcJPQkABNQ9BwA=;
 b=G+nTgB+iePeMNdTHG/B8DIFgpa75BuZWtWWB52BX7C3opbouI4cq+SmHdQOjN6rSwXW9
 pUzRL5b7i+0EFU4CN7aFL2LKRRSWuNVlpNkD3odXBh12SQIJB6j5C3pFh6UqzO+a6PEr
 EbQx8sC6nf9PgWTIzyH+gU211stV2ri4kn0oAm3yn/S4BfTJGnoVFxSPhuHIRfo6edjh
 JGLMEsf5DnOcWGVj7QJ2kYQJybNVCuVu6FVOPAvd2R6dfiicIGzVmCQXoO3Zu6mJXcwd
 QsL+nPGnn7hM5xVgJspNQjUO9wE9IG16Kq/ezv7zkxz6vyJGKTmwLCWApAAECd1v0phz Tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tusyyh3sw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 13:21:22 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39KD48dD011989;
	Fri, 20 Oct 2023 13:21:17 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tusyyh3bn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 13:21:17 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39KC3cYV024191;
	Fri, 20 Oct 2023 13:21:11 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tuc294rwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 13:21:11 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39KDL9Wa9503376
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Oct 2023 13:21:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14C3C20043;
	Fri, 20 Oct 2023 13:21:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B435820040;
	Fri, 20 Oct 2023 13:21:06 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with SMTP;
	Fri, 20 Oct 2023 13:21:06 +0000 (GMT)
Date: Fri, 20 Oct 2023 18:51:05 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/smp: Dynamically build powerpc topology
Message-ID: <20231020132105.GN2194132@linux.vnet.ibm.com>
References: <20230830122614.73067-1-srikar@linux.vnet.ibm.com>
 <874jil5wa8.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <874jil5wa8.fsf@mail.lhotse>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7QUhefKdV8FgB4G3v769i-HgoQuO5-H9
X-Proofpoint-ORIG-GUID: wiPZSuxEnd9zgKljV5LUPxO-V1kNW2cZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_10,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310200108
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>, ndesaulniers@google.com, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Josh Poimboeuf <jpoimboe@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2023-10-20 23:10:55]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > Currently there are four powerpc specific sched topologies.  These are
> > all statically defined.  However not all these topologies are used by
> > all powerpc systems.
> >
> > To avoid unnecessary degenerations by the scheduler , masks and flags
> > are compared. However if the sched topologies are build dynamically then
> > the code is simpler and there are greater chances of avoiding
> > degenerations.
> >
> > Even x86 builds its sched topologies dynamically and new changes are
> > very similar to the way x86 is building its topologies.
> >
> > System Configuration
> > type=Shared mode=Uncapped smt=8 lcpu=128 mem=1063126592 kB cpus=96 ent=40.00
> >
> > $ lscpu
> > Architecture:                    ppc64le
> > Byte Order:                      Little Endian
> > CPU(s):                          1024
> > On-line CPU(s) list:             0-1023
> > Model name:                      POWER10 (architected), altivec supported
> > Model:                           2.0 (pvr 0080 0200)
> > Thread(s) per core:              8
> > Core(s) per socket:              32
> > Socket(s):                       4
> > Hypervisor vendor:               pHyp
> > Virtualization type:             para
> > L1d cache:                       8 MiB (256 instances)
> > L1i cache:                       12 MiB (256 instances)
> > NUMA node(s):                    4
> >
> > From dmesg of v6.5
> > [    0.174444] smp: Bringing up secondary CPUs ...
> > [    3.918535] smp: Brought up 4 nodes, 1024 CPUs
> > [   38.001402] sysrq: Changing Loglevel
> > [   38.001446] sysrq: Loglevel set to 9
> >
> > From dmesg of v6.5 + patch
> > [    0.174462] smp: Bringing up secondary CPUs ...
> > [    3.421462] smp: Brought up 4 nodes, 1024 CPUs
> > [   35.417917] sysrq: Changing Loglevel
> > [   35.417959] sysrq: Loglevel set to 9
> >
> > 5 runs of ppc64_cpu --smt=1 (time measured: lesser is better)
> > Kernel  N  Min     Max     Median  Avg      Stddev     %Change
> > v6.5    5  518.08  574.27  528.61  535.388  22.341542
> > +patch  5  481.73  495.47  484.21  486.402  5.7997     -9.14963
> >
> > 5 runs of ppc64_cpu --smt=8 (time measured: lesser is better)
> > Kernel  N  Min      Max      Median   Avg       Stddev     %Change
> > v6.5    5  1094.12  1117.1   1108.97  1106.3    8.606361
> > +patch  5  1067.5   1090.03  1073.89  1076.574  9.4189347  -2.68697
> >
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kernel/smp.c | 78 ++++++++++++++-------------------------
> >  1 file changed, 28 insertions(+), 50 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 48b8161179a8..c16443a04c26 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -92,15 +92,6 @@ EXPORT_PER_CPU_SYMBOL(cpu_l2_cache_map);
> >  EXPORT_PER_CPU_SYMBOL(cpu_core_map);
> >  EXPORT_SYMBOL_GPL(has_big_cores);
> >  
> > -enum {
> > -#ifdef CONFIG_SCHED_SMT
> > -	smt_idx,
> > -#endif
> > -	cache_idx,
> > -	mc_idx,
> > -	die_idx,
> > -};
> > -
> >  #define MAX_THREAD_LIST_SIZE	8
> >  #define THREAD_GROUP_SHARE_L1   1
> >  #define THREAD_GROUP_SHARE_L2_L3 2
> > @@ -1048,16 +1039,6 @@ static const struct cpumask *cpu_mc_mask(int cpu)
> >  	return cpu_coregroup_mask(cpu);
> >  }
> >  
> > -static struct sched_domain_topology_level powerpc_topology[] = {
> > -#ifdef CONFIG_SCHED_SMT
> > -	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
> > -#endif
> > -	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> > -	{ cpu_mc_mask, powerpc_shared_proc_flags, SD_INIT_NAME(MC) },
> > -	{ cpu_cpu_mask, powerpc_shared_proc_flags, SD_INIT_NAME(DIE) },
> > -	{ NULL, },
> > -};
> 
> This doesn't apply on my next or upstream.
> 
> It looks like it depends on your other 6-patch series. Please append
> this patch to that series.
> 
> cheers

Ok, will do the needful in the next iteration.

-- 
Thanks and Regards
Srikar Dronamraju
