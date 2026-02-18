Return-Path: <linuxppc-dev+bounces-16939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UPIoOhwBlmlHYAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16939-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 19:12:44 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD2F15896A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 19:12:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGPkH4MlSz2xlq;
	Thu, 19 Feb 2026 05:12:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771438359;
	cv=none; b=DWYJcEdC0iGUKBHHIc49sBH0AUR+CyxEU9fC+VAway9S6dUp50vtXm6ZC15OWrKlToWHQBZ4aNHoL/v4Aj+sMi4ud5sSxkDGxKCftFLQxyyAiAQmjyQDRF3EJmXQHQSzG7lOHJ/fC/q6FpcmY8/U/AqyXv/LcoulAM9QFYucNGY9O9qTmtU2rjIv8mZOETE1v/Gf7g/oAd+WrKFyMUWLQvL2YMkHLpon88eVv4TjuNP4PEtYopSFqeT1sYOBkLeQEcDIwvZYhPKUsmIczeAIwU50GrJ5SIsrWBNv6d0LaLHYYghxFw9cR5QDGFpuA30xy7ziJG1DCRcg0XG6r7cJ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771438359; c=relaxed/relaxed;
	bh=sfUlV/wNefxooluft56yOC+h7KQSYmmCaL4cqn1R+TU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YnVKHtZpAQTsxycDNi9dHM9yE+Ap2xZygybA1wM12C+Kq/WZ4NkRtFJUAIZfa9m2JyWZvgYel5sGQqi7ZaEq8oIYfm1Va6v6F/rqA03zq1krWFL8jRF2RLR9/0Lm6AG6rpMySQewTONPOH+yh7tOGVKO6q9kdBvxt7/6DSu2DvBtjiSvnCvNpwHDHPZ5X/VYuX1+evSGpiQiGduEzxLyzinSbiCGwETG0FQ8qO6mViSqM2PXe2DvbWTFBkJxbzNGIsZyTeRl2U833cJjB5hhwmr90ZeH0a9Nh/CRZGqgvzNbdbEoog1OfRSDRAepg/YfXcHSQg46sTff9f/eaUYouQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f50Mlxtz; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f50Mlxtz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGPkF6YH5z2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 05:12:37 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I9nec83417742;
	Wed, 18 Feb 2026 18:12:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sfUlV/
	wNefxooluft56yOC+h7KQSYmmCaL4cqn1R+TU=; b=f50Mlxtzm5FCleoG8kfOdS
	yLytip3a1xRuz+1QRiPCJiMT0WIuaDAppmqrNs8US2FHp4Am2Devb+M+AcJfXtZp
	EZRgxbdtBF2gicS7jb3DyEipiP+cXmg/Y1BMEW30sZbYPsseB44+JUcqMuyN/5n4
	p/FtYuPWEIiMoX3NdA9AAzHBD6Sby3dk4v12IJvl8BFJqKf/tgJSrnIRMc5lWjZy
	0qlxjt4j+eaDkn8NinhSipB6UC50ALwh3zEGZRf+WK7iTK2M73h/vhSpUJzfwjeh
	akLPfh/duGUSMjiau7cASvEH3fG4Vfcb78Ov8aBUdVPjZZ8Lp19BDpgPXVO5B6kA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj4khfum-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 18:12:10 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61IHRowm015846;
	Wed, 18 Feb 2026 18:12:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb459070-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 18:12:09 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61IIC5B250331956
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 18:12:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08F8C2004F;
	Wed, 18 Feb 2026 18:12:05 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E63D2004B;
	Wed, 18 Feb 2026 18:11:55 +0000 (GMT)
