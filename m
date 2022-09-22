Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E9645E665E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 17:03:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYJSQ0tVcz3cDs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 01:03:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rZzUT7K9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rZzUT7K9;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYJRg5K1Dz3023
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 01:02:39 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MEml28031381
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 15:02:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=BeTnncwQ1qC7mZXCfkeGvVz2m6XI0C7Yo0MEB3XM43M=;
 b=rZzUT7K9GKFlw+zPKCyyD6tW61cVbq1h2RFufNcsiPy4JxzEDflP9Ysdp+PiLpWNQAmk
 4Aan01WWJFUyEX4LYZmCJCxqSZbb/LlTM1OYgk8nQOri5/Nz+QxRIx3ZeVNOZmcIv54h
 hAn8CFCsZ389g/ab/7MWsN9fNQ4L0/RQCV37dcSOdJnBaJoHauZiP/tkrSp3iucpavBf
 FePwYIxmC7LW4NUuE4bxcfKRyJGFmNU/MDE644ztplNpaurJPVEpn3X68pn6w9mzMu2u
 kf0x7jbslX4MKhoIYwwMK5x8qMSqH36q5ziJouXyZR7UuEvxp/TtRYISeYHRHihbbD6y qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrst3gg97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 15:02:35 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28MEmxLv032112
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 15:02:35 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrst3gg80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 15:02:35 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28MEpmxZ016090;
	Thu, 22 Sep 2022 15:02:33 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04fra.de.ibm.com with ESMTP id 3jn5v953en-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 15:02:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28MEwS5B34406888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Sep 2022 14:58:28 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D8B665204E;
	Thu, 22 Sep 2022 15:02:30 +0000 (GMT)
Received: from [9.145.162.204] (unknown [9.145.162.204])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id C0D9F5204F;
	Thu, 22 Sep 2022 15:02:30 +0000 (GMT)
Message-ID: <5b1ed668-15f2-414d-b491-b1677a6b5537@linux.ibm.com>
Date: Thu, 22 Sep 2022 17:02:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH 16/17] powerpc/qspinlock: allow indefinite spinning on a
 preempted owner
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220728063120.2867508-1-npiggin@gmail.com>
 <20220728063120.2867508-18-npiggin@gmail.com>
Content-Language: fr
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220728063120.2867508-18-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: d1mU-t0pQv_GcEnK0i2IbAcV6yjvxHBX
X-Proofpoint-GUID: RLoDPsKTegF4skhMcwLqakk02UdMuTVr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_08,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=950
 lowpriorityscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 bulkscore=0 mlxscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220096
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

On 28/07/2022 08:31:19, Nicholas Piggin wrote:
> Provide an option that holds off queueing indefinitely while the lock
> owner is preempted. This could reduce queueing latencies for very
> overcommitted vcpu situations.
> 
> This is disabled by default.

Hi Nick,

I should have missed something here.

If this option is turned on, CPU trying to lock when there is a preempted
owner will spin checking the lock->val and yielding the lock owner CPU.
Am I right?

If yes, why not being queued and spin checking its own value, yielding
against the lock owner CPU? This will generate less cache bouncing, which
is what the queued spinlock is trying to address, isn't it?

Thanks,
Laurent.

