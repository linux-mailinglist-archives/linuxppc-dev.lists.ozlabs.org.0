Return-Path: <linuxppc-dev+bounces-16951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EVsNO9Wl2lPxAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16951-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 19:31:11 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 348C2161B19
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Feb 2026 19:31:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fH2565ScNz30GV;
	Fri, 20 Feb 2026 05:31:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771525866;
	cv=none; b=QIsrsIgVyiD1W6eOFiWUkF0JOk+vimpEHqOhJz7f2Sf3KSFHIaT0mLmae4+fG53KeE+0/dQe6fobnwvBgsvK5YsY2EMtwfZU61CzixAQZGJ2D7VO6pHglz9n6Ylic0cab/Wzp782yo07Imgu1oFzSGrtEdNYIXuMMLYYuYhDDL8mRDxE5VzdWSvC54b7ggrXZV4HX6eKcbFvsETQy24Do8+lZ4xjxbKqhzfWy+xDY1fLlEzs+TBNko1qX7pgy4z8FsX39LRjhMXoeztdo4HxcZiYz3ktO9RobwsD/iRufcUQYlPLsrRGrRI09rvfExz09qFGROheoCAhwAGq2O75mg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771525866; c=relaxed/relaxed;
	bh=UyqtE5dFClD4qUnTIg5kBZRFtx9J4UpArQv5TR4phSc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ofU3ff0FqoM306D/70FPJZ+Gg0jiMUyhjPmtv4j1Q3ocvNYIGdgsxKNN8+V/0eTjuCyl0Os8NTKPpl5hBKtek/xPXvM8mliA538Qzcw7GEtlY0VwBqJI4a5M3uCspPlwBkxt2Z5AtuQYoU/g4SdM7meEOSiDpxLlT2jIz4C9DoesoV7pBSjrA9nUZ+1AzbWRQ6/2uBWQwvXZ3NTQ3DbWb3wYw6SbzUlYjeZWrXOX9fOJRHl0efYWySurqKXPTRHlGqV6lcDfR+SaOckqK/CPNpgOjqRgFMa9J73EZ++Ka4P+4e7e25rjlt6in2GiLuKOvtY46KKhrYor7vwwWNMfMg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SFWg1clY; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SFWg1clY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fH2511VRLz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 05:31:00 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J9ACWk1261180;
	Thu, 19 Feb 2026 18:30:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UyqtE5
	dFClD4qUnTIg5kBZRFtx9J4UpArQv5TR4phSc=; b=SFWg1clY7vnfwxc2JH30jJ
	GJyI4qt6fn1359Gi0VIHaY13aqwYWLOj6niHzBfsHP5AavkHlDE/vcNM2azVxa07
	0Zel6Es13bpMv4TGzSTxPKyEjvfE5AhzRlvYMEuPDIAjrJ27RKQJChBMjT8ZMFyI
	E3lShnVceGQMb/zRm3DsYqC0D0i6SEwdDkv74HM220HMvNTpB/+6OriXCGBjEbhP
	mJhjlRD7I+qgk8g3wBrUGqLGBcVEVm2RApSFTCYTPi+Wez+l9FuCSEuNL0bF3XNq
	cZx7xJ40MSy+Ykw0yUWGf+8teGiGPXVQnxjyG+r4bMFA0nWqqWOFb9Cb+bNiV8jA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj6s7h9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 18:30:23 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61JI5k01015697;
	Thu, 19 Feb 2026 18:30:21 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb45dbya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Feb 2026 18:30:21 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61JIUHLX29229328
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Feb 2026 18:30:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C524720043;
	Thu, 19 Feb 2026 18:30:17 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 66FC720040;
	Thu, 19 Feb 2026 18:30:07 +0000 (GMT)
Received: from [9.111.92.82] (unknown [9.111.92.82])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Feb 2026 18:30:07 +0000 (GMT)
Message-ID: <9413517d-963b-4e6d-b11b-b440acd7cb5a@linux.ibm.com>
Date: Fri, 20 Feb 2026 00:00:06 +0530
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
Subject: Re: [PATCH 04/15] powerpc/time: Prepare to stop elapsing in
 dynticks-idle
To: Frederic Weisbecker <frederic@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Joel Fernandes <joelagnelf@nvidia.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Kieran Bingham <kbingham@kernel.org>, Mel Gorman <mgorman@suse.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E . McKenney"
 <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Uladzislau Rezki <urezki@gmail.com>,
        Valentin Schneider <vschneid@redhat.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Xin Zhao <jackzxcui1989@163.com>, linux-pm@vger.kernel.org,
        linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20260206142245.58987-1-frederic@kernel.org>
 <20260206142245.58987-5-frederic@kernel.org>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260206142245.58987-5-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=dvvWylg4 c=1 sm=1 tr=0 ts=699756bf cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=YJB6otqPPJUw7w8ZA6oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: wBr2Fja_KVXT4_1MKa1HvqQ-fZlDiO8G
