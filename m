Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE28732602
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 05:52:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ppSbcNfc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qj4wc3ZYXz3c0n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:52:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ppSbcNfc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qj4sj6hlgz305l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 13:49:29 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3mgeU020290;
	Fri, 16 Jun 2023 03:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6TW9Sd19khmZRhCsduUEg/8q60ASonZVrUk8iMjnu8U=;
 b=ppSbcNfcq/x94Ekf2KF1QtJad4F7BdJXvXIVOVIrGMHTD8pN98Q/239TADyumMdMieXn
 ydZMUkfLTZQMPPh5DPm4hr4ZrbQs54SmarI50CSrmGqhF1FbM+xRi6Ee0a2Dmye7KuM7
 JGh8hLhzw5oHZmb0v4g183iV4kOwkuOawMccjJdbmCRl3X0jwkmjh4YBh1K4ZTJZ1Nwk
 28u42qBcC7gp+EUliS30WshgUe9MuUGoEYgqldx6CATadRMBuHDHtifnIToQOWv+ldJT
 KMqlhgAlTgRItfNuoJEecGkSCb2FsIch4+geN5nYHeZBZLvrzwZ0VtuYIEMRrIBCswmZ hw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8g5fr05m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:24 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35G3nO1g021182;
	Fri, 16 Jun 2023 03:49:24 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8g5fr05a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:23 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G3Fglg030762;
	Fri, 16 Jun 2023 03:49:22 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3r4gedu1m8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 03:49:22 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35G3nJtA11338394
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 03:49:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2A8520043;
	Fri, 16 Jun 2023 03:49:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3D1E920040;
	Fri, 16 Jun 2023 03:49:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 03:49:19 +0000 (GMT)
Received: from bgray-lenovo-p15.ibmuc.com (unknown [9.43.205.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 4A772604D1;
	Fri, 16 Jun 2023 13:49:15 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/11] powerpc/ptrace: Add missing <linux/regset.h> include
Date: Fri, 16 Jun 2023 13:48:37 +1000
Message-Id: <20230616034846.311705-3-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616034846.311705-1-bgray@linux.ibm.com>
References: <20230616034846.311705-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bW3h0rjeyEsXYRfxTRw9e8KlhOvzAcJh
X-Proofpoint-ORIG-GUID: yFB4JYGfVMsQwlnavOLhzn718rKW1jHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_17,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 phishscore=0 impostorscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306160032
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com, npiggin@gmail.com, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ptrace-decl.h uses user_regset_get2_fn (among other things) from
regset.h. While all current users of ptrace-decl.h include regset.h
before it anyway, it adds an implicit ordering dependency and breaks
source tooling that tries to inspect ptrace-decl.h by itself.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>

---

v3:	* Add ruscur reviewed-by
v2:	* New in v2
---
 arch/powerpc/kernel/ptrace/ptrace-decl.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-decl.h b/arch/powerpc/kernel/ptrace/ptrace-decl.h
index eafe5f0f6289..463a63eb8cc7 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-decl.h
+++ b/arch/powerpc/kernel/ptrace/ptrace-decl.h
@@ -1,5 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 
+#include <linux/regset.h>
+
 /*
  * Set of msr bits that gdb can change on behalf of a process.
  */
-- 
2.40.1

