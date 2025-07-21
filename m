Return-Path: <linuxppc-dev+bounces-10336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 26224B0C104
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jul 2025 12:14:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4blx7k5nrzz2xKd;
	Mon, 21 Jul 2025 20:13:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.44
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753092834;
	cv=none; b=UODWn+Q0itq7jmrd3oMiAxyMPSMqzrhBBHz88it/jPPtGdPd5oIa4TbNbFItnAOvPwhAQ08X3FIV6tD/Y2y8S9/qp+YpV32ZrClJyc8NDADshT1PHYFV37K8o2WWRUR27a7lnTChELIX51ZBryb3R436aABqwxKQabAxd3dm9c9JmbhYF3NQVCFUifZvZLxYqs5JuHLCI4m3OLTxW/RRDpp5KvHxAWVbRXNq+YJnR8F6wHeiDklTlOa7HKFnA1u9ymiqO2LikvU0zllUeBbJP2K0ZhKwru2aT7b3c1Khz7v6aDXQmvSSm8F1W9yAf7fZrwJD3l2EnJd7JFbrh3Wn/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753092834; c=relaxed/relaxed;
	bh=ZuAcMhFgdlgq8bC6IAO8bRQcMyXQHBrJDpRfuyPWDRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gTkkr9MglnuKCmA0vOxkwUDAUEZXvfq/tSLGkakVKpBLfbbjBwSDnNt5SqL26PMHU0+XkNerMUHbNNygStZ0B81+5gYq1i06jGU0t7W1A52mEWalitlQiF8Pi2J68/RIoVutct/ETuQlC9xiHVXdHNvv/OOWisVJwgWKdptsy+nZONwBnELlnaCWwbXaJSLj9r2p5OnfmC+iHa8CnPBdmlRAvvbnYNjKMcnbbO+y8quIy6c2iUqzwzjszMP8wB2M3vzLk2kNtdqVbzaLaGEZUDP/zBzhWEkOV0ANjQ/ZDdPxwWqM396lrmawNh4zkWYEIsEySJLeBCn6hhp5ePE20w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.44; helo=mail-ed1-f44.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.44; helo=mail-ed1-f44.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4blx7j49g3z2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 20:13:52 +1000 (AEST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-612bc52ac2bso6569388a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jul 2025 03:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753092829; x=1753697629;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZuAcMhFgdlgq8bC6IAO8bRQcMyXQHBrJDpRfuyPWDRU=;
        b=fX48zirnHCOjBBEk1hD9qwPDZicm9VhRdiboOfCVrK9TPvIQvyKmmufKm2lYQEVXAF
         8wL5BA+b7GFsnukt4eyRPuFLDpjR7CTdF21DpMB08K2kiz1OUuOGpCrKd+9/GioOjPOU
         pdI+jMadQD7FcqjBYM4LEJvE980hhv+ROY7b19Te5rRVlo5dWGugx4t6M4EnJmZ9qQF8
         AMz07P98pB8Vx/wiUGonrtT8pUnU5FOCgvYokSySCxmAP9OdvztJahhEYVJbLsBbUiDE
         qJPzNAt3j1dpqTTYX74dUO8IaCQRSUP26zcNCwTaR4m0NNS6CayWzK45ZSFlaln3dE+H
         PwLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWzDeQvqixMGhqkyoQsfSvzQB7JPqpuCdfaozLTFRwdcYUIq1PTPa7QN7yizbFoHBa0lC4axiVh90u8IFQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzM4thfLFmDsblDI+het6GIIBf8dxDUPQQ5i1GULOr29jOUGuX/
	0rCH7Vnvba5Uhqg3p8GS5VgUrY1Ls/B9Wwt4jufcWP22IMCIuv1zTARM
X-Gm-Gg: ASbGncuKi3goab8msc5SFTqxO0NnfAS9F/ltxX8GFJQjDeuOqnnZknILIh1Eq08Asqy
	qn48eiql18VV7B1WGHzRSPmQteVH4nEvZYEWyLSYE5/J6EFffnOKtW9EVmjdt8ODjodMkQ9TF2s
	vagmdcHZfnxwSA6hfUCLHI70DT+pErEZLUDlu0WRXnRh0qnPzfn/e6qm0aRlKtNVodNG4SBFsev
	zRIMGhLGfqeJRS5DlZLmI8ld3fyLV9P/zH3ghHR7NMPgbm9Sjm4XSi2UK+2c0b1MJXvWX3qRdaQ
	x+ZTLEDRp1FOfxh4NxHQO3bdxJAQq/ythJhDIHqgRVzG+fiL1YVJKe34G07CbN8QzR/cP1LTCyd
	CnmYXv+zqwzhpyw==
X-Google-Smtp-Source: AGHT+IErUDyPlenXYLMWBxMmUQ3k7sVd3OKn3UyVnT+AN7vTNaLOpHhpwyQ3698aqKvdx6Wh4zcoiQ==
X-Received: by 2002:a05:6402:430f:b0:60c:44d6:281f with SMTP id 4fb4d7f45d1cf-6128590b4c6mr18720456a12.7.1753092828834;
        Mon, 21 Jul 2025 03:13:48 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-612c903fbd3sm5166297a12.36.2025.07.21.03.13.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 03:13:48 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Mon, 21 Jul 2025 03:13:40 -0700
Subject: [PATCH v2] vmcoreinfo: Track and log recoverable hardware errors
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
Content-Transfer-Encoding: 7bit
Message-Id: <20250721-vmcore_hw_error-v2-1-ab65a6b43c5a@debian.org>
X-B4-Tracking: v=1; b=H4sIANMSfmgC/2XNQQ6CMBBA0as0s6aGDqUoK+9hDCl0gC6kZmqqh
 nB3A3GhYfsX788QiT1FqMUMTMlHHyaoBWYCutFOA0nvoBaAOZZ5lVcy3brA1IzPhpgDywJR44l
 MVygDmYA7U+9fm3i5ZgJGHx+B39sgqbV+LaV3VlJSyWPX65Jca4pCnx213k6HwAOsWMJfwOwBl
 Er26lj1lTNoW/sHLMvyAZbEp/TwAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5825; i=leitao@debian.org;
 h=from:subject:message-id; bh=6CyXE+47ncMqeXYaeDUusWd/J6hfJn2bzzc1Sds7XhA=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBofhLbNzWKazOuUFUx05QoB1C3epNfFg5CF/9x+
 oZygBad+hCJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaH4S2wAKCRA1o5Of/Hh3
 bc9aD/oDPhT1z2GISr+hIhkxSHcTuTRBgx35NI6EAJI0ZbYF65j9RCs0qwdc0+G0PiHG79zHXFI
 Od7BC4cekjn3uug9Zq+hN9u0L22S6buufhDD2ItoB+79ES35ejaee2mNbANe1uZk14AGkI6/E2U
 /RMN2hXICTL9aD5hLrJjiMR/FmnkoeBUKl+0/Es601oVQab6NmzOdb9Jd+KD4WozH47rO6+kmPe
 Ic9J35aJ1b5GUkYxIzDIWy39GOU2B4vm7oIaMcziO+kCG8ZsvmMQDt2tJ1mmtpXrzIq2bu7R3dz
 Qixe9IzmG/gV9GPh9htXY6LtA8VIyQazqsFbCdHBvqShAuoxl+FR1cCxT66C/GNM0l7F/FFr53J
 uJ0PhAejWRQUXRMsQkeNg92rGCaUUfLzparmfHdPvSs1Jk63/1x+ZLxxDj20Dl0oJ8/PLBX5qhr
 YGtNfX56nSHipei04qxCgOCMEbUJ11r+YGba5l2787S6Re/NvKz8tZu5WruqFutfh0ZlBJPmYEx
 fMV4gx+X+drW4af3Sxmwr/ClBXTJzjlO+AO1z+v0ueBrgaYMztwFL0S7vijbjkWuJiDMC9Y9ZbC
 zOJUpdrfDyFbLPcyaNyxhqDzBXO+mP9NLwqfF0IOrvMAwymCWioG5VeUTaptEyl9+8HlqQUm+BN
 Em4D6y+Ne1Z983Q==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Introduce a generic infrastructure for tracking recoverable hardware
errors (HW errors that did not cause a panic) and record them for vmcore
consumption. This aids post-mortem crash analysis tools by preserving
a count and timestamp for the last occurrence of such errors.

This patch adds centralized logging for three common sources of
recoverable hardware errors:

  - PCIe AER Correctable errors
  - x86 Machine Check Exceptions (MCE)
  - APEI/CPER GHES corrected or recoverable errors

hwerror_tracking is write-only at kernel runtime, and it is meant to be
read from vmcore using tools like crash/drgn. For example, this is how
it looks like when opening the crashdump from drgn.

	>>> prog['hwerror_tracking']
	(struct hwerror_tracking_info [3]){
		{
			.count = (int)844,
			.timestamp = (time64_t)1752852018,
		},
		...

Suggested-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
Changes in v2:
- Split the counter by recoverable error (Tony Luck)
- Link to v1: https://lore.kernel.org/r/20250714-vmcore_hw_error-v1-1-8cf45edb6334@debian.org
---
 arch/x86/kernel/cpu/mce/core.c |  3 +++
 drivers/acpi/apei/ghes.c       |  8 ++++++--
 drivers/pci/pcie/aer.c         |  2 ++
 include/linux/vmcore_info.h    | 14 ++++++++++++++
 kernel/vmcore_info.c           | 18 ++++++++++++++++++
 5 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 4da4eab56c81d..781cf574642eb 100644
--- a/arch/x86/kernel/cpu/mce/core.c
+++ b/arch/x86/kernel/cpu/mce/core.c
@@ -45,6 +45,7 @@
 #include <linux/task_work.h>
 #include <linux/hardirq.h>
 #include <linux/kexec.h>
+#include <linux/vmcore_info.h>
 
 #include <asm/fred.h>
 #include <asm/cpu_device_id.h>
@@ -1692,6 +1693,8 @@ noinstr void do_machine_check(struct pt_regs *regs)
 out:
 	instrumentation_end();
 
+	/* Given it didn't panic, mark it as recoverable */
+	hwerror_tracking_log(HWE_RECOV_MCE);
 clear:
 	mce_wrmsrq(MSR_IA32_MCG_STATUS, 0);
 }
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index a0d54993edb3b..396cdffbe6a37 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -43,6 +43,7 @@
 #include <linux/uuid.h>
 #include <linux/ras.h>
 #include <linux/task_work.h>
+#include <linux/vmcore_info.h>
 
 #include <acpi/actbl1.h>
 #include <acpi/ghes.h>
@@ -1136,13 +1137,16 @@ static int ghes_proc(struct ghes *ghes)
 {
 	struct acpi_hest_generic_status *estatus = ghes->estatus;
 	u64 buf_paddr;
-	int rc;
+	int rc, sev;
 
 	rc = ghes_read_estatus(ghes, estatus, &buf_paddr, FIX_APEI_GHES_IRQ);
 	if (rc)
 		goto out;
 
-	if (ghes_severity(estatus->error_severity) >= GHES_SEV_PANIC)
+	sev = ghes_severity(estatus->error_severity);
+	if (sev == GHES_SEV_RECOVERABLE || sev ==  GHES_SEV_CORRECTED)
+		hwerror_tracking_log(HWE_RECOV_GHES);
+	else if (sev >= GHES_SEV_PANIC)
 		__ghes_panic(ghes, estatus, buf_paddr, FIX_APEI_GHES_IRQ);
 
 	if (!ghes_estatus_cached(estatus)) {
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e286c197d7167..064d220564b59 100644
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
@@ -746,6 +747,7 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
 	switch (info->severity) {
 	case AER_CORRECTABLE:
 		aer_info->dev_total_cor_errs++;
+		hwerror_tracking_log(HWE_RECOV_AER);
 		counter = &aer_info->dev_cor_errs[0];
 		max = AER_MAX_TYPEOF_COR_ERRS;
 		break;
diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
index 37e003ae52626..5894da92a6ba4 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -77,4 +77,18 @@ extern u32 *vmcoreinfo_note;
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len);
 void final_note(Elf_Word *buf);
+
+enum hwerror_tracking_source {
+	HWE_RECOV_AER,
+	HWE_RECOV_MCE,
+	HWE_RECOV_GHES,
+	HWE_RECOV_MAX,
+};
+
+#ifdef CONFIG_VMCORE_INFO
+void hwerror_tracking_log(enum hwerror_tracking_source src);
+#else
+void hwerror_tracking_log(enum hwerror_tracking_source src) {};
+#endif
+
 #endif /* LINUX_VMCORE_INFO_H */
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f89..23d7ddcd55cdd 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -31,6 +31,13 @@ u32 *vmcoreinfo_note;
 /* trusted vmcoreinfo, e.g. we can make a copy in the crash memory */
 static unsigned char *vmcoreinfo_data_safecopy;
 
+struct hwerror_tracking_info {
+	int __data_racy count;
+	time64_t __data_racy timestamp;
+};
+
+static struct hwerror_tracking_info hwerror_tracking[HWE_RECOV_MAX];
+
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len)
 {
@@ -118,6 +125,17 @@ phys_addr_t __weak paddr_vmcoreinfo_note(void)
 }
 EXPORT_SYMBOL(paddr_vmcoreinfo_note);
 
+void hwerror_tracking_log(enum hwerror_tracking_source src)
+{
+	if (src < 0 || src >= HWE_RECOV_MAX)
+		return;
+
+	/* No need to atomics/locks given the precision is not important */
+	hwerror_tracking[src].count++;
+	hwerror_tracking[src].timestamp = ktime_get_real_seconds();
+}
+EXPORT_SYMBOL_GPL(hwerror_tracking_log);
+
 static int __init crash_save_vmcoreinfo_init(void)
 {
 	vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);

---
base-commit: 97987520025658f30bb787a99ffbd9bbff9ffc9d
change-id: 20250707-vmcore_hw_error-322429e6c316

Best regards,
--  
Breno Leitao <leitao@debian.org>


