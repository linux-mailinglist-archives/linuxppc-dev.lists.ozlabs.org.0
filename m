Return-Path: <linuxppc-dev+bounces-16837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kJA3B9imjWkK5wAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16837-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 11:09:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 742D912C464
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 11:09:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBWHN3d4gz30VV;
	Thu, 12 Feb 2026 21:09:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.221
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770890960;
	cv=none; b=faFkwXk1Gv+c+tadYWNnATZvM8AcjRuLyD2K/aSTyGsTkha4FsydKUwC88jTyu9ql3bYP0rX2t40ASgbLIm5mifgj1unF2zhoZiogfLZPqToH9oyv0FCobDWvevsqcSBsCvAI9v8GqGgy1ay49d59Mj/TSbcrzps8zr56uXpyUNUs0ZpQB1ALfDo7tSgXKIf5NHMnQf/IXs1VogKbjIVWAIaUqHti/Kx4Cu6Mm7rcOo2JEF2oPr2eX9/lZFDnQhQQUFehL5+tQEPWBA3GG22u53FDR/xAV/X6FECnJ/MlVfQMpYFUTlExirKAoC1INpOu8gZ1KfyTuTjxop4NlrHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770890960; c=relaxed/relaxed;
	bh=zXN+U1fKk/yF3wsz6geQ5mHoWp5G9NiYIKEuE7hV9tc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WzKfaS/4Pz6PCnsjlJ6xFLboA0Z5ydXGZVhvD6LlpLciWDASmvKVsSUjwoywg/p6HQ4f8WA2GqcNfAXC0btRvRjinCov/RUQI8MjdgKLiYtB2BlqiHy6Ki87BJ0aRupWp+dWlc6d3IkkeVzD2nUtYF0jQwVLhUKlI6MIxixUSmGe6oqy32yAU6H2gDBiZY5Jv/TpY9UrdhhoQLnrCcdt4m4YzyxbDjKZITvT2lX1t1XIl1UwJiC9+KomueJDM2ZTCVkFz0FXUTgq4ZGpgy6Vj4zwL8GxzreR0O7lKx9QtcEkItBRQO6ujjxiFdUwPdf54i3xvEyIPma/TEsexNYktQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1ZfVuAnP; dkim-atps=neutral; spf=pass (client-ip=113.46.200.221; helo=canpmsgout06.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=1ZfVuAnP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.221; helo=canpmsgout06.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from canpmsgout06.his.huawei.com (canpmsgout06.his.huawei.com [113.46.200.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBWHJ5nc5z2yFm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 21:09:16 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=zXN+U1fKk/yF3wsz6geQ5mHoWp5G9NiYIKEuE7hV9tc=;
	b=1ZfVuAnPHDTRjAw2jYD//J3Ds+bkyAtzuG92+TNyT89LBU0GVpuKFNNTKnxR4FbN7j011/Zts
	C5Jnw845IXz/ZorqI7vrPjCgkjkABsZkcfpNV+SeRrvWvqUmSyOCKYkzSLHXmLKJXICZi/AZXNH
	qTsHZ57FRXSSTaaio5zdClo=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4fBW9t5cMPzRhTq;
	Thu, 12 Feb 2026 18:04:34 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E24D40363;
	Thu, 12 Feb 2026 18:09:13 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 12 Feb
 2026 18:09:10 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<ruanjinjie@huawei.com>, <fvdl@google.com>, <thuth@redhat.com>,
	<ardb@kernel.org>, <leitao@debian.org>, <rppt@kernel.org>, <osandov@fb.com>,
	<cfsworks@gmail.com>, <sourabhjain@linux.ibm.com>, <ryan.roberts@arm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>, <bjorn@rivosinc.com>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <dwmw@amazon.co.uk>,
	<pbonzini@redhat.com>, <kai.huang@intel.com>, <ubizjak@gmail.com>,
	<coxu@redhat.com>, <fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
	<brgerst@gmail.com>, <jbohac@suse.cz>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
Subject: [PATCH v5 2/4] crash: Exclude crash kernel memory in crash core
Date: Thu, 12 Feb 2026 18:09:59 +0800
Message-ID: <20260212101001.343158-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212101001.343158-1-ruanjinjie@huawei.com>
References: <20260212101001.343158-1-ruanjinjie@huawei.com>
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:kees@kernel.org,m:elver@google.com,m:paulmck@kernel.org,m:arnd@arndb.de,m:ruanjinjie@huawei.com,m:fvdl@google.com,m:thuth@redhat.com,m:ardb@kernel.org,m:leitao@debian.org,m:rppt@kernel.org,m:osandov@fb.com,m:cfsworks@gmail.com,m:sourabhjain@linux.ibm.com,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:eajames@linux.ibm.com,m:hbathini@linux.ibm.com,m:ritesh.list@gmail.com,m:songshuaishuai@tinylab.org,m:bjorn@rivosinc.com,m:samuel.holland@sifive.com,m:kevin.brodsky
 @arm.com,m:junhui.liu@pigmoral.tech,m:vishal.moola@gmail.com,m:dwmw@amazon.co.uk,m:pbonzini@redhat.com,m:kai.huang@intel.com,m:ubizjak@gmail.com,m:coxu@redhat.com,m:fuqiang.wang@easystack.cn,m:liaoyuanhong@vivo.com,m:brgerst@gmail.com,m:jbohac@suse.cz,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16837-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,google.com,arndb.de,huawei.com,debian.org,fb.com,kylinos.cn,tinylab.org,rivosinc.com,sifive.com,pigmoral.tech,amazon.co.uk,intel.com,easystack.cn,vivo.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_GT_50(0.00)[65];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_XOIP(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 742D912C464
X-Rspamd-Action: no action

The exclude of crashk_res, crashk_low_res and crashk_cma memory
are almost identical across different architectures, handling them
in the crash core would eliminate a lot of duplication, so do
them in the common code.

And move the size calculation (and the realloc if needed) into the
generic crash core so that:

- New CMA regions or future crash-memory types can automatically
  accounted for in crash core;

- Each architecture no longer has to play whack-a-mole with
  its private array size.

To achieve the above goal, 4 architecture-specific functions are
introduced:

- arch_get_system_nr_ranges() and arch_prepare_elf64_ram_headers().
  The 1st function pre-counts the number of memory ranges, and
  the 2st function fill the memory ranges into the cmem->ranges[] array,
  and count the actual number of ranges filled.

- arch_crash_exclude_mem_range(). Realloc for powerpc. The default
  implementation is crash_exclude_mem_range(), and use
  crash_exclude_mem_range_guarded() to implement the arch version
  for powerpc.

- arch_get_crash_memory_ranges(). Get crash memory ranges for arch and
  the default implementation is generic across x86, arm64, riscv, and
  loongson by using the first two arch functions above. powerpc has its
  own implementation by calling get_crash_memory_ranges().

Tested on x86, arm64 and riscv with QEMU.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/include/asm/kexec.h             |   9 +-
 arch/arm64/kernel/machine_kexec_file.c     |  41 +++-----
 arch/loongarch/include/asm/kexec.h         |   9 +-
 arch/loongarch/kernel/machine_kexec_file.c |  41 +++-----
 arch/powerpc/include/asm/kexec.h           |  13 +++
 arch/powerpc/include/asm/kexec_ranges.h    |   3 -
 arch/powerpc/kexec/crash.c                 |  68 ++++++++------
 arch/powerpc/kexec/file_load_64.c          |  17 ++--
 arch/powerpc/kexec/ranges.c                |  18 +---
 arch/riscv/include/asm/kexec.h             |   9 +-
 arch/riscv/kernel/machine_kexec_file.c     |  37 +++-----
 arch/x86/include/asm/kexec.h               |   9 ++
 arch/x86/kernel/crash.c                    | 104 +++------------------
 include/linux/crash_core.h                 |  75 +++++++++++++--
 kernel/crash_core.c                        |  85 +++++++++++++++--
 15 files changed, 289 insertions(+), 249 deletions(-)

diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
index 892e5bebda95..67f790e3ba14 100644
--- a/arch/arm64/include/asm/kexec.h
+++ b/arch/arm64/include/asm/kexec.h
@@ -119,6 +119,7 @@ struct kimage_arch {
 };
 
 #ifdef CONFIG_KEXEC_FILE
+struct crash_mem;
 extern const struct kexec_file_ops kexec_image_ops;
 
 int arch_kimage_file_post_load_cleanup(struct kimage *image);
@@ -128,7 +129,13 @@ extern int load_other_segments(struct kimage *image,
 		unsigned long kernel_load_addr, unsigned long kernel_size,
 		char *initrd, unsigned long initrd_len,
 		char *cmdline);
-#endif
+
+int arch_get_system_nr_ranges(unsigned int *nr_ranges);
+#define arch_get_system_nr_ranges arch_get_system_nr_ranges
+
+int arch_prepare_elf64_ram_headers(struct crash_mem *cmem);
+#define arch_prepare_elf64_ram_headers arch_prepare_elf64_ram_headers
+#endif /* CONFIG_KEXEC_FILE */
 
 #endif /* __ASSEMBLER__ */
 
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 410060ebd86d..506a165117b1 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -40,23 +40,22 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 }
 
 #ifdef CONFIG_CRASH_DUMP
-static int prepare_elf_headers(void **addr, unsigned long *sz)
+int arch_get_system_nr_ranges(unsigned int *nr_ranges)
 {
-	struct crash_mem *cmem;
-	unsigned int nr_ranges;
-	int ret;
-	u64 i;
 	phys_addr_t start, end;
+	u64 i;
 
-	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
+		(*nr_ranges)++;
+
+	return 0;
+}
 
-	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
-	if (!cmem)
-		return -ENOMEM;
+int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
 
-	cmem->max_nr_ranges = nr_ranges;
 	cmem->nr_ranges = 0;
 	for_each_mem_range(i, &start, &end) {
 		cmem->ranges[cmem->nr_ranges].start = start;
@@ -64,22 +63,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 		cmem->nr_ranges++;
 	}
 
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
-	if (ret)
-		goto out;
-
-	if (crashk_low_res.end) {
-		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
-		if (ret)
-			goto out;
-	}
-
-	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
-
-out:
-	kfree(cmem);
-	return ret;
+	return 0;
 }
 #endif
 
@@ -109,7 +93,8 @@ int load_other_segments(struct kimage *image,
 	void *headers;
 	unsigned long headers_sz;
 	if (image->type == KEXEC_TYPE_CRASH) {
-		ret = prepare_elf_headers(&headers, &headers_sz);
+		ret = crash_prepare_elf64_headers(true, &headers, &headers_sz,
+						  NULL, NULL, NULL);
 		if (ret) {
 			pr_err("Preparing elf core header failed\n");
 			goto out_err;
diff --git a/arch/loongarch/include/asm/kexec.h b/arch/loongarch/include/asm/kexec.h
index 209fa43222e1..2cb585f25e3f 100644
--- a/arch/loongarch/include/asm/kexec.h
+++ b/arch/loongarch/include/asm/kexec.h
@@ -42,6 +42,7 @@ struct kimage_arch {
 };
 
 #ifdef CONFIG_KEXEC_FILE
+struct crash_mem;
 extern const struct kexec_file_ops kexec_efi_ops;
 extern const struct kexec_file_ops kexec_elf_ops;
 
@@ -51,7 +52,13 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image);
 extern int load_other_segments(struct kimage *image,
 		unsigned long kernel_load_addr, unsigned long kernel_size,
 		char *initrd, unsigned long initrd_len, char *cmdline, unsigned long cmdline_len);
-#endif
+
+int arch_get_system_nr_ranges(unsigned int *nr_ranges);
+#define arch_get_system_nr_ranges arch_get_system_nr_ranges
+
+int arch_prepare_elf64_ram_headers(struct crash_mem *cmem);
+#define arch_prepare_elf64_ram_headers arch_prepare_elf64_ram_headers
+#endif /* CONFIG_KEXEC_FILE */
 
 typedef void (*do_kexec_t)(unsigned long efi_boot,
 			   unsigned long cmdline_ptr,
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index fb57026f5f25..e8bc7e65d400 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -56,23 +56,22 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-
-static int prepare_elf_headers(void **addr, unsigned long *sz)
+int arch_get_system_nr_ranges(unsigned int *nr_ranges)
 {
-	int ret, nr_ranges;
-	uint64_t i;
 	phys_addr_t start, end;
-	struct crash_mem *cmem;
+	uint64_t i;
 
-	nr_ranges = 2; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
+		(*nr_ranges)++;
 
-	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
-	if (!cmem)
-		return -ENOMEM;
+	return 0;
+}
+
+int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	uint64_t i;
 
-	cmem->max_nr_ranges = nr_ranges;
 	cmem->nr_ranges = 0;
 	for_each_mem_range(i, &start, &end) {
 		cmem->ranges[cmem->nr_ranges].start = start;
@@ -80,22 +79,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 		cmem->nr_ranges++;
 	}
 
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
-	if (ret < 0)
-		goto out;
-
-	if (crashk_low_res.end) {
-		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
-		if (ret < 0)
-			goto out;
-	}
-
-	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
-
-out:
-	kfree(cmem);
-	return ret;
+	return 0;
 }
 
 /*
@@ -163,7 +147,8 @@ int load_other_segments(struct kimage *image,
 		void *headers;
 		unsigned long headers_sz;
 
-		ret = prepare_elf_headers(&headers, &headers_sz);
+		ret = crash_prepare_elf64_headers(true, &headers, &headers_sz,
+						  NULL, NULL, NULL);
 		if (ret < 0) {
 			pr_err("Preparing elf core header failed\n");
 			goto out_err;
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index bd4a6c42a5f3..1cadf34d8050 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -212,6 +212,19 @@ static inline void reset_sprs(void)
 }
 #endif
 
+#ifdef CONFIG_CRASH_DUMP
+struct crash_mem;
+struct memory_notify;
+
+int arch_crash_exclude_mem_range(struct crash_mem **mem, unsigned long long mstart,
+				 unsigned long long mend);
+#define arch_crash_exclude_mem_range arch_crash_exclude_mem_range
+
+int arch_get_crash_memory_ranges(struct crash_mem **cmem, unsigned long *nr_mem_ranges,
+				 struct kimage *image, struct memory_notify *mn);
+#define arch_get_crash_memory_ranges arch_get_crash_memory_ranges
+#endif
+
 #endif /* ! __ASSEMBLER__ */
 #endif /* __KERNEL__ */
 #endif /* _ASM_POWERPC_KEXEC_H */
diff --git a/arch/powerpc/include/asm/kexec_ranges.h b/arch/powerpc/include/asm/kexec_ranges.h
index ad95e3792d10..8489e844b447 100644
--- a/arch/powerpc/include/asm/kexec_ranges.h
+++ b/arch/powerpc/include/asm/kexec_ranges.h
@@ -7,9 +7,6 @@
 void sort_memory_ranges(struct crash_mem *mrngs, bool merge);
 struct crash_mem *realloc_mem_ranges(struct crash_mem **mem_ranges);
 int add_mem_range(struct crash_mem **mem_ranges, u64 base, u64 size);
-int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
-				    unsigned long long mstart,
-				    unsigned long long mend);
 int get_exclude_memory_ranges(struct crash_mem **mem_ranges);
 int get_reserved_memory_ranges(struct crash_mem **mem_ranges);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index 898742a5205c..07463f91b2ec 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -399,6 +399,43 @@ void default_machine_crash_shutdown(struct pt_regs *regs)
 		ppc_md.kexec_cpu_down(1, 0);
 }
 
+int arch_get_crash_memory_ranges(struct crash_mem **cmem, unsigned long *nr_mem_ranges,
+				 struct kimage *image, struct memory_notify *mn)
+{
+#ifdef CONFIG_CRASH_HOTPLUG
+	unsigned long base_addr, size, end;
+#endif
+	int ret;
+
+	ret = get_crash_memory_ranges(cmem);
+	if (ret) {
+		pr_err("Failed to get crash mem range\n");
+		return ret;
+	}
+
+	if (!image || !mn)
+		return 0;
+
+	/*
+	 * The hot unplugged memory is part of crash memory ranges,
+	 * remove it here.
+	 */
+#ifdef CONFIG_CRASH_HOTPLUG
+	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
+		base_addr = PFN_PHYS(mn->start_pfn);
+		size = mn->nr_pages * PAGE_SIZE;
+		end = base_addr + size - 1;
+		ret = arch_crash_exclude_mem_range(cmem, base_addr, end);
+		if (ret) {
+			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
+			return ret;
+		}
+	}
+#endif
+
+	return 0;
+}
+
 #ifdef CONFIG_CRASH_HOTPLUG
 #undef pr_fmt
 #define pr_fmt(fmt) "crash hp: " fmt
@@ -427,38 +464,16 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
  */
 static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
 {
-	int ret;
-	struct crash_mem *cmem = NULL;
-	struct kexec_segment *ksegment;
 	void *ptr, *mem, *elfbuf = NULL;
-	unsigned long elfsz, memsz, base_addr, size, end;
+	struct kexec_segment *ksegment;
+	unsigned long elfsz, memsz;
+	int ret;
 
 	ksegment = &image->segment[image->elfcorehdr_index];
 	mem = (void *) ksegment->mem;
 	memsz = ksegment->memsz;
 
-	ret = get_crash_memory_ranges(&cmem);
-	if (ret) {
-		pr_err("Failed to get crash mem range\n");
-		return;
-	}
-
-	/*
-	 * The hot unplugged memory is part of crash memory ranges,
-	 * remove it here.
-	 */
-	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
-		base_addr = PFN_PHYS(mn->start_pfn);
-		size = mn->nr_pages * PAGE_SIZE;
-		end = base_addr + size - 1;
-		ret = crash_exclude_mem_range_guarded(&cmem, base_addr, end);
-		if (ret) {
-			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
-			goto out;
-		}
-	}
-
-	ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
+	ret = crash_prepare_elf64_headers(false, &elfbuf, &elfsz, NULL, image, mn);
 	if (ret) {
 		pr_err("Failed to prepare elf header\n");
 		goto out;
@@ -487,7 +502,6 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
 		xchg(&kexec_crash_image, image);
 	}
 out:
-	kvfree(cmem);
 	kvfree(elfbuf);
 }
 
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index e7ef8b2a2554..6fe13031236c 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -401,17 +401,17 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
 	}
 }
 
