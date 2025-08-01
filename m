Return-Path: <linuxppc-dev+bounces-10506-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6471B1823D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Aug 2025 15:15:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4btmfG5ktQz2yfL;
	Fri,  1 Aug 2025 23:15:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.53
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754054134;
	cv=none; b=aIm1YwOsP2nsp51d+B5DAZWJaQHEvymKI6gi376kMqjyLHK5u5uj/8EqAGFOsvU5hWcQP21/Nx/X8TDI5l3eS/3408uKp2+m4Y/w4Wyyg4FD7spqJnCAGdNaciIr0IYGFRA/jQZHORDZdBCehQ89wLCkiBy0b707dTHLxDTdZqyECT1ejXjerHlOU9rkMHKjQBlfbCSTVBZi3kGni0DOPa1uXOOg1oPGj5Jy3Az+V5PQ/RmfJ6A5JiJ6DJ/UL+lJzPwT/Sh1fwGkagrXeoUd41aweuq8b/Yt+v/33echrAI8K4AbvtoPnzyY76Eeb+7QlkXIK3AgTGOPKJtdS300tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754054134; c=relaxed/relaxed;
	bh=bPuL8T14V3X7lD1CGrwguzeqQdg4mYhlg7hqLHO0DYU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D18UlCngHXMiQJMFOTsIjeuooKSIRawGTsRuuiGcJno1zsIj3f6DVh7gvHQuj89hKOy+JOb5PDmCyF9ncfOmDw/4LnG7pjqrxyPgpoPnZQ/AoGxzhKkFk975lq+z0XKtI6e/vGheS8Etlab4u1UHZ4ZJy7wzgnc8Mu6LY5iYLQRctQ1GWtURjAlWE6w5wg+qL6Nr8J2vT6ijFrU0R6FkB78EOcWAXZnw13oIJjVeHwGehKFq2AyixO5ypqjlamiK7jvqq3ebV+UkblOKYXpGszwjD7YPvPjewytIY7hFs5cdGcfNNNKkGUvGsky8q/2zC+LrIWzRxafR0eY91+JTgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.208.53; helo=mail-ed1-f53.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.53; helo=mail-ed1-f53.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4btmfD5Y6yz2y2B
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Aug 2025 23:15:31 +1000 (AEST)
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-6157c81ff9eso2365547a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Aug 2025 06:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754054127; x=1754658927;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bPuL8T14V3X7lD1CGrwguzeqQdg4mYhlg7hqLHO0DYU=;
        b=WQoFvs0BHa7i21XKC7QmuHPiFOIrZDlcODtaP9ANfjfag3AQfjQfKZ2QftOZZ2ziRk
         Jid3o1j03qX8000O4xLbnzXopRWX1jrBB3cZMou6ebZp4xRDPXK/hGnNuyiPoLs/OncN
         Yg/k/qwAecwvtGIYJU7dKo6RFdequJdWRZW6qoSi4Rkyo9cNnwl9Cb1NtByPEK6Xq39J
         zjZ+wusVAbrfNtoqrJNoq8+sT2XA4PExsbUSrAwhQZQZjyVF/uBA7W1WiM0C4GVRCVs9
         AbbuYYd2vh1NlN2XNbL7EbT09kdkr7VQt25ejV6OFyf8mTUqvilFuTpZZgGKYnNlyVot
         MCgw==
X-Forwarded-Encrypted: i=1; AJvYcCVA6Z+iqZv0XXiEPYF+rXct1XUti6xjW3GodQl6mDCd9Rf64XFu34zYbB7SjQ6M6/51jZpFwNxOEOclp/I=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwpHHweXn8v5FN0hXKTerjYwSpILRZ5yGuOjTUvjv8YOSBmjUhM
	Vyc8ZusMPJ3ozk6ZlhJ6NNfvapp5xSJTAYDU5X8kWEs0PeIfo8G00Mg7
X-Gm-Gg: ASbGncuX5fGm23wD8LY8pYp3dYa5fQYnHS6TNVxvDt1mMnrMZJV7Ln8ct7YhzlMcd5W
	WQE5iF0RjUFsEXJiAt6RkhAp+bM2CMhYlEE/TPtOzxh1/vfXzthM/vOd2x2ImgRjLLiJ++ukI+e
	OFWxJi1L7fEY8MggcxrTpZu6NPyneJUmfDTrTK5v8nicRTDrogcS7zaO919lYyyqF2DfAXWuy99
	334YB1W/0LAsO0gssOwGRYCAVkoowAApK/t0nJ7qLvJl7ZlUZLCC/XvempvJsdUGE10glpumd69
	sHaqsecf0ZG1nTaC/R1qCYsGGmHjWnDCt6//huwvTJnn1dUpr2geyVo5gdUF7c0gEev0gMUi6Q8
	3RIxdE4oFpeKKSw==
X-Google-Smtp-Source: AGHT+IHFkYKv/rbhKiOnOJxUfULDIWQuOJVDDjNuIkW476Ceze0aVUEftZ7cwSl0d9WImjiKqgM1Wg==
X-Received: by 2002:a17:907:1c8c:b0:af6:361e:bbbc with SMTP id a640c23a62f3a-af8fd58a063mr1326768266b.2.1754054126971;
        Fri, 01 Aug 2025 06:15:26 -0700 (PDT)
