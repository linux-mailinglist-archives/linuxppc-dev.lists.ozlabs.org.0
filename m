Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 292782D3160
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 18:44:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr6xt2QkZzDqk5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 04:44:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Lc94QAAG; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr6w00nwFzDqYC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 04:42:55 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8HcLHg056845; Tue, 8 Dec 2020 12:42:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=QLwqM6lUuCwkK7Rp8EwVSZRsKJ4/bLLbkqDznGsEu9g=;
 b=Lc94QAAGsKP5BpM22WwqgBScqanIKxAU1/GM7/3bOfqkZEFk96s9ju7RxmGGnF+htkSU
 CaoMPFSirF8vDhbP0FT6W8EZu86m6p+G3xSukIZJD8GZ25hKN9wxUBXomcmZNRrFbRtr
 iM/vWEFdWsSLnZW0YoWTChkREj7pZ+UoFHX5grZKeYAGV4TdIiPvJPy3NvP/xDEgj5hZ
 RYhhZO1WGyZDKS78/U8iRuMY5Ak0HHF1fIP+KEtPY+iNtVa6aZG/COk/jpLEUpAF0cqM
 3AE6CbZrE2caJP0JErXVJE0DRY4revVwusurEd+q8OzYPXGnH6TiZZUStmwAmsEqhlMb Og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a5t4ffck-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 12:42:45 -0500
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B8HcrLK061639;
 Tue, 8 Dec 2020 12:42:45 -0500
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35a5t4ffcc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 12:42:44 -0500
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8Hg5bL023565;
 Tue, 8 Dec 2020 17:42:44 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 3581u9qs80-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 17:42:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8Hggrw18809198
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 17:42:42 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BBF756A04D;
 Tue,  8 Dec 2020 17:42:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 573C56A047;
 Tue,  8 Dec 2020 17:42:42 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.199.54.209])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  8 Dec 2020 17:42:42 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E0C3C2E35A1; Tue,  8 Dec 2020 23:12:37 +0530 (IST)
Date: Tue, 8 Dec 2020 23:12:37 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/smp: Add support detecting thread-groups
 sharing L2 cache
Message-ID: <20201208174237.GB14206@in.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-3-git-send-email-ego@linux.vnet.ibm.com>
 <20201207124039.GI528281@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201207124039.GI528281@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_14:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 adultscore=0
 bulkscore=0 mlxscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080104
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
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Srikar,

On Mon, Dec 07, 2020 at 06:10:39PM +0530, Srikar Dronamraju wrote:
> * Gautham R. Shenoy <ego@linux.vnet.ibm.com> [2020-12-04 10:18:46]:
> 
> > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > 
> > On POWER systems, groups of threads within a core sharing the L2-cache
> > can be indicated by the "ibm,thread-groups" property array with the
> > identifier "2".
> > 
> > This patch adds support for detecting this, and when present, populate
> > the populating the cpu_l2_cache_mask of every CPU to the core-siblings
> > which share L2 with the CPU as specified in the by the
> > "ibm,thread-groups" property array.
> > 
> > On a platform with the following "ibm,thread-group" configuration
> > 		 00000001 00000002 00000004 00000000
> > 		 00000002 00000004 00000006 00000001
> > 		 00000003 00000005 00000007 00000002
> > 		 00000002 00000004 00000000 00000002
> > 		 00000004 00000006 00000001 00000003
> > 		 00000005 00000007
> > 
> > Without this patch, the sched-domain hierarchy for CPUs 0,1 would be
> > 	CPU0 attaching sched-domain(s):
> > 	domain-0: span=0,2,4,6 level=SMT
> > 	domain-1: span=0-7 level=CACHE
> > 	domain-2: span=0-15,24-39,48-55 level=MC
> > 	domain-3: span=0-55 level=DIE
> > 
> > 	CPU1 attaching sched-domain(s):
> > 	domain-0: span=1,3,5,7 level=SMT
> > 	domain-1: span=0-7 level=CACHE
> > 	domain-2: span=0-15,24-39,48-55 level=MC
> > 	domain-3: span=0-55 level=DIE
> > 
> > The CACHE domain at 0-7 is incorrect since the ibm,thread-groups
> > sub-array
> > [00000002 00000002 00000004
> >  00000000 00000002 00000004 00000006
> >  00000001 00000003 00000005 00000007]
> > indicates that L2 (Property "2") is shared only between the threads of a single
> > group. There are "2" groups of threads where each group contains "4"
> > threads each. The groups being {0,2,4,6} and {1,3,5,7}.
> > 
> > With this patch, the sched-domain hierarchy for CPUs 0,1 would be
> >      	CPU0 attaching sched-domain(s):
> > 	domain-0: span=0,2,4,6 level=SMT
> > 	domain-1: span=0-15,24-39,48-55 level=MC
> > 	domain-2: span=0-55 level=DIE
> > 
> > 	CPU1 attaching sched-domain(s):
> > 	domain-0: span=1,3,5,7 level=SMT
> > 	domain-1: span=0-15,24-39,48-55 level=MC
> > 	domain-2: span=0-55 level=DIE
> > 
> > The CACHE domain with span=0,2,4,6 for CPU 0 (span=1,3,5,7 for CPU 1
> > resp.) gets degenerated into the SMT domain. Furthermore, the
> > last-level-cache domain gets correctly set to the SMT sched-domain.
> > 
> > Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kernel/smp.c | 66 +++++++++++++++++++++++++++++++++++++++++------
> >  1 file changed, 58 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 6a242a3..a116d2d 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -76,6 +76,7 @@
> >  struct task_struct *secondary_current;
> >  bool has_big_cores;
> >  bool coregroup_enabled;
> > +bool thread_group_shares_l2;
> 
> Either keep this as static in this patch or add its declaration
>

