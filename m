Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FF0229282
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 09:47:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBSGf4Kd1zDqrm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 17:47:06 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBS6S5GCszDqRv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 17:40:00 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M73tmX005571; Wed, 22 Jul 2020 03:39:47 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vth411-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 03:39:47 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M7SC2g084592;
 Wed, 22 Jul 2020 03:39:47 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1vth3yh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 03:39:47 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M7YtMe010650;
 Wed, 22 Jul 2020 07:39:44 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 32dbmn13k8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 07:39:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M7deNl43712668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 07:39:40 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22C80AE053;
 Wed, 22 Jul 2020 07:39:40 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B65E0AE04D;
 Wed, 22 Jul 2020 07:39:37 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Jul 2020 07:39:37 +0000 (GMT)
Date: Wed, 22 Jul 2020 13:09:36 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 06/10] powerpc/smp: Generalize 2nd sched domain
Message-ID: <20200722073936.GE9290@linux.vnet.ibm.com>
References: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
 <20200721113814.32284-7-srikar@linux.vnet.ibm.com>
 <20200722065640.GE31038@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200722065640.GE31038@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_03:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 adultscore=0 bulkscore=0 suspectscore=0 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220052
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

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-22 12:26:40]:

> Hello Srikar,
> 
> On Tue, Jul 21, 2020 at 05:08:10PM +0530, Srikar Dronamraju wrote:
> > Currently "CACHE" domain happens to be the 2nd sched domain as per
> > powerpc_topology. This domain will collapse if cpumask of l2-cache is
> > same as SMT domain. However we could generalize this domain such that it
> > could mean either be a "CACHE" domain or a "BIGCORE" domain.
> > 
> > While setting up the "CACHE" domain, check if shared_cache is already
> > set.
> > @@ -1339,14 +1345,20 @@ void start_secondary(void *unused)
> >  	/* Update topology CPU masks */
> >  	add_cpu_to_masks(cpu);
> > 
> > -	if (has_big_cores)
> > -		sibling_mask = cpu_smallcore_mask;
> >  	/*
> >  	 * Check for any shared caches. Note that this must be done on a
> >  	 * per-core basis because one core in the pair might be disabled.
> >  	 */
> > -	if (!cpumask_equal(cpu_l2_cache_mask(cpu), sibling_mask(cpu)))
> > -		shared_caches = true;
> > +	if (!shared_caches) {
> > +		struct cpumask *(*sibling_mask)(int) = cpu_sibling_mask;
> > +		struct cpumask *mask = cpu_l2_cache_mask(cpu);
> > +
> > +		if (has_big_cores)
> > +			sibling_mask = cpu_smallcore_mask;
> > +
> > +		if (cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu)))
> > +			shared_caches = true;
> 
> At the risk of repeating my comment to the v1 version of the patch, we
> have shared caches only l2_cache_mask(cpu) is a strict superset of
> sibling_mask(cpu).
> 
> "cpumask_weight(mask) > cpumask_weight(sibling_mask(cpu))" does not
> capture this.

Why would it not? We are setting shared_caches if and only if l2_cache_mask
is a strict superset of sibling/smallcore mask.

> Could we please use
> 
>       if (!cpumask_equal(sibling_mask(cpu), mask) &&
>       	  cpumask_subset(sibling_mask(cpu), mask) {
>       }
> 

Scheduler mandates that two cpumasks for the same CPU would either have to
be equal or one of them has to be a strict superset of the other. If not the
scheduler would mark our domains as broken. That being the case,
cpumask_weight will correctly capture what we are looking for. That said
your condition is also correct but slightly heavier and doesn't provide us
with any more information or correctness.

> 
> Otherwise the patch looks good to me.
> 
> --
> Thanks and Regards
> gautham.

-- 
Thanks and Regards
Srikar Dronamraju
