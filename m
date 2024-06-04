Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F0D8FBB2C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 20:04:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtz4P4rN9z3dSk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2024 04:04:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huaweicloud.com (client-ip=45.249.212.51; helo=dggsgout11.his.huawei.com; envelope-from=luogengkun@huaweicloud.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1114 seconds by postgrey-1.37 at boromir; Tue, 04 Jun 2024 22:09:41 AEST
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VtqCT4Lfkz3cM5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 22:09:37 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Vtpng1l5lz4f3nTs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 19:50:47 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id 528621A0AAB
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 19:50:58 +0800 (CST)
Received: from huaweicloud.com (unknown [10.67.174.193])
	by APP1 (Coremail) with SMTP id cCh0CgBnOBGd_15metYuOg--.43086S4;
	Tue, 04 Jun 2024 19:50:55 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog/core: Fix AA deadlock causeb by watchdog
Date: Tue,  4 Jun 2024 11:57:36 +0000
Message-Id: <20240604115736.1013341-1-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgBnOBGd_15metYuOg--.43086S4
X-Coremail-Antispam: 1UD129KBjvJXoWxArW5tFykAF47Aw4UAFWDJwb_yoW5AF47pr
	9FvFy7tw4UCr4kZayfJ3sxGry8Ca4vgr43GF4DG3yFkF1YkFn8Xrna9FnxXrZ0vrZxZF4j
	vwn0qrWfta4UtaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvF14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r4a6rW5
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY6I8E87Iv67AK
	xVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvj
	fUOmhFUUUUU
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/
X-Mailman-Approved-At: Wed, 05 Jun 2024 03:59:10 +1000
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
Cc: pmladek@suse.com, mhocko@suse.com, lecopzer.chen@mediatek.com, yaoma@linux.alibaba.com, linuxppc-dev@lists.ozlabs.org, dianders@chromium.org, song@kernel.org, bpf@vger.kernel.org, npiggin@gmail.com, trix@redhat.com, naveen.n.rao@linux.ibm.com, kernelfans@gmail.com, akpm@linux-foundation.org, luogengkun@huaweicloud.com, tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We found an AA deadlock problem as shown belowed:

TaskA				TaskB				WatchDog			system_wq

...
css_killed_work_fn:
P(cgroup_mutex)
...
								...
								__lockup_detector_reconfigure:
								P(cpu_hotplug_lock.read)
								...
				...
				percpu_down_write:
				P(cpu_hotplug_lock.write)
												...
												cgroup_bpf_release:
												P(cgroup_mutex)
								smp_call_on_cpu:
								Wait system_wq

cpuset_css_offline:
P(cpu_hotplug_lock.read)

WatchDog is waitting for system_wq, who is waitting for cgroup_mutex, to finish
the jobs, but the owner of the cgroup_mutex is waitting for cpu_hotplug_lock.
The key point is the cpu_hotplug_lock, cause the system_wq may be waitting other
lock. What's more, it seems that smp_call_on_cpu doesn't need protection from
cpu_hotplug_lock. I try to revert the old patch to fix this problem, but I
encountered some conflicts. Or I should just release and acquire cpu_hotplug_lock
during between smp_call_on_cpu? I'm looking forward any suggestion :).

Fixes: e31d6883f21c ("watchdog/core, powerpc: Lock cpus across reconfiguration")

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 arch/powerpc/kernel/watchdog.c | 4 ++++
 kernel/watchdog.c              | 9 ---------
 2 files changed, 4 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
index 8c464a5d8246..f33f532ea7fa 100644
--- a/arch/powerpc/kernel/watchdog.c
+++ b/arch/powerpc/kernel/watchdog.c
@@ -550,17 +550,21 @@ void watchdog_hardlockup_stop(void)
 {
 	int cpu;
 
+	cpus_read_lock();
 	for_each_cpu(cpu, &wd_cpus_enabled)
 		stop_watchdog_on_cpu(cpu);
+	cpus_read_unlock();
 }
 
 void watchdog_hardlockup_start(void)
 {
 	int cpu;
 
+	cpus_read_lock();
 	watchdog_calc_timeouts();
 	for_each_cpu_and(cpu, cpu_online_mask, &watchdog_cpumask)
 		start_watchdog_on_cpu(cpu);
+	cpus_read_unlock();
 }
 
 /*
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 51915b44ac73..13303a932cde 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -867,7 +867,6 @@ int lockup_detector_offline_cpu(unsigned int cpu)
 
 static void __lockup_detector_reconfigure(void)
 {
-	cpus_read_lock();
 	watchdog_hardlockup_stop();
 
 	softlockup_stop_all();
@@ -877,12 +876,6 @@ static void __lockup_detector_reconfigure(void)
 		softlockup_start_all();
 
 	watchdog_hardlockup_start();
-	cpus_read_unlock();
-	/*
-	 * Must be called outside the cpus locked section to prevent
-	 * recursive locking in the perf code.
-	 */
-	__lockup_detector_cleanup();
 }
 
 void lockup_detector_reconfigure(void)
@@ -916,11 +909,9 @@ static __init void lockup_detector_setup(void)
 #else /* CONFIG_SOFTLOCKUP_DETECTOR */
 static void __lockup_detector_reconfigure(void)
 {
-	cpus_read_lock();
 	watchdog_hardlockup_stop();
 	lockup_detector_update_enable();
 	watchdog_hardlockup_start();
-	cpus_read_unlock();
 }
 void lockup_detector_reconfigure(void)
 {
-- 
2.34.1