> ---
>  arch/powerpc/lib/qspinlock.c | 91 +++++++++++++++++++++++++++++++-----
>  1 file changed, 79 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 24f68bd71e2b..5cfd69931e31 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -35,6 +35,7 @@ static int HEAD_SPINS __read_mostly = (1<<8);
>  
>  static bool pv_yield_owner __read_mostly = true;
>  static bool pv_yield_allow_steal __read_mostly = false;
> +static bool pv_spin_on_preempted_owner __read_mostly = false;
>  static bool pv_yield_prev __read_mostly = true;
>  static bool pv_yield_propagate_owner __read_mostly = true;
>  static bool pv_prod_head __read_mostly = false;
> @@ -220,13 +221,15 @@ static struct qnode *get_tail_qnode(struct qspinlock *lock, u32 val)
>  	BUG();
>  }
>  
> -static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
> +static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq, bool *preempted)
>  {
>  	int owner;
>  	u32 yield_count;
>  
>  	BUG_ON(!(val & _Q_LOCKED_VAL));
>  
> +	*preempted = false;
> +
>  	if (!paravirt)
>  		goto relax;
>  
> @@ -241,6 +244,8 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
>  
>  	spin_end();
>  
> +	*preempted = true;
> +
>  	/*
>  	 * Read the lock word after sampling the yield count. On the other side
>  	 * there may a wmb because the yield count update is done by the
> @@ -265,14 +270,14 @@ static __always_inline void __yield_to_locked_owner(struct qspinlock *lock, u32
>  	spin_cpu_relax();
>  }
>  
> -static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt)
> +static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool *preempted)
>  {
> -	__yield_to_locked_owner(lock, val, paravirt, false);
> +	__yield_to_locked_owner(lock, val, paravirt, false, preempted);
>  }
>  
> -static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq)
> +static __always_inline void yield_head_to_locked_owner(struct qspinlock *lock, u32 val, bool paravirt, bool clear_mustq, bool *preempted)
>  {
> -	__yield_to_locked_owner(lock, val, paravirt, clear_mustq);
> +	__yield_to_locked_owner(lock, val, paravirt, clear_mustq, preempted);
>  }
>  
>  static __always_inline void propagate_yield_cpu(struct qnode *node, u32 val, int *set_yield_cpu, bool paravirt)
> @@ -364,12 +369,33 @@ static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *
>  
>  static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
>  {
> -	int iters;
> +	int iters = 0;
> +
> +	if (!STEAL_SPINS) {
> +		if (paravirt && pv_spin_on_preempted_owner) {
> +			spin_begin();
> +			for (;;) {
> +				u32 val = READ_ONCE(lock->val);
> +				bool preempted;
> +
> +				if (val & _Q_MUST_Q_VAL)
> +					break;
> +				if (!(val & _Q_LOCKED_VAL))
> +					break;
> +				if (!vcpu_is_preempted(get_owner_cpu(val)))
> +					break;
> +				yield_to_locked_owner(lock, val, paravirt, &preempted);
> +			}
> +			spin_end();
> +		}
> +		return false;
> +	}
>  
>  	/* Attempt to steal the lock */
>  	spin_begin();
>  	for (;;) {
>  		u32 val = READ_ONCE(lock->val);
> +		bool preempted;
>  
>  		if (val & _Q_MUST_Q_VAL)
>  			break;
> @@ -382,9 +408,22 @@ static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool parav
>  			continue;
>  		}
>  
> -		yield_to_locked_owner(lock, val, paravirt);
> -
> -		iters++;
> +		yield_to_locked_owner(lock, val, paravirt, &preempted);
> +
> +		if (paravirt && preempted) {
> +			if (!pv_spin_on_preempted_owner)
> +				iters++;
> +			/*
> +			 * pv_spin_on_preempted_owner don't increase iters
> +			 * while the owner is preempted -- we won't interfere
> +			 * with it by definition. This could introduce some
> +			 * latency issue if we continually observe preempted
> +			 * owners, but hopefully that's a rare corner case of
> +			 * a badly oversubscribed system.
> +			 */
> +		} else {
> +			iters++;
> +		}
>  
>  		if (iters >= get_steal_spins(paravirt, false))
>  			break;
> @@ -463,8 +502,10 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		spin_begin();
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> +			bool preempted;
> +
>  			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
> -			yield_head_to_locked_owner(lock, val, paravirt, false);
> +			yield_head_to_locked_owner(lock, val, paravirt, false, &preempted);
>  		}
>  		spin_end();
>  
> @@ -486,11 +527,20 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  		/* We're at the head of the waitqueue, wait for the lock. */
>  		spin_begin();
>  		while ((val = READ_ONCE(lock->val)) & _Q_LOCKED_VAL) {
> +			bool preempted;
> +
>  			propagate_yield_cpu(node, val, &set_yield_cpu, paravirt);
>  			yield_head_to_locked_owner(lock, val, paravirt,
> -					pv_yield_allow_steal && set_mustq);
> +					pv_yield_allow_steal && set_mustq,
> +					&preempted);
> +
> +			if (paravirt && preempted) {
> +				if (!pv_spin_on_preempted_owner)
> +					iters++;
> +			} else {
> +				iters++;
> +			}
>  
> -			iters++;
>  			if (!set_mustq && iters >= get_head_spins(paravirt)) {
>  				set_mustq = true;
>  				lock_set_mustq(lock);
> @@ -663,6 +713,22 @@ static int pv_yield_allow_steal_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_allow_steal, pv_yield_allow_steal_get, pv_yield_allow_steal_set, "%llu\n");
>  
> +static int pv_spin_on_preempted_owner_set(void *data, u64 val)
> +{
> +	pv_spin_on_preempted_owner = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_spin_on_preempted_owner_get(void *data, u64 *val)
> +{
> +	*val = pv_spin_on_preempted_owner;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_spin_on_preempted_owner, pv_spin_on_preempted_owner_get, pv_spin_on_preempted_owner_set, "%llu\n");
> +
>  static int pv_yield_prev_set(void *data, u64 val)
>  {
>  	pv_yield_prev = !!val;
> @@ -719,6 +785,7 @@ static __init int spinlock_debugfs_init(void)
>  	if (is_shared_processor()) {
>  		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
>  		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
> +		debugfs_create_file("qspl_pv_spin_on_preempted_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_spin_on_preempted_owner);
>  		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
>  		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
>  		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);

