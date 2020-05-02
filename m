Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AD471C24D0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:48:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnS70d5RzDqXT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:48:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QgrCEHP7; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmqr24y3zDr8p
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:20:08 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id v2so4683633plp.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=znM9/6PfPr4QtQILUnLe07YofG8wlv3mwxo9PdQ+ZP0=;
 b=QgrCEHP7XKVi5fCePRxprXW8UzutIGteJyQCrMaX6fR1pCVe3ZeeXZNX7JazEtB+3I
 KuT1Cc0soNLfq6J+rdxf9P8RRlAwPr7MsQzNW0KrICPF2QBGege7B4SNzms6ACCvXRM/
 v5hcQZt3f2FDG9KHjryawGJyKHjpHDtuZNl9wnYYCaUno46liHGmTiJxVWh9VY6EgPxw
 l0XE9yT1Uf3wjdV+QG3/MTaZTUYkPMKtrecxEqOgzle153tJVIBK1NqJi77unaJeTeD+
 bBgXamYCSTJ5DsFM03ZT+x8whtll7IdyoYcQQzU4nfrE3EY4e9iYNHsSOk4qh0y7f93F
 Zy+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=znM9/6PfPr4QtQILUnLe07YofG8wlv3mwxo9PdQ+ZP0=;
 b=KNC5B8027KJrUN0LJal2zCaZ1ldgsKEcNtA989LfDJSkD67HXCVfYQHdoip2j3z85B
 gInuBwqJBF78jGtcHBVW/Pf2quibZaPf3MpjCGF7aAAovPkUjaNiZdi6aHhiQ07m8Fpt
 7eOQ6/IAbOgGVVIoVNJrbB8uzD4n1COuU5HJf5KCaW+lEzFLjiFF2x1HtX/MiqLzpbLI
 hHYUWGrATEyIcpZK40qXDdQywaaWmq0750n9mGnOWRoS1rLIpc652a7s46T5FUiDEg+s
 tctXi5X8cBfMyZKxxgh82KcLkHlCI0tHCJMFUgF1YdRoVCUjUYxuTLo7q9PTCYL4xrrX
 thXA==
X-Gm-Message-State: AGi0PuZKCEvZGaOq48CsSBahOWDRwsZXYGMzPgTAcpxoXEO3GJlT15G0
 OnPZrrT1IQP6V9mqi750lJL7ZPno
X-Google-Smtp-Source: APiQypKYat3d8qHnShrt+3ggzomYoEDODqQhGW4vdAEiiLP7IezV/Joo+NFfUf2xkab1q+cBXo6T0A==
X-Received: by 2002:a17:902:26f:: with SMTP id
 102mr2091383plc.209.1588418405275; 
 Sat, 02 May 2020 04:20:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:20:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 05/10] powerpc/powernv: Don't translate kernel addresses
 to real addresses for OPAL
