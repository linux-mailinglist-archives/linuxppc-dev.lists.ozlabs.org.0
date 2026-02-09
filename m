Return-Path: <linuxppc-dev+bounces-16730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFseAuKviWndAgUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 10:58:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F310DE13
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Feb 2026 10:58:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f8gBg4mxPz309S;
	Mon, 09 Feb 2026 20:58:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.223
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770631131;
	cv=none; b=HqKJN5onHQWHRWSnO656nV2T7Zyp2q8eM4ASKnbHwNDU2AI8BFU2XJZLTlgSCFqB9E6wmWIuaqY+ZTJK5mJrglQVc/iTiObBz0vQFp63v6ityW9zBFkezTkZYsuyXWBzqNzUl3uY6putc5AMYSCZZwwyLNmOHJ82wz4sHgQyJYyxBnmFhGb1JMvje0Le7a2woPM2mzdUliHfAsT1oiU04i2IET+r18DKYUPxtzA/aiTMAopbe9K2K3/os8HJc8pSKjw5wzHLRceNtS7Ct0RxDCle6fkHgODpuNXg5xtaVM2U2+MIUtntn+2V0l+U7vR3gIrPThx5YzaXIxUSagih1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770631131; c=relaxed/relaxed;
	bh=UsaFWBQfDKGaGZLeq0XtdFVT9nePgxaFx9bDcW10zWw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gQwx0HKQjXTMLtoYRu1pc1/0B7Q/osnsZKkRkak0FhLtKFqgJ6DWYLjQWC4TmgNwqySZGWaGARg2edjxEm4evz8Es6vyURi3EfViQ1mpEqYK2LVNCRNpAI4J7tBDXmlsZJl/Y52frQBbGxquDc03Tp5knoJeRxHbqiNnIrlcoadrXm73vnNhBKqLqo8orACjf0mGkbN8Qqa9Cibq7QALqxhUYncKeWnp7fvqBP7wm8IpZu2pafu4taYLO3Qjk+HDd2HxooKIxJXNIdwJ1Ucw34mpizLRa1laSC/uQXoglfC2y20+I1P+oGC27Q9ZrDFUr7aphjZM3lp2VA8wMVXPqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=q/sR0UTq; dkim-atps=neutral; spf=pass (client-ip=113.46.200.223; helo=canpmsgout08.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=q/sR0UTq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.223; helo=canpmsgout08.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from canpmsgout08.his.huawei.com (canpmsgout08.his.huawei.com [113.46.200.223])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f8gBb39NFz2yGx
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Feb 2026 20:58:46 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=UsaFWBQfDKGaGZLeq0XtdFVT9nePgxaFx9bDcW10zWw=;
	b=q/sR0UTqa+zpokK/ZgXDDkaWsueO3/Rf6G833EEGudL67urGEahU6qIu/wVL3n+ekMxmGN+BM
	yvRhBVUrgYVCZ/G9Sw71WfsSAeeK4gh2omS0A/gjhuZW0W58TQODcGjYb62xe3JzMg3F89g5LNv
	+MUAvvyuPrdmc/UHMd3VQjw=
Received: from mail.maildlp.com (unknown [172.19.163.127])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4f8g566wFQzmV7b;
	Mon,  9 Feb 2026 17:54:02 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 04957402AB;
	Mon,  9 Feb 2026 17:58:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 9 Feb
 2026 17:58:38 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<rdunlap@infradead.org>, <pmladek@suse.com>, <feng.tang@linux.alibaba.com>,
	<pawan.kumar.gupta@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<arnd@arndb.de>, <lirongqing@baidu.com>, <fvdl@google.com>,
	<leitao@debian.org>, <rppt@kernel.org>, <ardb@kernel.org>, <jbohac@suse.cz>,
	<sourabhjain@linux.ibm.com>, <osandov@fb.com>, <ryan.roberts@arm.com>,
	<cfsworks@gmail.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<thuth@redhat.com>, <hbathini@linux.ibm.com>, <eajames@linux.ibm.com>,
	<bjorn@rivosinc.com>, <songshuaishuai@tinylab.org>, <kevin.brodsky@arm.com>,
	<samuel.holland@sifive.com>, <vishal.moola@gmail.com>,
	<junhui.liu@pigmoral.tech>, <dwmw@amazon.co.uk>, <pbonzini@redhat.com>,
	<thomas.lendacky@amd.com>, <kai.huang@intel.com>, <ubizjak@gmail.com>,
	<coxu@redhat.com>, <liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>,
	<brgerst@gmail.com>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
Date: Mon, 9 Feb 2026 17:59:29 +0800
Message-ID: <20260209095931.2813152-2-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209095931.2813152-1-ruanjinjie@huawei.com>
References: <20260209095931.2813152-1-ruanjinjie@huawei.com>
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
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-16730-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:pmladek@suse.com,m:feng.tang@linux.alibaba.com,m:pawan.kumar.gupta@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:arnd@arndb.de,m:lirongqing@baidu.com,m:fvdl@google.com,m:leitao@debian.org,m:rppt@kernel.org,m:ardb@kernel.org,m:jbohac@suse.cz,m:sourabhjain@linux.ibm.com,m:osandov@fb.com,m:ryan.roberts@arm.com,m:cfsworks@gmail.com,m:tangyouling@kylinos.cn,m:ritesh.list@gmail.com,m:thuth@redhat.com,m:hbathini@linux.ibm.com,m:eajames@linux.ibm.com,m:bjorn@rivosinc.com,m:songshuaishuai@tin
 ylab.org,m:kevin.brodsky@arm.com,m:samuel.holland@sifive.com,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:dwmw@amazon.co.uk,m:pbonzini@redhat.com,m:thomas.lendacky@amd.com,m:kai.huang@intel.com,m:ubizjak@gmail.com,m:coxu@redhat.com,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:brgerst@gmail.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,m:ruanjinjie@huawei.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[lwn.net,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,suse.com,linux.alibaba.com,google.com,arndb.de,baidu.com,debian.org,suse.cz,fb.com,kylinos.cn,rivosinc.com,tinylab.org,sifive.com,pigmoral.tech,amazon.co.uk,amd.com,intel.com,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[68];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.519];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:dkim,huawei.com:mid,start:email]
