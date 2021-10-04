Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 122724219E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 00:21:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNZvC6WCNz3clM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 09:21:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HjtLngcp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::629;
 helo=mail-pl1-x629.google.com; envelope-from=naveennaidu479@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HjtLngcp; dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNMdN1Ygvz2xth
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 00:54:00 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id j4so9680972plx.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 06:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BLwd+ei/6xpK2zg1bz0/dW3QBzh0TkkX9RDyyV7sGhM=;
 b=HjtLngcph5QhDGh7Z6aOwv4cpGknpQQa/Bhpn0NSTdUMUyWWk822K2kWdk1ZrqVyTV
 tnCzvMoQmHx0a65hTzUhySHsc7+lVDWgFVJ5VwqfJOX2Yv7ZvvVKLPeCAEw7rG9Burup
 ZTF/S31E7gbSZd501HCxtb0jZ6+QEZ1Uhjx3y0WVoWlj8eptMXGFWVqhJ0vQZKfh9Ais
 NCAlHdtjOmL6Ld1VLXYqWN+F6qvtuA6lUKC1TgRwZr+H86usLF+Wg5HUfe13m71II6Ck
 cA4wgl0KfMwaKaaT1gd9aukqNIOy4/jK0chXkTbw7zq40Z02ClKfmJOKPSm4Q7Pj+ZDj
 TwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BLwd+ei/6xpK2zg1bz0/dW3QBzh0TkkX9RDyyV7sGhM=;
 b=SeXBLTP4N/G5U6uaowN5z8as4xWaNnUlY6/wJtSAYe5OWypnZaormFqgQ3pLXS8zCY
 eK1N+VcSYfeRO7gZhLZ0PMnZig3FDRaOaCawo29IVkDppERMl3LWSh0R8wivFrKMuc0i
 d+UhAxkPL7f12FNzsGnvFnbcPMjmJ+8Aa7kyX3pzcjxiu2cd0Gi7m7MPUbx0XYVuG6n+
 S7t0lSl2jPkXkHmePfxOXZnaBy1s2hKNwbddyWXRdoVM95v7mRdAlyXoauhvXqYvJmCM
 2Y3nt0gWQ41ADPuv5xw+CYOCLyZHCb1XWeRtrPt2+0RRlblntKhotxNAAPARWVbHp2JL
 HhGg==
X-Gm-Message-State: AOAM533eS89Pse3xSqZ/J6Bz+N6Bs+NxI/2I4Qgm9rj79Vudya5roDBy
 CBTSDa3JgZj+fnkHRTU/SBY=
X-Google-Smtp-Source: ABdhPJzK1RB2KUeWH1uiEaaf5AAZlYo/nu9WrzwXEi2weLwxgyPHGzx/Jd2t667cgjdkiUfIxLp9hQ==
X-Received: by 2002:a17:90b:4d87:: with SMTP id
 oj7mr6256122pjb.107.1633355637751; 
 Mon, 04 Oct 2021 06:53:57 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:63:e8f0:c2a7:3579:5fe8:31d9])
 by smtp.gmail.com with ESMTPSA id
 k17sm12209548pfu.82.2021.10.04.06.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 06:53:57 -0700 (PDT)
From: Naveen Naidu <naveennaidu479@gmail.com>
To: bhelgaas@google.com,
	ruscur@russell.cc,
	oohall@gmail.com
Subject: [PATCH 6/8] PCI/AER: Clear error device AER registers in aer_irq()
Date: Mon,  4 Oct 2021 19:22:41 +0530
Message-Id: <74c7e46635aa32446fb569dbc20dfb6e7a772bcb.1633353468.git.naveennaidu479@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1633353468.git.naveennaidu479@gmail.com>
References: <cover.1633353468.git.naveennaidu479@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 05 Oct 2021 09:16:56 +1100
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
Cc: Naveen Naidu <naveennaidu479@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel-mentees@lists.linuxfoundation.org, linux-kernel@vger.kernel.org,
 skhan@linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Converge the APEI path and native AER path of clearing the AER registers
of the error device.

In APEI path, the system firmware clears the AER registers before
handing off the record to OS. But in "native AER" path, the execution
path of clearing the AER register is as follows:

  aer_isr_one_error
    aer_print_port_info
      if (find_source_device())
        aer_process_err_devices
          handle_error_source
            pci_write_config_dword(dev, PCI_ERR_COR_STATUS, ...)

