Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB92D5B7ED5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 04:16:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MS3qB0FySz3c21
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:16:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JVNZrBvM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=zhouzhouyi@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JVNZrBvM;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MS3pW1vFxz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 12:15:45 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id x1so13689931plv.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 19:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=HLs00qLGkRYsRs/Qs4OSx3zhLgfT7QPCYF2RVcp6Dnw=;
        b=JVNZrBvMEakmiimzfvMyEqUuOFoaYIxkE7IZ6Uiqx8ikeXCbZRH5jC37NcZLjJKTvh
         QPw7wQu7uaKL3PlIrh+anQoiFPZwItj9hdbbsD/0zpJ/GKCym2WnVOK3SqoPeUmR5Z/H
         ctDUd4rdvbo8HEsFWVxJHnfJSnEtJFPT2B7TgDk68tpHAeQKz9lEJWi18WHGY4/Lh8Yg
         Q7r6TU51e6DsklGPC1DsFRX2WbkE4gPYE0hL8Gji/2tkRxFlNRksj/oS7J9iiuaUyAXV
         kJ8YRqQ3RNpIKPPIj/e04lKMOPkz1xARs4Rzzyihjqf46cXXbm1pUkJXvPVZS6XHYFln
         4a5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=HLs00qLGkRYsRs/Qs4OSx3zhLgfT7QPCYF2RVcp6Dnw=;
        b=V+JWYZjJTJ/bDwbAjXfuMgpWX0+QCue8l88nnc0d1eC16T11Qk4giHtXhG8sGfUZqu
         ofyVLMPIrCKh2jPiQQNFCx8DYJUlRD+F58q14syniZLC8raIo6zbzh7u1fb012UhgaCi
         BgbAUm8X5SUk+WQ1rAi8MjaV4fs/lytkgn/+8A5dDDRh5YlKToVCP9QPBO8UXIzbXuxu
         bCR8ZNjV/Y936uapHWmYtLBMpxzRzTguU+usDtwwk4A0EhS6ibxUqBW94NwzFWrdri9V
         OWMZrnroGKPjixM0ztx+izH3tZUgq3N56K1210b+ybEgajKSzpucHbOpGwlH09fDvOMz
         BaMA==
X-Gm-Message-State: ACrzQf3uemxftMMFNYPv34mDcriKpDUHFPI70LJum4cN/Uw3w3ymQ1JZ
	z/VvugHIORvGDLIrAItSc7g=
X-Google-Smtp-Source: AMsMyM7R+4iL3pfpcVaoK8BnJh2Kbp150IOZXSMqzOihpjKT1NL6dCeS4RSsgTkeIzZhBLJm1DuOzA==
X-Received: by 2002:a17:90b:3909:b0:202:c879:51a9 with SMTP id ob9-20020a17090b390900b00202c87951a9mr2168744pjb.83.1663121742226;
        Tue, 13 Sep 2022 19:15:42 -0700 (PDT)
Received: from localhost.localdomain ([194.5.48.32])
        by smtp.gmail.com with ESMTPSA id f13-20020a170902684d00b0016ed8af2ec0sm9343655pln.29.2022.09.13.19.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 19:15:41 -0700 (PDT)
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
Subject: [PATCH linux-next][RFC] powerpc: protect cpu offlining by RCU offline lock
Date: Wed, 14 Sep 2022 10:15:28 +0800
Message-Id: <20220914021528.15946-1-zhouzhouyi@gmail.com>
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

During the cpu offlining, the sub functions of xive_teardown_cpu will
call __lock_acquire when CONFIG_LOCKDEP=y. The latter function will
travel RCU protected list, so "WARNING: suspicious RCU usage" will be
triggered.

Try to protect cpu offlining by RCU offline lock.

Tested on PPC VM of Open Source Lab of Oregon State University.
(Each round of tests takes about 19 hours to finish)
Test results show that although "WARNING: suspicious RCU usage" has gone,
but there are more "BUG: soft lockup" reports than the original kernel
(10 vs 6), so I add a [RFC] to my subject line.

Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>
---
[it seems that there are some delivery problem in my previous email,
 so I send again via gmail, sorry for the trouble]
 
Dear PPC and RCU developers

I found this bug when trying to do rcutorture tests in ppc VM of
Open Source Lab of Oregon State University.

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


I am a beginner, hope I can be of some beneficial to the community ;-)

Thanks
Zhouyi
--
 arch/powerpc/platforms/pseries/hotplug-cpu.c |  5 ++++-
 include/linux/rcupdate.h                     |  3 ++-
 kernel/rcu/tree.c                            | 10 ++++++++++
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 0f8cd8b06432..ddf66a253c70 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -64,11 +64,14 @@ static void pseries_cpu_offline_self(void)
 
 	local_irq_disable();
 	idle_task_exit();
+
+	/* Because the cpu is now offline, let rcu know that */
+	rcu_state_ofl_lock();
 	if (xive_enabled())
 		xive_teardown_cpu();
 	else
 		xics_teardown_cpu();
-
+	rcu_state_ofl_unlock();
 	unregister_slb_shadow(hwcpu);
 	rtas_stop_self();
 
diff --git a/include/linux/rcupdate.h b/include/linux/rcupdate.h
index 63d2e6a60ad7..d857955a02ba 100644
--- a/include/linux/rcupdate.h
+++ b/include/linux/rcupdate.h
@@ -1034,5 +1034,6 @@ rcu_head_after_call_rcu(struct rcu_head *rhp, rcu_callback_t f)
 /* kernel/ksysfs.c definitions */
 extern int rcu_expedited;
 extern int rcu_normal;
-
+void rcu_state_ofl_lock(void);
+void rcu_state_ofl_unlock(void);
 #endif /* __LINUX_RCUPDATE_H */
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 6bb8e72bc815..3282725f1054 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -4796,6 +4796,16 @@ void __init rcu_init(void)
 		(void)start_poll_synchronize_rcu_expedited();
 }
 
+void rcu_state_ofl_lock(void)
+{
+	arch_spin_lock(&rcu_state.ofl_lock);
+}
+
+void rcu_state_ofl_unlock(void)
+{
+	arch_spin_unlock(&rcu_state.ofl_lock);
+}
+
 #include "tree_stall.h"
 #include "tree_exp.h"
 #include "tree_nocb.h"
-- 
2.34.1

