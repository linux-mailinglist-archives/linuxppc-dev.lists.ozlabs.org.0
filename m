Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EA89368CC66
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 03:02:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P9mbB69sWz3f5b
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Feb 2023 13:01:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VzEDGB38;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VzEDGB38;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P9mW93dTtz3cDh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Feb 2023 12:58:29 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3171ln7F031929;
	Tue, 7 Feb 2023 01:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=uE/3EHkifIszjNQg6t9OkXNJlRIoDuLoJeWrMOWew10=;
 b=VzEDGB386kSsVDFf+vYA8ozv5ojTvb/wln3Nbcyd6lq9brNRB6QHAUfXthInHq6VSH57
 7buxhxK3Y7pat0E6nZaV5UppCtO+FKTBbupQSIU/cFsq+4OXUMCrDKftDN/riAojZiQy
 jfT3izOXjGEX4wKoJwvqvGOIHVN/cyrY7ieZ0pFdboXomUe88fAVYZatclhRoAibMFPy
 1n6OfmhfBhjBhCK/uGlA5O80nIbIMxDgK2o60HCkLvErRLRbP8x51eByJysqRD/pDVsx
 Ncdptee5Zibek4YNkG19iMoNfCPfT49SJu6veAg76yxxGtQu98fEvtyvdaIBZkQgpRqK sw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkda0r69m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:23 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3171uB91001916;
	Tue, 7 Feb 2023 01:58:23 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nkda0r696-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:23 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 316HFa3v020985;
	Tue, 7 Feb 2023 01:58:21 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nhemfk0n8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Feb 2023 01:58:21 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3171wIqc43909570
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Feb 2023 01:58:19 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D278F2004B;
	Tue,  7 Feb 2023 01:58:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5029F20040;
	Tue,  7 Feb 2023 01:58:18 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  7 Feb 2023 01:58:18 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 87589606E6;
	Tue,  7 Feb 2023 12:58:16 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] powerpc/64: Convert patch_instruction() to patch_u32()
Date: Tue,  7 Feb 2023 12:56:42 +1100
Message-Id: <20230207015643.590684-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230207015643.590684-1-bgray@linux.ibm.com>
References: <20230207015643.590684-1-bgray@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B34A0sdvt01f1SkNmXTepS9wvWl4v3xH
X-Proofpoint-ORIG-GUID: WYBtwrhHZhzMfyOi2mOKrutR5X14tJzV
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-06_07,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 mlxlogscore=705 phishscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302070012
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
Cc: erhard_f@mailbox.org, npiggin@gmail.com, Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This use of patch_instruction() is working on 32 bit data, and can fail
if the data looks like a prefixed instruction and the extra write
crosses a page boundary. Use patch_u32() to fix the write size.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

---

patch_u64() should be more efficient, but judging from the bug report[1]
it doesn't seem like the data is doubleword aligned.

[1]: https://lore.kernel.org/all/20230203004649.1f59dbd4@yea/
---
 arch/powerpc/kernel/module_64.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/module_64.c b/arch/powerpc/kernel/module_64.c
index 2ac78d207f77..a1693d38eb27 100644
--- a/arch/powerpc/kernel/module_64.c
+++ b/arch/powerpc/kernel/module_64.c
@@ -458,12 +458,11 @@ static inline int create_stub(const Elf64_Shdr *sechdrs,
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
2.39.1

