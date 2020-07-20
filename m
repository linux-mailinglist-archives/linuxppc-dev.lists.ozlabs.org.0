Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 829B5225C9E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 12:28:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Hy84qjPzDqNy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 20:28:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9HvM0t21zDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 20:26:22 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06KA0wU6170154; Mon, 20 Jul 2020 06:26:16 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32bw8yyjcg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 06:26:15 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06KAQEo4003781;
 Mon, 20 Jul 2020 10:26:14 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 32brq819c4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 10:26:13 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06KAQ9SQ066006
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 10:26:09 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AB8F11C04A;
 Mon, 20 Jul 2020 10:26:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76CC611C054;
 Mon, 20 Jul 2020 10:26:07 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 20 Jul 2020 10:26:07 +0000 (GMT)
Date: Mon, 20 Jul 2020 15:56:06 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 10/11] powerpc/smp: Implement cpu_to_coregroup_id
Message-ID: <20200720102606.GH21103@linux.vnet.ibm.com>
References: <20200714043624.5648-1-srikar@linux.vnet.ibm.com>
 <20200714043624.5648-11-srikar@linux.vnet.ibm.com>
 <20200717082652.GF32531@in.ibm.com>
 <20200720054816.GA21103@linux.vnet.ibm.com>
 <20200720091025.GC6680@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200720091025.GC6680@in.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_05:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200071
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
 Michael Ellerman <michaele@au1.ibm.com>, Anton Blanchard <anton@au1.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-20 14:40:25]:

> Hi Srikar,
> 
> 
> On Mon, Jul 20, 2020 at 11:18:16AM +0530, Srikar Dronamraju wrote:
> > * Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-17 13:56:53]:
> > 
> > > On Tue, Jul 14, 2020 at 10:06:23AM +0530, Srikar Dronamraju wrote:
> > > > Lookup the coregroup id from the associativity array.
> > > > 
> > > > If unable to detect the coregroup id, fallback on the core id.
> > > > This way, ensure sched_domain degenerates and an extra sched domain is
> > > > not created.
> > > > 
> > > > Ideally this function should have been implemented in
> > > > arch/powerpc/kernel/smp.c. However if its implemented in mm/numa.c, we
> > > > don't need to find the primary domain again.
> > > > 
> > > > If the device-tree mentions more than one coregroup, then kernel
> > > > implements only the last or the smallest coregroup, which currently
> > > > corresponds to the penultimate domain in the device-tree.
> > > > 
> > > > Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
> > > > Cc: Michael Ellerman <michaele@au1.ibm.com>
> > > > Cc: Nick Piggin <npiggin@au1.ibm.com>
> > > > Cc: Oliver OHalloran <oliveroh@au1.ibm.com>
> > > > Cc: Nathan Lynch <nathanl@linux.ibm.com>
> > > > Cc: Michael Neuling <mikey@linux.ibm.com>
> > > > Cc: Anton Blanchard <anton@au1.ibm.com>
> > > > Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
> > > > Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
> > > > Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> > > > ---
> > > >  arch/powerpc/mm/numa.c | 17 +++++++++++++++++
> > > >  1 file changed, 17 insertions(+)
> > > > 
> > > > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > > > index d9ab9da85eab..4e85564ef62a 100644
> > > > --- a/arch/powerpc/mm/numa.c
> > > > +++ b/arch/powerpc/mm/numa.c
> > > > @@ -1697,6 +1697,23 @@ static const struct proc_ops topology_proc_ops = {
> > > > 
> > > >  int cpu_to_coregroup_id(int cpu)
> > > >  {
> > > > +	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
> > > > +	int index;
> > > > +
> > > 
> > > It would be good to have an assert here to ensure that we are calling
> > > this function only when coregroups are enabled.
> > > 
> > > Else, we may end up returning the penultimate index which maps to the
> > > chip-id.
> > > 
> > 
> > We have a check below exactly for the same reason. Please look
> below.
> 
> I saw that. However, it would be better to assert within the function
> so that we don't call it from any other context without ascertaining
> first that core_groups are enabled. Or at least a comment in the
> function saying that we should call this only after ascertaining that
> core_groups are enabled.
> 
> 

Okay, I can move the coregroup_enabled check above.

> 
> > 
> > > 
> > > 
> > > > +	if (cpu < 0 || cpu > nr_cpu_ids)
> > > > +		return -1;
> > > > +
> > > > +	if (!firmware_has_feature(FW_FEATURE_VPHN))
> > > > +		goto out;
> > > > +
> > > > +	if (vphn_get_associativity(cpu, associativity))
> > > > +		goto out;
> > > > +
> > > > +	index = of_read_number(associativity, 1);
> > > > +	if ((index > min_common_depth + 1) && coregroup_enabled)
> > > > +		return of_read_number(&associativity[index - 1], 1);
> > 
> > See ^above.
> > 
> > index would be the all the domains in the associativity array, 
> > min_common_depth would be where the primary domain or the chip-id is
> > defined. So we are reading the penultimate domain if and only if the
> > min_common_depth isn't the primary domain aka chip-id. 
> > 
> > What other check /assertions can we add?
> > 
> > 
> > > > +
> > > > +out:
> > > >  	return cpu_to_core_id(cpu);
> > > >  }
> > > > 
> > > > -- 
> > > > 2.17.1
> > > > 
> > 
> > -- 
> > Thanks and Regards
> > Srikar Dronamraju

-- 
Thanks and Regards
Srikar Dronamraju
