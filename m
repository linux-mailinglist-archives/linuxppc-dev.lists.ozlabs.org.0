Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9520322EB11
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 13:20:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BFcmy5yMSzF1JL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jul 2020 21:20:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BFckx47cZzDr7K
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Jul 2020 21:19:05 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06RB2mlk096475; Mon, 27 Jul 2020 07:18:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hs8ggh65-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 07:18:52 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06RB5OBF105293;
 Mon, 27 Jul 2020 07:18:52 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32hs8ggh5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 07:18:52 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06RBElkY013652;
 Mon, 27 Jul 2020 11:18:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 32gcqk1a2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 27 Jul 2020 11:18:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06RBImR532702754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Jul 2020 11:18:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A7B25204F;
 Mon, 27 Jul 2020 11:18:48 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id 0489F5204E;
 Mon, 27 Jul 2020 11:18:45 +0000 (GMT)
Date: Mon, 27 Jul 2020 16:48:45 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 09/10] powerpc/smp: Create coregroup domain
Message-ID: <20200727111845.GA11819@linux.vnet.ibm.com>
References: <20200723085116.4731-1-srikar@linux.vnet.ibm.com>
 <20200723085116.4731-10-srikar@linux.vnet.ibm.com>
 <20200727043941.GA18303@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200727043941.GA18303@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-27_06:2020-07-27,
 2020-07-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 phishscore=0 spamscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007270078
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Peter Zijlstra <peterz@infradead.org>, LKML <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Jordan Niethe <jniethe5@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-27 10:09:41]:

> > 
> >  static void fixup_topology(void)
> >  {
> > +	if (!has_coregroup_support())
> > +		powerpc_topology[mc_idx].mask = cpu_bigcore_mask;
> > +
> >  	if (shared_caches) {
> >  		pr_info("Using shared cache scheduler topology\n");
> >  		powerpc_topology[bigcore_idx].mask = shared_cache_mask;
> 
> 
> Suppose we consider a topology which does not have coregroup_support,
> but has shared_caches. In that case, we would want our coregroup
> domain to degenerate.
> 
> From the above code, after the fixup, our topology will look as
> follows:
> 
> static struct sched_domain_topology_level powerpc_topology[] = {
>   	{ cpu_smt_mask, powerpc_smt_flags, SD_INIT_NAME(SMT) },
>  	{ shared_cache_mask, powerpc_shared_cache_flags, SD_INIT_NAME(CACHE) },
> 	{ cpu_bigcore_mask, SD_INIT_NAME(MC) },
>   	{ cpu_cpu_mask, SD_INIT_NAME(DIE) },
>   	{ NULL, },
> 
> So, in this case, the core-group domain (identified by MC) will
> degenerate only if cpu_bigcore_mask() and shared_cache_mask() return
> the same value. This may work for existing platforms, because either
> shared_caches don't exist, or when they do, cpu_bigcore_mask and
> shared_cache_mask return the same set of CPUs. But this may or may not
> continue to hold good in the future.
> 
> Furthermore, if that is always going to be the case that in the
> presence of shared_caches the cpu_bigcore_mask() and
> shared_cache_mask() will always be the same, then why even define two
> separate masks and not just have only the cpu_bigcore_mask() ?
> 

Your two statements are contradicting. In the former you are saying we
should be future proof and in the latter, you are asking for why add if they
are both going to be the same.

> The correct way would be to set the powerpc_topology[mc_idx].mask to
> powerpc_topology[bigcore_idx].mask *after* we have fixedup the
> big_core level.

The reason I modified it in v4 is not for degeneration or for future case
but for the current PowerNV/SMT 4 case. I could have as well detected the
the same and modified bigcore but thought fixup at one place would be
better.

-- 
Thanks and Regards
Srikar Dronamraju
