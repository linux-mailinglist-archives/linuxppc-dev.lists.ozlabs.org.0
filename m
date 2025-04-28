Return-Path: <linuxppc-dev+bounces-8100-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47612A9F209
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 15:20:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmPFk6t9Pz303d;
	Mon, 28 Apr 2025 23:20:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745846426;
	cv=none; b=i9xT4rK9fkdXUtciVNbFlQceOkHqXvNW5O4LOhSXYD8cA/vldg6L3n2vKjTmW37bmQhuIKc/XSxb5dzMI+RK1YunpoQjgB9tQ9zFBm7p+U1zfBPjOnkYkZubZB+MRebTW6dvz4FbS8J1v+ljMHCSqlZBYyaDGig+3LGvkKe+dG3wZ2WBKUm+7E6YPRCOvFNPtKrOJJE2LSsgbKs1u7SpQ4WFMnEgvErsg3ykb0Ez6fpCrRdZHUWD09j1DftSTQx52zXPbPPGHR1ahnmHx8tPBnDqs5cspsDMkR+YZVSRZHngl7DD/FNlp31rlUn7g5tdag6RANyywaAptTGRtZ2UeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745846426; c=relaxed/relaxed;
	bh=mom3Z6GCnmxCCrmh/s8u73ghH34cGZTax8lhSWhcWjc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iIH6Yntjrp/R0ZAkcrEeQ6r8QIvWcOjX6C6v16dpnRSBMI9qDN5auMmN5UWz3leYbo+1WbZV5ZVl8twoSewoA7enLLeif9lRtEZeVGpceae3A7rh5seKqzYXnFjdzbyvlyC7zf8QZDHRlPlyQsSjcV2g3f51Xi+SB2nCUXw8UnDXZE/kA/s1CeddVTm1RhrTNuBe2Xx/CmT7U7fEMU/6heCRkSt4FZMqj2oJBSizlpt5z9zhXgI4iXON/MXG99VmPrLq/9f2I8xt3u41Ch3IO9HeR8eqjCCkkgL9LWJAEQX/Lbqpojnl+gyLvTaqWyZk5qxxK11H3D+CCbX2XTj2Fg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gwIgcoDE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gwIgcoDE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmPFh4VLJz2yqq
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 23:20:23 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SA4m0H029204;
	Mon, 28 Apr 2025 13:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=mom3Z6GCnmxCCrmh/s8u73ghH34c
	GZTax8lhSWhcWjc=; b=gwIgcoDE4fFjLtfmY/Ge1IvvbTHw+7Dda/qjEZ8MfqlO
	wSzVO3Flf3K5cS4v80UXaAWi4UB7SFijWfUPuyTc0qaXTm/dtdteJA/SZb0JZL7n
	VH0mWrTeaR9MKJM/wY/8OC2FmUBKVw2Fxhrv+LN/kOELtmCuxbqIQjJwEVnjLynX
	t6tqJqbwWICfPKLl4CHXNsiKQDmUlQsECdo+2zbxBiAeZVgjW4LUoU4qYzePFycC
	2ZNf0PhFtxiVJOfHdM8j24JaDSuUwa5bRDGE/LTChAk1BjcBAXbdRZSpRTHiUYAJ
	YcNrRrTIFPHW+5wiaWwcssXfgeCCDafOC6x+Hy6AQg==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a7kk0vd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 13:20:04 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAZjga016174;
	Mon, 28 Apr 2025 13:20:03 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469a706pet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 13:20:02 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SDJxK943057470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 13:19:59 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F13C420043;
	Mon, 28 Apr 2025 13:19:58 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6053620040;
	Mon, 28 Apr 2025 13:19:55 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com (unknown [9.124.219.50])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 13:19:55 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Segher Boessenkool <segher@kernel.crashing.org>,
        linuxppc-dev@lists.ozlabs.org, "Nysal Jan K.A." <nysal@linux.ibm.com>,
        Kevin Brodsky <kevin.brodsky@arm.com>, linux-mm@kvack.org,
        linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] selftests/mm: Fix build break when compiling pkey_util.c
