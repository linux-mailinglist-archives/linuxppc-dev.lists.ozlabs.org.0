Return-Path: <linuxppc-dev+bounces-16576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id xyQMFz4Tg2nBhQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 10:37:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5CAE3ECB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Feb 2026 10:37:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f5Zxg2rnXz2yFd;
	Wed, 04 Feb 2026 20:36:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770197815;
	cv=none; b=cbWgoeqJO9ObZbv47JVXLgsSEofWcIfMfOzG592uMfQK7HWRIvlw8ggh3n9Jd8DuUG2x82Jd8H3xLW+xwJH5KDLXr/5h+aZBWkV5mfPrG3YfJrSY9PYdAX2lJshY59NCNNfo6cg3afCIACWy1Lykmxfs3ZS5/hwaXvBtCT44c+2hHLCm3oyGPf7VlPKxpLitjEb+STNLvEB2ZhCU7QTty9A/KJq4yY7C4J0DJJ2NCtBctvXGbnqYSxjJLNk/L1mKk5/fSGcZN/LKBrpTtLpb6+9zrlzo+PKEbLy8X9wYlIVRdJLmEQEnpZonNifsURWf2qqZ3I6JNqUvkGLVDwmKIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770197815; c=relaxed/relaxed;
	bh=9dh41FuXoskin5kEyP/EzKDXWLppsq5+vDzuAG9frAc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Dwy8C1Hr32iNph88ip0cwbckL6zPgcuf3lCSR5iJTAaFVL5FLAT24lxNOrQPh/BayugB16MFgJ5GQTehgNfvaAutMjPUUFFXCmpPfaJgvqfKD5K4YyqJxtzLTn3YnkROwqVhFxvrE4TDVBqPV/1utp2e86KfsFZxzrua5PF5WLblsLTBzvJtf03+T1vqqiUQJyRw6fTSWO+LwUSX/Om8zUDDf/1Ba19thtyunMcwy9mEW1ScRFHz4rS0MJRlOQ28GVBwLTteNZhgh9sIZq/LIL1FSg08Oe2gzda3MSC74GsA0XHMwZDrowd9qreMubYk+4b8jK/aARm4vUO5tfNrfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O05tgehu; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O05tgehu; dkim-atps=neutral; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O05tgehu;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=O05tgehu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f5Zxd45HXz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Feb 2026 20:36:53 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9dh41FuXoskin5kEyP/EzKDXWLppsq5+vDzuAG9frAc=;
	b=O05tgehusLXxCPdoMc3HuZGiKmyI7zPSArAukVtx29XJeeSPz6a9SN/2YFTXxU1lSlAJ79XK1
	K0hTPthQMZ92VIfFMbzLuF5PiVF+fIshLc7csCP+lx0p4fKMolwvRJCvTP4q8HxXlOf5doEOqux
	NH1bTdersZfl51BebkcMNZM=
Received: from canpmsgout01.his.huawei.com (unknown [172.19.92.178])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4f5Zwk4JSmz1BGCs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Feb 2026 17:36:06 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=9dh41FuXoskin5kEyP/EzKDXWLppsq5+vDzuAG9frAc=;
	b=O05tgehusLXxCPdoMc3HuZGiKmyI7zPSArAukVtx29XJeeSPz6a9SN/2YFTXxU1lSlAJ79XK1
	K0hTPthQMZ92VIfFMbzLuF5PiVF+fIshLc7csCP+lx0p4fKMolwvRJCvTP4q8HxXlOf5doEOqux
	NH1bTdersZfl51BebkcMNZM=
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f5ZrP1l8Wz1T4fn;
	Wed,  4 Feb 2026 17:32:21 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E0B5404AD;
	Wed,  4 Feb 2026 17:36:43 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 4 Feb
 2026 17:36:40 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <corbet@lwn.net>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<alex@ghiti.fr>, <tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<kees@kernel.org>, <elver@google.com>, <arnd@arndb.de>,
	<lirongqing@baidu.com>, <fvdl@google.com>, <leitao@debian.org>,
	<rppt@kernel.org>, <cfsworks@gmail.com>, <osandov@fb.com>,
	<sourabhjain@linux.ibm.com>, <ardb@kernel.org>, <ryan.roberts@arm.com>,
	<tangyouling@kylinos.cn>, <ritesh.list@gmail.com>, <bjorn@rivosinc.com>,
	<songshuaishuai@tinylab.org>, <samuel.holland@sifive.com>,
	<kevin.brodsky@arm.com>, <junhui.liu@pigmoral.tech>,
	<vishal.moola@gmail.com>, <coxu@redhat.com>, <jbohac@suse.cz>,
	<liaoyuanhong@vivo.com>, <brgerst@gmail.com>, <fuqiang.wang@easystack.cn>,
	<x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v3 2/3] arm64: kexec: Add support for crashkernel CMA reservation
