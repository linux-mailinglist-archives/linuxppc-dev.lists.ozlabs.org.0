Return-Path: <linuxppc-dev+bounces-4450-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E33A9FAF02
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Dec 2024 14:57:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YH02Q4WZ7z3011;
	Tue, 24 Dec 2024 00:57:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734962238;
	cv=none; b=HaXGoBUieIMyOVk8dZZdjFxgF4YtAD3214fnUqaL6PDtSnNA4kFKA9quJUuA3fe7FqSOYsPBHRWBQdtqesTIq1yPS+bnnqU5mDZ7Atmw8ZvVAEdoc/yF2BYtGZ9Rz/kdd4r0a5HqNoyvX9QWljAxfKhlTfJJUffUdB+pahglxYbM6SMSXca67jQSLHYBNjoq1ZTuGsQZS8trJSYdHsA0Mo6qlNRcwRvVIltu8f6QeM6vLNH0wftm7ZX/Zpubzl45qd41fVCZwcd0pWv1Z8eRbFTmk1RDMZCcX4q3D207sCagYlq5HYWUTF4vit0BEWZCVKlgUMZ9jGi7pWe1k+hYPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734962238; c=relaxed/relaxed;
	bh=giDiY/GsV//L0FnDp4rsjQSuGg9HbaPr/camPdZu0eA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h0szAT0lNj+vJtJSjzrX3WKYND6nEmD3swf2GmftEvDX9koQCffS73b97UQk2xZku+Hjm3blE+9GnufsA1xO6wGozH7JCQUotk35Uar0/b2EqquWQk7O2iHNCuZrtBOJ5x/6FDdzza4Ss8XZ8nCp+yRtZr4gVHDftrhUm/Upjk77+80uK+un51s6AOIPaT4bUHGGZCN1Q/YvSvrWIDrcgdqunHxf6dtHnJ2H/uoZqnAy4ejavfZ6GYv3jaNtEcIRvK2lypZ1izDT3SJaIUF8Hm7Y9zAcqlTbVl8MIijhTwpIsWQt8OQi9tEk3SU08dk0xKMZGwX/vmWyoDiQjpAWCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+MKa3zM; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G+MKa3zM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YH02P04JQz300g
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Dec 2024 00:57:16 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BMNbEbI016911;
	Mon, 23 Dec 2024 13:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=giDiY/GsV//L0FnDp4rsjQSuGg9HbaPr/camPdZu0
	eA=; b=G+MKa3zMUwBozCu0eU0QBkuRaBoOnxftfI8F/uw2AVOJuugAWit78evPs
	auHP0Ov5K63qW/uqMVHMPgRR+B8oSaB93bq2K6UL8ekOGUP/Ab94cv92QAVo9HhY
	zWQbHW6n1tHQ0c60VqMGgyFooPugFrSQulRq0nPzeIr+yMCjqQxzu6D2f+3qpekY
	3oD/CfLh3sa/1hXvdXrfPkRyHU3j0+VqsfGpkril+OIUeX+WClVRIkCzCC6JINai
	cF+FgtewDIo/5URkXdO0za03yfeJ0DbjsQbmzrwKaw7LTuZHhSHNJBhXif0bzJYH
	AlC1NXnFhfzNRys/0NYej64Lj+Dmw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43pvkaavrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:57:09 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BNDujbm005588;
	Mon, 23 Dec 2024 13:57:09 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43pvkaavrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:57:09 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BNDomj7002278;
	Mon, 23 Dec 2024 13:57:08 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43p80se27m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 13:57:08 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BNDv5E564160236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Dec 2024 13:57:05 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F21DD20043;
	Mon, 23 Dec 2024 13:57:04 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B77720040;
	Mon, 23 Dec 2024 13:56:59 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.61.252.112])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 23 Dec 2024 13:56:59 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
To: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com
Subject: [PATCH] tools/perf: Fix return code for lock_contention_prepare
Date: Mon, 23 Dec 2024 19:26:55 +0530
Message-Id: <20241223135655.8042-1-atrajeev@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.35.1
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
X-Proofpoint-GUID: H-8EwP8btbxQchzd_Jr8iecCoHyJp1tK
X-Proofpoint-ORIG-GUID: 1GsLyJGRKp9dnG_FarTL6Rl2FFt5Ee3z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 bulkscore=0 phishscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230121
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

perf lock contention returns zero exit value even if the lock contention
BPF setup failed.

   # ./perf lock con -b true
   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
   libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
   libbpf: failed to find valid kernel BTF
   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was CONFIG_DEBUG_INFO_BTF enabled?
   libbpf: failed to find '.BTF' ELF section in /lib/modules/6.13.0-rc3+/build/vmlinux
   libbpf: failed to find valid kernel BTF
   libbpf: Error loading vmlinux BTF: -ESRCH
   libbpf: failed to load object 'lock_contention_bpf'
   libbpf: failed to load BPF skeleton 'lock_contention_bpf': -ESRCH
   Failed to load lock-contention BPF skeleton
   lock contention BPF setup failed
   # echo $?
    0

Fix this by saving the return code for lock_contention_prepare
so that command exits with proper return code

Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
---
 tools/perf/builtin-lock.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
index 208c482daa56..2226c7dd4ae6 100644
--- a/tools/perf/builtin-lock.c
+++ b/tools/perf/builtin-lock.c
@@ -2049,7 +2049,8 @@ static int __cmd_contention(int argc, const char **argv)
 				goto out_delete;
 		}
 
-		if (lock_contention_prepare(&con) < 0) {
+		err = lock_contention_prepare(&con);
+		if (err < 0) {
 			pr_err("lock contention BPF setup failed\n");
 			goto out_delete;
 		}
-- 
2.43.5


