Return-Path: <linuxppc-dev+bounces-10717-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33FF8B1D72D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Aug 2025 14:02:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4byQl65CRNz2xcG;
	Thu,  7 Aug 2025 22:02:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754568146;
	cv=none; b=RdIbfuI78Z1B0Vv4dHfPNVJr5LzwSYMOCvUwQ3yiFzoM68hqt183qZFkzDYjX0DK0/oLbi2ebU259DR9n5NvniQj52WlV+NyRbiREMJDxAeJ3FCI2yHNZqR+1PU3efjdc5Q+M2kdcLH+nkfadawamG+T0w9Id0vLPGPh5vN5AIorVwJuOjTLI9NInRPW4pU6gbhxhjEqorzHTDdcqaGdbQaqQBvKfgkG0kTfCyMtfUc55AdzAv41RzNLkx2O0MQcKEniVQJ1Y+3baAd9Fp++hd9g2OFRzQiTywhtrIMmm20BT3COgVJfqK9xOnCNwM830Ov5bbtP9ezUDlNWcsvV+A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754568146; c=relaxed/relaxed;
	bh=TcEqD2Pp6Z225d6tl17GjpdF9VhMMcRo1GStFJJS27w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=l9rsbJwpaFwdiHo7tOtbS3vsfJzhqOcwLpSAulZlxcBhQPI/5+EMGVOz55LHUlHhLNLayZYZhNQs4QhSKfQZ2WURUq5hw0W1jtp+W2XzPCAMFUJ5PM/gQcdnepxmKMrenBhnByCrNLIlrGO0C16b4zDiwuryI1fP0+30NKbDxEvZiYJsRcmLXCjJspBrXEK6xMkfIe2QdsLxHUoMr5bjM/HF4OgC3Vr8eQWrpfCdam3uNHIabcYpEmAZQaguTCKlRidH2vg4QwJ0mfhGBHseJ42D1RXpdDDvOlUYI118xQdMpx+o/8CCPK4LtGEw6WnDSc5cC20nDB0XmcTSuzpbwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.49; helo=mail-ej1-f49.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.49; helo=mail-ej1-f49.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4byQl54TTWz2xcD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Aug 2025 22:02:25 +1000 (AEST)
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-af93381a1d2so147235766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 07 Aug 2025 05:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754568141; x=1755172941;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TcEqD2Pp6Z225d6tl17GjpdF9VhMMcRo1GStFJJS27w=;
        b=i8f+eH6FwpNWKtsTQaxSpWsUI/Y2xLhR/KcaSmbvzT7BD88Qm9MGjq4/dQRJ+XP7Yb
         bpUtfcnPaZn006bhcM3V4C05dEWzIXkMOHvwHEqaSNeseLL22KXkRj51MNd0w+VxDyNz
         kev4k7CUlaeHbByY2PO6jXG8+gmnEuWgLdUwNkyYMF9S7WTHDL2aNcK+3mZUQRKT1ZXL
         UyfNj1e9sCHx48omJ8FbJs9+B9Q2TAf/E01mJxd5kScnrsITdegRD+20km7qDE603gk+
         CQDq5kxej0ze7wQw+3QzEMTKCmubdAcHowB0Ag8/3HDqiZPVh92/OYMW8CcmINJ+VdXe
         NxgA==
X-Forwarded-Encrypted: i=1; AJvYcCXbgIL5HSeZQPWM1bzZxRZeBsj87HhVREkouSh0nKFvHZb3ULxmbBAXYsoHb8QNrzec8dPgXHwhN1c+aXM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YykFpnKji+rNJOAsLVuflwYEiYYc2EtoxUj/yssShOGjflDx7Xo
	+1bsg9rLc3/COvZXGiaKIqunZOlalo5GvWPv4Bfk1B43qC8/1ykNrxMW
