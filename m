Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 948196A7800
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:52:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrcs3S0xz3fW9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:52:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvMNTm5h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kvMNTm5h;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJb4qnHz3cMK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713887; x=1709249887;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=+mf2a1s8IDXo9f4g6wZDARhxFh01FpRy/WRIkdf67AA=;
  b=kvMNTm5hs/0QNEnAUMLhqMNjK6EiIUSOOzvty3UHeez/7crPMehPegnO
   ovcYy6+gHbxu/1uPoNbE282jOkrV3FN78aEsQSggQgKYm8AdAOx2o8RTn
   ZXmy7bLAzes3a/cLEYD+rKA0ijm+WtsukTBKCJ8agGlh73EHLZ3slQt+0
   srxfDvISHGwNWa+fCmCZQDWYGRMZJymL66vDz3+l2TfvNgn9ObCIH/Dix
   VxrslCOq7XW/ly5SUyCL2qWkS/vugXVALxy2woWnFSE8nABgGEIeVD5lv
   73JzwhQXkVgOLIc1gtiBaymeKRUeZt9DroBrIsQWQg1NLXzEDaVwgtEVo
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818757"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818757"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:37:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826845"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826845"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:58 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 15/24] x86/hpet: Reserve an HPET channel for the hardlockup detector
Date: Wed,  1 Mar 2023 15:47:44 -0800
Message-Id: <20230301234753.28582-16-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
References: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Create a new HPET_MODE_NMI_WATCHDOG mode category to reserve an HPET
channel for the hard lockup detector.

Only reserve the channel if the HPET frequency is sufficiently low to allow
32-bit register accesses and if Front Side BUS interrupt delivery (i.e.,
MSI interrupts) is supported.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * Reworded the commit message for clarity.
 * Removed pointless global variable hld_data.

Changes since v5:
 * Added a check for the allowed maximum frequency of the HPET.
 * Added hpet_hld_free_timer() to properly free the reserved HPET channel
   if the initialization is not completed.
 * Call hpet_assign_irq() with as_nmi = true.
 * Relocated declarations of functions and data structures of the detector
   to not depend on CONFIG_HPET_TIMER.

Changes since v4:
 * Reworked timer reservation to use Thomas' rework on HPET channel
   management.
 * Removed hard-coded channel number for the hardlockup detector.
 * Provided more details on the sequence of HPET channel reservations.
   (Thomas Gleixner)
 * Only reserve a channel for the hardlockup detector if enabled via
   kernel command line. The function reserving the channel is called from
   hardlockup detector. (Thomas Gleixner)
 * Shorten the name of hpet_hardlockup_detector_get_timer() to
   hpet_hld_get_timer(). (Andi)
 * Simplify error handling when a channel is not found. (Tony)

Changes since v3:
 * None

Changes since v2:
 * None

Changes since v1:
 * None
---
 arch/x86/include/asm/hpet.h |  22 ++++++++
 arch/x86/kernel/hpet.c      | 100 ++++++++++++++++++++++++++++++++++++
 2 files changed, 122 insertions(+)

diff --git a/arch/x86/include/asm/hpet.h b/arch/x86/include/asm/hpet.h
index 486e001413c7..5762bd0169a1 100644
--- a/arch/x86/include/asm/hpet.h
+++ b/arch/x86/include/asm/hpet.h
@@ -103,4 +103,26 @@ static inline int is_hpet_enabled(void) { return 0; }
 #define default_setup_hpet_msi	NULL
 
 #endif
+
+#ifdef CONFIG_X86_HARDLOCKUP_DETECTOR_HPET
+/**
+ * struct hpet_hld_data - Data needed to operate the detector
+ * @has_periodic:		The HPET channel supports periodic mode
+ * @channel:			HPET channel assigned to the detector
+ * @channe_priv:		Private data of the assigned channel
+ * @ticks_per_second:		Frequency of the HPET timer
+ * @irq:			IRQ number assigned to the HPET channel
+ */
+struct hpet_hld_data {
+	bool			has_periodic;
+	u32			channel;
+	struct hpet_channel	*channel_priv;
+	u64			ticks_per_second;
+	int			irq;
+};
+
+extern struct hpet_hld_data *hpet_hld_get_timer(void);
+extern void hpet_hld_free_timer(struct hpet_hld_data *hdata);
+#endif /* CONFIG_X86_HARDLOCKUP_DETECTOR_HPET */
+
 #endif /* _ASM_X86_HPET_H */
diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index f42ce3fc4528..97570426f324 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -20,6 +20,7 @@ enum hpet_mode {
 	HPET_MODE_LEGACY,
 	HPET_MODE_CLOCKEVT,
 	HPET_MODE_DEVICE,
+	HPET_MODE_NMI_WATCHDOG,
 };
 
 struct hpet_channel {
@@ -216,6 +217,7 @@ static void __init hpet_reserve_platform_timers(void)
 			break;
 		case HPET_MODE_CLOCKEVT:
 		case HPET_MODE_LEGACY:
+		case HPET_MODE_NMI_WATCHDOG:
 			hpet_reserve_timer(&hd, hc->num);
 			break;
 		}
@@ -1498,3 +1500,101 @@ irqreturn_t hpet_rtc_interrupt(int irq, void *dev_id)
 }
 EXPORT_SYMBOL_GPL(hpet_rtc_interrupt);
 #endif
+
+#ifdef CONFIG_X86_HARDLOCKUP_DETECTOR_HPET
+
+/*
+ * We program the channel in 32-bit mode to reduce the number of register
+ * accesses. The maximum value of watch_thresh is 60 seconds. The HPET counter
+ * should not wrap around more frequently than that: its frequency must be less
+ * than 71.582788 MHz. For safety, limit the frequency to 85% of the maximum
+ * permitted frequency.
+ *
+ * The frequency of the HPET in most systems in the field is less than 24MHz.
+ */
+#define HPET_HLD_MAX_FREQ 60845000ULL
+
+/**
+ * hpet_hld_free_timer - Free the reserved channel for the hardlockup detector
+ * @hdata:	Data structure representing the reserved channel.
+ *
+ * Returns: none
+ */
+void hpet_hld_free_timer(struct hpet_hld_data *hld_data)
+{
+	hld_data->channel_priv->mode = HPET_MODE_UNUSED;
+	hld_data->channel_priv->in_use = 0;
+	kfree(hld_data);
+}
+
+/**
+ * hpet_hld_get_timer - Get an HPET channel for the hardlockup detector
+ *
+ * Reserve an HPET channel if available, supports FSB mode, and has sufficiently
+ * low frequency. This function is called by the hardlockup detector if enabled
+ * in the kernel command line.
+ *
+ * Returns: a pointer with the properties of the reserved HPET channel.
+ */
+struct hpet_hld_data *hpet_hld_get_timer(void)
+{
+	struct hpet_channel *hc = hpet_base.channels;
+	struct hpet_hld_data *hld_data;
+	int i, irq;
+
+	if (hpet_freq > HPET_HLD_MAX_FREQ)
+		return NULL;
+
+	for (i = 0; i < hpet_base.nr_channels; i++) {
+		hc = hpet_base.channels + i;
+
+		/*
+		 * Associate the first unused channel to the hardlockup
+		 * detector. Bailout if we cannot find one. This may happen if
+		 * the HPET clocksource has taken all the timers. The HPET
+		 * driver (/dev/hpet) has not taken any channels at this point.
+		 */
+		if (hc->mode == HPET_MODE_UNUSED)
+			break;
+	}
+
+	if (i == hpet_base.nr_channels)
+		return NULL;
+
+	if (!(hc->boot_cfg & HPET_TN_FSB_CAP))
+		return NULL;
+
+	hld_data = kzalloc(sizeof(*hld_data), GFP_KERNEL);
+	if (!hld_data)
+		return NULL;
+
+	hc->mode = HPET_MODE_NMI_WATCHDOG;
+	hc->in_use = 1;
+	hld_data->channel_priv = hc;
+
+	if (hc->boot_cfg & HPET_TN_PERIODIC_CAP)
+		hld_data->has_periodic = true;
+
+	if (!hpet_domain)
+		hpet_domain = hpet_create_irq_domain(hpet_blockid);
+
+	if (!hpet_domain)
+		goto err;
+
+	/* Assign an IRQ with NMI delivery mode. */
+	irq = hpet_assign_irq(hpet_domain, hc, hc->num, true);
+	if (irq <= 0)
+		goto err;
+
+	hc->irq = irq;
+	hld_data->irq = irq;
+	hld_data->channel = i;
+	hld_data->ticks_per_second = hpet_freq;
+
+	return hld_data;
+
+err:
+	hpet_hld_free_timer(hld_data);
+	return NULL;
+}
+#endif /* CONFIG_X86_HARDLOCKUP_DETECTOR_HPET */
-- 
2.25.1

