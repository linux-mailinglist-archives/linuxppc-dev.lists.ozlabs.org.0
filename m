Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0287C9E70
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 07:09:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D38kCVnb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S84sd68Dmz3vXp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Oct 2023 16:09:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=D38kCVnb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S84rn0zFKz2yQ8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Oct 2023 16:08:40 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39G4lOcg014427;
	Mon, 16 Oct 2023 05:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=Rpos5q2I8/DCeWNLpdHhA3f4H59f7bDBi5EDo0Tpnos=;
 b=D38kCVnbmBPoNx6FzOwucGP9sitvTswWx4roL8UC8IJmEdiH0b21dG0EljCiHnKWnyw6
 /uaxI+SvsNqIt+/NbmmciVN/ufUS8LNpWhbHjrGXiJz9vaIP6uabUvkRlQBaG2atcnve
 WyuzUFGouc7jhuEndKdXu7jPoRKfn84432GPlw6eZ8gDF56hLedL8DAusdcwCSC1zQFY
 RFx3PyUYF/qTe59X38ebxnQ9pCNpfpK7R6Ev6aHWnOE5a+0ztJTjVzoh+C0aIeXMHhZa
 5mlkCA0+2Bxa4e17Wvi2cm/o7tvMEliWNyc3C78O6o5bKIuvKnfNog+UZjETRMpkwqN0 aQ== 
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3trxf40d7t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 05:08:36 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39G2VaLq012876;
	Mon, 16 Oct 2023 05:03:35 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5pxxsbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Oct 2023 05:03:34 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39G53XRV44302894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Oct 2023 05:03:33 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E5BA420040;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7698520043;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Oct 2023 05:03:32 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 308A66040A;
	Mon, 16 Oct 2023 16:03:30 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/64: Convert patch_instruction() to patch_u32()
Date: Mon, 16 Oct 2023 16:01:46 +1100
Message-ID: <20231016050147.115686-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231016050147.115686-1-bgray@linux.ibm.com>
References: <20231016050147.115686-1-bgray@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kRUM_oM0c8S7CVjGD-Fx5CHFa0ytXiGe
X-Proofpoint-ORIG-GUID: kRUM_oM0c8S7CVjGD-Fx5CHFa0ytXiGe
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-15_09,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 mlxlogscore=643 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310160044
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This use of patch_instruction() is working on 32 bit data, and can fail
if the data looks like a prefixed instruction and the extra write
crosses a page boundary. Use patch_u32() to fix the write size.

Fixes: 8734b41b3efe ("powerpc/module_64: Fix livepatching for RO modules")
Link: https://lore.kernel.org/all/20230203004649.1f59dbd4@yea/
Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

v2: * Added the fixes tag, it seems appropriate even if the subject does
      mention a more robust solution being required.

patch_u64() should be more efficient, but judging from the bug report
it doesn't seem like the data is doubleword aligned.
---
 arch/powerpc/kernel/module_64.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 7112adc597a8..e9bab599d0c2 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -651,12 +651,11 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
 	// func_desc_t is 8 bytes if ABIv2, else 16 bytes
 	desc = func_desc(addr);
 	for (i = 0; i < sizeof(func_desc_t) / sizeof(u32); i++) {
-		if (patch_instruction(((u32 *)&entry->funcdata) + i,
-				      ppc_inst(((u32 *)(&desc))[i])))
+		if (patch_u32(((u32 *)&entry->funcdata) + i, ((u32 *)&desc)[i]))
 			return 0;
 	}
 
-	if (patch_instruction(&entry->magic, ppc_inst(STUB_MAGIC)))
+	if (patch_u32(&entry->magic, STUB_MAGIC))
 		return 0;
 
 	return 1;
-- 
2.39.2

