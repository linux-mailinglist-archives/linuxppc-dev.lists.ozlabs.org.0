Return-Path: <linuxppc-dev+bounces-17562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wOgPC8LDpmn3TQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17562-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 12:19:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A8231EDA45
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 12:19:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQCxR5ntGz3bnr;
	Tue, 03 Mar 2026 22:19:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772536763;
	cv=none; b=j88Ax6tdvDyFkX6yimdRqZzmqmVabD1W/TW8Ae5tvMrBMWHAQPn0OaZDcmCzaX04tdYIg+yYqPdjK2V16LjAmfULFIxdysdX3OrMa35fy6ETRFQLLeUrk5YctBsIIHvUqQMRauDei/1yaxVCN6Dce58FGlQw0TN44lypv0mxpRpo7/K0mdZOtKOJRgbAowaP9OlAiOd88LwvS002yg/wKbGYrpvkZnMJ2S2+kAWBEneBnOXSa3eU3cDsnjRNHKRhMh5hHlyv6+nIQ9tgQeDhU6gA0Ut5ZeDerDMegevD5BwWPtWWDWsTF7Y3jUf6k60FaTBMQSEByhRAWtZzOVmS4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772536763; c=relaxed/relaxed;
	bh=58Gi1BPEW+NhDXk+xEQWqKkDA5EIat7IWlQuy8hDA2g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n3wvVNmJzcJeHnKgFC4Ecaofge+KDnbxz+RRf12dtbDaDUrmWEdIfI9mYMJ3b5+BgQ0bY7hxAFBJl/cQ0cfO+Fr1sixYkcCI3Vhovr+JVq4rlTL3T6jPWD03vsi9IMeAJ2uDcjAtuHX6v+2ZPDovKFy60Y4kRjA7YEakh8ltpnOHb9bu4SINxadVbJRQTTuZJAWIPQdSYXiJx37az7Rh9Z3Ev108wGlm5MWHXQM56qonWSCT/XccuaFrEuZwuOerrfy8bJbnNf6pxeGX+7dq0BEGtOBB2xbItgmP7qz+adfKrOiugOLztSVIk5xSdLidIzYYE4qLNEmBwEUlNi0/OA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XOzAjF+E; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XOzAjF+E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQCxQ5Z7Tz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 22:19:22 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6237c0sP2459770;
	Tue, 3 Mar 2026 11:17:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=58Gi1B
	PEW+NhDXk+xEQWqKkDA5EIat7IWlQuy8hDA2g=; b=XOzAjF+Es70FI80cfcEf+B
	fah1NPhLCnmW8etxVT+6tx3qyCwMVEgO+uBTJJDzI56zu0LqIevzF6cOSXK5EYTP
	rymdtckQK0JKQIoMBV99Ixk3w+5HzrnIimQk8FKrOsZ2aMZHpdumg69e/9F8JOQH
	J5aeDN2g90zZ0ispJ6r6AKQr3SLrqgBI3ctH6R4rB1raTiVRY5gxcTB+RWP/wwB6
	S4Y4mpPecPp8skwz6eMdhIzBjdHXR4d1O+qDyNjTQqTTDRTozCOQAL6fcnH3BhQE
	GWsftk2v7eBrypjMp32cVPcmqGmVsAPx4flWN2TPlRJ5dDnlzWdUmAwgNdJ7wLoA
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ckssmje0u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 11:17:57 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6239aBUH003275;
	Tue, 3 Mar 2026 11:17:57 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cmb2y22vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 11:17:56 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623BHqaV50004294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 11:17:52 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C868F2004B;
	Tue,  3 Mar 2026 11:17:52 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 04E5D20043;
	Tue,  3 Mar 2026 11:17:46 +0000 (GMT)
Received: from [9.124.210.250] (unknown [9.124.210.250])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 11:17:45 +0000 (GMT)
Message-ID: <be30e259-a690-4530-996c-0c092833bb66@linux.ibm.com>
Date: Tue, 3 Mar 2026 16:47:45 +0530
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
Subject: Re: [PATCH 15/15] sched/cputime: Handle dyntick-idle steal time
 correctly
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
 <20260206142245.58987-16-frederic@kernel.org>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20260206142245.58987-16-frederic@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDA4NiBTYWx0ZWRfX9fy6pZQ8rl2U
 4JvSsUo8us4RFr+87x9HHqKuttkP4YFNr4o9dbZQ4JjvWNEmfVRS0g5h/xwci4zrWoFHJGYYHPL
 E7OC7KLmE8eU0eBgJu5raasJw/4Q5omRn237tfeRboTDr5jtblnz7OrwSeTgWx5bTIVLr3eKCv9
 oOY0jDa7w6DouUUTJoZhfy4l0K7K0rFUwFO9P8UIJgH3ETXQDgX0TZZHksIqEDRinQK4sOMqtZC
 tSEmgyOsJFDTZGW1YcteipRi/KlL0bhbVe6VcqujpcvVaXmq+6BIgrD+S9rEHkrw+Vlge6A65lx
 OjY9yqwtPx9yFyDY9sOAUEgfr07pf7wHoSYotmMYIg31aVi+jlPBhoRRDsuREunOfCP2qBjm+yS
 pIB7jIJNd4pKVEtRTqetk5LCJ4YDTPPQUpxGC9sBi3RqdMmMChwmlEEektjlwAkF0yloiMDzDoZ
 06jY+9gFfs0fuB1A7mw==
