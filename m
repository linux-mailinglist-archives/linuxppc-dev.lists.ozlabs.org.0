Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0DA1DB44E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 14:58:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Rt8W6GtwzDqZk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 22:58:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=205.233.59.134; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rt5q1G36zDqV3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 22:55:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=0ybvT9DzlJF6vlSWGDITQ4VMJnl0WE8ge4NCMcPhnmk=; b=wl7ptPBvkgr3B5w12TuSs6M8JC
 ado3HNexn7dI2Bk2SoAubviXOTtmRikBMAzx1by+tBCZ1pb37k/CIis3yYGq8wRyA/OCMSA6SyFmU
 KV/aFy2o+YlbZsEwTrgK7KOtYOfK1azF8DYHYRBo7vmzy2EeoRDI9CKGCdmXBXSEe4KM8Yfwgp2Yz
 k+MAqXK4H7rz+dkmsebbT0DyVuoJCe5m+Gug22Fw/GlkLHBZQxoQnufIIaWpURVEW4jEG1x8y8Fch
 MsAV/5BVa7EDmUKTZmzjwrmI+0vvEAXHZC3m4NRLzuHC9DZAZlFyW4N+Qf7BGTm8pgsVoMtrRU267
 cAyl9N4g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbOBW-0000Nk-UL; Wed, 20 May 2020 12:50:59 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id AE7E530015A;
 Wed, 20 May 2020 14:50:56 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 93F8529DB4FE3; Wed, 20 May 2020 14:50:56 +0200 (CEST)
Date: Wed, 20 May 2020 14:50:56 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Qian Cai <cai@lca.pw>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200520125056.GC325280@hirez.programming.kicks-ass.net>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 19, 2020 at 11:58:17PM -0400, Qian Cai wrote:
> Just a head up. Repeatedly compiling kernels for a while would trigger
> endless soft-lockups since next-20200519 on both x86_64 and powerpc.
> .config are in,

Could be 90b5363acd47 ("sched: Clean up scheduler_ipi()"), although I've
not seen anything like that myself. Let me go have a look.


In as far as the logs are readable (they're a wrapped mess, please don't
do that!), they contain very little useful, as is typical with IPIs :/

> [ 1167.993773][    C1] WARNING: CPU: 1 PID: 0 at kernel/smp.c:127
> flush_smp_call_function_queue+0x1fa/0x2e0
> [ 1168.003333][    C1] Modules linked in: nls_iso8859_1 nls_cp437 vfat
> fat kvm_amd ses kvm enclosure dax_pmem irqbypass dax_pmem_core efivars
> acpi_cpufreq efivarfs ip_tables x_tables xfs sd_mod smartpqi
> scsi_transport_sas tg3 mlx5_core libphy firmware_class dm_mirror
> dm_region_hash dm_log dm_mod
> [ 1168.029492][    C1] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
> 5.7.0-rc6-next-20200519 #1
> [ 1168.037665][    C1] Hardware name: HPE ProLiant DL385
> Gen10/ProLiant DL385 Gen10, BIOS A40 07/10/2019
> [ 1168.046978][    C1] RIP: 0010:flush_smp_call_function_queue+0x1fa/0x2e0
> [ 1168.053658][    C1] Code: 01 0f 87 c9 12 00 00 83 e3 01 0f 85 cc fe
> ff ff 48 c7 c7 c0 55 a9 8f c6 05 f6 86 cd 01 01 e8 de 09 ea ff 0f 0b
> e9 b2 fe ff ff <0f> 0b e9 52 ff ff ff 0f 0b e9 f2 fe ff ff 65 44 8b 25
> 10 52 3f 71
> [ 1168.073262][    C1] RSP: 0018:ffffc90000178918 EFLAGS: 00010046
> [ 1168.079253][    C1] RAX: 0000000000000000 RBX: ffff8888430c58f8
> RCX: ffffffff8ec26083
> [ 1168.087156][    C1] RDX: 0000000000000003 RSI: dffffc0000000000
> RDI: ffff8888430c58f8
> [ 1168.095054][    C1] RBP: ffffc900001789a8 R08: ffffed1108618cec
> R09: ffffed1108618cec
> [ 1168.102964][    C1] R10: ffff8888430c675b R11: 0000000000000000
> R12: ffff8888430c58e0
> [ 1168.110866][    C1] R13: ffffffff8eb30c40 R14: ffff8888430c5880
> R15: ffff8888430c58e0
> [ 1168.118767][    C1] FS:  0000000000000000(0000)
> GS:ffff888843080000(0000) knlGS:0000000000000000
> [ 1168.127628][    C1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [ 1168.134129][    C1] CR2: 000055b169604560 CR3: 0000000d08a14000
> CR4: 00000000003406e0
> [ 1168.142026][    C1] Call Trace:
> [ 1168.145206][    C1]  <IRQ>
> [ 1168.147957][    C1]  ? smp_call_on_cpu_callback+0xd0/0xd0
> [ 1168.153421][    C1]  ? rcu_read_lock_sched_held+0xac/0xe0
> [ 1168.158880][    C1]  ? rcu_read_lock_bh_held+0xc0/0xc0
> [ 1168.164076][    C1]  generic_smp_call_function_single_interrupt+0x13/0x2b
> [ 1168.170938][    C1]  smp_call_function_single_interrupt+0x157/0x4e0
> [ 1168.177278][    C1]  ? smp_call_function_interrupt+0x4e0/0x4e0
> [ 1168.183172][    C1]  ? interrupt_entry+0xe4/0xf0
> [ 1168.187846][    C1]  ? trace_hardirqs_off_caller+0x8d/0x1f0
> [ 1168.193478][    C1]  ? trace_hardirqs_on_caller+0x1f0/0x1f0
> [ 1168.199116][    C1]  ? _nohz_idle_balance+0x221/0x360
> [ 1168.204228][    C1]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> [ 1168.209690][    C1]  call_function_single_interrupt+0xf/0x20
