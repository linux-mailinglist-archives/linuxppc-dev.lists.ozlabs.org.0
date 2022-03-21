Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D56DD4E21B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 09:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMS004kQwz3bhJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 19:07:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FFVW+rZO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMRx01bFLz3036
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FFVW+rZO; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KMRx01Nmkz4xc5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 19:04:52 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KMRx01LNQz4xcq; Mon, 21 Mar 2022 19:04:52 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FFVW+rZO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KMRwz5TlVz4xc5
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Mar 2022 19:04:51 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22L3fpbb023054; 
 Mon, 21 Mar 2022 08:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=USERgPXACH7Lf6iODvMCyZd7dc7g+MBa7tzsJLLfmCY=;
 b=FFVW+rZOP5LbQTZU5Cl3VJ/aWdHhgS/sZ0qqBU1tS5BHHAdp1EdT6ALQd1iq7DSZn/W+
 MoA7ymzIF5gFN4Cxh8Q3KEwhy06APwLrt6CbXqOPkQKRk5LjT36F8FXl03HtC+3GtNxg
 hd5zHlPYA1NXQXngEWqh/UKqbbqH6rTiREF9B0pyDtwXEjvhlPQRjd0idS/eWNYUx7iO
 CS7ylhff4UuRZ1cuDa1Dok1VYAQCevps7OEXSSx9fa0mMAE5FsGW2cEYcU7ZewtNx+Xm
 puKsC3yD7kaW63FtHUPicbK/zTGc4cVJs03KvJsUI1HSSXlDB/Mjr8/nPNLC0xNtZl9o lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exhpcm9x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:42 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22L7wWXl007780;
 Mon, 21 Mar 2022 08:04:42 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exhpcm9wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:42 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22L7w82E013256;
 Mon, 21 Mar 2022 08:04:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 3ew6ehtwn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 08:04:40 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22L84cKP36110600
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 08:04:38 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 22C0952050;
 Mon, 21 Mar 2022 08:04:38 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.117.210])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9BBC85204E;
 Mon, 21 Mar 2022 08:04:35 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC v3 PATCH 4/5] powerpc/crash hp: add crash hotplug support for
 kexec_file_load
Date: Mon, 21 Mar 2022 13:34:21 +0530
Message-Id: <20220321080422.56255-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: N7nmf6KZqk-i7ZWesl2VcDcqcsdUk0mq
X-Proofpoint-GUID: N9sy2TryKeRS-xK_k1yjgz3Wn0EqiZq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_02,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 suspectscore=0
 spamscore=0 impostorscore=0 phishscore=0 adultscore=0 mlxscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203210049
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com,
 kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Two major changes are done to enable the crash CPU hotplug handler.
Firstly, updated the kexec_load path to prepare kimage for hotplug
changes and secondly, implemented the crash hotplug handler itself.

On the kexec load path, memsz allocation of crash FDT segment is
updated to ensure that it has sufficient buffer space to accommodate
future hot add CPUs. Initialized the kimage members to track the FDT
segment.

The crash hotplug handler updates the cpus node of crash FDT. While
we update crash FDT the kexec_crash_image is marked invalid and restored
after FDT update to avoid race.

Since memory crash hotplug support is not there yet the crash hotplug
handler simply warn the user and return.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/core_64.c | 46 ++++++++++++++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c  | 40 +++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 249d2632526d..a470fe6904e3 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -466,6 +466,52 @@ int update_cpus_node(void *fdt)
 	return ret;
 }
 
+#ifdef CONFIG_CRASH_HOTPLUG
+/**
+ * arch_crash_hotplug_handler() - Handle hotplug FDT changes
+ * @image: the active struct kimage
+ * @hp_action: the hot un/plug action being handled
+ * @a: first parameter dependent upon hp_action
+ * @b: first parameter dependent upon hp_action
+ *
+ * To accurately reflect CPU hot un/plug changes, the FDT
+ * must be updated with the new list of CPUs and memories.
+ */
+void arch_crash_hotplug_handler(struct kimage *image, unsigned int hp_action,
+				unsigned long a, unsigned long b)
+{
+	void *fdt;
+
+	/* No action needed for CPU hot-unplug */
+	if (hp_action == KEXEC_CRASH_HP_REMOVE_CPU)
+		return;
+
+	/* crash update on memory hotplug is not support yet */
+	if (hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY || hp_action == KEXEC_CRASH_HP_ADD_MEMORY) {
+		pr_err("crash hp: crash update is not supported with memory hotplug\n");
+		return;
+	}
+
+	/* Must have valid FDT index */
+	if (!image->arch.fdt_index_valid) {
+		pr_err("crash hp: unable to locate FDT segment");
+		return;
+	}
+
+	fdt = __va((void *)image->segment[image->arch.fdt_index].mem);
+
+	/* Temporarily invalidate the crash image while it is replaced */
+	xchg(&kexec_crash_image, NULL);
+
+	/* update FDT to refelect changes to CPU resrouces */
+	if (update_cpus_node(fdt))
+		pr_err("crash hp: failed to update crash FDT");
+
+	/* The crash image is now valid once again */
+	xchg(&kexec_crash_image, image);
+}
+#endif /* CONFIG_CRASH_HOTPLUG */
+
 #ifdef CONFIG_PPC_64S_HASH_MMU
 /* Values we need to export to the second kernel via the device tree. */
 static unsigned long htab_base;
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index eeb258002d1e..2ffe6d69e186 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -24,6 +24,33 @@
 #include <linux/slab.h>
 #include <linux/types.h>
 
+
+#ifdef CONFIG_CRASH_HOTPLUG
+#define MAX_CORE 256
+#define PER_CORE_NODE_SIZE 1500
+
+/**
+ * get_crash_fdt_mem_sz() - calcuate mem size for crash kernel FDT
+ * @fdt: pointer to crash kernel FDT
+ *
+ * Calculate the buffer space needed to add more CPU nodes in FDT after
+ * capture kenrel load due to hot add events.
+ *
+ * Some assumption are made to calculate the additional buffer size needed
+ * to accommodate future hot add CPUs to the crash FDT. The maximum core count
+ * in the system would not go beyond MAX_CORE and memory needed to store per core
+ * date in FDT is PER_CORE_NODE_SIZE.
+ *
+ * Certainly MAX_CORE count can be replaced with possible core count and
+ * PER_CORE_NODE_SIZE to some standard value instead of randomly observed
+ * core size value on Power9 LPAR.
+ */
+static unsigned int get_crash_fdt_mem_sz(void *fdt)
+{
+	return fdt_totalsize(fdt) + (PER_CORE_NODE_SIZE * MAX_CORE);
+}
+#endif
+
 static void *elf64_load(struct kimage *image, char *kernel_buf,
 			unsigned long kernel_len, char *initrd,
 			unsigned long initrd_len, char *cmdline,
@@ -123,6 +150,19 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	kbuf.buf_align = PAGE_SIZE;
 	kbuf.top_down = true;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+
+#ifdef CONFIG_CRASH_HOTPLUG
+	if (image->type == KEXEC_TYPE_CRASH) {
+		kbuf.memsz = get_crash_fdt_mem_sz(fdt);
+		fdt_set_totalsize(fdt, kbuf.memsz);
+		image->arch.fdt_index = image->nr_segments;
+		image->arch.fdt_index_valid = true;
+	} else
+#endif
+	{
+		kbuf.memsz = fdt_totalsize(fdt);
+	}
+
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
 		goto out_free_fdt;
-- 
2.35.1

