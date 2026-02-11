Return-Path: <linuxppc-dev+bounces-16811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mFu1FcyHjGmHqgAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16811-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 14:44:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1229124E3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Feb 2026 14:44:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fB06G3nwHz2yFc;
	Thu, 12 Feb 2026 00:44:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770817478;
	cv=none; b=f5p1eKkpOU4vRZAKZ7edNwX8q96wdTFS+rR45K2cSSBh2jBQfR1B5THXoqucGsozGMZw4NV8QXKzhm+WC+ixODKzfZXmgZilrKrbWMUHY3nobKIc8A3Jj20EcQljcrZ7s8ABCjx0r4ta0jqeL/DYiq4RxkLcd7J6301wUeqhX7JKPGlocvSjBlQY2Nffk8EphmhhYUMcQm0nJmmpDvyLK6reTwWTdiLPl71E6OhcusqvOTyEHyCXF1Hd4DFcyLW7cwTvLga3e1hBIB7IWB6lEgPE9ei0PbckHeO/wsdQvq4v57fFE6GVylEVVwl1JBhEBlqWWNIBnW58bnbojzvlPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770817478; c=relaxed/relaxed;
	bh=ofhnE7U+P29+zIVstVseiGSwWxufrhAvNzNGwjee5OA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WM98kY4IjY08t/FVLpIpvCxIFy6LX6DpUyAWoWL5Qphf4T6h/YQ4QRQPtgu8YKyM8HUpXLWnwwthtXB84rBgPCfs/AjAw6FAQlcljsjP5tBh+7jX6nymsTsW1lqFS4OMFtL/K9vFoIVZX4tCgVojApKLIhSy6LGrsnF86vF1VnhGRBoyXW3S8ACDB0o3GS1FjkqemocXK1lx7h38tQ1N902JTj4WhEUVmQSK3sGgtcuZ2BlXGH/VPNi8L0ecfncr8RLDrdf0zcW75ZPiCO+4X7/59IlxBF/6CJeqkjEUVXZQDtA9wI3VNJGS+1whUXttKziGLRRp+ZM8XzFORqp2ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q7KbrV19; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=q7KbrV19;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fB06F1BvNz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 00:44:36 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BCpdJb3391389;
	Wed, 11 Feb 2026 13:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ofhnE7
	U+P29+zIVstVseiGSwWxufrhAvNzNGwjee5OA=; b=q7KbrV19dkbdzpj/hNBhdS
	OotzLr5k5mMa5bSdymsmT06pwBzNA9SXb6yV6kk6hB7Tx9ibW3zhBi3sB2o00TSv
	vvFS7k1DdEBXtA/ZXmfdTBj/m5CVZUGBnIcIzNg8bqi95r9VX2iPNf10UBe8CXwO
	ZPtJWMuZIa3YMiNMmcAJbqc7CTbIHWIGgk4D8fLl5DCLZEWaXa1MmwSnQ4WDhUV8
	mNSJsyvpV1+a5Yk+SV01FdSFXqJrMwH4a7xsWzqpXw8IwQbFi3oIoIKxX1zHtFe3
	LdlRu3zIxYKNdWRmII5e0lvO0tugG0peHr06v04ExFBF3oWv7PSvoe9zAO999Btw
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696wxw7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 13:44:01 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61B9E9Ic001499;
	Wed, 11 Feb 2026 13:44:00 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6gqn60dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Feb 2026 13:44:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61BDhuC729622612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 11 Feb 2026 13:43:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A11DE20043;
	Wed, 11 Feb 2026 13:43:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A9B520040;
	Wed, 11 Feb 2026 13:43:46 +0000 (GMT)
Received: from [9.111.79.122] (unknown [9.111.79.122])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 11 Feb 2026 13:43:46 +0000 (GMT)
Message-ID: <f5f7cc0e-81c1-49c4-9bfa-61b111c69ae2@linux.ibm.com>
Date: Wed, 11 Feb 2026 19:13:45 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/15 v2] tick/sched: Refactor idle cputime accounting
To: Frederic Weisbecker <frederic@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc: Vasily Gorbik <gor@linux.ibm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Kieran Bingham <kbingham@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Xin Zhao <jackzxcui1989@163.com>,
        Joel Fernandes <joelagnelf@nvidia.com>,
        Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
        Sven Schnelle <svens@linux.ibm.com>, Boqun Feng <boqun.feng@gmail.com>,
        Mel Gorman <mgorman@suse.de>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ben Segall <bsegall@google.com>, Michael Ellerman <mpe@ellerman.id.au>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, linux-s390@vger.kernel.org,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linux-pm@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nicholas Piggin <npiggin@gmail.com>,
        Heiko Carstens <hca@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
