Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5662229E4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jul 2020 19:29:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B71T05nsLzDr7C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jul 2020 03:29:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::844; helo=mail-qt1-x844.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=drCtvPo4; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B71R31cr9zDr73
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jul 2020 03:27:24 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id a32so5504682qtb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jul 2020 10:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=3SjW0eKXV1WWX19KtSkUJ+Vc453aAsAnxs74aWw9fI4=;
 b=drCtvPo4WPKRUmuY+jTjlKh+4UwwBnuxBnKKS3ZgJ6XJFajNGYcJWQAXTL7r1j9fDY
 hUoFeYXHRq4GOGCjGUGsByuIUhY7zr7i8f95HNRVTIsccJXLo2N+kjfS7AMjwcbQmBSb
 AkNIhv/FAgzalYqDJ+LwsiKSR4sZ0C3ah5uqahxVC7L/hfobIskCe5YAdq8rxIZ9wXb4
 r2oOF+gRW6jP6+pdYPlZL/hV2JLtIV+DzRSsdv/INLdqB2IRjY4ONl4gKBJhhl100G//
 jiJ0IA3o1ymTiaYvpWcC/+oZN/O10D1mtHlRj9TVYRkwZd6GL/n3HyXssGbZ61l94P+C
 8EjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=3SjW0eKXV1WWX19KtSkUJ+Vc453aAsAnxs74aWw9fI4=;
 b=ciBMGoSdlmRB5EI5m5flhBtmtYypoO6sM7W3y1cUKvmU7xemZG5Mhcd3EYJzk0IobP
 OdHuLM2i62h3Vqz4TQ9ryjJSia2/Dv2cuLZ67/7MeauOCNborJNxCJb/+ON9r4IwWCUj
 GM9vbAaVE0beddEBWZep0TceyGEGtgxISFEoxLOoAX4vtEWdse04xeK/gE8dtG5UOovS
 vPQGOWWBV4EbciZ82ADY5txDJ5U57b77o7xvfJvyZA0foFlJxHBQYd3MhriPUHMMkV4R
 x1dHpNdOIEuAceA6DXZTGD4BTy2PtyHgXzcneYgSz79eCtfKHxsofTpOeBRhjrqcSZWG
 XLOQ==
X-Gm-Message-State: AOAM533AHWkwIgP4oIANlzkXxaijP3129kBFkls/oxWxKW0M6c7Puock
 lhjc2cJ0hM9Qvf1PgjfxL+MfnA==
X-Google-Smtp-Source: ABdhPJz/ydGIjnRj6afrX6aDgfpe2cpGyCHQWi4WuHuPQUgEkIPKQxiNmxnVJf47VQgRvi+WsguvZg==
X-Received: by 2002:ac8:1b8b:: with SMTP id z11mr6338411qtj.6.1594920441429;
 Thu, 16 Jul 2020 10:27:21 -0700 (PDT)
