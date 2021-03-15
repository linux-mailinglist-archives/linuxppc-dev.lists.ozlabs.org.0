Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CBE733B152
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 12:41:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzZJb1qxvz30CN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 22:41:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WuPLuLlk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WuPLuLlk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzZGF2WRNz2yyh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 22:39:48 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FBXxc7109125; Mon, 15 Mar 2021 07:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=unpid1XboFIP7xQdeLDjgLlxdIrVjLZI6BD7wO6EMUM=;
 b=WuPLuLlkZyjnfD8O3ffTSWlU08qo9xUWBhHNsAJIC3X8vw8gdeb0XntNuukS3maynZSS
 JOLhryE8o+xV9hFFK/PgHY1NPuEZK9xDcjiUrkS/QgMzKy5s9D9afQPmu6FJbopN58E1
 v5VklNIMgph0UEXvOCJf5lQ4yPGKGzOFynulACCFyxF3mL8DjiJKYZ14TxqH6Y6AHrRQ
 5w7F5fHb/4hmLNEeYp/eI/hKpmguj4+ZD2r6XI/tYE3e2D2ZFxn+XO+mgJe8J4IPgDTg
 cvTMnRiABQh5AbTvUIDRvpmA3dYjLG9XeSTREkQQMX94cYHcT4ahRARKL3VIosbVWrE3 dQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379rh49a36-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:42 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FBYTU4111396;
 Mon, 15 Mar 2021 07:38:42 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379rh49a2m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:42 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FBWXOM032008;
 Mon, 15 Mar 2021 11:38:41 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 37a6t30138-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:38:41 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FBcew229491498
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:38:40 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2664CAC05B;
 Mon, 15 Mar 2021 11:38:40 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5F0B0AC05F;
 Mon, 15 Mar 2021 11:38:37 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.36.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 11:38:37 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 2/6] selftest/mremap_test: Avoid crash with static build
Date: Mon, 15 Mar 2021 17:08:20 +0530
Message-Id: <20210315113824.270796-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
References: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 adultscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150081
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