X-Rspamd-Queue-Id: 391F310DE13
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
  and count the actual number of ranges filled. The default implementation
  is consistent with arm64 and loongson.

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
 arch/arm64/kernel/machine_kexec_file.c     |  47 +--------
 arch/loongarch/kernel/machine_kexec_file.c |  45 +-------
 arch/powerpc/include/asm/kexec.h           |  13 +++
 arch/powerpc/kexec/crash.c                 |  52 ++++++----
 arch/powerpc/kexec/file_load_64.c          |  17 ++-
 arch/powerpc/kexec/ranges.c                |  18 +---
 arch/riscv/include/asm/kexec.h             |  10 ++
 arch/riscv/kernel/machine_kexec_file.c     |  37 ++-----
 arch/x86/include/asm/kexec.h               |  10 ++
 arch/x86/kernel/crash.c                    | 104 ++-----------------
 include/linux/crash_core.h                 | 114 +++++++++++++++++++--
 kernel/crash_core.c                        |  71 +++++++++++--
 12 files changed, 269 insertions(+), 269 deletions(-)

diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index 410060ebd86d..8a29449e992d 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -39,50 +39,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
 	return kexec_image_post_load_cleanup_default(image);
 }
 
-#ifdef CONFIG_CRASH_DUMP
-static int prepare_elf_headers(void **addr, unsigned long *sz)
-{
-	struct crash_mem *cmem;
-	unsigned int nr_ranges;
-	int ret;
-	u64 i;
-	phys_addr_t start, end;
-
-	nr_ranges = 2; /* for exclusion of crashkernel region */
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
-	if (!cmem)
-		return -ENOMEM;
-
-	cmem->max_nr_ranges = nr_ranges;
-	cmem->nr_ranges = 0;
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
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
-}
-#endif
-
 /*
  * Tries to add the initrd and DTB to the image. If it is not possible to find
  * valid locations, this function will undo changes to the image and return non
@@ -109,7 +65,8 @@ int load_other_segments(struct kimage *image,
 	void *headers;
 	unsigned long headers_sz;
 	if (image->type == KEXEC_TYPE_CRASH) {
-		ret = prepare_elf_headers(&headers, &headers_sz);
+		ret = crash_prepare_elf64_headers(true, &headers, &headers_sz,
+						  NULL, NULL, NULL);
 		if (ret) {
 			pr_err("Preparing elf core header failed\n");
 			goto out_err;
diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
index fb57026f5f25..93555b92bbeb 100644
--- a/arch/loongarch/kernel/machine_kexec_file.c
+++ b/arch/loongarch/kernel/machine_kexec_file.c
@@ -56,48 +56,6 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
 }
 
 #ifdef CONFIG_CRASH_DUMP
-
-static int prepare_elf_headers(void **addr, unsigned long *sz)
-{
-	int ret, nr_ranges;
-	uint64_t i;
-	phys_addr_t start, end;
-	struct crash_mem *cmem;
-
-	nr_ranges = 2; /* for exclusion of crashkernel region */
-	for_each_mem_range(i, &start, &end)
-		nr_ranges++;
-
-	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
-	if (!cmem)
-		return -ENOMEM;
-
-	cmem->max_nr_ranges = nr_ranges;
-	cmem->nr_ranges = 0;
-	for_each_mem_range(i, &start, &end) {
-		cmem->ranges[cmem->nr_ranges].start = start;
-		cmem->ranges[cmem->nr_ranges].end = end - 1;
-		cmem->nr_ranges++;
-	}
-
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
-}
-
 /*
  * Add the "mem=size@start" command line parameter to command line, indicating the
  * memory region the new kernel can use to boot into.
@@ -163,7 +121,8 @@ int load_other_segments(struct kimage *image,
 		void *headers;
 		unsigned long headers_sz;
 
-		ret = prepare_elf_headers(&headers, &headers_sz);
+		ret = crash_prepare_elf64_headers(true, &headers, &headers_sz,
+						  NULL, NULL, NULL);
 		if (ret < 0) {
 			pr_err("Preparing elf core header failed\n");
 			goto out_err;
diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index bd4a6c42a5f3..ec64c26ca81a 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -123,6 +123,11 @@ static inline void kdump_cma_reserve(void) { }
 #endif
 
 #if defined(CONFIG_CRASH_DUMP)
+#include <asm/kexec_ranges.h>
+
+struct crash_mem;
+struct memory_notify;
+
 /*
  * This function is responsible for capturing register states if coming
  * via panic or invoking dump using sysrq-trigger.
@@ -147,6 +152,14 @@ unsigned int arch_crash_get_elfcorehdr_size(void);
 #define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
 #endif /* CONFIG_CRASH_HOTPLUG */
 
