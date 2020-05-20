Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EF26F1DA8E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 06:00:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RfCg6KHDzDqWX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:59:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2a00:1450:4864:20::644; helo=mail-ej1-x644.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=oTstFMXK; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RfB11rQWzDqWR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 13:58:32 +1000 (AEST)
Received: by mail-ej1-x644.google.com with SMTP id l21so1602599eji.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 20:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=y0ceURLh1cG/m7MRLKI1ykSu/ArqlsYe04+aHCm8s8w=;
 b=oTstFMXKjlK6iPs6Im4fp56Jd0zqw4KEdbjH4n1AKjWmL18lC2MfhmkdfL+hYxEbQt
 1X45EUYt1PPEzvS5HH7iW3nPC9+2ZDOq2yd8PIAm3ryJe7xZgRy277ATM7tBdWFJUpGh
 pSkXJNjyja5jN1b2PIZysNCc4ZGUHfvubQKJrVhqz94GSiga/d8FsF6q0t+DCHbUiGnG
 St0Rza2a7kyOhVBPqUfwduhMcvXY2oMEKb3eJ6zd4cajMWVgpbkaBG6lL7/vrBjCkoSH
 quFueDSB68AbYKkYAFTKJCgkjL+xbmSbUT1ghWQdvKmiU8bkZVpebGMjmqztVoSWEaXz
 +Eng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=y0ceURLh1cG/m7MRLKI1ykSu/ArqlsYe04+aHCm8s8w=;
 b=PPqvOsupjHp7Jfz6tPqWDpktZbNUQ+c+omwX6c8KdvrPV9shScyxhJjaD9xwTiOm7p
 KAY6KPqRbvjmvFHAWr3ZQqidiAjcxGxDE2vNRrs3wFHYiFnu/tWKLL0lIcTN+HZcNtsc
 TR8scAy6Rj/rX3ntqpI7RYz7beAzoblUmlZL9qZtJhq2Bo408kOxjWm2kkjC5TNZ54qD
 /d5moM4RaPKdRueLq6tkU8cc8cnU23DdfWdxu61BM3pb3yeOhW0yJdR431C5tVsEzXw4
 PpuZ/CDpmtuCVZH0iXJTBC8hIjHLX0CNLwqBJx25g3SnnFIf8UfNEBtDjcH8pjLqb6Fr
 LNxw==
X-Gm-Message-State: AOAM531RFUR4f/1pI/M6DlIy3yXQmBHbO6JT75JQBL6L7aSXOW32uu17
 JgwZ4H83UvUg3xaop/7aRL6blPQpEX7Becz8bM63KA==
X-Google-Smtp-Source: ABdhPJxdsNmxYQGKdSgfWOH/NaoFnrqLpJ/+kgn/yvN5szdAfxlOm2EGP35LtR4inToJ6EhQVkTZqWRqFjkRsNpw7Mk=
X-Received: by 2002:a17:906:7256:: with SMTP id
 n22mr2238477ejk.31.1589947108372; 
 Tue, 19 May 2020 20:58:28 -0700 (PDT)
MIME-Version: 1.0
From: Qian Cai <cai@lca.pw>
Date: Tue, 19 May 2020 23:58:17 -0400
Message-ID: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
Subject: Endless soft-lockups for compiling workload since next-20200519
To: "Paul E. McKenney" <paulmck@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Just a head up. Repeatedly compiling kernels for a while would trigger
endless soft-lockups since next-20200519 on both x86_64 and powerpc.
.config are in,

https://github.com/cailca/linux-mm

