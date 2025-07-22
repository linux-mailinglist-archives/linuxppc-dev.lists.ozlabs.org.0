Return-Path: <linuxppc-dev+bounces-10360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5607CB0E238
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 18:57:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmk2J53Nfz2yb9;
	Wed, 23 Jul 2025 02:56:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753203416;
	cv=none; b=beA05I+STiWwIA5NPEiym3DRnyTFAxlCnlXobwrEYETumpfJeqI7sBCCWakJu6kxyxD0GCZ/fV4X4z3gUEhFFhxlwIercLCOLn3V7R8hNkhhxO13/wh9fDrxdyX+OdYfCeM9zgk78nzQCJy9/7g2GStxjIdc8ErBx3FC4yWtWofY6qaGD+/9eFvCZmGbfeQMtp4L0beikVnrWrzxZtvOcZ+5KvKKnvi9PUESm0tVX8SNZcLT49/hfs0DtnFlfmu3Brchb8w9U4fiWBcvDU9fJluBRl6KkZAqTcvZSbkFLXyIIhkeGMdFudlpGWg1pXz2nWnUXZrnW0UuaQVciq858Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753203416; c=relaxed/relaxed;
	bh=Y65MISs+ayKi1h/c+6Q6S5YM36LuH85b0lohq9HpFs4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LOMyXFQ+0fJo91VDS17aiFM83U76ahEqPzoipfrGzVVtzdkCvZcBFxGSqnr2s7dzf0AnbrNtCh1wHiJk0TpSkehxlvmKVJIXd8gQIRFRWJ+9kXALnkH5Fx3Z8sYxp0ReCCL5a9BIItuRBx6MsxW/iD8gdYN583ZKkBCfgeWIseNqt3p1A3q4grnFZC4vrds0cbtk4ofpn3OamOI0fAcUqRUf+IGXF0xq5e17qNuXxgzqjub/7ejCnvKfPhqv/MDQl+qsHgi7uiiPgjq1jMo24pnBPAzf92Yw0J02EoDcQa2sy5j73V3LOYjz6Jgx7px4YZSmRBocC1CecKuYdDjBZg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.45; helo=mail-ed1-f45.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.45; helo=mail-ed1-f45.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmk2H4rVqz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 02:56:54 +1000 (AEST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-612a338aed8so8709595a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jul 2025 09:56:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753203411; x=1753808211;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y65MISs+ayKi1h/c+6Q6S5YM36LuH85b0lohq9HpFs4=;
        b=vfULaoffs2r3GdKS003Oxc2yFCYbfmUU9B+55g1mE8c7i0kQOYhQgQmMZ+7fOCJ+y6
         QPbdOzo63AF1b23Pw8+ZL7vW5hS5iSlV7n6Pg6fPYP8+yNYmk391ConevL5LK0pdXmT2
         sGGd2VBdAkDQsQpvT1EENIdyZ7vCx8+LnYIT2Et+eGz1cBU/fM8/VWiaUtCP2DQwaIlp
         j3/qPsGOi6YtII78fiJWvfsArQ6qz1cpJAYqhnyFMOLPhRmgkkQFJU495a28YJett24W
         jRNhm/cmUWaSgCtvRStOPR5nPeVT+Odt1D9g92ppuybrAkl1vfATRza49H/Gk1py+wDh
         5cWw==
X-Forwarded-Encrypted: i=1; AJvYcCWFMmFnoW4VHAOtgwrrLGbmxQHUldatsw0LmlUOiDjpaWjOeFwwX5DXxsHctfoG2B+X+f4VoKQD8MUCaFM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdeZxWIzKttzL194EeFwEzo3fJ954ewqz4ord5f8ZrGxj4PlZD
	HqpjR54UrziFNRy1uphYSCatry9nuCqgGPPlH0ul77PzWa6Qea5Qwqoc
X-Gm-Gg: ASbGnctUSkXAOe6sjt3zKHpBDwx8/jKXzMHiVy5/zQC6fQR5/hcUpIqokIxp5/itoOD
	/3IYer33ykzTChhlvN5ltFbYKaM3fUOtWje3ANUPaQO59PqQcJQ7vPgyoyUuZirW6wAD0O6qsSA
	J4Pq2D2U6H3cCOiZsps5h/q+eO3tj/2pcRmOMcxgn3BLc3xpcQzpv/mO+2/cb0eFBLmLDg/g2vV
	8wAaU9z7uxdUDbV1GM8xS99vU6HZGHGX2kKE/ajRq7cgVXYciCAQ3kC7KaUXTXVqKiguTss/ycW
	sTeR4h98fV+YqYurZPTiqZxEDqLab3V0fE0FmMlzg0rYUt9VG6GNykOfrKKK66EnsXq3Gh3zdqF
	UJNm+aA0+DVN0xrG3hKieG28=
X-Google-Smtp-Source: AGHT+IH1AYyufkWnx6tJRuJWQqKT1LagkvCibf5kL4lR2YqMxA4GaifFCKYDzqx6UoyX8YSH9UzPZQ==
X-Received: by 2002:a17:907:a647:b0:ad8:a935:b8ff with SMTP id a640c23a62f3a-ae9ce094585mr2656153566b.31.1753203410260;
        Tue, 22 Jul 2025 09:56:50 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:7::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6c7d81e9sm891979866b.49.2025.07.22.09.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jul 2025 09:56:49 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Tue, 22 Jul 2025 09:56:37 -0700
Subject: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
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
Message-Id: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
X-B4-Tracking: v=1; b=H4sIAMTCf2gC/23PwQrCMBAE0F8Je26k2aSp9uR/iEiSbm0ONrKVq
 JT+u1QUFL0OzBtmgpE40giNmIApxzGmARqhCwGhd8ORZGyhEYAlVmVd1jKfQmI69NcDMSeWGtH
 ghmzQykIh4MzUxdtT3O0LAX0cL4nvz4GslvRlKfNjZSWVXIfOVNR6q7XZtuSjG1aJj7BgGT8B+
 wugVLJT67qrW4vOu0+geL9A9b/ovK2c9UaH6qu4n+f5AaB/gXMpAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6616; i=leitao@debian.org;
 h=from:subject:message-id; bh=mDC8389t2+JWUjueofRYUrCIHY6cXFw3h6b4pxyIR1A=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBof8LQP0mW5Apo3fJr4Kr3UWtr7a5fUV3ENzs3z
 bsR6oroctuJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaH/C0AAKCRA1o5Of/Hh3
 bfrmEACWV0Y2NzNaS+rMrKfK+UXuqYwjEo8CgQ+ePFSlXXZwP6FW3WTvwMh7PSTQdr7ywWj4Axk
 wwTbPaFU5BYeUK1aKZ8d3hkkuT7SD9ea4mOPr9rqK9h6yw+NkQbC/CuKVWHzuv8mpDZavcZ7b+V
 oK04g/W4hahVLe0TcmPc1npBK4Bk+cubix+NP7YG1TelB2vHAr44zCdlp732X+0sIZ7vSqg+IHV
 FSWEEMoU5x/aG75jE7VKxbfgpOBkqenHN7akQrh6MnD7eahJu2fY/q5HQOUmXPAv0oE9ZMOOjK6
 iYAkjaL8E3pGUksfwB4omeIzF/J5bnMwm3TMamhYbrx/5A3MCn0JBiTxkPpjw8OOE0ySRFEXX49
 2jbUXS+1tr9sx6TgQUKt729saRYUe5fJBuoYMA+b8OqebtNpV43EKQgA2q5pGqA/ak4R78MeDOT
 Bnq1CGyZ0oH1UqLbMxjrEQZVGUQbM8xhmluGo57IG5crD6XJjLNzjx5xloqE4Ohvj1SZ/mAnHYy
 DzJRuAiLhkYtcxVEombXzHMpYVO+7jflrN7vsn8ND67bODDLjUbd7V475HSx2pTxD+P4aLKnju3
 BgYljXOPgd5Pdi6NphcpJaC+OteLJxrk/F0hrvVL2Cql5+QkBy32qJ/+FSUul+BxYmqfjU9mbQu
 E0VQF/26shq/x+Q==
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

Add centralized logging for three common sources of recoverable hardware
errors:

  - PCIe AER Correctable errors
  - x86 Machine Check Exceptions (MCE)
  - APEI/CPER GHES corrected or recoverable errors

hwerror_data is write-only at kernel runtime, and it is meant to be
read from vmcore using tools like crash/drgn. For example, this is how
it looks like when opening the crashdump from drgn.

	>>> prog['hwerror_data']
	(struct hwerror_info[3]){
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

Suggested-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Breno Leitao <leitao@debian.org>
---
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
 arch/x86/kernel/cpu/mce/core.c |  3 +++
 drivers/acpi/apei/ghes.c       |  8 ++++++--
 drivers/pci/pcie/aer.c         |  2 ++
 include/linux/vmcore_info.h    | 14 ++++++++++++++
 kernel/vmcore_info.c           | 18 ++++++++++++++++++
 5 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 4da4eab56c81d..cb225a42eebbb 100644
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
+	hwerr_log_error_type(HWERR_RECOV_MCE);
 clear:
 	mce_wrmsrq(MSR_IA32_MCG_STATUS, 0);
 }
diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
index a0d54993edb3b..ebda2aa3d68f2 100644
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
+		hwerr_log_error_type(HWERR_RECOV_GHES);
+	else if (sev >= GHES_SEV_PANIC)
 		__ghes_panic(ghes, estatus, buf_paddr, FIX_APEI_GHES_IRQ);
 
 	if (!ghes_estatus_cached(estatus)) {
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index e286c197d7167..1ab744a3b7310 100644
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
+		hwerr_log_error_type(HWERR_RECOV_AER);
 		counter = &aer_info->dev_cor_errs[0];
 		max = AER_MAX_TYPEOF_COR_ERRS;
 		break;
diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
index 37e003ae52626..39afce28bfaac 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -77,4 +77,18 @@ extern u32 *vmcoreinfo_note;
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len);
 void final_note(Elf_Word *buf);
+
+enum hwerr_error_type {
+	HWERR_RECOV_AER,
+	HWERR_RECOV_MCE,
+	HWERR_RECOV_GHES,
+	HWERR_RECOV_MAX,
+};
+
+#ifdef CONFIG_VMCORE_INFO
+void hwerr_log_error_type(enum hwerr_error_type src);
+#else
+static inline void hwerr_log_error_type(enum hwerr_error_type src) {};
+#endif
+
 #endif /* LINUX_VMCORE_INFO_H */
diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
index e066d31d08f89..4b5ab45d468f5 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -31,6 +31,13 @@ u32 *vmcoreinfo_note;
 /* trusted vmcoreinfo, e.g. we can make a copy in the crash memory */
 static unsigned char *vmcoreinfo_data_safecopy;
 
+struct hwerr_info {
+	int __data_racy count;
+	time64_t __data_racy timestamp;
+};
+
+static struct hwerr_info hwerr_data[HWERR_RECOV_MAX];
+
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len)
 {
@@ -118,6 +125,17 @@ phys_addr_t __weak paddr_vmcoreinfo_note(void)
 }
 EXPORT_SYMBOL(paddr_vmcoreinfo_note);
 
+void hwerr_log_error_type(enum hwerr_error_type src)
+{
+	if (src < 0 || src >= HWERR_RECOV_MAX)
+		return;
+
+	/* No need to atomics/locks given the precision is not important */
+	hwerr_data[src].count++;
+	hwerr_data[src].timestamp = ktime_get_real_seconds();
+}
+EXPORT_SYMBOL_GPL(hwerr_log_error_type);
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


