Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DF45C5B7EE1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 04:21:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MS3x85P3pz3c6d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:21:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ThkGN67x;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=qq.com (client-ip=203.205.221.153; helo=out203-205-221-153.mail.qq.com; envelope-from=zhouzhouyi_linux@qq.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=ThkGN67x;
	dkim-atps=neutral
X-Greylist: delayed 873 seconds by postgrey-1.36 at boromir; Wed, 14 Sep 2022 12:00:36 AEST
Received: from out203-205-221-153.mail.qq.com (out203-205-221-153.mail.qq.com [203.205.221.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MS3T02YYYz2xH8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 12:00:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1663120830; bh=OF5i5FyrHvDKyEmcfK4maMV1WTZStjHbhYecICzZ0jY=;
	h=From:To:Cc:Subject:Date;
	b=ThkGN67xOcr4EetC8O5/LEb+N5925+9XqUUIo+yJvLWfavd4GlCiR0Qivy5Y1Ryyw
	 BicMCT8OmByKrGYl4ifPPgZIxvumD7w03E2DkyqT74G7Ox2k07fz1uKFCsdsFqlitQ
	 W5USsjhkKF0+AlFsVQ6d8/raucVF5QMYtTdx/pFU=
Received: from localhost.localdomain ([2408:8406:d60:85ca:ec92:d4c7:cd39:5093])
	by newxmesmtplogicsvrsza30.qq.com (NewEsmtp) with SMTP
	id B2420A36; Wed, 14 Sep 2022 09:44:36 +0800
X-QQ-mid: xmsmtpt1663119876tdd4px5iy
Message-ID: <tencent_7BC3270CBC8463FB34858B4F9101E9329605@qq.com>
X-QQ-XMAILINFO: OUMxvQDaATieOnMOirgcZHdaTKkB0+VVV1eEiNfYmVXaQ17JN0ltmW5VkGKQ9Q
	 3KSyUad+N2vTyntW2cNuSXEAjLYTIDVnAelt8uQEJM7QcFHJi0pWsm2v0PuEwjIjMfBFdhClua/4
	 3sXlhR7ukLaRwntVEAU/ELPIOgOKPJPhQxbiMRc5GUMxFSAZ0bpL8VjOsRnAOyfFWWZ28pZB0Mj+
	 ePSpllcyV6HVzvo6BVRpZa3HEgQ35dGlevcsECX0Oc4p1Nw+VbRCPW0TlOxWuNpVU9hCWxuvd5xR
	 JkrMTOeBetPUnsGiLi2Ml5V09NTsim5NJlfg0yDU2DA4ZdUM7emeI8EFe/t0ufCR/ucyLAsG+PU8
	 1/Z01xHMrUjgvN8a5u6mtBkPENFWSnitbluRtTewN2kH7ekSLC+VnBRHTkLympd8GtVOb6jk7ZFW
	 kislpNtShJJR3qZuwMXl17kPdGWo0cTS6LnUjjthKdY3R4q95FQ3OoM5HjZdXF+/fNc7cgwv3wqZ
	 y8Gtab+wW/rOHr7LWkeED7262oOBUw40MqlRWzXsyMo1q2hkhtY3D1nY4iznXB4SQTo+blN4TaxH
	 mLB8oJYnKCHo6SfAgtHEzBAiOxmzA246y6YWw0EDSnbHRfQL5UDgMERXuGF+U9E8cgfiU30m0Ap0
	 CTUrzzszdV87X+Svv+exd1DodTv4BTyaahn98a52QimeYScP2p/TqhPYP0N+nx9kwSrSh0jBcKBQ
	 SDcEnPZakhAXlPX3dUYdfpWmJYEwQAQFRnVm5nVcaqGvM6S96pVgomFfH2qTXG+C0oHSt0C4vWsG
	 CFBvQbzJ46UU3AMbNcPgTn70q3P5u6K2mi4FOzHBFLZOcKT7tG0XZQEQSBVPULPH6mrBU+gWRXYd
	 gNqBhg2y6tMrn7iWvC1/0Xq/bypYJE/WE6W2W8WuAjNUwui9AFu7tuP//BaoYApvipZYlSO7C0M7
	 6zRuGoQJ8=
From: Zhouyi Zhou <zhouzhouyi_linux@qq.com>
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
Date: Wed, 14 Sep 2022 09:44:31 +0800
X-OQ-MSGID: <20220914014431.9204-1-zhouzhouyi_linux@qq.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 14 Sep 2022 12:21:02 +1000
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

From: Zhouyi Zhou <zhouzhouyi@gmail.com>

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

