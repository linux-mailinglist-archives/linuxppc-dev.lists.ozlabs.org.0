Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D437085CAAD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Feb 2024 23:26:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=G8c3FTHW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfYs859vKz3vjb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 09:26:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=motorola.com header.i=@motorola.com header.a=rsa-sha256 header.s=DKIM202306 header.b=G8c3FTHW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=motorola.com (client-ip=148.163.148.104; helo=mx0a-00823401.pphosted.com; envelope-from=mbland@motorola.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 242 seconds by postgrey-1.37 at boromir; Wed, 21 Feb 2024 07:37:32 AEDT
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfWRw41dzz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 07:37:31 +1100 (AEDT)
Received: from pps.filterd (m0355088.ppops.net [127.0.0.1])
	by m0355088.ppops.net (8.17.1.24/8.17.1.24) with ESMTP id 41KJD1Po003877;
	Tue, 20 Feb 2024 20:33:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=motorola.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	DKIM202306; bh=bbMfJLfH6G5a4s+Z0cFe2wOzrCFA0lQFMo+SQbxfAvI=; b=G
	8c3FTHWyfPhIWnn3QaQguVptC48Uy9lbb+BcoCWa1nlQvoc+woWLCowBjoFNI/ix
	dF3dTPLkKuRe51BCEWpmjjyoWUwOEeG1JP3K+L03xl7q88Lz8LruYRC/RRB3CTwB
	VoNx/lEOcTE6WiCIHXgg5dkPsrrUKhnkMwA9g0o57GM1rcm1QJ1bJzqn4LBPaSvJ
	5aZqXa8byiN8r8QcOQjWXqu7qO8ypNwY4E1F+FiRQQ8X2r4skIxi7eqpl2aUyNPQ
	uI7mEb5ULBOlIP5YUGkeqB8pHq9Ly3Cnsty72nkRlu5/CiR5/fmbdecAA2NZSgUu
	DRWYGLwsYmIHKfHyKYEXQ==
Received: from va32lpfpp03.lenovo.com ([104.232.228.23])
	by m0355088.ppops.net (PPS) with ESMTPS id 3wd21x05ua-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Feb 2024 20:33:22 +0000 (GMT)
Received: from ilclmmrp01.lenovo.com (ilclmmrp01.mot.com [100.65.83.165])
	(using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by va32lpfpp03.lenovo.com (Postfix) with ESMTPS id 4TfWM54k8jz4ygs4;
	Tue, 20 Feb 2024 20:33:21 +0000 (UTC)
Received: from ilclasset01.mot.com (ilclasset01.mot.com [100.64.7.105])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: mbland)
	by ilclmmrp01.lenovo.com (Postfix) with ESMTPSA id 4TfWM52tFkz3n3fr;
	Tue, 20 Feb 2024 20:33:21 +0000 (UTC)
From: Maxwell Bland <mbland@motorola.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/4] arm64: separate code and data virtual memory allocation
Date: Tue, 20 Feb 2024 14:32:55 -0600
Message-Id: <20240220203256.31153-4-mbland@motorola.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240220203256.31153-1-mbland@motorola.com>
References: <20240220203256.31153-1-mbland@motorola.com>
X-Proofpoint-ORIG-GUID: FwETS-WEm85ynHN23cNJXJC1VUZpgnFr
X-Proofpoint-GUID: FwETS-WEm85ynHN23cNJXJC1VUZpgnFr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-20_06,2024-02-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1015 suspectscore=0 phishscore=0 mlxscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2402200146
X-Mailman-Approved-At: Wed, 21 Feb 2024 09:21:41 +1100
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: mark.rutland@arm.com, linux-efi@vger.kernel.org, david@redhat.com, catalin.marinas@arm.com, dave.hansen@linux.intel.com, ast@kernel.org, linux@armlinux.org.uk, linux-mm@kvack.org, ryabinin.a.a@gmail.com, glider@google.com, kasan-dev@googlegroups.com, yonghong.song@linux.dev, wuqiang.matt@bytedance.com, agordeev@linux.ibm.com, vincenzo.frascino@arm.com, will@kernel.org, ardb@kernel.org, michael.christie@oracle.com, quic_nprakash@quicinc.com, linux-arch@vger.kernel.org, hch@infradead.org, gor@linux.ibm.com, daniel@iogearbox.net, mst@redhat.com, john.fastabend@gmail.com, andrii@kernel.org, aneesh.kumar@kernel.org, urezki@gmail.com, samitolvanen@google.com, zlim.lnx@gmail.com, naveen.n.rao@linux.ibm.com, dennis@kernel.org, borntraeger@linux.ibm.com, cl@linux.com, aou@eecs.berkeley.edu, ryan.roberts@arm.com, arnd@arndb.de, linux-s390@vger.kernel.org, hca@linux.ibm.com, mbland@motorola.com, npiggin@gmail.com, kpsingh@kernel.org, meted@linux.ibm.com, quic_pkondeti@quicinc.com, paul.walm
 sley@sifive.com, surenb@google.com, akpm@linux-foundation.org, dvyukov@google.com, andreyknvl@gmail.com, haoluo@google.com, brauner@kernel.org, mjguzik@gmail.com, lstoakes@gmail.com, song@kernel.org, gregkh@linuxfoundation.org, muchun.song@linux.dev, linux-kernel@vger.kernel.org, awheeler@motorola.com, martin.lau@linux.dev, linux-riscv@lists.infradead.org, palmer@dabbelt.com, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, guoren@kernel.org, bpf@vger.kernel.org, rick.p.edgecombe@intel.com, linuxppc-dev@lists.ozlabs.org, sdf@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Current BPF and kprobe instruction allocation interfaces do not match
