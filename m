Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D78594BD85D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 09:50:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2GGF1hCjz3cT8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Feb 2022 19:50:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m/AtY8I2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2GBT09Kbz3cRp
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 19:46:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m/AtY8I2; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4K2GBT3lWVz4xv3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 19:46:57 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4K2GBT3jZ2z4xn3; Mon, 21 Feb 2022 19:46:57 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=m/AtY8I2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4K2GBT1M9Pz4xv3
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Feb 2022 19:46:56 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21L8kS0k031164; 
 Mon, 21 Feb 2022 08:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=dBZjBPSWOQ5dXP8d7KzqH1zypwY/0J/agRvkksLCAHs=;
 b=m/AtY8I2eNZvi1NHcSCnZRls80vX9TQ5QgjOMBH8e5kFFk0H20g5SAxDA0HurIn+gq7E
 lO65t7osU+T9BRBkZq8NsoJkpuB8oePpM+oJpcdSXgYGjeaR74fXP0ymTAPBuFMiGLkC
 cfZEMM4VYtIwuG+8e39Mz+N+j3iUQYnN2btJitUfQ33dEDx58s75nYDJ4aR5TJl9qbUJ
 yZjeGyQl4m3cpXVedPbu1Jy7LTJrQ3n5fBjwdyf6APO48vsWukBr0gw0jIcdbGErtVdX
 dkGChn7J6LHK6ud9tnOciJoe7A+qVYk1D5wYkw1rcC+OId8I0gPl2sD/kuPISPstcipu XA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ec0etyn8w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 08:46:51 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21L8gkWg018680;
 Mon, 21 Feb 2022 08:46:49 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ear68r42u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 08:46:49 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21L8kkeF37028312
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 08:46:46 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8297A42045;
 Mon, 21 Feb 2022 08:46:46 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFDBC4204C;
 Mon, 21 Feb 2022 08:46:44 +0000 (GMT)
Received: from sjain014.ibmuc.com (unknown [9.43.10.186])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Feb 2022 08:46:44 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@ozlabs.org, mpe@ellerman.id.au
Subject: [RFC PATCH 4/5] powerpc/kdump: enable kexec_file_load system call to
 use kexec crash FDT
Date: Mon, 21 Feb 2022 14:16:23 +0530
Message-Id: <20220221084624.85792-5-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220221084624.85792-1-sourabhjain@linux.ibm.com>
References: <20220221084624.85792-1-sourabhjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: c5ZsZtUsbvJicQv9sRZ9EHi7n8mrP4nK
X-Proofpoint-ORIG-GUID: c5ZsZtUsbvJicQv9sRZ9EHi7n8mrP4nK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_03,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210052
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org,
 hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch enables the kexec_file_load system to utilize the pre-allocated
space for kexec crash FDT during the system boot.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/elf_64.c       | 22 +++++++++++++++++++---
 arch/powerpc/kexec/file_load_64.c |  4 ++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
index eeb258002d1e..3176dea0910d 100644
--- a/arch/powerpc/kexec/elf_64.c
+++ b/arch/powerpc/kexec/elf_64.c
@@ -116,13 +116,29 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
 	if (ret)
 		goto out_free_fdt;
 
-	fdt_pack(fdt);
+#ifdef CONFIG_KEXEC_CRASH_FDT
+	if (kexec_crash_fdt && image->type == KEXEC_TYPE_CRASH) {
+		memcpy(kexec_crash_fdt, fdt, fdt_totalsize(fdt));
+		/* retain the original total size */
+		((struct fdt_header *)(kexec_crash_fdt))->totalsize = cpu_to_fdt32(kexec_crash_fdt_size);
+	} else
+#endif
+	{
+		kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
+	}
 
 	kbuf.buffer = fdt;
-	kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
+
+#ifdef CONFIG_KEXEC_CRASH_FDT
+	if (kexec_crash_fdt && image->type == KEXEC_TYPE_CRASH) {
+		kbuf.bufsz = kbuf.memsz = fdt_totalsize(kexec_crash_fdt);
+	} else
+#endif
+	{
+		kbuf.bufsz = kbuf.memsz = fdt_totalsize(fdt);
+	}
 	kbuf.buf_align = PAGE_SIZE;
 	kbuf.top_down = true;
-	kbuf.mem = KEXEC_BUF_MEM_UNKNOWN;
 	ret = kexec_add_buffer(&kbuf);
 	if (ret)
 		goto out_free_fdt;
diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 02bb2adb1fe2..7a320d9e2098 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -906,6 +906,10 @@ int arch_kexec_locate_mem_hole(struct kexec_buf *kbuf)
 	u64 buf_min, buf_max;
 	int ret;
 
+	/* kbuf.mem is already pointing to validate memory hole */
+	if (kbuf->mem != KEXEC_BUF_MEM_UNKNOWN)
+		return 0;
+
 	/* Look up the exclude ranges list while locating the memory hole */
 	emem = &(kbuf->image->arch.exclude_ranges);
 	if (!(*emem) || ((*emem)->nr_ranges == 0)) {
-- 
2.34.1

