Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7D3BD247
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 21:01:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d9WX447CzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 05:00:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="QQ256yBB"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6gJ0v65zDqN3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:52:28 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACD6E21D7A;
 Tue, 24 Sep 2019 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343945;
 bh=S9VyX5D8oxibpDLEdsQthcihh5UzVs7s0KhHnlTVdZo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QQ256yBBStNMQQ1Hci09cGNNmSub5cw2/Ge1CwwnEslrwTC5mOZ5yF3LNso6cBzvA
 kKtRVvIIAgdRpBCuSzcP8Oor2Lq8eaW1Nv8GarktvFFNkNkBL8zzoQ7Lohx7fPEspv
 iS1h1kuOiJsK6zXC1E9xbUbamfQLdyY7cw2xl/sc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 06/14] powerpc/rtas: use device model APIs and
 serialization during LPM
Date: Tue, 24 Sep 2019 12:52:04 -0400
Message-Id: <20190924165214.28857-6-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924165214.28857-1-sashal@kernel.org>
References: <20190924165214.28857-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Sasha Levin <sashal@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

[ Upstream commit a6717c01ddc259f6f73364779df058e2c67309f8 ]

The LPAR migration implementation and userspace-initiated cpu hotplug
can interleave their executions like so:

1. Set cpu 7 offline via sysfs.

2. Begin a partition migration, whose implementation requires the OS
   to ensure all present cpus are online; cpu 7 is onlined:

     rtas_ibm_suspend_me -> rtas_online_cpus_mask -> cpu_up

   This sets cpu 7 online in all respects except for the cpu's
   corresponding struct device; dev->offline remains true.

3. Set cpu 7 online via sysfs. _cpu_up() determines that cpu 7 is
   already online and returns success. The driver core (device_online)
   sets dev->offline = false.

4. The migration completes and restores cpu 7 to offline state:

     rtas_ibm_suspend_me -> rtas_offline_cpus_mask -> cpu_down

This leaves cpu7 in a state where the driver core considers the cpu
device online, but in all other respects it is offline and
unused. Attempts to online the cpu via sysfs appear to succeed but the
driver core actually does not pass the request to the lower-level
cpuhp support code. This makes the cpu unusable until the cpu device
is manually set offline and then online again via sysfs.

Instead of directly calling cpu_up/cpu_down, the migration code should
use the higher-level device core APIs to maintain consistent state and
serialize operations.

Fixes: 120496ac2d2d ("powerpc: Bring all threads online prior to migration/hibernation")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190802192926.19277-2-nathanl@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/rtas.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 5a753fae8265a..0c42e872d548b 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -857,15 +857,17 @@ static int rtas_cpu_state_change_mask(enum rtas_cpu_state state,
 		return 0;
 
 	for_each_cpu(cpu, cpus) {
+		struct device *dev = get_cpu_device(cpu);
+
 		switch (state) {
 		case DOWN:
-			cpuret = cpu_down(cpu);
+			cpuret = device_offline(dev);
 			break;
 		case UP:
-			cpuret = cpu_up(cpu);
+			cpuret = device_online(dev);
 			break;
 		}
-		if (cpuret) {
+		if (cpuret < 0) {
 			pr_debug("%s: cpu_%s for cpu#%d returned %d.\n",
 					__func__,
 					((state == UP) ? "up" : "down"),
@@ -954,6 +956,8 @@ int rtas_ibm_suspend_me(u64 handle)
 	data.token = rtas_token("ibm,suspend-me");
 	data.complete = &done;
 
+	lock_device_hotplug();
+
 	/* All present CPUs must be online */
 	cpumask_andnot(offline_mask, cpu_present_mask, cpu_online_mask);
 	cpuret = rtas_online_cpus_mask(offline_mask);
@@ -985,6 +989,7 @@ int rtas_ibm_suspend_me(u64 handle)
 				__func__);
 
 out:
+	unlock_device_hotplug();
 	free_cpumask_var(offline_mask);
 	return atomic_read(&data.error);
 }
-- 
2.20.1

