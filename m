Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EF95EB726
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 03:49:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc2bw2rsvz3cCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 11:49:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hsS5QPCR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::534; helo=mail-pg1-x534.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=hsS5QPCR;
	dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc2bF5XXjz300V
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 11:48:41 +1000 (AEST)
Received: by mail-pg1-x534.google.com with SMTP id 3so8137476pga.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 18:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Bm3/izTH95Qq9qOWmlsGgVeEZswV/Zz9ewlv/cGnqFg=;
        b=hsS5QPCREgczLtKQfYIXzWj0bkTL+WGEzYaWTOHT18AroGaB0GxploOH2TKP1GBxDq
         aZnUILn4t1w5YK15z+5ZSb31NLZ7slcNgKUd4VUfemq1ofIHNGGHt/5nCxkkP9ipy5Oz
         SyR7V5zAHgFnf+FNUKQ3ErYyO3VlGRvq9ocnTJF8z8ehj1d16iQxZ155dEjYC/oL99fz
         Z+rS24Z2RA2xrbbNq6gpcBa7yZDLMmJSVa9fJG3LnxlPlQ36GWU+t0tN54fQlrRaLJaH
         YyIM+Sh0+88vCxbZW1/joIwYNaV+4duaHMY79yghfRO9cO3wBoio23ONWNbdUM+f4glD
         thLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Bm3/izTH95Qq9qOWmlsGgVeEZswV/Zz9ewlv/cGnqFg=;
        b=4LkUdCEDpr5cU4HrdkI/Z5LrJRUth5fiRuoZaptz6gV4l+HjuyqPrHuSUIQzojTLKb
         jrx5C43dkwJM18dmQ3fFnG+n1OVWnUd4Mk9GZFTi7qG94iVGkkI/FJTCue27WjvH3F2m
         bTJXqrcSKcBk2iXvEeXsPlB9D7GAgBc6kpDRAM8c50uauVBlwMZCcs4HgrTII0/9beHs
         qrnu9wWp95ANdftQBi9ZmDFWdD0nRSUdpIW5/N69mp2i3CEl0eXQKpBepG09NYeSjp+9
         lHxU/Ke+ZPAXYmHnK7iZFRqxxDzLIsOx68EihCDKB6B4MzV61OEzrL0wngQO8EOqstq/
         CYYA==
X-Gm-Message-State: ACrzQf37dCd5DhT9nWqudd4Y9KN6uEWWrj/tnLH+H0VQSYmt/oqyPUkh
	CZ+f3fbZBfSTaQFC741zYR8=
X-Google-Smtp-Source: AMsMyM5N5md6258CNNbPNXQkn6VOGEXW0FJ2mRiTSWRCcU2eQQmv9r3WV8QL3kknHdWC2kj9BbiNZw==
X-Received: by 2002:a63:de16:0:b0:438:675c:9f30 with SMTP id f22-20020a63de16000000b00438675c9f30mr22753437pgg.294.1664243319058;
        Mon, 26 Sep 2022 18:48:39 -0700 (PDT)
Received: from localhost.localdomain ([199.101.192.35])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090311ce00b00178af82a000sm110774plh.122.2022.09.26.18.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 18:48:38 -0700 (PDT)
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	atrajeev@linux.vnet.ibm.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	lance@osuosl.org,
	paulmck@kernel.org,
	rcu@vger.kernel.org
Subject: [PATCH linux-next][RFC] powerpc: avoid lockdep when we are offline
Date: Tue, 27 Sep 2022 09:48:23 +0800
Message-Id: <20220927014823.11439-1-zhouzhouyi@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Zhouyi Zhou <zhouzhouyi@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is second version of my fix to PPC's  "WARNING: suspicious RCU usage",
I improved my fix under Paul E. McKenney's guidance:
Link: https://lore.kernel.org/lkml/20220914021528.15946-1-zhouzhouyi@gmail.com/T/

During the cpu offlining, the sub functions of xive_teardown_cpu will
call __lock_acquire when CONFIG_LOCKDEP=y. The latter function will
travel RCU protected list, so "WARNING: suspicious RCU usage" will be
triggered.

Avoid lockdep when we are offline.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
Dear PPC and RCU developers

I found this bug when trying to do rcutorture tests in ppc VM of
Open Source Lab of Oregon State University

