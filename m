Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5515BA6C0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 08:25:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTPFG13VSz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 16:25:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TjdnY0wh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TjdnY0wh;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTPDg13Hqz2xjt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 16:24:34 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28G5hlrs010067;
	Fri, 16 Sep 2022 06:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=h5UBtJeIO6ZtF/gYD5gMZ0KDP0Wzw4KIjF+qDCxbDJ4=;
 b=TjdnY0whPXvg8vDMPZWnR8Pc1Fy5I+Kc40k7bkN6XNr5ebypvS8++O0CJnvj3Cj4L+XX
 l8PUM0tR8CylYXu6LsKDy2DxzD+EWj+hrk3tiJl9ZK4biuCUkRXaWM2CRww142+hmBpH
 +E3XEDMYQTMixjd5DrK0tQ4E+NNqJWyXqP6gg86PDN4bSnsXWJ6wj8LGOlee3jksASIx
 mCgAB9vStp6D+JSEUQnnngXQ/v7GBTs9tRn8f7inujtgxygLJlOynh28CA9ZJNMpjMqr
 1UOl/idJDlbgplJBZ+oXCKPFFtlwTWRcBwFHc3fop/zgYkSWV5ygsbM7+DdVKT3V70hs YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk8eh1w1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:24:18 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28G5jDjx015460;
	Fri, 16 Sep 2022 06:24:17 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jmk8eh1vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:24:17 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28G6Ko8O003065;
	Fri, 16 Sep 2022 06:24:15 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
	by ppma06ams.nl.ibm.com with ESMTP id 3jm9218jjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Sep 2022 06:24:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28G6OD8e23200056
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Sep 2022 06:24:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 600B74C04A;
	Fri, 16 Sep 2022 06:24:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08E6A4C040;
	Fri, 16 Sep 2022 06:24:13 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 16 Sep 2022 06:24:12 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9411F600EE;
	Fri, 16 Sep 2022 16:24:09 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] powerpc/module: Handle caller-saved TOC in module linker
Date: Fri, 16 Sep 2022 16:23:26 +1000
Message-Id: <20220916062330.430468-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220916062330.430468-1-bgray@linux.ibm.com>
References: <20220916062330.430468-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: amjqpL4TnH9VLa4tjBrc8-eM5bEBtPaK
X-Proofpoint-ORIG-GUID: cOGlfX9_LetUUGVUQUgnkGBWkLYmAi_p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-16_02,2022-09-14_04,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=980
 impostorscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 spamscore=0 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209160045
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

The callee may set a field in `st_other` to 1 to indicate r2 should be
treated as caller-saved. This means a trampoline must be used to save
the current TOC before calling it and restore it afterwards, much like
external calls.

This is necessary for supporting V2 ABI static calls that do not
preserve the TOC.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/module_64.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 7e45dc98df8a..3656476097c2 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -55,6 +55,11 @@ static unsigned int local_entry_offset(const Elf64_Sym *sym)
 	 * of function and try to derive r2 from it). */
 	return PPC64_LOCAL_ENTRY_OFFSET(sym->st_other);
 }
+
+static bool need_r2save_stub(unsigned char st_other) {
+	return ((st_other & STO_PPC64_LOCAL_MASK) >> STO_PPC64_LOCAL_BIT) == 1;
+}
+
 #else
 
 static func_desc_t func_desc(unsigned long addr)
@@ -66,6 +71,10 @@ static unsigned int local_entry_offset(const Elf64_Sym *sym)
 	return 0;
 }
 
+static bool need_r2save_stub(unsigned char st_other) {
+	return false;
+}
+
 void *dereference_module_function_descriptor(struct module *mod, void *ptr)
 {
 	if (ptr < (void *)mod->arch.start_opd ||
@@ -632,7 +641,8 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
 		case R_PPC_REL24:
 			/* FIXME: Handle weak symbols here --RR */
 			if (sym->st_shndx == SHN_UNDEF ||
-			    sym->st_shndx == SHN_LIVEPATCH) {
+			    sym->st_shndx == SHN_LIVEPATCH ||
+			    need_r2save_stub(sym->st_other)) {
 				/* External: go via stub */
 				value = stub_for_addr(sechdrs, value, me,
 						strtab + sym->st_name);
-- 
2.37.3

