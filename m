Return-Path: <linuxppc-dev+bounces-4197-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 547C19F3535
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 17:03:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBl9L4mK4z2ykT;
	Tue, 17 Dec 2024 03:03:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734365014;
	cv=none; b=jz8I124+ZAqHm2TLHAvCvJYEGOnNhDS+tTGfPh6EfZ+m3kK5HFlWG/g+ZbcqSDZfdHajI9Jqq1H1QOQPPORraZEJi62GIYprr2Hzphk12B4YU9od/UXySm43Z7YPJ4/QN+sdn5sDsMIN3t5Dq7gAwHjRYunri+ON5VMHur8hvgj72RHzvo4ivIR6UJyvhpZX7EcJjFWnOWZW1/FljOkvx7vxhT6XPWt11dwz7w3BuALg3y7vT+RSvwHaOuQcKY3xQIjxS/E244pebrP7+llu6hsToDw+o5vaaRFJO3WFI6+HUdkdgxcMT5U+hXLeDgNZ/RCL96VpTeoGQHOK52UsCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734365014; c=relaxed/relaxed;
	bh=RCVLKfhWJCbjaMmnXe6N2Zyz7tcxzv6poeIYndSnnrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EILF4s9piqARYhP4cWKQeStaeUkomSwUOsk2EEOdi6/nsAccQFJlby8SrLAOJfRyPVENDHG9RGfY9RByCC12I8CJr3C/VxFlnANQI1STmyiFJidpeO4PNEZiiESYyEheC/AIg8E2siFS5OdTFhVjhHqvzDvdSij+q94O1ckTjHOeXJJRh11pByoxapAaKWzNnGVeRfktYLVJPstB4BEpmJ3s25gZIlqk+mIjvLDwa3BV54JokGu+xnTF/ZL6WwFX8kr8wNcnFG8n9anG+wAzZMASD3vcg5sRhjrC3AU47wgZ7kkmZ1o93VrrzFhZrh7SWaG0XcZLBkhSwpyxyHesxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HpfnXVhQ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HpfnXVhQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBl9K2mDBz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 03:03:32 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG85ZAR027025;
	Mon, 16 Dec 2024 16:03:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=RCVLKfhWJCbjaMmnXe6N2Zyz7tcxzv6poeIYndSnn
	rY=; b=HpfnXVhQgfPVWU71I7K7DK+MVz0iF2CwAPTDZcVfFwFPXcA6LgCx8mbTx
	gFTnMbcZDxKjtbT+0fCIgeRxhiYjh3bvJwNUxE/DQoEoLD6cLPdGmAJg63YYOo+m
	M4mXl8vldFWqAjwkAZHmuh5oM/hEqhSAjLxohFQMMHxkyXVII/4nikrm8MDUk6OT
	3sQ8Xs/iObcZHrkT5Udq8iiK7gNPwFyXqVdLGpV7alCABhGmozictDzT0HaUecpd
	SsDCJV7e3n6hfYzxT2O5uqfM60MXTlki6Iq3j9jO7HSU53HLzXPrp3RaGeXOb/FE
	VXjh8z8JN7Ib4ep+5f/SrWFmM/nxw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd2a6uv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:03:16 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BGFvOar002125;
	Mon, 16 Dec 2024 16:03:15 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd2a6ut-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:03:15 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGDGd2J014335;
	Mon, 16 Dec 2024 16:03:15 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hmqxxqvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 16:03:14 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGG3CwO56557832
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 16:03:13 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE7B020043;
	Mon, 16 Dec 2024 16:03:12 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5257F20040;
	Mon, 16 Dec 2024 16:03:08 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.70.111])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 16 Dec 2024 16:03:07 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, shuah@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v2 1/3] selftest/powerpc/ptrace/core-pkey: Remove duplicate macros
Date: Mon, 16 Dec 2024 21:32:55 +0530
Message-ID: <20241216160257.87252-1-maddy@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
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
X-Proofpoint-ORIG-GUID: FqP9MSwlZrjK36Tm0lLUCbHYkzUOpM49
X-Proofpoint-GUID: iZYQ-MdNYGFseBY_YtM2APteLGAeyohr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxlogscore=999 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160133
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

./powerpc/ptrace/Makefile includes flags.mk. In flags.mk,
-I$(selfdir)/powerpc/include is always included as part of
CFLAGS. So it will pick up the "pkeys.h" defined in
powerpc/include.

core-pkey.c test has couple of macros defined which
are part of "pkeys.h" header file. Remove those
duplicates and include "pkeys.h"

Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
---
Changelog v1:
 - Added Reviewed-by tag
 - made changes to commit message

 .../selftests/powerpc/ptrace/core-pkey.c      | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/tools/testing/selftests/powerpc/ptrace/core-pkey.c b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
index f6da4cb30cd6..31c9bf6d95db 100644
--- a/tools/testing/selftests/powerpc/ptrace/core-pkey.c
+++ b/tools/testing/selftests/powerpc/ptrace/core-pkey.c
@@ -16,14 +16,7 @@
 #include <unistd.h>
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
@@ -61,16 +54,6 @@ struct shared_info {
 	time_t core_time;
 };
 
-static int sys_pkey_alloc(unsigned long flags, unsigned long init_access_rights)
-{
-	return syscall(__NR_pkey_alloc, flags, init_access_rights);
-}
-
-static int sys_pkey_free(int pkey)
-{
-	return syscall(__NR_pkey_free, pkey);
-}
-
 static int increase_core_file_limit(void)
 {
 	struct rlimit rlim;
-- 
2.47.0


