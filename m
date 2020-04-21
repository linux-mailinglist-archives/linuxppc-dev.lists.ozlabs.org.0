Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3730B1B2E7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Apr 2020 19:40:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4969nj4rZbzDqS0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 03:40:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4969hn5TgwzDqgV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 03:36:09 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03LHZ0Ck019260
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 13:36:07 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30j2xt4k2m-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 13:36:07 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Tue, 21 Apr 2020 18:35:21 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 21 Apr 2020 18:35:19 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03LHa2sL43188324
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Apr 2020 17:36:02 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5394611C052;
 Tue, 21 Apr 2020 17:36:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A517A11C04A;
 Tue, 21 Apr 2020 17:36:00 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.72.246])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Apr 2020 17:36:00 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/3] powerpc/module_64: Consolidate ftrace code
Date: Tue, 21 Apr 2020 23:05:43 +0530
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20042117-4275-0000-0000-000003C4149F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20042117-4276-0000-0000-000038D99A01
Message-Id: <2527351f65c53c5866068ae130dc34c5d4ee8ad9.1587488954.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-21_07:2020-04-20,
 2020-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 spamscore=0 malwarescore=0 mlxlogscore=912 bulkscore=0
 clxscore=1015 suspectscore=1 mlxscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004210133
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
Cc: Qian Cai <cai@lca.pw>, Steven Rostedt <rostedt@goodmis.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

module_trampoline_target() is only used by ftrace. Move the prototype
within the appropriate #ifdef in the header. Also, move the function
body to the end of module_64.c so as to consolidate all ftrace code in
one place.

No functional changes.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 arch/powerpc/include/asm/module.h |  3 --
 arch/powerpc/kernel/module_64.c   | 69 +++++++++++++++----------------
 2 files changed, 33 insertions(+), 39 deletions(-)

diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index 356658711a86..6b99d773f522 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -90,12 +90,9 @@ struct mod_arch_specific {
 #    ifdef MODULE
 	asm(".section .ftrace.tramp,\"ax\",@nobits; .align 3; .previous");
 #    endif	/* MODULE */
-#endif
 
 int module_trampoline_target(struct module *mod, unsigned long trampoline,
 			     unsigned long *target);
-
-#ifdef CONFIG_DYNAMIC_FTRACE
 int module_finalize_ftrace(struct module *mod, const Elf_Shdr *sechdrs);
 #else
 static inline int module_finalize_ftrace(struct module *mod, const Elf_Shdr *sechdrs)
diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 007606a48fd9..54d9d830f4a4 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -144,42 +144,6 @@ static u32 ppc64_stub_insns[] = {
 	PPC_INST_BCTR,
 };
 
-#ifdef CONFIG_DYNAMIC_FTRACE
-int module_trampoline_target(struct module *mod, unsigned long addr,
-			     unsigned long *target)
-{
-	struct ppc64_stub_entry *stub;
-	func_desc_t funcdata;
-	u32 magic;
-
-	if (!within_module_core(addr, mod)) {
-		pr_err("%s: stub %lx not in module %s\n", __func__, addr, mod->name);
-		return -EFAULT;
-	}
-
-	stub = (struct ppc64_stub_entry *)addr;
-
-	if (probe_kernel_read(&magic, &stub->magic, sizeof(magic))) {
-		pr_err("%s: fault reading magic for stub %lx for %s\n", __func__, addr, mod->name);
-		return -EFAULT;
-	}
-
-	if (magic != STUB_MAGIC) {
-		pr_err("%s: bad magic for stub %lx for %s\n", __func__, addr, mod->name);
-		return -EFAULT;
-	}
-
-	if (probe_kernel_read(&funcdata, &stub->funcdata, sizeof(funcdata))) {
-		pr_err("%s: fault reading funcdata for stub %lx for %s\n", __func__, addr, mod->name);
-                return -EFAULT;
-	}
-
-	*target = stub_func_addr(funcdata);
-
-	return 0;
-}
-#endif
-
 /* Count how many different 24-bit relocations (different symbol,
    different addend) */
 static unsigned int count_relocs(const Elf64_Rela *rela, unsigned int num)
@@ -745,6 +709,39 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 }
 
 #ifdef CONFIG_DYNAMIC_FTRACE
+int module_trampoline_target(struct module *mod, unsigned long addr,
+			     unsigned long *target)
+{
+	struct ppc64_stub_entry *stub;
+	func_desc_t funcdata;
+	u32 magic;
+
+	if (!within_module_core(addr, mod)) {
+		pr_err("%s: stub %lx not in module %s\n", __func__, addr, mod->name);
+		return -EFAULT;
+	}
+
+	stub = (struct ppc64_stub_entry *)addr;
+
+	if (probe_kernel_read(&magic, &stub->magic, sizeof(magic))) {
+		pr_err("%s: fault reading magic for stub %lx for %s\n", __func__, addr, mod->name);
+		return -EFAULT;
+	}
+
+	if (magic != STUB_MAGIC) {
+		pr_err("%s: bad magic for stub %lx for %s\n", __func__, addr, mod->name);
+		return -EFAULT;
+	}
+
+	if (probe_kernel_read(&funcdata, &stub->funcdata, sizeof(funcdata))) {
+		pr_err("%s: fault reading funcdata for stub %lx for %s\n", __func__, addr, mod->name);
+                return -EFAULT;
+	}
+
+	*target = stub_func_addr(funcdata);
+
+	return 0;
+}
 
 #ifdef CONFIG_MPROFILE_KERNEL
 
-- 
2.25.1

