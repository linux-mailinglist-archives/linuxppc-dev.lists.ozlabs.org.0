Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A015F9661
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 02:37:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mm0Nx3XzKz3dys
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 11:37:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VSczzPYz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VSczzPYz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mm0Fl0p1Zz3bjd
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 11:31:06 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 299NCBcZ003082;
	Mon, 10 Oct 2022 00:30:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7AhaorhNNdVupXboT0plDfNanOhraIGnaqGo6BRjnUY=;
 b=VSczzPYzPdQDBX0ret01hSMpgtfbN+aLWJ/RzlPMOdsth0T37dQ2tDsM0u1yJ4UqmJkD
 VlRorJehdbDceicD77vlItN7eZpt13BiiDQ7XkoFG/v0MVEgJe1f5Yjq/TufHCExAxhs
 QUUZBL3T7QkNxf4dlbDTkiNmAdB39LunrqzilIHYrD4b0YohbMIoCRPmpdlJ15iLPXmR
 sZgJbPRj07f1JRrtOAomIhRj0VZQI+uQPMctErQnpofdBmyAd3IPlVTNi0jm2JyrfRZs
 gqmaGwPUMpCUzih1a0zD3F71lq/qF9lxI6orgIWzLMQzE3Zp65n/Crn7d/98kS+vP5d7 VQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k97v8ry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:38 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 29A0UckV013314;
	Mon, 10 Oct 2022 00:30:38 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3k3k97v8rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 29A0MulQ010144;
	Mon, 10 Oct 2022 00:30:36 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3k30u920xe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Oct 2022 00:30:36 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 29A0V4fN50528766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Oct 2022 00:31:04 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B990C4203F;
	Mon, 10 Oct 2022 00:30:33 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61F9C42042;
	Mon, 10 Oct 2022 00:30:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 10 Oct 2022 00:30:33 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 89362602EB;
	Mon, 10 Oct 2022 11:30:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/6] powerpc/module: Handle caller-saved TOC in module linker
Date: Mon, 10 Oct 2022 11:29:53 +1100
Message-Id: <20221010002957.128276-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221010002957.128276-1-bgray@linux.ibm.com>
References: <20221010002957.128276-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e-M2Y98EpjG7R0c3uQVwR3vxgA2mY8iN
X-Proofpoint-ORIG-GUID: qZh5qYUjhi0SKznWzlPxiLBqCSZVVJth
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-10-07_04,2022-10-07_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2210090155
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

A function symbol may set a value in the st_other field to indicate
the TOC should be treated as caller-saved. The linker should ensure the
current TOC is saved before calling it and restore the TOC afterwards,
much like external calls.

This is necessary for supporting V2 ABI static calls that do not
preserve the TOC.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 arch/powerpc/kernel/module_64.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 7e45dc98df8a..83a6f6e22e3b 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -55,6 +55,12 @@ static unsigned int local_entry_offset(const Elf64_Sym *sym)
 	 * of function and try to derive r2 from it). */
 	return PPC64_LOCAL_ENTRY_OFFSET(sym->st_other);
 }
+
+static bool need_r2save_stub(unsigned char st_other)
+{
+	return (st_other & STO_PPC64_LOCAL_MASK) == (1 << STO_PPC64_LOCAL_BIT);
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