X-Gm-Gg: ASbGncuP1C14cioUKf5ImZHMprA+IZ0I7Cit04Wx4FzzwsyCw1uR6XxMAf47hPG88kB
	a8EqW95Q+Lt9ZL6sH4bQWADyRz+znZND3X/0/viJhaLPlyov6hEcW+sSlr8NRvdjrv0yRbFBbNA
	v8GtMrNCp24EsW8qbUMP13+0vsHV8/3L3Mu0w2HRgN5MAy/I3Jiihguy18WtHh3VUyQYIUccryW
	2T1mhiChQWRc0kr1gLEVbqAFxaTyUvrtg8K9dGrmQbieS8CELv3lcINDqOXn2O6NAleqv8DBIbG
	XcGdy8K56ylqNKDm7+v9zkAA/SypeanAAUVTUvtZuwYA9Q5CZZjkiJ+wttLbs0O7Vm23rKIB4rH
	Bgsywlu8YEoNcRpNZdRwWg7E=
X-Google-Smtp-Source: AGHT+IGa1I/ilvIOBCvInSAxZfDpaVsMb4OkBgAFcX5LwdXi64LWkAcj3+hpGQebA5QV/8oJSjfE7g==
X-Received: by 2002:a17:907:3d93:b0:af5:a834:c327 with SMTP id a640c23a62f3a-af99031cd5fmr577553966b.21.1754568140812;
        Thu, 07 Aug 2025 05:02:20 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:9::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a219ef2sm1295120066b.96.2025.08.07.05.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 05:02:20 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Thu, 07 Aug 2025 05:02:11 -0700
Subject: [PATCH v5] vmcoreinfo: Track and log recoverable hardware errors
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250807-vmcore_hw_error-v5-1-0df35396e4b2@debian.org>
X-B4-Tracking: v=1; b=H4sIAMKVlGgC/23PzWrDMAzA8VcxOsfDkr+ynPYeYxTHkRsflgxnp
 B0l7z5SNpbhXgX6/aUbLFwyL9CJGxRe85LnCTphGwFxDNOZZR6gE0CKrPLKy/U9zoVP4+XEpcx
 FaiJDz+yiRgeNgI/CKV/v4utbI2DMy+dcvu6BFffpj4WmslaUKNuYjOWhd1qbl4H7HKanuZxhx
 1Y6Aq4GSKJM2PrkB0ehD0eg+f2C8PFi6J0Nrjc62lCV9aFMVAN6LyflWp0iJvQVYP6AVj24wOx
 AwMRu/77V/4Bt274Bb1xdTasBAAA=
X-Change-ID: 20250707-vmcore_hw_error-322429e6c316
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, 
 Borislav Petkov <bp@alien8.de>, Robert Moore <robert.moore@intel.com>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 acpica-devel@lists.linux.dev, osandov@osandov.com, 
 xueshuai@linux.alibaba.com, konrad.wilk@oracle.com, 
 linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-pci@vger.kernel.org, kernel-team@meta.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=11826; i=leitao@debian.org;
 h=from:subject:message-id; bh=WmmLTqk2OgTgbcaK+tbH9f2X98OF6Jw7cAoJOaXSLIE=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBolJXLLipo1TDCKVywDcpai5J+PL9QnUPwrqKfW
 P8sDVDZTvKJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaJSVywAKCRA1o5Of/Hh3
 bSrHD/95S6d363l5YVcJC+RC5CaiPry+uBeGaRYCZ46OUPPhWLlCd14I+s8M3tyZau7hg+Ng47C
 0+jMJjzWQhYrPrWiVshbf2JA8oxwx6ZImBx3VPaYlKWNUz1k+GyH468Rj+3juO+KeERQIT4HDoU
 DapphCHFmO0joirLNNEAAA5vfLN2vChY4CXyAGFrZq3ONzyPRowry0Tv93UcRlfvVhwrNMGeipT
 ymVpDgfkdfvApspenJjvsPanUC1a9QWB0LLaTqDaNVwML/MmLVyaxlGTZIW5jP5jhAM9RBN3x9q
 r6LivoXpbAQBIJScHrrMgPz1FcuvcdvyQcBfd/L8GnHZs8uPpemmOF8+yBkPJSpAuJSQuirMrnG
 Yxco9PV5o3LOmBfRT5giYRqr4AzsEuTg5rhARhS/v8uAa360I7NmmYlkvP5jE5zykGpY+k5ofDe
 MOv61/NfOHSIbbNrnxJcvFsOpZj/dmQ25ipxsJ5i1OG29W9X8M2Re+HfNK3R+cya5UdLp0G0p+Q
 3DrciRehC6/8tnIZ1PNSlZ4bpUTYOeS3q6qDq+BHYkh1urV4NCEcIJDi/5oKZzakvPUeEJO4pQZ
 ST6OsrwjYBE0gFGwQPmoBmfBe8aP7eI8/EENCYjviC1ZmKtFYyqxHE3pgIsZVl8q5irbq0PKhqx
 Q5K1jD22+WLzL6w==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Introduce a generic infrastructure for tracking recoverable hardware
