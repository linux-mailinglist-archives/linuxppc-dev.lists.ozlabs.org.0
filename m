Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE5E67DF84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 09:52:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3BCZ4ZBMz3fHf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 19:52:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TEs26Grb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TEs26Grb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3BBZ0qZyz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 19:51:17 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30R8a0sm001247;
	Fri, 27 Jan 2023 08:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Y9ihzWIW0KknL7nTFD8hTLznyRkhnaUIu79qOfASU48=;
 b=TEs26GrbqB1YMWD1wSAk+XMjlnJofyKML3kR2ZK+LlZ5PCaluXdCvv1hyDJK7l05znyQ
 sHqLDDTe3UBWQbR3gcYY0NtRSip5hLNnatnyQyBKycFrgkzzuD4u0fXJV8XcZa9cvMLq
 JVd4vB2JA4iZAr87S5NNf7rPF00K5T0U8OlITanVikBD7cP00tW83HaD9y5WkhHlZdsc
 yS5VVzduiozA4C2zP4U3LHSsVYYaJ34HUsC2D1FK9+36p7WA08KHzA8tOaYe/sUMD0F3
 xbz6jNcz7lrD5DQi5iWAradSsqLtYJdZUQy1QaArwDd6MTh3Jiq12nU1N8V/jI344c+b LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nc7udcg3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 08:51:14 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30R8iBaA022528;
	Fri, 27 Jan 2023 08:51:14 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nc7udcg33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 08:51:14 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30R6xQuH013377;
	Fri, 27 Jan 2023 08:51:11 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3n87p6d7s1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Jan 2023 08:51:11 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30R8p9AE20775532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Jan 2023 08:51:09 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E57D2004D;
	Fri, 27 Jan 2023 08:51:09 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4C6E20043;
	Fri, 27 Jan 2023 08:51:08 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Jan 2023 08:51:08 +0000 (GMT)
Received: from jarvis-ozlabs-ibm-com.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CCA6360570;
	Fri, 27 Jan 2023 19:51:04 +1100 (AEDT)
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/rtas: Replace one-element arrays with flexible arrays
Date: Fri, 27 Jan 2023 19:50:23 +1100
Message-Id: <20230127085023.271674-1-ajd@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: x3fhN0IBoVfUuKkGbKQsI8bDfgVtQYnH
X-Proofpoint-ORIG-GUID: ixfV2kinjspmUBOUFE2rtqbeecYO84rq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-27_04,2023-01-27_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 mlxlogscore=790 suspectscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301270079
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Leonardo Bras <leobras.c@gmail.com>, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Using a one-element array as a fake flexible array is deprecated.

Replace the one-element flexible arrays in rtas-types.h with C99 standard
flexible array members instead.

This helps us move towards enabling -fstrict-flex-arrays=3 in future.

Found using scripts/coccinelle/misc/flexible_array.cocci.

Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Leonardo Bras <leobras.c@gmail.com>
Cc: linux-hardening@vger.kernel.org
Link: https://github.com/KSPP/linux/issues/21
Link: https://github.com/KSPP/linux/issues/79
Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas-types.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas-types.h b/arch/powerpc/include/asm/rtas-types.h
index 8df6235d64d1..40ec03a05c0b 100644
--- a/arch/powerpc/include/asm/rtas-types.h
+++ b/arch/powerpc/include/asm/rtas-types.h
@@ -44,7 +44,7 @@ struct rtas_error_log {
 	 */
 	u8		byte3;			/* General event or error*/
 	__be32		extended_log_length;	/* length in bytes */
-	unsigned char	buffer[1];		/* Start of extended log */
+	unsigned char	buffer[];		/* Start of extended log */
 						/* Variable length.      */
 };
 
@@ -85,7 +85,7 @@ struct rtas_ext_event_log_v6 {
 					/* that defines the format for	*/
 					/* the vendor specific log type	*/
 	/* Byte 16-end of log */
-	u8 vendor_log[1];		/* Start of vendor specific log	*/
+	u8 vendor_log[];		/* Start of vendor specific log	*/
 					/* Variable length.		*/
 };
 
-- 
2.39.1