X-Proofpoint-ORIG-GUID: 0riturGGUpWqAjVXmFdvyORGCGQiEQj9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE2NCBTYWx0ZWRfXydBM+OSLWTzC
 ZXK3WUprw2QRv0CstNwfm1HYMX09fQc9mgkhfmkAeYae0qdpXwTYM2fTlEGcxaxiS3ph0VWCZIY
 dXPnepPQ8PSxKduvuvQtq8HT/njmynffdUIClnWG5BvjEju0vZwrHWcJVMq85gYQf3KapPljO+O
 uWju3HnVtoEcV6YCBUrho8+uZm5qjE8oggcTXLzzgrzb4OzOIrwf3RfnxxnPYoym7PTbgGDDqCv
 Ev+o3/YrxQTD9A6ydZur6C18ZLRUz9SokEpx0p+KrHT6k7nLP4JGu9qDEWjtpiJO18Lmkdtv4wx
 KDyBtbLse6zROCdEJ6eTsp2PUdhxK3lgANAw+965RN6cCwIPWZ0QoGtdxvMbFlKiCAOGwmHnD/0
 LMTlzF8iSkZ8CITcxADOqNh9xfH5zpcK2sEV6TZTSW1eMjIZKcmvqCSH5vy5VObjdsIMstZVPv0
 iK7e9YgDm58GOlOhDBQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 phishscore=0 suspectscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602190164
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
	TAGGED_FROM(0.00)[bounces-16951-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:chleroy@kernel.org,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
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
X-Rspamd-Queue-Id: 348C2161B19
X-Rspamd-Action: no action



On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
> Currently the tick subsystem stores the idle cputime accounting in
> private fields, allowing cohabitation with architecture idle vtime
> accounting. The former is fetched on online CPUs, the latter on offline
> CPUs.
> 
> For consolidation purpose, architecture vtime accounting will continue
> to account the cputime but will make a break when the idle tick is
> stopped. The dyntick cputime accounting will then be relayed by the tick
> subsystem so that the idle cputime is still seen advancing coherently
> even when the tick isn't there to flush the idle vtime.
> 
> Prepare for that and introduce three new APIs which will be used in
> subsequent patches:
> 
> _ vtime_dynticks_start() is deemed to be called when idle enters in
>    dyntick mode. The idle cputime that elapsed so far is accumulated.
> 
> - vtime_dynticks_stop() is deemed to be called when idle exits from
>    dyntick mode. The vtime entry clocks are fast-forward to current time
>    so that idle accounting restarts elapsing from now.
> 
> - vtime_reset() is deemed to be called from dynticks idle IRQ entry to
>    fast-forward the clock to current time so that the IRQ time is still
>    accounted by vtime while nohz cputime is paused.
> 
> Also accumulated vtime won't be flushed from dyntick-idle ticks to avoid
> accounting twice the idle cputime, along with nohz accounting.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>

> ---
>   arch/powerpc/kernel/time.c | 41 ++++++++++++++++++++++++++++++++++++++
>   include/linux/vtime.h      |  6 ++++++
>   2 files changed, 47 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 4bbeb8644d3d..18506740f4a4 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -376,6 +376,47 @@ void vtime_task_switch(struct task_struct *prev)
>   		acct->starttime = acct0->starttime;
>   	}
>   }
> +
> +#ifdef CONFIG_NO_HZ_COMMON
> +/**
> + * vtime_reset - Fast forward vtime entry clocks
> + *
> + * Called from dynticks idle IRQ entry to fast-forward the clocks to current time
> + * so that the IRQ time is still accounted by vtime while nohz cputime is paused.
> + */
> +void vtime_reset(void)
> +{
> +	struct cpu_accounting_data *acct = get_accounting(current);
> +
> +	acct->starttime = mftb();

I figured out why those huge values happen.

This happens because mftb is from when the system is booted.
I was doing kexec to start the new kernel and mftb wasn't getting
reset.

I thought about this. This is concern for pseries too, where LPAR's
restart but system won't restart and mftb will continue to run instead of
reset.

I think we should be using sched_clock instead of mftb here.
Though we need it a few more places and some cosmetic changes around it.

Note: Some values being huge exists without series for few CPUs, with series it
shows up in most of the CPUs.

So I am planning send out fix below fix separately keeping your
series as dependency.

---
  arch/powerpc/include/asm/accounting.h |  4 ++--
  arch/powerpc/include/asm/cputime.h    | 14 +++++++-------
  arch/powerpc/kernel/time.c            | 22 +++++++++++-----------
  3 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/include/asm/accounting.h b/arch/powerpc/include/asm/accounting.h
index 6d79c31700e2..50f120646e6d 100644
--- a/arch/powerpc/include/asm/accounting.h
+++ b/arch/powerpc/include/asm/accounting.h
@@ -21,8 +21,8 @@ struct cpu_accounting_data {
  	unsigned long steal_time;
  	unsigned long idle_time;
  	/* Internal counters */
-	unsigned long starttime;	/* TB value snapshot */
-	unsigned long starttime_user;	/* TB value on exit to usermode */
+	unsigned long starttime;	/* Time value snapshot */
+	unsigned long starttime_user;	/* Time value on exit to usermode */
  #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
  	unsigned long startspurr;	/* SPURR value snapshot */
  	unsigned long utime_sspurr;	/* ->user_time when ->startspurr set */
diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
index aff858ca99c0..eb6b629b113f 100644
--- a/arch/powerpc/include/asm/cputime.h
+++ b/arch/powerpc/include/asm/cputime.h
@@ -20,9 +20,9 @@
  #include <asm/time.h>
  #include <asm/param.h>
  #include <asm/firmware.h>
+#include <linux/sched/clock.h>
  
  #ifdef __KERNEL__
-#define cputime_to_nsecs(cputime) tb_to_ns(cputime)
  
  /*
   * PPC64 uses PACA which is task independent for storing accounting data while
@@ -44,20 +44,20 @@
   */
  static notrace inline void account_cpu_user_entry(void)
  {
-	unsigned long tb = mftb();
+	unsigned long now = sched_clock();
  	struct cpu_accounting_data *acct = raw_get_accounting(current);
  
-	acct->utime += (tb - acct->starttime_user);
-	acct->starttime = tb;
+	acct->utime += (now - acct->starttime_user);
+	acct->starttime = now;
  }
  
  static notrace inline void account_cpu_user_exit(void)
  {
-	unsigned long tb = mftb();
+	unsigned long now = sched_clock();
  	struct cpu_accounting_data *acct = raw_get_accounting(current);
  
-	acct->stime += (tb - acct->starttime);
-	acct->starttime_user = tb;
+	acct->stime += (now - acct->starttime);
+	acct->starttime_user = now;
  }
  
  static notrace inline void account_stolen_time(void)
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 18506740f4a4..fb67cdae3bcb 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -215,7 +215,7 @@ static unsigned long vtime_delta(struct cpu_accounting_data *acct,
  
  	WARN_ON_ONCE(!irqs_disabled());
  
-	now = mftb();
+	now = sched_clock();
  	stime = now - acct->starttime;
  	acct->starttime = now;
  
@@ -299,9 +299,9 @@ static void vtime_flush_scaled(struct task_struct *tsk,
  {
  #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
  	if (acct->utime_scaled)
-		tsk->utimescaled += cputime_to_nsecs(acct->utime_scaled);
+		tsk->utimescaled += acct->utime_scaled;
  	if (acct->stime_scaled)
-		tsk->stimescaled += cputime_to_nsecs(acct->stime_scaled);
+		tsk->stimescaled += acct->stime_scaled;
  
  	acct->utime_scaled = 0;
  	acct->utime_sspurr = 0;
@@ -321,28 +321,28 @@ void vtime_flush(struct task_struct *tsk)
  	struct cpu_accounting_data *acct = get_accounting(tsk);
  
  	if (acct->utime)
-		account_user_time(tsk, cputime_to_nsecs(acct->utime));
+		account_user_time(tsk, acct->utime);
  
  	if (acct->gtime)
-		account_guest_time(tsk, cputime_to_nsecs(acct->gtime));
+		account_guest_time(tsk, acct->gtime);
  
  	if (IS_ENABLED(CONFIG_PPC_SPLPAR) && acct->steal_time) {
-		account_steal_time(cputime_to_nsecs(acct->steal_time));
+		account_steal_time(acct->steal_time);
  		acct->steal_time = 0;
  	}
  
  	if (acct->idle_time)
-		account_idle_time(cputime_to_nsecs(acct->idle_time));
+		account_idle_time(acct->idle_time);
  
  	if (acct->stime)
-		account_system_index_time(tsk, cputime_to_nsecs(acct->stime),
+		account_system_index_time(tsk, acct->stime,
  					  CPUTIME_SYSTEM);
  
  	if (acct->hardirq_time)
-		account_system_index_time(tsk, cputime_to_nsecs(acct->hardirq_time),
+		account_system_index_time(tsk, acct->hardirq_time,
  					  CPUTIME_IRQ);
  	if (acct->softirq_time)
-		account_system_index_time(tsk, cputime_to_nsecs(acct->softirq_time),
+		account_system_index_time(tsk, acct->softirq_time,
  					  CPUTIME_SOFTIRQ);
  
  	vtime_flush_scaled(tsk, acct);
@@ -388,7 +388,7 @@ void vtime_reset(void)
  {
  	struct cpu_accounting_data *acct = get_accounting(current);
  
-	acct->starttime = mftb();
+	acct->starttime = sched_clock();
  #ifdef CONFIG_ARCH_HAS_SCALED_CPUTIME
  	acct->startspurr = read_spurr(acct->starttime);
  #endif
-- 
2.43.0


