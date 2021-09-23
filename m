Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 604804164BF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 19:59:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFjb82Kq3z307x
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 03:59:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GGGLVouL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GGGLVouL; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFjZR1yh1z2ybC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 03:58:22 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18NGdXI1006134; 
 Thu, 23 Sep 2021 13:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=SWVxwPnaelkeou14cAjDU29NThhI9hyXdh02kHUW0yg=;
 b=GGGLVouLoqAWGx8ajtrz3wCQ6BjdC+bPpdLCd7RktZWp/Ai37iIQ1I9sm96uSIl/5ZgB
 qxgqPmO110pKzgCtgst2n54/P+fKG/pskoOpV7ioBltRFPLusPW5Q0xi37W8Bu/pEQXi
 CpRC2wN8WWRzc6AlbaQMz++//HI9cH9f/zGl4eiAcrMnm24oPdnhKwLYLgUUrTEpqI7r
 p5ErIhd/F5bHb91Ke/A7QrijlggTPrGWZHEXLR/17mXlo3GJb/mevNwKvR4Yx/ewuleQ
 sUV3KhO53YmB96wp+aBYe/32Uk2lagWphJ6Xnr0SSGQsoFLQVHXcZ+XM2pNyHDwP0Fax qA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b8tyfwxn2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 13:57:58 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18NHpxdO027178;
 Thu, 23 Sep 2021 17:57:55 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 3b7q6p5fbc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Sep 2021 17:57:55 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 18NHr2vn56426900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Sep 2021 17:53:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29F7452057;
 Thu, 23 Sep 2021 17:57:52 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with SMTP id B47BF52051;
 Thu, 23 Sep 2021 17:57:49 +0000 (GMT)
Date: Thu, 23 Sep 2021 23:27:48 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 3/3] powerpc/numa: Fill distance_lookup_table for
 offline nodes
Message-ID: <20210923175748.GC2004@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <20210821102535.169643-4-srikar@linux.vnet.ibm.com>
 <875yvsba4q.fsf@mpe.ellerman.id.au>
 <20210901102206.GO21942@linux.vnet.ibm.com>
 <871r5fmth6.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <871r5fmth6.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5JY8y7u99MKS_AyEMDT_rC6XqBASvxsv
X-Proofpoint-ORIG-GUID: 5JY8y7u99MKS_AyEMDT_rC6XqBASvxsv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-23_05,2021-09-23_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 adultscore=0 clxscore=1015 malwarescore=0 mlxscore=0 suspectscore=0
 bulkscore=0 phishscore=0 priorityscore=1501 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109200000 definitions=main-2109230106
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
 kernel test robot <lkp@intel.com>, Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2021-09-23 21:17:25]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > * Michael Ellerman <mpe@ellerman.id.au> [2021-08-26 23:36:53]:
> >
> >> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> >> > Scheduler expects unique number of node distances to be available at
> >> > boot.
> ...
> >
> >> > Fake the offline node's distance_lookup_table entries so that all
> >> > possible node distances are updated.
> >>
> >> Does this work if we have a single node offline at boot?
> >>
> >
> > It should.
> >
> >> Say we start with:
> >>
> >> node distances:
> >> node   0   1
> >>   0:  10  20
> >>   1:  20  10
> >>
> >> And node 2 is offline at boot. We can only initialise that nodes entries
> >> in the distance_lookup_table:
> >>
> >> 		while (i--)
> >> 			distance_lookup_table[node][i] = node;
> >>
> >> By filling them all with 2 that causes node_distance(2, X) to return the
> >> maximum distance for all other nodes X, because we won't break out of
> >> the loop in __node_distance():
> >>
> >> 	for (i = 0; i < distance_ref_points_depth; i++) {
> >> 		if (distance_lookup_table[a][i] == distance_lookup_table[b][i])
> >> 			break;
> >>
> >> 		/* Double the distance for each NUMA level */
> >> 		distance *= 2;
> >> 	}
> >>
> >> If distance_ref_points_depth was 4 we'd return 160.
> >
> > As you already know, distance 10, 20, .. are defined by Powerpc, form1
> > affinity. PAPR doesn't define actual distances, it only provides us the
> > associativity. If there are distance_ref_points_depth is 4,
> > (distance_ref_points_depth doesn't take local distance into consideration)
> > 10, 20, 40, 80, 160.
> >
> >>
> >> That'd leave us with 3 unique distances at boot, 10, 20, 160.
> >>
> >
> > So if there are unique distances, then the distances as per the current
> > code has to be 10, 20, 40, 80.. I dont see a way in which we have a break in
> > the series. like having 160 without 80.
>
> I'm confused what you mean there.
>

At the outset, if we have a better probable solution, do let me know, I am
willing to try that too.

> If we have a node that's offline at boot then we get 160 for that node,
> that's just the result of having no info for it, so we never break out
> of the for loop.
>
> So if we have two nodes, one hop apart, and then an offline node we get
> 10, 20, 160.
>
> Or if you're using depth = 3 then it's 10, 20, 80.
>

My understanding is as below:

device-tree provides the max hops by way of
ibm,associativity-reference-points. This is mapped to
distance_ref_points_depth in Linux-powerpc.

Now Linux-powerpc encodes hops as (dis-regarding local distance) 20, 40, 80,
160, 320 ...
So if the distance_ref_points_depth is 3, then the hops are 20, 40, 80.

Do you disagree?


> >> But when node 2 comes online it might introduce more than 1 new distance
> >> value, eg. it could be that the actual distances are:
> >>
> >> node distances:
> >> node   0   1   2
> >>   0:  10  20  40
> >>   1:  20  10  80
> >>   2:  40  80  10
> >>
> >> ie. we now have 4 distances, 10, 20, 40, 80.
> >>
> >> What am I missing?
> >
> > As I said above, I am not sure how we can have a break in the series.
> > If distance_ref_points_depth is 3, the distances has to be 10,20,40,80 as
> > atleast for form1 affinity.
>
> I agree for depth 3 we have to see 10, 20, 40, 80. But nothing
> guarantees we see each value (other than 10).

The hop distances are not from the device-tree, the device-tree only gives
us the max hops possible. Linux-powerpc is actually hard-coding the
distances which each hop distance being 2x the previous.
So we may not see any nodes at a particular hop, but we know maximum hops.
And if distance_ref_points_depth is 3, then hops are 20, 40, 80 only.

>
> We can have two nodes one hop apart, so we have 10 and 20, then a third
> node is added 3 hops away, so we get 10, 20, 80.
>

> The real problem is that the third node could be 3 hops from node 0
> and 2 hops from node 1, and so the addition of the third node causes
> two new distance values (40 & 80) to be required.

So here the max hops as given by device-tree is 3. So we know that we are
looking for max-distance of 80 by way of distance_ref_points_depth.

Even if the 3rd node was at 4 hops, we would already know the max distance
of 160, by way of distance_ref_points_depth. However in the most unlikely
scenarios where the number of possible nodes are less than the
distance_ref_points_depth(aka max hops) + there are CPUless/memoryless nodes
we may not have initialized to the right distances.

>
> I think maybe what you're saying is that in practice we don't see setups
> like that. But I don't know if I'm happy with a solution that doesn't
> work in the general case, and relies on the particular properties of our
> current set of systems.
>

But our current set of systems are having a problem (Systems can likely
crash on adding a CPU to a node.)  The only other way I can think of is the
previous approach were we ask scheduler hook which tells how many unique
node distances are possible. But then it was stuck down because, we didnt
want to add a hook just for one arch.

However isn't this is much much better than the current situation we are in?
i.e This is not going to cause any regression for the other setups.

> Possibly we just need to detect that case and WARN about it. The only
> problem is we won't know until the system is already up and running, ie.
> we can't know at boot that the onlining of the third node will cause 2
> new distance values to be added.
>

Yes, We should be able to detect this very easily.
At the end of the function (v2 or v3) if cur_depth != max_depth then we
havent initialized all possible node distances.

> cheers

--
Thanks and Regards
Srikar Dronamraju
