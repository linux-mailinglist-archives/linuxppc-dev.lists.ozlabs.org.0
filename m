Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D17661DB5FF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 16:12:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RvpP4VrxzDqPm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 00:12:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.a=rsa-sha256
 header.s=google header.b=DpnwHaMc; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49RvhF1DHHzDqNJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 00:07:06 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id v4so2604069qte.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 07:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=bjJXR8Yg4wTMD7SKdVhAgm+g3J55wUR6Z+IcSDvh2Lk=;
 b=DpnwHaMc3opSt7eKR4E8g1TWF8JZOpmYqddsKoobl8UfV5BStJNNc488zQCGaM5u8q
 /RR4VIBfD+IHZxkW3fBezRpLdBXEJ+AXdkNkQkJfNLzlz8pLgW0ptdVFuGEZGOK+9Tq+
 6ZHN6BYD1KejwJcBdbvw0ylbciOUoM0JTALzQLgYZlmPVQ6+mQffLH/Xr8x4xsBfiLQZ
 dZFoRTW1l+WwFs25xjWb8jt2GkUM3ZZy+Ga5XRZLMhxaYdBcPb1+dOD73t6PuQ9ZF0OM
 ppyr15/oiluzglqAMSlUrF8oohbkMZ2iIhL/9cCb2Gr9xIyZktIEgIRyi1rhgWQk0YQq
 ATLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=bjJXR8Yg4wTMD7SKdVhAgm+g3J55wUR6Z+IcSDvh2Lk=;
 b=sXExMX4vBPqJUNbQVcoY/1iwf0AaYJVkU5ejBSXqu2IzFs5Mt7jWs3ysmpsrLhjQ73
 3ttqL2cAVmxrPKZHKgHJ5wzEiRg0MSJIrWtCzIP8/ML6IXdh085/TinammhqEfs7aWmt
 o0XnKYlS1ykN4NW5T/XD7HKg58lFQhjfrQyeuYJf+xcJwWNGkpHW1l36JQutlk/Tc9sA
 gtmHaR+h+oP2tczW+DbY5QNCqB62WL3XIP0pgMKZm9Em7rTARPbYJ8obivIsddTaN7lm
 ACe12pnn4GEsZt6sZNqXCptulVRLhgH6I3DXrD4TL+ABot7FVv4ibakctD0LJpfpgyTu
 0Leg==
X-Gm-Message-State: AOAM530C7n3R0oqu2+GQouRnronmec+Lm8FDpddYlTHW6W/SeHKfbiRk
 h04WIdtRvtDxOT51OTyNLV+NKw==
X-Google-Smtp-Source: ABdhPJxBB1yLvJRO+W/jr1ddt1ntUwh1rtEpFiUbG47G6AC/+M/7CI9Vx2CVuAffngs4iumbCKTchw==
X-Received: by 2002:ac8:6891:: with SMTP id m17mr5546191qtq.41.1589983622400; 
 Wed, 20 May 2020 07:07:02 -0700 (PDT)
Received: from Qians-MacBook-Air.local
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id g57sm2595754qtb.48.2020.05.20.07.07.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 07:07:01 -0700 (PDT)
Date: Wed, 20 May 2020 10:06:59 -0400
From: Qian Cai <cai@lca.pw>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200520140659.GB4708@Qians-MacBook-Air.local>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200520125056.GC325280@hirez.programming.kicks-ass.net>
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
Cc: Alexandre Chartre <alexandre.chartre@oracle.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 20, 2020 at 02:50:56PM +0200, Peter Zijlstra wrote:
> On Tue, May 19, 2020 at 11:58:17PM -0400, Qian Cai wrote:
> > Just a head up. Repeatedly compiling kernels for a while would trigger
> > endless soft-lockups since next-20200519 on both x86_64 and powerpc.
> > .config are in,
> 
> Could be 90b5363acd47 ("sched: Clean up scheduler_ipi()"), although I've
> not seen anything like that myself. Let me go have a look.

Yes, I ended up figuring out the same commit a bit earlier. Since then I
reverted that commit and its dependency,

2a0a24ebb499 ("sched: Make scheduler_ipi inline")

Everything works fine so far.

