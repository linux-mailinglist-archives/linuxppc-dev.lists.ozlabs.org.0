Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D841623866
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:48:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N739C63Ftz3f8q
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:48:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GH6QQPFF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GH6QQPFF;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N732y36npz3f6Y
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:42:50 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id l2so199963pld.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ttidRnws9xogjZGd54r6rDeknmERi2tUSnClUWsM+pw=;
        b=GH6QQPFF8KjQdTe1tnwZLKJ14eQ9s5K5/ECq0CPSy7HtUNiWv7Lbr0Ro7rKRTllpzj
         uPHXwtMMpXpCJBA5AaE6ypkPI+7Vbr0MWAEtCDkUYKtapmOt01WiR0XRwf0MyRIPLlXh
         o7kkXbYdiXdit1G0Cr7YUqL0fO2oMGFjMfZyzc+8DY72O4o7nzrrST+kuT14o0Ode/VP
         dX7Ttzgw3+jNAl+cIgjQOdw0Kp3zxUkZqnhyx4cxhnUT4uhxxqDAI/5EGeDwnVii0PYd
         netHe1fMgpq5O5M2TedBcg/LWo5ZPpKDFaec9L548/fOVTN8es8UfIatg8cc6bdqfBTa
         cPJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ttidRnws9xogjZGd54r6rDeknmERi2tUSnClUWsM+pw=;
        b=BMl7z0H0HgjtrF4AyGlZI3eAUI00c32Kru/unAgF9viaCj8RrAl4BT3gbOQSr9iQzX
         gbasE/8qjw03gAcL0IkVO7YmxGdL/UUYIo/8i6OJb6IonZNmyd6U8aAmBsYfuMp+Y3AX
         OyVMp4Sih19RKsc5tSm8J6XYeA4raY1XOl5mxoqopJ3r4S+S8MXm6M8KYgOHjuTXdlL4
         5NG2/zfwF1BBeGl/IyccnQe2rjUA1EaupPTp72TkvLVXaiRS15MxWsBTv2kDP4R8i7iY
         R7iT9qgov0jhmN3YeQFQfw1foxkIwYgt7kpyLhzSzX+JDtQW5DTYAlujevUuVCrGpgBw
         BhqQ==
X-Gm-Message-State: ACrzQf37QLG/EvAa8eMWYzZpES3+nV+scJeN6KnKH7/NW6tVvrvJeN7q
	t9G1KIbBnh1F1qCUvuGT2sXbVH9Gmmk=
X-Google-Smtp-Source: AMsMyM6ImSFOsDo30Xkr71ZwGWYQQgGpswqsTxPwZ12YUYm17+TjnQOEx21kLW6Il6O/44wSnEcOgQ==
X-Received: by 2002:a17:902:f78c:b0:185:3d6a:7576 with SMTP id q12-20020a170902f78c00b001853d6a7576mr62524668pln.86.1668040967667;
        Wed, 09 Nov 2022 16:42:47 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id e4-20020a170902784400b001871acf245csm9681852pln.37.2022.11.09.16.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:42:47 -0800 (PST)
Message-ID: <d3a58bf7b022c906d370fbb10ab6f14fb31d1c3d.camel@gmail.com>
Subject: Re: [PATCH 12/17] powerpc/qspinlock: add ability to prod new queue
 head CPU
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:42:44 +1100
In-Reply-To: <20220728063120.2867508-14-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-14-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Thu, 2022-07-28 at 16:31 +1000, Nicholas Piggin wrote:
[resend as utf-8, not utf-7]
> After the head of the queue acquires the lock, it releases the
> next waiter in the queue to become the new head. Add an option
> to prod the new head if its vCPU was preempted. This may only
> have an effect if queue waiters are yielding.
> 
> Disable this option by default for now, i.e., no logical change.
> ---
>  arch/powerpc/lib/qspinlock.c | 29 ++++++++++++++++++++++++++++-
>  1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 28c85a2d5635..3b10e31bcf0a 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -12,6 +12,7 @@
>  struct qnode {
>  	struct qnode	*next;
>  	struct qspinlock *lock;
> +	int		cpu;
>  	int		yield_cpu;
>  	u8		locked; /* 1 if lock acquired */
>  };
> @@ -30,6 +31,7 @@ static bool pv_yield_owner __read_mostly = true;
>  static bool pv_yield_allow_steal __read_mostly = false;
>  static bool pv_yield_prev __read_mostly = true;
>  static bool pv_yield_propagate_owner __read_mostly = true;
> +static bool pv_prod_head __read_mostly = false;
>  
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
>  
> @@ -392,6 +394,7 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	node = &qnodesp->nodes[idx];
>  	node->next = NULL;
>  	node->lock = lock;
> +	node->cpu = smp_processor_id();

I suppose this could be used in some other places too.

For example change:
	yield_to_prev(lock, node, prev, paravirt);

In yield_to_prev() it could then access the prev->cpu.

>  	node->yield_cpu = -1;
>  	node->locked = 0;
>  
> @@ -483,7 +486,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	 * this store to locked. The corresponding barrier is the smp_rmb()
>  	 * acquire barrier for mcs lock, above.
>  	 */
> -	WRITE_ONCE(next->locked, 1);
> +	if (paravirt && pv_prod_head) {
> +		int next_cpu = next->cpu;
> +		WRITE_ONCE(next->locked, 1);
> +		if (vcpu_is_preempted(next_cpu))
> +			prod_cpu(next_cpu);
> +	} else {
> +		WRITE_ONCE(next->locked, 1);
> +	}
>  
>  release:
>  	qnodesp->count--; /* release the node */
> @@ -622,6 +632,22 @@ static int pv_yield_propagate_owner_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_propagate_owner, pv_yield_propagate_owner_get, pv_yield_propagate_owner_set, "%llu\n");
>  
> +static int pv_prod_head_set(void *data, u64 val)
> +{
> +	pv_prod_head = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_prod_head_get(void *data, u64 *val)
> +{
> +	*val = pv_prod_head;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_prod_head, pv_prod_head_get, pv_prod_head_set, "%llu\n");
> +
>  static __init int spinlock_debugfs_init(void)
>  {
>  	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
> @@ -631,6 +657,7 @@ static __init int spinlock_debugfs_init(void)
>  		debugfs_create_file("qspl_pv_yield_allow_steal", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_allow_steal);
>  		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
>  		debugfs_create_file("qspl_pv_yield_propagate_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_propagate_owner);
> +		debugfs_create_file("qspl_pv_prod_head", 0600, arch_debugfs_dir, NULL, &fops_pv_prod_head);
>  	}
>  
>  	return 0;