References: <20260206142245.58987-1-frederic@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260206142245.58987-1-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=WZYBqkhX c=1 sm=1 tr=0 ts=698c87a1 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=Byx-y9mGAAAA:8 a=WHM7aQrYW9fwOdz2DaoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: HteRaXx1ui5kfmfs6alyEJh98C_G2gvZ
X-Proofpoint-ORIG-GUID: 91FmO37-_cpg74FvCX_EFuJb5r_G1axG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjExMDEwMyBTYWx0ZWRfX+xRAmu0RW3c8
 BSFli7yshkQZbRM9ypod1YueeQjiCUBCFaR1PvLMpab1nrIQf9vb5IWB3GhqmL8f8rlWBARLG+i
 umUODBavJihrNOvk7Qv3P4WmMGWwu2ZpwNFHfX9bVDgxQrcaXiPNcUXYZ+Tmbnw2ut1XBb98pYE
 1zqHPlN42eMfiYedrjAFdscpPdrBrHah3ErvUk4TCY8DHIOjR5x9y2u1K2MRXscoWpzILpKAlrm
 WfmG1oyDPqiFGluYiUf8G49n37dQMwX1qZBZe/fu3pCFLjdP+5ImSlh+cJFjSES0pRadHqtM29t
 dDQk4B3RU+9mqCag7RhDPfvByWb5cPFghp1EdPb92SUTRvwJFh1UPrEU+fgFsYwIN+p147+g3NV
 XxatsZPmvFmCeoMJtIP97Qs9wRM34tDqnmO6m1zD+b2AeEWx7sDhdJaM6WhFgOAAtLDMrYaVOZC
 1oBii5s47p4pEEGXEdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-11_01,2026-02-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602110103
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16811-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:kbingham@kernel.org,m:mingo@redhat.com,m:jackzxcui1989@163.com,m:joelagnelf@nvidia.com,m:neeraj.upadhyay@kernel.org,m:svens@linux.ibm.com,m:boqun.feng@gmail.com,m:mgorman@suse.de,m:dietmar.eggemann@arm.com,m:bsegall@google.com,m:mpe@ellerman.id.au,m:rafael@kernel.org,m:paulmck@kernel.org,m:anna-maria@linutronix.de,m:agordeev@linux.ibm.com,m:maddy@linux.ibm.com,m:linux-s390@vger.kernel.org,m:jan.kiszka@siemens.com,m:juri.lelli@redhat.com,m:chleroy@kernel.org,m:linux-pm@vger.kernel.org,m:urezki@gmail.com,m:peterz@infradead.org,m:rostedt@goodmis.org,m:tglx@linutronix.de,m:npiggin@gmail.com,m:hca@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:borntraeger@linux.ibm.com,m:vschneid@redhat.com,m:viresh.kumar@linaro.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,linaro.org,kernel.org,redhat.com,163.com,nvidia.com,gmail.com,suse.de,arm.com,google.com,ellerman.id.au,linutronix.de,vger.kernel.org,siemens.com,infradead.org,goodmis.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C1229124E3B
X-Rspamd-Action: no action

Hi Frederic,
Gave this series a spin on the same system as v1.

