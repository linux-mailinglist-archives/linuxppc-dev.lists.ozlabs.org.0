Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9277D39000F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 13:33:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FqBmL2nFfz3bpL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 21:33:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mPZQN5sE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mPZQN5sE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FqBlp3flQz2xxq
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 21:33:09 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14PBKDmZ073095; Tue, 25 May 2021 07:32:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=s1/zj6ef9I0bpZd/YmEsNN/sMhcN/MOLKnimD4nlf3Q=;
 b=mPZQN5sEuUQoMgr7L8ySJJyR8fdseYtKfyFnf4OkYuomyeQ/9j6v77WzySBi7qv2TmTl
 L2+TfsoYI4ZQHWvP7q/7M8UMRUQHTYk6Paj5Wj/MwnwAGGfHh5T1k31rs17diTlctgS7
 YnhVlr4rSTYvAq8EGA8cj2be+68zNmQFqmTL+kyUopZPCJpGn5U298wpLHBBiypvuRxt
 XJL8YFyF5Dwi52BsHunhWFfEH+1iYSlx80VqXRCvpmtawDiODs8+RBHx2QM77MgwOZVE
 Mw0+MmxJb9BlZGAl80IfG6Dv9C5GOrHOH0bPNa14AehdQWzbIqgcxdZXRuuarZ+faOyL tg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38s09ar97t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 07:32:43 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14PBWfO9000778;
 Tue, 25 May 2021 11:32:41 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 38psk88q2t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 25 May 2021 11:32:41 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14PBWcUK26804654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 May 2021 11:32:38 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DB3EA4051;
 Tue, 25 May 2021 11:32:38 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1E0EA4055;
 Tue, 25 May 2021 11:32:35 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 25 May 2021 11:32:35 +0000 (GMT)
Date: Tue, 25 May 2021 17:02:35 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH 1/3] sched/topology: Allow archs to populate distance map
Message-ID: <20210525113235.GM2633526@linux.vnet.ibm.com>
References: <20210520154427.1041031-1-srikar@linux.vnet.ibm.com>
 <20210520154427.1041031-2-srikar@linux.vnet.ibm.com>
 <YKaw33d71FpHjGnR@hirez.programming.kicks-ass.net>
 <20210521023802.GE2633526@linux.vnet.ibm.com>
 <YKdr0g6+eIHncqej@hirez.programming.kicks-ass.net>
 <20210521092830.GF2633526@linux.vnet.ibm.com>
 <87k0no6wuu.mognet@arm.com>
 <20210524161829.GL2633526@linux.vnet.ibm.com>
 <87h7irglm9.mognet@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87h7irglm9.mognet@arm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dybQQ2rD0jmumUhHrfuPx98MHCp42qZh
X-Proofpoint-ORIG-GUID: dybQQ2rD0jmumUhHrfuPx98MHCp42qZh
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-25_06:2021-05-25,
 2021-05-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=509 mlxscore=0 phishscore=0 spamscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105250070
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
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 Scott Cheloha <cheloha@linux.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Mel Gorman <mgorman@techsingularity.net>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Valentin Schneider <valentin.schneider@arm.com> [2021-05-25 11:21:02]:

> On 24/05/21 21:48, Srikar Dronamraju wrote:
> > * Valentin Schneider <valentin.schneider@arm.com> [2021-05-24 15:16:09]:
> >> Ok so from your arch you can figure out the *size* of the set of unique
> >> distances, but not the individual node_distance(a, b)... That's quite
> >> unfortunate.
> >
> > Yes, thats true.
> >
> >>
> >> I suppose one way to avoid the hook would be to write some "fake" distance
> >> values into your distance_lookup_table[] for offline nodes using your
> >> distance_ref_point_depth thing, i.e. ensure an iteration of
> >> node_distance(a, b) covers all distance values [1]. You can then keep patch
> >> 3 around, and that should roughly be it.
> >>
> >
> > Yes, this would suffice but to me its not very clean.
> > static int found[distance_ref_point_depth];
> >
> > for_each_node(node){
> >       int i, nd, distance = LOCAL_DISTANCE;
> >               goto out;
> >
> >       nd = node_distance(node, first_online_node)
> >       for (i=0; i < distance_ref_point_depth; i++, distance *= 2) {
> >               if (node_online) {
> >                       if (distance != nd)
> >                               continue;
> >                       found[i] ++;
> >                       break;
> >               }
> >               if (found[i])
> >                       continue;
> >               distance_lookup_table[node][i] = distance_lookup_table[first_online_node][i];
> >               found[i] ++;
> >               break;
> >       }
> > }
> >
> > But do note: We are setting a precedent for node distance between two nodes
> > to change.
> >
> 
> Indeed. AFAICT it's that or the unique-distance-values hook :/

Peter,

Please let me know which approach would you prefer.
I am open to try any other approach too.

In my humble opinion, unique-distance-values hook is more cleaner.
Do you still have any concerns with the unique-distance-values hook?

-- 
Thanks and Regards
Srikar Dronamraju
