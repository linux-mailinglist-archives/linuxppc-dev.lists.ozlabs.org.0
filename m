Return-Path: <linuxppc-dev+bounces-17561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DURBQPCpmn3TQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 12:12:03 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C49571ED82D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 12:12:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQCmv17mSz3bnr;
	Tue, 03 Mar 2026 22:11:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772536319;
	cv=none; b=TfhYlKPkldTG0cuWAkNx6H8RX7+uMhqQy+7cxSbX3n0lIZgBr7nYH1EZzS8LC6tsPdY6d+F5HGGe+MZh6QfK9vj//AcaryEnnMIQYSZg4IBLl7xNu5ZZF14l2umqC95kb2GG212O5Zx5qrM8VK1pjAp6hqtQ+j/vPSdFtLsVCk9laP5FpvDGwRSBL8s+3cMLwxrHWjfkYdgP+75BhSVpHn/9R+6p9lKnefEhdBg9UpJSQi3PBbtUbRqE3ZIZJlCRSV7vz+KJ4NxssKWaFt8ophAKh+uXse4RBkeSzR/iigAC3cswxeJK8iYyowegKFidgTMmD8LQZrvdzAIxs8wi+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772536319; c=relaxed/relaxed;
	bh=5R7/8cd7xW9zkt0oSt0vLll879jI88nP5jlzNhGC1Go=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YsBJtbyeTVPEgZjle8ICcHXEFOpb5flNK3Y/Vc3Wm3ysmYYYJRPZFMC2/N0XvcvZMKWKuXo0GYU4fh0SVDM0QmQRsuNUIeXudHUN4+AVEjeyybbXOGP+r1m0YrsTTIBDyJBbJ998JvmRl2TKaY68OU4tuTzoBAAOYMZL6Ahv+dTutOCjAcRNHU9xnp1vBjzYLLtW3jEawkr3cenB+pOIgDY+PnLlPRlzYRtHkdvTvwooqpv9VENieu2wCJVTgrJ3rbba/HEsaLjyFQj6ROWhoCv1dpR6hsF7oEAjTxzV9x34iZe/1wmfUmBGEzYb0nJyA1Q81uVWwnUuu/Ym5k4s9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kn9C6wwl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kn9C6wwl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQCms1cwBz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 22:11:56 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6237FTXp2104794;
	Tue, 3 Mar 2026 11:11:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5R7/8c
	d7xW9zkt0oSt0vLll879jI88nP5jlzNhGC1Go=; b=kn9C6wwljog+hJvduGFq12
	v5wuELVOt/KFg6LCcm2DcHkP/eCRu9BJVKlQgBiIWyQr7u4kMkOhl8rIxOyKVC5Q
	nRvnCjjayux6BzxkwdnXWlSdqxGrPxr7vjx1cLhajMKOiLgGw9LVaNrolj6rzwe5
	Z4mUYUbxj5NTZlcpFKdGvaeWj3/XKiGFNXSIc7/YTeYS11QLPWzZooAwwJwtdPRb
	OcfAdpUCBArmB4eK/9GPfUJBcqLzt7Y9JKlASFuDvxEWv0ueygmdBeCt6XHcZ3/S
	+pP44VC0GCZn2TAPHXLHXoLQgfuUBKu4Cb7hSsQBqmEG3DsBddB2JLxBYQHxpk8A
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksjdanec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 11:11:31 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6235rGEt008791;
	Tue, 3 Mar 2026 11:11:30 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmdd19mrh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 11:11:29 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623BBQDV30998832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 11:11:26 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B22320043;
	Tue,  3 Mar 2026 11:11:26 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BA9B2004B;
	Tue,  3 Mar 2026 11:11:19 +0000 (GMT)
Received: from [9.124.210.250] (unknown [9.124.210.250])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 11:11:19 +0000 (GMT)
Message-ID: <415e925a-e9f0-40ad-9f53-263dd34dd2a9@linux.ibm.com>
Date: Tue, 3 Mar 2026 16:41:18 +0530
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
Subject: Re: [PATCH 14/15] sched/cputime: Handle idle irqtime gracefully
To: Frederic Weisbecker <frederic@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
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
 <20260206142245.58987-15-frederic@kernel.org>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20260206142245.58987-15-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M9BA6iws c=1 sm=1 tr=0 ts=69a6c1e3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VwQbUJbxAAAA:8
 a=WffY0ah0q7W8p7317v4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: iOvsbUvpvsRb0o9WyNLZDxuI7eo5f5b8
