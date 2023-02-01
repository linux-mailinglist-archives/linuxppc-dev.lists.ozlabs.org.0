Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A739685FDD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 07:41:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P6C4c73tHz3ch0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 17:41:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JlRW9Z8H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P6C1k72q3z3cdx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 17:39:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JlRW9Z8H;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4P6C1k6bt6z4x1f
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 17:39:06 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4P6C1k6Ytqz4xyd; Wed,  1 Feb 2023 17:39:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JlRW9Z8H;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4P6C1k4GWbz4x1f
	for <linuxppc-dev@ozlabs.org>; Wed,  1 Feb 2023 17:39:06 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3116VSp1031726;
	Wed, 1 Feb 2023 06:38:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=szWQhE8IYJ49WZxjrVAcbsXXosYQiz/IMbSsO6NIZrE=;
 b=JlRW9Z8Hdq+UQRgdz/ZT7XHKqPsz+9Ap+wvjNm9noeANn2JQMplo+O6B9Jsy1U+jIGDi
 l0DO8FZM+XaqOnJBO63tLB9nrdYVgX4al4RZZHdTb+6mLegNt7aD4fs0ZOWfPc4Og1PL
 8aJSA3qJ4awxuWaPBaSTYztA2sgCkPXKuvOG68I7XbBs2U91wFzFtE5UsJqPjFYm7wRE
 GcXln2KvXYveUDtMgYakHKQhYAgARxD/rTYTQY2kEi+8g9gxRyO/Z/DtjUBlpXZ+dRbd
 /Mvyn4lMhEU3G2OvTAOrrTBi1mlI8Jjb7ORLp5GB8idSDGwKq3ZTAn0TbUk857NxouMw mA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfjvy86g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:38:57 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3116Vvit005984;
	Wed, 1 Feb 2023 06:38:56 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nfjvy86f6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:38:56 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30VDsvVo013274;
	Wed, 1 Feb 2023 06:38:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3ncvtycd81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Feb 2023 06:38:54 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3116coKo28639696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Feb 2023 06:38:50 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D57A20040;
	Wed,  1 Feb 2023 06:38:50 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86E502004D;
	Wed,  1 Feb 2023 06:38:48 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.43.109.52])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Feb 2023 06:38:48 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v8 3/8] powerpc/crash: update kimage_arch struct
Date: Wed,  1 Feb 2023 12:08:36 +0530
Message-Id: <20230201063841.965316-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201063841.965316-1-sourabhjain@linux.ibm.com>
References: <20230201063841.965316-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IJQSla1i2iuAOaPfGWVp1abEIRqS_iFv
X-Proofpoint-ORIG-GUID: ue6oliJTnwhcphSs2yeotwr77bZRlmgt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_02,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 bulkscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302010056
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

Add a new member "fdt_index" to kimage_arch struct to hold the index of
the FDT (Flattened Device Tree) segment in the kexec segment array.

Having direct access to FDT segment will help arch crash hotplug handler
to avoid looping kexec segment array to identify the FDT segment index
for every FDT update on hotplug events.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/include/asm/kexec.h |  7 +++++++
 arch/powerpc/kexec/core_64.c     | 33 ++++++++++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
index 8090ad7d97d9d..5a322c1737661 100644
--- a/arch/powerpc/include/asm/kexec.h
+++ b/arch/powerpc/include/asm/kexec.h
@@ -103,6 +103,10 @@ void kexec_copy_flush(struct kimage *image);
 struct crash_mem;
 int update_cpus_node(void *fdt);
 int get_crash_memory_ranges(struct crash_mem **mem_ranges);
+#if defined(CONFIG_CRASH_HOTPLUG)
+int machine_kexec_post_load(struct kimage *image);
+#define machine_kexec_post_load machine_kexec_post_load
+#endif
 #endif
 
 #if defined(CONFIG_CRASH_DUMP) && defined(CONFIG_PPC_RTAS)
@@ -118,6 +122,9 @@ extern const struct kexec_file_ops kexec_elf64_ops;
 struct kimage_arch {
 	struct crash_mem *exclude_ranges;
 
+#if defined(CONFIG_CRASH_HOTPLUG)
+	int fdt_index;
+#endif
 	unsigned long backup_start;
 	void *backup_buf;
 	void *fdt;
diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
index 0b292f93a74cc..a9918084b1eba 100644
--- a/arch/powerpc/kexec/core_64.c
+++ b/arch/powerpc/kexec/core_64.c
@@ -77,6 +77,39 @@ int machine_kexec_prepare(struct kimage *image)
 	return 0;
 }
 
+#if defined(CONFIG_CRASH_HOTPLUG)
+/*
+ * Find the index of the FDT segment in kexec segment array and assign
+ * it to kimage's member fdt_index to have direct access to FDT
+ * segment later on.
+ */
+int machine_kexec_post_load(struct kimage *kimage)
+{
+	int i;
+	void *ptr;
+	unsigned long mem;
+
+	/* Mark fdt_index invalid */
+	kimage->arch.fdt_index = -1;
+
+	/* fdt_index remains invalid for if it not crash kernel load */
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
-- 
2.39.1

