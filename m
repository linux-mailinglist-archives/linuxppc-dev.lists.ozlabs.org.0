Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A5B1FED4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 07:38:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454Kw20Ry0zDqbG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 15:38:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ego@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454Ktb0BQWzDqXM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 15:37:10 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4G5XVve035318
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 01:37:07 -0400
Received: from e14.ny.us.ibm.com (e14.ny.us.ibm.com [129.33.205.204])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sgxr5xmhm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 01:37:06 -0400
Received: from localhost
 by e14.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ego@linux.vnet.ibm.com>;
 Thu, 16 May 2019 06:37:06 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e14.ny.us.ibm.com (146.89.104.201) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 16 May 2019 06:37:03 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4G5b2nj27983958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 May 2019 05:37:02 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3076C124054;
 Thu, 16 May 2019 05:37:02 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D83B1124055;
 Thu, 16 May 2019 05:37:01 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.248])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 16 May 2019 05:37:01 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 328F02E2EB4; Thu, 16 May 2019 11:06:59 +0530 (IST)
Date: Thu, 16 May 2019 11:06:59 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 0/1] Forced-wakeup for stop lite states on Powernv
References: <20190422063231.51043-1-huntbag@linux.vnet.ibm.com>
 <1557291178.ow4spjzq5t.astroid@bobo.none>
 <b2fcf69a-aecd-ea81-b497-737642354736@linux.vnet.ibm.com>
 <1557981860.eltms77ctp.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557981860.eltms77ctp.astroid@bobo.none>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
x-cbid: 19051605-0052-0000-0000-000003C00920
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011104; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203996; UDB=6.00632022; IPR=6.00984926; 
 MB=3.00026912; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-16 05:37:05
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051605-0053-0000-0000-000060EA1B78
Message-Id: <20190516053659.GA20396@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-16_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905160039
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

Hello Nicholas,


On Thu, May 16, 2019 at 02:55:42PM +1000, Nicholas Piggin wrote:
> Abhishek's on May 13, 2019 7:49 pm:
> > On 05/08/2019 10:29 AM, Nicholas Piggin wrote:
> >> Abhishek Goel's on April 22, 2019 4:32 pm:
> >>> Currently, the cpuidle governors determine what idle state a idling CPU
> >>> should enter into based on heuristics that depend on the idle history on
> >>> that CPU. Given that no predictive heuristic is perfect, there are cases
> >>> where the governor predicts a shallow idle state, hoping that the CPU will
> >>> be busy soon. However, if no new workload is scheduled on that CPU in the
> >>> near future, the CPU will end up in the shallow state.
> >>>
> >>> Motivation
> >>> ----------
> >>> In case of POWER, this is problematic, when the predicted state in the
> >>> aforementioned scenario is a lite stop state, as such lite states will
> >>> inhibit SMT folding, thereby depriving the other threads in the core from
> >>> using the core resources.
> >>>
> >>> So we do not want to get stucked in such states for longer duration. To
> >>> address this, the cpuidle-core can queue timer to correspond with the
> >>> residency value of the next available state. This timer will forcefully
> >>> wakeup the cpu. Few such iterations will essentially train the governor to
> >>> select a deeper state for that cpu, as the timer here corresponds to the
> >>> next available cpuidle state residency. Cpu will be kicked out of the lite
> >>> state and end up in a non-lite state.
> >>>
> >>> Experiment
> >>> ----------
> >>> I performed experiments for three scenarios to collect some data.
> >>>
> >>> case 1 :
> >>> Without this patch and without tick retained, i.e. in a upstream kernel,
> >>> It would spend more than even a second to get out of stop0_lite.
> >>>
> >>> case 2 : With tick retained in a upstream kernel -
> >>>
> >>> Generally, we have a sched tick at 4ms(CONF_HZ = 250). Ideally I expected
> >>> it to take 8 sched tick to get out of stop0_lite. Experimentally,
> >>> observation was
> >>>
> >>> =========================================================
> >>> sample          min            max           99percentile
> >>> 20              4ms            12ms          4ms
> >>> =========================================================
> >>>
> >>> It would take atleast one sched tick to get out of stop0_lite.
> >>>
> >>> case 2 :  With this patch (not stopping tick, but explicitly queuing a
> >>>            timer)
> >>>
> >>> ============================================================
> >>> sample          min             max             99percentile
> >>> ============================================================
> >>> 20              144us           192us           144us
> >>> ============================================================
> >>>
> >>> In this patch, we queue a timer just before entering into a stop0_lite
> >>> state. The timer fires at (residency of next available state + exit latency
> >>> of next available state * 2). Let's say if next state(stop0) is available
> >>> which has residency of 20us, it should get out in as low as (20+2*2)*8
> >>> [Based on the forumla (residency + 2xlatency)*history length] microseconds
> >>> = 192us. Ideally we would expect 8 iterations, it was observed to get out
> >>> in 6-7 iterations. Even if let's say stop2 is next available state(stop0
> >>> and stop1 both are unavailable), it would take (100+2*10)*8 = 960us to get
> >>> into stop2.
> >>>
> >>> So, We are able to get out of stop0_lite generally in 150us(with this
> >>> patch) as compared to 4ms(with tick retained). As stated earlier, we do not
> >>> want to get stuck into stop0_lite as it inhibits SMT folding for other
> >>> sibling threads, depriving them of core resources. Current patch is using
> >>> forced-wakeup only for stop0_lite, as it gives performance benefit(primary
> >>> reason) along with lowering down power consumption. We may extend this
> >>> model for other states in future.
> >> I still have to wonder, between our snooze loop and stop0, what does
> >> stop0_lite buy us.
> >>
> >> That said, the problem you're solving here is a generic one that all
> >> stop states have, I think. Doesn't the same thing apply going from
> >> stop0 to stop5? You might under estimate the sleep time and lose power
> >> savings and therefore performance there too. Shouldn't we make it
> >> generic for all stop states?
> >>
> >> Thanks,
> >> Nick
> >>
> >>
> > When a cpu is in snooze, it takes both space and time of core. When in 
> > stop0_lite,
> > it free up time but it still takes space.
> 
> True, but snooze should only be taking less than 1% of front end
> cycles. I appreciate there is some non-zero difference here, I just
> wonder in practice what exactly we gain by it.

