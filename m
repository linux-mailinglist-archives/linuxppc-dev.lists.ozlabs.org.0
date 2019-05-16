Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2616D20137
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 10:24:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Pbj1gCYzDqZp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 18:24:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ego@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454PZM4kvXzDqZP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 18:23:22 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4G8NDN6036445
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 04:23:18 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sh3egjaae-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 04:23:13 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ego@linux.vnet.ibm.com>;
 Thu, 16 May 2019 09:22:45 +0100
Received: from b03cxnp08025.gho.boulder.ibm.com (9.17.130.17)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 09:22:42 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4G8MffA15860102
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 08:22:41 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7016FBE053;
 Thu, 16 May 2019 08:22:41 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2731EBE054;
 Thu, 16 May 2019 08:22:41 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.248])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 08:22:41 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 2046C2E3894; Thu, 16 May 2019 13:52:38 +0530 (IST)
Date: Thu, 16 May 2019 13:52:38 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/1] Forced-wakeup for stop lite states on Powernv
References: <20190422063231.51043-1-huntbag@linux.vnet.ibm.com>
 <1557291178.ow4spjzq5t.astroid@bobo.none>
 <b2fcf69a-aecd-ea81-b497-737642354736@linux.vnet.ibm.com>
 <1557981860.eltms77ctp.astroid@bobo.none>
 <20190516053659.GA20396@in.ibm.com>
 <1557986956.6pmjz10b9z.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557986956.6pmjz10b9z.astroid@bobo.none>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
x-cbid: 19051608-0036-0000-0000-00000ABC3AF4
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011104; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01204051; UDB=6.00632055; IPR=6.00984981; 
 MB=3.00026913; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-16 08:22:45
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051608-0037-0000-0000-00004BD0A5B6
Message-Id: <20190516082238.GB20396@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160057
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
Cc: ego@linux.vnet.ibm.com, linux-pm@vger.kernel.org, daniel.lezcano@linaro.org,
 rjw@rjwysocki.net, linux-kernel@vger.kernel.org,
 Abhishek <huntbag@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nicholas,

On Thu, May 16, 2019 at 04:13:17PM +1000, Nicholas Piggin wrote:

> 
> > The motivation behind this patch was a HPC customer issue where they
> > were observing some CPUs in the core getting stuck at stop0_lite
> > state, thereby lowering the performance on the other CPUs of the core
> > which were running the application.
> > 
> > Disabling stop0_lite via sysfs didn't help since we would fallback to
> > snooze and it would make matters worse.
> 
> snooze has the timeout though, so it should kick into stop0 properly
> (and if it doesn't that's another issue that should be fixed in this
> series).
>
> I'm not questioning the patch for stop0_lite, to be clear. I think
> the logic is sound. I just raise one urelated issue that happens to
> be for stop0_lite as well (should we even enable it on P9?), and one
> peripheral issue (should we make a similar fix for deeper stop states?)
>

I think it makes sense to generalize this from the point of view of
CPUs remaining in shallower idle states for long durations on tickless
kernels.

> > 
> >> 
> >> We should always have fewer states unless proven otherwise.
> > 
> > I agree.
> > 
> >> 
> >> That said, we enable it today so I don't want to argue this point
> >> here, because it is a different issue from your patch.
> >> 
> >> > When it is in stop0 or deeper, 
> >> > it free up both
> >> > space and time slice of core.
> >> > In stop0_lite, cpu doesn't free up the core resources and thus inhibits 
> >> > thread
> >> > folding. When a cpu goes to stop0, it will free up the core resources 
> >> > thus increasing
> >> > the single thread performance of other sibling thread.
> >> > Hence, we do not want to get stuck in stop0_lite for long duration, and 
> >> > want to quickly
> >> > move onto the next state.
> >> > If we get stuck in any other state we would possibly be losing on to 
> >> > power saving,
> >> > but will still be able to gain the performance benefits for other 
> >> > sibling threads.
> >> 
> >> That's true, but stop0 -> deeper stop is also a benefit (for
> >> performance if we have some power/thermal constraints, and/or for power
> >> usage).
> >> 
> >> Sure it may not be so noticable as the SMT switch, but I just wonder
> >> if the infrastructure should be there for the same reason.
> >> 
> >> I was testing interrupt frequency on some tickless workloads configs,
> >> and without too much trouble you can get CPUs to sleep with no
> >> interrupts for many minutes. Hours even. We wouldn't want the CPU to
> >> stay in stop0 for that long.
> > 
> > If it stays in stop0 or even stop2 for that long, we would want to
> > "promote" it to a deeper state, such as say STOP5 which allows the
> > other cores to run at higher frequencies.
> 
> So we would want this same logic for all but the deepest runtime
> stop state?

Yes. We can, in steps, promote individual threads of the core to
eventually request a deeper state such as stop4/5. On a completely
idle tickless system, eventually we should see the core go to the
deeper idle state.

> 
> >> Just thinking about the patch itself, I wonder do you need a full
> >> kernel timer, or could we just set the decrementer? Is there much 
> >> performance cost here?
> >>
> > 
> > Good point. A decrementer would do actually.
> 
> That would be good if it does, might save a few cycles.
> 
> Thanks,
> Nick
>

--
Thanks and Regards
gautham.