Received: from lca.pw (pool-71-184-117-43.bstnma.fios.verizon.net.
 [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id c7sm9442959qta.95.2020.07.16.10.27.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jul 2020 10:27:20 -0700 (PDT)
Date: Thu, 16 Jul 2020 13:27:14 -0400
From: Qian Cai <cai@lca.pw>
To: Bharata B Rao <bharata@linux.ibm.com>
Subject: Re: [PATCH v3 0/3] Off-load TLB invalidations to host for !GTSE
Message-ID: <20200716172713.GA4565@lca.pw>
References: <20200703053608.12884-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703053608.12884-1-bharata@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: sfr@canb.auug.org.au, aneesh.kumar@linux.ibm.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, linux-next@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 03, 2020 at 11:06:05AM +0530, Bharata B Rao wrote:
> Hypervisor may choose not to enable Guest Translation Shootdown Enable
> (GTSE) option for the guest. When GTSE isn't ON, the guest OS isn't
> permitted to use instructions like tblie and tlbsync directly, but is
> expected to make hypervisor calls to get the TLB flushed.
> 
> This series enables the TLB flush routines in the radix code to
> off-load TLB flushing to hypervisor via the newly proposed hcall
> H_RPT_INVALIDATE. 
> 
> To easily check the availability of GTSE, it is made an MMU feature.
> The OV5 handling and H_REGISTER_PROC_TBL hcall are changed to
> handle GTSE as an optionally available feature and to not assume GTSE
> when radix support is available.
> 
> The actual hcall implementation for KVM isn't included in this
> patchset and will be posted separately.
> 
> Changes in v3
> =============
> - Fixed a bug in the hcall wrapper code where we were missing setting
>   H_RPTI_TYPE_NESTED while retrying the failed flush request with
>   a full flush for the nested case.
> - s/psize_to_h_rpti/psize_to_rpti_pgsize
> 
> v2: https://lore.kernel.org/linuxppc-dev/20200626131000.5207-1-bharata@linux.ibm.com/T/#t
> 
> Bharata B Rao (2):
>   powerpc/mm: Enable radix GTSE only if supported.
>   powerpc/pseries: H_REGISTER_PROC_TBL should ask for GTSE only if
>     enabled
> 
> Nicholas Piggin (1):
>   powerpc/mm/book3s64/radix: Off-load TLB invalidations to host when
>     !GTSE

Reverting the whole series fixed random memory corruptions during boot on
POWER9 PowerNV systems below.

IBM 8335-GTH (ibm,witherspoon)
POWER9, altivec supported
262144 MB memory, 2000 GB disk space

.config:
https://gitlab.com/cailca/linux-mm/-/blob/master/powerpc.config

[    9.338996][  T925] BUG: Unable to handle kernel instruction fetch (NULL pointer?)
[    9.339026][  T925] Faulting instruction address: 0x00000000
[    9.339051][  T925] Oops: Kernel access of bad area, sig: 11 [#1]
[    9.339064][  T925] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=256 NUMA PowerNV
[    9.339098][  T925] Modules linked in: dm_mirror dm_region_hash dm_log dm_mod
[    9.339150][  T925] CPU: 92 PID: 925 Comm: (md-udevd) Not tainted 5.8.0-rc5-next-20200716 #3
[    9.339186][  T925] NIP:  0000000000000000 LR: c00000000021f2cc CTR: 0000000000000000
[    9.339210][  T925] REGS: c000201cb52d79b0 TRAP: 0400   Not tainted  (5.8.0-rc5-next-20200716)
[    9.339244][  T925] MSR:  9000000040009033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24222292  XER: 00000000
[    9.339278][  T925] CFAR: c00000000021f2c8 IRQMASK: 0 
[    9.339278][  T925] GPR00: c00000000021f2cc c000201cb52d7c40 c000000005901000 c000201cb52d7ca8 
[    9.339278][  T925] GPR04: c00800000ea60038 0000000000000000 000000007fff0000 000000007fff0000 
[    9.339278][  T925] GPR08: 0000000000000000 0000000000000000 c000201cb50bd500 0000000000000003 
[    9.339278][  T925] GPR12: 0000000000000000 c000201fff694500 00007fffa4a8a940 00007fffa4a8a6c8 
[    9.339278][  T925] GPR16: 00007fffa4a8a8f8 00007fffa4a8a650 00007fffa4a8a488 0000000000000000 
[    9.339278][  T925] GPR20: 0000000000050001 00007fffa4a8a984 000000007fff0000 c00000000a4545cc 
[    9.339278][  T925] GPR24: c000000000affe28 0000000000000000 0000000000000000 0000000000000166 
[    9.339278][  T925] GPR28: c000201cb52d7ca8 c00800000ea60000 c000201cc3b72600 000000007fff0000 
[    9.339493][  T925] NIP [0000000000000000] 0x0
[    9.339516][  T925] LR [c00000000021f2cc] __seccomp_filter+0xec/0x530
bpf_dispatcher_nop_func at include/linux/bpf.h:567
(inlined by) bpf_prog_run_pin_on_cpu at include/linux/filter.h:597
(inlined by) seccomp_run_filters at kernel/seccomp.c:324
(inlined by) __seccomp_filter at kernel/seccomp.c:937
[    9.339538][  T925] Call Trace:
[    9.339548][  T925] [c000201cb52d7c40] [c00000000021f2cc] __seccomp_filter+0xec/0x530 (unreliable)
[    9.339566][  T925] [c000201cb52d7d50] [c000000000025af8] do_syscall_trace_enter+0xb8/0x470
do_seccomp at arch/powerpc/kernel/ptrace/ptrace.c:252
(inlined by) do_syscall_trace_enter at arch/powerpc/kernel/ptrace/ptrace.c:327
[    9.339600][  T925] [c000201cb52d7dc0] [c00000000002c8f8] system_call_exception+0x138/0x180
[    9.339625][  T925] [c000201cb52d7e20] [c00000000000c9e8] system_call_common+0xe8/0x214
[    9.339648][  T925] Instruction dump:
[    9.339667][  T925] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
[    9.339706][  T925] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
[    9.339748][  T925] ---[ end trace d89eb80f9a6bc141 ]---
[  OK  ] Started Journal Service.
[   10.452364][  T925] Kernel panic - not syncing: Fatal exception
[   11.876655][  T925] ---[ end Kernel panic - not syncing: Fatal exception ]---

There could also be lots of random userspace segfault like,

[   16.463545][  T771] rngd[771]: segfault (11) at 0 nip 0 lr 0 code 1 in rngd[106d60000+20000]
[   16.463620][  T771] rngd[771]: code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX 
[   16.463656][  T771] rngd[771]: code: XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX

Occasionally, there are many soft-lockups,

[  396.920702][   C99] watchdog: BUG: soft lockup - CPU#99 stuck for 22s! [(spawn):2692]
[  396.920754][   C99] Modules linked in: kvm_hv kvm ip_tables x_tables sd_mod bnx2x tg3 ahci mdio libahci libphy firmware_class libata dm_mirror dm_region_hash dm_log dm_mod
[  396.920843][   C99] irq event stamp: 1731717220
[  396.920860][   C99] hardirqs last  enabled at (1731717219): [<c00000000004d6f4>] do_page_fault+0x324/0xd90
[  396.920889][   C99] hardirqs last disabled at (1731717220): [<c000000000015638>] arch_local_irq_restore+0x48/0xd0
[  396.920919][   C99] softirqs last  enabled at (41260): [<c0000000009abbe8>] __do_softirq+0x648/0x8c8
[  396.920948][   C99] softirqs last disabled at (41125): [<c0000000000d717c>] irq_exit+0x15c/0x1c0
[  396.920976][   C99] CPU: 99 PID: 2692 Comm: (spawn) Tainted: G             L    5.8.0-rc5-next-20200716 #3
[  396.921001][   C99] NIP:  c0000000000152b4 LR: c000000000015640 CTR: 0000000000000000
[  396.921037][   C99] REGS: c000201cbc3d7178 TRAP: 0900   Tainted: G             L     (5.8.0-rc5-next-20200716)
[  396.921074][   C99] MSR:  9000000000001033 <SF,HV,ME,IR,DR,RI,LE>  CR: 28022482  XER: 20040000
[  396.921122][   C99] CFAR: 0000000000000000 IRQMASK: 3 
[  396.921122][   C99] GPR00: c000000000015640 c000201cbc3d7340 c000000005901000 c000201cbc3d7178 
[  396.921122][   C99] GPR04: c0000000057d7280 0000000000000000 000000000002000a 0000000000000003 
[  396.921122][   C99] GPR08: 0000201cc61c0000 0000000000000000 0000000000000001 c00000000593f868 
[  396.921122][   C99] GPR12: 0000000000002000 c000201fff67e700 00007fffdcda3918 0000000139eeba60 
[  396.921122][   C99] GPR16: 0000000139f30130 00007fffdcda39c8 0000000139eea708 0000000000000000 
[  396.921122][   C99] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000008 
[  396.921122][   C99] GPR24: 0000000000000e60 0000000000000900 0000000000000500 0000000000000a00 
[  396.921122][   C99] GPR28: 0000000000000f00 0000000000000002 0000000000000003 c000201ca4212400 
[  396.921468][   C99] NIP [c0000000000152b4] replay_soft_interrupts+0x74/0x3b0
replay_soft_interrupts at arch/powerpc/kernel/irq.c:216
[  396.921504][   C99] LR [c000000000015640] arch_local_irq_restore+0x50/0xd0
arch_local_irq_restore at arch/powerpc/kernel/irq.c:375
[  396.921539][   C99] Call Trace:
[  396.921560][   C99] [c000201cbc3d7340] [c000000000015640] arch_local_irq_restore+0x50/0xd0 (unreliable)
[  396.921602][   C99] [c000201cbc3d7360] [c0000000009a0c68] lock_is_held_type+0xf8/0x180
[  396.921641][   C99] [c000201cbc3d73c0] [c0000000003e8cf0] mem_cgroup_from_task+0xa0/0x130
[  396.921666][   C99] [c000201cbc3d7400] [c000000000337950] handle_mm_fault+0x140/0x1d20
[  396.921703][   C99] [c000201cbc3d7500] [c00000000004d5ac] do_page_fault+0x1dc/0xd90
[  396.921763][   C99] [c000201cbc3d7600] [c00000000000c028] handle_page_fault+0x10/0x2c
[  396.921804][   C99] --- interrupt: 300 at futex_cleanup+0x3c0/0x740
[  396.921804][   C99]     LR = futex_cleanup+0x35c/0x740
[  396.921879][   C99] [c000201cbc3d79c0] [c0000000001df2e8] futex_exec_release+0x28/0x50
[  396.921929][   C99] [c000201cbc3d79f0] [c0000000000c5e54] exec_mm_release+0x24/0x50
[  396.921968][   C99] [c000201cbc3d7a30] [c000000000421e84] begin_new_exec+0x324/0xea0
[  396.922005][   C99] [c000201cbc3d7af0] [c0000000004d8f1c] load_elf_binary+0x7fc/0x1110
[  396.922042][   C99] [c000201cbc3d7bf0] [c000000000420824] exec_binprm+0x1c4/0x7d0
[  396.922079][   C99] [c000201cbc3d7cb0] [c000000000421540] do_execveat_common+0x710/0x960
[  396.922117][   C99] [c000201cbc3d7d90] [c000000000422a44] sys_execve+0x44/0x60
[  396.922156][   C99] [c000201cbc3d7dc0] [c00000000002c8b8] system_call_exception+0xf8/0x180
[  396.922205][   C99] [c000201cbc3d7e20] [c00000000000c9e8] system_call_common+0xe8/0x214
[  396.922253][   C99] Instruction dump:
[  396.922286][   C99] 3b000e60 3b400500 3b600a00 3b800f00 f8010010 f821fe11 38610028 e92d0c70 
[  396.922316][   C99] f9210198 39200000 8aed0989 48037df9 <60000000> 39200003 f9210160 56e90738


[  248.821138][  T676] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message. 
[  248.821170][  T676] khugepaged      D28416   682      2 0x00000800 
[  248.821212][  T676] Call Trace: 
[  248.821241][  T676] [c000001ff310f4e0] [c000000000caeb80] lru_add_drain_work+0x0/0x48 (unreliable) 
[  248.821275][  T676] [c000001ff310f6c0] [c00000000001a2d0] __switch_to+0x260/0x380 
[  248.821308][  T676] [c000001ff310f720] [c0000000009a18b8] __schedule+0x398/0x9f0 
[  248.821352][  T676] [c000001ff310f7f0] [c0000000009a1fa8] schedule+0x98/0x160 
[  248.821387][  T676] [c000001ff310f820] [c0000000009a9814] schedule_timeout+0x304/0x520 
[  248.821432][  T676] [c000001ff310f960] [c0000000009a3c84] wait_for_completion+0xc4/0x1b0 
[  248.821460][  T676] [c000001ff310f9d0] [c0000000000fd0c8] __flush_work+0x3b8/0x770 
[  248.821491][  T676] [c000001ff310faf0] [c0000000002e0ac4] lru_add_drain_all+0x3e4/0x760 
[  248.821521][  T676] [c000001ff310fbf0] [c0000000003e0f18] khugepaged+0xd8/0x1770 
[  248.821560][  T676] [c000001ff310fdb0] [c0000000001095fc] kthread+0x1bc/0x1d0 
[  248.821611][  T676] [c000001ff310fe20] [c00000000000cbc4] ret_from_kernel_thread+0x5c/0x78 
[  248.821655][  T676] INFO: task kworker/56:1:719 blocked for more than 122 seconds. 
[  248.821689][  T676]       Tainted: G             L    5.8.0-rc5-next-20200716 #3 
[  248.821729][  T676] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message. 
[  248.821779][  T676] kworker/56:1    D27584   719      2 0x00000800 
[  248.821839][  T676] Workqueue: rcu_gp wait_rcu_exp_gp 
[  248.821862][  T676] Call Trace: 
[  248.821888][  T676] [c000001ff2b57660] [c0000000057c9fb0] rcu_state+0x4fb0/0x5100 (unreliable) 
[  248.821934][  T676] [c000001ff2b57840] [c00000000001a2d0] __switch_to+0x260/0x380 
[  248.821977][  T676] [c000001ff2b578a0] [c0000000009a18b8] __schedule+0x398/0x9f0 
[  248.822021][  T676] [c000001ff2b57970] [c0000000009a1fa8] schedule+0x98/0x160 
[  248.822066][  T676] [c000001ff2b579a0] [c0000000009a970c] schedule_timeout+0x1fc/0x520 
[  248.822110][  T676] [c000001ff2b57ae0] [c0000000001a86d0] rcu_exp_wait_wake+0x1b0/0x950 
[  248.822153][  T676] [c000001ff2b57c30] [c0000000000fb754] process_one_work+0x304/0x900 
[  248.822197][  T676] [c000001ff2b57d20] [c0000000000fbdc8] worker_thread+0x78/0x520 
[  248.822242][  T676] [c000001ff2b57db0] [c0000000001095fc] kthread+0x1bc/0x1d0 
[  248.822279][  T676] [c000001ff2b57e20] [c00000000000cbc4] ret_from_kernel_thread+0x5c/0x78 
[  248.822385][  T676] INFO: task lvm:3123 blocked for more than 122 seconds. 
[  248.822413][  T676]       Tainted: G             L    5.8.0-rc5-next-20200716 #3 
[  248.822462][  T676] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message. 
[  248.822503][  T676] lvm             D26608  3123      1 0x00040000 
[  248.822552][  T676] Call Trace: 
[  248.822576][  T676] [c000001feee27a00] [c00000000001a2d0] __switch_to+0x260/0x380 
[  248.822620][  T676] [c000001feee27a60] [c0000000009a18b8] __schedule+0x398/0x9f0 
[  248.822648][  T676] [c000001feee27b30] [c0000000009a1fa8] schedule+0x98/0x160 
[  248.822680][  T676] [c000001feee27b60] [c0000000009a9814] schedule_timeout+0x304/0x520 
[  248.822724][  T676] [c000001feee27ca0] [c0000000009a3c84] wait_for_completion+0xc4/0x1b0 
[  248.822768][  T676] [c000001feee27d10] [c0000000004b0e88] sys_io_destroy+0x238/0x2f0 
[  248.822808][  T676] [c000001feee27dc0] [c00000000002c8b8] system_call_exception+0xf8/0x180 
[  248.822840][  T676] [c000001feee27e20] [c00000000000c9e8] system_call_common+0xe8/0x214 
[  248.822873][  T676] INFO: task lvm:3126 blocked for more than 122 seconds. 
[  248.822901][  T676]       Tainted: G             L    5.8.0-rc5-next-20200716 #3 
[  248.822938][  T676] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message. 
[  248.822987][  T676] lvm             D26608  3126      1 0x00040000 
[  248.823017][  T676] Call Trace: 
[  248.823031][  T676] [c000001fc0b27a00] [c00000000001a2d0] __switch_to+0x260/0x380 
[  248.823075][  T676] [c000001fc0b27a60] [c0000000009a18b8] __schedule+0x398/0x9f0 
[  248.823113][  T676] [c000001fc0b27b30] [c0000000009a1fa8] schedule+0x98/0x160 
[  248.823158][  T676] [c000001fc0b27b60] [c0000000009a9814] schedule_timeout+0x304/0x520 
[  248.823199][  T676] [c000001fc0b27ca0] [c0000000009a3c84] wait_for_completion+0xc4/0x1b0 
[  248.823250][  T676] [c000001fc0b27d10] [c0000000004b0e88] sys_io_destroy+0x238/0x2f0 
[  248.823294][  T676] [c000001fc0b27dc0] [c00000000002c8b8] system_call_exception+0xf8/0x180 
[  248.823332][  T676] [c000001fc0b27e20] [c00000000000c9e8] system_call_common+0xe8/0x214 
[  248.823374][  T676] INFO: task auditd:3163 blocked for more than 122 seconds. 
[  248.823424][  T676]       Tainted: G             L    5.8.0-rc5-next-20200716 #3 
[  248.823471][  T676] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message. 
[  248.823512][  T676] auditd          D27088  3163      1 0x00042408 
[  248.823551][  T676] Call Trace: 
[  248.823583][  T676] [c000001fc080f760] [0000000200000001] 0x200000001 (unreliable) 
[  248.823648][  T676] [c000001fc080f940] [c00000000001a2d0] __switch_to+0x260/0x380 
[  248.823689][  T676] [c000001fc080f9a0] [c0000000009a18b8] __schedule+0x398/0x9f0 
[  248.823742][  T676] [c000001fc080fa70] [c0000000009a1fa8] schedule+0x98/0x160 
[  248.823784][  T676] [c000001fc080faa0] [c0000000001a9244] synchronize_rcu_expedited+0x394/0x600 
[  248.823837][  T676] [c000001fc080fba0] [c0000000004504c4] namespace_unlock+0xf4/0x230 
[  248.823881][  T676] [c000001fc080fc00] [c000000000456dec] put_mnt_ns+0x5c/0x80 
[  248.823926][  T676] [c000001fc080fc30] [c00000000010ba6c] free_nsproxy+0x2c/0x1e0 
[  248.823966][  T676] [c000001fc080fc60] [c0000000000d5130] do_exit+0x4e0/0xee0 
[  248.823997][  T676] [c000001fc080fd60] [c0000000000d5bec] do_group_exit+0x5c/0xd0 
[  248.824019][  T676] [c000001fc080fda0] [c0000000000d5c7c] sys_exit_group+0x1c/0x20 
[  248.824060][  T676] [c000001fc080fdc0] [c00000000002c8b8] system_call_exception+0xf8/0x180 
[  248.824103][  T676] [c000001fc080fe20] [c00000000000c9e8] system_call_common+0xe8/0x214 
[  248.824192][  T676]  
[  248.824192][  T676] Showing all locks held in the system: 
[  248.824419][  T676] 1 lock held by khungtaskd/676: 
[  248.824455][  T676]  #0: c0000000057c44c0 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire.constprop.29+0x8/0x30 
[  248.824531][  T676] 1 lock held by khugepaged/682: 
[  248.824565][  T676]  #0: c0000000057f42c8 (lock#4){+.+.}-{3:3}, at: lru_add_drain_all+0x68/0x760 
[  248.824679][  T676] 2 locks held by kworker/56:1/719: 
[  248.824742][  T676]  #0: c00000000bcc8938 ((wq_completion)rcu_gp){+.+.}-{0:0}, at: process_one_work+0x21c/0x900 
[  248.824857][  T676]  #1: c000001ff2b57c90 ((work_completion)(&rew.rew_work)){+.+.}-{0:0}, at: process_one_work+0x21c/0x900 
[  248.825026][  T676] 3 locks held by (spawn)/2692: 
[  248.825077][  T676] 1 lock held by auditd/3163: 
[  248.825135][  T676]  #0: c0000000057c9ee8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: synchronize_rcu_expedited+0x254/0x600 
[  248.825296][  T676] ============================================= 
[  248.825296][  T676]  

> 
>  .../include/asm/book3s/64/tlbflush-radix.h    | 15 ++++
>  arch/powerpc/include/asm/hvcall.h             | 34 +++++++-
>  arch/powerpc/include/asm/mmu.h                |  4 +
>  arch/powerpc/include/asm/plpar_wrappers.h     | 52 ++++++++++++
>  arch/powerpc/kernel/dt_cpu_ftrs.c             |  1 +
>  arch/powerpc/kernel/prom_init.c               | 13 +--
>  arch/powerpc/mm/book3s64/radix_tlb.c          | 82 +++++++++++++++++--
>  arch/powerpc/mm/init_64.c                     |  5 +-
>  arch/powerpc/platforms/pseries/lpar.c         |  8 +-
>  9 files changed, 197 insertions(+), 17 deletions(-)
> 
> -- 
> 2.21.3
> 