the base kernel and intermingle code and data pages within the same
sections. In the case of BPF, this appears to be a result of code
duplication between the kernel's JIT compiler and arm64's JIT.  However,
This is no longer necessary given the possibility of overriding vmalloc
wrapper functions.

arm64's vmalloc_node routines now include a layer of indirection which
splits the vmalloc region into two segments surrounding the middle
module_alloc region determined by ASLR. To support this,
code_region_start and code_region_end are defined to match the 2GB
boundary chosen by the kernel module ASLR initialization routine.

The result is a large benefits to overall kernel security, as code pages
now remain protected by this ASLR routine and protections can be defined
linearly for code regions rather than through PTE-level tracking.

Signed-off-by: Maxwell Bland <mbland@motorola.com>
---
 arch/arm64/include/asm/vmalloc.h   |  3 ++
 arch/arm64/kernel/module.c         |  7 ++++
 arch/arm64/kernel/probes/kprobes.c |  2 +-
 arch/arm64/mm/Makefile             |  3 +-
 arch/arm64/mm/vmalloc.c            | 57 ++++++++++++++++++++++++++++++
 arch/arm64/net/bpf_jit_comp.c      |  5 +--
 6 files changed, 73 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/mm/vmalloc.c

diff --git a/arch/arm64/include/asm/vmalloc.h b/arch/arm64/include/asm/vmalloc.h
index 38fafffe699f..dbcf8ad20265 100644
--- a/arch/arm64/include/asm/vmalloc.h
+++ b/arch/arm64/include/asm/vmalloc.h
@@ -31,4 +31,7 @@ static inline pgprot_t arch_vmap_pgprot_tagged(pgprot_t prot)
 	return pgprot_tagged(prot);
 }
 
+extern unsigned long code_region_start __ro_after_init;
+extern unsigned long code_region_end __ro_after_init;
+
 #endif /* _ASM_ARM64_VMALLOC_H */
diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
index dd851297596e..c4fe753a71a9 100644
--- a/arch/arm64/kernel/module.c
+++ b/arch/arm64/kernel/module.c
@@ -29,6 +29,10 @@
 static u64 module_direct_base __ro_after_init = 0;
 static u64 module_plt_base __ro_after_init = 0;
 
