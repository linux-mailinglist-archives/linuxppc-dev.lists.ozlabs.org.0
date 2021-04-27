Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E903F36C72E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 15:44:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FV2zv6GfLz30Bq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 23:44:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GOhxLeV6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GOhxLeV6; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FV2zR2BwBz2xfd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 23:43:46 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RDZpTr063682
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 09:43:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : subject :
 to : references : in-reply-to : mime-version : message-id : content-type :
 content-transfer-encoding; s=pp1;
 bh=BqwhvmyAKyyi4L11/2Tw1kcxtfbkYgn4aUr7JeBN/2g=;
 b=GOhxLeV6VQyGPI6Mic9WTSLLQUq9q89FDqRX9GtOTneXQEDgabOMbONRMb4TGz2SmdKg
 xBKQ+9lTXg9gy3A+OLHoyrVShcOhjSzlSuNwXzGw6XQzdSCkDReGri0f6CtlKMYjypGC
 xmKOHUVAWiaBLqLu0NVKL2CfPbUycxOMCK7nCUYHrm0YLpjMMUefwiCBFaZo4dQzEjVd
 xsZJKRvSTWkr9wpqcVipz1nOFHpseJHkI7Or++0rSIVVO3zaBwNo8X3iSQytndjKJNON
 CfZQRbzVvViUDjSJM9d3Mq1iiQDU8YQbN1oRggS9bAVfhotKL+VyQ+otlBModKzuC89M 8Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386hacwm50-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 09:43:42 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13RDZvpl064265
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 09:43:42 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386hacwm3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 09:43:42 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13RDTp6Z000924;
 Tue, 27 Apr 2021 13:43:39 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 384ay8rs56-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 13:43:39 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13RDhCCl37683542
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 13:43:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 362EFAE055;
 Tue, 27 Apr 2021 13:43:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 259DDAE04D;
 Tue, 27 Apr 2021 13:43:35 +0000 (GMT)
Received: from localhost (unknown [9.85.74.4])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 27 Apr 2021 13:43:34 +0000 (GMT)
Date: Tue, 27 Apr 2021 19:13:33 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/4] powerpc/pseries: Fix hcall tracing recursion in pv
 queued spinlocks
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
References: <20210423031108.1046067-1-npiggin@gmail.com>
 <20210423031108.1046067-2-npiggin@gmail.com>
In-Reply-To: <20210423031108.1046067-2-npiggin@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/v0.15-23-gcdc62b30 (https://github.com/astroidmail/astroid)
Message-Id: <1619529780.yjjzv9cw5m.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kkokDQ44qHZHq-FUVOoIZvBenjRGMYtl
X-Proofpoint-GUID: hcTewmivWxmT4PkTXQeFu49ka4GIRtit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_08:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 clxscore=1015 priorityscore=1501
 impostorscore=0 mlxscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104270098
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin wrote:
> The paravit queued spinlock slow path adds itself to the queue then
> calls pv_wait to wait for the lock to become free. This is implemented
> by calling H_CONFER to donate cycles.
>=20
> When hcall tracing is enabled, this H_CONFER call can lead to a spin
> lock being taken in the tracing code, which will result in the lock to
> be taken again, which will also go to the slow path because it queues
> behind itself and so won't ever make progress.
>=20
> An example trace of a deadlock:
>=20
>   __pv_queued_spin_lock_slowpath
>   trace_clock_global
>   ring_buffer_lock_reserve
>   trace_event_buffer_lock_reserve
>   trace_event_buffer_reserve
>   trace_event_raw_event_hcall_exit
>   __trace_hcall_exit
>   plpar_hcall_norets_trace
>   __pv_queued_spin_lock_slowpath
>   trace_clock_global
>   ring_buffer_lock_reserve
>   trace_event_buffer_lock_reserve
>   trace_event_buffer_reserve
>   trace_event_raw_event_rcu_dyntick
>   rcu_irq_exit
>   irq_exit
>   __do_irq
>   call_do_irq
>   do_IRQ
>   hardware_interrupt_common_virt
>=20
> Fix this by introducing plpar_hcall_norets_notrace(), and using that to
> make SPLPAR virtual processor dispatching hcalls by the paravirt
> spinlock code.
>=20
> Fixes: 20c0e8269e9d ("powerpc/pseries: Implement paravirt qspinlocks for =
SPLPAR")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/hvcall.h       |  3 +++
>  arch/powerpc/include/asm/paravirt.h     | 22 +++++++++++++++++++---
>  arch/powerpc/platforms/pseries/hvCall.S | 10 ++++++++++
>  arch/powerpc/platforms/pseries/lpar.c   |  4 ++--
>  4 files changed, 34 insertions(+), 5 deletions(-)

Thanks for the fix! Some very minor nits below, but none the less:
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>

>=20
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm=
/hvcall.h
> index ed6086d57b22..0c92b01a3c3c 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -446,6 +446,9 @@
>   */
>  long plpar_hcall_norets(unsigned long opcode, ...);
>=20
> +/* Variant which does not do hcall tracing */
> +long plpar_hcall_norets_notrace(unsigned long opcode, ...);
> +
>  /**
>   * plpar_hcall: - Make a pseries hypervisor call
>   * @opcode: The hypervisor call to make.
> diff --git a/arch/powerpc/include/asm/paravirt.h b/arch/powerpc/include/a=
sm/paravirt.h
> index 5d1726bb28e7..3c13c2ec70a9 100644
> --- a/arch/powerpc/include/asm/paravirt.h
> +++ b/arch/powerpc/include/asm/paravirt.h
> @@ -30,17 +30,33 @@ static inline u32 yield_count_of(int cpu)
>=20
>  static inline void yield_to_preempted(int cpu, u32 yield_count)
>  {

It looks like yield_to_preempted() is only used by simple spin locks=20
today. I wonder if it makes more sense to put the below comment in=20
yield_to_any() which is used by the qspinlock code.

> -	plpar_hcall_norets(H_CONFER, get_hard_smp_processor_id(cpu), yield_coun=
t);
> +	/*
> +	 * Spinlock code yields and prods, so don't trace the hcalls because
> +	 * tracing code takes spinlocks which could recurse.
> +	 *
> +	 * These calls are made while the lock is not held, the lock slowpath
> +	 * yields if it can not acquire the lock, and unlock slow path might
> +	 * prod if a waiter has yielded). So this did not seem to be a problem
> +	 * for simple spin locks because technically it didn't recuse on the
							       ^^^^^^
							       recurse

> +	 * lock. However the queued spin lock contended path is more strictly
> +	 * ordered: the H_CONFER hcall is made after the task has queued itself
> +	 * on the lock, so then recursing on the lock will queue up behind that
> +	 * (or worse: queued spinlocks uses tricks that assume a context never
> +	 * waits on more than one spinlock, so that may cause random
> +	 * corruption).
> +	 */
> +	plpar_hcall_norets_notrace(H_CONFER,
> +				   get_hard_smp_processor_id(cpu), yield_count);

This can all be on a single line.


- Naveen

