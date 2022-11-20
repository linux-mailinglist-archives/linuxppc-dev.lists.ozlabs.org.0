Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9837D63174D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 00:26:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NFmqd2YFbz3ccn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Nov 2022 10:26:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JCRVtopL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NFmpg1Dw2z2yQH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 10:25:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JCRVtopL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4NFmpf49jdz4xN4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Nov 2022 10:25:30 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4NFmpf46nNz4xN5; Mon, 21 Nov 2022 10:25:30 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JCRVtopL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4NFmpf1sy5z4xN4
	for <linuxppc-dev@ozlabs.org>; Mon, 21 Nov 2022 10:25:30 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AKJI4TX023062;
	Sun, 20 Nov 2022 23:25:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=mVjn6+yuOzUPyUP/B+8v+91dgUnn+bACNdt6p+nF6d8=;
 b=JCRVtopLTn+wBMFXBdOPOhnpHpx0J8/nqUAVFiCA7i3PIDfB+SB4oKJsVgnqek9M1Hb5
 VRiNT7I+NhdUUM9n2V2n8sTo/NUvn5pY/3/cOU/4btj83oaTNyM35WMGRbebH/QekmPw
 Ka7Fhh0fg4EVuVcFvrgAn7oZNyKHnbhp5g/Y8fDNxFf0jTBYppynNynWhyCOf2A4dML6
 XQfUicML7eAs6qthd++iVAT9QjZC94L597XcLIcivmiLXMNADBgbNhmWJjbXSnmnb4E6
 fcKXakl8CgMRkDP10bq4n1cQc56+zzVXmoAqrnSc74nLi9lOWGUXXyB29QnK2kcvzC+/ Kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky8yqhu02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 23:25:22 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AKNDnOl022825;
	Sun, 20 Nov 2022 23:25:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ky8yqhtyg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 23:25:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AKNLQSm022247;
	Sun, 20 Nov 2022 23:25:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3kxpdhste0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 20 Nov 2022 23:25:19 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AKNPHXL6750944
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 20 Nov 2022 23:25:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0744AE051;
	Sun, 20 Nov 2022 23:25:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0619DAE04D;
	Sun, 20 Nov 2022 23:25:15 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.9.248])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun, 20 Nov 2022 23:25:14 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v5 2/6] powerpc/crash: update kimage_arch struct
Date: Mon, 21 Nov 2022 04:55:04 +0530
Message-Id: <20221120232508.327554-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221120232508.327554-1-sourabhjain@linux.ibm.com>
References: <20221120232508.327554-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0Aci-ZrEuaedtP_348DKmRkkPJ0xNXLb
X-Proofpoint-GUID: BK0eyaMeKHxhrQgHrNSf-MrUoemlQeiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-20_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 phishscore=0 malwarescore=0 spamscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211200194
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
Cc: mahesh@linux.vnet.ibm.com, eric.devolder@oracle.com, kexec@lists.infradead.org, bhe@redhat.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a new member "fdt_index" to kimage_arch struct to hold the index of
the FDT (Flattened Device Tree) segment in the kexec segment array.
Having direct access to FDT segment will help arch crash hotplug handler
to avoid looping kexec segment array to identify the FDT segment index
for every FDT update on hotplug events.

The fdt_index is initialized during the kexec load for both kexec_load and
kexec_file_load system call.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h  |  9 +++++++++
 arch/powerpc/kexec/core_64.c      | 27 +++++++++++++++++++++++++++
 arch/powerpc/kexec/elf_64.c       |  6 ++++++
 arch/powerpc/kexec/file_load_64.c |  5 +++++
 4 files changed, 47 insertions(+)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 8090ad7d97d9d..fee742ddaf9a6 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -103,6 +103,12 @@ void kexec_copy_flush(struct kimage *image);
 struct crash_mem;
 int update_cpus_node(void *fdt);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
+
+#if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_MEMORY_HOTPLUG)
+
+int machine_kexec_post_load(struct kimage *image);
+#define machine_kexec_post_load machine_kexec_post_load
+#endif
 #endif
 
 #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
@@ -118,6 +124,9 @@ extern const struct kexec_file_ops kexec_elf64_ops;
 struct kimage_arch {
 	struct crash_mem *exclude_ranges;
 
+#if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_MEMORY_HOTPLUG)
+	int fdt_index;
+#endif
 	unsigned long backup_start;
 	void *backup_buf;
 	void *fdt;
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 0b292f93a74cc..0b8e2f8084afb 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -77,6 +77,33 @@ int machine_kexec_prepare(struct kimage *image)
 	return 0;
 }
 
+#if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_MEMORY_HOTPLUG)
+int machine_kexec_post_load(struct kimage *kimage)
+{
+	int i;
+	void *ptr;
+	unsigned long mem;
+
+	/* Mark fdt_index invalid */
+	kimage->arch.fdt_index = -1;
+
+	if (kimage->type != KEXEC_TYPE_CRASH)
+		return 0;
+
+	for (i = 0; i < kimage->nr_segments; i++) {
+		mem = kimage->segment[i].mem;
+		ptr = __va(mem);
+
+		if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
+			kimage->arch.fdt_index = i;
+			break;
+		}
+	}
+
+	return 0;
+}
+#endif
+
 /* Called during kexec sequence with MMU off */
 static notrace void copy_segments(unsigned long ind)
 {
diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index eeb258002d1e0..6272d49b49eb4 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -123,6 +123,12 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	kbuf.buf_align = PAGE_SIZE;
 	kbuf.top_down = true;
 	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+
+#if defined(CONFIG_HOTPLUG_CPU) || defined(CONFIG_MEMORY_HOTPLUG)
+	image->arch.fdt_index = image->nr_segments;
+#endif
+	kbuf.memsz = fdt_totalsize(fdt);
+
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
 		goto out_free_fdt;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index ca65aa3a69240..87de3fc59159a 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -1096,6 +1096,11 @@ int arch_kexec_kernel_image_probe(struct kimage *image, void *buf,
 		return ret;
 	}
 
+#if defined(CONFIG_HOTPLUG_CPU)
+	/* Mark fdt_index invalid */
+	image->arch.fdt_index = -1;
+#endif
+
 	return kexec_image_probe_default(image, buf, buf_len);
 }
 
-- 
2.38.1

