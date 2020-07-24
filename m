Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D1022BEB5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 09:12:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCgPt4jmQzDrWW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:12:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCgMx6GmfzDq8F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 17:10:53 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06O71kuL160365; Fri, 24 Jul 2020 03:10:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32fsbkthpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 03:10:47 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06O71pJO160753;
 Fri, 24 Jul 2020 03:10:47 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32fsbkthnq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 03:10:47 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06O7AR35031722;
 Fri, 24 Jul 2020 07:10:46 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02dal.us.ibm.com with ESMTP id 32brqa76qb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 24 Jul 2020 07:10:46 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06O7AhjA56885688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 24 Jul 2020 07:10:43 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84FCD7805C;
 Fri, 24 Jul 2020 07:10:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4E88A7805E;
 Fri, 24 Jul 2020 07:10:42 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.93.226])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 24 Jul 2020 07:10:42 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id AD1F72E340E; Fri, 24 Jul 2020 12:40:38 +0530 (IST)
Date: Fri, 24 Jul 2020 12:40:38 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 05/10] powerpc/smp: Dont assume l2-cache to be
 superset of sibling
Message-ID: <20200724071038.GC21415@in.ibm.com>
References: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
 <20200721113814.32284-6-srikar@linux.vnet.ibm.com>
 <20200722062114.GD31038@in.ibm.com>
 <20200722065747.GB9290@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722065747.GB9290@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-24_01:2020-07-24,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0
 malwarescore=0 adultscore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2007240047
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
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>, Peter Zijlstra <peterz@infradead.org>,
 Jordan Niethe <jniethe5@gmail.com>, Anton Blanchard <anton@au1.ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Nick Piggin <npiggin@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 22, 2020 at 12:27:47PM +0530, Srikar Dronamraju wrote:
> * Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-22 11:51:14]:
> 
> > Hi Srikar,
> > 
> > > diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> > > index 72f16dc0cb26..57468877499a 100644
> > > --- a/arch/powerpc/kernel/smp.c
> > > +++ b/arch/powerpc/kernel/smp.c
> > > @@ -1196,6 +1196,7 @@ static bool update_mask_by_l2(int cpu, struct cpumask *(*mask_fn)(int))
> > >  	if (!l2_cache)
> > >  		return false;
> > > 
> > > +	cpumask_set_cpu(cpu, mask_fn(cpu));
> > 
> > 
> > Ok, we need to do this because "cpu" is not yet set in the
> > cpu_online_mask. Prior to your patch the "cpu" was getting set in
> > cpu_l2_cache_map(cpu) as a side-effect of the code that is removed in
> > the patch.
> > 
> 
> Right.
> 
> > 
> > >  	for_each_cpu(i, cpu_online_mask) {
> > >  		/*
> > >  		 * when updating the marks the current CPU has not been marked
> > > @@ -1278,29 +1279,30 @@ static void add_cpu_to_masks(int cpu)
> > >  	 * add it to it's own thread sibling mask.
> > >  	 */
> > >  	cpumask_set_cpu(cpu, cpu_sibling_mask(cpu));
> > > +	cpumask_set_cpu(cpu, cpu_core_mask(cpu));
> 
> Note: Above, we are explicitly setting the cpu_core_mask.

You are right. I missed this.

> 
> > > 
> > >  	for (i = first_thread; i < first_thread + threads_per_core; i++)
> > >  		if (cpu_online(i))
> > >  			set_cpus_related(i, cpu, cpu_sibling_mask);
> > > 
> > >  	add_cpu_to_smallcore_masks(cpu);
> > > -	/*
> > > -	 * Copy the thread sibling mask into the cache sibling mask
> > > -	 * and mark any CPUs that share an L2 with this CPU.
> > > -	 */
> > > -	for_each_cpu(i, cpu_sibling_mask(cpu))
> > > -		set_cpus_related(cpu, i, cpu_l2_cache_mask);
> > >  	update_mask_by_l2(cpu, cpu_l2_cache_mask);
> > > 
> > > -	/*
> > > -	 * Copy the cache sibling mask into core sibling mask and mark
> > > -	 * any CPUs on the same chip as this CPU.
> > > -	 */
> > > -	for_each_cpu(i, cpu_l2_cache_mask(cpu))
> > > -		set_cpus_related(cpu, i, cpu_core_mask);
> > > +	if (pkg_id == -1) {
> > 
> > I suppose this "if" condition is an optimization, since if pkg_id != -1,
> > we anyway set these CPUs in the cpu_core_mask below.
> > 
> > However...
> 
> This is not just an optimization.
> The hunk removed would only work if cpu_l2_cache_mask is bigger than
> cpu_sibling_mask. (this was the previous assumption that we want to break)
> If the cpu_sibling_mask is bigger than cpu_l2_cache_mask and pkg_id is -1,
> then setting only cpu_l2_cache_mask in cpu_core_mask will result in a broken 
> topology.
> 
> > 
> > > +		struct cpumask *(*mask)(int) = cpu_sibling_mask;
> > > +
> > > +		/*
> > > +		 * Copy the sibling mask into core sibling mask and
> > > +		 * mark any CPUs on the same chip as this CPU.
> > > +		 */
> > > +		if (shared_caches)
> > > +			mask = cpu_l2_cache_mask;
> > > +
> > > +		for_each_cpu(i, mask(cpu))
> > > +			set_cpus_related(cpu, i, cpu_core_mask);
> > > 
> > > -	if (pkg_id == -1)
> > >  		return;
> > > +	}
> > 
> > 
> > ... since "cpu" is not yet set in the cpu_online_mask, do we not miss setting
> > "cpu" in the cpu_core_mask(cpu) in the for-loop below ?
> > 
> > 
> 
> As noted above, we are setting before. So we don't missing the cpu and hence
> have not different from before.


Fair enough.

> 
> > --
> > Thanks and Regards
> > gautham.
> 
> -- 
> Thanks and Regards
> Srikar Dronamraju
