Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EA58FF0B8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 17:32:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vw7cW0gL0z3d2m
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2024 01:32:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huaweicloud.com (client-ip=45.249.212.51; helo=dggsgout11.his.huawei.com; envelope-from=luogengkun@huaweicloud.com; receiver=lists.ozlabs.org)
Received: from dggsgout11.his.huawei.com (unknown [45.249.212.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vw7c53jN1z3flj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2024 01:32:03 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTP id 4Vw7bj3mFGz4f3mHb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 23:31:45 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.112])
	by mail.maildlp.com (Postfix) with ESMTP id B2F441A0568
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 23:31:56 +0800 (CST)
Received: from huaweicloud.com (unknown [10.67.174.193])
	by APP1 (Coremail) with SMTP id cCh0CgAX5g5j1mFmxZX2Og--.51957S4;
	Thu, 06 Jun 2024 23:31:48 +0800 (CST)
From: Luo Gengkun <luogengkun@huaweicloud.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] watchdog/core: Fix AA deadlock due to watchdog holding cpu_hotplug_lock and wait for wq
Date: Thu,  6 Jun 2024 15:38:28 +0000
Message-Id: <20240606153828.3261006-1-luogengkun@huaweicloud.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: cCh0CgAX5g5j1mFmxZX2Og--.51957S4
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww18tF4ktFyDAry8Kry8Xwb_yoW8tF1rpr
	9rZryUtw1UuF1vvayft39xWFy8uayvgr47Ja1DGw1SkF1rCFs8Zrnakr1aqrZ8ZrZxuF1j
	9w12vFWYqa4UtF7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv014x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F4
	0E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_Wryl
	IxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxV
	AFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s1lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUb
	QVy7UUUUU==
X-CM-SenderInfo: 5oxrwvpqjn3046kxt4xhlfz01xgou0bp/
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
				cpu_up:
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
lock. It seems unhealthy to hold a lock when waitting system_wq, because we
never know what jobs are system_wq doing. So I fix this by replace cpu_read_lock/unlock
with cpu_hotplug_disable/enable to prevent cpu offline/online.

Fixes: e31d6883f21c ("watchdog/core, powerpc: Lock cpus across reconfiguration")

Signed-off-by: Luo Gengkun <luogengkun@huaweicloud.com>
---
 kernel/watchdog.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 51915b44ac73..6ac6fb8d3be0 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -867,7 +867,7 @@ int lockup_detector_offline_cpu(unsigned int cpu)
 
 static void __lockup_detector_reconfigure(void)
 {
-	cpus_read_lock();
+	cpu_hotplug_disable();
 	watchdog_hardlockup_stop();
 
 	softlockup_stop_all();
@@ -877,7 +877,7 @@ static void __lockup_detector_reconfigure(void)
 		softlockup_start_all();
 
 	watchdog_hardlockup_start();
-	cpus_read_unlock();
+	cpu_hotplug_enable();
 	/*
 	 * Must be called outside the cpus locked section to prevent
 	 * recursive locking in the perf code.
@@ -916,11 +916,11 @@ static __init void lockup_detector_setup(void)
 #else /* CONFIG_SOFTLOCKUP_DETECTOR */
 static void __lockup_detector_reconfigure(void)
 {
-	cpus_read_lock();
+	cpu_hotplug_disable();
 	watchdog_hardlockup_stop();
 	lockup_detector_update_enable();
 	watchdog_hardlockup_start();
-	cpus_read_unlock();
+	cpu_hotplug_enable();
 }
 void lockup_detector_reconfigure(void)
 {
-- 
2.34.1

