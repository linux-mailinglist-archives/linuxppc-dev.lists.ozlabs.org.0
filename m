Return-Path: <linuxppc-dev+bounces-16940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sE8+MI0DlmlFYQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16940-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 19:23:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B78158AC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 19:23:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fGPyJ6Kpbz2xlq;
	Thu, 19 Feb 2026 05:23:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771438984;
	cv=none; b=FSI14WQkUZcJauQKOclaTKYvKbJNme5CmeUm3PZgwVSV+cvItHLypPN1c8Drq/kGUp+GTuaw2P40l6EWuXCbedeA/UoSm6FTYLiTH6vyEg3gmbAz2yWIiir+QcRVkCrLm6MriHt4cUfXlA5yJVmSShJ4Gvqxf7egUZ3oK4BxE1GIukEYBuw/QAhHTq8d1fOOqq+ESlS42KiR1+fki7bwoFInPbbQOrfoCOTkH/hl65wf9G5Kwqu2PF+VJjpBQojGr5NojdPwiGsU6hJLlOaLpL3BD655Mc5r9D60salEhBRZdUkhJk/Y5wFTWkbyFzBGyKHPr+b3+8/Ji+m/4x2Tlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771438984; c=relaxed/relaxed;
	bh=0NPWXcFnDOyF2XkV+Rxo1cDo2IfbAk+Luw7jV18Rj/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JRojBzlgFnL9H8dOKADXiCOdB9CQaWE9TtzKmZLG2zOCmOUtLQOfW0ineF531O82hOPk+rpeQ3qeMUrD5MePGc2Dfd0gBTAqUIUcQmn75VBxHOhD6lxB45DO8CNZX0g2AlyTPO/BRDAx6wEWZz0+w+o4yZKo0pvn7y90Hj8cRkb8T21nUHLEqUHdn5ZzITRYHVRxeJviWrpT+X8tltC6m4iPIxWsxEuz3Mjmr1pqmqqTr+Tu6vXokLasppFpBV7v1HxNabcOQJxM/tRjGY1iQKN06ENlQWPJWZ0PbmtKK3DoxCwj8savvj+czNFdWbOsfUDjcjKJFLTaA9XF74yFpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dZSttBme; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dZSttBme;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fGPyH5Nxhz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Feb 2026 05:23:03 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61I69h8C3354314;
	Wed, 18 Feb 2026 18:22:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0NPWXc
	FnDOyF2XkV+Rxo1cDo2IfbAk+Luw7jV18Rj/U=; b=dZSttBmeyn0rgoRLmT9MW5
	RfxeQ20a7Z1JlJpekhxW/KrES0KvhHUozMNOLpaY+b1YE81cIq/elsLZQKqaB7RL
	5B5lM40oC5OBu/IlXsDHmZIqT1euMdrEdWeaDv4b4jqKFFOErauw0o9O+vZbfySA
	WSOiefu3ETCipTeyuP48ZSUW269UimsV0B6W1Nxv2YPhx/PITemnt59g3sho95WV
	GGzzbBSoL/Eq5T2xHwGGtxmEt09gKc4pDY18VdrW/Hu/DA9EoY0CNzOYPApH3Rpo
	ywv9h7owfgC3zbLC5DuMosIt7tot+uGGteXO1vGOe07uRfQpcxRdksGpLgB0Fxrg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj4khh2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 18:22:42 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61IHSK5w023899;
	Wed, 18 Feb 2026 18:22:41 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb45916w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 18:22:41 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61IIMbOx24707830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 18:22:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA9832004B;
	Wed, 18 Feb 2026 18:22:37 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1B9420043;
	Wed, 18 Feb 2026 18:22:27 +0000 (GMT)
