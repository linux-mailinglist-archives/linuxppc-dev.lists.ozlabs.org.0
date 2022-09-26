Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7200B5E99C5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:45:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbYDS34HYz3cLb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:45:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jGu03Nql;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jGu03Nql;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbYC46Ptfz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:44:32 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q4ZPtI030992;
	Mon, 26 Sep 2022 06:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=K0Ez093Jir8pfoPaXkQTQDGA2NUEKxpG2TK0oAaWM9E=;
 b=jGu03NqlMhgRiT8dLVJPxxtcHXpXAIzj96qgfoYzgB42ar60EHSB2pshP9FrZulYAHma
 RhqA8cylHuihvjHmfb7TcAQGEtpvPBjCGO+A1AZtTSOI8xG/c6LxcgzXpmPVzK8zV1Gm
 fztcuJMpDufOa8zgRB/tsZVnhq/iJ44yJpf2x/H0VTUlftap23b1Y40VVONvS1pEstpn
 kJbSFMpqgMK2Q3nnXKR+FTHkE5fmfXEiYMYCejQ3UNLAl9+TIuIg8nY98hpvX0Y3OGJg
 x9VRlXY/5ntsB5y9qgKxxQ18wPMAZ2NX//h7XEzMqu5Wp3lZtxChg5XNrKlym8KlYDes YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtby74cf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:44:00 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q5NBjg016938;
	Mon, 26 Sep 2022 06:43:59 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtby74cek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:59 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q6ZTCV003384;
	Mon, 26 Sep 2022 06:43:57 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3jssh8syqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q6htmY1376890
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 06:43:55 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 59EF6AE053;
	Mon, 26 Sep 2022 06:43:55 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD487AE045;
	Mon, 26 Sep 2022 06:43:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 06:43:54 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 44EF66016C;
	Mon, 26 Sep 2022 16:43:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/6] powerpc/code-patching: Implement generic text patching function
Date: Mon, 26 Sep 2022 16:43:11 +1000
Message-Id: <20220926064316.765967-2-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926064316.765967-1-bgray@linux.ibm.com>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: U6PTP-gfBgeBpkHqIJcVgUEt824QEy1C
X-Proofpoint-GUID: 69dALQow2t9dl3FBUPaN0q1WWf4W4i93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 priorityscore=1501 adultscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209260039
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
Cc: christophe.leroy@c-s.fr, ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Adds a generic text patching mechanism for patches of 1, 2, 4, or (64-bit) 8
bytes. The patcher conditionally syncs the icache depending on if
the content will be executed (as opposed to, e.g., read-only data).

The `patch_instruction` function is reimplemented in terms of this
more generic function. This generic implementation allows patching of
arbitrary 64-bit data, whereas the original `patch_instruction` decided
the size based on the 'instruction' opcode, so was not suitable for
arbitrary data.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/include/asm/code-patching.h |  7 ++
 arch/powerpc/lib/code-patching.c         | 90 +++++++++++++++++-------
 2 files changed, 71 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/include/asm/code-patching.h b/arch/powerpc/include/asm/code-patching.h