-static unsigned int kdump_extra_elfcorehdr_size(struct crash_mem *cmem)
+static unsigned int kdump_extra_elfcorehdr_size(unsigned long nr_mem_ranges)
 {
 #if defined(CONFIG_CRASH_HOTPLUG) && defined(CONFIG_MEMORY_HOTPLUG)
 	unsigned int extra_sz = 0;
 
 	if (CONFIG_CRASH_MAX_MEMORY_RANGES > (unsigned int)PN_XNUM)
 		pr_warn("Number of Phdrs %u exceeds max\n", CONFIG_CRASH_MAX_MEMORY_RANGES);
-	else if (cmem->nr_ranges >= CONFIG_CRASH_MAX_MEMORY_RANGES)
+	else if (nr_mem_ranges >= CONFIG_CRASH_MAX_MEMORY_RANGES)
 		pr_warn("Configured crash mem ranges may not be enough\n");
 	else
-		extra_sz = (CONFIG_CRASH_MAX_MEMORY_RANGES - cmem->nr_ranges) * sizeof(Elf64_Phdr);
+		extra_sz = (CONFIG_CRASH_MAX_MEMORY_RANGES - nr_mem_ranges) * sizeof(Elf64_Phdr);
 
 	return extra_sz;
 #endif
@@ -428,17 +428,13 @@ static unsigned int kdump_extra_elfcorehdr_size(struct crash_mem *cmem)
  */
 static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 {
-	struct crash_mem *cmem = NULL;
+	unsigned long nr_mem_ranges;
 	unsigned long headers_sz;
 	void *headers = NULL;
 	int ret;
 
-	ret = get_crash_memory_ranges(&cmem);
-	if (ret)
-		goto out;
-
 	/* Setup elfcorehdr segment */
-	ret = crash_prepare_elf64_headers(cmem, false, &headers, &headers_sz);
+	ret = crash_prepare_elf64_headers(false, &headers, &headers_sz, &nr_mem_ranges, NULL, NULL);
 	if (ret) {
 		pr_err("Failed to prepare elf headers for the core\n");
 		goto out;
@@ -450,7 +446,7 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	kbuf->buffer = headers;
 	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
 	kbuf->bufsz = headers_sz;
-	kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(cmem);
+	kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(nr_mem_ranges);
 	kbuf->top_down = false;
 
 	ret = kexec_add_buffer(kbuf);
@@ -463,7 +459,6 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
 	image->elf_headers_sz = headers_sz;
 	image->elf_headers = headers;
 out:
-	kfree(cmem);
 	return ret;
 }
 
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 6c58bcc3e130..15dfd3b9d538 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -553,9 +553,9 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 #endif /* CONFIG_KEXEC_FILE */
 
 #ifdef CONFIG_CRASH_DUMP
-int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
-					   unsigned long long mstart,
-					   unsigned long long mend)
+int arch_crash_exclude_mem_range(struct crash_mem **mem_ranges,
+				 unsigned long long mstart,
+				 unsigned long long mend)
 {
 	struct crash_mem *tmem = *mem_ranges;
 
@@ -604,18 +604,6 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 			sort_memory_ranges(*mem_ranges, true);
 	}
 
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
-	if (ret)
-		goto out;
-
-	for (i = 0; i < crashk_cma_cnt; ++i) {
-		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_cma_ranges[i].start,
-					      crashk_cma_ranges[i].end);
-		if (ret)
-			goto out;
-	}
-
 	/*
 	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
 	 *        regions are exported to save their context at the time of
diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
index b9ee8346cc8c..1eb28d24a5ef 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -73,6 +73,13 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 			unsigned long kernel_len, char *initrd,
 			unsigned long initrd_len, char *cmdline,
 			unsigned long cmdline_len);
-#endif
+
+int arch_get_system_nr_ranges(unsigned int *nr_ranges);
+#define arch_get_system_nr_ranges arch_get_system_nr_ranges
+
+struct crash_mem;
+int arch_prepare_elf64_ram_headers(struct crash_mem *cmem);
+#define arch_prepare_elf64_ram_headers arch_prepare_elf64_ram_headers
+#endif /* CONFIG_KEXEC_FILE */
 
 #endif
diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
index dd9d92a96517..2f0e7bbeb2f0 100644
--- a/arch/riscv/kernel/machine_kexec_file.c
+++ b/arch/riscv/kernel/machine_kexec_file.c
@@ -44,6 +44,13 @@ static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
 	return 0;
 }
 
+int arch_get_system_nr_ranges(unsigned int *nr_ranges)
+{
+	walk_system_ram_res(0, -1, nr_ranges, get_nr_ram_ranges_callback);
+
+	return 0;
+}
+
 static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
 {
 	struct crash_mem *cmem = arg;
@@ -55,33 +62,10 @@ static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
 	return 0;
 }
 
-static int prepare_elf_headers(void **addr, unsigned long *sz)
+int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem;
-	unsigned int nr_ranges;
-	int ret;
-
-	nr_ranges = 1; /* For exclusion of crashkernel region */
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
-
-	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
-	if (!cmem)
-		return -ENOMEM;
-
-	cmem->max_nr_ranges = nr_ranges;
 	cmem->nr_ranges = 0;
-	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-	if (ret)
-		goto out;
-
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
-	if (!ret)
-		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
-
-out:
-	kfree(cmem);
-	return ret;
+	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
 }
 
 static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
@@ -273,7 +257,8 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 	if (image->type == KEXEC_TYPE_CRASH) {
 		void *headers;
 		unsigned long headers_sz;
-		ret = prepare_elf_headers(&headers, &headers_sz);
+
+		ret = crash_prepare_elf64_headers(true, &headers, &headers_sz, NULL, NULL, NULL);
 		if (ret) {
 			pr_err("Preparing elf core header failed\n");
 			goto out;
diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
index 5cfb27f26583..3b04d2b4dee6 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -232,6 +232,15 @@ unsigned int arch_crash_get_elfcorehdr_size(void);
 #define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
 #endif
 
+#if defined(CONFIG_KEXEC_FILE) || defined(CONFIG_CRASH_HOTPLUG)
+struct crash_mem;
+int arch_get_system_nr_ranges(unsigned int *nr_ranges);
+#define arch_get_system_nr_ranges arch_get_system_nr_ranges
+
+int arch_prepare_elf64_ram_headers(struct crash_mem *cmem);
+#define arch_prepare_elf64_ram_headers arch_prepare_elf64_ram_headers
+#endif
+
 #endif /* __ASSEMBLER__ */
 
 #endif /* _ASM_X86_KEXEC_H */
diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
index 335fd2ee9766..3fbbd518604a 100644
--- a/arch/x86/kernel/crash.c
+++ b/arch/x86/kernel/crash.c
@@ -152,73 +152,15 @@ static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
 	return 0;
 }
 
-/* Gather all the required information to prepare elf headers for ram regions */
-static struct crash_mem *fill_up_crash_elf_data(void)
+int arch_get_system_nr_ranges(unsigned int *nr_ranges)
 {
-	unsigned int nr_ranges = 0;
-	struct crash_mem *cmem;
+	int ret;
 
-	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
+	ret = walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
 	if (!nr_ranges)
-		return NULL;
-
-	/*
-	 * Exclusion of crash region, crashk_low_res and/or crashk_cma_ranges
-	 * may cause range splits. So add extra slots here.
-	 *
-	 * Exclusion of low 1M may not cause another range split, because the
-	 * range of exclude is [0, 1M] and the condition for splitting a new
-	 * region is that the start, end parameters are both in a certain
-	 * existing region in cmem and cannot be equal to existing region's
-	 * start or end. Obviously, the start of [0, 1M] cannot meet this
-	 * condition.
-	 *
-	 * But in order to lest the low 1M could be changed in the future,
-	 * (e.g. [start, 1M]), add a extra slot.
-	 */
-	nr_ranges += 3 + crashk_cma_cnt;
-	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
-	if (!cmem)
-		return NULL;
-
-	cmem->max_nr_ranges = nr_ranges;
-
-	return cmem;
-}
-
-/*
- * Look for any unwanted ranges between mstart, mend and remove them. This
- * might lead to split and split ranges are put in cmem->ranges[] array
- */
-static int elf_header_exclude_ranges(struct crash_mem *cmem)
-{
-	int ret = 0;
-	int i;
-
-	/* Exclude the low 1M because it is always reserved */
-	ret = crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
-	if (ret)
-		return ret;
-
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
-	if (ret)
-		return ret;
-
-	if (crashk_low_res.end)
-		ret = crash_exclude_mem_range(cmem, crashk_low_res.start,
-					      crashk_low_res.end);
-	if (ret)
-		return ret;
-
-	for (i = 0; i < crashk_cma_cnt; ++i) {
-		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
-					      crashk_cma_ranges[i].end);
-		if (ret)
-			return ret;
-	}
+		return -ENOMEM;
 
-	return 0;
+	return ret;
 }
 
 static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
