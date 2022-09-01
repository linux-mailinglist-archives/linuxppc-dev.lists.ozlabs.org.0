Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 604FB5A8E9A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 08:48:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJBSl1H82z3drX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 16:48:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TS/ZiQZd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TS/ZiQZd;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJ9Mm28wWz2y6K
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Sep 2022 15:58:44 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2815mXA7003025;
	Thu, 1 Sep 2022 05:58:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DG5VXmyFI+nUrD2Yxa98atltZBZjXu9BX4Io7GtKovs=;
 b=TS/ZiQZdfMrZmFQouNwhPCgJmQMdmi4aE9iYRdbS5r5azdICV7vPbbQQZl704BhlyH8M
 rEdpLjbogGKsM+sImEg55eftOw6HB9m1O77RDu3erviAwaLxBxtSNvu8fxCvftqtFwm+
 SWoFAjr3zF5lswM0jQdxMOcIXahjMcPE51E0cBcZOva3iJcn8uCcIeVB4xz7E2V6KWZt
 IwvhlmYMlAPWXuqqawmHGRAfgmSD3O5KJnEAdwSbuxXfbWKA7ejIXxjyhUbNFC0jrVAc
 h56U8M30P+u8YdYRnLEvZTJ06BpzH8YZl/wI0soEVUTGxy4FpFv/RNZavihuTC/RrRqt Rw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3japht8xfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:37 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2815pfft018658;
	Thu, 1 Sep 2022 05:58:37 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3japht8xbf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:37 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2815o9EG018841;
	Thu, 1 Sep 2022 05:58:34 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma05fra.de.ibm.com with ESMTP id 3j7aw8vht9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Sep 2022 05:58:34 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2815wV5G42467610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Sep 2022 05:58:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CDF9FA405F;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 304D4A4054;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  1 Sep 2022 05:58:31 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D083E604C3;
	Thu,  1 Sep 2022 15:58:28 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/4] powerpc/code-patching: add patch_memory() for writing RO text
Date: Thu,  1 Sep 2022 15:58:20 +1000
Message-Id: <20220901055823.152983-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220901055823.152983-1-bgray@linux.ibm.com>
References: <20220901055823.152983-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fIXE6FHSbv8TMIKWMWnVhdl1upGacE9r
X-Proofpoint-ORIG-GUID: oW2OmWvigu3spryu6NDO3VSclQqoxPQT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-01_03,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 clxscore=1015 adultscore=0 phishscore=0 spamscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2209010023
X-Mailman-Approved-At: Thu, 01 Sep 2022 16:45:35 +1000
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
Cc: christophe.leroy@c-s.fr, Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Russell Currey <ruscur@russell.cc>

powerpc allocates a text poke area of one page that is used by
patch_instruction() to modify read-only text when STRICT_KERNEL_RWX
is enabled.

patch_instruction() is only designed for instructions,
so writing data using the text poke area can only happen 4 bytes
at a time - each with a page map/unmap, pte flush and syncs.

This patch introduces patch_memory(), implementing the same
interface as memcpy(), similar to x86's text_poke() and s390's
s390_kernel_write().  patch_memory() only needs to map the text
poke area once, unless the write would cross a page boundary.

Signed-off-by: Russell Currey <ruscur@russell.cc>
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/code-patching.h |  1 +
 arch/powerpc/lib/code-patching.c         | 65 ++++++++++++++++++++++++
 2 files changed, 66 insertions(+)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 1c6316ec4b74..3de90748bce7 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -76,6 +76,7 @@ int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 int patch_branch(u32 *addr, unsigned long target, int flags);
 int patch_instruction(u32 *addr, ppc_inst_t instr);
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
+void *patch_memory(void *dest, const void *src, size_t size);
 
 static inline unsigned long patch_site_addr(s32 *site)
 {
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index 6edf0697a526..0cca39af44cb 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -14,6 +14,7 @@
 #include <asm/page.h>
 #include <asm/code-patching.h>
 #include <asm/inst.h>
+#include <asm/cacheflush.h>
 
 static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
 {
@@ -183,6 +184,65 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 
 	return err;
 }
+
+static int do_patch_memory(void *dest, const void *src, size_t size)
+{
+	int err;
+	unsigned long text_poke_addr, patch_addr;
+
+	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr;
+
+	err = map_patch_area(dest, text_poke_addr);
+	if (err)
+		return err;
+
+	patch_addr = text_poke_addr + offset_in_page(dest);
+	copy_to_kernel_nofault((u8 *)patch_addr, src, size);
+
+	flush_icache_range(patch_addr, size);
+	unmap_patch_area(text_poke_addr);
+
+	return 0;
+}
+
+/**
+ * patch_memory - write data using the text poke area
+ *
+ * @dest:	destination address
+ * @src:	source address
+ * @size:	size in bytes
+ *
+ * like memcpy(), but using the text poke area. No atomicity guarantees.
+ * Do not use for instructions, use patch_instruction() instead.
+ * Handles crossing page boundaries, though you shouldn't need to.
+ *
+ * Return value:
+ * 	@dest
+ **/
+void *patch_memory(void *dest, const void *src, size_t size)
+{
+	int err;
+	unsigned long flags;
+	size_t written, write_size;
+
+	// If the poke area isn't set up, it's early boot and we can just memcpy.
+	if (!this_cpu_read(text_poke_area))
+		return memcpy(dest, src, size);
+
+	for (written = 0; written < size; written += write_size) {
+		// Write as much as possible without crossing a page boundary.
+		write_size = min_t(size_t, size - written,
+				   PAGE_SIZE - offset_in_page(dest + written));
+
+		local_irq_save(flags);
+		err = do_patch_memory(dest + written, src + written, write_size);
+		local_irq_restore(flags);
+		if (err)
+			return ERR_PTR(err);
+	}
+
+	return dest;
+}
 #else /* !CONFIG_STRICT_KERNEL_RWX */
 
 static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
@@ -190,6 +250,11 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	return raw_patch_instruction(addr, instr);
 }
 
+void *patch_memory(void *dest, const void *src, size_t size)
+{
+	return memcpy(dest, src, size);
+}
+
 #endif /* CONFIG_STRICT_KERNEL_RWX */
 
 __ro_after_init DEFINE_STATIC_KEY_FALSE(init_mem_is_free);
-- 
2.37.2

