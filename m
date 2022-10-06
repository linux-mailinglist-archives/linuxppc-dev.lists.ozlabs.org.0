Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D845F6CEC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 19:28:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjz110Fk9z3ds3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 04:28:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=my8zw6cp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=my8zw6cp;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjz034hXJz3c5p
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 04:27:15 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 296Gu0T2027351
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Oct 2022 17:27:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=C/CMXzI39lCt0xheu+Su9nVRshjjfK9gHa7hzwqoaoI=;
 b=my8zw6cpjom0/XJGPErq6dZLwBjRAb+pqViPdn+tCGCmky0XwHSRb3fUoe7iuOtlCoon
 xEPnWsnGAmBMJbXf/1/2er+Noq8Tgz3RZb8z2k15PGhbHOtkFRh1a0QBjghxnBtRSAEU
 H76EJR71h1e9JmxifhEAXE60WvXzI8RxoMzFYGctyRBpeuf+yVPtr72QMSG8ZlKEos7b
 YxVqibYQqH50bQw63gwEjqRJYZQLKkk82D9qz1W4Sp3gQ8rrin9f6AmeW0JDDnbuTAM2
 NbN8adAH2a8G0NbpyzsCVDn71efTHBqa0/cqbpmq9vlxVxVcORZ7PgvOlLCaVaMGDd5X tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k22yq8v80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 17:27:11 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 296GxfLC008742
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Oct 2022 17:27:11 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k22yq8v79-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 17:27:10 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 296HKVoU008551;
	Thu, 6 Oct 2022 17:27:09 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
	by ppma03ams.nl.ibm.com with ESMTP id 3jxd697eqa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Oct 2022 17:27:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 296HR6D554460774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Oct 2022 17:27:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D07194C046;
	Thu,  6 Oct 2022 17:27:06 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC4834C04A;
	Thu,  6 Oct 2022 17:27:06 +0000 (GMT)
