Return-Path: <linuxppc-dev+bounces-10618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6FEB1A86C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 19:12:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwjls5wDGz3bmS;
	Tue,  5 Aug 2025 03:12:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754327529;
	cv=none; b=H6Tm5rnFPwRtJ3AG5qev+NdjHf8RIQYMhyTGUVvSvpCQhXV9+G0qF5Bvx23tgqn93ZeswBLR2xP9XOCjI0thsz2DdYwS00qCIhC5vxTnXnbMhXTOqrU6OvDfFe2bE7bv/HHglwvt4l0clfTV95mVLexPFLtwIss+WsmodRS6/mMb8CVK6Kb5wZ7khdjWo5rhesbZb1zMdjc4qYuEzXkjCCa8sOqegSv3y/GTcmAJz+lxZvsaM9Qv1yluOd+Qg/lwa35SCnBScnTBZWnSvx8dK1J2PRMLA2R/eHqtCbdnwZfB/toDUUAkaqxb1r9C5FglpwijYLgj+IFArJkqJQZRAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754327529; c=relaxed/relaxed;
	bh=EWLq2akyBI3xn1jQaoqiG9+AWimy2RulSlc4iSMtFFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ftJvtfEk2wDGL9bhB7nYe66PaClDVYoADAK/NlVmW7g6A4LDzjpDLwXXmqcHnKOD1r4R/2A1VFW3azQkegF1rl6uq8rovVH4IpcVRq9DcyuGX22K7OCG0ugRHNp4Wv2ebyEwREgzXlU8emHjx9laxdJNh/BtBDv5e8PCNd/RoAX8f96GQ4733sTDFfizpsZj+3q1e+xW5wnqD3PgWg3rnfGh1JhoiR9DjwEeAXgbJSySECCGvgs9Jor94L4UKZnX4e4kEaO18PmJN5+jxuQx9cANOsV8AlAcJKjWmW+xycW0uK6q2yp5f2a1y4QeJjHtwnO0eWhwN0W9NQDe52qgAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.46; helo=mail-ej1-f46.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.46; helo=mail-ej1-f46.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwjlr2SMQz3blF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 03:12:07 +1000 (AEST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-af968aa2de4so206486266b.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 10:12:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754327525; x=1754932325;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EWLq2akyBI3xn1jQaoqiG9+AWimy2RulSlc4iSMtFFs=;
        b=PnVQ4eojPJX2K5molGv/JqfZLX3DaW1RMAqkBfKreYwNYR3w3PLotG8DSzvze/Y2fz
         CAcFdAgjX5HqmltySel4SH/7uEHlPl4sfzwaxYeEcx0o3sbeycAhAvh3TS0BjQRbZ2NG
         ls9g70srH/2ZWPye8zuSI2ImB7ui8i+c/fkKTjszDSi+Bj7dcAnFffJmN4ARpE9buS3i
         TR/Agohr1LFHi5uMNn6l+kf6Sj1x0bG5HR5Ij1/9yBQb2YJse2SYyh9pjdgWOG3YutUT
         jxOHksW4qOSWki8ECJWWfziDBQLsRcF3xINuNoSb4LRxj5QrOKL7z8mgPuG9ilkuR+dR
         pf2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUOhKK6oFCQ8Mf280tfzxDe5Qt8VjOwLR7FpZCPUZXT7aHdOGG5IgtOHVwjEfXagelRtXnhGQOJbtax2fk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyQNUov/TU/LUFGb4BuGen5E8bxlj7waM9UiyUY7aLmHuhfW2+4
	+Qou7cXhAvy7+CDv2B0+Cy8H5Qz+k3JBque7ve6ruLLgxUhdJcUIdYBr
X-Gm-Gg: ASbGncuZfseq5EURly4HcUoCAgHDtb3EMvxrBV/JKHk2DaDR4cNkhh7OJCsq5XjB/X/
	O1L3MunG33V/EnR+Ko+j4aPrLlZ1sG0kIdfYZd6Sbe8lIXL3Cq12okzjOUPsJ5EqNg/8PKU1kJ3
	h4PQUXx1gtiWf2SopwrEmWnw1Rl5sfzvmO3DY5ixSAx3tP+FxDgHZ+ZgRTx9LnGVcSookLk7uFU
	013qJTsTtdfGtadXN8qsaQC5KWHVseKH0+nGcCBb1FQXAk8pMHc8n0/kPWagzRGc0FaDtFwgwem
	z6alvtua/FvcQsQ3m6GFTiO4+UYPUUdyfdaH1OWM4+aZw9JoyaKXRhErL4K5aE+MKOOMWcE+jr+
	7NeeT/q1UMHfz
X-Google-Smtp-Source: AGHT+IG12n5Nmixkas6wqZx5ijh4VQDZfYD73PDKW2dU17GU9je/okyAxPVk5Oe7Ru1ep6KYUKfOOw==
X-Received: by 2002:a17:907:97c5:b0:af2:80c9:7220 with SMTP id a640c23a62f3a-af9401ef95emr1181679866b.36.1754327523984;
        Mon, 04 Aug 2025 10:12:03 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:7::])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615ed86d601sm3660659a12.56.2025.08.04.10.12.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 10:12:03 -0700 (PDT)
