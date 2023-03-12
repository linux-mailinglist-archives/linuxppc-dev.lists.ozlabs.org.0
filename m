Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 447686B69F3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Mar 2023 19:15:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PZSck1QmFz3cHG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 05:15:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qVJfFzxx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PZSYj3v07z3bT0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 05:12:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qVJfFzxx;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4PZSYj3Hhbz4xFQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Mar 2023 05:12:25 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4PZSYj3Dz4z4xDh; Mon, 13 Mar 2023 05:12:25 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qVJfFzxx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4PZSYj09Cnz4xFQ
	for <linuxppc-dev@ozlabs.org>; Mon, 13 Mar 2023 05:12:24 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32CDfo37032417;
	Sun, 12 Mar 2023 18:12:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=klmr4OqZZeiX4cpPm91pBrDaVNlNLbURP4kGEMHP01c=;
 b=qVJfFzxxhMW6JeYILxMLrKJmuh6c4XOgJHu8Cxnu42MjT5ja1WU29wZRfs/DkcazBXcD
 KjGxMnta42FfZwrvQ0pUyPkGc65qjxgBRWt3Wwi+Jf7Xr2iVlG5nxtNktklzYqex+dbO
 dkFUQbbII6WRAGzjVJ/Mj0/9cEjDJGMPAfK43ruyEySN17oSiG4bxP9q9DnwDGAyI/EU
 TLzstBj+J0FZc8pvVsUALKzNeh2+gFXaXKSlSLwkPHN/vDezYXu3dqFsTON0ahsqIWSw
 VgphkvPXTSlpSct2cgeaEPVxk7eqVVHW6mNpGtuyevaskj1jaW2fAt/fFmfoz1exVcEJ tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p93k208jc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:12 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32CICB0O011103;
	Sun, 12 Mar 2023 18:12:11 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p93k208j0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:11 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32CAKcdh030084;
	Sun, 12 Mar 2023 18:12:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p8gwfa75u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 Mar 2023 18:12:09 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32CIC6Y866126294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 12 Mar 2023 18:12:06 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DE6E2004B;
	Sun, 12 Mar 2023 18:12:06 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57AEC20049;
	Sun, 12 Mar 2023 18:12:04 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.41.125])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 12 Mar 2023 18:12:04 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v9 3/6] powerpc/crash: add a new member to the kimage_arch struct
Date: Sun, 12 Mar 2023 23:41:51 +0530
Message-Id: <20230312181154.278900-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
References: <20230312181154.278900-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: f9f5MhXr-VK_ao8q1fBceFNjh_tC8xSc
X-Proofpoint-GUID: uHWEOPEsjcUrqPTQ_kLrmzx2FTcxwjxc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-12_04,2023-03-10_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 adultscore=0 spamscore=0 impostorscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303120157
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
Cc: eric.devolder@oracle.com, bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, ldufour@linux.ibm.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A new member "fdt_index" is added to the kimage_arch struct to hold
the index of the FDT (Flattened Device Tree) segment from the kexec
the segment array.

fdt_index will provide direct access to the FDT segment in the kexec
segment array after the kdump kernel is loaded.

The new attribute will be used in the arch crash hotplug handler
(added in upcoming patches) on every CPU and memory hotplug event.

The fdt_index is populated for both kexec_load and kexec_file_load
case.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h |  5 +++++
 arch/powerpc/kexec/core_64.c     | 31 +++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 8090ad7d97d9d..348eb96e8ca67 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -103,6 +103,8 @@ void kexec_copy_flush(struct kimage *image);
 struct crash_mem;
 int update_cpus_node(void *fdt);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
+int machine_kexec_post_load(struct kimage *image);
+#define machine_kexec_post_load machine_kexec_post_load
 #endif
 
 #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
@@ -118,6 +120,9 @@ extern const struct kexec_file_ops kexec_elf64_ops;
 struct kimage_arch {
 	struct crash_mem *exclude_ranges;
 
+#if defined(CONFIG_CRASH_HOTPLUG)
+	int fdt_index;
+#endif
 	unsigned long backup_start;
 	void *backup_buf;
 	void *fdt;
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 0b292f93a74cc..531486c973988 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -77,6 +77,37 @@ int machine_kexec_prepare(struct kimage *image)
 	return 0;
 }
 
+int machine_kexec_post_load(struct kimage *kimage)
+{
+#if defined(CONFIG_CRASH_HOTPLUG)
+	int i;
+	void *ptr;
+	unsigned long mem;
+
+	/* Mark fdt_index invalid */
+	kimage->arch.fdt_index = -1;
+
+	/* fdt_index remains invalid if it is not a crash kernel load */
+	if (kimage->type != KEXEC_TYPE_CRASH)
+		return 0;
+	/*
+	 * Find the FDT segment index in kexec segment array and
+	 * assign it to kimage's member fdt_index to enable direct
+	 * access to FDT segment later on.
+	 */
+	for (i = 0; i < kimage->nr_segments; i++) {
+		mem = kimage->segment[i].mem;
+		ptr = __va(mem);
+
+		if (ptr && fdt_magic(ptr) == FDT_MAGIC) {
+			kimage->arch.fdt_index = i;
+			break;
+		}
+	}
+#endif
+	return 0;
+}
+
 /* Called during kexec sequence with MMU off */
 static notrace void copy_segments(unsigned long ind)
 {
-- 
2.39.1