Received: from [9.145.61.17] (unknown [9.145.61.17])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  6 Oct 2022 17:27:06 +0000 (GMT)
Message-ID: <4f8c2ab1-1189-9738-f457-a10935065279@linux.ibm.com>
Date: Thu, 6 Oct 2022 19:27:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.1
Subject: Re: [PATCH 11/17] powerpc/qspinlock: allow propagation of yield CPU
 down the queue
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-13-npiggin@gmail.com>
Content-Language: fr
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220728063120.2867508-13-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: X_SKUMaviNX7003uQ7QLYTwSLgy8HrHx
X-Proofpoint-ORIG-GUID: 76GbCScLWSqgc6ZxaHdqjuKNAk1_uSwE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-06_04,2022-10-06_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 lowpriorityscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 clxscore=1015
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2210060099
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28/07/2022 08:31:14, Nicholas Piggin wrote:
> Having all CPUs poll the lock word for the owner CPU that should be
> yielded to defeats most of the purpose of using MCS queueing for
> scalability. Yet it may be desirable for queued waiters to to yield
> to a preempted owner.
> 
> s390 addreses this problem by having queued waiters sample the lock
> word to find the owner much less frequently. In this approach, the
> waiters never sample it directly, but the queue head propagates the
> owner CPU back to the next waiter if it ever finds the owner has
> been preempted. Queued waiters then subsequently propagate the owner
> CPU back to the next waiter, and so on.
> 
> Disable this option by default for now, i.e., no logical change.
> ---
>  arch/powerpc/lib/qspinlock.c | 85 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 94f007f66942..28c85a2d5635 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -12,6 +12,7 @@
>  struct qnode {
>  	struct qnode	*next;
>  	struct qspinlock *lock;
> +	int		yield_cpu;
>  	u8		locked; /* 1 if lock acquired */
>  };
>  
> @@ -28,6 +29,7 @@ static int HEAD_SPINS __read_mostly = (1<<8);
>  static bool pv_yield_owner __read_mostly = true;
>  static bool pv_yield_allow_steal __read_mostly = false;
>  static bool pv_yield_prev __read_mostly = true;
> +static bool pv_yield_propagate_owner __read_mostly = true;
>  
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
>  
> @@ -257,13 +259,66 @@ static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u
>  	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
>  }
>  
> +static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int *set_yield_cpu, bool paravirt)
> +{
> +	struct qnode *next;
> +	int owner;
> +
> +	if (!paravirt)
> +		return;
> +	if (!pv_yield_propagate_owner)
> +		return;
> +
> +	owner = get_owner_cpu(val);
> +	if (*set_yield_cpu == owner)
> +		return;
> +
> +	next = READ_ONCE(node->next);
> +	if (!next)
> +		return;
> +
> +	if (vcpu_is_preempted(owner)) {
> +		next->yield_cpu = owner;
> +		*set_yield_cpu = owner;
> +	} else if (*set_yield_cpu != -1) {
> +		next->yield_cpu = owner;
> +		*set_yield_cpu = owner;
> +	}

This is bit confusing, the else branch is the same as the true one.
This might be written like this:

	if (vcpu_is_preempted(owner) || *set_yield_cpu != -1) {
		next->yield_cpu = owner;
		*set_yield_cpu = owner;
	}

> +}
> +
>  static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)
>  {
>  	u32 yield_count;
> +	int yield_cpu;
>  
>  	if (!paravirt)
>  		goto relax;
>  
> +	if (!pv_yield_propagate_owner)
> +		goto yield_prev;
> +
> +	yield_cpu = READ_ONCE(node->yield_cpu);
> +	if (yield_cpu == -1) {
> +		/* Propagate back the -1 CPU */
> +		if (node->next && node->next->yield_cpu != -1)
> +			node->next->yield_cpu = yield_cpu;
> +		goto yield_prev;
> +	}
> +
> +	yield_count = yield_count_of(yield_cpu);
> +	if ((yield_count & 1) == 0)
> +		goto yield_prev; /* owner vcpu is running */
> +
> +	smp_rmb();
> +
> +	if (yield_cpu == node->yield_cpu) {
> +		if (node->next && node->next->yield_cpu != yield_cpu)
> +			node->next->yield_cpu = yield_cpu;
> +		yield_to_preempted(yield_cpu, yield_count);
> +		return;
> +	}
> +

In the case that test is false, this means that the lock owner has probably
changed, why are we yeilding to the previous node instead of reading again
the node->yield_cpu, checking against -1 value etc..?
Yielding to the previous node is valid, but it might be better to yield to
the owner, isn't it?

> +yield_prev:
>  	if (!pv_yield_prev)
>  		goto relax;
>  
> @@ -337,6 +392,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	node = &qnodesp->nodes[idx];
>  	node->next = NULL;
>  	node->lock = lock;
> +	node->yield_cpu = -1;
>  	node->locked = 0;
>  
>  	tail = encode_tail_cpu();
> @@ -358,13 +414,21 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		while (!node->locked)
>  			yield_to_prev(lock, node, prev_cpu, paravirt);
>  
> +		/* Clear out stale propagated yield_cpu */
> +		if (paravirt && pv_yield_propagate_owner && node->yield_cpu != -1)
> +			node->yield_cpu = -1;

Why doing tests and not directly setting node->yield_cpu to -1?
Is the write operation more costly than the 3 tests?

> +
>  		smp_rmb(); /* acquire barrier for the mcs lock */
>  	}
>  
>  	if (!MAYBE_STEALERS) {
> +		int set_yield_cpu = -1;
> +
>  		/* We're at the head of the waitqueue, wait for the lock. */
> -		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL)
> +		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> +			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt, false);
> +		}
>  
>  		/* If we're the last queued, must clean up the tail. */
>  		if ((val & _Q_TAIL_CPU_MASK) == tail) {
> @@ -376,12 +440,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		/* We must be the owner, just set the lock bit and acquire */
>  		lock_set_locked(lock);
>  	} else {
> +		int set_yield_cpu = -1;
>  		int iters = 0;
>  		bool set_mustq = false;
>  
>  again:
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> +			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt,
>  					pv_yield_allow_steal && set_mustq);
>  
> @@ -540,6 +606,22 @@ static int pv_yield_prev_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_prev, pv_yield_prev_get, pv_yield_prev_set, "%llu\n");
>  
> +static int pv_yield_propagate_owner_set(void *data, u64 val)
> +{
> +	pv_yield_propagate_owner = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_yield_propagate_owner_get(void *data, u64 *val)
> +{
> +	*val = pv_yield_propagate_owner;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_propagate_owner, pv_yield_propagate_owner_get, pv_yield_propagate_owner_set, "%llu\n");
> +
>  static __init int spinlock_debugfs_init(void)
>  {
>  	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
> @@ -548,6 +630,7 @@ static __init int spinlock_debugfs_init(void)
>  		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
>  		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
>  		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
> +		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
>  	}
>  
>  	return 0;

