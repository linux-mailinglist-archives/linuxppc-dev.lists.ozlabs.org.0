Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B567CDFEC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 09:53:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y5Nm5q4HzDqLZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 18:53:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y5Lb3Dr9zDqC7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 18:51:48 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id AE2E91A0C08;
 Tue, 22 Oct 2019 09:51:43 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 04A3A1A0E2F;
 Tue, 22 Oct 2019 09:51:37 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id D4A7D40249;
 Tue, 22 Oct 2019 15:51:28 +0800 (SGT)
From: Ran Wang <ran.wang_1@nxp.com>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Mark Rutland <mark.rutland@arm.com>,
 Pavel Machek <pavel@ucw.cz>, Huang Anson <anson.huang@nxp.com>
Subject: [PATCH 1/3] PM: wakeup: Add routine to help fetch wakeup source
 object.
Date: Tue, 22 Oct 2019 15:51:21 +0800
Message-Id: <20191022075123.17057-1-ran.wang_1@nxp.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: Li Biwen <biwen.li@nxp.com>, Len Brown <len.brown@intel.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ran Wang <ran.wang_1@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some user might want to go through all registered wakeup sources
and doing things accordingly. For example, SoC PM driver might need to
do HW programming to prevent powering down specific IP which wakeup
source depending on. So add this API to help walk through all registered
wakeup source objects on that list and return them one by one.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
Tested-by: Leonard Crestez <leonard.crestez@nxp.com>
---
Change in v8
	- Rename wakeup_source_get_next() to wakeup_sources_walk_next().
	- Add wakeup_sources_read_lock() to take over locking job of
	  wakeup_source_get_star().
	- Rename wakeup_source_get_start() to wakeup_sources_walk_start().
	- Replace wakeup_source_get_stop() with wakeup_sources_read_unlock().
	- Define macro for_each_wakeup_source(ws).

Change in v7:
	- Remove define of member *dev in wake_irq to fix conflict with commit 
	c8377adfa781 ("PM / wakeup: Show wakeup sources stats in sysfs"), user 
	will use ws->dev->parent instead.
	- Remove '#include <linux/of_device.h>' because it is not used.

Change in v6:
	- Add wakeup_source_get_star() and wakeup_source_get_stop() to aligned 
	with wakeup_sources_stats_seq_start/nex/stop.

Change in v5:
	- Update commit message, add decription of walk through all wakeup
	source objects.
	- Add SCU protection in function wakeup_source_get_next().
	- Rename wakeup_source member 'attached_dev' to 'dev' and move it up
	(before wakeirq).

Change in v4:
	- None.

Change in v3:
	- Adjust indentation of *attached_dev;.

Change in v2:
	- None.

 drivers/base/power/wakeup.c | 42 ++++++++++++++++++++++++++++++++++++++++++
 include/linux/pm_wakeup.h   |  9 +++++++++
 2 files changed, 51 insertions(+)

diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
index 5817b51..8c7a5f9 100644
--- a/drivers/base/power/wakeup.c
+++ b/drivers/base/power/wakeup.c
@@ -248,6 +248,48 @@ void wakeup_source_unregister(struct wakeup_source *ws)
 EXPORT_SYMBOL_GPL(wakeup_source_unregister);
 
 /**
+ * wakeup_sources_read_lock - Lock wakeup source list for read.
+ */
+int wakeup_sources_read_lock(void)
+{
+	return srcu_read_lock(&wakeup_srcu);
+}
+EXPORT_SYMBOL_GPL(wakeup_sources_read_lock);
+
+/**
+ * wakeup_sources_read_unlock - Unlock wakeup source list.
+ */
+void wakeup_sources_read_unlock(int idx)
+{
+	srcu_read_unlock(&wakeup_srcu, idx);
+}
+EXPORT_SYMBOL_GPL(wakeup_sources_read_unlock);
+
+/**
+ * wakeup_sources_walk_start - Begin a walk on wakeup source list
+ */
+struct wakeup_source *wakeup_sources_walk_start(void)
+{
+	struct list_head *ws_head = &wakeup_sources;
+
+	return list_entry_rcu(ws_head->next, struct wakeup_source, entry);
+}
+EXPORT_SYMBOL_GPL(wakeup_sources_walk_start);
+
+/**
+ * wakeup_sources_walk_next - Get next wakeup source from the list
+ * @ws: Previous wakeup source object
+ */
+struct wakeup_source *wakeup_sources_walk_next(struct wakeup_source *ws)
+{
+	struct list_head *ws_head = &wakeup_sources;
+
+	return list_next_or_null_rcu(ws_head, &ws->entry,
+				struct wakeup_source, entry);
+}
+EXPORT_SYMBOL_GPL(wakeup_sources_walk_next);
+
+/**
  * device_wakeup_attach - Attach a wakeup source object to a device object.
  * @dev: Device to handle.
  * @ws: Wakeup source object to attach to @dev.
diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
index 661efa0..aa3da66 100644
--- a/include/linux/pm_wakeup.h
+++ b/include/linux/pm_wakeup.h
@@ -63,6 +63,11 @@ struct wakeup_source {
 	bool			autosleep_enabled:1;
 };
 
+#define for_each_wakeup_source(ws) \
+	for ((ws) = wakeup_sources_walk_start();	\
+	     (ws);					\
+	     (ws) = wakeup_sources_walk_next((ws)))
+
 #ifdef CONFIG_PM_SLEEP
 
 /*
@@ -92,6 +97,10 @@ extern void wakeup_source_remove(struct wakeup_source *ws);
 extern struct wakeup_source *wakeup_source_register(struct device *dev,
 						    const char *name);
 extern void wakeup_source_unregister(struct wakeup_source *ws);
+extern int wakeup_sources_read_lock(void);
+extern void wakeup_sources_read_unlock(int idx);
+extern struct wakeup_source *wakeup_sources_walk_start(void);
+extern struct wakeup_source *wakeup_sources_walk_next(struct wakeup_source *ws);
 extern int device_wakeup_enable(struct device *dev);
 extern int device_wakeup_disable(struct device *dev);
 extern void device_set_wakeup_capable(struct device *dev, bool capable);
-- 
2.7.4

