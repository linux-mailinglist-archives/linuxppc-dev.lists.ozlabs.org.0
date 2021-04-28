Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2E36D1E8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 07:59:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FVSdF21bwz302B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Apr 2021 15:59:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NIHNvoz/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NIHNvoz/; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FVScn0Lf9z2xyC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Apr 2021 15:59:04 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13S5Y57l019493; Wed, 28 Apr 2021 01:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : content-transfer-encoding : mime-version; s=pp1;
 bh=1epskh1yZhSPlXn2sWqxFpCL/rsmOoJWMRrmoNh9iZc=;
 b=NIHNvoz/GtMuek8cgypHq5SakXHlxU7+ljhD2sfxIwtJROZy7P7XFN1yfEe1ZqJL8k0p
 cBEhu3tiXIjQ2FGFUaJ+i+Ml2NTtVBg/KwnjM02UJAH2DQfQGOxYqcjFxfS1vpWhsaSl
 zIuVjrkXPYfATmpar2QcJu6CdKMSGVsvyN4OP80st2G2BZU0JRuxAPWogArmfFnkvamp
 8GwojIRCA8pKTVo8YjHAvEYY5oUPdIsJl0SrmpGbfP0lTQezBOAxfJ3bizcRxBoIYdet
 5sZF58H0QzV8d/vzzXRibZbE5IzS4iZV3Ae6xXgtb66FliRSxO26mN0pTJSc57vX7ea2 vQ== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386yn1k57k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 01:58:55 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13S5vL76019583;
 Wed, 28 Apr 2021 05:58:55 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma05wdc.us.ibm.com with ESMTP id 384ay9jqtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 05:58:54 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13S5wrPn28180988
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 05:58:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4570AC05E;
 Wed, 28 Apr 2021 05:58:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1973BAC05F;
 Wed, 28 Apr 2021 05:58:53 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.102.18.39])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 28 Apr 2021 05:58:53 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 837802E2E70; Wed, 28 Apr 2021 11:28:48 +0530 (IST)
Date: Wed, 28 Apr 2021 11:28:48 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
Subject: Re: [PATCH] cpuidle/pseries: Fixup CEDE0 latency only for POWER10
 onwards
Message-ID: <20210428055848.GA6675@in.ibm.com>
References: <1619104049-5118-1-git-send-email-ego@linux.vnet.ibm.com>
 <20210423073551.GZ6564@kitsune.suse.cz>
 <YILu6/GK+RwpskCc@drishya.in.ibm.com>
 <20210423174505.GE6564@kitsune.suse.cz>
 <YIMSCjTzcSwjQtRi@drishya.in.ibm.com>
 <20210423184216.GG6564@kitsune.suse.cz>
 <YIPKrIb+tY39taZv@drishya.in.ibm.com>
 <20210425110714.GH6564@kitsune.suse.cz>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20210425110714.GH6564@kitsune.suse.cz>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: O8KGj_Dj5gIkPuFiCHLDSlw3jMSJCNKv
X-Proofpoint-ORIG-GUID: O8KGj_Dj5gIkPuFiCHLDSlw3jMSJCNKv
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_03:2021-04-27,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 impostorscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104280035
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linux-pm@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, joedecke@de.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michal,