I did first try to revert the linux-next commit 68cd9f4e7238
("tick/nohz: Narrow down noise while setting current task's tick
dependency"), but it did not help.

== x86_64 ==
[ 1167.993773][    C1] WARNING: CPU: 1 PID: 0 at kernel/smp.c:127
flush_smp_call_function_queue+0x1fa/0x2e0
[ 1168.003333][    C1] Modules linked in: nls_iso8859_1 nls_cp437 vfat
fat kvm_amd ses kvm enclosure dax_pmem irqbypass dax_pmem_core efivars
acpi_cpufreq efivarfs ip_tables x_tables xfs sd_mod smartpqi
scsi_transport_sas tg3 mlx5_core libphy firmware_class dm_mirror
dm_region_hash dm_log dm_mod
[ 1168.029492][    C1] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
5.7.0-rc6-next-20200519 #1
[ 1168.037665][    C1] Hardware name: HPE ProLiant DL385
Gen10/ProLiant DL385 Gen10, BIOS A40 07/10/2019
[ 1168.046978][    C1] RIP: 0010:flush_smp_call_function_queue+0x1fa/0x2e0
[ 1168.053658][    C1] Code: 01 0f 87 c9 12 00 00 83 e3 01 0f 85 cc fe
ff ff 48 c7 c7 c0 55 a9 8f c6 05 f6 86 cd 01 01 e8 de 09 ea ff 0f 0b
e9 b2 fe ff ff <0f> 0b e9 52 ff ff ff 0f 0b e9 f2 fe ff ff 65 44 8b 25
10 52 3f 71
[ 1168.073262][    C1] RSP: 0018:ffffc90000178918 EFLAGS: 00010046
[ 1168.079253][    C1] RAX: 0000000000000000 RBX: ffff8888430c58f8
RCX: ffffffff8ec26083
[ 1168.087156][    C1] RDX: 0000000000000003 RSI: dffffc0000000000
RDI: ffff8888430c58f8
[ 1168.095054][    C1] RBP: ffffc900001789a8 R08: ffffed1108618cec
R09: ffffed1108618cec
[ 1168.102964][    C1] R10: ffff8888430c675b R11: 0000000000000000
R12: ffff8888430c58e0
[ 1168.110866][    C1] R13: ffffffff8eb30c40 R14: ffff8888430c5880
R15: ffff8888430c58e0
[ 1168.118767][    C1] FS:  0000000000000000(0000)
GS:ffff888843080000(0000) knlGS:0000000000000000
[ 1168.127628][    C1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[ 1168.134129][    C1] CR2: 000055b169604560 CR3: 0000000d08a14000
CR4: 00000000003406e0
[ 1168.142026][    C1] Call Trace:
[ 1168.145206][    C1]  <IRQ>
[ 1168.147957][    C1]  ? smp_call_on_cpu_callback+0xd0/0xd0
[ 1168.153421][    C1]  ? rcu_read_lock_sched_held+0xac/0xe0
[ 1168.158880][    C1]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1168.164076][    C1]  generic_smp_call_function_single_interrupt+0x13/0x2b
[ 1168.170938][    C1]  smp_call_function_single_interrupt+0x157/0x4e0
[ 1168.177278][    C1]  ? smp_call_function_interrupt+0x4e0/0x4e0
[ 1168.183172][    C1]  ? interrupt_entry+0xe4/0xf0
[ 1168.187846][    C1]  ? trace_hardirqs_off_caller+0x8d/0x1f0
[ 1168.193478][    C1]  ? trace_hardirqs_on_caller+0x1f0/0x1f0
[ 1168.199116][    C1]  ? _nohz_idle_balance+0x221/0x360
[ 1168.204228][    C1]  ? trace_hardirqs_off_thunk+0x1a/0x1c
[ 1168.209690][    C1]  call_function_single_interrupt+0xf/0x20
[ 1168.215415][    C1] RIP: 0010:_raw_spin_unlock_irqrestore+0x46/0x50
[ 1168.221747][    C1] Code: 8d 5e ff 4c 89 e7 e8 a9 35 5f ff f6 c7 02
75 13 53 9d e8 fd c0 6f ff 65 ff 0d 4e ab a6 70 5b 41 5c 5d c3 e8 dc
c2 6f ff 53 9d <eb> eb 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 55 65 ff
05 2b ab a6
[ 1168.241353][    C1] RSP: 0018:ffffc90000178bd0 EFLAGS: 00000246
ORIG_RAX: ffffffffffffff04
[ 1168.249700][    C1] RAX: 0000000000000000 RBX: 0000000000000246
RCX: ffffffff8eba0740
[ 1168.257602][    C1] RDX: 0000000000000007 RSI: dffffc0000000000
RDI: ffff888214f5c8e4
[ 1168.265503][    C1] RBP: ffffc90000178be0 R08: fffffbfff2120216
R09: 0000000000000000
[ 1168.273400][    C1] R10: 0000000000000000 R11: 0000000000000000
R12: ffff888843145880
[ 1168.281300][    C1] R13: ffffffff90b2db80 R14: 0000000000000002
R15: 00000001000164cb
[ 1168.289218][    C1]  ? call_function_single_interrupt+0xa/0x20
[ 1168.295117][    C1]  ? lockdep_hardirqs_on+0x1b0/0x2c0
[ 1168.300319][    C1]  _nohz_idle_balance+0x221/0x360
[ 1168.305256][    C1]  run_rebalance_domains+0x16c/0x2e0
[ 1168.310452][    C1]  __do_softirq+0x1ca/0x96a
[ 1168.314861][    C1]  ? __irqentry_text_end+0x1fa9e7/0x1fa9e7
[ 1168.320579][    C1]  ? hrtimer_reprogram+0x170/0x170
[ 1168.325608][    C1]  ? __bpf_trace_preemptirq_template+0x100/0x100
[ 1168.331856][    C1]  ? lapic_next_event+0x3c/0x50
[ 1168.336617][    C1]  ? clockevents_program_event+0xfc/0x180
[ 1168.342249][    C1]  ? check_flags.part.28+0x86/0x220
[ 1168.347355][    C1]  ? trace_hardirqs_off+0x8d/0x1f0
[ 1168.352374][    C1]  ? __bpf_trace_preemptirq_template+0x100/0x100
[ 1168.358620][    C1]  ? rcu_read_lock_sched_held+0xac/0xe0
[ 1168.364077][    C1]  ? rcu_read_lock_bh_held+0xc0/0xc0
[ 1168.369282][    C1]  irq_exit+0xd6/0xf0
[ 1168.373168][    C1]  smp_apic_timer_interrupt+0x215/0x560
[ 1168.378628][    C1]  ? smp_call_function_single_interrupt+0x4e0/0x4e0
[ 1168.385137][    C1]  ? smp_call_function_interrupt+0x4e0/0x4e0
[ 1168.391031][    C1]  ? interrupt_entry+0xe4/0xf0
[ 1168.395705][    C1]  ? trace_hardirqs_off_caller+0x8d/0x1f0
[ 1168.401336][    C1]  ? trace_hardirqs_off_caller+0x8d/0x1f0
[ 1168.406969][    C1]  ? trace_hardirqs_on_caller+0x1f0/0x1f0
[ 1168.412602][    C1]  ? trace_hardirqs_on_caller+0x1f0/0x1f0
[ 1168.418234][    C1]  ? __kasan_check_write+0x14/0x20
[ 1168.423260][    C1]  ? rcu_dynticks_eqs_enter+0x25/0x40
[ 1168.428550][    C1]  ? trace_hardirqs_off_thunk+0x1a/0x1c
[ 1168.434013][    C1]  apic_timer_interrupt+0xf/0x20
[ 1168.438855][    C1]  </IRQ>
[ 1168.441698][    C1] RIP: 0010:cpuidle_enter_state+0x1d1/0xac0
[ 1168.447504][    C1] Code: ff e8 63 22 7c ff 80 bd 28 ff ff ff 00 74
12 9c 58 f6 c4 02 0f 85 cc 06 00 00 31 ff e8 d8 1e 8a ff e8 23 c4 93
ff fb 45 85 ed <0f> 88 dc 01 00 00 4d 63 f5 49 83 fe 09 0f 87 d0 07 00
00 4b 8d 14
[ 1168.467110][    C1] RSP: 0018:ffffc9000031fc70 EFLAGS: 00000202
ORIG_RAX: ffffffffffffff13
[ 1168.475452][    C1] RAX: 0000000000000000 RBX: ffff8886381b4400
RCX: ffffffff8eba0740
[ 1168.483353][    C1] RDX: 0000000000000007 RSI: dffffc0000000000
RDI: ffff888214f5c8e4
[ 1168.491255][    C1] RBP: ffffc9000031fd78 R08: fffffbfff2120216
R09: 0000000000000000
[ 1168.499158][    C1] R10: 0000000000000000 R11: 0000000000000000
R12: 0000000000000001
[ 1168.507061][    C1] R13: 0000000000000002 R14: ffffffff90695bb0
R15: 0000010ff187211b
[ 1168.514971][    C1]  ? lockdep_hardirqs_on+0x1b0/0x2c0
[ 1168.520178][    C1]  ? tick_nohz_idle_stop_tick+0x2b0/0x690
[ 1168.525817][    C1]  ? cpuidle_enter_s2idle+0x280/0x280
[ 1168.531104][    C1]  ? tick_nohz_tick_stopped_cpu+0xa0/0xa0
[ 1168.536741][    C1]  ? menu_enable_device+0xf0/0xf0
[ 1168.541679][    C1]  ? trace_hardirqs_off+0x1f0/0x1f0
[ 1168.546794][    C1]  cpuidle_enter+0x41/0x70
[ 1168.551126][    C1]  do_idle+0x3cf/0x440

== powerpc ==
[13720.177440][   C35] WARNING: CPU: 35 PID: 0 at kernel/smp.c:127
flush_smp_call_function_queue+0x104/0x360
[13720.177562][   C35] Modules linked in: nf_tables nfnetlink cn
kvm_hv kvm ip_tables x_tables xfs sd_mod bnx2x ahci tg3 libahci mdio
libphy libata firmware_class dm_mirror dm_region_hash dm_log dm_mod
[13720.177776][   C35] CPU: 35 PID: 0 Comm: swapper/35 Tainted: G
  W    L    5.7.0-rc6-next-20200519 #2
[13720.177877][   C35] NIP:  c000000000275f44 LR: c000000000275f60
CTR: c0000000001875b0
[13720.177952][   C35] REGS: c00000003e64f0c0 TRAP: 0700   Tainted: G
      W    L     (5.7.0-rc6-next-20200519)
[13720.178061][   C35] MSR:  9000000000029033
<SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24002428  XER: 20040000
[13720.178183][   C35] CFAR: c000000000275f68 IRQMASK: 1
[13720.178183][   C35] GPR00: c000000000275f60 c00000003e64f350
c000000001765000 c000001ffe204000
[13720.178183][   C35] GPR04: c00000000179bc30 0000000000000000
c00000003e64f674 c000201fff7ff800
[13720.178183][   C35] GPR08: 0000000000000000 0000000000000001
c0000000001875b0 000000003b70faa3
[13720.178183][   C35] GPR12: c0000000001875b0 c000001ffffe2a80
c000001ffe2b4018 0000000000000024
[13720.178183][   C35] GPR16: 0000000000000000 c000001ffe204000
0000000000000000 c0000000015b1e90
[13720.178183][   C35] GPR20: 000000010013d6df 0000000000000003
0000000000000001 0000000000000002
[13720.178183][   C35] GPR24: 0000000000000000 c00000000179c664
c00000003e64f4f8 c00000000179c3b0
[13720.178183][   C35] GPR28: 0000001ffd0b0000 0000000000000000
c000001ffe204060 c000001ffe204060
[13720.179023][   C35] NIP [c000000000275f44]
flush_smp_call_function_queue+0x104/0x360
[13720.179104][   C35] LR [c000000000275f60]
flush_smp_call_function_queue+0x120/0x360
[13720.179191][   C35] Call Trace:
[13720.179225][   C35] [c00000003e64f350] [c000000000275f60]
flush_smp_call_function_queue+0x120/0x360 (unreliable)
[13720.179337][   C35] [c00000003e64f3f0] [c000000000059894]
smp_ipi_demux_relaxed+0xa4/0x100
[13720.179439][   C35] [c00000003e64f430] [c000000000053084]
doorbell_exception+0x124/0x730
[13720.179525][   C35] [c00000003e64f4d0] [c000000000017404]
replay_soft_interrupts+0x254/0x3c0
[13720.179622][   C35] [c00000003e64f6c0] [c0000000000175c0]
arch_local_irq_restore+0x50/0xd0
[13720.179714][   C35] [c00000003e64f6e0] [c000000000adc3f0]
_raw_spin_unlock_irqrestore+0xa0/0xd0
[13720.179806][   C35] [c00000003e64f710] [c0000000001a8f68]
_nohz_idle_balance+0x308/0x450
[13720.179900][   C35] [c00000003e64f810] [c000000000add04c]
__do_softirq+0x3ac/0xaa8
[13720.179986][   C35] [c00000003e64f990] [c00000000012981c]
irq_exit+0x16c/0x1d0
[13720.180080][   C35] [c00000003e64fa00] [c00000000002771c]
timer_interrupt+0x1fc/0x880
[13720.180162][   C35] [c00000003e64fac0] [c000000000017344]
replay_soft_interrupts+0x194/0x3c0
[13720.180266][   C35] [c00000003e64fcb0] [c0000000000175c0]
arch_local_irq_restore+0x50/0xd0
[13720.180367][   C35] [c00000003e64fcd0] [c0000000008cee78]
cpuidle_enter_state+0x128/0x9f0
[13720.180464][   C35] [c00000003e64fd80] [c0000000008cf7e0]
cpuidle_enter+0x50/0x70
[13720.180543][   C35] [c00000003e64fdc0] [c00000000018e2ec]
call_cpuidle+0x4c/0x90
[13720.180638][   C35] [c00000003e64fde0] [c00000000018e7f8] do_idle+0x378/0x470
[13720.506608][   C35] [c00000003e64fe90] [c00000000018ed18]
cpu_startup_entry+0x38/0x40
[13720.506678][   C35] [c00000003e64fec0] [c00000000005b0a0]
start_secondary+0x780/0xa20
[13720.506759][   C35] [c00000003e64ff90] [c00000000000c454]
start_secondary_prolog+0x10/0x14
[13720.506851][   C35] Instruction dump:
[13720.506909][   C35] 2fbe0000 93bf0018 7fdff378 419e004c 813f0018
ebdf0000 e95f0008 e87f0010
[13720.507016][   C35] 71280002 4082ffb8 7d2948f8 552907fe <0b090000>
7c2004ac 911f0018 7d4c5378
[13720.507119][   C35] irq event stamp: 122776347
[13720.507202][   C35] hardirqs last  enabled at (122776346):
[<c000000000adc3e4>] _raw_spin_unlock_irqrestore+0x94/0xd0
[13720.507303][   C35] hardirqs last disabled at (122776347):
[<c0000000000175b8>] arch_local_irq_restore+0x48/0xd0
[13720.507427][   C35] softirqs last  enabled at (122776342):
[<c0000000001296ac>] irq_enter+0x9c/0xa0
[13720.507517][   C35] softirqs last disabled at (122776343):
[<c00000000012981c>] irq_exit+0x16c/0x1d0
[13720.507632][   C35] ---[ end trace 20587d9746d61ca8 ]---
