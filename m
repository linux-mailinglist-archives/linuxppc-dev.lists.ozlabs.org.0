Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D23B0619EBF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Nov 2022 18:31:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N3nj94g7Wz3dvg
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Nov 2022 04:31:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZvxJmWWI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZvxJmWWI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N3nfB6fvXz30JR
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Nov 2022 04:28:34 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A4GS9Eg026289;
	Fri, 4 Nov 2022 17:28:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xLVnxFhsTfvLMg70f7DTF+jcvYHRHaDMiW1Z2gAS05w=;
 b=ZvxJmWWIZfqHdQAgCx0I041LVZdlZxTb92yUca9gF/I2I/4yaMYPgB3ClXWaMg2z/CK9
 FPg2Qq27+FmdLQWXYHrLxMW3ndraBI6XvpNjjQgy0VQC38MD1LylwcvMqO9+CQddQj7B
 KSnmK9EUggL54I8nWqhyCQxmS95ColPIW0E5veSuxWQW1zR9cZUTk8jQElVevD7F9M0F
 ciFmgjEWdfyKkXZnO8OfdtqprQ363c8dBH/fZShVgnVzzqSJ7QUKvZ4gCTBB03oXVxDe
 Q2LSyYnBjFbz/jUD0uPmBK3IAOBEnFtKdQ4Ii5P2Mukqcwe7EUJFlpFh2kVJXDhNMSHQ fg== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kmpn9ytw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:21 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A4HLXGw013375;
	Fri, 4 Nov 2022 17:28:19 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma05fra.de.ibm.com with ESMTP id 3kjepeds84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 04 Nov 2022 17:28:19 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A4HSHZ366060774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Nov 2022 17:28:17 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3F7E11C050;
	Fri,  4 Nov 2022 17:28:16 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9D97911C04C;
	Fri,  4 Nov 2022 17:28:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri,  4 Nov 2022 17:28:16 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ibmuc.com (unknown [9.43.196.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8E2E060126;
	Sat,  5 Nov 2022 04:28:13 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 3/6] powerpc/powernv: Keep MSR in register across OPAL entry/return path
Date: Sat,  5 Nov 2022 04:27:34 +1100
Message-Id: <20221104172737.391978-4-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104172737.391978-1-ajd@linux.ibm.com>
References: <20221104172737.391978-1-ajd@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: k6knRXBgC5VDTprdqCXsWMuhfWDuOFeV
X-Proofpoint-ORIG-GUID: k6knRXBgC5VDTprdqCXsWMuhfWDuOFeV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-04_11,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 malwarescore=0
 spamscore=0 mlxlogscore=914 lowpriorityscore=0 impostorscore=0
 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211040108
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
Cc: linux-hardening@vger.kernel.org, cmr@bluescreens.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When we enter and return from an OPAL call, there's three pieces of state
we have to save and restore: the stack pointer, the PACA pointer, and the
MSR. However, there's only two registers that OPAL is guaranteed to
preserve for us (r1 for the stack pointer and r13 for the PACA), so the MSR
gets saved on the stack.

This becomes problematic when we enable VMAP_STACK, as we need to re-enable
translation in order to access the virtually mapped stack... and to
re-enable translation, we need to restore the MSR.

Keep the MSR in r13, and instead store the PACA pointer on the stack - we
can restore the MSR first, then restore the PACA into r13.

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 .../powerpc/platforms/powernv/opal-wrappers.S | 43 +++++++++++--------
 1 file changed, 26 insertions(+), 17 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-wrappers.S b/arch/powerpc/platforms/powernv/opal-wrappers.S
index 0ed95f753416..d692869ee0ce 100644
--- a/arch/powerpc/platforms/powernv/opal-wrappers.S
+++ b/arch/powerpc/platforms/powernv/opal-wrappers.S
@@ -23,40 +23,49 @@
 _GLOBAL_TOC(__opal_call)
 	mflr	r0
 	std	r0,PPC_LR_STKOFF(r1)
-	ld	r12,STK_PARAM(R12)(r1)
-	li	r0,MSR_IR|MSR_DR|MSR_LE
-	andc	r12,r12,r0
 	LOAD_REG_ADDR(r11, opal_return)
 	mtlr	r11
 	LOAD_REG_ADDR(r11, opal)
 	ld	r2,0(r11)
 	ld	r11,8(r11)
 	mtspr	SPRN_HSRR0,r11
-	mtspr	SPRN_HSRR1,r12
+
 	/* set token to r0 */
 	ld	r0,STK_PARAM(R11)(r1)
+
+	/*
+	 * We need to keep the MSR value in a register that is preserved by
+	 * OPAL, so that we don't need to access the stack before we restore
+	 * the MSR, as the stack may be vmalloced and thus require MMU.
+	 *
+	 * Move the PACA from R13 into the stack red zone, and put MSR in R13.
+	 */
+	std	r13,-8(r1)
+	ld	r13,STK_PARAM(R12)(r1)
+
+	/* Switch off MMU, LE */
+	li	r11,MSR_IR|MSR_DR|MSR_LE
+	andc	r11,r13,r11
+
+	mtspr	SPRN_HSRR1,r11
 	hrfid
 opal_return:
 	/*
 	 * Restore MSR on OPAL return. The MSR is set to big-endian.
 	 */
 #ifdef __BIG_ENDIAN__
-	ld	r11,STK_PARAM(R12)(r1)
-	mtmsrd	r11
+	mtmsrd	r13
 #else
 	/* Endian can only be switched with rfi, must byte reverse MSR load */
-	.short 0x4039	 /* li r10,STK_PARAM(R12)		*/
-	.byte (STK_PARAM(R12) >> 8) & 0xff
-	.byte STK_PARAM(R12) & 0xff
-
-	.long 0x280c6a7d /* ldbrx r11,r10,r1			*/
-	.long 0x05009f42 /* bcl 20,31,$+4			*/
-	.long 0xa602487d /* mflr r10				*/
-	.long 0x14004a39 /* addi r10,r10,20			*/
-	.long 0xa64b5a7d /* mthsrr0 r10				*/
-	.long 0xa64b7b7d /* mthsrr1 r11				*/
-	.long 0x2402004c /* hrfid				*/
+	.long 0x05009f42 /* bcl 20,31,$+4   (LR <- next insn addr)	*/
+	.long 0xa602487d /* mflr r10					*/
+	.long 0x14004a39 /* addi r10,r10,20 (r10 <- addr after #endif)	*/
+	.long 0xa64b5a7d /* mthsrr0 r10	    (new NIP)			*/
+	.long 0xa64bbb7d /* mthsrr1 r13	    (new MSR)			*/
+	.long 0x2402004c /* hrfid					*/
 #endif
+	/* Restore PACA */
+	ld	r13,-8(r1)
 	LOAD_PACA_TOC()
 	ld	r0,PPC_LR_STKOFF(r1)
 	mtlr	r0
-- 
2.38.1

