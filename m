Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E32463E1133
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 11:21:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgNQJ5QVCz3cR9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 19:21:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=doN/tyl2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=doN/tyl2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgNPs1G6cz2yLZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 19:20:48 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17593WAI142550; Thu, 5 Aug 2021 05:20:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=36wJhGUGTsJ3ozXxQkKHI8m8WdjA5L2uu09X2BtrfZw=;
 b=doN/tyl2wu/vfUN/BKty6waqrqQFTG1vniIsmskb6Gq9BG/eDGD9evNWClvfqih+eiLU
 4bdH3jslwGgA0SvH/07YbxqWo+rDDoF3j5mj07Bcia4ma9BVvokny6C62MKyrgifh1jD
 lBzqslDZn3ayjvH8CpR3vCHdh6f8c2mdfDGH8WOw50o5t7pfedaKmdX3suPtGMTTWaES
 d/V3pEbpjQ0SNuKUOfiAB1P3TbXmQJuGHkx4EzTeaR6WgpwSU4mp41yEayK+xwzfqClN
 WkFGTkzgIFtQIXPCOuZohW+KTBhwM/wbUw5sDqtJMzqXCI9C/R0w0qCVxQCQ3BBXApVX zw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a87f68f6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:20:43 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17593vvZ144633;
 Thu, 5 Aug 2021 05:20:43 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a87f68f5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 05:20:42 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 175982Gi006215;
 Thu, 5 Aug 2021 09:20:40 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3a4x58hu14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 09:20:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1759Kaxq48955866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 09:20:37 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEB96AE051;
 Thu,  5 Aug 2021 09:20:36 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F20BAE068;
 Thu,  5 Aug 2021 09:20:34 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com.com (unknown
 [9.85.115.109])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Aug 2021 09:20:33 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 1/3] powerpc/pseries: Parse control memory access error
Date: Thu,  5 Aug 2021 14:50:23 +0530
Message-Id: <20210805092025.272871-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: eWwo24HwXKreCj7yT1Z0JqMh_j61oikk
X-Proofpoint-GUID: 4vSEAdilUGfS5wko6gOiv6SgHQTKn0il
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_03:2021-08-05,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 clxscore=1015 mlxscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108050054
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
Cc: mikey@neuling.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add support to parse and log control memory access
error for pseries.

Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
v2: No changes in this patch.
---
 arch/powerpc/platforms/pseries/ras.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index 167f2e1b8d39..608c35cad0c3 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -80,6 +80,7 @@ struct pseries_mc_errorlog {
 #define MC_ERROR_TYPE_TLB		0x04
 #define MC_ERROR_TYPE_D_CACHE		0x05
 #define MC_ERROR_TYPE_I_CACHE		0x07
+#define MC_ERROR_TYPE_CTRL_MEM_ACCESS	0x08
 
 /* RTAS pseries MCE error sub types */
 #define MC_ERROR_UE_INDETERMINATE		0
@@ -103,6 +104,9 @@ struct pseries_mc_errorlog {
 #define MC_ERROR_TLB_MULTIHIT		2
 #define MC_ERROR_TLB_INDETERMINATE	3
 
+#define MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK	0
+#define MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS	1
+
 static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
 {
 	switch (mlog->error_type) {
@@ -112,6 +116,8 @@ static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
 	case	MC_ERROR_TYPE_ERAT:
 	case	MC_ERROR_TYPE_TLB:
 		return (mlog->sub_err_type & 0x03);
+	case	MC_ERROR_TYPE_CTRL_MEM_ACCESS:
+		return (mlog->sub_err_type & 0x70) >> 4;
 	default:
 		return 0;
 	}
@@ -699,6 +705,21 @@ static int mce_handle_err_virtmode(struct pt_regs *regs,
 	case MC_ERROR_TYPE_I_CACHE:
 		mce_err.error_type = MCE_ERROR_TYPE_ICACHE;
 		break;
+	case MC_ERROR_TYPE_CTRL_MEM_ACCESS:
+		mce_err.error_type = MCE_ERROR_TYPE_RA;
+		if (mce_log->sub_err_type & 0x80)
+			eaddr = be64_to_cpu(mce_log->effective_address);
+		switch (err_sub_type) {
+		case MC_ERROR_CTRL_MEM_ACCESS_PTABLE_WALK:
+			mce_err.u.ra_error_type =
+				MCE_RA_ERROR_PAGE_TABLE_WALK_LOAD_STORE_FOREIGN;
+			break;
+		case MC_ERROR_CTRL_MEM_ACCESS_OP_ACCESS:
+			mce_err.u.ra_error_type =
+				MCE_RA_ERROR_LOAD_STORE_FOREIGN;
+			break;
+		}
+		break;
 	case MC_ERROR_TYPE_UNKNOWN:
 	default:
 		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
-- 
2.31.1