@@ -232,35 +174,9 @@ static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
 	return 0;
 }
 
-/* Prepare elf headers. Return addr and size */
-static int prepare_elf_headers(void **addr, unsigned long *sz,
-			       unsigned long *nr_mem_ranges)
+int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
 {
-	struct crash_mem *cmem;
-	int ret;
-
-	cmem = fill_up_crash_elf_data();
-	if (!cmem)
-		return -ENOMEM;
-
-	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
-	if (ret)
-		goto out;
-
-	/* Exclude unwanted mem ranges */
-	ret = elf_header_exclude_ranges(cmem);
-	if (ret)
-		goto out;
-
-	/* Return the computed number of memory ranges, for hotplug usage */
-	*nr_mem_ranges = cmem->nr_ranges;
-
-	/* By default prepare 64bit headers */
-	ret = crash_prepare_elf64_headers(cmem, IS_ENABLED(CONFIG_X86_64), addr, sz);
-
-out:
-	vfree(cmem);
-	return ret;
+	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
 }
 #endif
 
@@ -418,7 +334,8 @@ int crash_load_segments(struct kimage *image)
 				  .buf_max = ULONG_MAX, .top_down = false };
 
 	/* Prepare elf headers and add a segment */
-	ret = prepare_elf_headers(&kbuf.buffer, &kbuf.bufsz, &pnum);
+	ret = crash_prepare_elf64_headers(IS_ENABLED(CONFIG_X86_64), &kbuf.buffer,
+					  &kbuf.bufsz, &pnum, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -529,7 +446,8 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
 	 * Create the new elfcorehdr reflecting the changes to CPU and/or
 	 * memory resources.
 	 */
-	if (prepare_elf_headers(&elfbuf, &elfsz, &nr_mem_ranges)) {
+	if (crash_prepare_elf64_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz,
+					&nr_mem_ranges, NULL, NULL)) {
 		pr_err("unable to create new elfcorehdr");
 		goto out;
 	}
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index d35726d6a415..3105d28fd0c6 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -2,11 +2,14 @@
 #ifndef LINUX_CRASH_CORE_H
 #define LINUX_CRASH_CORE_H
 
-#include <linux/linkage.h>
 #include <linux/elfcore.h>
 #include <linux/elf.h>
+#include <linux/kexec.h>
+#include <linux/linkage.h>
+#include <linux/vmalloc.h>
 
 struct kimage;
+struct memory_notify;
 
 struct crash_mem {
 	unsigned int max_nr_ranges;
@@ -54,6 +57,66 @@ static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long
 }
 #endif
 
+extern int crash_exclude_mem_range(struct crash_mem *mem,
+				   unsigned long long mstart,
+				   unsigned long long mend);
+
+#ifndef arch_crash_exclude_mem_range
+static __always_inline int arch_crash_exclude_mem_range(struct crash_mem **mem_ranges,
+							unsigned long long mstart,
+							unsigned long long mend)
+{
+	return crash_exclude_mem_range(*mem_ranges, mstart, mend);
+}
+#endif
+
+#ifndef arch_get_system_nr_ranges
+static inline int arch_get_system_nr_ranges(unsigned int *nr_ranges)
+{
+	return -EINVAL;
+}
+#endif
+
+#ifndef arch_prepare_elf64_ram_headers
+static inline int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
+{
+	return -EINVAL;
+}
+#endif
+
+#ifndef arch_get_crash_memory_ranges
+static inline int arch_get_crash_memory_ranges(struct crash_mem **cmem,
+					       unsigned long *nr_mem_ranges,
+					       struct kimage *image,
+					       struct memory_notify *mn)
+{
+	unsigned int nr_ranges;
+	int ret;
+
+	/*
+	 * Exclusion of crash region, crashk_low_res and/or crashk_cma_ranges
+	 * may cause range splits. So add extra slots here.
+	 */
+	nr_ranges = 1 + (crashk_low_res.end != 0) + crashk_cma_cnt;
+	ret = arch_get_system_nr_ranges(&nr_ranges);
+	if (ret)
+		return ret;
+
+	*cmem = kvzalloc(struct_size(*cmem, ranges, nr_ranges), GFP_KERNEL);
+	if (!(*cmem))
+		return -ENOMEM;
+
+	(*cmem)->max_nr_ranges = nr_ranges;
+	ret = arch_prepare_elf64_ram_headers(*cmem);
+	if (ret) {
+		kvfree(*cmem);
+		return ret;
+	}
+
+	return 0;
+}
+#endif
+
 #ifndef crash_get_elfcorehdr_size
 static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
 #endif
@@ -61,11 +124,11 @@ static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
 /* Alignment required for elf header segment */
 #define ELF_CORE_HEADER_ALIGN   4096
 
-extern int crash_exclude_mem_range(struct crash_mem *mem,
-				   unsigned long long mstart,
-				   unsigned long long mend);
-extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
-				       void **addr, unsigned long *sz);
+extern int crash_prepare_elf64_headers(int need_kernel_map,
+				       void **addr, unsigned long *sz,
+				       unsigned long *nr_mem_ranges,
+				       struct kimage *image,
+				       struct memory_notify *mn);
 
 struct kimage;
 struct kexec_segment;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 99dac1aa972a..99a0d6abf88e 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -18,6 +18,7 @@
 #include <linux/memblock.h>
 #include <linux/kmemleak.h>
 #include <linux/crash_core.h>
