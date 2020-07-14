Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01E6321E81F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 08:32:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5W0D2dGQzDqZp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:32:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5Vy76yxjzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 16:30:39 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06E61uSZ178758; Tue, 14 Jul 2020 02:30:32 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279k3wm1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 02:30:32 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06E62VP3185105;
 Tue, 14 Jul 2020 02:30:32 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3279k3wm10-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 02:30:32 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06E6K6kb019737;
 Tue, 14 Jul 2020 06:30:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04fra.de.ibm.com with ESMTP id 327527hgy4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 Jul 2020 06:30:29 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06E6UOPg66322730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Jul 2020 06:30:24 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A60D4C06F;
 Tue, 14 Jul 2020 06:30:24 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B06884C040;
 Tue, 14 Jul 2020 06:30:22 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 14 Jul 2020 06:30:22 +0000 (GMT)
Date: Tue, 14 Jul 2020 12:00:22 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 05/11] powerpc/smp: Dont assume l2-cache to be superset
 of sibling
Message-ID: <20200714063022.GC26776@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-6-srikar@linux.vnet.ibm.com>
 <CAOSf1CGmHuyiW_s6DgaNbBEzUhq0qsuQ0ODPYvH+X9je3VWxwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <CAOSf1CGmHuyiW_s6DgaNbBEzUhq0qsuQ0ODPYvH+X9je3VWxwA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-14_01:2020-07-13,
 2020-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 adultscore=0 mlxscore=0
 bulkscore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007140043
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Oliver O'Halloran <oohall@gmail.com> [2020-07-14 15:40:09]:

> On Tue, Jul 14, 2020 at 2:45 PM Srikar Dronamraju
> <srikar@linux.vnet.ibm.com> wrote:
> >
> > Current code assumes that cpumask of cpus sharing a l2-cache mask will
> > always be a superset of cpu_sibling_mask.
> >
> > Lets stop that assumption.
> 
> It's been a while since I looked, but I'm pretty sure the scheduler
> requires child domains to be subsets of their parents. Why is this
> necessary or a good idea?

Thanks for looking into the patches.

Yes the scheduler requires the child domains to be subsets of their parents.

Current code assumes that the l2_cache is always a superset of sibling mask.
However there may be processors in future whose sibling mask maynot be a
superset. 

Lets for example we have a chip with 16 threads and 8 threads share
l2-cache, i.e 8 threads are acting like a small core and 16 threads are
acting like a big core. Then the assumption that l2-cache mask is a superset
of cpu_sibling mask would be wrong.

> 
> > Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> > Cc: Michael Ellerman <michaele@au1.ibm.com>
> > Cc: Nick Piggin <npiggin@au1.ibm.com>
> > Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > Cc: Michael Neuling <mikey@linux.ibm.com>
> > Cc: Anton Blanchard <anton@au1.ibm.com>
> > Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> > Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> >  arch/powerpc/kernel/smp.c | 28 +++++++++++++++-------------
> >  1 file changed, 15 insertions(+), 13 deletions(-)
> >
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 7d430fc536cc..875f57e41355 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -1198,6 +1198,7 @@ static bool update_mask_by_l2(int cpu, struct cpumask *(*mask_fn)(int))
> >         struct device_node *l2_cache, *np;
> >         int i;
> >
> > +       cpumask_set_cpu(cpu, mask_fn(cpu));
> 
> ?

At the time the cpumasks are updated, the cpu is not yet part of the
cpu_online_mask. So when we online/offline the cpus, the masks will end up
not having itself and causes the scheduler to bork.

Previously (as we can note in code below thats removed), we were doing as
part of updating all cpus that were part of the cpu_sibling_mask before
calling update_mask_by_l2.

> 
> >         l2_cache = cpu_to_l2cache(cpu);
> >         if (!l2_cache)
> >                 return false;
> > @@ -1284,29 +1285,30 @@ static void add_cpu_to_masks(int cpu)
> >          * add it to it's own thread sibling mask.
> >          */
> >         cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
> > +       cpumask_set_cpu(cpu, cpu_core_mask(cpu));
> >
> >         for (i = first_thread; i < first_thread + threads_per_core; i++)
> >                 if (cpu_online(i))
> >                         set_cpus_related(i, cpu, cpu_sibling_mask);
> >
> >         add_cpu_to_smallcore_masks(cpu);
> > -       /*
> > -        * Copy the thread sibling mask into the cache sibling mask
> > -        * and mark any CPUs that share an L2 with this CPU.
> > -        */
> > -       for_each_cpu(i, cpu_sibling_mask(cpu))
> > -               set_cpus_related(cpu, i, cpu_l2_cache_mask);

I am referring to this code above. This would have updated the self in its
cpumask. For the rest of the cpus in the cpu_sibling_mask, they get updated
correctly in the update_mask_by_l2.

> >         update_mask_by_l2(cpu, cpu_l2_cache_mask);
> >
> > -       /*
> > -        * Copy the cache sibling mask into core sibling mask and mark
> > -        * any CPUs on the same chip as this CPU.
> > -        */

-- 
Thanks and Regards
Srikar Dronamraju
