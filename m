Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AF97318CCE8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 12:25:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kLzv1b6BzDrLK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 22:25:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.74;
 helo=us-smtp-delivery-74.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=b0m6s63S; 
 dkim-atps=neutral
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kLtl3X6TzDrTk
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 22:21:02 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584703259;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+/3NXaZ2sRQX1DOuwaMBeQJLBn8vkE3WrE+NitGKiqA=;
 b=b0m6s63SvoOQFUMtcR474SKLjefYOkwW92QYD0IGnUATNRPnbzsU1XvLRdUdoj0BAge97d
 /ZHW03CEFv55Bhpm8AQKRjwg9SRHgI3kEqAumZixuB4CC/fmD2l3wjMVZEjz2QoFsl021T
 S7DvUuWWpJwsELO8L3Hmk4qXTU4nYSI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-fkGn8X5COMSpS5am-SPGNA-1; Fri, 20 Mar 2020 07:20:57 -0400
X-MC-Unique: fkGn8X5COMSpS5am-SPGNA-1
Received: by mail-wr1-f70.google.com with SMTP id h17so2479625wru.16
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 04:20:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+/3NXaZ2sRQX1DOuwaMBeQJLBn8vkE3WrE+NitGKiqA=;
 b=HVZqamWKPetnBlpgdTMyKLDWHLRwFVrmWK/5UOw+OZ/kjMjfOSes1iufYfFsLhJKzW
 0GEQucIoBflUUBm7VRIzyFStxNUs3ccWrvESapfCnRYhKMeuC8g/6mCK7tczUsIGwFOE
 mgC6I5SVvLg07SILBqiS6EZMyIJByFX6jd+WsMPbqs9wkQ8SZa6o1N8ndbORx8+Gdksz
 cY9GExF1uN3udhCwPZZGvNUJVcwHNeBYygxOfb7Xk0YZXM4eegji0TrmAHYQyD5t88RX
 k3s+MIHpRpyJkQAPMtXGCuNmYwD/t/eVNG0UxfvBAIfnhqM13uAbXyj6/d/xRB6xA7pu
 KGLw==
X-Gm-Message-State: ANhLgQ3urfvQbeiCgfn+us/0GkXfHocxw/ZlOZ7V65U9hcDOBMMPl/kx
 k1Tl4GAtIlCRClzltY2rIZpNT460kKUjmcZsOT1U/VP/3W4xl0wo6f6EnnfJTGCXKvmczCveQs8
 FW5UY3Tzw0d5QLbcHxl0Fxq454g==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr9591175wmi.179.1584703256159; 
 Fri, 20 Mar 2020 04:20:56 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vuSOEQTHzVsVT/ip5Zea40OMJaocP0teB9e+S0wZpsO4/tb7JdwYPz+IBInWzuFqQnCpGnDmg==
X-Received: by 2002:a7b:c185:: with SMTP id y5mr9591008wmi.179.1584703254449; 
 Fri, 20 Mar 2020 04:20:54 -0700 (PDT)
Received: from [192.168.178.58] ([151.21.15.43])
 by smtp.gmail.com with ESMTPSA id s1sm7897400wrp.41.2020.03.20.04.20.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Mar 2020 04:20:53 -0700 (PDT)
Subject: Re: [PATCH 18/15] kvm: Replace vcpu->swait with rcuwait
To: Davidlohr Bueso <dave@stgolabs.net>, tglx@linutronix.de
References: <20200318204302.693307984@linutronix.de>
 <20200320085527.23861-1-dave@stgolabs.net>
 <20200320085527.23861-3-dave@stgolabs.net>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2343d524-b600-2696-06a5-33c0d191a630@redhat.com>
Date: Fri, 20 Mar 2020 12:20:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200320085527.23861-3-dave@stgolabs.net>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252
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
Cc: linux-usb@vger.kernel.org, peterz@infradead.org, linux-pci@vger.kernel.org,
 bigeasy@linutronix.de, linux-kernel@vger.kernel.org, joel@joelfernandes.org,
 will@kernel.org, mingo@kernel.org, arnd@arndb.de,
 Davidlohr Bueso <dbueso@suse.de>, torvalds@linux-foundation.org,
 paulmck@kernel.org, linuxppc-dev@lists.ozlabs.org, rostedt@goodmis.org,
 bhelgaas@google.com, kurt.schwemmer@microsemi.com, kvalo@codeaurora.org,
 balbi@kernel.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-wireless@vger.kernel.org, oleg@redhat.com, netdev@vger.kernel.org,
 logang@deltatee.com, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/03/20 09:55, Davidlohr Bueso wrote:
> Only compiled and tested on x86.

It shows :) as the __KVM_HAVE_ARCH_WQP case is broken.  But no problem, 
Paul and I can pick this up and fix it.

This is missing:

diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
index 506e4df2d730..6e5d85ba588d 100644
--- a/arch/powerpc/include/asm/kvm_book3s.h
+++ b/arch/powerpc/include/asm/kvm_book3s.h
@@ -78,7 +78,7 @@ struct kvmppc_vcore {
 	struct kvm_vcpu *runnable_threads[MAX_SMT_THREADS];
 	struct list_head preempt_list;
 	spinlock_t lock;
-	struct swait_queue_head wq;
+	struct rcuwait wait;
 	spinlock_t stoltb_lock;	/* protects stolen_tb and preempt_tb */
 	u64 stolen_tb;
 	u64 preempt_tb;
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 1af96fb5dc6f..8c8122c30b89 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -754,7 +754,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (err)
 		goto out_vcpu_uninit;
 
-	vcpu->arch.wqp = &vcpu->wq;
+	vcpu->arch.waitp = &vcpu->wait;
 	kvmppc_create_vcpu_debugfs(vcpu, vcpu->vcpu_id);
 	return 0;
 

and...

> -static inline struct swait_queue_head *kvm_arch_vcpu_wq(struct kvm_vcpu *vcpu)
> +static inline struct rcuwait *kvm_arch_vcpu_get_wait(struct kvm_vcpu *vcpu)
>  {
>  #ifdef __KVM_HAVE_ARCH_WQP
> -	return vcpu->arch.wqp;
> +	return vcpu->arch.wait;

... this needs to be vcpu->arch.waitp.  That should be it.

Thanks!

Paolo

>  #else
> -	return &vcpu->wq;
> +	return &vcpu->wait;
>  #endif
>  }
>  
> diff --git a/virt/kvm/arm/arch_timer.c b/virt/kvm/arm/arch_timer.c
> index 0d9438e9de2a..4be71cb58691 100644
> --- a/virt/kvm/arm/arch_timer.c
> +++ b/virt/kvm/arm/arch_timer.c
> @@ -593,7 +593,7 @@ void kvm_timer_vcpu_put(struct kvm_vcpu *vcpu)
>  	if (map.emul_ptimer)
>  		soft_timer_cancel(&map.emul_ptimer->hrtimer);
>  
> -	if (swait_active(kvm_arch_vcpu_wq(vcpu)))
> +	if (rcu_dereference(kvm_arch_vpu_get_wait(vcpu)) != NULL)
>  		kvm_timer_blocking(vcpu);
>  
>  	/*
> diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
> index eda7b624eab8..4a704866e9b6 100644
> --- a/virt/kvm/arm/arm.c
> +++ b/virt/kvm/arm/arm.c
> @@ -579,16 +579,17 @@ void kvm_arm_resume_guest(struct kvm *kvm)
>  
>  	kvm_for_each_vcpu(i, vcpu, kvm) {
>  		vcpu->arch.pause = false;
> -		swake_up_one(kvm_arch_vcpu_wq(vcpu));
> +		rcuwait_wake_up(kvm_arch_vcpu_get_wait(vcpu));
>  	}
>  }
>  
>  static void vcpu_req_sleep(struct kvm_vcpu *vcpu)
>  {
> -	struct swait_queue_head *wq = kvm_arch_vcpu_wq(vcpu);
> +	struct rcuwait *wait = kvm_arch_vcpu_get_wait(vcpu);
>  
> -	swait_event_interruptible_exclusive(*wq, ((!vcpu->arch.power_off) &&
> -				       (!vcpu->arch.pause)));
> +	rcuwait_wait_event(*wait,
> +			   (!vcpu->arch.power_off) && (!vcpu->arch.pause),
> +			   TASK_INTERRUPTIBLE);
>  
>  	if (vcpu->arch.power_off || vcpu->arch.pause) {
>  		/* Awaken to handle a signal, request we sleep again later. */
> diff --git a/virt/kvm/async_pf.c b/virt/kvm/async_pf.c
> index 15e5b037f92d..10b533f641a6 100644
> --- a/virt/kvm/async_pf.c
> +++ b/virt/kvm/async_pf.c
> @@ -80,8 +80,7 @@ static void async_pf_execute(struct work_struct *work)
>  
>  	trace_kvm_async_pf_completed(addr, cr2_or_gpa);
>  
> -	if (swq_has_sleeper(&vcpu->wq))
> -		swake_up_one(&vcpu->wq);
> +	rcuwait_wake_up(&vcpu->wait);
>  
>  	mmput(mm);
>  	kvm_put_kvm(vcpu->kvm);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 70f03ce0e5c1..6b49dcb321e2 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -343,7 +343,7 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct kvm *kvm, unsigned id)
>  	vcpu->kvm = kvm;
>  	vcpu->vcpu_id = id;
>  	vcpu->pid = NULL;
> -	init_swait_queue_head(&vcpu->wq);
> +	rcuwait_init(&vcpu->wait);
>  	kvm_async_pf_vcpu_init(vcpu);
>  
>  	vcpu->pre_pcpu = -1;
> @@ -2465,9 +2465,8 @@ static int kvm_vcpu_check_block(struct kvm_vcpu *vcpu)
>  void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  {
>  	ktime_t start, cur;
> -	DECLARE_SWAITQUEUE(wait);
> -	bool waited = false;
>  	u64 block_ns;
> +	int block_check = -EINTR;
>  
>  	kvm_arch_vcpu_blocking(vcpu);
>  
> @@ -2487,21 +2486,14 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  					++vcpu->stat.halt_poll_invalid;
>  				goto out;
>  			}
> +
>  			cur = ktime_get();
>  		} while (single_task_running() && ktime_before(cur, stop));
>  	}
>  
> -	for (;;) {
> -		prepare_to_swait_exclusive(&vcpu->wq, &wait, TASK_INTERRUPTIBLE);
> -
> -		if (kvm_vcpu_check_block(vcpu) < 0)
> -			break;
> -
> -		waited = true;
> -		schedule();
> -	}
> -
> -	finish_swait(&vcpu->wq, &wait);
> +	rcuwait_wait_event(&vcpu->wait,
> +			   (block_check = kvm_vcpu_check_block(vcpu)) < 0,
> +			   TASK_INTERRUPTIBLE);
>  	cur = ktime_get();
>  out:
>  	kvm_arch_vcpu_unblocking(vcpu);
> @@ -2525,18 +2517,18 @@ void kvm_vcpu_block(struct kvm_vcpu *vcpu)
>  		}
>  	}
>  
> -	trace_kvm_vcpu_wakeup(block_ns, waited, vcpu_valid_wakeup(vcpu));
> +	trace_kvm_vcpu_wakeup(block_ns, block_check < 0 ? false : true,
> +			      vcpu_valid_wakeup(vcpu));
>  	kvm_arch_vcpu_block_finish(vcpu);
>  }
>  EXPORT_SYMBOL_GPL(kvm_vcpu_block);
>  
>  bool kvm_vcpu_wake_up(struct kvm_vcpu *vcpu)
>  {
> -	struct swait_queue_head *wqp;
> +	struct rcuwait *wait;
>  
> -	wqp = kvm_arch_vcpu_wq(vcpu);
> -	if (swq_has_sleeper(wqp)) {
> -		swake_up_one(wqp);
> +	wait = kvm_arch_vcpu_get_wait(vcpu);
> +	if (rcuwait_wake_up(wait)) {
>  		WRITE_ONCE(vcpu->ready, true);
>  		++vcpu->stat.halt_wakeup;
>  		return true;
> @@ -2678,7 +2670,8 @@ void kvm_vcpu_on_spin(struct kvm_vcpu *me, bool yield_to_kernel_mode)
>  				continue;
>  			if (vcpu == me)
>  				continue;
> -			if (swait_active(&vcpu->wq) && !vcpu_dy_runnable(vcpu))
> +			if (rcu_dereference(vcpu->wait.task) &&
> +			    !vcpu_dy_runnable(vcpu))
>  				continue;
>  			if (READ_ONCE(vcpu->preempted) && yield_to_kernel_mode &&
>  				!kvm_arch_vcpu_in_kernel(vcpu))
> 