The above path has a bug, if the find_source_device() fails, AER
registers are not cleared from the error device. This means, the error
device will keep reporting the error again and again and would lead
to message spew.

Related Bug Report:
  https://lore.kernel.org/linux-pci/20151229155822.GA17321@localhost/
  https://bugzilla.kernel.org/show_bug.cgi?id=109691
  https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1521173

The above bug could be avoided, if the AER registers are cleared during
the AER IRQ handler aer_irq(), which would provide guarantee that the AER
error registers are always cleared. This is similar to how APEI handles
these errors.

The main aim is that:

  When an interrupt handler deals with a interrupt, it must *always*
  clear the source of the interrupt.

Signed-off-by: Naveen Naidu <naveennaidu479@gmail.com>
---
 drivers/pci/pci.h      |  13 ++-
 drivers/pci/pcie/aer.c | 245 ++++++++++++++++++++++++++++-------------
 2 files changed, 182 insertions(+), 76 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 9be7a966fda7..eb88d8bfeaf7 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -424,7 +424,6 @@ static inline bool pci_dev_is_added(const struct pci_dev *dev)
 #define AER_MAX_MULTI_ERR_DEVICES	5	/* Not likely to have more */
 
 struct aer_err_info {
-	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
 	int error_dev_num;
 
 	u16	id;
@@ -440,6 +439,18 @@ struct aer_err_info {
 	struct aer_header_log_regs tlp;	/* TLP Header */
 };
 
+/* Preliminary AER error information processed from Root port */
+struct aer_devices_err_info {
+	struct pci_dev *dev[AER_MAX_MULTI_ERR_DEVICES];
+	struct aer_err_info err_info;
+};
+
+/* AER information associated with each error device */
+struct aer_dev_err_info {
+	struct pci_dev *dev;
+	struct aer_err_info err_info;
+};
+
 int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
 void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
 #endif	/* CONFIG_PCIEAER */
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 241ff361b43c..91f91d6ab052 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -36,6 +36,18 @@
 
 #define AER_ERROR_SOURCES_MAX		128
 
+/*
+ * There can be 128 maximum error sources (AER_ERROR_SOURCES_MAX) and each
+ * error source can have maximum of 5 error devices (AER_MAX_MULTI_ERR_DEVICES)
+ * so the maximum error devices we can report is:
+ *
+ * AER_ERROR_DEVICES_MAX = AER_ERROR_SOURCES_MAX * AER_MAX_MULTI_ERR_DEVICES == (128 * 5) == 640
+ *
+ * But since, the size in KFIFO should be a power of two, the closest value
+ * to 640 is 1024
+ */
+# define AER_ERROR_DEVICES_MAX		1024
+
 #define AER_MAX_TYPEOF_COR_ERRS		16	/* as per PCI_ERR_COR_STATUS */
 #define AER_MAX_TYPEOF_UNCOR_ERRS	27	/* as per PCI_ERR_UNCOR_STATUS*/
 
@@ -46,7 +58,7 @@ struct aer_err_source {
 
 struct aer_rpc {
 	struct pci_dev *rpd;		/* Root Port device */
-	DECLARE_KFIFO(aer_fifo, struct aer_err_source, AER_ERROR_SOURCES_MAX);
+	DECLARE_KFIFO(aer_fifo, struct aer_dev_err_info, AER_ERROR_DEVICES_MAX);
 };
 
 /* AER stats for the device */
@@ -806,11 +818,11 @@ void cper_print_aer(struct pci_dev *dev, int aer_severity,
  * @e_info: pointer to error info
  * @dev: pointer to pci_dev to be added
  */
-static int add_error_device(struct aer_err_info *e_info, struct pci_dev *dev)
+static int add_error_device(struct aer_devices_err_info *e_dev, struct pci_dev *dev)
 {
-	if (e_info->error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
-		e_info->dev[e_info->error_dev_num] = pci_dev_get(dev);
-		e_info->error_dev_num++;
+	if (e_dev->err_info.error_dev_num < AER_MAX_MULTI_ERR_DEVICES) {
+		e_dev->dev[e_dev->err_info.error_dev_num] = pci_dev_get(dev);
+		e_dev->err_info.error_dev_num++;
 		return 0;
 	}
 	return -ENOSPC;
@@ -877,18 +889,18 @@ static bool is_error_source(struct pci_dev *dev, struct aer_err_info *e_info)
 
 static int find_device_iter(struct pci_dev *dev, void *data)
 {
-	struct aer_err_info *e_info = (struct aer_err_info *)data;
+	struct aer_devices_err_info *e_dev = (struct aer_devices_err_info *)data;
 
-	if (is_error_source(dev, e_info)) {
+	if (is_error_source(dev, &e_dev->err_info)) {
 		/* List this device */
-		if (add_error_device(e_info, dev)) {
+		if (add_error_device(e_dev, dev)) {
 			/* We cannot handle more... Stop iteration */
 			/* TODO: Should print error message here? */
 			return 1;
 		}
 
 		/* If there is only a single error, stop iteration */
-		if (!e_info->multi_error_valid)
+		if (!e_dev->err_info.multi_error_valid)
 			return 1;
 	}
 	return 0;
@@ -907,26 +919,26 @@ static int find_device_iter(struct pci_dev *dev, void *data)
  * e_info->error_dev_num and e_info->dev[], based on the given information.
  */
 static bool find_source_device(struct pci_dev *parent,
-		struct aer_err_info *e_info)
+		struct aer_devices_err_info *e_dev)
 {
 	struct pci_dev *dev = parent;
 	int result;
 
 	/* Must reset in this function */
-	e_info->error_dev_num = 0;
+	e_dev->err_info.error_dev_num = 0;
 
 	/* Is Root Port an agent that sends error message? */
-	result = find_device_iter(dev, e_info);
+	result = find_device_iter(dev, e_dev);
 	if (result)
 		return true;
 
 	if (pci_pcie_type(parent) == PCI_EXP_TYPE_RC_EC)
-		pcie_walk_rcec(parent, find_device_iter, e_info);
+		pcie_walk_rcec(parent, find_device_iter, e_dev);
 	else
-		pci_walk_bus(parent->subordinate, find_device_iter, e_info);
+		pci_walk_bus(parent->subordinate, find_device_iter, e_dev);
 
-	if (!e_info->error_dev_num) {
-		pci_info(parent, "can't find device of ID%04x\n", e_info->id);
+	if (!e_dev->err_info.error_dev_num) {
+		pci_info(parent, "can't find device of ID%04x\n", e_dev->err_info.id);
 		return false;
 	}
 	return true;
@@ -940,24 +952,42 @@ static bool find_source_device(struct pci_dev *parent,
  * Invoked when an error being detected by Root Port.
  */
 static void handle_error_source(struct pci_dev *dev, struct aer_err_info *info)
+{
+	/*
+	 * Correctable error does not need software intervention.
+	 * No need to go through error recovery process.
+	 */
+	if (info->severity == AER_NONFATAL)
+		pcie_do_recovery(dev, pci_channel_io_normal, aer_root_reset);
+	else if (info->severity == AER_FATAL)
+		pcie_do_recovery(dev, pci_channel_io_frozen, aer_root_reset);
+	pci_dev_put(dev);
+}
+
+/**
+ * clear_error_source_aer_registers - clear AER registers of the error source device
+ * @dev: pointer to pci_dev data structure of error source device
+ * @info: comprehensive error information
+ *
+ * Invoked when an error being detected by Root Port but before we handle the
+ * error.
+ */
+static void clear_error_source_aer_registers(struct pci_dev *dev, struct aer_err_info info)
 {
 	int aer = dev->aer_cap;
 
-	if (info->severity == AER_CORRECTABLE) {
-		/*
-		 * Correctable error does not need software intervention.
-		 * No need to go through error recovery process.
-		 */
+	if (info.severity == AER_CORRECTABLE) {
 		if (aer)
 			pci_write_config_dword(dev, aer + PCI_ERR_COR_STATUS,
-					info->status);
+					info.status);
 		if (pcie_aer_is_native(dev))
 			pcie_clear_device_status(dev);
-	} else if (info->severity == AER_NONFATAL)
-		pcie_do_recovery(dev, pci_channel_io_normal, aer_root_reset);
-	else if (info->severity == AER_FATAL)
-		pcie_do_recovery(dev, pci_channel_io_frozen, aer_root_reset);
-	pci_dev_put(dev);
+	} else if (info.severity == AER_NONFATAL) {
+		pci_aer_clear_nonfatal_status(dev);
+	} else if (info.severity == AER_FATAL) {
+		pci_aer_clear_fatal_status(dev);
+	}
+
 }
 
 #ifdef CONFIG_ACPI_APEI_PCIEAER
@@ -1093,70 +1123,112 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
 	return 1;
 }
 
-static inline void aer_process_err_devices(struct aer_err_info *e_info)
-{
-	int i;
-
-	/* Report all before handle them, not to lost records by reset etc. */
-	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info->dev[i], e_info))
-			aer_print_error(e_info->dev[i], e_info);
-	}
-	for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
-		if (aer_get_device_error_info(e_info->dev[i], e_info))
-			handle_error_source(e_info->dev[i], e_info);
-	}
-}
-
 /**
- * aer_isr_one_error - consume an error detected by root port
- * @rpc: pointer to the root port which holds an error
+ * aer_find_corr_error_source_device - find the error source which detected the corrected error
+ * @rp: pointer to Root Port pci_dev data structure
  * @e_src: pointer to an error source
+ * @e_info: including detailed error information such like id
+ *
+ * Return true if found.
+ *
+ * Process the error information received at the Root Port, set these values
+ * in the aer_devices_err_info and find all the devices that are related to
+ * the error.
  */
-static void aer_isr_one_error(struct aer_rpc *rpc,
-		struct aer_err_source *e_src)
+static bool aer_find_corr_error_source_device(struct pci_dev *rp,
+					struct aer_err_source *e_src,
+					struct aer_devices_err_info *e_info)
 {
-	struct pci_dev *pdev = rpc->rpd;
-	struct aer_err_info e_info;
-
-	pci_rootport_aer_stats_incr(pdev, e_src);
-
-	/*
-	 * There is a possibility that both correctable error and
-	 * uncorrectable error being logged. Report correctable error first.
-	 */
 	if (e_src->status & PCI_ERR_ROOT_COR_RCV) {
-		e_info.id = ERR_COR_ID(e_src->id);
-		e_info.severity = AER_CORRECTABLE;
+		e_info->err_info.id = ERR_COR_ID(e_src->id);
+		e_info->err_info.severity = AER_CORRECTABLE;
 
 		if (e_src->status & PCI_ERR_ROOT_MULTI_COR_RCV)
-			e_info.multi_error_valid = 1;
+			e_info->err_info.multi_error_valid = 1;
 		else
-			e_info.multi_error_valid = 0;
-		aer_print_port_info(pdev, &e_info);
+			e_info->err_info.multi_error_valid = 0;
 
-		if (find_source_device(pdev, &e_info))
-			aer_process_err_devices(&e_info);
+		if (!find_source_device(rp, e_info))
+			return false;
 	}
+	return true;
+}
 
+/**
+ * aer_find_corr_error_source_device - find the error source which detected the uncorrected error
+ * @rp: pointer to Root Port pci_dev data structure
+ * @e_src: pointer to an error source
+ * @e_info: including detailed error information such like id
+ *
+ * Return true if found.
+ *
+ * Process the error information received at the Root Port, set these values
+ * in the aer_devices_err_info and find all the devices that are related to
+ * the error.
+ */
+static bool aer_find_uncorr_error_source_device(struct pci_dev *rp,
+					struct aer_err_source *e_src,
+					struct aer_devices_err_info *e_info)
+{
 	if (e_src->status & PCI_ERR_ROOT_UNCOR_RCV) {
-		e_info.id = ERR_UNCOR_ID(e_src->id);
+		e_info->err_info.id = ERR_UNCOR_ID(e_src->id);
 
 		if (e_src->status & PCI_ERR_ROOT_FATAL_RCV)
-			e_info.severity = AER_FATAL;
+			e_info->err_info.severity = AER_FATAL;
 		else
-			e_info.severity = AER_NONFATAL;
+			e_info->err_info.severity = AER_NONFATAL;
 
 		if (e_src->status & PCI_ERR_ROOT_MULTI_UNCOR_RCV)
-			e_info.multi_error_valid = 1;
+			e_info->err_info.multi_error_valid = 1;
 		else
-			e_info.multi_error_valid = 0;
+			e_info->err_info.multi_error_valid = 0;
+
+		if (!find_source_device(rp, e_info))
+			return false;
+	}
 
-		aer_print_port_info(pdev, &e_info);
+	return true;
+}
 
-		if (find_source_device(pdev, &e_info))
-			aer_process_err_devices(&e_info);
+/**
+ * aer_isr_one_error - consume an error detected by root port
+ * @rp: pointer to Root Port pci_dev data structure
+ * @e_dev: pointer to an error device
+ */
+static void aer_isr_one_error(struct pci_dev *rp, struct aer_dev_err_info *e_dev)
+{
+	aer_print_port_info(rp, &e_dev->err_info);
+	aer_print_error(e_dev->dev, &e_dev->err_info);
+	handle_error_source(e_dev->dev, &e_dev->err_info);
+}
+
+static bool aer_add_err_devices_to_queue(struct aer_rpc *rpc,
+		struct aer_devices_err_info *e_info)
+{
+	int i;
+	struct aer_dev_err_info *e_dev;
+
+	e_dev = kzalloc(sizeof(*e_dev), GFP_ATOMIC);
+	if (!e_dev)
+		return false;
+
+	for (i = 0; i < e_info->err_info.error_dev_num && e_info->dev[i]; i++) {
+		e_dev->err_info = e_info->err_info;
+		e_dev->dev = e_info->dev[i];
+
+		/*
+		 * Store the AER register information for each error device on
+		 * the queue
+		 */
+		if (aer_get_device_error_info(e_dev->dev, &e_dev->err_info)) {
+			if (!kfifo_put(&rpc->aer_fifo, *e_dev))
+				return false;
+
+			clear_error_source_aer_registers(e_dev->dev, e_dev->err_info);
+		}
 	}
+
+	return true;
 }
 
 /**
@@ -1170,13 +1242,13 @@ static irqreturn_t aer_isr(int irq, void *context)
 {
 	struct pcie_device *dev = (struct pcie_device *)context;
 	struct aer_rpc *rpc = get_service_data(dev);
-	struct aer_err_source e_src;
+	struct aer_dev_err_info e_dev;
 
 	if (kfifo_is_empty(&rpc->aer_fifo))
 		return IRQ_NONE;
 
-	while (kfifo_get(&rpc->aer_fifo, &e_src))
-		aer_isr_one_error(rpc, &e_src);
+	while (kfifo_get(&rpc->aer_fifo, &e_dev))
+		aer_isr_one_error(rpc->rpd, &e_dev);
 	return IRQ_HANDLED;
 }
 
@@ -1194,6 +1266,11 @@ static irqreturn_t aer_irq(int irq, void *context)
 	struct pci_dev *rp = rpc->rpd;
 	int aer = rp->aer_cap;
 	struct aer_err_source e_src = {};
+	struct aer_devices_err_info *e_info;
+
+	e_info = kzalloc(sizeof(*e_info), GFP_ATOMIC);
+	if (!e_info)
+		return IRQ_NONE;
 
 	pci_read_config_dword(rp, aer + PCI_ERR_ROOT_STATUS, &e_src.status);
 	if (!(e_src.status & (PCI_ERR_ROOT_UNCOR_RCV|PCI_ERR_ROOT_COR_RCV)))
@@ -1202,8 +1279,26 @@ static irqreturn_t aer_irq(int irq, void *context)
 	pci_read_config_dword(rp, aer + PCI_ERR_ROOT_ERR_SRC, &e_src.id);
 	pci_write_config_dword(rp, aer + PCI_ERR_ROOT_STATUS, e_src.status);
 
-	if (!kfifo_put(&rpc->aer_fifo, e_src))
-		return IRQ_HANDLED;
+	pci_rootport_aer_stats_incr(rp, &e_src);
+
+	/*
+	 * There is a possibility that both correctable error and
+	 * uncorrectable error are being logged. Find the devices which caused
+	 * correctable errors first so that they can be added to the queue first
+	 * and will be reported first.
+	 *
+	 * Before adding the error device to the queue to be handled, clear the
+	 * AER status registers.
+	 */
+	if (aer_find_corr_error_source_device(rp, &e_src, e_info)) {
+		if (!aer_add_err_devices_to_queue(rpc, e_info))
+			return IRQ_NONE;
+	}
+
+	if (aer_find_uncorr_error_source_device(rp, &e_src, e_info)) {
+		if (!aer_add_err_devices_to_queue(rpc, e_info))
+			return IRQ_NONE;
+	}
 
 	return IRQ_WAKE_THREAD;
 }
-- 
2.25.1

