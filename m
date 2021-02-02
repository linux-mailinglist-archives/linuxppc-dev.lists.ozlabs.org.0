Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5823D30D040
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:27:04 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjDP1N8SzDqKK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:27:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LQ6tFnwE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVJwM1HkXzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 20:11:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112927FQ125477; Tue, 2 Feb 2021 04:11:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=unpid1XboFIP7xQdeLDjgLlxdIrVjLZI6BD7wO6EMUM=;
 b=LQ6tFnwEiuIYJ+8DvaEyWpnJ9d87DD7ygdGWb8e31V1TswRSLq9cY8aYwgYmoDAHUqd4
 wi/+JtX3DL0TxR9VWNYCeVMTGuCGAd3XEqek60bF2RF2m0NerQ7e9oLISW5JzG2gWPkJ
 UIRkBGQiMwKP4DIVDzPToVKVXxTS25G6dG6NcmidPLet1gYImgApmw6owhikxfQrRULO
 c4hkyo2kt3wG5vNZFEWEjKJ/dkQPGJcxWG8CFJaCh8OcOOCME7NKZcrMRWw0FNPTjx6h
 KoGJJsolAjUq3n39n6b4QPY58FKAOYSTwtLfFp/F7jln+m4YG3OQtBty48JW0+ZujX6V 6Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f38ch6kb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 04:11:30 -0500
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 112959O6140319;
 Tue, 2 Feb 2021 04:11:29 -0500
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f38ch6jy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 04:11:29 -0500
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112987s4031104;
 Tue, 2 Feb 2021 09:11:28 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma03wdc.us.ibm.com with ESMTP id 36f2nwrfmq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:11:28 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1129BShO28901792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 09:11:28 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A5482805E;
 Tue,  2 Feb 2021 09:11:28 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 207E428058;
 Tue,  2 Feb 2021 09:11:25 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.35.92])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 09:11:24 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [RFC PATCH 2/6] selftest/mremap_test: Avoid crash with static build
Date: Tue,  2 Feb 2021 14:41:12 +0530
Message-Id: <20210202091116.196134-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
References: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_04:2021-01-29,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0 mlxlogscore=999
 clxscore=1011 suspectscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020059
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
Cc: peterz@infradead.org, kaleshsingh@google.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With a large mmap map size, we can overlap with the text area and using
MAP_FIXED results in unmapping that area. Switch to MAP_FIXED_NOREPLACE
and handle the EEXIST error.

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
2.29.2