On Sun, Apr 25, 2021 at 01:07:14PM +0200, Michal Suchánek wrote:
> On Sat, Apr 24, 2021 at 01:07:16PM +0530, Vaidyanathan Srinivasan wrote:
> > * Michal Such?nek <msuchanek@suse.de> [2021-04-23 20:42:16]:
> > 
> > > On Fri, Apr 23, 2021 at 11:59:30PM +0530, Vaidyanathan Srinivasan wrote:
> > > > * Michal Such?nek <msuchanek@suse.de> [2021-04-23 19:45:05]:
> > > > 
> > > > > On Fri, Apr 23, 2021 at 09:29:39PM +0530, Vaidyanathan Srinivasan wrote:
> > > > > > * Michal Such?nek <msuchanek@suse.de> [2021-04-23 09:35:51]:
> > > > > > 
> > > > > > > On Thu, Apr 22, 2021 at 08:37:29PM +0530, Gautham R. Shenoy wrote:
> > > > > > > > From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> > > > > > > > 
> > > > > > > > Commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> > > > > > > > CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
> > > > > > > > of the Extended CEDE states advertised by the platform
> > > > > > > > 
> > > > > > > > On some of the POWER9 LPARs, the older firmwares advertise a very low
> > > > > > > > value of 2us for CEDE1 exit latency on a Dedicated LPAR. However the
> > > > > > > Can you be more specific about 'older firmwares'?
> > > > > > 
> > > > > > Hi Michal,
> > > > > > 
> > > > > > This is POWER9 vs POWER10 difference, not really an obsolete FW.  The
> > > > > > key idea behind the original patch was to make the H_CEDE latency and
> > > > > > hence target residency come from firmware instead of being decided by
> > > > > > the kernel.  The advantage is such that, different type of systems in
> > > > > > POWER10 generation can adjust this value and have an optimal H_CEDE
> > > > > > entry criteria which balances good single thread performance and
> > > > > > wakeup latency.  Further we can have additional H_CEDE state to feed
> > > > > > into the cpuidle.  
> > > > > 
> > > > > So all POWER9 machines are affected by the firmware bug where firmware
> > > > > reports CEDE1 exit latency of 2us and the real latency is 5us which
> > > > > causes the kernel to prefer CEDE1 too much when relying on the values
> > > > > supplied by the firmware. It is not about 'older firmware'.
> > > > 
> > > > Correct.  All POWER9 systems running Linux as guest LPARs will see
> > > > extra usage of CEDE idle state, but not baremetal (PowerNV).
> > > > 
> > > > The correct definition of the bug or miss-match in expectation is that
> > > > firmware reports wakeup latency from a core/thread wakeup timing, but
> > > > not end-to-end time from sending a wakeup event like an IPI using
> > > > H_calls and receiving the events on the target.  Practically there are
> > > > few extra micro-seconds needed after deciding to wakeup a target
> > > > core/thread to getting the target to start executing instructions
> > > > within the LPAR instance.
> > > 
> > > Thanks for the detailed explanation.
> > > 
> > > Maybe just adding a few microseconds to the reported time would be a
> > > more reasonable workaround than using a blanket fixed value then.
> > 
> > Yes, that is an option.  But that may only reduce the difference
> > between existing kernel and new kernel unless we make it the same
> > number.  Further we are fixing this in P10 and hence we will have to
> > add "if(P9) do the compensation" and otherwise take it as is.  That
> > would not be elegant.  Given that our goal for P9 platform is to not
> > introduce changes in H_CEDE entry behaviour, we arrived at this
> > approach (this small patch) and this also makes it easy to backport to
> > various distro products.
> 
> I don't see how this is more elegent.
> 
> The current patch is
> 
> if(p9)
> 	use fixed value
> 
> the suggested patch is
> 
> if(p9)
> 	apply compensation


We could do that, however, from the recent measurements the default
value is closer to the latency value measured using an IPI.

As Vaidy described earlier, on POWER9 and prior platforms, the wakeup
latency advertized by the PHYP hypervisor corresponds to the latency
required to wakeup from the underlying hardware idle state (Nap in
POWER8 and stop0/1/2 on POWER9) into the hypervisor. That's 2us on
POWER9.

We need to apply two kinds of compensation,

1. Compensation for the time taken to transition the CPU from the
   Hypervisor into the LPAR post wakeup from platform idle state

2. Compensation for the time taken to send the IPI from the source CPU
   (waker) to the idle target CPU (wakee).

1. can be measured via timer idle test (I am using Pratik's
cpuidle self-test posted here
https://lore.kernel.org/lkml/20210412074309.38484-1-psampat@linux.ibm.com/)

We queue a timer, say for 1ms, and enter the CEDE state. When the
timer fires, in the timer handler we compute how much extra timer over
the expected 1ms have we consumed. This is what it looks like on
POWER9 LPAR

CEDE latency measured using a timer (numbers in ns)
===================================================================
N       Min      Median   Avg       90%ile  99%ile    Max    Stddev
400     2601     5677     5668.74    5917    6413     9299   455.01

If we consider the avg and the 99th %ile values, it takes on an avg
about somewhere between 3.5-4.5 us to transition from the Hypervisor
to the guest VCPU after the CPU has woken up from the idle state. 

1. and 2. combined can be determined by an IPI latency test (from the
same self-test linked above). We send an IPI to an idle CPU and in the
handler compute the time difference between when the IPI was sent and
when the handler ran. We see the following numbers on POWER9 LPAR.

CEDE latency measured using an IPI (numbers in us)
==================================================
N       Min      Median   Avg       90%ile  99%ile    Max    Stddev
400     711      7564     7369.43   8559    9514      9698   1200.01

Thus considering the avg and the 99th percentile this compensation
would be 5.4-7.5us.

Suppose, we consider the compensation corresponding to the 99th
percentile latency value measured using the IPI, the compensation will
be 7.5us, which will take the total CEDE latency to 9.5us.

This is in the ballpark of the default value of 10us which we obtain
if we do

if (!p10)
   use default hardcoded value;


> 
> That is either will add one branch for the affected platform.
>

Since POWER10 onwards, the latency value advertized by the hypervisor
will be the latency as observed by the LPAR VCPU, any new code that we
will be adding will only be applicable for POWER9. We can get the same
effect by using the default value.

Given this, if you feel that it might still be worth pursuing the
compensation approach, I will send out a patch for that.

> But I understand if you do not have confidence that the compensation is
> the same in all cases and do not have the opportunity to measure it it
> may be simpler to apply one very conservative adjustment.
>



> Thanks
> 
> Michal

--
Thanks and Regards
gautham.
