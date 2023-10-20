Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDFB7D0C4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 11:51:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jvS6GAJN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBfx45xCRz3vXm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 20:51:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jvS6GAJN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBfw75mCLz3cC9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 20:50:31 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39K9TwPY012894
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 09:50:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=dXlUDOP0f6ntkK0NeZOCDGDoxGQsfPtB7YVTcAPKd8c=;
 b=jvS6GAJNC/Uy7oqkW0TSuuwImhAqctCqPNQhXvVJsT79DuegcHUhp+okwCVIxMQXrwtB
 p10eNu3jVrrTm6f1dc7UHyKxkQRPvHHwMDZTR7kJnqxOMie2pODAQzcJpUwEXzvIv2fR
 U0QwBTbQ8P0Beg7GPnnhWaXsmnp+ihKzFulkxcjsR/HbHZgSBO1QEkwsJgVlg5ipqNWK
 e1PXrBf1Nyn2r4wtBit1mXvNzC/oSHzAiOo8PPxku+62MzkAEzzAJIawOREiXJN7COTK
 6SP/gBI9ru6YCEpiDN7QdZ1uPuHefjq9WOSB6zJ+U9FBzm/E6EPmsXstr5wdGQbEHOyz mg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tupydgjm9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 09:50:28 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39K9gd6F020913
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 09:50:28 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tupydgjm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 09:50:27 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39K99fWE002724;
	Fri, 20 Oct 2023 09:50:27 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc44bqwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 09:50:27 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39K9oP1D12387052
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Oct 2023 09:50:25 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0E272004B;
	Fri, 20 Oct 2023 09:50:24 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8EA4620040;
	Fri, 20 Oct 2023 09:50:24 +0000 (GMT)
Received: from localhost (unknown [9.195.39.224])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Oct 2023 09:50:24 +0000 (GMT)
Date: Fri, 20 Oct 2023 15:20:23 +0530
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/6] powerpc/qspinlock: stop queued waiters trying to set
 lock sleepy
Message-ID: <20231020095023.GA213288@li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com>
References: <20231016124305.139923-1-npiggin@gmail.com>
 <20231016124305.139923-3-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016124305.139923-3-npiggin@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bU54cxaHOFFut-kUB2Sp6-KodWb714G7
X-Proofpoint-GUID: m_PJhkguqvNY0SwuqWxZnZWsEdT8pFPA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_07,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 clxscore=1011 mlxlogscore=759 phishscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 adultscore=0
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310200079
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
Cc: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 16, 2023 at 10:43:01PM +1000, Nicholas Piggin wrote:
> If a queued waiter notices the lock owner or the previous waiter has
> been preempted, it attempts to mark the lock sleepy, but it does this
> as a try-set operation using the original lock value it got when
> queueing, which will become stale as the queue progresses, and the
> try-set will fail. Drop this and just set the sleepy seen clock.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/lib/qspinlock.c | 24 ++++++++++--------------
>  1 file changed, 10 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 6dd2f46bd3ef..75608ced14c2 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -247,22 +247,18 @@ static __always_inline void seen_sleepy_lock(void)
>  		this_cpu_write(sleepy_lock_seen_clock, sched_clock());
>  }
>  
> -static __always_inline void seen_sleepy_node(struct qspinlock *lock, u32 val)
> +static __always_inline void seen_sleepy_node(void)
>  {
>  	if (pv_sleepy_lock) {
>  		if (pv_sleepy_lock_interval_ns)
>  			this_cpu_write(sleepy_lock_seen_clock, sched_clock());
> -		if (val & _Q_LOCKED_VAL) {
> -			if (!(val & _Q_SLEEPY_VAL))
> -				try_set_sleepy(lock, val);
> -		}
> +		/* Don't set sleepy because we likely have a stale val */
>  	}
>  }

seen_sleepy_lock() and seen_sleepy_node() are now the same

>  
> -static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
> +static struct qnode *get_tail_qnode(struct qspinlock *lock, int prev_cpu)
>  {
> -	int cpu = decode_tail_cpu(val);
> -	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, cpu);
> +	struct qnodes *qnodesp = per_cpu_ptr(&qnodes, prev_cpu);
>  	int idx;
>  
>  	/*
> @@ -381,9 +377,8 @@ static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int
>  }
>  
>  /* Called inside spin_begin() */
> -static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *node, u32 val, bool paravirt)
> +static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
>  {
> -	int prev_cpu = decode_tail_cpu(val);
>  	u32 yield_count;
>  	int yield_cpu;
>  	bool preempted = false;
> @@ -412,7 +407,7 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
>  	spin_end();
>  
>  	preempted = true;
> -	seen_sleepy_node(lock, val);
> +	seen_sleepy_node();
>  
>  	smp_rmb();
>  
> @@ -436,7 +431,7 @@ static __always_inline bool yield_to_prev(struct qspinlock *lock, struct qnode *
>  	spin_end();
>  
>  	preempted = true;
> -	seen_sleepy_node(lock, val);
> +	seen_sleepy_node();
>  
>  	smp_rmb(); /* See __yield_to_locked_owner comment */
>  
> @@ -587,7 +582,8 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	 * head of the waitqueue.
>  	 */
>  	if (old & _Q_TAIL_CPU_MASK) {
> -		struct qnode *prev = get_tail_qnode(lock, old);
> +		int prev_cpu = decode_tail_cpu(old);
> +		struct qnode *prev = get_tail_qnode(lock, prev_cpu);
>  
>  		/* Link @node into the waitqueue. */
>  		WRITE_ONCE(prev->next, node);
> @@ -597,7 +593,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		while (!READ_ONCE(node->locked)) {
>  			spec_barrier();
>  
> -			if (yield_to_prev(lock, node, old, paravirt))
> +			if (yield_to_prev(lock, node, prev_cpu, paravirt))
>  				seen_preempted = true;
>  		}
>  		spec_barrier();
> -- 
> 2.42.0
> 
