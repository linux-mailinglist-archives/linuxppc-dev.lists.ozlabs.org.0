Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E8EDE2D1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 05:54:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xN7f51l2zDqZR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 14:54:54 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xN1K5LC9zDqV3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 14:49:20 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id D84871A04F9;
 Mon, 21 Oct 2019 05:49:15 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7446B1A04B8;
 Mon, 21 Oct 2019 05:49:09 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id A0644402DF;
 Mon, 21 Oct 2019 11:49:01 +0800 (SGT)
From: Ran Wang <ran.wang_1@nxp.com>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Rob Herring <robh+dt@kernel.org>,
 Li Yang <leoyang.li@nxp.com>, Mark Rutland <mark.rutland@arm.com>,
 Pavel Machek <pavel@ucw.cz>
Subject: [PATCH v7 1/3] PM: wakeup: Add routine to help fetch wakeup source
 object.
Date: Mon, 21 Oct 2019 11:49:25 +0800
Message-Id: <20191021034927.19300-1-ran.wang_1@nxp.com>
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

 drivers/base/power/wakeup.c | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/pm_wakeup.h   |  3 +++
 2 files changed, 40 insertions(+)

diff --git a/drivers/base/power/wakeup.c b/drivers/base/power/wakeup.c
index 5817b51..dee1b09 100644
--- a/drivers/base/power/wakeup.c
+++ b/drivers/base/power/wakeup.c
@@ -248,6 +248,43 @@ void wakeup_source_unregister(struct wakeup_source *ws)
 EXPORT_SYMBOL_GPL(wakeup_source_unregister);
 
 /**
+ * wakeup_source_get_star - Begin a walk on wakeup source list
+ * @srcuidx: Lock index allocated for this caller.
+ */
+struct wakeup_source *wakeup_source_get_start(int *srcuidx)
+{
+	struct list_head *ws_head = &wakeup_sources;
+
+	*srcuidx = srcu_read_lock(&wakeup_srcu);
+
+	return list_entry_rcu(ws_head->next, struct wakeup_source, entry);
+}
+EXPORT_SYMBOL_GPL(wakeup_source_get_start);
+
+/**
+ * wakeup_source_get_next - Get next wakeup source from the list
+ * @ws: Previous wakeup source object
+ */
+struct wakeup_source *wakeup_source_get_next(struct wakeup_source *ws)
+{
+	struct list_head *ws_head = &wakeup_sources;
+
+	return list_next_or_null_rcu(ws_head, &ws->entry,
+				struct wakeup_source, entry);
+}
+EXPORT_SYMBOL_GPL(wakeup_source_get_next);
+
+/**
+ * wakeup_source_get_stop - Stop a walk on wakeup source list
+ * @idx: Dedicated lock index of this caller.
+ */
+void wakeup_source_get_stop(int idx)
+{
+	srcu_read_unlock(&wakeup_srcu, idx);
+}
+EXPORT_SYMBOL_GPL(wakeup_source_get_stop);
+
+/**
  * device_wakeup_attach - Attach a wakeup source object to a device object.
  * @dev: Device to handle.
  * @ws: Wakeup source object to attach to @dev.
diff --git a/include/linux/pm_wakeup.h b/include/linux/pm_wakeup.h
index 661efa0..172e76c 100644
--- a/include/linux/pm_wakeup.h
+++ b/include/linux/pm_wakeup.h
@@ -92,6 +92,9 @@ extern void wakeup_source_remove(struct wakeup_source *ws);
 extern struct wakeup_source *wakeup_source_register(struct device *dev,
 						    const char *name);
 extern void wakeup_source_unregister(struct wakeup_source *ws);
+extern struct wakeup_source *wakeup_source_get_start(int *srcuidx);
+extern struct wakeup_source *wakeup_source_get_next(struct wakeup_source *ws);
+extern void wakeup_source_get_stop(int idx);
 extern int device_wakeup_enable(struct device *dev);
 extern int device_wakeup_disable(struct device *dev);
 extern void device_set_wakeup_capable(struct device *dev, bool capable);
-- 
2.7.4

