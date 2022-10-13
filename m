Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3805FD3E9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 06:44:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnxkG0yr4z3drf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 15:44:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eIeInTEh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eIeInTEh;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnxjH3TMCz2xgb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 15:43:13 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id d7-20020a17090a2a4700b0020d268b1f02so3899965pjg.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 21:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Wm5TFqpfUUB3o9TWCJqj0A5l3NfOFaLuuQfGUTTHEVU=;
        b=eIeInTEhdHeH1/5Y8PLe4zIDp5sBIFwBpa/2LYcuwr5rkeobgKqBTkBybrB6Q0jrQc
         zu4JXaFuraetF3fPrZBOCd2t+dbcYUBart30O2NMtI/vbjHtxPBDk/PiwR3h9ZdUtqer
         bf7gIxyc/UKhGgtYvVpMGH3Xdqn6UvU4PTV7V+xj54CURdZMF9UhnnNEmI49IOewVqmn
         LCcq8XdkoY8dQDFXJ6ZgvS9fhrfHiGh1BIBVng7rkmjIf8atO0fwJA7GAbLmm/cHTFaH
         UKoNKaX5Wlfqs2Hwm8qizDYmr9bRJPUxL64DuceeAtcjcfL9Z9EX+ncxw7l8x5qCrcf1
         0ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
         :content-language:user-agent:mime-version:date:message-id:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wm5TFqpfUUB3o9TWCJqj0A5l3NfOFaLuuQfGUTTHEVU=;
        b=A6n6YFSSAEsreh+xMsS5mGVIkymcwiW6OB/9zEiia0ACi97hyBWTaBoH/mMovhWXYu
         pldXkiUXQnNTcZZDkD5C03h8gw4UXfQkxYrCPbNFmKYCxKmveT5LCycX/xiSK2SxtIrK
         C9UKX4MK6ffZbgHpNOaymeaesUXTYa33czDVoTGUIXGfsdE1c1ALnXTKzyVYiSrcPoxO
         x1Z3NfdEEBSSYst7XkP7T55MQhOLakQtfnVkyiQADJKIaZ6gca7/pZqpqN6wFF/GKPJT
         VFMq6+zndNmjsr2h5f4SCGYKPX5ZvMfPrNKQCEf1StPted7vuk6OZs3jl5gFxTr7FSRR
         /ekA==
X-Gm-Message-State: ACrzQf3V+Cpz8T1F9+SpwyZz1McXaOvSjBEgDev0qEGeONLsndNZ0ioX
	kYFvaDXSzqk89jEhXnBaDuU=
X-Google-Smtp-Source: AMsMyM79ABUncQH/++TWSd9RABN4vVr1hQK7kFFn0TN+/86cgc2IOgktcKtxRq0fncn6YWeyqM2Bnw==
X-Received: by 2002:a17:902:8a93:b0:17f:66ae:b6c with SMTP id p19-20020a1709028a9300b0017f66ae0b6cmr33650357plo.94.1665636190295;
        Wed, 12 Oct 2022 21:43:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y8-20020a17090a16c800b002005fcd2cb4sm2295777pje.2.2022.10.12.21.43.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 21:43:09 -0700 (PDT)
