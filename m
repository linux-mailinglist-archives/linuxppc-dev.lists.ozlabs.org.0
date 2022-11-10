Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F3D623858
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 01:45:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N73616D2kz3fCH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Nov 2022 11:45:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KG+P9wYO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KG+P9wYO;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N731h2BQSz3f43
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Nov 2022 11:41:44 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 78so192922pgb.13
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Nov 2022 16:41:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zne4UR3R/E6c+UaMl220Jlu6iisWUqyVDTifHpZx8Z4=;
        b=KG+P9wYOaENHhOzaoEfXQgeE+AxLmggjbZNkiGiB2u24lH5opfrvSpZGPvy7BV8Vv4
         TwI1QbQl1fre8tSQypzf8mkq88fmaHUq/NenA58/9JIVcx84Qquu0J0DcYf0n32GFdZl
         Sb/ScB2fbo8mwHKghULSoI4V3JbA9gR404HzCY5oxAuGrS9TmfVp9HnhkUud9a4x0ekY
         rOQn7rqSJtxuH8++zpZStjQJGOmTbwcC3l9KGTjtc93897B89+XOunK/Ec/7/qoQYByn
         C0aJFThmwmBZ/KndFo1Koh/97NUPPiRXiyASO440+RXQJaO+yUNcnHFQjAKKa9pGYU1r
         aBbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zne4UR3R/E6c+UaMl220Jlu6iisWUqyVDTifHpZx8Z4=;
        b=nCaV4Omww3zON47WQn3IAI12QtbIJdsYdAhU4yN+ZZNe+3klX1ZvXUeY6rJJi2yJ3X
         0UEfnx2mPtXJ74MtSWxM/ORDQYQyblMpZ7HeLo+LRTO5Xzzxy+dKjgp2dLbsaJ7nuxbQ
         VrDAEaPtj1E9/zMzO61bZkTq9Aol7RsPFgpPi6xDpfHZneavrtRCWTpYABY640+bHT/B
         bn9LpS54ZWwk+/odFm/ySwuNYJgxQZzv74b4pSJnulJDw3FbAXyNEzphtMYk9bOstOYc
         ufWMtHQLyFYG8zvKWs97hqJgK8bbEXtk9JenAQuOAFCJm3JVatbi0myxDqlsIu8Hdbna
         I2iA==
X-Gm-Message-State: ACrzQf1ZW+KERbPFVf3ZcsG1lqAtmTiAm7FnsZ6fY2ZJ3T33SM4sRaWs
	rPoaiwP+feAdblv0q68Z3hm8NLV+eiA=
X-Google-Smtp-Source: AMsMyM6jYMiAi57wWYqndOs9rcieCayckOzERg1/3co0tfZCnTY7hhACP79nfj/rK7NfkNbb1RUfZg==
X-Received: by 2002:a62:1ad6:0:b0:56e:5bcd:d025 with SMTP id a205-20020a621ad6000000b0056e5bcdd025mr1238939pfa.65.1668040901223;
        Wed, 09 Nov 2022 16:41:41 -0800 (PST)
