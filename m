Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EECA768E68F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 04:23:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBQLw5fcVz3cfj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 14:23:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TlY/a21R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TlY/a21R;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBQL0030Kz3bZS
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 14:22:47 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3182fhVm002760;
	Wed, 8 Feb 2023 03:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=5+5hZUi4Jcgch4zvexbQa7Ouh86HRz4OYReGodpqrBM=;
 b=TlY/a21RVy9Jpj9dZmSv2ySpfJiMNZFJWRjakE6iZLrXtYl3DkEeknLKlFXeLpRqxop6
 0gqhX+UWn8ty0nMJzv31bbue+S9saKcKFy0BU4E8QMcgFCW3E2zilnDs12DaGPI7CsBj
 4a+kBW6YhGaTZRd6qL8DPqLLdWyjawDBd3uW0dciSh7Wg4ZnUT209BCRND6rQFVkbNJ7
 y0idW2p86Jy6zVQdJipGj+h69KEUWvEkAH7qRf2nrBqyGfYRtcW8Qly9yD6TCq75QKfn
 Zn9yL878x1HG/nTIzj96BVHHQaO60KccO07TCs855uXr/WLAtcWVv8EEwsRgiGA0FNsF cA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm365rt1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:22:41 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3183MeXY018373;
	Wed, 8 Feb 2023 03:22:40 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nm365rt10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:22:40 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 317FQ0LR005658;
	Wed, 8 Feb 2023 03:22:38 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nhf06k1ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Feb 2023 03:22:38 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3183MZJU25297340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Feb 2023 03:22:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A301D2004B;
	Wed,  8 Feb 2023 03:22:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F89520040;
	Wed,  8 Feb 2023 03:22:35 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Feb 2023 03:22:35 +0000 (GMT)
Received: from civic.. (unknown [9.177.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CD5BA6010B;
	Wed,  8 Feb 2023 14:22:26 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux.xtensa.org
Subject: [PATCH v4 0/7] powerpc: Add KCSAN Support
Date: Wed,  8 Feb 2023 14:21:55 +1100
Message-Id: <20230208032202.1357949-1-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0YtByvtbG-9hUqj9B-wCxHPKVx3mw5vY
X-Proofpoint-ORIG-GUID: 1lXJiIfC8CXjgYQVFIj60aCA56cqymc8
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-07_15,2023-02-06_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 mlxlogscore=777 mlxscore=0 clxscore=1011 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302080027
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
Cc: chris@zankel.net, elver@google.com, npiggin@gmail.com, jcmvbkbc@gmail.com, Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add Kernel Concurrency Sanitiser support for PPC64. Doing so involves
exclusion of a number of compilation units from instrumentation, as was
done with KASAN.

KCSAN uses watchpoints on memory accesses to enforce the semantics of
the Linux kernel memory model, notifying the user of observed data races
which have not been declared to be intended in source through the
data_race() macro, in order to remove false positives.

A number of such race conditions are identified. This patch series
provides support for the instrumentation, with bug fixes as well as
removal of false positives to be issued in future patches.

As of v4, provide stubs for __atomic_* builtins for 8-byte values
for 32-bit systems without toolchain support. This generalises xtensa's
stubs, and causes xtensa to use generic implementation.

v3: Restrict support to PPC64 as kcsan code expects support for
__atomic* builtins for 64-bit atomic types.
Link: https://lore.kernel.org/linuxppc-dev/449b9d60-18f6-ebf3-9878-ae54a61d1e49@csgroup.eu/

v2: Implement __smp_mb() in terms of __mb() to avoid multiple calls to
kcsan_mb().
Link: https://lore.kernel.org/linuxppc-dev/20230201043438.1301212-4-rmclure@linux.ibm.com/

v1: https://lore.kernel.org/linuxppc-dev/20230131234859.1275125-1-rmclure@linux.ibm.com/

Rohan McLure (7):
  kcsan: Add atomic builtin stubs for 32-bit systems
  xtensa: kcsan: Remove kcsan stubs for atomic builtins
  powerpc: kcsan: Add exclusions from instrumentation
  powerpc: kcsan: Exclude udelay to prevent recursive instrumentation
  powerpc: kcsan: Memory barriers semantics
  powerpc: kcsan: Prevent recursive instrumentation with IRQ
    save/restores
  powerpc: kcsan: Add KCSAN Support

 arch/powerpc/Kconfig                          |  1 +
 arch/powerpc/include/asm/barrier.h            | 12 ++++-----
 arch/powerpc/kernel/Makefile                  | 10 +++++++
 arch/powerpc/kernel/irq_64.c                  |  6 ++---
 arch/powerpc/kernel/time.c                    |  4 +--
 arch/powerpc/kernel/trace/Makefile            |  1 +
 arch/powerpc/kernel/vdso/Makefile             |  1 +
 arch/powerpc/lib/Makefile                     |  2 ++
 arch/powerpc/purgatory/Makefile               |  1 +
 arch/powerpc/xmon/Makefile                    |  1 +
 arch/xtensa/lib/Makefile                      |  1 -
 kernel/kcsan/Makefile                         |  2 +-
 .../lib/kcsan-stubs.c => kernel/kcsan/stubs.c | 26 ++++++++++++++++++-
 13 files changed, 54 insertions(+), 14 deletions(-)
 rename arch/xtensa/lib/kcsan-stubs.c => kernel/kcsan/stubs.c (58%)

-- 
2.37.2