Message-ID: <bba714ce-4af7-a7ea-21b5-10e5578b6db8@roeck-us.net>
Date: Wed, 12 Oct 2022 21:43:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net> <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net> <Y0b3ZsTRHWG6jGK8@zx2c4.com>
From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
In-Reply-To: <Y0b3ZsTRHWG6jGK8@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: david@redhat.com, Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, Ingo Molnar <mingo@kernel.org>, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/12/22 10:20, Jason A. Donenfeld wrote:
> On Wed, Oct 12, 2022 at 09:44:52AM -0700, Guenter Roeck wrote:
>> On Wed, Oct 12, 2022 at 09:49:26AM -0600, Jason A. Donenfeld wrote:
>>> On Wed, Oct 12, 2022 at 07:18:27AM -0700, Guenter Roeck wrote:
>>>> NIP [c000000000031630] .replay_soft_interrupts+0x60/0x300
>>>> LR [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
>>>> Call Trace:
>>>> [c000000007df3870] [c000000000031964] .arch_local_irq_restore+0x94/0x1c0 (unreliable)
>>>> [c000000007df38f0] [c000000000f8a444] .__schedule+0x664/0xa50
>>>> [c000000007df39d0] [c000000000f8a8b0] .schedule+0x80/0x140
>>>> [c000000007df3a50] [c00000000092f0dc] .try_to_generate_entropy+0x118/0x174
>>>> [c000000007df3b40] [c00000000092e2e4] .urandom_read_iter+0x74/0x140
>>>> [c000000007df3bc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
>>>> [c000000007df3cd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
>>>> [c000000007df3d80] [c00000000002a88c] .system_call_exception+0x19c/0x330
>>>> [c000000007df3e10] [c00000000000c1d4] system_call_common+0xf4/0x258
>>>
>>> Obviously the first couple lines of this concern me a bit. But I think
>>> actually this might just be a catalyst for another bug. You could view
>>> that function as basically just:
>>>
>>>      while (something)
>>>      	schedule();
>>>
>>> And I guess in the process of calling the scheduler a lot, which toggles
>>> interrupts a lot, something got wedged.
>>>
>>> Curious, though, I did try to reproduce this, to no avail. My .config is
>>> https://xn--4db.cc/rBvHWfDZ . What's yours?
>>>
>>
>> Attached. My qemu command line is
> 
> Okay, thanks, I reproduced it. In this case, I suspect
> try_to_generate_entropy() is just the messenger. There's an earlier
> problem:
> 
> BUG: using smp_processor_id() in preemptible [00000000] code: swapper/0/1
> caller is .__flush_tlb_pending+0x40/0xf0
> CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-28380-gde492c83cae0-dirty #4
> Hardware name: PowerMac3,1 PPC970FX 0x3c0301 PowerMac
> Call Trace:
> [c0000000044c3540] [c000000000f93ef0] .dump_stack_lvl+0x7c/0xc4 (unreliable)
> [c0000000044c35d0] [c000000000fc9550] .check_preemption_disabled+0x140/0x150
> [c0000000044c3660] [c000000000073dd0] .__flush_tlb_pending+0x40/0xf0
> [c0000000044c36f0] [c000000000334434] .__apply_to_page_range+0x764/0xa30
> [c0000000044c3840] [c00000000006cad0] .change_memory_attr+0xf0/0x160
> [c0000000044c38d0] [c0000000002a1d70] .bpf_prog_select_runtime+0x150/0x230
> [c0000000044c3970] [c000000000d405d4] .bpf_prepare_filter+0x504/0x6f0
> [c0000000044c3a30] [c000000000d4085c] .bpf_prog_create+0x9c/0x140
> [c0000000044c3ac0] [c000000002051d9c] .ptp_classifier_init+0x44/0x78
> [c0000000044c3b50] [c000000002050f3c] .sock_init+0xe0/0x100
> [c0000000044c3bd0] [c000000000010bd4] .do_one_initcall+0xa4/0x438
> [c0000000044c3cc0] [c000000002005008] .kernel_init_freeable+0x378/0x428
> [c0000000044c3da0] [c0000000000113d8] .kernel_init+0x28/0x1a0
> [c0000000044c3e10] [c00000000000ca3c] .ret_from_kernel_thread+0x58/0x60
> 
> This in turn is because __flush_tlb_pending() calls:
> 
> static inline int mm_is_thread_local(struct mm_struct *mm)
> {
>          return cpumask_equal(mm_cpumask(mm),
>                                cpumask_of(smp_processor_id()));
> }
> 
> __flush_tlb_pending() has a comment about this:
> 
>   * Must be called from within some kind of spinlock/non-preempt region...
>   */
> void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
> 
> So I guess that didn't happen for some reason? Maybe this is indicative
> of some lock imbalance that then gets hit later?

I managed to bisect that problem. Unfortunately it points to the
scheduler merge. No idea what to do about that. Any idea ?
I am copying Peter and Ingo for comments.

Guenter

---
# bad: [1440f576022887004f719883acb094e7e0dd4944] Merge tag 'mm-hotfixes-stable-2022-10-11' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
# good: [4fe89d07dcc2804c8b562f6c7896a45643d34b2f] Linux 6.0
git bisect start 'HEAD' 'v6.0'
# good: [7171a8da00035e7913c3013ca5fb5beb5b8b22f0] Merge tag 'arm-dt-6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 7171a8da00035e7913c3013ca5fb5beb5b8b22f0
# good: [f01603979a4afaad7504a728918b678d572cda9e] Merge tag 'gpio-updates-for-v6.1-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux
git bisect good f01603979a4afaad7504a728918b678d572cda9e
# bad: [8aeab132e05fefc3a1a5277878629586bd7a3547] Merge tag 'for_linus' of git://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost
git bisect bad 8aeab132e05fefc3a1a5277878629586bd7a3547
# good: [493ffd6605b2d3d4dc7008ab927dba319f36671f] Merge tag 'ucount-rlimits-cleanups-for-v5.19' of git://git.kernel.org/pub/scm/linux/kernel/git/ebiederm/user-namespace
git bisect good 493ffd6605b2d3d4dc7008ab927dba319f36671f
# bad: [cdf072acb5baa18e5b05bdf3f13d6481f62396fc] Merge tag 'trace-v6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/trace/linux-trace
git bisect bad cdf072acb5baa18e5b05bdf3f13d6481f62396fc
# bad: [55be6084c8e0e0ada9278c2ab60b7a584378efda] Merge tag 'timers-core-2022-10-05' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 55be6084c8e0e0ada9278c2ab60b7a584378efda
# good: [82aad7ff7ac25c8cf09d491ae23b9823f1901486] perf/hw_breakpoint: Annotate tsk->perf_event_mutex vs ctx->mutex
git bisect good 82aad7ff7ac25c8cf09d491ae23b9823f1901486
# bad: [3871d93b82a4a6c1f4308064f046a544f16ada21] Merge tag 'perf-core-2022-10-07' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 3871d93b82a4a6c1f4308064f046a544f16ada21
# good: [33f93525799fa3c841b2ba93a56b2bb32ab11dc9] sched/deadline: Move __dl_clear_params out of dl_bw lock
git bisect good 33f93525799fa3c841b2ba93a56b2bb32ab11dc9
# good: [929659acea03db6411a32de9037abab9f856f586] sched/completion: Add wait_for_completion_state()
git bisect good 929659acea03db6411a32de9037abab9f856f586
# good: [b0defa7ae03ecf91b8bfd10ede430cff12fcbd06] sched/fair: Make sure to try to detach at least one movable task
git bisect good b0defa7ae03ecf91b8bfd10ede430cff12fcbd06
# good: [5aec788aeb8eb74282b75ac1b317beb0fbb69a42] sched: Fix TASK_state comparisons
git bisect good 5aec788aeb8eb74282b75ac1b317beb0fbb69a42
# bad: [30c999937f69abf935b0228b8411713737377d9e] Merge tag 'sched-core-2022-10-07' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad 30c999937f69abf935b0228b8411713737377d9e
# good: [fdf756f7127185eeffe00e918e66dfee797f3625] sched: Fix more TASK_state comparisons
git bisect good fdf756f7127185eeffe00e918e66dfee797f3625
# first bad commit: [30c999937f69abf935b0228b8411713737377d9e] Merge tag 'sched-core-2022-10-07' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip





