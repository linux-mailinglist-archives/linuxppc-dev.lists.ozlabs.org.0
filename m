Return-Path: <linuxppc-dev+bounces-17486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AG+LBfAJpWky0AUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 04:54:24 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E06E1D2C85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 04:54:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPQ5v6svzz3c9j;
	Mon, 02 Mar 2026 14:53:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.216
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772423635;
	cv=none; b=MdImfxQay6ynkdukM9yiAfX1C/RkFUPuboxjVJ6S0tn68ApNUIS1cqGdtv3ZxNWjQe4jqfLNYHiv1gZfLg5gPl/IdmpDah6/P4Rvpw2GLCiDA9aCTNUNxjTLG5cHjVGWLY6E3Gnr3hY7lIAH9SjsqQwVEA+q9ReSFVUgIibflYkWvj1p7JqPIRwh4/I8+pzFEZ5t9YZ6EqR8JShtlMpf+B0qaZ3lrdGNQinXC16wX6v+EM/dsmjg9xx9ZQYLQdd61GM5Ys56czONyAcBOqif/TgMoDBnK2f5g8EFM6q7n5hcOQtpmm7j0seRXSZxswghDPnlm5SKabm2k89UQzS4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772423635; c=relaxed/relaxed;
	bh=k8s7sWUeIumSRdyN37vrcqKhTj67JVNAlPnWRgZl5yI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HCzBCQffXmKIryE558yfX0FhQqynaSGR6BP3A+ummdH96j4gQHraVyYv6Mdg2rjBbvvmfUk2ioWD5gjmM7WDNr034mmOrVpbLzixxDKGUKFBPaTI8Dpy7//2Qjquu2UCGHRHqSJKiqIA0FoRIQlpaGzAQVKlagyoL0JkG/Kxi8IWaL2NXsdaBTPGeit+Of4cAJBcF74SEDQm+GRbth/uxWIdwgmldDVBgAwpNgaluGf6ZNMhhHTrqZ1hPeTog68K5H3opgE3/1N9MHeBCjHXCaZjjuNRwU0NFqxjQgTZUUYwjPxLwejRUcCxXsnxOKImvMT/HpZIPFzmvjkPGfNYlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6ElkgikE; dkim-atps=neutral; spf=pass (client-ip=113.46.200.216; helo=canpmsgout01.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=6ElkgikE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.216; helo=canpmsgout01.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from canpmsgout01.his.huawei.com (canpmsgout01.his.huawei.com [113.46.200.216])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPQ5t63KZz3bhq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 14:53:54 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=k8s7sWUeIumSRdyN37vrcqKhTj67JVNAlPnWRgZl5yI=;
	b=6ElkgikEZ/vz6lGd2d8Hi65EczFJ5BuYqAG/cR6uHlmF93k5wGX4SQ7JlS1PM1flAsSBFY1P4
	abFOuPIM+zmOUy9YZBMlU7l0HnKXjwKY/0EGrHkwBevOJz+NryhtLTCFS/oYKEq7xwtBMIdpLRK
	g8/yMrjJCbP3CwCK34Ihj04=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fPPzz6lVLz1T4G5;
	Mon,  2 Mar 2026 11:48:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6F5FE40363;
	Mon,  2 Mar 2026 11:53:46 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Mar
 2026 11:53:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <robh@kernel.org>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <vgoyal@redhat.com>,
	<dyoung@redhat.com>, <rdunlap@infradead.org>, <pmladek@suse.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <paulmck@kernel.org>,
	<lirongqing@baidu.com>, <fvdl@google.com>, <rppt@kernel.org>,
	<ardb@kernel.org>, <leitao@debian.org>, <sourabhjain@linux.ibm.com>,
	<jbohac@suse.cz>, <cfsworks@gmail.com>, <osandov@fb.com>,
	<tangyouling@kylinos.cn>, <ritesh.list@gmail.com>, <hbathini@linux.ibm.com>,
	<eajames@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<kevin.brodsky@arm.com>, <samuel.holland@sifive.com>,
	<vishal.moola@gmail.com>, <junhui.liu@pigmoral.tech>, <coxu@redhat.com>,
	<liaoyuanhong@vivo.com>, <fuqiang.wang@easystack.cn>, <brgerst@gmail.com>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v8 3/5] crash: Use crash_exclude_core_ranges() on powerpc
