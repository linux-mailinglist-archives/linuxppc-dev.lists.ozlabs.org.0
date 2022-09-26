Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB5A5E99D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 08:48:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbYHg3ZD5z3f6W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:48:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jA6gM5le;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jA6gM5le;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbYCN1GRtz3bcw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 16:44:48 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28Q4ZQZZ005646;
	Mon, 26 Sep 2022 06:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=JjoakmGSN2j/oTNtddH3M+vnu2WJ36YPhlARa3ikhzw=;
 b=jA6gM5lelCDAbKS/HZdT0ko3+iEo43Lw0lKPVxXHgOQ1b/zhUVVPkqfvZFM+OWBQE/FH
 uj2MdB5P2YiJS7Q0S7gUBYcSbdPXC1xnCqg3lmJHU2LK1l0KuL2cZaG3B1HGYLV4s36F
 ZOXFCPC/bkCwGddM4oO4sPd2AmGTNGHsSreZ2oEQdhQNV2UbUT/ozmlRKnQElkT3UXWn
 nGFIeOxeukdi7mFM2gWUqoH4yOiQpElyw79KuktKtoPSHyZ3p0vfRZk2Y8/jbI/RQGC1
 msAbwAiIsaf0h6YU5DnPJw0RRUvf63P06OleM0c337rkRAIlZBICj4DGDrIf02RrxALX 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbq8cjdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:44:00 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28Q6e3Pa014431;
	Mon, 26 Sep 2022 06:44:00 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jtbq8cjcu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:59 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28Q6ZSo4003365;
	Mon, 26 Sep 2022 06:43:57 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma04ams.nl.ibm.com with ESMTP id 3jssh8syqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 26 Sep 2022 06:43:57 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28Q6di9b37159364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Sep 2022 06:39:44 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D3F511C054;
	Mon, 26 Sep 2022 06:43:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AB32611C04C;
	Mon, 26 Sep 2022 06:43:54 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 26 Sep 2022 06:43:54 +0000 (GMT)
Received: from beng-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C1BD26058C;
	Mon, 26 Sep 2022 16:43:45 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/6] powerpc/module: Handle caller-saved TOC in module linker
Date: Mon, 26 Sep 2022 16:43:12 +1000
Message-Id: <20220926064316.765967-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220926064316.765967-1-bgray@linux.ibm.com>
References: <20220926064316.765967-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1z5Vnnrv0KFoVkqbThVKXfnWBOZtOv02
X-Proofpoint-ORIG-GUID: GG3DUrlsywyd6RdpmkKnkVyL6vJdZYcY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-26_04,2022-09-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The callee may set a field in `st_other` to 1 to indicate r2 should be
treated as caller-saved. This means a trampoline must be used to save
the current TOC before calling it and restore it afterwards, much like
external calls.

This is necessary for supporting V2 ABI static calls that do not
preserve the TOC.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/module_64.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 7e45dc98df8a..4d816f7785b4 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -55,6 +55,12 @@ static unsigned int local_entry_offset(const Elf64_Sym *sym)
 	 * of function and try to derive r2 from it). */
 	return PPC64_LOCAL_ENTRY_OFFSET(sym->st_other);
 }
+
+static bool need_r2save_stub(unsigned char st_other)
+{
+	return ((st_other & STO_PPC64_LOCAL_MASK) >> STO_PPC64_LOCAL_BIT) == 1;
+}
+
 #else
 
 static func_desc_t func_desc(unsigned long addr)
@@ -66,6 +72,11 @@ static unsigned int local_entry_offset(const Elf64_Sym *sym)
 	return 0;
 }
 
+static bool need_r2save_stub(unsigned char st_other)
+{
+	return false;
+}
+
 void *dereference_module_function_descriptor(struct module *mod, void *ptr)
 {
 	if (ptr < (void *)mod->arch.start_opd ||
@@ -632,7 +643,8 @@ int apply_relocate_add(Elf64_Shdr *sechdrs,
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