The idea behind implementing a lite-state was that on the future
platforms it can be made to wait on a flag and hence act as a
replacement for snooze. On POWER9 we don't have this feature.

The motivation behind this patch was a HPC customer issue where they
were observing some CPUs in the core getting stuck at stop0_lite
state, thereby lowering the performance on the other CPUs of the core
which were running the application.

Disabling stop0_lite via sysfs didn't help since we would fallback to
snooze and it would make matters worse.

> 
> We should always have fewer states unless proven otherwise.

I agree.

> 
> That said, we enable it today so I don't want to argue this point
> here, because it is a different issue from your patch.
> 
> > When it is in stop0 or deeper, 
> > it free up both
> > space and time slice of core.
> > In stop0_lite, cpu doesn't free up the core resources and thus inhibits 
> > thread
> > folding. When a cpu goes to stop0, it will free up the core resources 
> > thus increasing
> > the single thread performance of other sibling thread.
> > Hence, we do not want to get stuck in stop0_lite for long duration, and 
> > want to quickly
> > move onto the next state.
> > If we get stuck in any other state we would possibly be losing on to 
> > power saving,
> > but will still be able to gain the performance benefits for other 
> > sibling threads.
> 
> That's true, but stop0 -> deeper stop is also a benefit (for
> performance if we have some power/thermal constraints, and/or for power
> usage).
> 
> Sure it may not be so noticable as the SMT switch, but I just wonder
> if the infrastructure should be there for the same reason.
> 
> I was testing interrupt frequency on some tickless workloads configs,
> and without too much trouble you can get CPUs to sleep with no
> interrupts for many minutes. Hours even. We wouldn't want the CPU to
> stay in stop0 for that long.

If it stays in stop0 or even stop2 for that long, we would want to
"promote" it to a deeper state, such as say STOP5 which allows the
other cores to run at higher frequencies.

> 
> Just thinking about the patch itself, I wonder do you need a full
> kernel timer, or could we just set the decrementer? Is there much 
> performance cost here?
>

Good point. A decrementer would do actually.

> Thanks,
> Nick

--
Thanks and Regards
gautham.