Received: from [9.111.93.209] (unknown [9.111.93.209])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Feb 2026 18:22:27 +0000 (GMT)
Message-ID: <8fee8933-1b27-41f2-b198-45a2d1390e70@linux.ibm.com>
Date: Wed, 18 Feb 2026 23:52:26 +0530
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
Subject: Re: [PATCH 01/15] sched/idle: Handle offlining first in idle loop
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
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
        Kieran Bingham <kbingham@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
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
 <20260206142245.58987-2-frederic@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260206142245.58987-2-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDE1NSBTYWx0ZWRfX4BHUtWXNKtVg
 3KkYKoHQGksJGb5a85dTZyKSuB1eQjs2W65mF88ZJ/Lga6//SaoNXf00GorPbK5iYBjIBVAO8Uc
 Nl7ohDKnr0l4koacb0Yaqfz94dm3JPRCJ7st9LyQ/IiPpfI/gf9hmdAC13VRJSoEgg0FsIpd/qg
 /6tWZa1uQbzyQZb3UiXy5ei1dXy0MX1eAhdf39ufbGcoYyIE7IXuoRemV9vcpaFY/i9WiWNVVhK
 jVoOnBpQU80AKME8VbYT1e1nn+bpBT8bguJ6wThSzkrQvnWLi+j1cnI9YqBOQ/UMkiNHuR71abf
 gicMz5PSh0mI19k7Gd785eYJoBFpn7AP6LYPYPfsszV5dY+cBI+DQz+OkZMz1t+9JTfcWbUSEO+
 4cNDo1UpiXuA5njoL84nNBYbWTMA6SO29O/RQo2MGUo5w8WLQ6lFT7FCjBFguPcO5zEMyc6PPt9
 Vc1AQLFwyBGdrzDTXrw==
X-Proofpoint-ORIG-GUID: B1NrpVy1KPkVC7VW6YlK3OnaFYL4hO7q
X-Proofpoint-GUID: IhRE2r75_C8EqT2m1I81Y2_I-sw0Vcda
X-Authority-Analysis: v=2.4 cv=M7hA6iws c=1 sm=1 tr=0 ts=69960373 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=M70JiF8069jlCNdMrNkA:9 a=QEXdDO2ut3YA:10
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16940-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: C6B78158AC5
X-Rspamd-Action: no action



On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
> Offline handling happens from within the inner idle loop,
> after the beginning of dyntick cputime accounting, nohz idle
> load balancing and TIF_NEED_RESCHED polling.
> 
> This is not necessary and even buggy because:
> 
> * There is no dyntick handling to do. And calling tick_nohz_idle_enter()
>    messes up with the struct tick_sched reset that was performed on
>    tick_sched_timer_dying().
> 
> * There is no nohz idle balancing to do.
> 
> * Polling on TIF_RESCHED is irrelevant at this stage, there are no more
>    tasks allowed to run.
> 
> * No need to check if need_resched() before offline handling since
>    stop_machine is done and all per-cpu kthread should be done with
>    their job.
> 
> Therefore move the offline handling at the beginning of the idle loop.
> This will also ease the idle cputime unification later by not elapsing
> idle time while offline through the call to:
> 
> 	tick_nohz_idle_enter() -> tick_nohz_start_idle()
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>


Makes sense to call it outside the loop.
Once you report idle is dead, there is nothing to do that CPU.

Reviewed-by: Shrikanth Hegde<sshegde@linux.ibm.com>


> ---
>   kernel/sched/idle.c | 13 ++++++++-----
>   1 file changed, 8 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index c174afe1dd17..51764cbec6f3 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -260,6 +260,14 @@ static void do_idle(void)
>   {
>   	int cpu = smp_processor_id();
>   
> +	if (cpu_is_offline(cpu)) {
> +		local_irq_disable();
> +		/* All per-CPU kernel threads should be done by now. */
> +		WARN_ON_ONCE(need_resched());
> +		cpuhp_report_idle_dead();
> +		arch_cpu_idle_dead();
> +	}
> +
>   	/*
>   	 * Check if we need to update blocked load
>   	 */
> @@ -311,11 +319,6 @@ static void do_idle(void)
>   		 */
>   		local_irq_disable();
>   
> -		if (cpu_is_offline(cpu)) {
> -			cpuhp_report_idle_dead();
> -			arch_cpu_idle_dead();
> -		}
> -
>   		arch_cpu_idle_enter();
>   		rcu_nocb_flush_deferred_wakeup();
>   