console.log report following bug:
[   37.635545][    T0] WARNING: suspicious RCU usage^M
[   37.636409][    T0] 6.0.0-rc4-next-20220907-dirty #8 Not tainted^M
[   37.637575][    T0] -----------------------------^M
[   37.638306][    T0] kernel/locking/lockdep.c:3723 RCU-list traversed in non-reader section!!^M
[   37.639651][    T0] ^M
[   37.639651][    T0] other info that might help us debug this:^M
[   37.639651][    T0] ^M
[   37.641381][    T0] ^M
[   37.641381][    T0] RCU used illegally from offline CPU!^M
[   37.641381][    T0] rcu_scheduler_active = 2, debug_locks = 1^M
[   37.667170][    T0] no locks held by swapper/6/0.^M
[   37.668328][    T0] ^M
[   37.668328][    T0] stack backtrace:^M
[   37.669995][    T0] CPU: 6 PID: 0 Comm: swapper/6 Not tainted 6.0.0-rc4-next-20220907-dirty #8^M
[   37.672777][    T0] Call Trace:^M
[   37.673729][    T0] [c000000004653920] [c00000000097f9b4] dump_stack_lvl+0x98/0xe0 (unreliable)^M
[   37.678579][    T0] [c000000004653960] [c0000000001f2eb8] lockdep_rcu_suspicious+0x148/0x16c^M
[   37.680425][    T0] [c0000000046539f0] [c0000000001ed9b4] __lock_acquire+0x10f4/0x26e0^M
[   37.682450][    T0] [c000000004653b30] [c0000000001efc2c] lock_acquire+0x12c/0x420^M
[   37.684113][    T0] [c000000004653c20] [c0000000010d704c] _raw_spin_lock_irqsave+0x6c/0xc0^M
[   37.686154][    T0] [c000000004653c60] [c0000000000c7b4c] xive_spapr_put_ipi+0xcc/0x150^M
[   37.687879][    T0] [c000000004653ca0] [c0000000010c72a8] xive_cleanup_cpu_ipi+0xc8/0xf0^M
[   37.689856][    T0] [c000000004653cf0] [c0000000010c7370] xive_teardown_cpu+0xa0/0xf0^M
[   37.691877][    T0] [c000000004653d30] [c0000000000fba5c] pseries_cpu_offline_self+0x5c/0x100^M
[   37.693882][    T0] [c000000004653da0] [c00000000005d2c4] arch_cpu_idle_dead+0x44/0x60^M
[   37.695739][    T0] [c000000004653dc0] [c0000000001c740c] do_idle+0x16c/0x3d0^M
[   37.697536][    T0] [c000000004653e70] [c0000000001c7a1c] cpu_startup_entry+0x3c/0x40^M
[   37.699694][    T0] [c000000004653ea0] [c00000000005ca20] start_secondary+0x6c0/0xb50^M
[   37.701742][    T0] [c000000004653f90] [c00000000000d054] start_secondary_prolog+0x10/0x14^M


Tested on PPC VM of Open Source Lab of Oregon State University.
Test results show that although "WARNING: suspicious RCU usage" has gone,
and there are less "BUG: soft lockup" reports than the original kernel
(9 vs 13), which sounds good ;-)

But after my modification, results-rcutorture-kasan/SRCU-P/console.log.diags
shows a new warning:
[  222.289242][  T110] WARNING: CPU: 6 PID: 110 at kernel/rcu/rcutorture.c:2806 rcu_torture_fwd_prog+0xc88/0xdd0

I guess above new warning also exits in original kernel, so I write a tiny test script as follows:

#!/bin/sh

COUNTER=0
while [ $COUNTER -lt 1000 ] ; do
    qemu-system-ppc64 -nographic -smp cores=8,threads=1 -net none -M pseries -nodefaults -device spapr-vscsi -serial file:/tmp/console.log -m 2G -kernel /tmp/vmlinux -append "debug_boot_weak_hash panic=-1 console=ttyS0 rcupdate.rcu_cpu_stall_suppress_at_boot=1 torture.disable_onoff_at_boot rcupdate.rcu_task_stall_timeout=30000 rcutorture.torture_type=srcud rcupdate.rcu_self_test=1 rcutorture.fwd_progress=3 srcutree.big_cpu_lim=5 rcutorture.onoff_interval=1000 rcutorture.onoff_holdoff=30 rcutorture.n_barrier_cbs=4 rcutorture.stat_interval=15 rcutorture.shutdown_secs=420 rcutorture.test_no_idle_hz=1 rcutorture.verbose=1"&
    qemu_pid=$!
    cd ~/next1/linux-next
    make clean
#I use "make vmlinux -j 8" to create heavy background jitter
    make vmlinux -j 8  > /dev/null 2>&1 
    make_pid=$!
    wait $qemu_pid
    kill $qemu_pid
    kill $make_id
    if grep -q WARN /tmp/console.log;
    then
        echo $COUNTER > /tmp/counter
        exit
    fi
    COUNTER=$(($COUNTER+1))
done

Above test shows that original kernel also warn about
"WARNING: CPU: 6 PID: 110 at kernel/rcu/rcutorture.c:2806 rcu_torture_fwd_prog+0xc88/0xdd0"

But I am not very sure about my results, so I still add a [RFC] to my subject line.

Thank all of you for your guidance and encouragement ;-)

Cheers
Zhouyi
--
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index e0a7ac5db15d..e47098f00da1 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -64,10 +64,15 @@ static void pseries_cpu_offline_self(void)
 
 	local_irq_disable();
 	idle_task_exit();
+	/* prevent lockdep code from traveling RCU protected list
+	 * when we are offline.
+	 */
+	lockdep_off();
 	if (xive_enabled())
 		xive_teardown_cpu();
 	else
 		xics_teardown_cpu();
+	lockdep_on();
 
 	unregister_slb_shadow(hwcpu);
 	rtas_stop_self();
-- 
2.25.1

