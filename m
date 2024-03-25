Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 48ABA888F87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:54:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j1t2GmeO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V32Dx0Rqwz2yst
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:54:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j1t2GmeO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V32D96Bfbz3bbW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:53:29 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P3TOR6027426;
	Mon, 25 Mar 2024 05:53:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=lVduRBO6kpx4TPaHDfnifA5JdplfGHc3Qylu30ax4q0=;
 b=j1t2GmeOhLYoEVE3MA5HFAFbzD4spB6VFuTsokLSI6Q2CJO9od6LthoQHtc94TFCbz3E
 FCuH5w8yczpKqFlP0TC7v+sSqS8YOMjqnvOZWjABqvaBEWvztawTzEEMc6rrcmCuxtU3
 0u4mDaK6zztUndRqz2YuefkKDRvOtLwu8PChW4bvhuJ2N0XfhV3hRNCJ4Qza5zTvK8E+
 WXuJxLXqKtu7JE7e3v4pSQ3aCoUhzF/mD2hewV+6EkZ/I7VDlI0viFoEtyOaBoivi/81
 +KpPYX7F7iozQTq1Tx1JybPHMvxgIfiVvHEYgtkt6+peWkTffDS0vuAoGhJGZmwTfHNw yA== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x1x53bjv1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:20 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P5U7Vt028620;
	Mon, 25 Mar 2024 05:53:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x2adny3sj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:53:19 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P5rFnt40763750
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:53:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B5F62005A;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 28B5A2004E;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 25 Mar 2024 05:53:15 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E19C36015D;
	Mon, 25 Mar 2024 16:53:12 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 3/5] powerpc/64: Convert patch_instruction() to patch_u32()
Date: Mon, 25 Mar 2024 16:53:00 +1100
Message-ID: <20240325055302.876434-4-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240325055302.876434-1-bgray@linux.ibm.com>
References: <20240325055302.876434-1-bgray@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: frTScZYqjwIXL8_AriqzAHaAQH2nj2Qi
X-Proofpoint-ORIG-GUID: frTScZYqjwIXL8_AriqzAHaAQH2nj2Qi
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_03,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=850 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250030
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
Cc: Naveen N Rao <naveen@kernel.org>, Benjamin Gray <bgray@linux.ibm.com>
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
2.44.0

