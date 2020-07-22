Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 487BF22921D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:31:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBRwC27GKzDqg7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:31:07 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBRB63544zDqpC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 16:58:06 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M5Wcq8132660; Wed, 22 Jul 2020 02:57:58 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32dn0ywp1k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 02:57:58 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M6slhU154451;
 Wed, 22 Jul 2020 02:57:58 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32dn0ywp0w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 02:57:57 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M6psUe017812;
 Wed, 22 Jul 2020 06:57:55 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 32brbh4mhw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 06:57:55 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M6vp9N29360618
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 06:57:51 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2093AE058;
 Wed, 22 Jul 2020 06:57:50 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 797FAAE045;
 Wed, 22 Jul 2020 06:57:48 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Jul 2020 06:57:48 +0000 (GMT)
Date: Wed, 22 Jul 2020 12:27:47 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 05/10] powerpc/smp: Dont assume l2-cache to be
 superset of sibling
Message-ID: <20200722065747.GB9290@linux.vnet.ibm.com>
References: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
 <20200721113814.32284-6-srikar@linux.vnet.ibm.com>
 <20200722062114.GD31038@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200722062114.GD31038@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_02:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220040
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
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jordan Niethe <jniethe5@gmail.com>, Anton Blanchard <anton@au1.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Nick Piggin <npiggin@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-22 11:51:14]:

> Hi Srikar,
> 
> > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > index 72f16dc0cb26..57468877499a 100644
> > --- a/arch/powerpc/kernel/smp.c
> > +++ b/arch/powerpc/kernel/smp.c
> > @@ -1196,6 +1196,7 @@ static bool update_mask_by_l2(int cpu, struct cpumask *(*mask_fn)(int))
> >  	if (!l2_cache)
> >  		return false;
> > 
> > +	cpumask_set_cpu(cpu, mask_fn(cpu));
> 
> 
> Ok, we need to do this because "cpu" is not yet set in the
> cpu_online_mask. Prior to your patch the "cpu" was getting set in
> cpu_l2_cache_map(cpu) as a side-effect of the code that is removed in
> the patch.
> 

Right.

> 
> >  	for_each_cpu(i, cpu_online_mask) {
> >  		/*
> >  		 * when updating the marks the current CPU has not been marked
> > @@ -1278,29 +1279,30 @@ static void add_cpu_to_masks(int cpu)
> >  	 * add it to it's own thread sibling mask.
> >  	 */
> >  	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
> > +	cpumask_set_cpu(cpu, cpu_core_mask(cpu));

Note: Above, we are explicitly setting the cpu_core_mask.

> > 
> >  	for (i = first_thread; i < first_thread + threads_per_core; i++)
> >  		if (cpu_online(i))
> >  			set_cpus_related(i, cpu, cpu_sibling_mask);
> > 
> >  	add_cpu_to_smallcore_masks(cpu);
> > -	/*
> > -	 * Copy the thread sibling mask into the cache sibling mask
> > -	 * and mark any CPUs that share an L2 with this CPU.
> > -	 */
> > -	for_each_cpu(i, cpu_sibling_mask(cpu))
> > -		set_cpus_related(cpu, i, cpu_l2_cache_mask);
> >  	update_mask_by_l2(cpu, cpu_l2_cache_mask);
> > 
> > -	/*
> > -	 * Copy the cache sibling mask into core sibling mask and mark
> > -	 * any CPUs on the same chip as this CPU.
> > -	 */
> > -	for_each_cpu(i, cpu_l2_cache_mask(cpu))
> > -		set_cpus_related(cpu, i, cpu_core_mask);
> > +	if (pkg_id == -1) {
> 
> I suppose this "if" condition is an optimization, since if pkg_id != -1,
> we anyway set these CPUs in the cpu_core_mask below.
> 
> However...

This is not just an optimization.
The hunk removed would only work if cpu_l2_cache_mask is bigger than
cpu_sibling_mask. (this was the previous assumption that we want to break)
If the cpu_sibling_mask is bigger than cpu_l2_cache_mask and pkg_id is -1,
then setting only cpu_l2_cache_mask in cpu_core_mask will result in a broken 
topology.

> 
> > +		struct cpumask *(*mask)(int) = cpu_sibling_mask;
> > +
> > +		/*
> > +		 * Copy the sibling mask into core sibling mask and
> > +		 * mark any CPUs on the same chip as this CPU.
> > +		 */
> > +		if (shared_caches)
> > +			mask = cpu_l2_cache_mask;
> > +
> > +		for_each_cpu(i, mask(cpu))
> > +			set_cpus_related(cpu, i, cpu_core_mask);
> > 
> > -	if (pkg_id == -1)
> >  		return;
> > +	}
> 
> 
> ... since "cpu" is not yet set in the cpu_online_mask, do we not miss setting
> "cpu" in the cpu_core_mask(cpu) in the for-loop below ?
> 
> 

As noted above, we are setting before. So we don't missing the cpu and hence
have not different from before.

> --
> Thanks and Regards
> gautham.

-- 
Thanks and Regards
Srikar Dronamraju
