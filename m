Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 75027286119
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 16:21:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5xMl3y21zDqQG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 01:21:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fS9SxOvQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5xJM0tBHzDqMg
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 01:18:10 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097E3IZ3056193; Wed, 7 Oct 2020 10:17:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=XzlJD2xTfBxYv6yQMt7Rq7Tk08QSzOAgtJ/Dwv7KZz0=;
 b=fS9SxOvQlw/V0+d4k1UBgZrCTIdsWSfnaUY1F8mEEXIQcMLXcwYigfS0mmQSCjmQWH3n
 eVCYVUK3EiOL5RtlU2NtYdObvLykck325pmEMd35LnYTdOj1pxR6nkaQMrW5xWXTKHaU
 k9j15LGdAZoWwVl5GZHVhVTPW2t6l319oBquL8FqharcWzfY2W/t7YQhj7c63Kgq7NkN
 1DJsiduiLL8HbKuS8wr6fXIZalC5AGJTqcHDeMip6b9WBlfr/G294hQMloIEh/81y04S
 fT21wTFZ+WdWvjuTbjaePzN3fFqHuebua+osgV8Dbjd0y/nerIUbyEQjrfoHxZhKmkAp Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341efx1yfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 10:17:54 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 097E3qc1059017;
 Wed, 7 Oct 2020 10:17:53 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 341efx1ye0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 10:17:53 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097EDwnN011106;
 Wed, 7 Oct 2020 14:17:50 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 33xgx8cceh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 14:17:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097EHmSl32506216
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 14:17:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7342652050;
 Wed,  7 Oct 2020 14:17:48 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 1B04252054;
 Wed,  7 Oct 2020 14:17:45 +0000 (GMT)
Date: Wed, 7 Oct 2020 19:47:45 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Qian Cai <cai@redhat.com>
Subject: Re: [PATCH v2 09/11] powerpc/smp: Optimize update_mask_by_l2
Message-ID: <20201007141745.GM12031@linux.vnet.ibm.com>
References: <20200921095653.9701-1-srikar@linux.vnet.ibm.com>
 <20200921095653.9701-10-srikar@linux.vnet.ibm.com>
 <f848a6761de05d655d847130e77b23b2bb39aa26.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <f848a6761de05d655d847130e77b23b2bb39aa26.camel@redhat.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_09:2020-10-06,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1011
 mlxlogscore=999 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070089
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Oliver O'Halloran <oohall@gmail.com>,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Qian Cai <cai@redhat.com> [2020-10-07 09:05:42]:

Hi Qian,

Thanks for testing and reporting the failure.

