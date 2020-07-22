Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 10448229346
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 10:20:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBT0y1vxczDqy9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 18:20:18 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBSz53BRszDqx4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 18:18:40 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06M80vpm187314; Wed, 22 Jul 2020 04:18:33 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1wkskv5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 04:18:33 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06M82jhO194322;
 Wed, 22 Jul 2020 04:18:33 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32e1wksku5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 04:18:33 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06M8HNM2012010;
 Wed, 22 Jul 2020 08:18:31 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 32brbgtdu3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 08:18:30 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06M8IPLN61341790
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 08:18:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7E0511C05B;
 Wed, 22 Jul 2020 08:18:25 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B3AE11C071;
 Wed, 22 Jul 2020 08:18:23 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 22 Jul 2020 08:18:23 +0000 (GMT)
Date: Wed, 22 Jul 2020 13:48:22 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: peterz@infradead.org
Subject: Re: [PATCH v2 06/10] powerpc/smp: Generalize 2nd sched domain
Message-ID: <20200722081822.GG9290@linux.vnet.ibm.com>
References: <20200721113814.32284-1-srikar@linux.vnet.ibm.com>
 <20200721113814.32284-7-srikar@linux.vnet.ibm.com>
 <20200722074624.GP119549@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200722074624.GP119549@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_03:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 suspectscore=1 bulkscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220056
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
Cc: Ingo Molnar <mingo@kernel.org>, Nathan Lynch <nathanl@linux.ibm.com>,
 Oliver OHalloran <oliveroh@au1.ibm.com>, Michael Neuling <mikey@linux.ibm.com>,
 Michael Ellerman <michaele@au1.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Anton Blanchard <anton@au1.ibm.com>, LKML <linux-kernel@vger.kernel.org>,
 Valentin Schneider <valentin.schneider@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Nick Piggin <npiggin@au1.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* peterz@infradead.org <peterz@infradead.org> [2020-07-22 09:46:24]:

> On Tue, Jul 21, 2020 at 05:08:10PM +0530, Srikar Dronamraju wrote:
> > Currently "CACHE" domain happens to be the 2nd sched domain as per
> > powerpc_topology. This domain will collapse if cpumask of l2-cache is
> > same as SMT domain. However we could generalize this domain such that it
> > could mean either be a "CACHE" domain or a "BIGCORE" domain.
> 
> What's the whole smallcore vs bigcore thing?
> 
> Would it make sense to have an actual overview of the various topology
> layers somewhere? Because I'm getting lost and can't really make sense
> of the code due to that.

To quote with an example: using (Power 9)

Power 9 is an SMT 8 core by design. However this 8 thread core can run as 2
independent core with threads 0,2,4 and 6 acting like a core, while threads
1,3,5,7 acting as another core.  

The firmware can decide to showcase them as 2 independent small cores or as
one big core. However the LLC (i.e last level of cache) is shared between
all the threads of the SMT 8 core. Future power chips, LLC might change, it
may be expanded to share with another SMT 8 core or it could be made
specific to SMT 4 core.

The smt 8 core is also known as fused core/ Big core.
The smaller smt 4 core is known as small core.

So on a Power9 Baremetal, the firmware would show up as SMT4 core.
and we have a CACHE level at SMT 8. CACHE level would be very very similar
to MC domain in X86.

Hope this is clear.

-- 
Thanks and Regards
Srikar Dronamraju
