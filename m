Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E710F5E99C6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:46:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbYFC3qMGz2xWx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:46:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXBowBIU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZXBowBIU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbYC73h8Pz2xHF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:44:35 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q4ZQo9031063;
	Mon, 26 Sep 2022 06:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eqzHk4t2NLCPx8tq0XIFFTcpO5wYb8t2yFw/PQzZB24=;
 b=ZXBowBIUbvy8pVY6db3wWaeBJ83JMTmt284M/a5A71N3xEkF8zFuIn5ijneDhfShrKIP
 UHR4Mez+3pDGD7FTJKjEjaTZOyf4LnxmPtNirfJZ4hqiom/cLLVLsoHDnmNR/mFr70AC
 GgPKbEJ3LbTTqReAc5UZ/E7KY1rh++rdqAtqs6+FvKPmN5d9T4lkUb0LjY4MI+2h2fKW
 HKpasEwASRVAzAlgYLsu96igNGF6it1uTp/zmydZu+VanpEVBtACvlPpcDrTkF5eMXRl
 qdpRcwETZjm4prm42l7/+YAILo1nkMr28P2FPe2N5xZfNr/NdcIDOTUndZ5tIzHVS02Y jA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtby74cf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:59 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q5fCCM030566;
	Mon, 26 Sep 2022 06:43:59 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtby74cec-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:59 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q6ZXHp026572;
	Mon, 26 Sep 2022 06:43:57 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3jssh8sfv6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q6diSl36372864
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 06:39:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D3EB11C050;
	Mon, 26 Sep 2022 06:43:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABC1311C052;
	Mon, 26 Sep 2022 06:43:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 06:43:54 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 7F5346057F;
	Mon, 26 Sep 2022 16:43:53 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/6] powerpc/module: Optimise nearby branches in ELF V2 ABI stub
Date: Mon, 26 Sep 2022 16:43:13 +1000
Message-Id: <20220926064316.765967-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926064316.765967-1-bgray@linux.ibm.com>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JsWwzA0Pd1VqpQX6Is8-gYfyq8l_np1s
X-Proofpoint-GUID: VbMF9-ryJEJKxa6VYRt3SZlbk9af_Pud
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

Inserts a direct branch to the stub target when possible, replacing the
mtctr/btctr sequence.

The load into r12 could potentially be skipped too, but that change
would need to refactor the arguments to indicate that the address
does not have a separate local entry point.

This helps the static call implementation, where modules calling their
own trampolines are called through this stub and the trampoline is
easily within range of a direct branch.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/module_64.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 4d816f7785b4..745ce9097dcf 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -141,6 +141,12 @@ static u32 ppc64_stub_insns[] = {
 	PPC_RAW_BCTR(),
 };
 
+#ifdef CONFIG_PPC64_ELF_ABI_V1
+#define PPC64_STUB_MTCTR_OFFSET 5
+#else
+#define PPC64_STUB_MTCTR_OFFSET 4
+#endif
+
 /* Count how many different 24-bit relocations (different symbol,
    different addend) */
 static unsigned int count_relocs(const Elf64_Rela *rela, unsigned int num)
@@ -429,6 +435,8 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 	long reladdr;
 	func_desc_t desc;
 	int i;
+	u32 *jump_seq_addr = &entry->jump[PPC64_STUB_MTCTR_OFFSET];
+	ppc_inst_t direct;
 
 	if (is_mprofile_ftrace_call(name))
 		return create_ftrace_stub(entry, addr, me);
@@ -439,6 +447,11 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 			return 0;
 	}
 
+	/* Replace indirect branch sequence with direct branch where possible */
+	if (!create_branch(&direct, jump_seq_addr, addr, 0))
+		if (patch_instruction(jump_seq_addr, direct))
+			return 0;
+
 	/* Stub uses address relative to r2. */
 	reladdr = (unsigned long)entry - my_r2(sechdrs, me);
 	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-- 
2.37.3