Date: Wed, 4 Feb 2026 17:37:27 +0800
Message-ID: <20260204093728.1447527-3-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260204093728.1447527-1-ruanjinjie@huawei.com>
References: <20260204093728.1447527-1-ruanjinjie@huawei.com>
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
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16576-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lwn.net,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,linux.alibaba.com,google.com,arndb.de,baidu.com,debian.org,fb.com,kylinos.cn,rivosinc.com,tinylab.org,sifive.com,pigmoral.tech,suse.cz,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:corbet@lwn.net,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:pawan.kumar.gupta@linux.intel.com,m:feng.tang@linux.alibaba.com,m:kees@kernel.org,m:elver@google.com,m:arnd@arndb.de,m:lirongqing@baidu.com,m:fvdl@google.com,m:leitao@debian.org,m:rppt@kernel.org,m:cfsworks@gmail.com,m:osandov@fb.com,m:sourabhjain@linux.ibm.com,m:ardb@kernel.org,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:ritesh.list@gmail.com,m:bjorn@rivosinc.com,m:songshuaishuai@tinylab.org,m:samuel.holland@sifive.com,m:kevin.brodsky@arm.com,m:junhui.liu@pigmoral.tech,m:vishal.moola@gmail.com,m:coxu@redhat.c
 om,m:jbohac@suse.cz,m:liaoyuanhong@vivo.com,m:brgerst@gmail.com,m:fuqiang.wang@easystack.cn,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,m:ruanjinjie@huawei.com,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_GT_50(0.00)[58];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:dkim,huawei.com:mid]
X-Rspamd-Queue-Id: AE5CAE3ECB
X-Rspamd-Action: no action

Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
crashkernel= command line option") and commit ab475510e042 ("kdump:
implement reserve_crashkernel_cma") added CMA support for kdump
crashkernel reservation.

Crash kernel memory reservation wastes production resources if too
large, risks kdump failure if too small, and faces allocation difficulties
on fragmented systems due to contiguous block constraints. The new
CMA-based crashkernel reservation scheme splits the "large fixed
reservation" into a "small fixed region + large CMA dynamic region": the
CMA memory is available to userspace during normal operation to avoid
waste, and is reclaimed for kdump upon crash—saving memory while
improving reliability.

So extend crashkernel CMA reservation support to arm64. The following
changes are made to enable CMA reservation:

- Parse and obtain the CMA reservation size along with other crashkernel
  parameters.
- Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
- Include the CMA-reserved ranges for kdump kernel to use.
- Exclude the CMA-reserved ranges from the crash kernel memory to
  prevent them from being exported through /proc/vmcore, which is already
  done in the crash core.

Update kernel-parameters.txt to document CMA support for crashkernel on
arm64 architecture.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v3:
- Add Acked-by.
v2:
- Free cmem in prepare_elf_headers()
- Add the mtivation.
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 arch/arm64/kernel/machine_kexec_file.c          | 8 +++++++-
 arch/arm64/mm/init.c                            | 5 +++--
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1058f2a6d6a8..36bb642a7edd 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -1119,7 +1119,7 @@ Kernel parameters
 			It will be ignored when crashkernel=X,high is not used
 			or memory reserved is below 4G.
 	crashkernel=size[KMG],cma
-			[KNL, X86, ppc] Reserve additional crash kernel memory from
+			[KNL, X86, ARM64, ppc] Reserve additional crash kernel memory from
 			CMA. This reservation is usable by the first system's
 			userspace memory and kernel movable allocations (memory
 			balloon, zswap). Pages allocated from this memory range
diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
index ed2c45007158..cab4aaf8cb22 100644
--- a/arch/arm64/kernel/machine_kexec_file.c
+++ b/arch/arm64/kernel/machine_kexec_file.c
@@ -48,7 +48,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 	u64 i;
 	phys_addr_t start, end;
 
-	nr_ranges = 2; /* for exclusion of crashkernel region */
+	nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
 	for_each_mem_range(i, &start, &end)
 		nr_ranges++;
 
@@ -64,6 +64,12 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
 		cmem->nr_ranges++;
 	}
 
+	for (i = 0; i < crashk_cma_cnt; i++) {
+		cmem->ranges[cmem->nr_ranges].start = crashk_cma_ranges[i].start;
+		cmem->ranges[cmem->nr_ranges].end = crashk_cma_ranges[i].end;
+		cmem->nr_ranges++;
+	}
+
 	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
 
 	kfree(cmem);
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index 524d34a0e921..28165d94af08 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -96,8 +96,8 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
 
 static void __init arch_reserve_crashkernel(void)
 {
+	unsigned long long crash_base, crash_size, cma_size = 0;
 	unsigned long long low_size = 0;
-	unsigned long long crash_base, crash_size;
 	bool high = false;
 	int ret;
 
@@ -106,11 +106,12 @@ static void __init arch_reserve_crashkernel(void)
 
 	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
 				&crash_size, &crash_base,
-				&low_size, NULL, &high);
+				&low_size, &cma_size, &high);
 	if (ret)
 		return;
 
 	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
+	reserve_crashkernel_cma(cma_size);
 }
 
 static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
-- 
2.34.1


