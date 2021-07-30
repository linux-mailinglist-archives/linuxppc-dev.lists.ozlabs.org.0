Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CD3C3DBE56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jul 2021 20:25:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GbwnS0c0nz3dLD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 31 Jul 2021 04:25:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SdmeEPW5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SdmeEPW5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gbwly47Rrz2yNS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Jul 2021 04:24:29 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16UILZhc086527; Fri, 30 Jul 2021 14:24:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=+aHhODXsrxgCZJXS6IWNFCGR8ORRlbmmf+HOQMIbJus=;
 b=SdmeEPW5zI123+C6f9elpPAaURtWUU1iKm0nmZm3IcgrUfM8dJQ7L3rduv6ZAw20WkVW
 ZOHiWfXPyNuRB4tqM1oh2q+prjWr2totrEGcvKLhFMZWOeBA118m1CoEvFsY0Tu9UQ3t
 d1/Ai2t8DDt60C0naw3BSNf6Z5VYbIE4QvVzlPFUxFN2xq/OadEw0Os66Ygfwt1UC+RA
 haIEhdvC2AxO6bHmWar2lakXpvPNaW/GHdoYSlVn+XCgwDm5BdLM7SoQKGnChLHfiR7B
 jZ789uXnIj23uTYYkoj6+ncrddlcNn7MXdRtOLmeWiX2l0QGE3qOPEtpJhQWbgTChZS/ 2g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a4pmtg20j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 14:24:18 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16UINelJ092698;
 Fri, 30 Jul 2021 14:24:17 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a4pmtg200-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 14:24:17 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16UIN328020502;
 Fri, 30 Jul 2021 18:24:15 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3a235m4k0y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 30 Jul 2021 18:24:15 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16UIOBA125428400
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 30 Jul 2021 18:24:11 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A37AA406E;
 Fri, 30 Jul 2021 18:24:11 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4F13AA404D;
 Fri, 30 Jul 2021 18:24:09 +0000 (GMT)
Received: from li-c7b85bcc-2727-11b2-a85c-a9ba7f3a2193.ibm.com (unknown
 [9.199.33.196])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 30 Jul 2021 18:24:08 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH 1/3] powerpc/pseries: Parse control memory access error
Date: Fri, 30 Jul 2021 23:53:47 +0530
Message-Id: <20210730182349.625819-1-ganeshgr@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AaW5U39ZKX8x4B9up8Qm0akyh4NH4Yla
X-Proofpoint-GUID: G1-istGlzmUQ8ATQTEu35K90QB77UTIt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-30_11:2021-07-30,
 2021-07-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 mlxscore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 clxscore=1011 priorityscore=1501 impostorscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2107300121
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