Date: Mon, 2 Mar 2026 11:53:13 +0800
Message-ID: <20260302035315.3892241-4-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260302035315.3892241-1-ruanjinjie@huawei.com>
References: <20260302035315.3892241-1-ruanjinjie@huawei.com>
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
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_NONE(0.00)[];
	TAGGED_FROM(0.00)[bounces-17486-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:pmladek@suse.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:paulmck@kernel.org,m:lirongqing@baidu.com,m:fvdl@google.com,m:rppt@kernel.org,m:ardb@kernel.org,m:leitao@debian.org,m:sourabhjain@linux.ibm.com,m:jbohac@suse.cz,m:cfsworks@gmail.com,m:osandov@fb.com,m:tangyouling@kylinos.cn,m:ritesh.list@gmail.com,m:hbathini@linux.ibm.com,m:eajames@linux.ibm.com,m:songshuaishuai@tinylab.org,m:kevin.brodsky@arm.com,m:samuel.hol
 land@sifive.com,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:coxu@redhat.com,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:brgerst@gmail.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,m:ruanjinjie@huawei.com,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_TO(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,suse.com,baidu.com,google.com,debian.org,suse.cz,fb.com,kylinos.cn,tinylab.org,sifive.com,pigmoral.tech,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_GT_50(0.00)[62];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,huawei.com:mid,huawei.com:dkim,huawei.com:email]
X-Rspamd-Queue-Id: 1E06E1D2C85
X-Rspamd-Action: no action

The crash memory exclude of crashk_res and crashk_cma memory on powerpc
are almost identical to the generic crash_exclude_core_ranges().

By introducing the architecture-specific arch_crash_exclude_mem_range()
function with a default implementation of crash_exclude_mem_range(),
and using crash_exclude_mem_range_guarded as powerpc's separate
implementation, the generic crash_exclude_core_ranges() helper function
can be reused.

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/powerpc/include/asm/kexec_ranges.h |  3 ---
 arch/powerpc/kexec/crash.c              |  2 +-
 arch/powerpc/kexec/ranges.c             | 16 ++++------------
 include/linux/crash_core.h              |  4 ++++
 kernel/crash_core.c                     | 19 +++++++++++++------
 5 files changed, 22 insertions(+), 22 deletions(-)

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
index 898742a5205c..e59e909c369d 100644
--- a/arch/powerpc/kexec/crash.c
+++ b/arch/powerpc/kexec/crash.c
@@ -451,7 +451,7 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
 		base_addr = PFN_PHYS(mn->start_pfn);
 		size = mn->nr_pages * PAGE_SIZE;
 		end = base_addr + size - 1;
-		ret = crash_exclude_mem_range_guarded(&cmem, base_addr, end);
+		ret = arch_crash_exclude_mem_range(&cmem, base_addr, end);
 		if (ret) {
 			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
 			goto out;
diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
index 6c58bcc3e130..e5fea23b191b 100644
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
 
@@ -604,18 +604,10 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
 			sort_memory_ranges(*mem_ranges, true);
 	}
 
-	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
+	ret = crash_exclude_core_ranges(mem_ranges);
 	if (ret)
 		goto out;
 
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
diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
index 033b20204aca..dbec826dc53b 100644
--- a/include/linux/crash_core.h
+++ b/include/linux/crash_core.h
@@ -68,6 +68,7 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
 				       void **addr, unsigned long *sz);
 extern int crash_prepare_headers(int need_kernel_map, void **addr,
 				 unsigned long *sz, unsigned long *nr_mem_ranges);
+extern int crash_exclude_core_ranges(struct crash_mem **cmem);
 
 struct kimage;
 struct kexec_segment;
@@ -88,6 +89,9 @@ extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
 extern unsigned int arch_get_system_nr_ranges(void);
 extern int arch_crash_populate_cmem(struct crash_mem *cmem);
 extern int arch_crash_exclude_ranges(struct crash_mem *cmem);
+extern int arch_crash_exclude_mem_range(struct crash_mem **mem,
+					unsigned long long mstart,
+					unsigned long long mend);
 
 #else /* !CONFIG_CRASH_DUMP*/
 struct pt_regs;
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 96a96e511f5a..300d44ad5471 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -287,24 +287,31 @@ unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
 int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
 int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
 
-static int crash_exclude_core_ranges(struct crash_mem *cmem)
+int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
+					unsigned long long mstart,
+					unsigned long long mend)
+{
+	return crash_exclude_mem_range(*mem, mstart, mend);
+}
+
+int crash_exclude_core_ranges(struct crash_mem **cmem)
 {
 	int ret, i;
 
 	/* Exclude crashkernel region */
-	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
+	ret = arch_crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
 	if (ret)
 		return ret;
 
 	if (crashk_low_res.end) {
-		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
+		ret = arch_crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
 		if (ret)
 			return ret;
 	}
 
 	for (i = 0; i < crashk_cma_cnt; ++i) {
-		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
-					      crashk_cma_ranges[i].end);
+		ret = arch_crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
+						   crashk_cma_ranges[i].end);
 		if (ret)
 			return ret;
 	}
@@ -331,7 +338,7 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
 	if (ret)
 		goto out;
 
-	ret = crash_exclude_core_ranges(cmem);
+	ret = crash_exclude_core_ranges(&cmem);
 	if (ret)
 		goto out;
 
-- 
2.34.1