errors (HW errors that are visible to the OS but does not cause a panic)
and record them for vmcore consumption. This aids post-mortem crash
analysis tools by preserving a count and timestamp for the last
occurrence of such errors. On the other side, correctable errors, which
the OS typically remains unaware of because the underlying hardware
handles them transparently, are less relevant for crash dump
and therefore are NOT tracked in this infrastructure.

Add centralized logging for sources of recoverable hardware
errors based on the subsystem it has been notified.

hwerror_data is write-only at kernel runtime, and it is meant to be read
from vmcore using tools like crash/drgn. For example, this is how it
looks like when opening the crashdump from drgn.

	>>> prog['hwerror_data']
	(struct hwerror_info[1]){
		{
			.count = (int)844,
			.timestamp = (time64_t)1752852018,
		},
		...

This helps fleet operators quickly triage whether a crash may be
influenced by hardware recoverable errors (which executes a uncommon
code path in the kernel), especially when recoverable errors occurred
shortly before a panic, such as the bug fixed by
commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them
when destroying the pool")

This is not intended to replace full hardware diagnostics but provides
a fast way to correlate hardware events with kernel panics quickly.

Rare machine check exceptions—like those indicated by mce_flags.p5 or
mce_flags.winchip—are not accounted for in this method, as they fall
outside the intended usage scope for this feature’s user base.

Suggested-by: Tony Luck <tony.luck@intel.com>
Suggested-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
Changes in v5:
- Move the headers to uapi file (Dave Hansen)
- Use atomic operations in the tracking struct (Dave Hansen)
- Drop the MCE enum type, and track MCE errors as "others"
- Document this feature better
- Link to v4: https://lore.kernel.org/r/20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org

Changes in v4:
- Split the error by hardware subsystem instead of kernel
  subsystem/driver (Shuai)
- Do not count the corrected errors, only focusing on recoverable errors (Shuai)
- Link to v3: https://lore.kernel.org/r/20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org

Changes in v3:
- Add more information about this feature in the commit message
  (Borislav Petkov)
- Renamed the function to hwerr_log_error_type() and use hwerr as
  suffix (Borislav Petkov)
- Make the empty function static inline (kernel test robot)
- Link to v2: https://lore.kernel.org/r/20250721-vmcore_hw_error-v2-1-ab65a6b43c5a@debian.org

Changes in v2:
- Split the counter by recoverable error (Tony Luck)
- Link to v1: https://lore.kernel.org/r/20250714-vmcore_hw_error-v1-1-8cf45edb6334@debian.org
---
 Documentation/driver-api/hw-recoverable-errors.rst | 60 ++++++++++++++++++++++
 arch/x86/kernel/cpu/mce/core.c                     |  4 ++
 drivers/acpi/apei/ghes.c                           | 36 +++++++++++++
 drivers/pci/pcie/aer.c                             |  2 +
 include/linux/vmcore_info.h                        |  8 +++
 include/uapi/linux/vmcore.h                        |  9 ++++
 kernel/vmcore_info.c                               | 17 ++++++
 7 files changed, 136 insertions(+)

diff --git a/Documentation/driver-api/hw-recoverable-errors.rst b/Documentation/driver-api/hw-recoverable-errors.rst
new file mode 100644
index 0000000000000..fc526c3454bd7
--- /dev/null
+++ b/Documentation/driver-api/hw-recoverable-errors.rst
@@ -0,0 +1,60 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+=================================================
+Recoverable Hardware Error Tracking in vmcoreinfo
+=================================================
+
+Overview
+--------
+
+This feature provides a generic infrastructure within the Linux kernel to track
+and log recoverable hardware errors. These are hardware recoverable errors
+visible that might not cause immediate panics but may influence health, mainly
+because new code path will be executed in the kernel.
+
+By recording counts and timestamps of recoverable errors into the vmcoreinfo
+crash dump notes, this infrastructure aids post-mortem crash analysis tools in
+correlating hardware events with kernel failures. This enables faster triage
+and better understanding of root causes, especially in large-scale cloud
+environments where hardware issues are common.
+
+Benefits
+--------
+
+- Facilitates correlation of hardware recoverable errors with kernel panics or
+  unusual code paths that lead to system crashes.
+- Provides operators and cloud providers quick insights, improving reliability
+  and reducing troubleshooting time.
+- Complements existing full hardware diagnostics without replacing them.
+
+Data Exposure and Consumption
+-----------------------------
+
+- The tracked error data consists of per-error-type counts and timestamps of
+  last occurrence.
+- This data is stored in the `hwerror_data` array, categorized by error source
+  types like CPU, memory, PCI, CXL, and others.
+- It is exposed via vmcoreinfo crash dump notes and can be read using tools
+  like `crash`, `drgn`, or other kernel crash analysis utilities.
+- There is no other way to read these data other than from crash dumps.
+- These errors are divided by area, which includes CPU, Memory, PCI, CXL and
+  others.
+
+Typical usage example (in drgn REPL):
+
+.. code-block:: python
+
+    >>> prog['hwerror_data']
+    (struct hwerror_info[HWERR_RECOV_MAX]){
+        {
+            .count = (int)844,
+            .timestamp = (time64_t)1752852018,
+        },
+        ...
+    }
+
+Enabling
+--------
+
+- This feature is enabled when CONFIG_VMCORE_INFO is set.
+
diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 4da4eab56c81d..9cc38c5ffb77a 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -45,6 +45,7 @@
 #include <linux/task_work.h>
 #include <linux/hardirq.h>
 #include <linux/kexec.h>
+#include <linux/vmcore_info.h>
 
 #include <asm/fred.h>
 #include <asm/cpu_device_id.h>
@@ -1690,6 +1691,9 @@ noinstr void do_machine_check(struct pt_regs *regs)
 	}
 
 out:
