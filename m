Return-Path: <linuxppc-dev+bounces-9792-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49210AE9089
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 23:56:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSFxz1ZG9z307K;
	Thu, 26 Jun 2025 07:56:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750888567;
	cv=none; b=ghj0tc1IdADwO1N6YGSavMVImyVE58Tv1QQ+DACgVh+GeWYwJlmfxGAd28It89OAcjwu+4cJex0BLsWtRNOTkpHwrE53VAnqSPwbJ1HwIUBTV/FxLbxiFMMU9T1ghwgHF1BZr5msd0TNWah7939Bs92woyIalmSd6M/VnG1subgomKSrV3XZzhjhlQTDISkF2G9qSn5mxJP2w+n27K+zl97wgVx6Wu0fUqVDksB57JmaKkWIfMoz0DXdgkjXKCC2+By2DglUa/7WllDuv0zxd5EnHs8cc0iSp34CAqQ/r+NWPT/zePC7y7+Mt6lnPiaNiKDA4kSl1f+rzinUEHPLpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750888567; c=relaxed/relaxed;
	bh=9LGxtwTUiUZfmjCFavT0wpko1sgth32s7AXdMmiF+7c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUEiDZwayDd6qih8Id111xY3PvOQx8ZQSbtLLTH/Ml4VStsf+InAGkllWuzLis0uOVn6+L6nA2Cm7SpTObN5dLJdeBUzzFlTs9DOohJ6zFvN2Fm1luvo+NzkoQwghj7q8hj9TxcCqQIcBpcfKQ4Hc5I1sr/g6C8u9mzmS2gW9fu/k/TWvm4EEPAHpqGTgJs5CLPTG5edSFt6OS3ytqviK3w/UIELDHV/y2o1pku0g8jPH8OFqRf6SdIukieqH8Z+L6ifog6u66Wuze1yPhKuz/FEHGeaazdPP4rJTfimfOz2ePQ/oNi9r/J7Bk9JgxAbFTpzHcF/4inZ+gPPjn7fMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RrabiP/z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RrabiP/z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=yury.norov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSFxr0v6kz306l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 07:55:58 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-23636167afeso4233945ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750888556; x=1751493356; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9LGxtwTUiUZfmjCFavT0wpko1sgth32s7AXdMmiF+7c=;
        b=RrabiP/zElHF1iM8lKIK+dXeRE2NCJGDzYhNnyDNB52QRxHk/pbfAPhdGToKD0po18
         Hej59BkK8jj5tOLGYN0WeEcSDO2dMseSwUlBMOInhk+9v8eYgBj7bqHyELydN1/AYXW2
         G5AIJRCT+haJqP35IqvfzcvBiyMxMYfEh5kgVuvJHf8ym389I8ut3hvNCjlTg4R9oFp6
         hvAiFD40d70egiIkxMObBBUeJb3/ktMATrbLhNqDCgWegBYXK6ucuKhQ4gt1S2nX5/aK
         OV4gWF+tc2GJa+5MeMmRUrEnIgU2iRsEFqN2kA1lZ4bcZO3uc7HiNK+eJl9wwnAq8XJ4
         Pdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750888556; x=1751493356;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9LGxtwTUiUZfmjCFavT0wpko1sgth32s7AXdMmiF+7c=;
        b=uB/av7chKMRy7Ywzx/KcLvLXQZ+B2FWKL47WyhVox4HJ8WrlzVZLyZye+eyAzfRyey
         1A85Aojr30KhikxYiqz/96OSs5wFg+Q2AtMqI8oBEbWcZfjHZIIG6ClrHvW0rZ/2Y36W
         TqN8D3uZdP/IrrEjzDP2bhc1hp5DQn0j4SwRya00dZZsZMvnBo94DlNZzaDJOf/3FfZO
         AsP7+j59sm2fe8kHAq6aQ1KiAuQNsNslKYlHAE0JUv/67EMxzkLVgswedsnP/DSP5fvV
         7ecsUM4a6c9Q0ZfIhXxtDGvrHu8vxusjENbeWO+jg8BPRixrpk9/a4T26r2vL+1HApFp
         6D/Q==