This will be used in Patch 3 in kernel/cacheinfo.c, but not any other
place. Hence I am not making it static here.


> > 
> >  DEFINE_PER_CPU(cpumask_var_t, cpu_sibling_map);
> >  DEFINE_PER_CPU(cpumask_var_t, cpu_smallcore_map);
> > @@ -99,6 +100,7 @@ enum {
> > 
> >  #define MAX_THREAD_LIST_SIZE	8
> >  #define THREAD_GROUP_SHARE_L1   1
> > +#define THREAD_GROUP_SHARE_L2   2
> >  struct thread_groups {
> >  	unsigned int property;
> >  	unsigned int nr_groups;
> > @@ -107,7 +109,7 @@ struct thread_groups {
> >  };
> > 
> >  /* Maximum number of properties that groups of threads within a core can share */
> > -#define MAX_THREAD_GROUP_PROPERTIES 1
> > +#define MAX_THREAD_GROUP_PROPERTIES 2
> > 
> >  struct thread_groups_list {
> >  	unsigned int nr_properties;
> > @@ -121,6 +123,13 @@ struct thread_groups_list {
> >   */
> >  DEFINE_PER_CPU(cpumask_var_t, cpu_l1_cache_map);
> > 
> > +/*
> > + * On some big-cores system, thread_group_l2_cache_map for each CPU
> > + * corresponds to the set its siblings within the core that share the
> > + * L2-cache.
> > + */
> > +DEFINE_PER_CPU(cpumask_var_t, thread_group_l2_cache_map);
> > +
> 
> NIT:
> We are trying to confuse ourselves with the names.
> For L1 we have cpu_l2_cache_map to store the tasks from the thread group.
> but cpu_smallcore_map for keeping track of tasks.
>

I suppose you mean cpu_l1_cache_map here. We are using
cpu_smallcore_map, because when the ibm,thread-groups-property=1, it
shares both L1 and the instruction data flow (SMT). We already have a
cpu_smt_map, hence, this was named cpu_smallcore_map a couple of years
ago when I wrote that patch.


> For L2 we have thread_group_l2_cache_map to store the tasks from the thread
> group.  but cpu_l2_cache_map for keeping track of tasks.

> 
> I think we should do some renaming to keep the names consistent.
> I would say probably say move the current cpu_l2_cache_map to
> cpu_llc_cache_map and move the new aka  thread_group_l2_cache_map as
> cpu_l2_cache_map to be somewhat consistent.

Hmm.. cpu_llc_cache_map is still very generic. We want to have
something that defines l2 map.

I agree that we need to keep it consistent. How about renaming
cpu_l1_cache_map to thread_groups_l1_cache_map ?

That way thread_groups_l1_cache_map and thread_groups_l2_cache_map
refer to the corresponding L1 and L2 siblings as discovered from
ibm,thread-groups property.

We have the cpu_smallcore_mask and the cpu_l2_cache_map unchanged as
it was before.


> 
> >  /* SMP operations for this machine */
> >  struct smp_ops_t *smp_ops;
> > 
> > @@ -840,7 +851,8 @@ static int init_cpu_cache_map(int cpu, unsigned int cache_property)
> >  	if (!dn)
> >  		return -ENODATA;
> > 
> > -	if (!(cache_property == THREAD_GROUP_SHARE_L1))
> > +	if (!(cache_property == THREAD_GROUP_SHARE_L1 ||
> > +	      cache_property == THREAD_GROUP_SHARE_L2))
> >  		return -EINVAL;
> > 
> >  	if (!cpu_tgl->nr_properties) {
> > @@ -867,7 +879,10 @@ static int init_cpu_cache_map(int cpu, unsigned int cache_property)
> >  		goto out;
> >  	}
> > 
> > -	mask = &per_cpu(cpu_l1_cache_map, cpu);
> > +	if (cache_property == THREAD_GROUP_SHARE_L1)
> > +		mask = &per_cpu(cpu_l1_cache_map, cpu);
> > +	else if (cache_property == THREAD_GROUP_SHARE_L2)
> > +		mask = &per_cpu(thread_group_l2_cache_map, cpu);
> > 
> >  	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
> > 
> > @@ -973,6 +988,16 @@ static int init_big_cores(void)
> >  	}
> > 
> >  	has_big_cores = true;
> > +
> > +	for_each_possible_cpu(cpu) {
> > +		int err = init_cpu_cache_map(cpu, THREAD_GROUP_SHARE_L2);
> > +
> > +		if (err)
> > +			return err;
> > +	}
> > +
> > +	thread_group_shares_l2 = true;
> 
> Why do we need a separate loop. Why cant we merge this in the above loop
> itself?


No, there are platforms where one THREAD_GROUP_SHARE_L1 exists while
THREAD_GROUP_SHARE_L2 doesn't exist. It becomes easier if these are
separately tracked. Also, what do we gain if we put this in the same
loop? It will be (nr_possible_cpus * 2 * invocations of
init_cpu_cache_map()) as opposed to 2 * (nr_possible_cpus *
invocations of init_cpu_cache_map()). Isn't it ?




> 
> > +	pr_info("Thread-groups in a core share L2-cache\n");
> 
> Can this be moved to a pr_debug? Does it help any regular user/admins to
> know if thread-groups shared l2 cache. Infact it may confuse users on what
> thread groups are and which thread groups dont share cache.
> I would prefer some other name than thread_group_shares_l2 but dont know any
> better alternatives and may be my choices are even worse.

Would you be ok with "L2 cache shared by threads of the small core" ?


> 
> >  	return 0;
> >  }
> > 
> > @@ -1287,6 +1312,31 @@ static bool update_mask_by_l2(int cpu, cpumask_var_t *mask)
> >  	if (has_big_cores)
> >  		submask_fn = cpu_smallcore_mask;
> > 
> > +
> 
> NIT: extra blank line?

Will remove this. 
> 
> > +	/*
> > +	 * If the threads in a thread-group share L2 cache, then then
> > +	 * the L2-mask can be obtained from thread_group_l2_cache_map.
> > +	 */
> > +	if (thread_group_shares_l2) {
> > +		/* Siblings that share L1 is a subset of siblings that share L2.*/
> > +		or_cpumasks_related(cpu, cpu, submask_fn, cpu_l2_cache_mask);
> > +		if (*mask) {
> > +			cpumask_andnot(*mask,
> > +				       per_cpu(thread_group_l2_cache_map, cpu),
> > +				       cpu_l2_cache_mask(cpu));
> > +		} else {
> > +			mask = &per_cpu(thread_group_l2_cache_map, cpu);
> > +		}
> > +
> > +		for_each_cpu(i, *mask) {
> > +			if (!cpu_online(i))
> > +				continue;
> > +			set_cpus_related(i, cpu, cpu_l2_cache_mask);
> > +		}
> > +
> > +		return true;
> > +	}
> > +
> 
> Ah this can be simplified to:
> if (thread_group_shares_l2) {
> 	cpumask_set_cpu(cpu, cpu_l2_cache_mask(cpu));
> 
> 	for_each_cpu(i, per_cpu(thread_group_l2_cache_map, cpu)) {
> 		if (cpu_online(i))
> 			set_cpus_related(i, cpu, cpu_l2_cache_mask);
> 	}

Don't we want to enforce that the siblings sharing L1 be a subset of
the siblings sharing L2 ? Or do you recommend putting in a check for
that somewhere ?


> }
> 
> No?
> 
> >  	l2_cache = cpu_to_l2cache(cpu);
> >  	if (!l2_cache || !*mask) {
> >  		/* Assume only core siblings share cache with this CPU */
> 
> -- 
> Thanks and Regards
> Srikar Dronamraju
