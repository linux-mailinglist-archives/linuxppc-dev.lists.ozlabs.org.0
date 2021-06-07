Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4717E39D485
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:54:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz2cx5DVNz3cCm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 15:54:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oce6uERg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oce6uERg; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz2Zc2bywz3090
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 15:52:24 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1575j1vf134199; Mon, 7 Jun 2021 01:52:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2mb+Zu4h2cMdimbXX7REoAFM39Ex/i5ZK0I2oLhr1yo=;
 b=oce6uERgT/jSov4zC68yRtEtbeW/ZHiVjYABROyVT2pUWBQMdMF5BZPepyrjIfbBs2SR
 y56Dao8stAvZIQ15VN4+TGmgodJmxrSGSOvx1xsI2RgjBaYsIU7iVyJ7VQ0f/yjkN9E5
 CYBLCWaxhnEq+oC6nqLAcg++RP/yxf4DOypwNZpk3ZjvPm/ZQdh4lGgfRPfGSWLpQrf4
 W78qfrSJ0S2El9HzAXSqSgX3sNQjxhyj/LBhZwwoBwPyxsSkYnw5OjohV6jeRhlPN3lA
 IukkOHiHzwfxJb3+YWmIKw0UJCK7BKZys7//39Y5plBEfdd5DqP0kERA599PpvVFrAC9 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 391djvr4wn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:13 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1575jVga135677;
 Mon, 7 Jun 2021 01:52:13 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 391djvr4wb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:13 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1575h5RZ009731;
 Mon, 7 Jun 2021 05:52:12 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3900w97syv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 05:52:12 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1575qBbn21561604
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 05:52:12 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DE42E28059;
 Mon,  7 Jun 2021 05:52:11 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43A492805C;
 Mon,  7 Jun 2021 05:52:08 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.32.129])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Jun 2021 05:52:07 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v7 04/11] selftest/mremap_test: Avoid crash with static build
Date: Mon,  7 Jun 2021 11:21:24 +0530
Message-Id: <20210607055131.156184-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vRF3pJj7oW4YWFAIfr3GOSUVl7hyuCJ8
X-Proofpoint-GUID: tkCz5n7df0EOH9RrfKoIV0727J8Vk9R3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_03:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0
 suspectscore=0 spamscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501
 adultscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106070042
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With a large mmap map size, we can overlap with the text area and using
MAP_FIXED results in unmapping that area. Switch to MAP_FIXED_NOREPLACE
and handle the EEXIST error.

Reviewed-by: Kalesh Singh <kaleshsingh@google.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 tools/testing/selftests/vm/mremap_test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vm/mremap_test.c b/tools/testing/selftests/vm/mremap_test.c
index c9a5461eb786..0624d1bd71b5 100644
--- a/tools/testing/selftests/vm/mremap_test.c
+++ b/tools/testing/selftests/vm/mremap_test.c
@@ -75,9 +75,10 @@ static void *get_source_mapping(struct config c)
 retry:
 	addr += c.src_alignment;
 	src_addr = mmap((void *) addr, c.region_size, PROT_READ | PROT_WRITE,
-			MAP_FIXED | MAP_ANONYMOUS | MAP_SHARED, -1, 0);
+			MAP_FIXED_NOREPLACE | MAP_ANONYMOUS | MAP_SHARED,
+			-1, 0);
 	if (src_addr == MAP_FAILED) {
-		if (errno == EPERM)
+		if (errno == EPERM || errno == EEXIST)
 			goto retry;
 		goto error;
 	}
-- 
2.31.1

