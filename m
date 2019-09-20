Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD2B8B03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 08:26:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZNz538VMzF3VL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 16:26:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=wangkefeng.wang@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
X-Greylist: delayed 930 seconds by postgrey-1.36 at bilbo;
 Fri, 20 Sep 2019 16:24:43 AEST
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46ZNwq4Rj5zF3P3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 16:24:41 +1000 (AEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id BE7CD14304A4275B0757;
 Fri, 20 Sep 2019 14:09:06 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Fri, 20 Sep 2019 14:08:57 +0800
From: Kefeng Wang <wangkefeng.wang@huawei.com>
To: Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Ingo Molnar <mingo@redhat.com>, "David S. Miller" <davem@davemloft.net>,
 Arnaldo Carvalho de Melo <acme@redhat.com>, Andy Whitcroft
 <apw@canonical.com>, Peter Zijlstra <peterz@infradead.org>, "Alexei
 Starovoitov" <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Sergey Senozhatsky
 <sergey.senozhatsky@gmail.com>, Petr Mladek <pmladek@suse.com>, Arnd Bergmann
 <arnd@arndb.de>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 15/32] macintosh: Use pr_warn instead of pr_warning
Date: Fri, 20 Sep 2019 14:25:27 +0800
Message-ID: <20190920062544.180997-16-wangkefeng.wang@huawei.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190920062544.180997-1-wangkefeng.wang@huawei.com>
References: <20190920062544.180997-1-wangkefeng.wang@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
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
Cc: wangkefeng.wang@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As said in commit f2c2cbcc35d4 ("powerpc: Use pr_warn instead of
pr_warning"), removing pr_warning so all logging messages use a
consistent <prefix>_warn style. Let's do it.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 drivers/macintosh/windfarm_fcu_controls.c |  4 +---
 drivers/macintosh/windfarm_lm87_sensor.c  |  4 ++--
 drivers/macintosh/windfarm_pm72.c         | 22 +++++++++++-----------
 drivers/macintosh/windfarm_rm31.c         |  6 +++---
 4 files changed, 17 insertions(+), 19 deletions(-)

diff --git a/drivers/macintosh/windfarm_fcu_controls.c b/drivers/macintosh/windfarm_fcu_controls.c
index 3c971297b6dc..67daeec94b44 100644
--- a/drivers/macintosh/windfarm_fcu_controls.c
+++ b/drivers/macintosh/windfarm_fcu_controls.c
@@ -468,9 +468,7 @@ static void wf_fcu_lookup_fans(struct wf_fcu_priv *pv)
 			else
 				id = ((*reg) - 0x30) / 2;
 			if (id > 7) {
-				pr_warning("wf_fcu: Can't parse "
-				       "fan ID in device-tree for %pOF\n",
-					   np);
+				pr_warn("wf_fcu: Can't parse fan ID in device-tree for %pOF\n", np);
 				break;
 			}
 			wf_fcu_add_fan(pv, name, type, id);
diff --git a/drivers/macintosh/windfarm_lm87_sensor.c b/drivers/macintosh/windfarm_lm87_sensor.c
index e44525b19071..b03a33b803b7 100644
--- a/drivers/macintosh/windfarm_lm87_sensor.c
+++ b/drivers/macintosh/windfarm_lm87_sensor.c
@@ -124,8 +124,8 @@ static int wf_lm87_probe(struct i2c_client *client,
 		}
 	}
 	if (!name) {
-		pr_warning("wf_lm87: Unsupported sensor %pOF\n",
-			   client->dev.of_node);
+		pr_warn("wf_lm87: Unsupported sensor %pOF\n",
+			client->dev.of_node);
 		return -ENODEV;
 	}
 
diff --git a/drivers/macintosh/windfarm_pm72.c b/drivers/macintosh/windfarm_pm72.c
index c5da0fc24884..e81746b87cff 100644
--- a/drivers/macintosh/windfarm_pm72.c
+++ b/drivers/macintosh/windfarm_pm72.c
@@ -285,8 +285,8 @@ static void cpu_fans_tick_split(void)
 		/* Apply result directly to exhaust fan */
 		err = wf_control_set(cpu_rear_fans[cpu], sp->target);
 		if (err) {
-			pr_warning("wf_pm72: Fan %s reports error %d\n",
-			       cpu_rear_fans[cpu]->name, err);
+			pr_warn("wf_pm72: Fan %s reports error %d\n",
+				cpu_rear_fans[cpu]->name, err);
 			failure_state |= FAILURE_FAN;
 			break;
 		}
