Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E80B5BA682
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 07:48:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTNR50xklz3fRr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 15:48:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RIvMyXk5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RIvMyXk5;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTNCS5K6tz3fR2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 15:38:28 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5VKRU004180;
	Fri, 16 Sep 2022 05:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=juocgxdCf+GLuqAc5mijtgfD0FONYUQM3geYd6ekZGU=;
 b=RIvMyXk5bkrIgl6BtTwpRmPPz2cOo6LGK4v2pIZllSdF0K1CslsIwk3hFwQKE9Q+6k7G
 p3fTW+9hGCT4VD6cmrwF/5BxqckC9mgNu+6jh5l03Cin2ZvmQ/P3uhwrg1hMX/iO+JOm
 ecoaYF1brsvFmgCp/QWZN3RHUN/vGbzZlEwtiGHEMYw+PDGYu8H0LiRu6TYyQvYC+CyI
 SzNDWhSWGIjrItsNZ3eP6Yotb/T0Hs9E3QGf62/iZ7e0OGJik56YMoa5SmClvnu7mkSN
 lgFjcBZVyhXzp9WrSOfT6Jdj62IoqF9ezaT2e+gXCMjkgHn9D2kprdLvgYrcWztvq0/u KQ== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk2f8868-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:38:24 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G5LD2U017456;
	Fri, 16 Sep 2022 05:33:21 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma05fra.de.ibm.com with ESMTP id 3jm91crcnp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 05:33:21 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G5TUnH32702828
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 05:29:30 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5219252050;
	Fri, 16 Sep 2022 05:33:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id F213F52051;
	Fri, 16 Sep 2022 05:33:18 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A669460593;
	Fri, 16 Sep 2022 15:33:13 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 20/23] powerpc/64s: Clear/restore caller gprs in syscall interrupt/return
Date: Fri, 16 Sep 2022 15:32:57 +1000
Message-Id: <20220916053300.786330-21-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220916053300.786330-1-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y4bA_gyCP7g-5xstbVX9y2675ANIZ6tI
X-Proofpoint-GUID: Y4bA_gyCP7g-5xstbVX9y2675ANIZ6tI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 mlxlogscore=501 suspectscore=0 clxscore=1015
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2209130000
 definitions=main-2209160041
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Clear user state in gprs (assign to zero) to reduce the influence of user
registers on speculation within kernel syscall handlers. Clears occur
at the very beginning of the sc and scv 0 interrupt handlers, with
restores occurring following the execution of the syscall handler.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V1 -> V2: Update summary
V2 -> V3: Remove erroneous summary paragraph on syscall_exit_prepare
V3 -> V4: Use ZEROIZE instead of NULLIFY. Clear r0 also.
V4 -> V5: Move to end of patch series.
---
 arch/powerpc/kernel/interrupt_64.S | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
index 16a1b44088e7..40147558e1a6 100644
--- a/arch/powerpc/kernel/interrupt_64.S
+++ b/arch/powerpc/kernel/interrupt_64.S
@@ -70,7 +70,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_\name)
 	ld	r2,PACATOC(r13)
 	mfcr	r12
 	li	r11,0
-	/* Can we avoid saving r3-r8 in common case? */
+	/* Save syscall parameters in r3-r8 */
 	SAVE_GPRS(3, 8, r1)
 	/* Zero r9-r12, this should only be required when restoring all GPRs */
 	std	r11,GPR9(r1)
@@ -110,6 +110,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 	 * Zero user registers to prevent influencing speculative execution
 	 * state of kernel code.
 	 */
+	ZEROIZE_GPR(0)
 	ZEROIZE_GPRS(5, 12)
 	ZEROIZE_NVGPRS()
 	bl	system_call_exception
@@ -140,6 +141,7 @@ BEGIN_FTR_SECTION
 	HMT_MEDIUM_LOW
 END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 
+	REST_NVGPRS(r1)
 	cmpdi	r3,0
 	bne	.Lsyscall_vectored_\name\()_restore_regs
 
@@ -243,7 +245,7 @@ END_BTB_FLUSH_SECTION
 	ld	r2,PACATOC(r13)
 	mfcr	r12
 	li	r11,0
-	/* Can we avoid saving r3-r8 in common case? */
+	/* Save syscall parameters in r3-r8 */
 	SAVE_GPRS(3, 8, r1)
 	/* Zero r9-r12, this should only be required when restoring all GPRs */
 	std	r11,GPR9(r1)
@@ -295,6 +297,7 @@ END_BTB_FLUSH_SECTION
 	 * Zero user registers to prevent influencing speculative execution
 	 * state of kernel code.
 	 */
+	ZEROIZE_GPR(0)
 	ZEROIZE_GPRS(5, 12)
 	ZEROIZE_NVGPRS()
 	bl	system_call_exception
@@ -337,6 +340,7 @@ BEGIN_FTR_SECTION
 	stdcx.	r0,0,r1			/* to clear the reservation */
 END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 
+	REST_NVGPRS(r1)
 	cmpdi	r3,0
 	bne	.Lsyscall_restore_regs
 	/* Zero volatile regs that may contain sensitive kernel data */
@@ -364,7 +368,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
 .Lsyscall_restore_regs:
 	ld	r3,_CTR(r1)
 	ld	r4,_XER(r1)
-	REST_NVGPRS(r1)
 	mtctr	r3
 	mtspr	SPRN_XER,r4
 	REST_GPR(0, r1)
-- 
2.34.1