+/* For pre-init vmalloc, assume the worst-case code range */
+unsigned long code_region_start __ro_after_init = (u64) (_end - SZ_2G);
+unsigned long code_region_end __ro_after_init = (u64) (_text + SZ_2G);
+
 /*
  * Choose a random page-aligned base address for a window of 'size' bytes which
  * entirely contains the interval [start, end - 1].
@@ -101,6 +105,9 @@ static int __init module_init_limits(void)
 		module_plt_base = random_bounding_box(SZ_2G, min, max);
 	}
 
+	code_region_start = module_plt_base;
+	code_region_end = module_plt_base + SZ_2G;
+
 	pr_info("%llu pages in range for non-PLT usage",
 		module_direct_base ? (SZ_128M - kernel_size) / PAGE_SIZE : 0);
 	pr_info("%llu pages in range for PLT usage",
diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
index 70b91a8c6bb3..c9e109d6c8bc 100644
--- a/arch/arm64/kernel/probes/kprobes.c
+++ b/arch/arm64/kernel/probes/kprobes.c
@@ -131,7 +131,7 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
 
 void *alloc_insn_page(void)
 {
-	return __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
+	return __vmalloc_node_range(PAGE_SIZE, 1, code_region_start, code_region_end,
 			GFP_KERNEL, PAGE_KERNEL_ROX, VM_FLUSH_RESET_PERMS,
 			NUMA_NO_NODE, __builtin_return_address(0));
 }
diff --git a/arch/arm64/mm/Makefile b/arch/arm64/mm/Makefile
index dbd1bc95967d..730b805d8388 100644
--- a/arch/arm64/mm/Makefile
+++ b/arch/arm64/mm/Makefile
@@ -2,7 +2,8 @@
 obj-y				:= dma-mapping.o extable.o fault.o init.o \
 				   cache.o copypage.o flush.o \
 				   ioremap.o mmap.o pgd.o mmu.o \
-				   context.o proc.o pageattr.o fixmap.o
+				   context.o proc.o pageattr.o fixmap.o \
+				   vmalloc.o
 obj-$(CONFIG_HUGETLB_PAGE)	+= hugetlbpage.o
 obj-$(CONFIG_PTDUMP_CORE)	+= ptdump.o
 obj-$(CONFIG_PTDUMP_DEBUGFS)	+= ptdump_debugfs.o
diff --git a/arch/arm64/mm/vmalloc.c b/arch/arm64/mm/vmalloc.c
new file mode 100644
index 000000000000..b6d2fa841f90
--- /dev/null
+++ b/arch/arm64/mm/vmalloc.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/vmalloc.h>
+#include <linux/mm.h>
+
+static void *__vmalloc_node_range_split(unsigned long size, unsigned long align,
+			unsigned long start, unsigned long end,
+			unsigned long exclusion_start, unsigned long exclusion_end, gfp_t gfp_mask,
+			pgprot_t prot, unsigned long vm_flags, int node,
+			const void *caller)
+{
+	void *res = NULL;
+
+	res = __vmalloc_node_range(size, align, start, exclusion_start,
+				gfp_mask, prot, vm_flags, node, caller);
+	if (!res)
+		res = __vmalloc_node_range(size, align, exclusion_end, end,
+				gfp_mask, prot, vm_flags, node, caller);
+
+	return res;
+}
+
+void *__vmalloc_node(unsigned long size, unsigned long align,
+			    gfp_t gfp_mask, unsigned long vm_flags, int node,
+			    const void *caller)
+{
+	return __vmalloc_node_range_split(size, align, VMALLOC_START,
+				VMALLOC_END, code_region_start, code_region_end,
+				gfp_mask, PAGE_KERNEL, vm_flags, node, caller);
+}
+
+void *vmalloc_huge(unsigned long size, gfp_t gfp_mask)
+{
+	return __vmalloc_node_range_split(size, 1, VMALLOC_START, VMALLOC_END,
+				code_region_start, code_region_end,
+				gfp_mask, PAGE_KERNEL, VM_ALLOW_HUGE_VMAP,
+				NUMA_NO_NODE, __builtin_return_address(0));
+}
+
+void *vmalloc_user(unsigned long size)
+{
+	return __vmalloc_node_range_split(size, SHMLBA,  VMALLOC_START, VMALLOC_END,
+				code_region_start, code_region_end,
+				GFP_KERNEL | __GFP_ZERO, PAGE_KERNEL,
+				VM_USERMAP, NUMA_NO_NODE,
+				__builtin_return_address(0));
+}
+
+void *vmalloc_32_user(unsigned long size)
+{
+	return __vmalloc_node_range_split(size, SHMLBA,  VMALLOC_START, VMALLOC_END,
+				code_region_start, code_region_end,
+				GFP_VMALLOC32 | __GFP_ZERO, PAGE_KERNEL,
+				VM_USERMAP, NUMA_NO_NODE,
+				__builtin_return_address(0));
+}
+
diff --git a/arch/arm64/net/bpf_jit_comp.c b/arch/arm64/net/bpf_jit_comp.c
index 8955da5c47cf..40426f3a9bdf 100644
--- a/arch/arm64/net/bpf_jit_comp.c
+++ b/arch/arm64/net/bpf_jit_comp.c
@@ -13,6 +13,7 @@
 #include <linux/memory.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
+#include <linux/moduleloader.h>
 
 #include <asm/asm-extable.h>
 #include <asm/byteorder.h>
@@ -1690,12 +1691,12 @@ u64 bpf_jit_alloc_exec_limit(void)
 void *bpf_jit_alloc_exec(unsigned long size)
 {
 	/* Memory is intended to be executable, reset the pointer tag. */
-	return kasan_reset_tag(vmalloc(size));
+	return kasan_reset_tag(module_alloc(size));
 }
 
 void bpf_jit_free_exec(void *addr)
 {
-	return vfree(addr);
+	return module_memfree(addr);
 }
 
 /* Indicate the JIT backend supports mixing bpf2bpf and tailcalls. */
-- 
2.39.2

