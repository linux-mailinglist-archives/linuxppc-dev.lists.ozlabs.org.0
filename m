Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6DFA230C8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 11:54:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 456vPs3j44zDqPN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 May 2019 19:54:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=ran.wang_1@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 456vKl3r6SzDqF0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 May 2019 19:51:04 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 483F120028A;
 Mon, 20 May 2019 11:51:01 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 4968320018B;
 Mon, 20 May 2019 11:50:55 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id E68B6402A2;
 Mon, 20 May 2019 17:50:47 +0800 (SGT)
From: Ran Wang <ran.wang_1@nxp.com>
To: Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v4 1/3] PM: wakeup: Add routine to help fetch wakeup source
 object.
Date: Mon, 20 May 2019 17:52:36 +0800
Message-Id: <20190520095238.29210-1-ran.wang_1@nxp.com>
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
Cc: Len Brown <len.brown@intel.com>, devicetree@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Ran Wang <ran.wang_1@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some user might want to go through all registered wakeup sources
and doing things accordingly. For example, SoC PM driver might need to
do HW programming to prevent powering down specific IP which wakeup
source depending on. And is user's responsibility to identify if this
wakeup source he is interested in.

Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
---
Change in v4:
	- None.

Change in v3:
	- Adjust indentation of *attached_dev;.

Change in v2:
	- None.

 drivers/base/power/wakeup.c |   18 ++++++++++++++++++
 include/linux/pm_wakeup.h   |    3 +++
 2 files changed, 21 insertions(+), 0 deletions(-)

diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
index 5b2b6a0..6904485 100644
--- a/drivers/base/power/wakeup.c
+++ b/drivers/base/power/wakeup.c
@@ -14,6 +14,7 @@
 #include <linux/suspend.h>
 #include <linux/seq_file.h>
 #include <linux/debugfs.h>
+#include <linux/of_device.h>
 #include <linux/pm_wakeirq.h>
 #include <trace/events/power.h>
 
@@ -226,6 +227,22 @@ void wakeup_source_unregister(struct wakeup_source *ws)
 	}
 }
 EXPORT_SYMBOL_GPL(wakeup_source_unregister);
+/**
+ * wakeup_source_get_next - Get next wakeup source from the list
+ * @ws: Previous wakeup source object, null means caller want first one.
+ */
+struct wakeup_source *wakeup_source_get_next(struct wakeup_source *ws)
+{
+	struct list_head *ws_head = &wakeup_sources;
+
+	if (ws)
+		return list_next_or_null_rcu(ws_head, &ws->entry,
+				struct wakeup_source, entry);
+	else
+		return list_entry_rcu(ws_head->next,
+				struct wakeup_source, entry);
+}
+EXPORT_SYMBOL_GPL(wakeup_source_get_next);
 
 /**
  * device_wakeup_attach - Attach a wakeup source object to a device object.
@@ -242,6 +259,7 @@ static int device_wakeup_attach(struct device *dev, struct wakeup_source *ws)
 		return -EEXIST;
 	}
 	dev->power.wakeup = ws;
+	ws->attached_dev = dev;
 	if (dev->power.wakeirq)
 		device_wakeup_attach_irq(dev, dev->power.wakeirq);
 	spin_unlock_irq(&dev->power.lock);
diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
index 0ff134d..913b2fb 100644
--- a/include/linux/pm_wakeup.h
+++ b/include/linux/pm_wakeup.h
@@ -50,6 +50,7 @@
  * @wakeup_count: Number of times the wakeup source might abort suspend.
  * @active: Status of the wakeup source.
  * @has_timeout: The wakeup source has been activated with a timeout.
+ * @attached_dev: The device it attached to
  */
 struct wakeup_source {
 	const char 		*name;
@@ -70,6 +71,7 @@ struct wakeup_source {
 	unsigned long		wakeup_count;
 	bool			active:1;
 	bool			autosleep_enabled:1;
+	struct device		*attached_dev;
 };
 
 #ifdef CONFIG_PM_SLEEP
@@ -101,6 +103,7 @@ static inline void device_set_wakeup_path(struct device *dev)
 extern void wakeup_source_remove(struct wakeup_source *ws);
 extern struct wakeup_source *wakeup_source_register(const char *name);
 extern void wakeup_source_unregister(struct wakeup_source *ws);
+extern struct wakeup_source *wakeup_source_get_next(struct wakeup_source *ws);
 extern int device_wakeup_enable(struct device *dev);
 extern int device_wakeup_disable(struct device *dev);
 extern void device_set_wakeup_capable(struct device *dev, bool capable);
-- 
1.7.1

