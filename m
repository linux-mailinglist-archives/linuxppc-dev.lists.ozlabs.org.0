Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 063243F47BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 11:39:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtRyg4vHNz2xtc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 19:39:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fU/S4EPd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fU/S4EPd; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtRxv3Ztqz2xY6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 19:38:27 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17N9Wjqv046664; Mon, 23 Aug 2021 05:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=C41CDRR+IOod7n2wO/cPqAiIx/E6EAuFd5Zv0iVZ5wY=;
 b=fU/S4EPdDJWjLQGgmeQMrTkE5eplFdCFpzv/cxL+mzyATc92S+7nOZ3knD9bbUdp7tZL
 Q0dqiSgN1nj2Ws198hQLLXUOsw0DXlUvSoqVAqfQFCuq/Jq2tTiqgVgryAz7kKSuQhGc
 sJacmRN7cafpE4P0DZxGNvIyYbuhbQaHb25f2hx5sxGEV0EBHX9cfQqtovh8dlktPAIE
 XvIFKSeGtMsS7x49QlPfPYKjtmBb1Z9gkThZPb23wyI3AtrAvxelDG8xeMy7tNiOIHEj
 6mcXrMJCwW/Zs8Egf3O8o22NEPw5YGzcSeSysiqpm7mN3roZqfr5h0eYv/w36mfLnR2b aw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3am6nkcbrn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 05:38:16 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17N9Xlfg017390;
 Mon, 23 Aug 2021 09:38:14 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 3ajs48jm5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 09:38:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17N9c8Qb30540100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 09:38:08 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED6C4AE067;
 Mon, 23 Aug 2021 09:38:07 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B06EAE058;
 Mon, 23 Aug 2021 09:38:03 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 Aug 2021 09:38:03 +0000 (GMT)
Date: Mon, 23 Aug 2021 15:08:01 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/numa: Print debug statements only when
 required
Message-ID: <20210823093801.GK21942@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <20210821102535.169643-2-srikar@linux.vnet.ibm.com>
 <b8bbc10b-5432-512f-5899-455302a59d01@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b8bbc10b-5432-512f-5899-455302a59d01@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RfJq5dcsuuGd4zBfJaLbcjvNlkfhfAm8
X-Proofpoint-ORIG-GUID: RfJq5dcsuuGd4zBfJaLbcjvNlkfhfAm8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_02:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=730 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230063
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
 Vincent Guittot <vincent.guittot@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Laurent Dufour <ldufour@linux.ibm.com> [2021-08-23 11:21:33]:

> Le 21/08/2021 à 12:25, Srikar Dronamraju a écrit :
> > Currently, a debug message gets printed every time an attempt to
> > add(remove) a CPU. However this is redundant if the CPU is already added
> > (removed) from the node.
> > 
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Ingo Molnar <mingo@kernel.org>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Valentin Schneider <valentin.schneider@arm.com>
> > Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> > Cc: Vincent Guittot <vincent.guittot@linaro.org>
> > Cc: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
> > Cc: Laurent Dufour <ldufour@linux.ibm.com>
> > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > ---
> >   arch/powerpc/mm/numa.c | 11 +++++------
> >   1 file changed, 5 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index f2bf98bdcea2..fbe03f6840e0 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -141,10 +141,11 @@ static void map_cpu_to_node(int cpu, int node)
> >   {
> >   	update_numa_cpu_lookup_table(cpu, node);
> > -	dbg("adding cpu %d to node %d\n", cpu, node);
> > -	if (!(cpumask_test_cpu(cpu, node_to_cpumask_map[node])))
> > +	if (!(cpumask_test_cpu(cpu, node_to_cpumask_map[node]))) {
> > +		dbg("adding cpu %d to node %d\n", cpu, node);
> >   		cpumask_set_cpu(cpu, node_to_cpumask_map[node]);
> > +	}
> >   }
> >   #if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_PPC_SPLPAR)
> > @@ -152,13 +153,11 @@ static void unmap_cpu_from_node(unsigned long cpu)
> >   {
> >   	int node = numa_cpu_lookup_table[cpu];
> > -	dbg("removing cpu %lu from node %d\n", cpu, node);
> > -
> >   	if (cpumask_test_cpu(cpu, node_to_cpumask_map[node])) {
> >   		cpumask_clear_cpu(cpu, node_to_cpumask_map[node]);
> > +		dbg("removing cpu %lu from node %d\n", cpu, node);
> >   	} else {
> > -		printk(KERN_ERR "WARNING: cpu %lu not found in node %d\n",
> > -		       cpu, node);
> > +		pr_err("WARNING: cpu %lu not found in node %d\n", cpu, node);
> 
> Would pr_warn() be more appropriate here (or removing the "WARNING" statement)?

Its a fair point.

Michael,

Do you want me to resend this patch with s/pr_err/pr_warn for the above
line?

> 
> >   	}
> >   }
> >   #endif /* CONFIG_HOTPLUG_CPU || CONFIG_PPC_SPLPAR */
> > 
> 

-- 
Thanks and Regards
Srikar Dronamraju
