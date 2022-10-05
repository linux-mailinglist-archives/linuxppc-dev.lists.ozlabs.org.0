Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6685F4F7E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 07:35:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mj3Fk6cjRz3dt4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 16:35:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k2yxFKn/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k2yxFKn/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mj3Bg3sd4z2yQl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 16:33:15 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2952ipgx007255;
	Wed, 5 Oct 2022 05:32:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=R9L6Ris1vLA7gwMh492upDmDrwtHI0P7XWhHtSbcz4Y=;
 b=k2yxFKn/iM++ZUhocnIZEX93aGfHU2nvyCba5al5m4hoC+AwB6Bkjr8ss/QQO9B/Q9yA
 P1UzNNpAfcffRvUMUIoSwHQ6o/lxhH5PuVpXCq091kQ9V5b/CakWKFJUSHS+/mivwubR
 VZzha0cI5cXra8ZpO40VVsYBsf/ISw/MWaqgVq6M6DW859rwyUsrpm6jJEphd1vdn+zd
 oPFpBa0D0Ie574wF9lfrdKue+DE7WYHuWX7Rq+g44YaB8O8Hjeu7on/kzbDdkC1cb7wS
 M7r+axc4w69sgZT6krVM/K5qtS9i5g+kIyHVuNNdnzKucNFtAG1vsXpB4q/gaEgBcIWl tg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0bdt8hhf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:55 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2954qHwA012511;
	Wed, 5 Oct 2022 05:32:55 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k0bdt8hgd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:55 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2955NEsj009621;
	Wed, 5 Oct 2022 05:32:53 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma01fra.de.ibm.com with ESMTP id 3jxd68uq5q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Oct 2022 05:32:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2955Wpei55378430
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Oct 2022 05:32:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B222A4060;
	Wed,  5 Oct 2022 05:32:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B92C4A4054;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed,  5 Oct 2022 05:32:50 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8DE85605B2;
	Wed,  5 Oct 2022 16:32:49 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 2/6] powerpc/module: Handle caller-saved TOC in module linker
Date: Wed,  5 Oct 2022 16:32:30 +1100
Message-Id: <20221005053234.29312-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005053234.29312-1-bgray@linux.ibm.com>
References: <20221005053234.29312-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wpVMs28-N3CaTZfMAtr8WrgsAX7HW6-g
X-Proofpoint-GUID: CGqF4D1-s9pZvYkC7_WV0bcUQ51mLTei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-04_09,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 mlxlogscore=985 impostorscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The callee may set a field in st_other to 1 to indicate r2 should be
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