index 1c6316ec4b74..15efd8ab22da 100644
--- a/arch/powerpc/include/asm/code-patching.h
+++ b/arch/powerpc/include/asm/code-patching.h
@@ -76,6 +76,13 @@ int create_cond_branch(ppc_inst_t *instr, const u32 *addr,
 int patch_branch(u32 *addr, unsigned long target, int flags);
 int patch_instruction(u32 *addr, ppc_inst_t instr);
 int raw_patch_instruction(u32 *addr, ppc_inst_t instr);
+int __patch_memory(void *dest, unsigned long src, size_t size);
+
+#define patch_memory(addr, val) \
+({ \
+	BUILD_BUG_ON(!__native_word(val)); \
+	__patch_memory(addr, (unsigned long) val, sizeof(val)); \
+})

 static inline unsigned long patch_site_addr(s32 *site)
 {
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index ad0cf3108dd0..9979380d55ef 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -15,20 +15,47 @@
 #include <asm/code-patching.h>
 #include <asm/inst.h>

-static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr)
+static int __always_inline ___patch_memory(void *patch_addr,
+					   unsigned long data,
+					   void *prog_addr,
+					   size_t size)
 {
-	if (!ppc_inst_prefixed(instr)) {
-		u32 val = ppc_inst_val(instr);
+	switch (size) {
+	case 1:
+		__put_kernel_nofault(patch_addr, &data, u8, failed);
+		break;
+	case 2:
+		__put_kernel_nofault(patch_addr, &data, u16, failed);
+		break;
+	case 4:
+		__put_kernel_nofault(patch_addr, &data, u32, failed);
+		break;
+#ifdef CONFIG_PPC64
+	case 8:
+		__put_kernel_nofault(patch_addr, &data, u64, failed);
+		break;
+#endif
+	default:
+		unreachable();
+	}

-		__put_kernel_nofault(patch_addr, &val, u32, failed);
-	} else {
-		u64 val = ppc_inst_as_ulong(instr);
+	dcbst(patch_addr);
+	dcbst(patch_addr + size - 1); /* Last byte of data may cross a cacheline */

-		__put_kernel_nofault(patch_addr, &val, u64, failed);
-	}
+	mb(); /* sync */
+
+	/* Flush on the EA that may be executed in case of a non-coherent icache */
+	icbi(prog_addr);
+
+	/* Also flush the last byte of the instruction if it may be a
+	 * prefixed instruction and we aren't assuming minimum 64-byte
+	 * cacheline sizes
+	 */
+	if (IS_ENABLED(CONFIG_PPC64) && L1_CACHE_BYTES < 64)
+		icbi(prog_addr + size - 1);

-	asm ("dcbst 0, %0; sync; icbi 0,%1; sync; isync" :: "r" (patch_addr),
-							    "r" (exec_addr));
+	mb(); /* sync */
+	isync();

 	return 0;

@@ -38,7 +65,10 @@ static int __patch_instruction(u32 *exec_addr, ppc_inst_t instr, u32 *patch_addr

 int raw_patch_instruction(u32 *addr, ppc_inst_t instr)
 {
-	return __patch_instruction(addr, instr, addr);
+	if (ppc_inst_prefixed(instr))
+		return ___patch_memory(addr, ppc_inst_as_ulong(instr), addr, sizeof(u64));
+	else
+		return ___patch_memory(addr, ppc_inst_val(instr), addr, sizeof(u32));
 }

 #ifdef CONFIG_STRICT_KERNEL_RWX
@@ -147,24 +177,22 @@ static void unmap_patch_area(unsigned long addr)
 	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
 }

-static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
+static int __always_inline __do_patch_memory(void *dest, unsigned long src, size_t size)
 {
 	int err;
 	u32 *patch_addr;
-	unsigned long text_poke_addr;
 	pte_t *pte;
-	unsigned long pfn = get_patch_pfn(addr);
-
-	text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr & PAGE_MASK;
-	patch_addr = (u32 *)(text_poke_addr + offset_in_page(addr));
+	unsigned long text_poke_addr = (unsigned long)__this_cpu_read(text_poke_area)->addr & PAGE_MASK;
+	unsigned long pfn = get_patch_pfn(dest);

+	patch_addr = (u32 *)(text_poke_addr + offset_in_page(dest));
 	pte = virt_to_kpte(text_poke_addr);
 	__set_pte_at(&init_mm, text_poke_addr, pte, pfn_pte(pfn, PAGE_KERNEL), 0);
 	/* See ptesync comment in radix__set_pte_at() */
 	if (radix_enabled())
 		asm volatile("ptesync": : :"memory");

-	err = __patch_instruction(addr, instr, patch_addr);
+	err = ___patch_memory(patch_addr, src, dest, size);

 	pte_clear(&init_mm, text_poke_addr, pte);
 	flush_tlb_kernel_range(text_poke_addr, text_poke_addr + PAGE_SIZE);
@@ -172,7 +200,7 @@ static int __do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	return err;
 }

-static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
+static int __always_inline do_patch_memory(void *dest, unsigned long src, size_t size)
 {
 	int err;
 	unsigned long flags;
@@ -183,32 +211,42 @@ static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
 	 * to allow patching. We just do the plain old patching
 	 */
 	if (!static_branch_likely(&poking_init_done))
-		return raw_patch_instruction(addr, instr);
+		return ___patch_memory(dest, src, dest, size);

 	local_irq_save(flags);
-	err = __do_patch_instruction(addr, instr);
+	err = __do_patch_memory(dest, src, size);
 	local_irq_restore(flags);

 	return err;
 }
+
 #else /* !CONFIG_STRICT_KERNEL_RWX */

-static int do_patch_instruction(u32 *addr, ppc_inst_t instr)
+static int do_patch_memory(void *dest, unsigned long src, size_t size)
 {
-	return raw_patch_instruction(addr, instr);
+	return ___patch_memory(dest, src, dest, size);
 }

 #endif /* CONFIG_STRICT_KERNEL_RWX */

 __ro_after_init DEFINE_STATIC_KEY_FALSE(init_mem_is_free);

-int patch_instruction(u32 *addr, ppc_inst_t instr)
+int __patch_memory(void *dest, unsigned long src, size_t size)
 {
 	/* Make sure we aren't patching a freed init section */
-	if (static_branch_likely(&init_mem_is_free) && init_section_contains(addr, 4))
+	if (static_branch_likely(&init_mem_is_free) && init_section_contains(dest, 4))
 		return 0;

-	return do_patch_instruction(addr, instr);
+	return do_patch_memory(dest, src, size);
+}
+NOKPROBE_SYMBOL(__patch_memory);
+
+int patch_instruction(u32 *addr, ppc_inst_t instr)
+{
+	if (ppc_inst_prefixed(instr))
+		return patch_memory(addr, ppc_inst_as_ulong(instr));
+	else
+		return patch_memory(addr, ppc_inst_val(instr));
 }
 NOKPROBE_SYMBOL(patch_instruction);

--
2.37.3