X-Proofpoint-ORIG-GUID: _t3s3NyLA8LzJG1-lGM_QRzy4Zn7pHmn
X-Proofpoint-GUID: eLgjsOmzuOTxGRUDfGjOCD-0P5c5EUkr
X-Authority-Analysis: v=2.4 cv=AobjHe9P c=1 sm=1 tr=0 ts=69a6c366 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=RzCfie-kr_QcCd8fBx8p:22 a=VwQbUJbxAAAA:8
 a=Y8yXDIHhMlYSrwm1qnwA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 spamscore=0 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030086
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 2A8231EDA45
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17562-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[sshegde@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
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
X-Rspamd-Action: no action



On 2/6/26 7:52 PM, Frederic Weisbecker wrote:
> The dyntick-idle steal time is currently accounted when the tick
> restarts but the stolen idle time is not substracted from the idle time
> that was already accounted. This is to avoid observing the idle time
> going backward as the dyntick-idle cputime accessors can't reliably know
> in advance the stolen idle time.
> 
> In order to maintain a forward progressing idle cputime while
> substracting idle steal time from it, keep track of the previously
> accounted idle stolen time and substract it from _later_ idle cputime
> accounting.
> 

s/substract/subtract ?

> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
> ---
>   include/linux/kernel_stat.h |  1 +
>   kernel/sched/cputime.c      | 21 +++++++++++++++------
>   2 files changed, 16 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
> index 512104b0ff49..24a54a6151ba 100644
> --- a/include/linux/kernel_stat.h
> +++ b/include/linux/kernel_stat.h
> @@ -39,6 +39,7 @@ struct kernel_cpustat {
>   	bool		idle_elapse;
>   	seqcount_t	idle_sleeptime_seq;
>   	u64		idle_entrytime;
> +	u64		idle_stealtime;
>   #endif
>   	u64		cpustat[NR_STATS];
>   };
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index 92fa2f037b6e..7e79288eb327 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -424,19 +424,25 @@ static inline void irqtime_account_process_tick(struct task_struct *p, int user_
>   static void kcpustat_idle_stop(struct kernel_cpustat *kc, u64 now)
>   {
>   	u64 *cpustat = kc->cpustat;
> -	u64 delta;
> +	u64 delta, steal, steal_delta;
>   
>   	if (!kc->idle_elapse)
>   		return;
>   
>   	delta = now - kc->idle_entrytime;
> +	steal = steal_account_process_time(delta);
>   
>   	write_seqcount_begin(&kc->idle_sleeptime_seq);
> +	steal_delta = min_t(u64, kc->idle_stealtime, delta);
> +	delta -= steal_delta;

I didn;t get this logic. Why do we need idle_stealtime?

Lets say 10ms was steal time and 50ms was delta. but idle_stealtime is
sum of past accumulated steal time. we only need to subtract steal time there no?

Shouldn't this be delta -= steal ?


> +	kc->idle_stealtime -= steal_delta;
> +
>   	if (nr_iowait_cpu(smp_processor_id()) > 0)
>   		cpustat[CPUTIME_IOWAIT] += delta;
>   	else
>   		cpustat[CPUTIME_IDLE] += delta;
>   
> +	kc->idle_stealtime += steal;
>   	kc->idle_entrytime = now;
>   	kc->idle_elapse = false;
>   	write_seqcount_end(&kc->idle_sleeptime_seq);
> @@ -460,7 +466,6 @@ void kcpustat_dyntick_stop(u64 now)
>   		kc->idle_dyntick = false;
>   		irqtime_dyntick_stop();
>   		vtime_dyntick_stop();
> -		steal_account_process_time(ULONG_MAX);
>   	}
>   }
>   
> @@ -505,10 +510,14 @@ static u64 kcpustat_field_dyntick(int cpu, enum cpu_usage_stat idx,
>   	do {
>   		seq = read_seqcount_begin(&kc->idle_sleeptime_seq);
>   
> -		if (kc->idle_elapse && compute_delta)
> -			idle = cpustat[idx] + (now - kc->idle_entrytime);
> -		else
> -			idle = cpustat[idx];
> +		idle = cpustat[idx];
> +
> +		if (kc->idle_elapse && compute_delta) {
> +			u64 delta = now - kc->idle_entrytime;
> +
> +			delta -= min_t(u64, kc->idle_stealtime, delta);
> +			idle += delta;
> +		}
>   	} while (read_seqcount_retry(&kc->idle_sleeptime_seq, seq));
>   
>   	return idle;


