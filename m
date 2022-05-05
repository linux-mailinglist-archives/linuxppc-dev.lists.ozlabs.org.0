Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0D851CD9E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:09:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvWCV00bsz3fVx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 10:09:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CgojswWe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.115; helo=mga14.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256
 header.s=Intel header.b=CgojswWe; dkim-atps=neutral
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvVzM1K1kz3c8f
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 09:59:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651795151; x=1683331151;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=eMvcJDLLgv1piJPvn9rpsQ5W0zxPoYZ7HqfVKzdrDNs=;
 b=CgojswWeSIIxLyEZwU4NPySqLtdgnhUk9Wo2Ic4uH0a91uWxI58c8jYx
 Sil8x66fwQjHzVcLrGEW0EnhUvvYlEI8CGGZ5jR8agdGtWWVBx6mR05p/
 xMIZxozf2aPPIk+9O1osAu+gB6ln4kmjRgataP/nKtwcTjOHAPJkdhboL
 B5Hb89wjWCxUgAmr7mfSzxkIkl2mJ0vuNLMoQeM933lh54LtFgOkw6p3M
 HuEeH7QyTbakTlpac4mJqG3BZC0qDhGy8I2vJY6z0rRYJqXYtaZVzuQPT
 /ks9ILdoR38kNEAwQYVnmgpafbeynNnQ/ZWfeJrYgzs/YFXA9UNe4XR8n g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="268437325"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="268437325"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2022 16:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="694914386"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by orsmga004.jf.intel.com with ESMTP; 05 May 2022 16:57:51 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org
Subject: [PATCH v6 17/29] x86/hpet: Reserve an HPET channel for the hardlockup
 detector
Date: Thu,  5 May 2022 16:59:56 -0700
Message-Id: <20220506000008.30892-18-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
References: <20220506000008.30892-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Andi Kleen <ak@linux.intel.com>, linuxppc-dev@lists.ozlabs.org,
 Joerg Roedel <joro@8bytes.org>, Ricardo Neri <ricardo.neri@intel.com>,
 Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Tony Luck <tony.luck@intel.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The HPET hardlockup detector needs a dedicated HPET channel. Hence, create
a new HPET_MODE_NMI_WATCHDOG mode category to indicate that it cannot be
used for other purposes. Using MSI interrupts greatly simplifies the
implementation of the detector. Specifically, it helps to avoid the
complexities of routing the interrupt via the IO-APIC (e.g., potential
race conditions that arise from re-programming the IO-APIC while also
servicing an NMI). Therefore, only reserve the timer if it supports Front
Side Bus interrupt delivery.

HPET channels are reserved at various stages. First, from
x86_late_time_init(), hpet_time_init() checks if the HPET timer supports
Legacy Replacement Routing. If this is the case, channels 0 and 1 are
reserved as HPET_MODE_LEGACY.

At a later stage, from lockup_detector_init(), reserve the HPET channel
for the hardlockup detector. Then, the HPET clocksource reserves the
channels it needs and then the remaining channels are given to the HPET
char driver via hpet_alloc().

Hence, the channel assigned to the HPET hardlockup detector depends on
whether the first two channels are reserved for legacy mode.

Lastly, only reserve the channel for the hardlockup detector if enabled
in the kernel command line.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: x86@kernel.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
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
 arch/x86/kernel/hpet.c      | 105 ++++++++++++++++++++++++++++++++++++
 2 files changed, 127 insertions(+)

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
index 02d25e00e93f..ee9275c013f5 100644
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
@@ -1496,3 +1498,106 @@ irqreturn_t hpet_rtc_interrupt(int irq, void *dev_id)
 }
 EXPORT_SYMBOL_GPL(hpet_rtc_interrupt);
 #endif
+
+#ifdef CONFIG_X86_HARDLOCKUP_DETECTOR_HPET
+
+/*
+ * We program the timer in 32-bit mode to reduce the number of register
+ * accesses. The maximum value of watch_thresh is 60 seconds. The HPET counter
+ * should not wrap around more frequently than that. Thus, the frequency of the
+ * HPET timer must be less than 71.582788 MHz. For safety, limit the frequency
+ * to 85% the maximum frequency.
+ *
+ * The frequency of the HPET on systems in the field is usually less than 24MHz.
+ */
+#define HPET_HLD_MAX_FREQ 60845000ULL
+
+static struct hpet_hld_data *hld_data;
+
+/**
+ * hpet_hld_free_timer - Free the reserved timer for the hardlockup detector
+ *
+ * Free the resources held by the HPET channel reserved for the hard lockup
+ * detector and make it available for other uses.
+ *
+ * Returns: none
+ */
+void hpet_hld_free_timer(struct hpet_hld_data *hdata)
+{
+	hdata->channel_priv->mode = HPET_MODE_UNUSED;
+	hdata->channel_priv->in_use = 0;
+	kfree(hld_data);
+}
+
+/**
+ * hpet_hld_get_timer - Get an HPET channel for the hardlockup detector
+ *
+ * Reseve an HPET channel and return the timer information to caller only if a
+ * channel is available and supports FSB mode. This function is called by the
+ * hardlockup detector only if enabled in the kernel command line.
+ *
+ * Returns: a pointer with the properties of the reserved HPET channel.
+ */
+struct hpet_hld_data *hpet_hld_get_timer(void)
+{
+	struct hpet_channel *hc = hpet_base.channels;
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
+		 * the HPET clocksource has taken all the timers. The HPET driver
+		 * (/dev/hpet) should not take timers at this point as channels
+		 * for such driver can only be reserved from user space.
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
+	hld_data = NULL;
+	return NULL;
+}
+#endif /* CONFIG_X86_HARDLOCKUP_DETECTOR_HPET */
-- 
2.17.1