+#include <linux/crash_reserve.h>
 #include <linux/reboot.h>
 #include <linux/btf.h>
 #include <linux/objtool.h>
@@ -161,19 +162,80 @@ static inline resource_size_t crash_resource_size(const struct resource *res)
 	return !res->end ? 0 : resource_size(res);
 }
 
+static int crash_exclude_mem_ranges(struct crash_mem *cmem,
+				    unsigned long *nr_mem_ranges)
+{
+	int ret, i;
+
+#if defined(CONFIG_X86_64) || defined(CONFIG_X86_32)
+	/*
+	 * Exclusion of low 1M may not cause another range split, because the
+	 * range of exclude is [0, 1M] and the condition for splitting a new
+	 * region is that the start, end parameters are both in a certain
+	 * existing region in cmem and cannot be equal to existing region's
+	 * start or end. Obviously, the start of [0, 1M] cannot meet this
+	 * condition.
+	 *
+	 * But in order to lest the low 1M could be changed in the future,
+	 * (e.g. [start, 1M]), add a extra slot.
+	 */
+	cmem->max_nr_ranges++;
 
+	/* Exclude the low 1M because it is always reserved */
+	ret = arch_crash_exclude_mem_range(&cmem, 0, SZ_1M - 1);
+	if (ret)
+		return ret;
+#endif
 
+	/* Exclude crashkernel region */
+	ret = arch_crash_exclude_mem_range(&cmem, crashk_res.start, crashk_res.end);
+	if (ret)
+		return ret;
 
-int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
-			  void **addr, unsigned long *sz)
+	if (crashk_low_res.end) {
+		ret = arch_crash_exclude_mem_range(&cmem, crashk_low_res.start, crashk_low_res.end);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		ret = arch_crash_exclude_mem_range(&cmem, crashk_cma_ranges[i].start,
+						   crashk_cma_ranges[i].end);
+		if (ret)
+			return ret;
+	}
+
+	/* Return the computed number of memory ranges, for hotplug usage */
+	if (nr_mem_ranges)
+		*nr_mem_ranges = cmem->nr_ranges;
+
+	return 0;
+}
+
+int crash_prepare_elf64_headers(int need_kernel_map, void **addr,
+				unsigned long *sz, unsigned long *nr_mem_ranges,
+				struct kimage *image, struct memory_notify *mn)
 {
-	Elf64_Ehdr *ehdr;
-	Elf64_Phdr *phdr;
 	unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
-	unsigned char *buf;
-	unsigned int cpu, i;
 	unsigned long long notes_addr;
+	struct crash_mem *mem = NULL;
 	unsigned long mstart, mend;
+	unsigned int cpu, i;
+	unsigned char *buf;
+	Elf64_Ehdr *ehdr;
+	Elf64_Phdr *phdr;
+	int ret = 0;
+
+	ret = arch_get_crash_memory_ranges(&mem, nr_mem_ranges, image, mn);
+	if (ret)
+		return ret;
+
+	if (!mem)
+		return -ENOMEM;
+
+	ret = crash_exclude_mem_ranges(mem, nr_mem_ranges);
+	if (ret)
+		goto out;
 
 	/* extra phdr for vmcoreinfo ELF note */
 	nr_phdr = nr_cpus + 1;
@@ -192,8 +254,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 	elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
 
 	buf = vzalloc(elf_sz);
-	if (!buf)
-		return -ENOMEM;
+	if (!buf) {
+		ret = -ENOMEM;
+		goto out;
+	}
 
 	ehdr = (Elf64_Ehdr *)buf;
 	phdr = (Elf64_Phdr *)(ehdr + 1);
@@ -262,7 +326,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 
 	*addr = buf;
 	*sz = elf_sz;
-	return 0;
+
+out:
+	kvfree(mem);
+	return ret;
 }
 
 /**
-- 
2.34.1