Received: from tee480.ozlabs.ibm.com (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
        by smtp.googlemail.com with ESMTPSA id 3-20020a620403000000b0056ee0d0985asm7622806pfe.82.2022.11.09.16.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 16:41:40 -0800 (PST)
Message-ID: <c56326f5d55db6b8f6a611ae130e0e5362b39ceb.camel@gmail.com>
Subject: Re: [PATCH 09/17] powerpc/qspinlock: implement option to yield to
 previous node
From: Jordan Niethe <jniethe5@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 10 Nov 2022 11:41:37 +1100
In-Reply-To: <20220728063120.2867508-11-npiggin@gmail.com>
References: <20220728063120.2867508-1-npiggin@gmail.com>
	 <20220728063120.2867508-11-npiggin@gmail.com>
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
> Queued waiters which are not at the head of the queue don't spin on
> the lock word but their qnode lock word, waiting for the previous queued
> CPU to release them. Add an option which allows these waiters to yield
> to the previous CPU if its vCPU is preempted.
> 
> Disable this option by default for now, i.e., no logical change.
> ---
>  arch/powerpc/lib/qspinlock.c | 46 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 45 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/qspinlock.c b/arch/powerpc/lib/qspinlock.c
> index 55286ac91da5..b39f8c5b329c 100644
> --- a/arch/powerpc/lib/qspinlock.c
> +++ b/arch/powerpc/lib/qspinlock.c
> @@ -26,6 +26,7 @@ static bool MAYBE_STEALERS __read_mostly = true;
>  static int HEAD_SPINS __read_mostly = (1<<8);
>  
>  static bool pv_yield_owner __read_mostly = true;
> +static bool pv_yield_prev __read_mostly = true;

Similiar suggestion, maybe pv_yield_prev_enabled would read better.

Isn't this enabled by default contrary to the commit message?


>  
>  static DEFINE_PER_CPU_ALIGNED(struct qnodes, qnodes);
>  
> @@ -224,6 +225,31 @@ static __always_inline void yield_to_locked_owner(struct qspinlock *lock, u32 va
>  	cpu_relax();
>  }
>  
> +static __always_inline void yield_to_prev(struct qspinlock *lock, struct qnode *node, int prev_cpu, bool paravirt)

yield_to_locked_owner() takes a raw val and works out the cpu to yield to.
I think for consistency have yield_to_prev() take the raw val and work it out too.

> +{
> +	u32 yield_count;
> +
> +	if (!paravirt)
> +		goto relax;
> +
> +	if (!pv_yield_prev)
> +		goto relax;
> +
> +	yield_count = yield_count_of(prev_cpu);
> +	if ((yield_count & 1) == 0)
> +		goto relax; /* owner vcpu is running */
> +
> +	smp_rmb(); /* See yield_to_locked_owner comment */
> +
> +	if (!node->locked) {
> +		yield_to_preempted(prev_cpu, yield_count);
> +		return;
> +	}
> +
> +relax:
> +	cpu_relax();
> +}
> +
>  
>  static __always_inline bool try_to_steal_lock(struct qspinlock *lock, bool paravirt)
>  {
> @@ -291,13 +317,14 @@ static __always_inline void queued_spin_lock_mcs_queue(struct qspinlock *lock, b
>  	 */
>  	if (old & _Q_TAIL_CPU_MASK) {
>  		struct qnode *prev = get_tail_qnode(lock, old);
> +		int prev_cpu = get_tail_cpu(old);

This could then be removed.

>  
>  		/* Link @node into the waitqueue. */
>  		WRITE_ONCE(prev->next, node);
>  
>  		/* Wait for mcs node lock to be released */
>  		while (!node->locked)
> -			cpu_relax();
> +			yield_to_prev(lock, node, prev_cpu, paravirt);

And would have this as:
			yield_to_prev(lock, node, old, paravirt);


>  
>  		smp_rmb(); /* acquire barrier for the mcs lock */
>  	}
> @@ -448,12 +475,29 @@ static int pv_yield_owner_get(void *data, u64 *val)
>  
>  DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_owner, pv_yield_owner_get, pv_yield_owner_set, "%llu\n");
>  
> +static int pv_yield_prev_set(void *data, u64 val)
> +{
> +	pv_yield_prev = !!val;
> +
> +	return 0;
> +}
> +
> +static int pv_yield_prev_get(void *data, u64 *val)
> +{
> +	*val = pv_yield_prev;
> +
> +	return 0;
> +}
> +
> +DEFINE_SIMPLE_ATTRIBUTE(fops_pv_yield_prev, pv_yield_prev_get, pv_yield_prev_set, "%llu\n");
> +
>  static __init int spinlock_debugfs_init(void)
>  {
>  	debugfs_create_file("qspl_steal_spins", 0600, arch_debugfs_dir, NULL, &fops_steal_spins);
>  	debugfs_create_file("qspl_head_spins", 0600, arch_debugfs_dir, NULL, &fops_head_spins);
>  	if (is_shared_processor()) {
>  		debugfs_create_file("qspl_pv_yield_owner", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_owner);
> +		debugfs_create_file("qspl_pv_yield_prev", 0600, arch_debugfs_dir, NULL, &fops_pv_yield_prev);
>  	}
>  
>  	return 0;