Date: Mon, 28 Apr 2025 18:49:34 +0530
Message-ID: <20250428131937.641989-1-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=OYSYDgTY c=1 sm=1 tr=0 ts=680f8084 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=obKkJqyyVAjaa7KXnx4A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: nexDyk0xDNlDCevnYb_Fu1jgIGHhDnee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEwOCBTYWx0ZWRfXxHGyuOKchSar B9IHLyd97mmtUQOyze8E4YvwwGwlaQC6DIaTheSGzkK3EtwK/f75LN1WQJYML6Jgz7DUR6Nja7p eKFvGIzOZaiQoNoJUVfmtZHdqIO7/WKSnk7svY9cE9MP9Gzzk8+A+TYy14tAL9llPM6qP04b5ZN
 TsTP4I3DQygvNKItbD784sY4CsXvbkP3DhlD8pJOxANRKpso0+tLact/7ITlMTdUqhuajwSrYwH uxOxs0q3RuIAUWkpvX4isJHxX+uWcHWP9yKDPSSlR/vFCDSbam0jLPUFWg6wI7f2IVlZ+VQXJx8 StzLHwLHh2Ord9qJv9TcXJXR/ajRyvToxrsxMt2MLkd+1zr0yHlpH6t2/jYWKQZrbAzwIjiMA8T
 4zkslazeMp9tfkEhMICPStl4e+3d9MR/3ahVkA73+LfBwPT5fBlk9ZvXsJZf0OI8L9MN0/i9
X-Proofpoint-ORIG-GUID: nexDyk0xDNlDCevnYb_Fu1jgIGHhDnee
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280108
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Commit 50910acd6f615 ("selftests/mm: use sys_pkey helpers consistently")
added a pkey_util.c to refactor some of the protection_keys functions accessible
by other tests. But this broken the build in powerpc in two ways,

pkey-powerpc.h: In function ‘arch_is_powervm’:
pkey-powerpc.h:73:21: error: storage size of ‘buf’ isn’t known
   73 |         struct stat buf;
      |                     ^~~
pkey-powerpc.h:75:14: error: implicit declaration of function ‘stat’; did you mean ‘strcat’? [-Wimplicit-function-declaration]
   75 |         if ((stat("/sys/firmware/devicetree/base/ibm,partition-name", &buf) == 0) &&
      |              ^~~~
      |              strcat

Since pkey_util.c includes pkeys-helper.h, which in turn includes pkeys-powerpc.h,
stat.h including is missing for "struct stat". This is fixed by adding "sys/stat.h"
in pkeys-powerpc.h

Secondly,

pkey-powerpc.h:55:18: warning: format ‘%llx’ expects argument of type ‘long long unsigned int’, but argument 3 has type ‘u64’ {aka ‘long unsigned int’} [-Wformat=]
   55 |         dprintf4("%s() changing %016llx to %016llx\n",
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   56 |                          __func__, __read_pkey_reg(), pkey_reg);
      |                                    ~~~~~~~~~~~~~~~~~
      |                                    |
      |                                    u64 {aka long unsigned int}
pkey-helpers.h:63:32: note: in definition of macro ‘dprintf_level’
   63 |                 sigsafe_printf(args);           \
      |                                ^~~~

These format specifier related warning are removed by adding
"__SANE_USERSPACE_TYPES__" to pkeys_utils.c.

Fixes: 50910acd6f615 ("selftests/mm: use sys_pkey helpers consistently")
Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Nysal Jan K.A. <nysal@linux.ibm.com>
---
 tools/testing/selftests/mm/pkey-powerpc.h | 2 ++
 tools/testing/selftests/mm/pkey_util.c    | 1 +
 2 files changed, 3 insertions(+)

diff --git a/tools/testing/selftests/mm/pkey-powerpc.h b/tools/testing/selftests/mm/pkey-powerpc.h
index 1bad310d282a..d8ec906b8120 100644
--- a/tools/testing/selftests/mm/pkey-powerpc.h
+++ b/tools/testing/selftests/mm/pkey-powerpc.h
@@ -3,6 +3,8 @@
 #ifndef _PKEYS_POWERPC_H
 #define _PKEYS_POWERPC_H
 
+#include <sys/stat.h>
+
 #ifndef SYS_pkey_alloc
 # define SYS_pkey_alloc		384
 # define SYS_pkey_free		385
diff --git a/tools/testing/selftests/mm/pkey_util.c b/tools/testing/selftests/mm/pkey_util.c
index ca4ad0d44ab2..255b332f7a08 100644
--- a/tools/testing/selftests/mm/pkey_util.c
+++ b/tools/testing/selftests/mm/pkey_util.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#define __SANE_USERSPACE_TYPES__
 #include <sys/syscall.h>
 #include <unistd.h>
 
-- 
2.47.0


