Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 044C95F4F81
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 07:37:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj3Hp6Cv5z3dsJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 16:37:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fiNjCiGW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fiNjCiGW;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj3Bh17c7z2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 16:33:15 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 29534uea010712;
	Wed, 5 Oct 2022 05:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YHUFjwuq/ftrvj5RCis+pmM3tYQvSi71YOjto75s0lM=;
 b=fiNjCiGWvv+TJTNOkO7kczigsayDzuIyF64X8/5mfypDyATHGG3L/MwnExj/Ty+xlymI
 +DqDxLYUb3XsAKwO/k80L237b7qDiRKvqYj9zeLFIHMqqwRAqcse2Rbv3WP+Vjszglco
 Jh15KQg60Lpj9WUHSWo/schbbCRHa5tyrcS4lKCeBClbX/6bKTh6OGLJYy32/g9+Fc/R
 LMtAL1QSm3Ku2KMnPeTQ8/pUzF01YnvQLYdU9OKBY2OEO/2pqEhGLe+ZQY7KIwKmsnzv
 WknkVFA/u3o7+OV5Sd3s18smFeJTyAHtelzRa5QocJ9/Znk+cmHCyQKF4H9fdQB3shHa kw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0gu375up-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:56 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2955R1iY026542;
	Wed, 5 Oct 2022 05:32:55 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0gu375tp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:55 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2955K5bT029985;
	Wed, 5 Oct 2022 05:32:53 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3jxd6953xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:53 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2955WpxC31982200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Oct 2022 05:32:51 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F93442041;
	Wed,  5 Oct 2022 05:32:51 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD0324203F;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 91D8D605DC;
	Wed,  5 Oct 2022 16:32:49 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/6] powerpc/module: Optimise nearby branches in ELF V2 ABI stub
Date: Wed,  5 Oct 2022 16:32:31 +1100
Message-Id: <20221005053234.29312-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005053234.29312-1-bgray@linux.ibm.com>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: myB2MYFsIwQUT0QHYzlsbsWROmJs78-g
X-Proofpoint-GUID: 1buaaFhTnPYCBK9_Lvtnvg-OtTuHKYjG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 impostorscore=0 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 priorityscore=1501 suspectscore=0 phishscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210050034
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
Cc: ajd@linux.ibm.com, peterz@infradead.org, Benjamin Gray <bgray@linux.ibm.com>, npiggin@gmail.com, ardb@kernel.org, jbaron@akamai.com, rostedt@goodmis.org, jpoimboe@kernel.org
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
 arch/powerpc/kernel/module_64.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 4d816f7785b4..13ce7a4d8a8d 100644
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
@@ -426,6 +432,7 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 			      struct module *me,
 			      const char *name)
 {
+	int err;
 	long reladdr;
 	func_desc_t desc;
 	int i;
@@ -439,6 +446,11 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 			return 0;
 	}
 
+	/* Replace indirect branch sequence with direct branch where possible */
+	err = patch_branch(&entry->jump[PPC64_STUB_MTCTR_OFFSET], addr, 0);
+	if (err && err != -ERANGE)
+		return 0;
+
 	/* Stub uses address relative to r2. */
 	reladdr = (unsigned long)entry - my_r2(sechdrs, me);
 	if (reladdr > 0x7FFFFFFF || reladdr < -(0x80000000L)) {
-- 
2.37.3

