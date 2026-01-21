Return-Path: <linuxppc-dev+bounces-16105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qErjAdvRcGkOaAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16105-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 14:17:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E9C576B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jan 2026 14:17:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dx4V81Z8Qz2yFg;
	Thu, 22 Jan 2026 00:17:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769001424;
	cv=none; b=Pr/m9M1smJKzrWVHiTaI0Fr98/l3sNyb37IhEmnJhOW1byOUD/GMbisYzK2wwHJwIEGlCvyBpNvx38p9msSiOH7/LlD8PYsZ3yVI4aYoc/s1pIKZsPZEDfSNO7E4d9CzXrRjujO0ZYllU12brISXxOZZBv3+/fsWfrm8I6gwawWsuifYdT4z8Xxvtj9hEZJQf9lgZCCn7/8DmSl6JxHtmibuOqNUElBJ/qkTG+Ha+sN6vfX6k6ygXvbrOeaLLIG1k5wr+f8Cht15p0L0MP79VzwbC5z9qmKvC3tzp2xt/iNtiO2ZVSzlGrWfZjatqjaBOZGwwfevJZ2gmeED4Yx1Rw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769001424; c=relaxed/relaxed;
	bh=SSHc8rNHSFQIqufuQ00BO+yiuuLDn3Q7FpAC5GvBRfI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YJWanJ70A6kTnqUq0znF13OUdLmw7pSVQc4NeoYKgHe3BsDpV4UpUBND9RiFMi4IPdZdH//neFjsPGb7sD5Qe0aHEyTP5G3dT9bbfTUwIXXgL698y8PimP1K0QkcwUfX8va3TkFMwwGEfBQy7dkHkC+XUoEqNPz3P+eE4EuNutoO17DMeUrOkCuwj7vHddFpbP3bhAsk+4oQbbmc/H/Mw0pmXaJjqBhrZWSYQSiOgHkE3E1wPBUuQ3VxV463neRttLWiarKRLqO1Dt6cAh/AW8CEdC+CRZCIe0ZLCVeDUSit5AKvQzvkpdVk676cFKRmuNXu4dZl2MYm+EMPsJO8ig==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CIUNl8BE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CIUNl8BE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dx4V65W2qz2xpk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Jan 2026 00:17:02 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60L0VbIW020940;
	Wed, 21 Jan 2026 12:17:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=SSHc8rNHSFQIqufuQ00BO+yiuuLDn3
	Q7FpAC5GvBRfI=; b=CIUNl8BEsPFbzX+lw6/2mACDxBDifX+KbzA2rEdGVb9ASC
	0X27EQdynzSa3jBd/CfUpzZoCJDOOOWJuV//lUYTyg/1TRxx5majL39LXNezeDJ8
	kQcFXDop0PLEW126UG/NmLu+HJl29A2QwNwCz+YbpM7MS80DBtjAhXMZFT3IbYK7
	a+TiB6ntpNWbEGoGdAlFGg8v19tTvAp5g2fL9wX3J4HDZr1lKPjIs5L0Hl467T1j
	3hI2MOgez+UltHPpmuX4yps7IZ5u9xTa4S+umRghz6bTAAOET1hbOywIbO22sgGu
	WuS2YEaBurnzXgWDVqXb8FjqeNofZSBwHUfF+jww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br0ufjvr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 12:17:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60LCFvs2031972;
	Wed, 21 Jan 2026 12:17:55 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br0ufjvr1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 12:17:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60LB52Zo009295;
	Wed, 21 Jan 2026 12:17:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4brp8kbqtd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Jan 2026 12:17:54 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60LCHo6f51708412
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Jan 2026 12:17:50 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 529B120043;
	Wed, 21 Jan 2026 12:17:50 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D127720040;
	Wed, 21 Jan 2026 12:17:49 +0000 (GMT)
Received: from osiris (unknown [9.52.214.206])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 21 Jan 2026 12:17:49 +0000 (GMT)
Date: Wed, 21 Jan 2026 13:17:48 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ingo Molnar <mingo@redhat.com>, Jan Kiszka <jan.kiszka@siemens.com>,
        Joel Fernandes <joelagnelf@nvidia.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Kieran Bingham <kbingham@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
        Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
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
Subject: Re: [PATCH 05/15] s390/time: Prepare to stop elapsing in
 dynticks-idle
