Return-Path: <linuxppc-dev+bounces-10323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B70AB0A825
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jul 2025 18:11:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bkFCf3Qg5z2ySg;
	Sat, 19 Jul 2025 02:11:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1752855086;
	cv=none; b=Wzxsy80dkmHRmlyjYuPHKH3z3bTWMWLVOut0Hm/zlVl1cMeA9T7L/BosjuPvndOyCuXSIjmf8F/Qil1hUG5Kpn7MYVgrpPfXXaTjKHPlnNurkmJI73m+DS+PF6NajsNUH/VXrhAXFyOSZorTEYFTsuXE3uxk+HZd7oQ2LI4Cm1y1zGKMbrtW+8sZB43r2ZEEnLbhxswO8x0jNXVtKMIBK08XIewb/MbuVYKgVq8PlyHzL2kLoZ2KEhfQNqfbpZTASX1xnS8JxLt1fxj5MbmnG9nUQGHJ0DlyasdQ8W+SfPuLuEVfj5YzcDs3MIBSqucHFHBzN72ensx5Vb2SUHmbDA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1752855086; c=relaxed/relaxed;
	bh=XqEj8W5u0PUeUJPY+sEKzsugXYSIb9vt2kBSXIxBRws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GPjpQc6QteIbZV1MCLYs3EHr2Q7bBSa5CpiI+RhVThUgHsF5yqdysmrc99v5nQa28irGZPFeXnnp6jwrTqjDBBk9hDX+tSL/ncOvP4Jl1o0yUT/4tWJV0Mi+Awpr9Ig2PyGHEATT5e9o9VWCLaWNrMCvmPbrobVCk2yafw9FwkBlvBPD8L9p0mQM3ZHL+gN9GSrPwY8qDIAue9XaZOxePusc7B1Lml0BNGHc13vgL/ZRJpb8By8ShsONVitaswlLSjPM55u1HZYokLGKHYFqLKEW1XjVK6cSNdxbCgH6t4tiR1y+DNInZ6tcVgY2Bib2nm/nm1nuX2yJhpYVjK/Gpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.52; helo=mail-ej1-f52.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.52; helo=mail-ej1-f52.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bkFCc2fbZz2y8W
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Jul 2025 02:11:23 +1000 (AEST)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ae0de1c378fso332921966b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jul 2025 09:11:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752855079; x=1753459879;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XqEj8W5u0PUeUJPY+sEKzsugXYSIb9vt2kBSXIxBRws=;
        b=ruLxSefpDdIj1UqKqknL4lEGydxtcpZfcXZdmfrThv3mT0JVTkI7oFS6MKY6ReUeW7
         L2MSxe0kxUFoVVSzcH3fbRXzA+hu5MX9BAg3eFBBbSefdNkLTwb8roLjRDBAoRMM6oVA
         +f+4pAsdXkx7zuDxTBktVH5n9KQh/k8CHU2SP0CnAhKWxs2hin5bo+Gqzx7pdd3S9AX4
         eOhA/GMz+wtSZmqEhopZ6nWCgW86pAYs92p2Nh/ozVQjtZbsvwWKgN+r1F8qViukAh1H
         H5YRtWAqv3ftikn7a1GBvmy55PHiRdoyBpDBFz9tc3T78pggrHwkuluMwdk2v1It8mT8
         6j7w==
X-Forwarded-Encrypted: i=1; AJvYcCXJT8juvcAhrSGb5j19uxjv5yftuB9ZvcQBQtdF+oiZWxi344KxclHQ2G4QhpK23GpTkjf4diBuIA5e4f4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw7eclSrLWUWkdXCUoZoc9IgBcTp6k3QHS24HquVGyqf6SLz5J9
	uTOxi8afqMptcmYPSHeM/ssvSIgLCVRKU1V9A+ovvqrN9bGEuJTH/xXx