On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
> Hi,
> 
> After the issue reported here:
> 
>          https://lore.kernel.org/all/20251210083135.3993562-1-jackzxcui1989@163.com/
> 
> It occurs that the idle cputime accounting is a big mess that
> accumulates within two concurrent statistics, each having their own
> shortcomings:
> 
> * The accounting for online CPUs which is based on the delta between
>    tick_nohz_start_idle() and tick_nohz_stop_idle().
> 
>    Pros:
>         - Works when the tick is off
> 
>         - Has nsecs granularity
> 
>    Cons:
>         - Account idle steal time but doesn't substract it from idle
>           cputime.
> 
>         - Assumes CONFIG_IRQ_TIME_ACCOUNTING by not accounting IRQs but
>           the IRQ time is simply ignored when
>           CONFIG_IRQ_TIME_ACCOUNTING=n
> 
>         - The windows between 1) idle task scheduling and the first call
>           to tick_nohz_start_idle() and 2) idle task between the last
>           tick_nohz_stop_idle() and the rest of the idle time are
>           blindspots wrt. cputime accounting (though mostly insignificant
>           amount)
> 
>         - Relies on private fields outside of kernel stats, with specific
>           accessors.
> 
> * The accounting for offline CPUs which is based on ticks and the
>    jiffies delta during which the tick was stopped.
> 
>    Pros:
>         - Handles steal time correctly
> 
>         - Handle CONFIG_IRQ_TIME_ACCOUNTING=y and
>           CONFIG_IRQ_TIME_ACCOUNTING=n correctly.
> 
>         - Handles the whole idle task
> 
>         - Accounts directly to kernel stats, without midlayer accumulator.
> 
>     Cons:
>         - Doesn't elapse when the tick is off, which doesn't make it
>           suitable for online CPUs.
> 
>         - Has TICK_NSEC granularity (jiffies)
> 
>         - Needs to track the dyntick-idle ticks that were accounted and
>           substract them from the total jiffies time spent while the tick
>           was stopped. This is an ugly workaround.
> 
> Having two different accounting for a single context is not the only
> problem: since those accountings are of different natures, it is
> possible to observe the global idle time going backward after a CPU goes
> offline, as reported by Xin Zhao.
> 
> Clean up the situation with introducing a hybrid approach that stays
> coherent, fixes the backward jumps and works for both online and offline
> CPUs:
> 
> * Tick based or native vtime accounting operate before the tick is
>    stopped and resumes once the tick is restarted.
> 
> * When the idle loop starts, switch to dynticks-idle accounting as is
>    done currently, except that the statistics accumulate directly to the
>    relevant kernel stat fields.
> 
> * Private dyntick cputime accounting fields are removed.
> 
> * Works on both online and offline case.
> 
> * Move most of the relevant code to the common sched/cputime subsystem
> 
> * Handle CONFIG_IRQ_TIME_ACCOUNTING=n correctly such that the
>    dynticks-idle accounting still elapses while on IRQs.
> 
> * Correctly substract idle steal cputime from idle time
> 
> Changes since v1:
> 
> - Fix deadlock involving double seq count lock on idle
> 
> - Fix build breakage on powerpc
> 
> - Fix build breakage on s390 (Heiko)
> 
> - Fix broken sysfs s390 idle time file (Heiko)
> 
> - Convert most ktime usage here into u64 (Peterz)
> 
> - Add missing (or too implicit) <linux/sched/clock.h> (Peterz)
> 
> - Fix whole idle time acccounting breakage due to missing TS_FLAG_ set
>    on idle entry (Shrikanth Hegde)
> 
> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
> 	timers/core-v2
> 
> HEAD: 21458b98c80a0567d48131240317b7b73ba34c3c
> Thanks,
> 	Frederic

idle and runtime utilization with mpstat while running stress-ng looks
correct now.

However, when running hackbench I am noticing the below data. hackbench shows
severe regressions.

base: tip/master at 9c61ebbdb587a3950072700ab74a9310afe3ad73.
(nit: patch 7 is already part of tip. so skipped applying it)
+-----------------------------------------------+-------+---------+-----------+
| Test                                          | base  | +series | % Diff    |
+-----------------------------------------------+-------+---------+-----------+
| HackBench Process 10 groups                   |  2.23 |  3.05   |   -36.77%  |
| HackBench Process 20 groups                   |  4.17 |  5.82   |   -39.57%  |
| HackBench Process 30 groups                   |  6.04 |  8.49   |   -40.56%  |
| HackBench Process 40 groups                   |  7.90 | 11.10   |   -40.51%  |
| HackBench thread 10                           |  2.44 |  3.36   |   -37.70%  |
| HackBench thread 20                           |  4.57 |  6.35   |   -38.95%  |
| HackBench Process(Pipe) 10                    |  1.76 |  2.29   |   -30.11%  |
| HackBench Process(Pipe) 20                    |  3.49 |  4.76   |   -36.39%  |
| HackBench Process(Pipe) 30                    |  5.21 |  7.13   |   -36.85%  |
| HackBench Process(Pipe) 40                    |  6.89 |  9.31   |   -35.12%  |
| HackBench thread(Pipe) 10                     |  1.91 |  2.50   |   -30.89%  |
| HackBench thread(Pipe) 20                     |  3.74 |  5.16   |   -37.97%  |
+-----------------------------------------------+-------+---------+-----------+

I have these in .config and I don't have nohz_full or isolated cpus.

CONFIG_TICK_ONESHOT=y
CONFIG_NO_HZ_COMMON=y
# CONFIG_HZ_PERIODIC is not set
# CONFIG_NO_HZ_IDLE is not set
CONFIG_NO_HZ_FULL=y

