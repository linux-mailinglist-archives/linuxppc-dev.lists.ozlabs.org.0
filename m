Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5226C38BC78
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 04:39:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmW5S2Crdz3bsq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 12:39:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nwiXlLSy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nwiXlLSy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmW4v0W0Dz2yXh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 12:38:38 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L2XbPC158260; Thu, 20 May 2021 22:38:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=VV0qQE/UIutKW1sfmy/vjU7zx+44sTLjM4YLHXYmmB8=;
 b=nwiXlLSycnHdsXo0RBmbvobyEiUdEc0SqQwJFcVjF2Vv/p2Vb7Uv6KHcbQE+A5V8MQhu
 0wdWLTLxKYs3NFY24to+tbTqREyKPSHrBnHx4/3EiTna5v05G4AoDKedDKzkeqyNR2u+
 3hX99pg2aTb+rUPwlU3/2YUXShOZD5D4GBV8dyRR5tHIHuJRm6xtXesf956TCIfJKsTM
 blqIglLkKkOknC2OETrvIfg+IFiDXRo4GA4PHs7gIk74fiHB9b17m//DwL822OXQusrx
 ZsUFqcccUK5Nwper2ySJ3SrxpfnyqvGaG+f0wTs4yOxzG4fzBsrAfuMfdBIeilQfrgTX Ow== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38p0w5m1up-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 May 2021 22:38:11 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L2YcKb016200;
 Fri, 21 May 2021 02:38:09 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 38j5x8awjq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 02:38:08 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14L2bbJb16056596
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 02:37:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9E2CAE05F;
 Fri, 21 May 2021 02:38:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20A80AE051;
 Fri, 21 May 2021 02:38:03 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 21 May 2021 02:38:02 +0000 (GMT)
Date: Fri, 21 May 2021 08:08:02 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 1/3] sched/topology: Allow archs to populate distance map
Message-ID: <20210521023802.GE2633526@linux.vnet.ibm.com>
References: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
 <20210520154427.1041031-2-srikar@linux.vnet.ibm.com>
 <YKaw33d71FpHjGnR@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <YKaw33d71FpHjGnR@hirez.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tjmodyBbfyTl1_NqPVbfKfiukiHP2bQD
X-Proofpoint-GUID: tjmodyBbfyTl1_NqPVbfKfiukiHP2bQD
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-20_07:2021-05-20,
 2021-05-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 impostorscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105210017
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
 Vincent Guittot <vincent.guittot@linaro.org>, Rik van Riel <riel@surriel.com>,
 linuxppc-dev@lists.ozlabs.org, Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Peter Zijlstra <peterz@infradead.org> [2021-05-20 20:56:31]:

> On Thu, May 20, 2021 at 09:14:25PM +0530, Srikar Dronamraju wrote:
> > Currently scheduler populates the distance map by looking at distance
> > of each node from all other nodes. This should work for most
> > architectures and platforms.
> > 
> > However there are some architectures like POWER that may not expose
> > the distance of nodes that are not yet onlined because those resources
> > are not yet allocated to the OS instance. Such architectures have
> > other means to provide valid distance data for the current platform.
> > 
> > For example distance info from numactl from a fully populated 8 node
> > system at boot may look like this.
> > 
> > node distances:
> > node   0   1   2   3   4   5   6   7
> >   0:  10  20  40  40  40  40  40  40
> >   1:  20  10  40  40  40  40  40  40
> >   2:  40  40  10  20  40  40  40  40
> >   3:  40  40  20  10  40  40  40  40
> >   4:  40  40  40  40  10  20  40  40
> >   5:  40  40  40  40  20  10  40  40
> >   6:  40  40  40  40  40  40  10  20
> >   7:  40  40  40  40  40  40  20  10
> > 
> > However the same system when only two nodes are online at boot, then the
> > numa topology will look like
> > node distances:
> > node   0   1
> >   0:  10  20
> >   1:  20  10
> > 
> > It may be implementation dependent on what node_distance(0,3) where
> > node 0 is online and node 3 is offline. In POWER case, it returns
> > LOCAL_DISTANCE(10). Here at boot the scheduler would assume that the max
> > distance between nodes is 20. However that would not be true.
> > 
> > When Nodes are onlined and CPUs from those nodes are hotplugged,
> > the max node distance would be 40.
> > 
> > To handle such scenarios, let scheduler allow architectures to populate
> > the distance map. Architectures that like to populate the distance map
> > can overload arch_populate_distance_map().
> 
> Why? Why can't your node_distance() DTRT? The arch interface is
> nr_node_ids and node_distance(), I don't see why we need something new
> and then replace one special use of it.
> 
> By virtue of you being able to actually implement this new hook, you
> supposedly can actually do node_distance() right too.

Since for an offline node, arch interface code doesn't have the info.
As far as I know/understand, in POWER, unless there is an active memory or
CPU that's getting onlined, arch can't fetch the correct node distance.

Taking the above example: node 3 is offline, then node_distance of (3,X)
where X is anything other than 3, is not reliable. The moment node 3 is
onlined, the node distance is reliable.

This problem will not happen even on POWER if all the nodes have either
memory or CPUs active at the time of boot.

-- 
Thanks and Regards
Srikar Dronamraju