+	/* Given it didn't panic, mark it as recoverable */
+	hwerr_log_error_type(HWERR_RECOV_OTHERS);
+
 	instrumentation_end();
 
 clear:
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index a0d54993edb3b..562459e9d632e 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -43,6 +43,7 @@
 #include <linux/uuid.h>
 #include <linux/ras.h>
 #include <linux/task_work.h>
+#include <linux/vmcore_info.h>
 
 #include <acpi/actbl1.h>
 #include <acpi/ghes.h>
@@ -867,6 +868,40 @@ int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd)
 }
 EXPORT_SYMBOL_NS_GPL(cxl_cper_kfifo_get, "CXL");
 
+static void ghes_log_hwerr(int sev, guid_t *sec_type)
+{
+	if (sev != CPER_SEV_RECOVERABLE)
+		return;
+
+	if (guid_equal(sec_type, &CPER_SEC_PROC_ARM) ||
+	    guid_equal(sec_type, &CPER_SEC_PROC_GENERIC) ||
+	    guid_equal(sec_type, &CPER_SEC_PROC_IA)) {
+		hwerr_log_error_type(HWERR_RECOV_CPU);
+		return;
+	}
+
+	if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR) ||
+	    guid_equal(sec_type, &CPER_SEC_CXL_GEN_MEDIA_GUID) ||
+	    guid_equal(sec_type, &CPER_SEC_CXL_DRAM_GUID) ||
+	    guid_equal(sec_type, &CPER_SEC_CXL_MEM_MODULE_GUID)) {
+		hwerr_log_error_type(HWERR_RECOV_CXL);
+		return;
+	}
+
+	if (guid_equal(sec_type, &CPER_SEC_PCIE) ||
+	    guid_equal(sec_type, &CPER_SEC_PCI_X_BUS)) {
+		hwerr_log_error_type(HWERR_RECOV_PCI);
+		return;
+	}
+
+	if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM)) {
+		hwerr_log_error_type(HWERR_RECOV_MEMORY);
+		return;
+	}
+
+	hwerr_log_error_type(HWERR_RECOV_OTHERS);
+}
+
 static void ghes_do_proc(struct ghes *ghes,
 			 const struct acpi_hest_generic_status *estatus)
 {
@@ -888,6 +923,7 @@ static void ghes_do_proc(struct ghes *ghes,
 		if (gdata->validation_bits & CPER_SEC_VALID_FRU_TEXT)
 			fru_text = gdata->fru_text;
 
+		ghes_log_hwerr(sev, sec_type);
 		if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM)) {
 			struct cper_sec_mem_err *mem_err = acpi_hest_get_payload(gdata);
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e286c197d7167..d814c06cdbee6 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -30,6 +30,7 @@
 #include <linux/kfifo.h>
 #include <linux/ratelimit.h>
 #include <linux/slab.h>
+#include <linux/vmcore_info.h>
 #include <acpi/apei.h>
 #include <acpi/ghes.h>
 #include <ras/ras_event.h>
@@ -751,6 +752,7 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 		break;
 	case AER_NONFATAL:
 		aer_info->dev_total_nonfatal_errs++;
+		hwerr_log_error_type(HWERR_RECOV_PCI);
 		counter = &aer_info->dev_nonfatal_errs[0];
 		max = AER_MAX_TYPEOF_UNCOR_ERRS;
 		break;
diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
index 37e003ae52626..e71518caacdfc 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -5,6 +5,7 @@
 #include <linux/linkage.h>
 #include <linux/elfcore.h>
 #include <linux/elf.h>
+#include <uapi/linux/vmcore.h>
 
 #define CRASH_CORE_NOTE_HEAD_BYTES ALIGN(sizeof(struct elf_note), 4)
 #define CRASH_CORE_NOTE_NAME_BYTES ALIGN(sizeof(NN_PRSTATUS), 4)
@@ -77,4 +78,11 @@ extern u32 *vmcoreinfo_note;
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len);
 void final_note(Elf_Word *buf);