Received: from localhost ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a1e82a5sm288266266b.82.2025.08.01.06.15.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 06:15:26 -0700 (PDT)
From: Breno Leitao <leitao@debian.org>
Date: Fri, 01 Aug 2025 05:31:22 -0700
Subject: [PATCH v4] vmcoreinfo: Track and log recoverable hardware errors
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
Message-Id: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
X-B4-Tracking: v=1; b=H4sIAJmzjGgC/23PQWrDMBCF4auIWVvFM5Il16veI5QgyaNYi1pFD
 mpL8N2DQwou7nbgfT9zg4VL4gUGcYPCNS0pzzAI3QgIk5svLNMIgwBqqWtta2X9CLnwefo6cym
 5SEWk6ZVNUGigEfBZOKbvh3h6bwRMabnm8vMIVNyuTwv1waooUfYh6o5Hb5TSbyP75OaXXC6wY
 ZX2gDkCJFFG7G20oyHn3R5ofr8g/H/ovOmc8VqFzh3KalcmOgJqK8fW9CoGjGj/AOu63gFZjFc
 eagEAAA==
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
 linux-pci@vger.kernel.org, kernel-team@meta.com, osandov@fb.com, 
 Breno Leitao <leitao@debian.org>
X-Mailer: b4 0.15-dev-dd21f
X-Developer-Signature: v=1; a=openpgp-sha256; l=8255; i=leitao@debian.org;
 h=from:subject:message-id; bh=6dpd9phay9ZxH4XuAj/67+dRY75lqSqOxuEaAlGrRn0=;
 b=owEBbQKS/ZANAwAIATWjk5/8eHdtAcsmYgBojL3ty8aeWsEjZnDFnn1Ba6dJoYJz35woUGATu
 OraNsExFciJAjMEAAEIAB0WIQSshTmm6PRnAspKQ5s1o5Of/Hh3bQUCaIy97QAKCRA1o5Of/Hh3
 bdTID/43KDd/Q1mSN4jZ1cULP9bNWwVt895nJKhKFHHHvnhK8VtOmfbsKb93CXzO5ysalRWeb8b
 Ek6IBb466wD7bQ/vLmrrgf4SmHvcjNszbwzgDMF9rblvSKCxhJkslV8eWRCYtQ13G8BET8qzDg5
 6FoO6lEeLvNVEeNCSTPXJoWOA/5uZCjmP1LzrUrjgNVeBAtB6uidfMlqXcY3xx+Kp+03opbdtxJ
 cy5dF/MkHh07Nunn9GdNYvcVyYI5fcRTaRC6AUp5rYNyEyc3EEJ9tcTt0XpdVyQL1hLsMK+wU1q
 SSf972wC7g+Xb352VbBDVtGP675uOGtyv0VLBX9qTzB2ufa3e6Hob5sMHlu+xvTRfQOO9DfRy9X
 TXsJMESOAlka2NTK5juaw3oEWNB2vfaMb/T8GmrAJ2ildYLDCjS/hjqijifqtBR7RqZvkM5nj6O
 4AjnrmedOxALeX/5sWV/xJS/sE/hVFWE0QuzOpb+CJ/s09AdYgNOjSt3eNmitD3bb6+768x0vCL
 s79AHjH1oaCSt4BcyzcCdZ2QWGBs1fAcgbhBECvtAb/xFtCLLUZq7acZGpLoyft9KokRkFhdEby
 Rtv7WAjj6oJ88TNjzZWS8S0xSNKfJMzU+7tzHrQixzYk79wud/zaKqCovubuVrYy9i96COLJiAO
 fUDzWkbxpPSOZKg==
X-Developer-Key: i=leitao@debian.org; a=openpgp;
 fpr=AC8539A6E8F46702CA4A439B35A3939FFC78776D
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
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
---
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
 arch/x86/kernel/cpu/mce/core.c |  4 ++++
 drivers/acpi/apei/ghes.c       | 36 ++++++++++++++++++++++++++++++++++++
 drivers/pci/pcie/aer.c         |  2 ++
 include/linux/vmcore_info.h    | 17 +++++++++++++++++
 kernel/vmcore_info.c           | 18 ++++++++++++++++++
 5 files changed, 77 insertions(+)

diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
index 4da4eab56c81d..f85759453f89a 100644
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
+	hwerr_log_error_type(HWERR_RECOV_MCE);
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
index 70ac661883672..fe0174b972a7b 100644
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
index 37e003ae52626..538a3635fb1e5 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -77,4 +77,21 @@ extern u32 *vmcoreinfo_note;
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len);
 void final_note(Elf_Word *buf);
+
+enum hwerr_error_type {
+	HWERR_RECOV_MCE,
+	HWERR_RECOV_CPU,
+	HWERR_RECOV_MEMORY,
+	HWERR_RECOV_PCI,
+	HWERR_RECOV_CXL,
+	HWERR_RECOV_OTHERS,
+	HWERR_RECOV_MAX,
+};
+
+#ifdef CONFIG_VMCORE_INFO
+noinstr void hwerr_log_error_type(enum hwerr_error_type src);
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
base-commit: 89748acdf226fd1a8775ff6fa2703f8412b286c8
change-id: 20250707-vmcore_hw_error-322429e6c316

Best regards,
--  
Breno Leitao <leitao@debian.org>