X-Forwarded-Encrypted: i=1; AJvYcCWB63I/OhMrdnJ/FZRPFPkoIe/eOjVu+yqgZwhLr3etlnssqwC9Z9GyuPZGpdbfy7rN4mftWnIF66N6ITA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwrGlkd4ufimxn7DSFkp2isvm9+9FCqyCGF+5LmywKSIOZBg1/S
	L+pu5x9usmTrdtt2Fb1Y6g2IbCOnsxJp1F4S/qCBW/011ENVTVhTn2ep
X-Gm-Gg: ASbGncvkoPVVYYwk8LzzFwfArS2IwbYinoyk+nlyAItK44ovcqdmpLTIMjTJDRxk8YO
	ryBzoqYb25oZ847cSHCBx4wI28Kk/suFnFHuWjF8y3RKC7W+YiigNayWPRPSdb/iJSNXNFilOdI
	ADItk53bvWqFr8OHlbiUZxES3KooYv1zF+7ZXyJhy01BXc+G9oqbYBEX5CrIdaebbGFrNKEp4Oi
	gYAls4ymGs41DrtQIeyP6lsASiFYdx3SdrqrByEBszRc7soHqKQGSGn2APjIa20Br2MEstVlO1i
	q/J/c4BdoQO1Jxec2lTaen7PufBAdtL40FOnwgM/MlqKAZxaJ5ASekC1DuOb7g==
X-Google-Smtp-Source: AGHT+IEDI1YLUnjAmW35bzf+fq8eaKiorLa2kacWkfWatUza7rGvC8Y97Bnyyayyvde212EU8qgskw==
X-Received: by 2002:a17:902:d58c:b0:21f:4649:fd49 with SMTP id d9443c01a7336-23824086a0emr85784225ad.49.1750888555480;
        Wed, 25 Jun 2025 14:55:55 -0700 (PDT)
