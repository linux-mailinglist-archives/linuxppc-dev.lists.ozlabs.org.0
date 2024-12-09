Return-Path: <linuxppc-dev+bounces-3872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6819E9A22
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2024 16:14:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y6QQJ5WyJz2yZ4;
	Tue, 10 Dec 2024 02:14:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733757288;
	cv=none; b=mnvwYy9vyEh3PmJzJJIV+U4l6jYv349IbFUQ1NKzP5T42TSDrCpj8DXy40MZy8dTNMHQxv0RCzeZmSrehNfVmywCHGSLZSCh1dcezpEzxwn6R1VwshiXZzsZO6ruBx6bI/BBgpYW+9tXiqXUOpMt/zruOMYbTsr9vyZtb65+nTnZwXJWdmm0D3Qqzp8tycJr64Vg6qy1sFKdb2uW2kZ+z20GnjA4Pe+lKnwaD+OfUF4fwU3OCbhQTWIxHYkbUd03hjS8rxFrLU0TPAERdnCAuQPYunRO/QqaZ1aEO2JuVm+Cg1gbd2TiRb8Z8E7ow1CD+KsTOO8oMcNrIR9XPNh5lQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733757288; c=relaxed/relaxed;
	bh=Jf1DnB1tSe8lT308iZmGeXnhbDqfZIragnRW7aWxZlY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h2X62Ws+/J2XnfxOOXivbgkUjrU6q4Jh+kmqkWT3N1QVByJuoSFklu2VRoqeDZB6a9EY7p1VqozHpV9y+Gui4gVECswO59gOc3ZhqnfoPeKlMZEnejRI0vuYmjZc+5Ex46CIkeNYxXqedvNvBRQYWc93vy4N3UfNT1YlefzbP5ub12BvqAzX6NY0uCBKQ8L/11vVAgUTYivDHbmyY14BwWxqHDlr9JOhhYlV5DIK8EDKxIqJqE2qcabJ3A5yjDGJAuexFq7iZBJ9tRupc+yrVAykLQPZrs6RGsxW1nTeS0uq0stG5nTPzBFVnJ9XkQDfzNqwxJSH6STBpOhiTy6EVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ERsbdre/; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ERsbdre/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y6QQF3J8Qz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2024 02:14:45 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B99RQvD001930;
	Mon, 9 Dec 2024 15:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Jf1DnB1tSe8lT308i
	ZmGeXnhbDqfZIragnRW7aWxZlY=; b=ERsbdre/qxblOqQjFLYpCs4jT6i/KSNkz
	pBfJrTlcETrqAunBPpVjwBefnXADW3jyYnUff53wzJkhe9CumQzyQyymsKIQg1y2
	HE53RpfoJY+0rPCbVNdy0EgmBGKjva6BGu4Fwme4H7rhyDM/iSsgHDr6iH3dwXmG
	GxLAnvsnd0BtkWOx0jiLcWZSQMjUhLrsz4t8yetYfMNdotfLlbuHWDdGaz2HaDEk
	TJl4iZsRHoRzT/y/OxrU2lNF45RVjHNcrn0hW0j249FRJa11bNbpPXO6ji/k3A2b
	1J4Q8VLRsLEbZH5u9+Hi5acnK6WA+8PAJlCp/9CqHJBv3gE9VEzmw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cbsq1djs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 15:14:31 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4B9F8iie032663;
	Mon, 9 Dec 2024 15:14:31 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43cbsq1djn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 15:14:31 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4B9DTqP2032727;
	Mon, 9 Dec 2024 15:14:30 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43d0ps7des-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Dec 2024 15:14:30 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4B9FESWO49479938
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Dec 2024 15:14:29 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDA8A20040;
	Mon,  9 Dec 2024 15:14:28 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBCE520043;
	Mon,  9 Dec 2024 15:14:26 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.38.185])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Dec 2024 15:14:26 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [PATCH 2/3] selftest/powerpc/ptrace/ptrace-pkey: Remove duplicate macros
Date: Mon,  9 Dec 2024 20:44:17 +0530
Message-ID: <20241209151418.348085-2-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241209151418.348085-1-maddy@linux.ibm.com>
References: <20241209151418.348085-1-maddy@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: U8u_uvfXx34om2SxO6ddW6d7mtOzVadS
X-Proofpoint-GUID: Np7d7_hTcoh8-L7qtazuNgbDHoKACHRt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=835 adultscore=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412090117
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ptrace-pkey.c test has macros defined which
are part of "pkeys.h" header file. Remove those
duplicates and include "pkeys.h"

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
 .../testing/selftests/powerpc/ptrace/ptrace-pkey.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
index d89474377f11..6893ed096457 100644
--- a/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/ptrace-pkey.c
@@ -7,14 +7,7 @@
  */
 #include "ptrace.h"
 #include "child.h"
-
-#ifndef __NR_pkey_alloc
-#define __NR_pkey_alloc		384
-#endif
-
-#ifndef __NR_pkey_free
-#define __NR_pkey_free		385
-#endif
+#include "pkeys.h"
 
 #ifndef NT_PPC_PKEY
 #define NT_PPC_PKEY		0x110
@@ -61,11 +54,6 @@ struct shared_info {
 	unsigned long invalid_uamor;
 };
 
-static int sys_pkey_alloc(unsigned long flags, unsigned long init_access_rights)
-{
-	return syscall(__NR_pkey_alloc, flags, init_access_rights);
-}
-
 static int child(struct shared_info *info)
 {
 	unsigned long reg;
-- 
2.47.0