X-Gm-Gg: ASbGncttsBs/p6IYcznsyr8diMXX9Kio4Kmzdz0A+y/VWt1LRwYLWtVZLbZkBgBXz9j
	N3k6Jzd1SCsruP8uUtrvCLz250qX2v6oSCbGh+vICRM07tG47Vnn4wr3H56YeuIpCNP4/Ag+t9g
	lfKfaGyhmgWy9lUgPONDC6P70OLoDP86E+QUiMoBzZaqoRyRd8VjR0EpAAv9SxsVN0C789C3pZ2
	gAkwRsXNyg6CJt8JJXwKPHMzFvxpMIvJkovRxFq0jU7hk7eND/G64cLQyDLZx3nboIfE9SjA7h3
	yCMiKAWK4LhRfloDr+9Zdp83UHGp5L2gZDF2hQufVPcrDeY87M3XFAKV539LFdw248y1Rwjuyyj
	mcY7gh2zYYlqCg5A6l2X9
X-Google-Smtp-Source: AGHT+IEiIuDXKUJLBKu3VOqaAEewUE0HyZp4v/jj6blHZALvKRW9GCnqD0O0owXO5y4N0JWIx1a0ew==
X-Received: by 2002:a17:906:d54d:b0:aec:578e:caf0 with SMTP id a640c23a62f3a-aec578ecd9fmr676449266b.29.1752855078677;
        Fri, 18 Jul 2025 09:11:18 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca7ae11sm142459866b.108.2025.07.18.09.11.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 09:11:18 -0700 (PDT)
Date: Fri, 18 Jul 2025 09:11:15 -0700
From: Breno Leitao <leitao@debian.org>
To: "Luck, Tony" <tony.luck@intel.com>, xueshuai@linux.alibaba.com, 
	mahesh@linux.ibm.com, oohall@gmail.com
Cc: Borislav Petkov <bp@alien8.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, 
	"Moore, Robert" <robert.moore@intel.com>, "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "acpica-devel@lists.linux.dev" <acpica-devel@lists.linux.dev>, 
	"kernel-team@meta.com" <kernel-team@meta.com>, osandov@osandov.com, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] ghes: Track number of recovered hardware errors
Message-ID: <mazejvrglvtqdfsevduahqxvlvjv6hlo3apivossn2jnxpsuds@os6kxmmsq3xt>
References: <20250714-vmcore_hw_error-v1-1-8cf45edb6334@debian.org>
 <20250714171040.GOaHU6EKH2xxSZFnZd@fat_crate.local>
 <SJ1PR11MB6083C38E6DA922E05E1748D6FC54A@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20250714173556.GQaHU__LL6IUIPCDIW@fat_crate.local>
 <aHWC-J851eaHa_Au@agluck-desk3>
 <kw7mwmca3ir4nfyofumqiack5sht3aisdchevykdtmlio6xo7z@5xbdibpqvqix>
 <SJ1PR11MB6083CEAB23FCE85937DC5403FC51A@SJ1PR11MB6083.namprd11.prod.outlook.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SJ1PR11MB6083CEAB23FCE85937DC5403FC51A@SJ1PR11MB6083.namprd11.prod.outlook.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Tony,

On Thu, Jul 17, 2025 at 05:29:14PM +0000, Luck, Tony wrote:
>
> If the intent is still to add this information to vmcore (as in
> earlier discussions in this thread). Then it could go into
> kernel/vmcore_info.c (and be configured with CONFIG_VMCORE_INFO).
> 
> Would just need an empty stub in some header file for the
> log_recovered_error() function.

Thanks for the suggestion.

I found that I don't need to expose the metrics in vmcore info at all to
be able to read them from vmcore, given crash/drgn can read those
symbols.

Global variable hwerror_tracking will be write-only during kernel
run-time, and only read during post morten analyzes. I am still not sure
if the compiler might not get rid of them completely, given no on reads.
I am wondering if I should EXPORT_SYMBOL_GPL(hwerror_tracking) to avoid
any optimization there.