# CPU/Task time and stats accounting
#
CONFIG_VIRT_CPU_ACCOUNTING=y
CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
CONFIG_IRQ_TIME_ACCOUNTING=y
CONFIG_HAVE_SCHED_AVG_IRQ=y

I did a git bisect and below is what it says.

git bisect start
# status: waiting for both good and bad commits
# bad: [6821315886a3b5267ea31d29dba26fd34647fbbc] sched/cputime: Handle dyntick-idle steal time correctly
git bisect bad 6821315886a3b5267ea31d29dba26fd34647fbbc
# status: waiting for good commit(s), bad commit known
# good: [9c61ebbdb587a3950072700ab74a9310afe3ad73] Merge branch into tip/master: 'x86/sev'
git bisect good 9c61ebbdb587a3950072700ab74a9310afe3ad73
# good: [dc8bb3c84d162f7d9aa6becf9f8392474f92655a] tick/sched: Remove nohz disabled special case in cputime fetch
git bisect good dc8bb3c84d162f7d9aa6becf9f8392474f92655a
# good: [5070a778a581cd668f5d717f85fb22b078d8c20c] tick/sched: Account tickless idle cputime only when tick is stopped
git bisect good 5070a778a581cd668f5d717f85fb22b078d8c20c
# bad: [1e0ccc25a9a74b188b239c4de716fde279adbf8e] sched/cputime: Provide get_cpu_[idle|iowait]_time_us() off-case
git bisect bad 1e0ccc25a9a74b188b239c4de716fde279adbf8e
# bad: [ee7c735b76071000d401869fc2883c451ee3fa61] tick/sched: Consolidate idle time fetching APIs
git bisect bad ee7c735b76071000d401869fc2883c451ee3fa61
# first bad commit: [ee7c735b76071000d401869fc2883c451ee3fa61] tick/sched: Consolidate idle time fetching APIs


I did a perf diff between the two (collected perf record -a for hackbench 60 process 10000 loops)

perf diff base series:
# Baseline  Delta Abs  Shared Object                Symbol
# ........  .........  ...........................  ................................................
#
                +5.43%  [kernel.kallsyms]            [k] __update_freelist_slow
      0.00%     +4.55%  [kernel.kallsyms]            [k] _raw_spin_lock
                +3.35%  [kernel.kallsyms]            [k] __memcg_slab_free_hook
      0.55%     +2.58%  [kernel.kallsyms]            [k] sock_wfree
                +2.51%  [kernel.kallsyms]            [k] __account_obj_stock
      2.29%     -2.29%  [kernel.kallsyms]            [k] _raw_write_lock_irq
                +2.25%  [kernel.kallsyms]            [k] _copy_from_iter
                +1.96%  [kernel.kallsyms]            [k] fdget_pos
                +1.87%  [kernel.kallsyms]            [k] _copy_to_iter
                +1.69%  [kernel.kallsyms]            [k] sock_def_readable
      2.32%     -1.68%  [kernel.kallsyms]            [k] mod_memcg_lruvec_state
      0.82%     +1.67%  [kernel.kallsyms]            [k] skb_set_owner_w
      0.08%     +1.65%  [kernel.kallsyms]            [k] vfs_read
      0.42%     +1.57%  [kernel.kallsyms]            [k] kmem_cache_alloc_node_noprof
      1.53%     -1.53%  [kernel.kallsyms]            [k] kmem_cache_alloc_lru_noprof
      1.56%     -1.41%  [kernel.kallsyms]            [k] simple_copy_to_iter
      0.27%     +1.32%  [kernel.kallsyms]            [k] kfree
      0.01%     +1.25%  [kernel.kallsyms]            [k] __slab_free
      0.19%     +1.24%  [kernel.kallsyms]            [k] kmem_cache_free
      1.23%     -1.23%  [kernel.kallsyms]            [k] __pcs_replace_full_main
      0.35%     +1.21%  [kernel.kallsyms]            [k] __skb_datagram_iter
      0.21%     +1.13%  [kernel.kallsyms]            [k] sock_alloc_send_pskb
                +1.09%  [kernel.kallsyms]            [k] mutex_lock
                +0.98%  [kernel.kallsyms].head.text  [k] 0x0000000000013004


I haven't gone through the series yet. trying to go through meanwhile.
maybe different allocation scheme or more allocation/free everytime instead of
pre-allocated percpu variables?

First thought of reporting it. Let me know if you need any additional data.