Message-ID: <20260121121748.9719Bab-hca@linux.ibm.com>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-6-frederic@kernel.org>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116145208.87445-6-frederic@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4dp3fud74MN0mKdk4Vb2hrDyxWmL7L-f
X-Proofpoint-ORIG-GUID: uWfZYWtb_gOtkqw0ik-_HqLB8BLcrAKJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIxMDEwMyBTYWx0ZWRfX4z/dW1y0Q/Hd
 EFIZs+4cm6/dy3v0Odb0kj5kmHTUZTltobqWC9UybC2DocWdzHfttH0iyqFOk/VsjYKaZng0Aaa
 HPEgeEzFGCLiVQhsUwQb+O8Gk95ol4S55n7EY89gvXyRw0dkK+IPZTM8CXpqfphb3Rjm8RZSoNb
 3h83Kawj1VeypKnpJcnPuWyak2coszL8WCgpJ/fzM19i3In3R6ErJkO1qEh9OABDLLW64qB3Yn8
 OAfAaQwkAIZqB5Q6JxC0p4PEbaqMzrZPIlb+f3V8k6YymA1h7/sWfzPMoFsY0JMPc2zJ0f9Il90
 Bf/OmORw5AaE87qhmayZVR0j/c1p+AEt5eavs/1AyuIxm4Rrl0prDah+NpZQ6z+4tWwwvp0eErJ
 JjLZV3Qa3wcA7B+0f0AAcWE0FaEtGFiTNuRgKmFDgZUySeSjU2VuEb/WVkMgQNuNSARf7p6g3Tg
 ulW9/72BDr/n6XWV3CQ==
X-Authority-Analysis: v=2.4 cv=bopBxUai c=1 sm=1 tr=0 ts=6970c3f4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=hVwK31ck3tplLBhVBggA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-21_01,2026-01-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601210103
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16105-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:frederic@kernel.org,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[34];
	RCVD_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 78E9C576B5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, Jan 16, 2026 at 03:51:58PM +0100, Frederic Weisbecker wrote:
> diff --git a/arch/s390/kernel/idle.c b/arch/s390/kernel/idle.c
> index 39cb8d0ae348..54bb932184dd 100644
> --- a/arch/s390/kernel/idle.c
> +++ b/arch/s390/kernel/idle.c
> @@ -35,6 +35,12 @@ void account_idle_time_irq(void)
>  			this_cpu_add(mt_cycles[i], cycles_new[i] - idle->mt_cycles_enter[i]);
>  	}
>  
> +	WRITE_ONCE(idle->idle_count, READ_ONCE(idle->idle_count) + 1);
> +
> +	/* Dyntick idle time accounted by nohz/scheduler */
> +	if (idle->idle_dyntick)
> +		return;
> +
>  	idle_time = lc->int_clock - idle->clock_idle_enter;
>  
>  	lc->steal_timer += idle->clock_idle_enter - lc->last_update_clock;
> @@ -45,7 +51,6 @@ void account_idle_time_irq(void)
>  
>  	/* Account time spent with enabled wait psw loaded as idle time. */
>  	WRITE_ONCE(idle->idle_time, READ_ONCE(idle->idle_time) + idle_time);
> -	WRITE_ONCE(idle->idle_count, READ_ONCE(idle->idle_count) + 1);
>  	account_idle_time(cputime_to_nsecs(idle_time));
>  }

This breaks idle time reporting (aka enabled wait psw time) via the per-cpu
sysfs files (see show_idle_time()). That is: the second WRITE_ONCE() should
also go above the early return statement; but of course this leads to other
dependencies...

Not sure what to do with this. I thought about removing those sysfs files
already in the past, since they are of very limited use; and most likely
nothing in user space would miss them.

Anyway, you need to integrate the trivial patch below, so everything compiles
for s390. It also _seems_ to work.

Guess I need to spend some more time on accounting and see what it would take
to convert to VIRT_CPU_ACCOUNTING_GEN, while keeping the current precision and
functionality.

diff --git a/arch/s390/include/asm/idle.h b/arch/s390/include/asm/idle.h
index 2770c4f761e1..285b3da318d6 100644
--- a/arch/s390/include/asm/idle.h
+++ b/arch/s390/include/asm/idle.h
@@ -8,6 +8,7 @@
 #ifndef _S390_IDLE_H
 #define _S390_IDLE_H
 
+#include <linux/percpu-defs.h>
 #include <linux/types.h>
 #include <linux/device.h>
 
@@ -20,6 +21,8 @@ struct s390_idle_data {
 	unsigned long	mt_cycles_enter[8];
 };
 
+DECLARE_PER_CPU(struct s390_idle_data, s390_idle);
+
 extern struct device_attribute dev_attr_idle_count;
 extern struct device_attribute dev_attr_idle_time_us;
 
diff --git a/arch/s390/kernel/idle.c b/arch/s390/kernel/idle.c
index 54bb932184dd..e3fe64e7adbe 100644
--- a/arch/s390/kernel/idle.c
+++ b/arch/s390/kernel/idle.c
@@ -19,7 +19,7 @@
 #include <asm/smp.h>
 #include "entry.h"
 
-static DEFINE_PER_CPU(struct s390_idle_data, s390_idle);
+DEFINE_PER_CPU(struct s390_idle_data, s390_idle);
 
 void account_idle_time_irq(void)
 {