> 
> 
> In as far as the logs are readable (they're a wrapped mess, please don't
> do that!), they contain very little useful, as is typical with IPIs :/

Sorry about that. I forgot that gmail webUI will wrap things around. I will
switch to mutt.

> 
> > [ 1167.993773][    C1] WARNING: CPU: 1 PID: 0 at kernel/smp.c:127
> > flush_smp_call_function_queue+0x1fa/0x2e0
> > [ 1168.003333][    C1] Modules linked in: nls_iso8859_1 nls_cp437 vfat
> > fat kvm_amd ses kvm enclosure dax_pmem irqbypass dax_pmem_core efivars
> > acpi_cpufreq efivarfs ip_tables x_tables xfs sd_mod smartpqi
> > scsi_transport_sas tg3 mlx5_core libphy firmware_class dm_mirror
> > dm_region_hash dm_log dm_mod
> > [ 1168.029492][    C1] CPU: 1 PID: 0 Comm: swapper/1 Not tainted
> > 5.7.0-rc6-next-20200519 #1
> > [ 1168.037665][    C1] Hardware name: HPE ProLiant DL385
> > Gen10/ProLiant DL385 Gen10, BIOS A40 07/10/2019
> > [ 1168.046978][    C1] RIP: 0010:flush_smp_call_function_queue+0x1fa/0x2e0
> > [ 1168.053658][    C1] Code: 01 0f 87 c9 12 00 00 83 e3 01 0f 85 cc fe
> > ff ff 48 c7 c7 c0 55 a9 8f c6 05 f6 86 cd 01 01 e8 de 09 ea ff 0f 0b
> > e9 b2 fe ff ff <0f> 0b e9 52 ff ff ff 0f 0b e9 f2 fe ff ff 65 44 8b 25
> > 10 52 3f 71
> > [ 1168.073262][    C1] RSP: 0018:ffffc90000178918 EFLAGS: 00010046
> > [ 1168.079253][    C1] RAX: 0000000000000000 RBX: ffff8888430c58f8
> > RCX: ffffffff8ec26083
> > [ 1168.087156][    C1] RDX: 0000000000000003 RSI: dffffc0000000000
> > RDI: ffff8888430c58f8
> > [ 1168.095054][    C1] RBP: ffffc900001789a8 R08: ffffed1108618cec
> > R09: ffffed1108618cec
> > [ 1168.102964][    C1] R10: ffff8888430c675b R11: 0000000000000000
> > R12: ffff8888430c58e0
> > [ 1168.110866][    C1] R13: ffffffff8eb30c40 R14: ffff8888430c5880
> > R15: ffff8888430c58e0
> > [ 1168.118767][    C1] FS:  0000000000000000(0000)
> > GS:ffff888843080000(0000) knlGS:0000000000000000
> > [ 1168.127628][    C1] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > [ 1168.134129][    C1] CR2: 000055b169604560 CR3: 0000000d08a14000
> > CR4: 00000000003406e0
> > [ 1168.142026][    C1] Call Trace:
> > [ 1168.145206][    C1]  <IRQ>
> > [ 1168.147957][    C1]  ? smp_call_on_cpu_callback+0xd0/0xd0
> > [ 1168.153421][    C1]  ? rcu_read_lock_sched_held+0xac/0xe0
> > [ 1168.158880][    C1]  ? rcu_read_lock_bh_held+0xc0/0xc0
> > [ 1168.164076][    C1]  generic_smp_call_function_single_interrupt+0x13/0x2b
> > [ 1168.170938][    C1]  smp_call_function_single_interrupt+0x157/0x4e0
> > [ 1168.177278][    C1]  ? smp_call_function_interrupt+0x4e0/0x4e0
> > [ 1168.183172][    C1]  ? interrupt_entry+0xe4/0xf0
> > [ 1168.187846][    C1]  ? trace_hardirqs_off_caller+0x8d/0x1f0
> > [ 1168.193478][    C1]  ? trace_hardirqs_on_caller+0x1f0/0x1f0
> > [ 1168.199116][    C1]  ? _nohz_idle_balance+0x221/0x360
> > [ 1168.204228][    C1]  ? trace_hardirqs_off_thunk+0x1a/0x1c
> > [ 1168.209690][    C1]  call_function_single_interrupt+0xf/0x20