Received: from [9.111.93.209] (unknown [9.111.93.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Feb 2026 18:11:54 +0000 (GMT)
Message-ID: <e3f83ce1-15d7-4b17-9dd3-6f7d12c0060d@linux.ibm.com>
Date: Wed, 18 Feb 2026 23:41:53 +0530
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
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
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
 <f5f7cc0e-81c1-49c4-9bfa-61b111c69ae2@linux.ibm.com>
 <aYy3GTXDwZFM3VLy@localhost.localdomain>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <aYy3GTXDwZFM3VLy@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1NSBTYWx0ZWRfX/Z+O37yeSxT0
 0ArN/qMzStecQC6PWbJIopmSxoCNU/Cvu6+FUC4a8qFH4IguGOuBPuD8YJ49xZG2ZxjoArrRuRh
 aVgRfHOhX/3tbUA1vmyi200xmyaVKtan+/olqtTvJl6gFP14Fnqe/aZS1uaWbvsCCDzUOnOo3c4
 VsHIUmu2wkg9JhqKxDTbEwv5u02Te6E5GGR42bPioABeMnMF+j9Dkeq7Wx6i/OYUMSb8gzxz81v
 Um5eXQBcTcff18EbzehQGMXdQ3aXSHOmrWN4bEEK9ep9yCnTHGk7z3CTElBXI8FiFqs5l+P6Xyn
 DmEx89KzMRPCFwhMRGzaQhy49Pi03KidRX2VoTuiuYG12i3CEMUJYVjvoCPLtByEvSGI26JhPrm
 mZ/o6Ct0VTIes9DffW8x7/ob2lSfvf5XVGLtm2ISpQ/yZTzlWrWAuoxncpbusYMFXUYuGLE97c9
 aqRX0EtPnJGARH1mxMQ==
X-Proofpoint-ORIG-GUID: mSHiEHIbbZ6uwb7WfwT2_4csNFB2eLee
X-Proofpoint-GUID: PvR6Ae7132HEIgri66fng2-gFbwTbNap
X-Authority-Analysis: v=2.4 cv=M7hA6iws c=1 sm=1 tr=0 ts=699600fa cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=Byx-y9mGAAAA:8 a=VnNF1IyMAAAA:8 a=jna3-dR-LpdznfkkQtQA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-18_03,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602180155
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
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16939-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.ibm.com,linaro.org,kernel.org,redhat.com,163.com,nvidia.com,gmail.com,suse.de,arm.com,google.com,ellerman.id.au,linutronix.de,siemens.com,infradead.org,goodmis.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:kbingham@kernel.org,m:mingo@redhat.com,m:jackzxcui1989@163.com,m:joelagnelf@nvidia.com,m:neeraj.upadhyay@kernel.org,m:svens@linux.ibm.com,m:boqun.feng@gmail.com,m:mgorman@suse.de,m:dietmar.eggemann@arm.com,m:bsegall@google.com,m:mpe@ellerman.id.au,m:rafael@kernel.org,m:paulmck@kernel.org,m:anna-maria@linutronix.de,m:agordeev@linux.ibm.com,m:maddy@linux.ibm.com,m:linux-s390@vger.kernel.org,m:jan.kiszka@siemens.com,m:juri.lelli@redhat.com,m:chleroy@kernel.org,m:linux-pm@vger.kernel.org,m:urezki@gmail.com,m:peterz@infradead.org,m:rostedt@goodmis.org,m:tglx@linutronix.de,m:npiggin@gmail.com,m:hca@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:borntraeger@linux.ibm.com,m:vschneid@redhat.com,m:viresh.kumar@linaro.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3CD2F15896A
X-Rspamd-Action: no action

Hi Frederic.

On 2/11/26 10:36 PM, Frederic Weisbecker wrote:
> Le Wed, Feb 11, 2026 at 07:13:45PM +0530, Shrikanth Hegde a écrit :
>> Hi Frederic,
>> Gave this series a spin on the same system as v1.
>>
>> On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
>>> Hi,
>>>
>>> After the issue reported here:
>>>
>>>           https://lore.kernel.org/all/20251210083135.3993562-1-jackzxcui1989@163.com/
>>>
>>> It occurs that the idle cputime accounting is a big mess that
>>> accumulates within two concurrent statistics, each having their own
>>> shortcomings:
>>>
>>> * The accounting for online CPUs which is based on the delta between
>>>     tick_nohz_start_idle() and tick_nohz_stop_idle().
>>>
>>>     Pros:
>>>          - Works when the tick is off
>>>
>>>          - Has nsecs granularity
>>>
>>>     Cons:
>>>          - Account idle steal time but doesn't substract it from idle
>>>            cputime.
>>>
>>>          - Assumes CONFIG_IRQ_TIME_ACCOUNTING by not accounting IRQs but
>>>            the IRQ time is simply ignored when
>>>            CONFIG_IRQ_TIME_ACCOUNTING=n
>>>
>>>          - The windows between 1) idle task scheduling and the first call
>>>            to tick_nohz_start_idle() and 2) idle task between the last
>>>            tick_nohz_stop_idle() and the rest of the idle time are
>>>            blindspots wrt. cputime accounting (though mostly insignificant
>>>            amount)
>>>
>>>          - Relies on private fields outside of kernel stats, with specific
>>>            accessors.
>>>
>>> * The accounting for offline CPUs which is based on ticks and the
>>>     jiffies delta during which the tick was stopped.
>>>
>>>     Pros:
>>>          - Handles steal time correctly
>>>
>>>          - Handle CONFIG_IRQ_TIME_ACCOUNTING=y and
>>>            CONFIG_IRQ_TIME_ACCOUNTING=n correctly.
>>>
>>>          - Handles the whole idle task
>>>
>>>          - Accounts directly to kernel stats, without midlayer accumulator.
>>>
>>>      Cons:
>>>          - Doesn't elapse when the tick is off, which doesn't make it
>>>            suitable for online CPUs.
>>>
>>>          - Has TICK_NSEC granularity (jiffies)
>>>
>>>          - Needs to track the dyntick-idle ticks that were accounted and
>>>            substract them from the total jiffies time spent while the tick
>>>            was stopped. This is an ugly workaround.
>>>
>>> Having two different accounting for a single context is not the only
>>> problem: since those accountings are of different natures, it is
>>> possible to observe the global idle time going backward after a CPU goes
>>> offline, as reported by Xin Zhao.
>>>
>>> Clean up the situation with introducing a hybrid approach that stays
>>> coherent, fixes the backward jumps and works for both online and offline
>>> CPUs:
>>>
>>> * Tick based or native vtime accounting operate before the tick is
>>>     stopped and resumes once the tick is restarted.
>>>
>>> * When the idle loop starts, switch to dynticks-idle accounting as is
>>>     done currently, except that the statistics accumulate directly to the
>>>     relevant kernel stat fields.
>>>
>>> * Private dyntick cputime accounting fields are removed.
>>>
>>> * Works on both online and offline case.
>>>
>>> * Move most of the relevant code to the common sched/cputime subsystem
>>>
>>> * Handle CONFIG_IRQ_TIME_ACCOUNTING=n correctly such that the
>>>     dynticks-idle accounting still elapses while on IRQs.
>>>
>>> * Correctly substract idle steal cputime from idle time
>>>
>>> Changes since v1:
>>>
>>> - Fix deadlock involving double seq count lock on idle
>>>
>>> - Fix build breakage on powerpc
>>>
>>> - Fix build breakage on s390 (Heiko)
>>>
>>> - Fix broken sysfs s390 idle time file (Heiko)
>>>
>>> - Convert most ktime usage here into u64 (Peterz)
>>>
>>> - Add missing (or too implicit) <linux/sched/clock.h> (Peterz)
>>>
>>> - Fix whole idle time acccounting breakage due to missing TS_FLAG_ set
>>>     on idle entry (Shrikanth Hegde)
>>>
>>> git://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git
>>> 	timers/core-v2
>>>
>>> HEAD: 21458b98c80a0567d48131240317b7b73ba34c3c
>>> Thanks,
>>> 	Frederic
>>
>> idle and runtime utilization with mpstat while running stress-ng looks
>> correct now.
>>
>> However, when running hackbench I am noticing the below data. hackbench shows
>> severe regressions.
>>
>> base: tip/master at 9c61ebbdb587a3950072700ab74a9310afe3ad73.
>> (nit: patch 7 is already part of tip. so skipped applying it)
>> +-----------------------------------------------+-------+---------+-----------+
>> | Test                                          | base  | +series | % Diff    |
>> +-----------------------------------------------+-------+---------+-----------+
>> | HackBench Process 10 groups                   |  2.23 |  3.05   |   -36.77%  |
>> | HackBench Process 20 groups                   |  4.17 |  5.82   |   -39.57%  |
>> | HackBench Process 30 groups                   |  6.04 |  8.49   |   -40.56%  |
>> | HackBench Process 40 groups                   |  7.90 | 11.10   |   -40.51%  |
>> | HackBench thread 10                           |  2.44 |  3.36   |   -37.70%  |
>> | HackBench thread 20                           |  4.57 |  6.35   |   -38.95%  |
>> | HackBench Process(Pipe) 10                    |  1.76 |  2.29   |   -30.11%  |
>> | HackBench Process(Pipe) 20                    |  3.49 |  4.76   |   -36.39%  |
>> | HackBench Process(Pipe) 30                    |  5.21 |  7.13   |   -36.85%  |
>> | HackBench Process(Pipe) 40                    |  6.89 |  9.31   |   -35.12%  |
>> | HackBench thread(Pipe) 10                     |  1.91 |  2.50   |   -30.89%  |
>> | HackBench thread(Pipe) 20                     |  3.74 |  5.16   |   -37.97%  |
>> +-----------------------------------------------+-------+---------+-----------+
>>
>> I have these in .config and I don't have nohz_full or isolated cpus.
>>
>> CONFIG_TICK_ONESHOT=y
>> CONFIG_NO_HZ_COMMON=y
>> # CONFIG_HZ_PERIODIC is not set
>> # CONFIG_NO_HZ_IDLE is not set
>> CONFIG_NO_HZ_FULL=y
>>
>> # CPU/Task time and stats accounting
>> #
>> CONFIG_VIRT_CPU_ACCOUNTING=y
>> CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
>> CONFIG_IRQ_TIME_ACCOUNTING=y
>> CONFIG_HAVE_SCHED_AVG_IRQ=y
>>
>> I did a git bisect and below is what it says.
>>
>> git bisect start
>> # status: waiting for both good and bad commits
>> # bad: [6821315886a3b5267ea31d29dba26fd34647fbbc] sched/cputime: Handle dyntick-idle steal time correctly
>> git bisect bad 6821315886a3b5267ea31d29dba26fd34647fbbc
>> # status: waiting for good commit(s), bad commit known
>> # good: [9c61ebbdb587a3950072700ab74a9310afe3ad73] Merge branch into tip/master: 'x86/sev'
>> git bisect good 9c61ebbdb587a3950072700ab74a9310afe3ad73
>> # good: [dc8bb3c84d162f7d9aa6becf9f8392474f92655a] tick/sched: Remove nohz disabled special case in cputime fetch
>> git bisect good dc8bb3c84d162f7d9aa6becf9f8392474f92655a
>> # good: [5070a778a581cd668f5d717f85fb22b078d8c20c] tick/sched: Account tickless idle cputime only when tick is stopped
>> git bisect good 5070a778a581cd668f5d717f85fb22b078d8c20c
>> # bad: [1e0ccc25a9a74b188b239c4de716fde279adbf8e] sched/cputime: Provide get_cpu_[idle|iowait]_time_us() off-case
>> git bisect bad 1e0ccc25a9a74b188b239c4de716fde279adbf8e
>> # bad: [ee7c735b76071000d401869fc2883c451ee3fa61] tick/sched: Consolidate idle time fetching APIs
>> git bisect bad ee7c735b76071000d401869fc2883c451ee3fa61
>> # first bad commit: [ee7c735b76071000d401869fc2883c451ee3fa61] tick/sched:
>> Consolidate idle time fetching APIs
> 
> I see. Can you try this? (or fetch timers/core-v3 from my tree)
> Perhaps that mistake had some impact on cpufreq.
> 
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index 057fdc00dbc6..08550a6d9469 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -524,7 +524,7 @@ static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
>   	do_div(res, NSEC_PER_USEC);
>   
>   	if (last_update_time)
> -		*last_update_time = res;
> +		*last_update_time = ktime_to_us(now);
>   
>   	return res;
>   }
> 
> 
> 