> On Mon, 2020-09-21 at 15:26 +0530, Srikar Dronamraju wrote:
> > All threads of a SMT4 core can either be part of this CPU's l2-cache
> > mask or not related to this CPU l2-cache mask. Use this relation to
> > reduce the number of iterations needed to find all the CPUs that share
> > the same l2-cache.
> > 
> > Use a temporary mask to iterate through the CPUs that may share l2_cache
> > mask. Also instead of setting one CPU at a time into cpu_l2_cache_mask,
> > copy the SMT4/sub mask at one shot.
> > 
> ...
> >  static bool update_mask_by_l2(int cpu)
> >  {
> > +	struct cpumask *(*submask_fn)(int) = cpu_sibling_mask;
> >  	struct device_node *l2_cache, *np;
> > +	cpumask_var_t mask;
> >  	int i;
> >  
> >  	l2_cache = cpu_to_l2cache(cpu);
> > @@ -1240,22 +1264,37 @@ static bool update_mask_by_l2(int cpu)
> >  		return false;
> >  	}
> >  
> > -	cpumask_set_cpu(cpu, cpu_l2_cache_mask(cpu));
> > -	for_each_cpu_and(i, cpu_online_mask, cpu_cpu_mask(cpu)) {
> > +	alloc_cpumask_var_node(&mask, GFP_KERNEL, cpu_to_node(cpu));
> 
> Shouldn't this be GFP_ATOMIC? Otherwise, during the CPU hotplugging, we have,

Can you confirm if CONFIG_CPUMASK_OFFSTACK is enabled in your config?
Because if !CONFIG_CPUMASK_OFFSTACK, then alloc_cpumask_var_node would do
nothing but return true.

Regarding CONFIG_CPUMASK_OFFSTACK, not sure how much powerpc was tested
with that config enabled.

Please refer to
http://lore.kernel.org/lkml/87o8nv51bg.fsf@mpe.ellerman.id.au/t/#u
And we do have an issue to track the same.
https://github.com/linuxppc/issues/issues/321 for enabling/ testing /
verifying if CONFIG_CPUMASK_OFFSTACK works. I also dont see any
powerpc kconfig enabling this.

I do agree with your suggestion that we could substitute
GFP_ATOMIC/GFP_KERNEL.

> 
> (irqs were disabled in do_idle())
> 
> [  335.420001][    T0] BUG: sleeping function called from invalid context at mm/slab.h:494
> [  335.420003][    T0] in_atomic(): 1, irqs_disabled(): 1, non_block: 0, pid: 0, name: swapper/88
> [  335.420005][    T0] no locks held by swapper/88/0.
> [  335.420007][    T0] irq event stamp: 18074448
> [  335.420015][    T0] hardirqs last  enabled at (18074447): [<c0000000001a2a7c>] tick_nohz_idle_enter+0x9c/0x110
> [  335.420019][    T0] hardirqs last disabled at (18074448): [<c000000000106798>] do_idle+0x138/0x3b0
> do_idle at kernel/sched/idle.c:253 (discriminator 1)
> [  335.420023][    T0] softirqs last  enabled at (18074440): [<c0000000000bbec4>] irq_enter_rcu+0x94/0xa0
> [  335.420026][    T0] softirqs last disabled at (18074439): [<c0000000000bbea0>] irq_enter_rcu+0x70/0xa0
> [  335.420030][    T0] CPU: 88 PID: 0 Comm: swapper/88 Tainted: G        W         5.9.0-rc8-next-20201007 #1
> [  335.420032][    T0] Call Trace:
> [  335.420037][    T0] [c00020000a4bfcf0] [c000000000649e98] dump_stack+0xec/0x144 (unreliable)
> [  335.420043][    T0] [c00020000a4bfd30] [c0000000000f6c34] ___might_sleep+0x2f4/0x310
> [  335.420048][    T0] [c00020000a4bfdb0] [c000000000354f94] slab_pre_alloc_hook.constprop.82+0x124/0x190
> [  335.420051][    T0] [c00020000a4bfe00] [c00000000035e9e8] __kmalloc_node+0x88/0x3a0
> slab_alloc_node at mm/slub.c:2817
> (inlined by) __kmalloc_node at mm/slub.c:4013
> [  335.420054][    T0] [c00020000a4bfe80] [c0000000006494d8] alloc_cpumask_var_node+0x38/0x80
> kmalloc_node at include/linux/slab.h:577
> (inlined by) alloc_cpumask_var_node at lib/cpumask.c:116
> [  335.420060][    T0] [c00020000a4bfef0] [c00000000003eedc] start_secondary+0x27c/0x800
> update_mask_by_l2 at arch/powerpc/kernel/smp.c:1267
> (inlined by) add_cpu_to_masks at arch/powerpc/kernel/smp.c:1387
> (inlined by) start_secondary at arch/powerpc/kernel/smp.c:1420
> [  335.420063][    T0] [c00020000a4bff90] [c00000000000c468] start_secondary_resume+0x10/0x14
> 
> > +	cpumask_and(mask, cpu_online_mask, cpu_cpu_mask(cpu));
> > +
> > +	if (has_big_cores)
> > +		submask_fn = cpu_smallcore_mask;
> > +
> > +	/* Update l2-cache mask with all the CPUs that are part of submask */
> > +	or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
> > +
> > +	/* Skip all CPUs already part of current CPU l2-cache mask */
> > +	cpumask_andnot(mask, mask, cpu_l2_cache_mask(cpu));
> > +
> > +	for_each_cpu(i, mask) {
> >  		/*
> >  		 * when updating the marks the current CPU has not been marked
> >  		 * online, but we need to update the cache masks
> >  		 */
> >  		np = cpu_to_l2cache(i);
> > -		if (!np)
> > -			continue;
> >  
> > -		if (np == l2_cache)
> > -			set_cpus_related(cpu, i, cpu_l2_cache_mask);
> > +		/* Skip all CPUs already part of current CPU l2-cache */
> > +		if (np == l2_cache) {
> > +			or_cpumasks_related(cpu, i, submask_fn,
> > cpu_l2_cache_mask);
> > +			cpumask_andnot(mask, mask, submask_fn(i));
> > +		} else {
> > +			cpumask_andnot(mask, mask, cpu_l2_cache_mask(i));
> > +		}
> >  
> >  		of_node_put(np);
> >  	}
> >  	of_node_put(l2_cache);
> > +	free_cpumask_var(mask);
> >  
> >  	return true;
> >  }
> 

-- 
Thanks and Regards
Srikar Dronamraju