Date: Sat,  2 May 2020 21:19:09 +1000
Message-Id: <20200502111914.166578-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A random assortment of OPAL callers use __pa() on pointers (others don't).

This is not required because __pa() behaves the same as __va() when
translation is off. In order to run OPAL with translation on, the
effective addresses have to be used.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/perf/imc-pmu.c                    |  4 ++--
 arch/powerpc/platforms/powernv/npu-dma.c       |  2 +-
 arch/powerpc/platforms/powernv/opal-dump.c     |  2 +-
 arch/powerpc/platforms/powernv/opal-elog.c     |  4 ++--
 arch/powerpc/platforms/powernv/opal-flash.c    |  6 +++---
 arch/powerpc/platforms/powernv/opal-hmi.c      |  2 +-
 arch/powerpc/platforms/powernv/opal-nvram.c    |  4 ++--
 arch/powerpc/platforms/powernv/opal-powercap.c |  2 +-
 arch/powerpc/platforms/powernv/opal-psr.c      |  2 +-
 arch/powerpc/platforms/powernv/opal-xscom.c    |  2 +-
 arch/powerpc/platforms/powernv/opal.c          |  6 +++---
 arch/powerpc/platforms/powernv/pci-ioda.c      |  2 +-
 arch/powerpc/sysdev/xive/native.c              |  2 +-
 drivers/char/powernv-op-panel.c                |  3 +--
 drivers/i2c/busses/i2c-opal.c                  | 12 ++++++------
 drivers/mtd/devices/powernv_flash.c            |  4 ++--
 16 files changed, 29 insertions(+), 30 deletions(-)

diff --git a/arch/powerpc/perf/imc-pmu.c b/arch/powerpc/perf/imc-pmu.c
index eb82dda884e5..332c7a3398f3 100644
--- a/arch/powerpc/perf/imc-pmu.c
+++ b/arch/powerpc/perf/imc-pmu.c
@@ -610,7 +610,7 @@ static int core_imc_mem_init(int cpu, int size)
 	mutex_init(&core_imc_refc[core_id].lock);
 
 	rc = opal_imc_counters_init(OPAL_IMC_COUNTERS_CORE,
-				__pa((void *)mem_info->vbase),
+				(u64)mem_info->vbase,
 				get_hard_smp_processor_id(cpu));
 	if (rc) {
 		free_pages((u64)mem_info->vbase, get_order(size));
@@ -1209,7 +1209,7 @@ static int trace_imc_mem_alloc(int cpu_id, int size)
 		per_cpu(trace_imc_mem, cpu_id) = local_mem;
 
 		/* Initialise the counters for trace mode */
-		rc = opal_imc_counters_init(OPAL_IMC_COUNTERS_TRACE, __pa((void *)local_mem),
+		rc = opal_imc_counters_init(OPAL_IMC_COUNTERS_TRACE, (u64)local_mem,
 					    get_hard_smp_processor_id(cpu_id));
 		if (rc) {
 			pr_info("IMC:opal init failed for trace imc\n");
diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index b95b9e3c4c98..9d38a30cc27e 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -149,7 +149,7 @@ static long pnv_npu_set_window(struct iommu_table_group *table_group, int num,
 			npe->pe_number,
 			npe->pe_number,
 			tbl->it_indirect_levels + 1,
-			__pa(tbl->it_base),
+			__pa(tbl->it_base), /* XXX? */
 			size << 3,
 			IOMMU_PAGE_SIZE(tbl));
 	if (rc) {
diff --git a/arch/powerpc/platforms/powernv/opal-dump.c b/arch/powerpc/platforms/powernv/opal-dump.c
index 543c816fa99e..94d5fb716a32 100644
--- a/arch/powerpc/platforms/powernv/opal-dump.c
+++ b/arch/powerpc/platforms/powernv/opal-dump.c
@@ -256,7 +256,7 @@ static int64_t dump_read_data(struct dump_obj *dump)
 	}
 
 	/* First entry address */
-	addr = __pa(list);
+	addr = (u64)list;
 
 	/* Fetch data */
 	rc = OPAL_BUSY_EVENT;
diff --git a/arch/powerpc/platforms/powernv/opal-elog.c b/arch/powerpc/platforms/powernv/opal-elog.c
index 62ef7ad995da..6af5ff892195 100644
--- a/arch/powerpc/platforms/powernv/opal-elog.c
+++ b/arch/powerpc/platforms/powernv/opal-elog.c
@@ -163,7 +163,7 @@ static ssize_t raw_attr_read(struct file *filep, struct kobject *kobj,
 		if (!elog->buffer)
 			return -EIO;
 
-		opal_rc = opal_read_elog(__pa(elog->buffer),
+		opal_rc = opal_read_elog((u64)elog->buffer,
 					 elog->size, elog->id);
 		if (opal_rc != OPAL_SUCCESS) {
 			pr_err("ELOG: log read failed for log-id=%llx\n",
@@ -206,7 +206,7 @@ static struct elog_obj *create_elog_obj(uint64_t id, size_t size, uint64_t type)
 	elog->buffer = kzalloc(elog->size, GFP_KERNEL);
 
 	if (elog->buffer) {
-		rc = opal_read_elog(__pa(elog->buffer),
+		rc = opal_read_elog((u64)elog->buffer,
 					 elog->size, elog->id);
 		if (rc != OPAL_SUCCESS) {
 			pr_err("ELOG: log read failed for log-id=%llx\n",
diff --git a/arch/powerpc/platforms/powernv/opal-flash.c b/arch/powerpc/platforms/powernv/opal-flash.c
index 7e7d38b17420..46f02279d36a 100644
--- a/arch/powerpc/platforms/powernv/opal-flash.c
+++ b/arch/powerpc/platforms/powernv/opal-flash.c
@@ -130,11 +130,11 @@ static DEFINE_MUTEX(image_data_mutex);
 static inline void opal_flash_validate(void)
 {
 	long ret;
-	void *buf = validate_flash_data.buf;
+	u64 buf = (u64)validate_flash_data.buf;
 	__be32 size = cpu_to_be32(validate_flash_data.buf_size);
 	__be32 result;
 
-	ret = opal_validate_flash(__pa(buf), &size, &result);
+	ret = opal_validate_flash(buf, &size, &result);
 
 	validate_flash_data.status = ret;
 	validate_flash_data.buf_size = be32_to_cpu(size);
@@ -290,7 +290,7 @@ static int opal_flash_update(int op)
 		goto invalid_img;
 
 	/* First entry address */
-	addr = __pa(list);
+	addr = (u64)list;
 
 flash:
 	rc = opal_update_flash(addr);
diff --git a/arch/powerpc/platforms/powernv/opal-hmi.c b/arch/powerpc/platforms/powernv/opal-hmi.c
index 3e1f064a18db..7c51baeb62ff 100644
--- a/arch/powerpc/platforms/powernv/opal-hmi.c
+++ b/arch/powerpc/platforms/powernv/opal-hmi.c
@@ -298,7 +298,7 @@ static void hmi_event_handler(struct work_struct *work)
 
 	if (unrecoverable) {
 		/* Pull all HMI events from OPAL before we panic. */
-		while (opal_get_msg(__pa(&msg), sizeof(msg)) == OPAL_SUCCESS) {
+		while (opal_get_msg((u64)&msg, sizeof(msg)) == OPAL_SUCCESS) {
 			u32 type;
 
 			type = be32_to_cpu(msg.msg_type);
diff --git a/arch/powerpc/platforms/powernv/opal-nvram.c b/arch/powerpc/platforms/powernv/opal-nvram.c
index 380bc2d7ebbf..a7924dffee2b 100644
--- a/arch/powerpc/platforms/powernv/opal-nvram.c
+++ b/arch/powerpc/platforms/powernv/opal-nvram.c
@@ -33,7 +33,7 @@ static ssize_t opal_nvram_read(char *buf, size_t count, loff_t *index)
 	off = *index;
 	if ((off + count) > nvram_size)
 		count = nvram_size - off;
-	rc = opal_read_nvram(__pa(buf), count, off);
+	rc = opal_read_nvram((unsigned long)buf, count, off);
 	if (rc != OPAL_SUCCESS)
 		return -EIO;
 	*index += count;
@@ -56,7 +56,7 @@ static ssize_t opal_nvram_write(char *buf, size_t count, loff_t *index)
 		count = nvram_size - off;
 
 	while (rc == OPAL_BUSY || rc == OPAL_BUSY_EVENT) {
-		rc = opal_write_nvram(__pa(buf), count, off);
+		rc = opal_write_nvram((unsigned long)buf, count, off);
 		if (rc == OPAL_BUSY_EVENT) {
 			if (in_interrupt() || irqs_disabled())
 				mdelay(OPAL_BUSY_DELAY_MS);
diff --git a/arch/powerpc/platforms/powernv/opal-powercap.c b/arch/powerpc/platforms/powernv/opal-powercap.c
index c16d44f6f1d1..a1167ecf9e43 100644
--- a/arch/powerpc/platforms/powernv/opal-powercap.c
+++ b/arch/powerpc/platforms/powernv/opal-powercap.c
@@ -46,7 +46,7 @@ static ssize_t powercap_show(struct kobject *kobj, struct kobj_attribute *attr,
 	if (ret)
 		goto out_token;
 
-	ret = opal_get_powercap(pcap_attr->handle, token, (u32 *)__pa(&pcap));
+	ret = opal_get_powercap(pcap_attr->handle, token, &pcap);
 	switch (ret) {
 	case OPAL_ASYNC_COMPLETION:
 		ret = opal_async_wait_response(token, &msg);
diff --git a/arch/powerpc/platforms/powernv/opal-psr.c b/arch/powerpc/platforms/powernv/opal-psr.c
index 69d7e75950d1..a3a68f53b1f8 100644
--- a/arch/powerpc/platforms/powernv/opal-psr.c
+++ b/arch/powerpc/platforms/powernv/opal-psr.c
@@ -40,7 +40,7 @@ static ssize_t psr_show(struct kobject *kobj, struct kobj_attribute *attr,
 		goto out_token;
 
 	ret = opal_get_power_shift_ratio(psr_attr->handle, token,
-					    (u32 *)__pa(&psr));
+					    (u32 *)&psr);
 	switch (ret) {
 	case OPAL_ASYNC_COMPLETION:
 		ret = opal_async_wait_response(token, &msg);
diff --git a/arch/powerpc/platforms/powernv/opal-xscom.c b/arch/powerpc/platforms/powernv/opal-xscom.c
index fd510d961b8c..aef596997ad4 100644
--- a/arch/powerpc/platforms/powernv/opal-xscom.c
+++ b/arch/powerpc/platforms/powernv/opal-xscom.c
@@ -58,7 +58,7 @@ static int opal_scom_read(uint32_t chip, uint64_t addr, u64 reg, u64 *value)
 	__be64 v;
 
 	reg = opal_scom_unmangle(addr + reg);
-	rc = opal_xscom_read(chip, reg, (__be64 *)__pa(&v));
+	rc = opal_xscom_read(chip, reg, &v);
 	if (rc) {
 		*value = 0xfffffffffffffffful;
 		return -EIO;
diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index e8eba210a92d..a0e9808237b2 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -397,7 +397,7 @@ static void opal_handle_message(void)
 	s64 ret;
 	u32 type;
 
-	ret = opal_get_msg(__pa(opal_msg), opal_msg_size);
+	ret = opal_get_msg((u64)opal_msg, opal_msg_size);
 	/* No opal message pending. */
 	if (ret == OPAL_RESOURCE)
 		return;
@@ -961,7 +961,7 @@ static void __init opal_dump_region_init(void)
 		return;
 
 	rc = opal_register_dump_region(OPAL_DUMP_REGION_LOG_BUF,
-				       __pa(addr), size);
+				       (u64)addr, size);
 	/* Don't warn if this is just an older OPAL that doesn't
 	 * know about that call
 	 */
@@ -1197,7 +1197,7 @@ struct opal_sg_list *opal_vmalloc_to_sg_list(void *vmalloc_addr,
 			sg->length = cpu_to_be64(
 					i * sizeof(struct opal_sg_entry) + 16);
 			i = 0;
-			sg->next = cpu_to_be64(__pa(next));
+			sg->next = cpu_to_be64(next);
 			sg = next;
 		}
 
diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index 57d3a6af1d52..dc6caec7cb46 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1844,7 +1844,7 @@ static int pnv_pci_ioda_dma_64bit_bypass(struct pnv_ioda_pe *pe)
 					/* reconfigure window 0 */
 					(pe->pe_number << 1) + 0,
 					1,
-					__pa(tces),
+					__pa(tces), /* XXX? */
 					table_size,
 					1 << tce_order);
 	if (rc == OPAL_SUCCESS) {
diff --git a/arch/powerpc/sysdev/xive/native.c b/arch/powerpc/sysdev/xive/native.c
index 5218fdc4b29a..a80960829bf0 100644
--- a/arch/powerpc/sysdev/xive/native.c
+++ b/arch/powerpc/sysdev/xive/native.c
@@ -647,7 +647,7 @@ static bool xive_native_provision_pages(void)
 			pr_err("Failed to allocate provisioning page\n");
 			return false;
 		}
-		opal_xive_donate_page(chip, __pa(p));
+		opal_xive_donate_page(chip, (u64)p);
 	}
 	return true;
 }
diff --git a/drivers/char/powernv-op-panel.c b/drivers/char/powernv-op-panel.c
index 027484ecfb0d..e7569f5025ef 100644
--- a/drivers/char/powernv-op-panel.c
+++ b/drivers/char/powernv-op-panel.c
@@ -175,8 +175,7 @@ static int oppanel_probe(struct platform_device *pdev)
 	memset(oppanel_data, ' ', oppanel_size);
 	for (i = 0; i < num_lines; i++) {
 		oppanel_lines[i].line_len = cpu_to_be64(line_len);
-		oppanel_lines[i].line = cpu_to_be64(__pa(&oppanel_data[i *
-						line_len]));
+		oppanel_lines[i].line = cpu_to_be64(&oppanel_data[i * line_len]);
 	}
 
 	rc = misc_register(&oppanel_dev);
diff --git a/drivers/i2c/busses/i2c-opal.c b/drivers/i2c/busses/i2c-opal.c
index 1c4c9bb06a0b..a2ea1e36d9aa 100644
--- a/drivers/i2c/busses/i2c-opal.c
+++ b/drivers/i2c/busses/i2c-opal.c
@@ -87,7 +87,7 @@ static int i2c_opal_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			OPAL_I2C_RAW_READ : OPAL_I2C_RAW_WRITE;
 		req.addr = cpu_to_be16(msgs[0].addr);
 		req.size = cpu_to_be32(msgs[0].len);
-		req.buffer_ra = cpu_to_be64(__pa(msgs[0].buf));
+		req.buffer_ra = cpu_to_be64(msgs[0].buf);
 		break;
 	case 2:
 		req.type = (msgs[1].flags & I2C_M_RD) ?
@@ -98,7 +98,7 @@ static int i2c_opal_master_xfer(struct i2c_adapter *adap, struct i2c_msg *msgs,
 			req.subaddr = (req.subaddr << 8) | msgs[0].buf[i];
 		req.subaddr = cpu_to_be32(req.subaddr);
 		req.size = cpu_to_be32(msgs[1].len);
-		req.buffer_ra = cpu_to_be64(__pa(msgs[1].buf));
+		req.buffer_ra = cpu_to_be64(msgs[1].buf);
 		break;
 	}
 
@@ -123,7 +123,7 @@ static int i2c_opal_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 	req.addr = cpu_to_be16(addr);
 	switch (size) {
 	case I2C_SMBUS_BYTE:
-		req.buffer_ra = cpu_to_be64(__pa(&data->byte));
+		req.buffer_ra = cpu_to_be64(&data->byte);
 		req.size = cpu_to_be32(1);
 		/* Fall through */
 	case I2C_SMBUS_QUICK:
@@ -131,7 +131,7 @@ static int i2c_opal_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 			OPAL_I2C_RAW_READ : OPAL_I2C_RAW_WRITE;
 		break;
 	case I2C_SMBUS_BYTE_DATA:
-		req.buffer_ra = cpu_to_be64(__pa(&data->byte));
+		req.buffer_ra = cpu_to_be64(&data->byte);
 		req.size = cpu_to_be32(1);
 		req.subaddr = cpu_to_be32(command);
 		req.subaddr_sz = 1;
@@ -143,7 +143,7 @@ static int i2c_opal_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 			local[0] = data->word & 0xff;
 			local[1] = (data->word >> 8) & 0xff;
 		}
-		req.buffer_ra = cpu_to_be64(__pa(local));
+		req.buffer_ra = cpu_to_be64(local);
 		req.size = cpu_to_be32(2);
 		req.subaddr = cpu_to_be32(command);
 		req.subaddr_sz = 1;
@@ -151,7 +151,7 @@ static int i2c_opal_smbus_xfer(struct i2c_adapter *adap, u16 addr,
 			OPAL_I2C_SM_READ : OPAL_I2C_SM_WRITE;
 		break;
 	case I2C_SMBUS_I2C_BLOCK_DATA:
-		req.buffer_ra = cpu_to_be64(__pa(&data->block[1]));
+		req.buffer_ra = cpu_to_be64(&data->block[1]);
 		req.size = cpu_to_be32(data->block[0]);
 		req.subaddr = cpu_to_be32(command);
 		req.subaddr_sz = 1;
diff --git a/drivers/mtd/devices/powernv_flash.c b/drivers/mtd/devices/powernv_flash.c
index 0b757d9ba2f6..86dbaae8808f 100644
--- a/drivers/mtd/devices/powernv_flash.c
+++ b/drivers/mtd/devices/powernv_flash.c
@@ -66,10 +66,10 @@ static int powernv_flash_async_op(struct mtd_info *mtd, enum flash_op op,
 
 	switch (op) {
 	case FLASH_OP_READ:
-		rc = opal_flash_read(info->id, offset, __pa(buf), len, token);
+		rc = opal_flash_read(info->id, offset, (u64)buf, len, token);
 		break;
 	case FLASH_OP_WRITE:
-		rc = opal_flash_write(info->id, offset, __pa(buf), len, token);
+		rc = opal_flash_write(info->id, offset, (u64)buf, len, token);
 		break;
 	case FLASH_OP_ERASE:
 		rc = opal_flash_erase(info->id, offset, len, token);
-- 
2.23.0