X-Proofpoint-GUID: t3Mj4QLPgnhluBsZ6V0TeElOuOBh_39W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NiBTYWx0ZWRfX+mA/8CnyaB72
 J71qrO5vFg7C1rSBMjcWXUpLpNxl0rhLe4+zS7kgyOPQ77xdvSeubvjU8C4WzKR/uEHRYPG0/O0
 RP/I9EY6x8si7M8fx7LWbzulq6gvqVt1IDBgKy9TgHZaIuG9qRXvU1NcTkVD52NzjAnR4srojvF
 0FnRJqZbNrPBSqForkgm16KTgfsnwcpKkr510yohyRmHQ1DzUle80iAIa1yzdXcxfSYcXJPHiH/
 QHE8CQrHNN26xBG2pXtrhOoO9DHWyOkbAZSr58XjhSHxSn6Oq/LUFlIx7x52l9IZZnbpS9TsmhJ
 Oe+e21fl7621RgwrAJsPwSmgOp+SkwMQVHyEpsLfwfNgNXYqb4jUuZ+K7MmRwCIfktbjAL8VyHL
 5AIwUIYGaOWi0uj5C1FGMiiE6/fcGfJQNBN4mxO/GQ0j60/2+IdHtx7OJWPvGMsoTnl9Cz/e7x+
 dVZkNLCWzSNvk+wXHJA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: C49571ED82D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17561-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FORGED_RECIPIENTS(0.00)[m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

Hi Frederic,

On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
> The dyntick-idle cputime accounting always assumes that IRQ time
> accounting is enabled and consequently stops elapsing the idle time
> during dyntick-idle IRQs.
> 
> This doesn't mix up well with disabled IRQ time accounting because then
> idle IRQs become a cputime blind-spot. Also this feature is disabled
> on most configurations and the overhead of pausing dyntick-idle
> accounting while in idle IRQs could then be avoided.
> 
> Fix the situation with conditionally pausing dyntick-idle accounting
> during idle IRQs only if neither native vtime (which does IRQ time
> accounting) nor generic IRQ time accounting are enabled.
> 
> Also make sure that the accumulated IRQ time is not accidentally
> substracted from later accounting.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   kernel/sched/cputime.c | 24 +++++++++++++++++++++---
>   kernel/sched/sched.h   |  1 +
>   2 files changed, 22 insertions(+), 3 deletions(-)
> 
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index d588a4a50e57..92fa2f037b6e 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -46,7 +46,8 @@ static void irqtime_account_delta(struct irqtime *irqtime, u64 delta,
>   	u64_stats_update_begin(&irqtime->sync);
>   	cpustat[idx] += delta;
>   	irqtime->total += delta;
> -	irqtime->tick_delta += delta;
> +	if (!irqtime->idle_dyntick)
> +		irqtime->tick_delta += delta;

Wouldn't kcpustat_idle_dyntick achieve the same thing?

>   	u64_stats_update_end(&irqtime->sync);
>   }
>   
> @@ -81,6 +82,16 @@ void irqtime_account_irq(struct task_struct *curr, unsigned int offset)
>   		irqtime_account_delta(irqtime, delta, CPUTIME_SOFTIRQ);
>   }
>   
> +static inline void irqtime_dyntick_start(void)
> +{
> +	__this_cpu_write(cpu_irqtime.idle_dyntick, true);
> +}
> +
> +static inline void irqtime_dyntick_stop(void)
> +{
> +	__this_cpu_write(cpu_irqtime.idle_dyntick, false);
> +}
> +
>   static u64 irqtime_tick_accounted(u64 maxtime)
>   {
>   	struct irqtime *irqtime = this_cpu_ptr(&cpu_irqtime);
> @@ -94,6 +105,9 @@ static u64 irqtime_tick_accounted(u64 maxtime)
>   
>   #else /* !CONFIG_IRQ_TIME_ACCOUNTING: */
>   
> +static inline void irqtime_dyntick_start(void) { }
> +static inline void irqtime_dyntick_stop(void) { }
> +
>   static u64 irqtime_tick_accounted(u64 dummy)
>   {
>   	return 0;
> @@ -444,6 +458,7 @@ void kcpustat_dyntick_stop(u64 now)
>   		WARN_ON_ONCE(!kc->idle_dyntick);
>   		kcpustat_idle_stop(kc, now);
>   		kc->idle_dyntick = false;
> +		irqtime_dyntick_stop();
>   		vtime_dyntick_stop();
>   		steal_account_process_time(ULONG_MAX);
>   	}
> @@ -455,6 +470,7 @@ void kcpustat_dyntick_start(u64 now)
>   
>   	if (!vtime_generic_enabled_this_cpu()) {
>   		vtime_dyntick_start();
> +		irqtime_dyntick_start();
>   		kc->idle_dyntick = true;
>   		kcpustat_idle_start(kc, now);
>   	}
> @@ -464,7 +480,8 @@ void kcpustat_irq_enter(u64 now)
>   {
>   	struct kernel_cpustat *kc = kcpustat_this_cpu;
>   
> -	if (!vtime_generic_enabled_this_cpu())
> +	if (!vtime_generic_enabled_this_cpu() &&
> +	    (irqtime_enabled() || vtime_accounting_enabled_this_cpu()))
>   		kcpustat_idle_stop(kc, now);
>   }
Scenario: context_tracking is not enabled(since nohz_full or isolcpus not specified) and
irqtime/native is not enabled. ( config is CONFIG_VIRT_CPU_ACCOUNTING_GEN + IRQ_TIME=n)


cpu goes into tickless mode. Gets irqs, but kcpustat_irq_enter/exit is nop.
Then the time it spent in irq is still accounted for idle time, during kcpustat_dyntick_stop?

Who is going to account the irq time in this case?

>   
> @@ -472,7 +489,8 @@ void kcpustat_irq_exit(u64 now)
>   {
>   	struct kernel_cpustat *kc = kcpustat_this_cpu;
>   
> -	if (!vtime_generic_enabled_this_cpu())
> +	if (!vtime_generic_enabled_this_cpu() &&
> +	    (irqtime_enabled() || vtime_accounting_enabled_this_cpu()))
>   		kcpustat_idle_start(kc, now);
>   }
>   
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index d30cca6870f5..cf677ff12b10 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -3307,6 +3307,7 @@ static inline void sched_core_tick(struct rq *rq) { }
>   #ifdef CONFIG_IRQ_TIME_ACCOUNTING
>   
>   struct irqtime {
> +	bool			idle_dyntick;
>   	u64			total;
>   	u64			tick_delta;
>   	u64			irq_start_time;