+
+#ifdef CONFIG_VMCORE_INFO
+void hwerr_log_error_type(enum hwerr_error_type src);
+#else
+static inline void hwerr_log_error_type(enum hwerr_error_type src) {};
+#endif
+
 #endif /* LINUX_VMCORE_INFO_H */
diff --git a/include/uapi/linux/vmcore.h b/include/uapi/linux/vmcore.h
index 3e9da91866ffd..2ba89fafa518a 100644
--- a/include/uapi/linux/vmcore.h
+++ b/include/uapi/linux/vmcore.h
@@ -15,4 +15,13 @@ struct vmcoredd_header {
 	__u8 dump_name[VMCOREDD_MAX_NAME_BYTES]; /* Device dump's name */
 };
 
+enum hwerr_error_type {
+	HWERR_RECOV_CPU,
+	HWERR_RECOV_MEMORY,
+	HWERR_RECOV_PCI,
+	HWERR_RECOV_CXL,
+	HWERR_RECOV_OTHERS,
+	HWERR_RECOV_MAX,
+};
+
 #endif /* _UAPI_VMCORE_H */
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f89..fe9bf8db1922e 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -31,6 +31,13 @@ u32 *vmcoreinfo_note;
 /* trusted vmcoreinfo, e.g. we can make a copy in the crash memory */
 static unsigned char *vmcoreinfo_data_safecopy;
 
+struct hwerr_info {
+	atomic_t count;
+	time64_t timestamp;
+};
+
+static struct hwerr_info hwerr_data[HWERR_RECOV_MAX];
+
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len)
 {
@@ -118,6 +125,16 @@ phys_addr_t __weak paddr_vmcoreinfo_note(void)
 }
 EXPORT_SYMBOL(paddr_vmcoreinfo_note);
 
+void hwerr_log_error_type(enum hwerr_error_type src)
+{
+	if (src < 0 || src >= HWERR_RECOV_MAX)
+		return;
+
+	atomic_inc(&hwerr_data[src].count);
+	WRITE_ONCE(hwerr_data[src].timestamp, ktime_get_real_seconds());
+}
+EXPORT_SYMBOL_GPL(hwerr_log_error_type);
+
 static int __init crash_save_vmcoreinfo_init(void)
 {
 	vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);

---
base-commit: 54efec8782214652b331c50646013f8526570e8d
change-id: 20250707-vmcore_hw_error-322429e6c316

Best regards,
--  
Breno Leitao <leitao@debian.org>