I have done testing in below cases on PowerNV(power9) box.

1. CONFIG_VIRT_CPU_ACCOUNTING_GEN + CONFIG_IRQ_TIME_ACCOUNTING=y.
    This is common case of having VTIME_GEN + IRQ_TIME enabled.

2. CONFIG_VIRT_CPU_ACCOUNTING_GEN only.
    IRQ_TIME is not selected

3. CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y (for this i had to disable CONFIG_NO_HZ_FULL)
    CONFIG_NO_HZ_IDLE=y and CONFIG_NO_HZ_FULL=n and VTIME_GEN=n


4. CONFIG_TICK_CPU_ACCOUNTING=y
    (CONFIG_NO_HZ_FULL=n and CONFIG_NO_HZ_IDLE=y)


In all cases the idle time and iowait time doesn't go backwards.
So that's a clear win.
Without the patches iowait did go backwards.

So, with that for the series.

Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>



---
However, with the series, with NATIVE=y i am seeing one peculiar info.
without series: cpu0 0 0 9    60800 4 2  90 0 0 0  << 608 seconds after boot. That's ok.
with series:    cpu0 1 0 17 9122062 0 3 140 0 0 0  << 91220 seconds?? Strange.

However, i see the time passage looks normal.
If i do like, cat /proc/stat; sleep 5; cat /proc/stat;
then i see same time difference with/without series.
So timekeeping works as expected.

Almost all CPUs have similar stat. I am wondering if there is bug or some kind
of wrapping in mftb which raises an irq and during that particular period the
values go very large. Even without series, I see one or two CPUs have same huge system
time. Maybe since the series handles the irq case now, it might be showing up in all CPUs.

This is a  slightly older system. I will give this a try on power10 when I get the
systems in few weeks time.