Received: from localhost ([216.228.127.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866488csm140884085ad.158.2025.06.25.14.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 14:55:54 -0700 (PDT)
Date: Wed, 25 Jun 2025 17:55:52 -0400
From: Yury Norov <yury.norov@gmail.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, tglx@linutronix.de, maddy@linux.ibm.com,
	vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
	kprateek.nayak@amd.com, huschle@linux.ibm.com, srikar@linux.ibm.com,
	linux-kernel@vger.kernel.org, christophe.leroy@csgroup.eu,
	linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Subject: Re: [RFC v2 0/9] cpu avoid state and push task mechanism
Message-ID: <aFxwaKwBykv5shN4@yury>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
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
In-Reply-To: <20250625191108.1646208-1-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 12:40:59AM +0530, Shrikanth Hegde wrote:
> This is a followup version if [1] with few additions. This is still an RFC 
> and would like get feedback on the idea and suggestions on improvement. 
> 
> v1->v2:
> - Renamed to cpu_avoid_mask in place of cpu_parked_mask.

This one is not any better to the previous. Why avoid? When avoid?
I already said that: for objects, having positive self-explaining
noun names is much better than negative and/or function-style verb
names. I suggested cpu_paravirt_mask, and I still believe it's a much
better option.

> - Used a static key such that no impact to regular case. 

Static keys are not free and designed for different purpose. You have
CONFIG_PARAVIRT, and I don't understand why you're trying to avoid
using it.

I don't mind about static keys, if you prefer them, I just want to
have feature-specific code under corresponding config.

Can you please print bloat-o-meter report for CONFIG_PARAVIRT=n?
Have you any perf numbers to advocate static keys here? 

> - add sysfs file to show avoid CPUs.
> - Make RT understand avoid CPUs. 
> - Add documentation patch 
> - Took care of reported compile error in [1] when NR_CPUS=1
> 
> -----------------
> Problem statement
> -----------------
> vCPU - Virtual CPUs - CPU in VM world.
> pCPU - Physical CPUs - CPU in baremetal world.
> 
> A hypervisor is managing these vCPUs from different VMs. When a vCPU 
> requests for CPU, hypervisor does the job of scheduling them on a pCPU.
> 
> So this issue occurs when there are more vCPUs(combined across all VMs) 
> than the pCPU. So when *all* vCPUs are requesting for CPUs, hypervisor 
> can only run a few of them and remaining will be preempted(waiting for pCPU).
> 
> If we take two VM's, When hypervisor preempts vCPU from VM1 to run vCPU from 
> VM2, it has to do save/restore VM context.Instead if VM's can co-ordinate among
> each other and request for *limited*  vCPUs, it avoids the above overhead and 
                                       ^
Did this extra whitespace escaped from the previous line, or the following?
                                        v
> there is context switching within vCPU(less expensive). Even if hypervisor
> is preempting one vCPU to run another within the same VM, it is still more 
> expensive than the task preemption within the vCPU. So *basic* aim to avoid 
> vCPU preemption.
> 
> So to achieve this, use "CPU Avoid" concept, where it is better
> if workload avoids these vCPUs at this moment.
> (vCPUs stays online, we don't want the overhead of sched domain rebuild).
> 
> Contention is dynamic in nature. When there is contention for pCPU is to be 
> detected and determined by architecture. Archs needs to update the mask 
> accordingly.
> 
> When there is contention, use limited vCPUs as indicated by arch.
> When there is no contention, use all vCPUs.
> 
> -------------------------
> To be done and Questions: 
> -------------------------
> 1. IRQ - still don't understand this cpu_avoid_mask. Maybe irqbalance
> code could be modified to do the same. Ran stress-ng --hrtimers, irq
> moved out of avoid cpu though. So need to see if changes to irqbalance is
> required or not.
> 
> 2. If a task is spawned by affining to only avoid CPUs. Should that fail
> or throw a warning to user. 

I think it's possible that existing codebase will do that. And because
you don't want to break userspace, you should not restrict.

> 3. Other classes such as SCHED_EXT, SCHED_DL won't understand this infra
> yet.
> 
> 4. Performance testing yet to be done. RFC only verified the functional
> aspects of whether task move out of avoid CPUs or not. Move happens quite
> fast (around 1-2 seconds even on large systems with very high utilization) 
> 
> 5. Haven't come up an infra which could combine all push task related
> changes. It is currently spread across rt, dl, fair. Maybe some
> consolidation can be done. but which tasks to push/pull still remains in
> the class. 
> 
> 6. cpu_avoid_mask may need some sort of locking to ensure read/write is
> correct. 
> 
> [1]: https://lore.kernel.org/all/20250523181448.3777233-1-sshegde@linux.ibm.com/
> 
> Shrikanth Hegde (9):
>   sched/docs: Document avoid_cpu_mask and avoid CPU concept
>   cpumask: Introduce cpu_avoid_mask
>   sched/core: Don't allow to use CPU marked as avoid
>   sched/fair: Don't use CPU marked as avoid for wakeup and load balance
>   sched/rt: Don't select CPU marked as avoid for wakeup and push/pull rt task
>   sched/core: Push current task out if CPU is marked as avoid
>   sched: Add static key check for cpu_avoid
>   sysfs: Add cpu_avoid file
>   powerpc: add debug file for set/unset cpu avoid
> 
>  Documentation/scheduler/sched-arch.rst | 25 +++++++++++++
>  arch/powerpc/include/asm/paravirt.h    |  2 ++
>  arch/powerpc/kernel/smp.c              | 50 ++++++++++++++++++++++++++
>  drivers/base/cpu.c                     |  8 +++++
>  include/linux/cpumask.h                | 17 +++++++++
>  kernel/cpu.c                           |  3 ++
>  kernel/sched/core.c                    | 50 +++++++++++++++++++++++++-
>  kernel/sched/fair.c                    | 11 +++++-
>  kernel/sched/rt.c                      |  9 +++--
>  kernel/sched/sched.h                   | 10 ++++++
>  10 files changed, 181 insertions(+), 4 deletions(-)
> 
> -- 
> 2.43.0

