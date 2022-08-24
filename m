Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3135E59F13D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 04:08:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MC8dh0cq7z3cB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Aug 2022 12:08:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YRfUE+OG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YRfUE+OG;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MC8bt0lkrz3bc5
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Aug 2022 12:06:49 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27O1Tlxo024815;
	Wed, 24 Aug 2022 02:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=leq61+ugIoBeN4Hdk9BXN/4As0HhrcndFKr6kVgCnMc=;
 b=YRfUE+OGVg3yvJB6k16cJ1QQQwpgfPSnE4a7Z57AKmiuX7rTSAzaa4sJzB3M4JfPptgW
 neoupKIygNFfKlblvWdEMcdC1YVI+CFZ7uQGEZkNFgzzPbXtMnGntsJ3c46DlWt8+1xY
 ekYkXQ3+An5Uy66ngrbHVwJwUPB0bhU83uuW29EjjyBhYDBwZU1JYWYsbYdGGnIaUi05
 ApOr9olNHJdaBI0Jx8z12ldsqOcd9kqD2BoenZREtv+xrMIpGkijTT8FYXVjGfIoY2YG
 XYQpGKmMcxu/nUuFnIKjGCSHBsSgZ20E7zQJONNg/9y5yaNM0J7XDRJgnsTGOXhIw8fM sQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j5acgrr8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:42 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27O26eNP024761;
	Wed, 24 Aug 2022 02:06:40 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3j2pvjb9xw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Aug 2022 02:06:40 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27O26c2C31261092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 24 Aug 2022 02:06:38 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49240AE04D;
	Wed, 24 Aug 2022 02:06:38 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E7C9CAE045;
	Wed, 24 Aug 2022 02:06:37 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 24 Aug 2022 02:06:37 +0000 (GMT)
Received: from civic.. (unknown [9.177.18.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EF72B60430;
	Wed, 24 Aug 2022 12:06:34 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 04/20] powerpc: Provide do_ppc64_personality helper
Date: Wed, 24 Aug 2022 12:05:32 +1000
Message-Id: <20220824020548.62625-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824020548.62625-1-rmclure@linux.ibm.com>
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mmRHbltZs3jsmL48PAmOUc5vO_QNiJWz
X-Proofpoint-ORIG-GUID: mmRHbltZs3jsmL48PAmOUc5vO_QNiJWz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-23_10,2022-08-22_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 mlxlogscore=446 suspectscore=0 mlxscore=0 adultscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208240005
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Avoid duplication in future patch that will define the ppc64_personality
syscall handler in terms of the SYSCALL_DEFINE and COMPAT_SYSCALL_DEFINE
macros, by extracting the common body of ppc64_personality into a helper
function.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V2  -> V3: New commit.
---
 arch/powerpc/kernel/syscalls.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index ef5896bee818..9f29e451e2de 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -64,7 +64,7 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
 }
 
 #ifdef CONFIG_PPC64
-long ppc64_personality(unsigned long personality)
+static inline long do_ppc64_personality(unsigned long personality)
 {
 	long ret;
 
@@ -76,6 +76,10 @@ long ppc64_personality(unsigned long personality)
 		ret = (ret & ~PER_MASK) | PER_LINUX;
 	return ret;
 }
+long ppc64_personality(unsigned long personality)
+{
+	return do_ppc64_personality(personality);
+}
 #endif
 
 long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
-- 
2.34.1

