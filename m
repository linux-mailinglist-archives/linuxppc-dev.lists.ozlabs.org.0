Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E142477FD8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 23:08:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFR8L1QVDz3f5h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 09:08:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P8BRuujq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=P8BRuujq; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFQzd2Tnyz3c7D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 09:01:01 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id m192so367750qke.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 14:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HZE+R0Dh0vh59Q9owcPIUCpgXRkkR63B0uDV1tmUAmA=;
 b=P8BRuujqvpd/4MlC4RaucTJcdFKr64uE9AAxCtUw7eYqydep7CGVrCHt5AvTNQT2OS
 BkzpfiD6WZpLRNqkORsc0avyyFv6FXSiM2FeYD3t/lGHKCESZcy/+ZXpUlSWDEnzotk8
 kmtncucG2OhES6ggru56hQAtTx0gk68IZSuSyNyjxoULWdewzW7bPrF0iTqWEAgv9I6Q
 BQrf4WOojDdAHIp8qagN3cHpNjjgBp415F048jqFe68ZzV7+t1OQE4I4s+4MxyGohAIN
 XjjzNsUODv1f0IXmUlQhKR/LyInkRGa7BOF01EjUDQbQoi8vcK57D+Vq1kdLChOYVqDy
 XVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HZE+R0Dh0vh59Q9owcPIUCpgXRkkR63B0uDV1tmUAmA=;
 b=kVrqwjh6tgRaoCnW7PIKiZHSMNVRvByniY7q4GLuP/8+HqnTHA9/ccfyyZu3uxTDlp
 TdQaVmbkxHz2MXmUi5VhJxeXxCBPyZSts8FFAk0g9uCGWS5CogbVOZXkUdbi5KpxzVdn
 2ncHic0PDduXsd/CQ/S/0LM3Cq4vN6HCIOF6i17c9Au/0wN1BHwMOG+tyBDBqthpmnY/
 hK4b+LRXvVyttVxNoOIGYKHAs0yDUJsszRCVAXPn5paKSq97IKLghBbRZlu45DRrDDZ2
 hrviJF+Jf/O3Uby+A2oFzcoFjP1IemjmbUBtLGrnVeQCwoZU7NbKiK3qqShGEwRKsdLt
 bt2g==
X-Gm-Message-State: AOAM530yQZk7YTOhL3VZSBPsGupAHryZ1h7OYpO8CTYgIx1x5nYDVDoy
 ng01hWeKaUfj8hVf2zVekq5oh0zGQpc=
X-Google-Smtp-Source: ABdhPJzNk0cuSCLSDwbmUdWidmH3fbiL9VAYu/Q/tLKm8IbwPRtVXWcB77gpf7saHLUy0CtYUSIJfA==
X-Received: by 2002:a05:620a:4245:: with SMTP id
 w5mr41068qko.469.1639692058238; 
 Thu, 16 Dec 2021 14:00:58 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:dce6:135:603d:e519])
 by smtp.gmail.com with ESMTPSA id y21sm5478483qtw.10.2021.12.16.14.00.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 14:00:57 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 11/20] powerpc/powernv: Add __init attribute to eligible
 functions
Date: Thu, 16 Dec 2021 17:00:26 -0500
Message-Id: <20211216220035.605465-12-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211216220035.605465-1-nick.child@ibm.com>
References: <20211216220035.605465-1-nick.child@ibm.com>
MIME-Version: 1.0
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some functions defined in 'arch/powerpc/platforms/powernv' are
deserving of an `__init` macro attribute. These functions are only
called by other initialization functions and therefore should inherit
the attribute.
Also, change function declarations in header files to include `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/include/asm/cpuidle.h                  | 2 +-
 arch/powerpc/include/asm/opal.h                     | 2 +-
 arch/powerpc/platforms/powernv/idle.c               | 6 +++---
 arch/powerpc/platforms/powernv/opal-core.c          | 6 +++---
 arch/powerpc/platforms/powernv/opal-fadump.c        | 2 +-
 arch/powerpc/platforms/powernv/opal-msglog.c        | 4 ++--
 arch/powerpc/platforms/powernv/opal-power.c         | 2 +-
 arch/powerpc/platforms/powernv/opal-powercap.c      | 2 +-
 arch/powerpc/platforms/powernv/opal-rtc.c           | 2 +-
 arch/powerpc/platforms/powernv/opal-sensor-groups.c | 4 ++--
 arch/powerpc/platforms/powernv/opal.c               | 8 ++++----
 arch/powerpc/platforms/powernv/pci-ioda.c           | 4 ++--
 arch/powerpc/platforms/powernv/powernv.h            | 4 ++--
 arch/powerpc/platforms/powernv/rng.c                | 2 +-
 arch/powerpc/platforms/powernv/setup.c              | 6 +++---
 15 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/powerpc/include/asm/cpuidle.h b/arch/powerpc/include/asm/cpuidle.h
index 9844b3ded187..0cce5dc7fb1c 100644
--- a/arch/powerpc/include/asm/cpuidle.h
+++ b/arch/powerpc/include/asm/cpuidle.h
@@ -85,7 +85,7 @@ extern struct pnv_idle_states_t *pnv_idle_states;
 extern int nr_pnv_idle_states;
 
 unsigned long pnv_cpu_offline(unsigned int cpu);
-int validate_psscr_val_mask(u64 *psscr_val, u64 *psscr_mask, u32 flags);
+int __init validate_psscr_val_mask(u64 *psscr_val, u64 *psscr_mask, u32 flags);
 static inline void report_invalid_psscr_val(u64 psscr_val, int err)
 {
 	switch (err) {
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 6ea9001de9a9..bfd3142cd0ba 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -314,7 +314,7 @@ extern int early_init_dt_scan_opal(unsigned long node, const char *uname,
 				   int depth, void *data);
 extern int early_init_dt_scan_recoverable_ranges(unsigned long node,
 				 const char *uname, int depth, void *data);
-extern void opal_configure_cores(void);
+void __init opal_configure_cores(void);
 
 extern int opal_get_chars(uint32_t vtermno, char *buf, int count);
 extern int opal_put_chars(uint32_t vtermno, const char *buf, int total_len);
diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index 885ef229aba1..9942289f379b 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -62,7 +62,7 @@ static bool deepest_stop_found;
 
 static unsigned long power7_offline_type;
 
-static int pnv_save_sprs_for_deep_states(void)
+static int __init pnv_save_sprs_for_deep_states(void)
 {
 	int cpu;
 	int rc;
@@ -1123,7 +1123,7 @@ unsigned long pnv_cpu_offline(unsigned int cpu)
  *	stop instruction
  */
 
-int validate_psscr_val_mask(u64 *psscr_val, u64 *psscr_mask, u32 flags)
+int __init validate_psscr_val_mask(u64 *psscr_val, u64 *psscr_mask, u32 flags)
 {
 	int err = 0;
 
@@ -1317,7 +1317,7 @@ static void __init pnv_probe_idle_states(void)
  * which is the number of cpuidle states discovered through device-tree.
  */
 
-static int pnv_parse_cpuidle_dt(void)
+static int __init pnv_parse_cpuidle_dt(void)
 {
 	struct device_node *np;
 	int nr_idle_states, i;
diff --git a/arch/powerpc/platforms/powernv/opal-core.c b/arch/powerpc/platforms/powernv/opal-core.c
index 5b9736bbc2aa..0331f1973f0e 100644
--- a/arch/powerpc/platforms/powernv/opal-core.c
+++ b/arch/powerpc/platforms/powernv/opal-core.c
@@ -89,7 +89,7 @@ static inline int is_opalcore_usable(void)
 	return (oc_conf && oc_conf->opalcorebuf != NULL) ? 1 : 0;
 }
 
-static Elf64_Word *append_elf64_note(Elf64_Word *buf, char *name,
+static Elf64_Word *__init append_elf64_note(Elf64_Word *buf, char *name,
 				     u32 type, void *data,
 				     size_t data_len)
 {
@@ -108,7 +108,7 @@ static Elf64_Word *append_elf64_note(Elf64_Word *buf, char *name,
 	return buf;
 }
 
-static void fill_prstatus(struct elf_prstatus *prstatus, int pir,
+static void __init fill_prstatus(struct elf_prstatus *prstatus, int pir,
 			  struct pt_regs *regs)
 {
 	memset(prstatus, 0, sizeof(struct elf_prstatus));
@@ -134,7 +134,7 @@ static void fill_prstatus(struct elf_prstatus *prstatus, int pir,
 	}
 }
 
-static Elf64_Word *auxv_to_elf64_notes(Elf64_Word *buf,
+static Elf64_Word *__init auxv_to_elf64_notes(Elf64_Word *buf,
 				       u64 opal_boot_entry)
 {
 	Elf64_Off *bufp = (Elf64_Off *)oc_conf->auxv_buf;
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 9a360ced663b..c8ad057c7221 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -112,7 +112,7 @@ static void opal_fadump_update_config(struct fw_dump *fadump_conf,
  * This function is called in the capture kernel to get configuration details
  * from metadata setup by the first kernel.
  */
-static void opal_fadump_get_config(struct fw_dump *fadump_conf,
+static void __init opal_fadump_get_config(struct fw_dump *fadump_conf,
 				   const struct opal_fadump_mem_struct *fdm)
 {
 	unsigned long base, size, last_end, hole_size;
diff --git a/arch/powerpc/platforms/powernv/opal-msglog.c b/arch/powerpc/platforms/powernv/opal-msglog.c
index d3b6e135c18b..22d6efe17b0d 100644
--- a/arch/powerpc/platforms/powernv/opal-msglog.c
+++ b/arch/powerpc/platforms/powernv/opal-msglog.c
@@ -105,7 +105,7 @@ static struct bin_attribute opal_msglog_attr = {
 	.read = opal_msglog_read
 };
 
-struct memcons *memcons_init(struct device_node *node, const char *mc_prop_name)
+struct memcons *__init memcons_init(struct device_node *node, const char *mc_prop_name)
 {
 	u64 mcaddr;
 	struct memcons *mc;
@@ -133,7 +133,7 @@ struct memcons *memcons_init(struct device_node *node, const char *mc_prop_name)
 	return NULL;
 }
 
-u32 memcons_get_size(struct memcons *mc)
+u32 __init memcons_get_size(struct memcons *mc)
 {
 	return be32_to_cpu(mc->ibuf_size) + be32_to_cpu(mc->obuf_size);
 }
diff --git a/arch/powerpc/platforms/powernv/opal-power.c b/arch/powerpc/platforms/powernv/opal-power.c
index 2a3717fc24ea..db99ffcb7b82 100644
--- a/arch/powerpc/platforms/powernv/opal-power.c
+++ b/arch/powerpc/platforms/powernv/opal-power.c
@@ -53,7 +53,7 @@ static bool detect_epow(void)
 }
 
 /* Check for existing EPOW, DPO events */
-static bool poweroff_pending(void)
+static bool __init poweroff_pending(void)
 {
 	int rc;
 	__be64 opal_dpo_timeout;
diff --git a/arch/powerpc/platforms/powernv/opal-powercap.c b/arch/powerpc/platforms/powernv/opal-powercap.c
index c16d44f6f1d1..64506b46e77b 100644
--- a/arch/powerpc/platforms/powernv/opal-powercap.c
+++ b/arch/powerpc/platforms/powernv/opal-powercap.c
@@ -129,7 +129,7 @@ static ssize_t powercap_store(struct kobject *kobj,
 	return ret;
 }
 
-static void powercap_add_attr(int handle, const char *name,
+static void __init powercap_add_attr(int handle, const char *name,
 			      struct powercap_attr *attr)
 {
 	attr->handle = handle;
diff --git a/arch/powerpc/platforms/powernv/opal-rtc.c b/arch/powerpc/platforms/powernv/opal-rtc.c
index 44d7dacb33a2..a9bcf9217e64 100644
--- a/arch/powerpc/platforms/powernv/opal-rtc.c
+++ b/arch/powerpc/platforms/powernv/opal-rtc.c
@@ -18,7 +18,7 @@
 #include <asm/firmware.h>
 #include <asm/machdep.h>
 
-static void opal_to_tm(u32 y_m_d, u64 h_m_s_ms, struct rtc_time *tm)
+static void __init opal_to_tm(u32 y_m_d, u64 h_m_s_ms, struct rtc_time *tm)
 {
 	tm->tm_year	= ((bcd2bin(y_m_d >> 24) * 100) +
 			   bcd2bin((y_m_d >> 16) & 0xff)) - 1900;
diff --git a/arch/powerpc/platforms/powernv/opal-sensor-groups.c b/arch/powerpc/platforms/powernv/opal-sensor-groups.c
index f8ae1fb0c102..8fba7d25ae56 100644
--- a/arch/powerpc/platforms/powernv/opal-sensor-groups.c
+++ b/arch/powerpc/platforms/powernv/opal-sensor-groups.c
@@ -126,7 +126,7 @@ static void add_attr(int handle, struct sg_attr *attr, int index)
 	attr->attr.store = ops_info[index].store;
 }
 
-static int add_attr_group(const __be32 *ops, int len, struct sensor_group *sg,
+static int __init add_attr_group(const __be32 *ops, int len, struct sensor_group *sg,
 			   u32 handle)
 {
 	int i, j;
@@ -144,7 +144,7 @@ static int add_attr_group(const __be32 *ops, int len, struct sensor_group *sg,
 	return sysfs_create_group(sg_kobj, &sg->sg);
 }
 
-static int get_nr_attrs(const __be32 *ops, int len)
+static int __init get_nr_attrs(const __be32 *ops, int len)
 {
 	int i, j;
 	int nr_attrs = 0;
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index e9d18519e650..55a8fbfdb5b2 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -73,7 +73,7 @@ static struct task_struct *kopald_tsk;
 static struct opal_msg *opal_msg;
 static u32 opal_msg_size __ro_after_init;
 
-void opal_configure_cores(void)
+void __init opal_configure_cores(void)
 {
 	u64 reinit_flags = 0;
 
@@ -779,7 +779,7 @@ bool opal_mce_check_early_recovery(struct pt_regs *regs)
 	return !!recover_addr;
 }
 
-static int opal_sysfs_init(void)
+static int __init opal_sysfs_init(void)
 {
 	opal_kobj = kobject_create_and_add("opal", firmware_kobj);
 	if (!opal_kobj) {
@@ -937,7 +937,7 @@ static void __init opal_dump_region_init(void)
 			"rc = %d\n", rc);
 }
 
-static void opal_pdev_init(const char *compatible)
+static void __init opal_pdev_init(const char *compatible)
 {
 	struct device_node *np;
 
@@ -981,7 +981,7 @@ void opal_wake_poller(void)
 		wake_up_process(kopald_tsk);
 }
 
-static void opal_init_heartbeat(void)
+static void __init opal_init_heartbeat(void)
 {
 	/* Old firwmware, we assume the HVC heartbeat is sufficient */
 	if (of_property_read_u32(opal_node, "ibm,heartbeat-ms",
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 004cd6a96c8a..acd763593ab4 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -2265,7 +2265,7 @@ static const struct irq_domain_ops pnv_irq_domain_ops = {
 	.free   = pnv_irq_domain_free,
 };
 
-static int pnv_msi_allocate_domains(struct pci_controller *hose, unsigned int count)
+static int __init pnv_msi_allocate_domains(struct pci_controller *hose, unsigned int count)
 {
 	struct pnv_phb *phb = hose->private_data;
 	struct irq_domain *parent = irq_get_default_host();
@@ -2298,7 +2298,7 @@ static int pnv_msi_allocate_domains(struct pci_controller *hose, unsigned int co
 	return 0;
 }
 
-static void pnv_pci_init_ioda_msis(struct pnv_phb *phb)
+static void __init pnv_pci_init_ioda_msis(struct pnv_phb *phb)
 {
 	unsigned int count;
 	const __be32 *prop = of_get_property(phb->hose->dn,
diff --git a/arch/powerpc/platforms/powernv/powernv.h b/arch/powerpc/platforms/powernv/powernv.h
index 11df4e16a1cc..e297bf4abfcb 100644
--- a/arch/powerpc/platforms/powernv/powernv.h
+++ b/arch/powerpc/platforms/powernv/powernv.h
@@ -39,7 +39,7 @@ bool cpu_core_split_required(void);
 
 struct memcons;
 ssize_t memcons_copy(struct memcons *mc, char *to, loff_t pos, size_t count);
-u32 memcons_get_size(struct memcons *mc);
-struct memcons *memcons_init(struct device_node *node, const char *mc_prop_name);
+u32 __init memcons_get_size(struct memcons *mc);
+struct memcons *__init memcons_init(struct device_node *node, const char *mc_prop_name);
 
 #endif /* _POWERNV_H */
diff --git a/arch/powerpc/platforms/powernv/rng.c b/arch/powerpc/platforms/powernv/rng.c
index 72c25295c1c2..b4386714494a 100644
--- a/arch/powerpc/platforms/powernv/rng.c
+++ b/arch/powerpc/platforms/powernv/rng.c
@@ -80,7 +80,7 @@ static int powernv_get_random_darn(unsigned long *v)
 	return 1;
 }
 
-static int initialise_darn(void)
+static int __init initialise_darn(void)
 {
 	unsigned long val;
 	int i;
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index f37d6524a24d..105d889abd51 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -40,7 +40,7 @@
 #include "powernv.h"
 
 
-static bool fw_feature_is(const char *state, const char *name,
+static bool __init fw_feature_is(const char *state, const char *name,
 			  struct device_node *fw_features)
 {
 	struct device_node *np;
@@ -55,7 +55,7 @@ static bool fw_feature_is(const char *state, const char *name,
 	return rc;
 }
 
-static void init_fw_feat_flags(struct device_node *np)
+static void __init init_fw_feat_flags(struct device_node *np)
 {
 	if (fw_feature_is("enabled", "inst-spec-barrier-ori31,31,0", np))
 		security_ftr_set(SEC_FTR_SPEC_BAR_ORI31);
@@ -98,7 +98,7 @@ static void init_fw_feat_flags(struct device_node *np)
 		security_ftr_clear(SEC_FTR_BNDS_CHK_SPEC_BAR);
 }
 
-static void pnv_setup_security_mitigations(void)
+static void __init pnv_setup_security_mitigations(void)
 {
 	struct device_node *np, *fw_features;
 	enum l1d_flush_type type;
-- 
2.25.1