+int arch_crash_exclude_mem_range(struct crash_mem **mem, unsigned long long mstart,
+				 unsigned long long mend);
+#define arch_crash_exclude_mem_range arch_crash_exclude_mem_range
+
+int arch_get_crash_memory_ranges(struct crash_mem **cmem, unsigned long *nr_mem_ranges,
+				 struct kimage *image, struct memory_notify *mn);
+#define arch_get_crash_memory_ranges arch_get_crash_memory_ranges
+
 extern int crashing_cpu;
 extern void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *));
 extern void crash_ipi_callback(struct pt_regs *regs);
diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
index a325c1c02f96..5ade9a853fb0 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -419,30 +419,21 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
 	return sizeof(struct elfhdr) + (phdr_cnt * sizeof(Elf64_Phdr));
 }
 
-/**
- * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it with old
- *			       elfcorehdr in the kexec segment array.
- * @image: the active struct kimage
- * @mn: struct memory_notify data handler
- */
-static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
+int arch_get_crash_memory_ranges(struct crash_mem **cmem, unsigned long *nr_mem_ranges,
+				 struct kimage *image, struct memory_notify *mn)
 {
+	unsigned long base_addr, size;
 	int ret;
-	struct crash_mem *cmem = NULL;
-	struct kexec_segment *ksegment;
-	void *ptr, *mem, *elfbuf = NULL;
-	unsigned long elfsz, memsz, base_addr, size;
 
-	ksegment = &image->segment[image->elfcorehdr_index];
-	mem = (void *) ksegment->mem;
-	memsz = ksegment->memsz;
-
-	ret = get_crash_memory_ranges(&cmem);
+	ret = get_crash_memory_ranges(cmem);
 	if (ret) {
 		pr_err("Failed to get crash mem range\n");
-		return;
+		return ret;
 	}
 
+	if (!image || !mn)
+		return 0;
+
 	/*
 	 * The hot unplugged memory is part of crash memory ranges,
 	 * remove it here.
@@ -450,14 +441,34 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
 	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
 		base_addr = PFN_PHYS(mn->start_pfn);
 		size = mn->nr_pages * PAGE_SIZE;
-		ret = remove_mem_range(&cmem, base_addr, size);
+		ret = remove_mem_range(cmem, base_addr, size);
 		if (ret) {
 			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
-			goto out;
+			return ret;
 		}
 	}
 
-	ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
+	return 0;
+}
+
+/**
+ * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it with old
+ *			       elfcorehdr in the kexec segment array.
+ * @image: the active struct kimage
+ * @mn: struct memory_notify data handler
+ */
+static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
+{
+	void *ptr, *mem, *elfbuf = NULL;
+	struct kexec_segment *ksegment;
+	unsigned long elfsz, memsz;
+	int ret;
+
+	ksegment = &image->segment[image->elfcorehdr_index];
+	mem = (void *) ksegment->mem;
+	memsz = ksegment->memsz;
+
+	ret = crash_prepare_elf64_headers(false, &elfbuf, &elfsz, NULL, image, mn);
 	if (ret) {
 		pr_err("Failed to prepare elf header\n");
 		goto out;
@@ -486,7 +497,6 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
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
index 867135560e5c..34e3058ff1d5 100644
--- a/arch/powerpc/kexec/ranges.c
+++ b/arch/powerpc/kexec/ranges.c
@@ -553,9 +553,9 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
 #endif /* CONFIG_KEXEC_FILE */
 
 #ifdef CONFIG_CRASH_DUMP
-static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
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
index b9ee8346cc8c..daee8388a26d 100644
--- a/arch/riscv/include/asm/kexec.h
+++ b/arch/riscv/include/asm/kexec.h
@@ -75,4 +75,14 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
 			unsigned long cmdline_len);
 #endif
 
+#ifdef CONFIG_CRASH_DUMP
+struct crash_mem;
+
+int arch_get_system_nr_ranges(unsigned int *nr_ranges);
+#define arch_get_system_nr_ranges arch_get_system_nr_ranges
+
+int arch_prepare_elf64_ram_headers(struct crash_mem *cmem);
+#define arch_prepare_elf64_ram_headers arch_prepare_elf64_ram_headers
+#endif
+
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
index 5cfb27f26583..9939dd8715df 100644
--- a/arch/x86/include/asm/kexec.h
+++ b/arch/x86/include/asm/kexec.h
@@ -232,6 +232,16 @@ unsigned int arch_crash_get_elfcorehdr_size(void);
 #define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
 #endif
 
+#ifdef CONFIG_CRASH_DUMP
+struct crash_mem;
+
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
index d35726d6a415..8d92cd16b625 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -2,11 +2,15 @@
 #ifndef LINUX_CRASH_CORE_H
 #define LINUX_CRASH_CORE_H
 
-#include <linux/linkage.h>
 #include <linux/elfcore.h>
 #include <linux/elf.h>
+#include <linux/kexec.h>
+#include <linux/linkage.h>
+#include <linux/memblock.h>
+#include <linux/vmalloc.h>
 
 struct kimage;
+struct memory_notify;
 
 struct crash_mem {
 	unsigned int max_nr_ranges;
@@ -54,6 +58,104 @@ static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long
 }
 #endif
 
+#ifndef arch_get_system_nr_ranges
+static inline int arch_get_system_nr_ranges(unsigned int *nr_ranges)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	for_each_mem_range(i, &start, &end)
+		(*nr_ranges)++;
+
+	return 0;
+}
+#endif
+
+#ifndef arch_prepare_elf64_ram_headers
+static inline int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
+{
+	phys_addr_t start, end;
+	u64 i;
+
+	cmem->nr_ranges = 0;
+	for_each_mem_range(i, &start, &end) {
+		cmem->ranges[cmem->nr_ranges].start = start;
+		cmem->ranges[cmem->nr_ranges].end = end - 1;
+		cmem->nr_ranges++;
+	}
+
+	for (i = 0; i < crashk_cma_cnt; i++) {
+		cmem->ranges[cmem->nr_ranges].start = crashk_cma_ranges[i].start;
+		cmem->ranges[cmem->nr_ranges].end = crashk_cma_ranges[i].end;
+		cmem->nr_ranges++;
+	}
+
+	return 0;
+}
+#endif
+
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
+#ifndef arch_get_crash_memory_ranges
+static inline int arch_get_crash_memory_ranges(struct crash_mem **cmem,
+					       unsigned long *nr_mem_ranges,
+					       struct kimage *image,
+					       struct memory_notify *mn)
+{
+	unsigned int nr_ranges;
+	int ret;
+
+#if defined(CONFIG_X86_64) || defined(CONFIG_X86_32)
+	/*
+	 * Exclusion of crash region, crashk_low_res and/or crashk_cma_ranges
+	 * may cause range splits. So add extra slots here.
+	 *
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
+	nr_ranges = 3 + crashk_cma_cnt;
+#else
+	/* For exclusion of crashkernel region*/
+	nr_ranges = 1 + (crashk_low_res.end != 0) + crashk_cma_cnt;
+#endif
+
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
@@ -61,11 +163,11 @@ static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
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
index 99dac1aa972a..39048c87d7a2 100644
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
@@ -161,19 +162,66 @@ static inline resource_size_t crash_resource_size(const struct resource *res)
 	return !res->end ? 0 : resource_size(res);
 }
 
+static int crash_exclude_mem_ranges(struct crash_mem *cmem,
+				    unsigned long *nr_mem_ranges)
+{
+	int ret, i;
+
+#if defined(CONFIG_X86_64) || defined(CONFIG_X86_32)
+	/* Exclude the low 1M because it is always reserved */
+	ret = crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
+	if (ret)
+		return ret;
+#endif
 
+	/* Exclude crashkernel region */
+	ret = arch_crash_exclude_mem_range(&cmem, crashk_res.start, crashk_res.end);
+	if (ret)
+		return ret;
+
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
 
+	/* Return the computed number of memory ranges, for hotplug usage */
+	if (nr_mem_ranges)
+		*nr_mem_ranges = cmem->nr_ranges;
 
-int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
-			  void **addr, unsigned long *sz)
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
+	if (mem) {
+		ret = crash_exclude_mem_ranges(mem, nr_mem_ranges);
+		if (ret)
+			goto out;
+	}
 
 	/* extra phdr for vmcoreinfo ELF note */
 	nr_phdr = nr_cpus + 1;
@@ -192,8 +240,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
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
@@ -262,7 +312,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
 
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