@@ -296,8 +296,8 @@ static void cpu_fans_tick_split(void)
 		DBG_LOTS("  CPU%d: intake = %d RPM\n", cpu, intake);
 		err = wf_control_set(cpu_front_fans[cpu], intake);
 		if (err) {
-			pr_warning("wf_pm72: Fan %s reports error %d\n",
-			       cpu_front_fans[cpu]->name, err);
+			pr_warn("wf_pm72: Fan %s reports error %d\n",
+				cpu_front_fans[cpu]->name, err);
 			failure_state |= FAILURE_FAN;
 			break;
 		}
@@ -367,22 +367,22 @@ static void cpu_fans_tick_combined(void)
 	for (cpu = 0; cpu < nr_chips; cpu++) {
 		err = wf_control_set(cpu_rear_fans[cpu], sp->target);
 		if (err) {
-			pr_warning("wf_pm72: Fan %s reports error %d\n",
-				   cpu_rear_fans[cpu]->name, err);
+			pr_warn("wf_pm72: Fan %s reports error %d\n",
+				cpu_rear_fans[cpu]->name, err);
 			failure_state |= FAILURE_FAN;
 		}
 		err = wf_control_set(cpu_front_fans[cpu], intake);
 		if (err) {
-			pr_warning("wf_pm72: Fan %s reports error %d\n",
-				   cpu_front_fans[cpu]->name, err);
+			pr_warn("wf_pm72: Fan %s reports error %d\n",
+				cpu_front_fans[cpu]->name, err);
 			failure_state |= FAILURE_FAN;
 		}
 		err = 0;
 		if (cpu_pumps[cpu])
 			err = wf_control_set(cpu_pumps[cpu], pump);
 		if (err) {
-			pr_warning("wf_pm72: Pump %s reports error %d\n",
-				   cpu_pumps[cpu]->name, err);
+			pr_warn("wf_pm72: Pump %s reports error %d\n",
+				cpu_pumps[cpu]->name, err);
 			failure_state |= FAILURE_FAN;
 		}
 	}
@@ -561,7 +561,7 @@ static void drives_fan_tick(void)
 
 	err = wf_sensor_get(drives_temp, &temp);
 	if (err) {
-		pr_warning("wf_pm72: drive bay temp sensor error %d\n", err);
+		pr_warn("wf_pm72: drive bay temp sensor error %d\n", err);
 		failure_state |= FAILURE_SENSOR;
 		wf_control_set_max(drives_fan);
 		return;
diff --git a/drivers/macintosh/windfarm_rm31.c b/drivers/macintosh/windfarm_rm31.c
index 8456eb67184b..7acd1684c451 100644
--- a/drivers/macintosh/windfarm_rm31.c
+++ b/drivers/macintosh/windfarm_rm31.c
@@ -281,8 +281,8 @@ static void cpu_fans_tick(void)
 		for (i = 0; i < 3; i++) {
 			err = wf_control_set(cpu_fans[cpu][i], speed);
 			if (err) {
-				pr_warning("wf_rm31: Fan %s reports error %d\n",
-					   cpu_fans[cpu][i]->name, err);
+				pr_warn("wf_rm31: Fan %s reports error %d\n",
+					cpu_fans[cpu][i]->name, err);
 				failure_state |= FAILURE_FAN;
 			}
 		}
@@ -465,7 +465,7 @@ static void slots_fan_tick(void)
 
 	err = wf_sensor_get(slots_temp, &temp);
 	if (err) {
-		pr_warning("wf_rm31: slots temp sensor error %d\n", err);
+		pr_warn("wf_rm31: slots temp sensor error %d\n", err);
 		failure_state |= FAILURE_SENSOR;
 		wf_control_set_max(slots_fan);
 		return;
-- 
2.20.1