Date: Mon, 4 Aug 2025 10:12:00 -0700
From: Breno Leitao <leitao@debian.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, osandov@osandov.com, 
	xueshuai@linux.alibaba.com, konrad.wilk@oracle.com, linux-edac@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, kernel-team@meta.com, osandov@fb.com
Subject: Re: [PATCH v4] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <ipdhflmgqrlq2vor657fiwex66jqw2do747uvu3tvrcsvtvdjj@lg5zrcua2dgn>
References: <20250801-vmcore_hw_error-v4-1-fa1fe65edb83@debian.org>
 <85663f65-d746-4e2c-b8a6-d594d9d0ba42@intel.com>
 <f3yl424iqiyctgz4j36hzjrhkgae3a2h5smhalm2qbmq3nrpzd@oeuprthscfez>
 <0c045f1b-44d0-430c-9e8a-58b65dd84453@intel.com>
 <buhwuankenpnvmio6jeoxverixoyfpn2eh62ix7vzxw7xvlxcv@rpibcrufr2yg>
 <842d675e-4c22-4f13-b40b-c4b5208e4223@intel.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <842d675e-4c22-4f13-b40b-c4b5208e4223@intel.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 01, 2025 at 10:06:51AM -0700, Dave Hansen wrote:
> On 8/1/25 10:00, Breno Leitao wrote:
> > Would a solution like this look better?
> > 
> > 	enum hwerr_error_type {
> > 		HWERR_RECOV_CPU,
> > 		HWERR_RECOV_MEMORY,
> > 		HWERR_RECOV_PCI,
> > 		HWERR_RECOV_CXL,
> > 		HWERR_RECOV_OTHERS,
> > 	#ifdef CONFIG_X86_MCE
> > 		HWERR_RECOV_MCE,
> > 	#endif
> > 		HWERR_RECOV_MAX,
> > 	};
> > 
> > Or, would you prefer to have HWERR_RECOV_ARCH and keep it always there?
> 
> That would only work for HWERR_RECOV_MCE, though. If you added another:
> 
> #ifdef CONFIG_FOO
> 	HWERR_RECOV_FOO
> #endif
> 
> then your example of:
> 
> 	>>> prog['hwerror_data']
> 	(struct hwerror_info[6]){
> 		{
> 			.count = (int)844,
> 			.timestamp = (time64_t)1752852018,
> 		},
> 		...
> 
> doesn't work any more. You wouldn't be able to tell HWERR_RECOV_MCE from
> HWERR_RECOV_FOO because they'd alias to the same constant.

Very good point, that is not what we want. Thanks for raising it.

> This whole thing is an ABI. Right?

Exactly.

I've digested the feedback a bit more and this is how it looks like now:

1) Remove HWERR_RECOV_MCE and account MCE errors in HWERR_RECOV_OTHERS
2) Use the atomic operators to increase the number of errors, according
   to Dave.
3) Have an RST documentation that would help to answer question about
   this feature as to let users know that this is available.


Is this a better patch?

commit ff35595f66871ddf80cda0a8e42398738171abe1
Author: Breno Leitao <leitao@debian.org>
Date:   Thu Jul 17 07:39:26 2025 -0700

    vmcoreinfo: Track and log recoverable hardware errors
    
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

diff --git a/Documentation/driver-api/hw-recoverable-errors.rst b/Documentation/driver-api/hw-recoverable-errors.rst
new file mode 100644
index 0000000000000..7989258262d49
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
+- These errros are divided by are, which includes CPU, Memory, PCI, CXL and
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
index 37e003ae52626..92e713c1a83d0 100644
--- a/include/linux/vmcore_info.h
+++ b/include/linux/vmcore_info.h
@@ -77,4 +77,20 @@ extern u32 *vmcoreinfo_note;
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len);
 void final_note(Elf_Word *buf);
+
+enum hwerr_error_type {
+	HWERR_RECOV_CPU,
+	HWERR_RECOV_MEMORY,
+	HWERR_RECOV_PCI,
+	HWERR_RECOV_CXL,
+	HWERR_RECOV_OTHERS,
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