Anyway, this is the patch I am using and it solves the problem I am
interested in. Any opinion?

Thanks for your support,
--breno

commit 396d9bd5266607731b535f4246fd3e4971df9016
Author: Breno Leitao <leitao@debian.org>
Date:   Thu Jul 17 07:39:26 2025 -0700

    vmcoreinfo: Track and log recoverable hardware errors
    
    Introduce a generic infrastructure for tracking recoverable hardware
    errors (HW errors that did not cause a panic) and record them for vmcore
    consumption. This aids post-mortem crash analysis tools by preserving
    a count and timestamp for the last occurrence of such errors.
    
    This patch adds centralized logging for three common sources of
    recoverable hardware errors:
    
      - PCIe AER Correctable errors
      - x86 Machine Check Exceptions (MCE)
      - APEI/CPER GHES corrected or recoverable errors
    
    Each source logs to a shared `hwerror_tracking` array, protected by a
    spinlock, and maintains a per-source error count and timestamp of the
    most recent event.
    
    hwerror_tracking is write-only at kernel runtime, and it is meant to be
    read from vmcore using tools like crash/drgn. For example, this is how
    it looks like from drgn:
    
            >>> prog['hwerror_tracking']
            (struct hwerror_tracking_info [3]){
                    {
                            .count = (int)0,
                            .timestamp = (time64_t)0,
                    },
                    {
                            .count = (int)0,
                            .timestamp = (time64_t)0,
                    },
                    {
                            .count = (int)844,
                            .timestamp = (time64_t)1752852018,
                    },
            }
    
    Suggested-by: Tony Luck <tony.luck@intel.com>
    Signed-off-by: Breno Leitao <leitao@debian.org>

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
index f0584ccad4519..255453cdc72e9 100644
--- a/drivers/acpi/apei/ghes.c
+++ b/drivers/acpi/apei/ghes.c
@@ -43,6 +43,7 @@
 #include <linux/uuid.h>
 #include <linux/ras.h>
 #include <linux/task_work.h>
+#include <linux/vmcore_info.h>
 
 #include <acpi/actbl1.h>
 #include <acpi/ghes.h>
@@ -1100,13 +1101,16 @@ static int ghes_proc(struct ghes *ghes)
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
index 70ac661883672..9d4fa1cb8afb9 100644
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
index e066d31d08f89..c3d2bfffec298 100644
--- a/kernel/vmcore_info.c
+++ b/kernel/vmcore_info.c
@@ -31,6 +31,14 @@ u32 *vmcoreinfo_note;
 /* trusted vmcoreinfo, e.g. we can make a copy in the crash memory */
 static unsigned char *vmcoreinfo_data_safecopy;
 
+static struct hwerror_tracking_info {
+	int         count;
+	time64_t    timestamp;
+};
+
+static struct hwerror_tracking_info hwerror_tracking[HWE_RECOV_MAX];
+static DEFINE_SPINLOCK(hwerror_tracking_lock);
+
 Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
 			  void *data, size_t data_len)
 {
@@ -118,6 +126,23 @@ phys_addr_t __weak paddr_vmcoreinfo_note(void)
 }
 EXPORT_SYMBOL(paddr_vmcoreinfo_note);
 
+void hwerror_tracking_log(enum hwerror_tracking_source src)
+{
+	struct hwerror_tracking_info *hwet;
+	unsigned long flags;
+
+	if (src < 0 || src >= HWE_RECOV_MAX)
+		return;
+
+	hwet = &hwerror_tracking[src];
+
+	spin_lock_irqsave(&hwerror_tracking_lock, flags);
+	hwet->count++;
+	hwet->timestamp = ktime_get_real_seconds();
+	spin_unlock_irqrestore(&hwerror_tracking_lock, flags);
+}
+EXPORT_SYMBOL_GPL(hwerror_tracking_log);
+
 static int __init crash_save_vmcoreinfo_init(void)
 {
 	vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);

