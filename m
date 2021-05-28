Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA46393CAE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 07:22:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrtNK3hyTz307k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 15:22:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tl66sh/s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Tl66sh/s; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrtMm1cB9z2yRJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 15:21:39 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14S53P5d186076; Fri, 28 May 2021 01:21:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=2T0XzvV0pPf+MKmPLbiuR872pRn1L7YO1Df+f+WOp8s=;
 b=Tl66sh/syuwOYr/rf2XuZjv1zJXYlnIQC+Nr4hWXV+DpLSbrHasRyPSBvoRfDfGhbDK6
 5h6Gj6Mpvzui1ggem5uVtPK/Fo6tzYYZJOo79KjaTiYhaIdb8eLeH7gJ9AN8LU/c7Oai
 gSMmKtQx35DY5Owb+dzgldHJSFMrqsVSPJ5cTOHCsJ8q4xnA4qBTCAyIQH4SB1HJb5fE
 DoGTz/N9npsQ8EnBe2qTdzxqA/ANxN5/ERs/syjanEbvwS9++/ts8wrikT9WMpc/XTHb
 f3oCP7gZya0Pj57/8NZEJmqa44D+ULubG0hyJGWG58NAd3ph+jp+D5UUFoYnfljp7gaw fg== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38tse9gyve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 01:21:11 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 14S58pxl003148;
 Fri, 28 May 2021 05:21:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 38s1r49j41-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 May 2021 05:21:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14S5L6Dm33685844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 28 May 2021 05:21:06 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 483314C046;
 Fri, 28 May 2021 05:21:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ADDC84C044;
 Fri, 28 May 2021 05:21:03 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 28 May 2021 05:21:03 +0000 (GMT)
Date: Fri, 28 May 2021 10:51:03 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Valentin Schneider <valentin.schneider@arm.com>
Subject: Re: [PATCH 1/3] sched/topology: Allow archs to populate distance map
Message-ID: <20210528052103.GN2633526@linux.vnet.ibm.com>
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
X-Proofpoint-GUID: u7QPXlkhZCRvKSlvx5XFp9HLC8oENy07
X-Proofpoint-ORIG-GUID: u7QPXlkhZCRvKSlvx5XFp9HLC8oENy07
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-28_02:2021-05-27,
 2021-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=520 lowpriorityscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 adultscore=0 mlxscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2105280032
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

Peter, Valentin, Michael,

Can you please let me know which approach you would want me to follow.

Or do let me know any other alternative solutions that you would want me to
try.


-- 
Thanks and Regards
Srikar Dronamraju
