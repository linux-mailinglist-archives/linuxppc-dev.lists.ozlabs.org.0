Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE9585FB5C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 15:35:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KJ7w91tF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TgbKF06Y0z3vXQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 01:35:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KJ7w91tF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TgbHd4kJMz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 01:34:05 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 41MEW6YY022584;
	Thu, 22 Feb 2024 14:33:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Zx1bK32W6TAbYPYJEc5GfShqv+HBx8ibIf0/tgpNitQ=;
 b=KJ7w91tF+WF6cOE2ntpY8SxVFYRox4aKBTvqaxdwUUyKSMrtQ6k7xYm1rt4OUfYkh8dg
 VEdx6OHn/VOkNErJ2wRRbFe9IS4/O8EvQ/Q/twmIOf790dQlBOtQk4DBYahJ3vwQz6hN
 ebUr/JGQthM6kN39HdwMBG51LSASNxRtScRK+7V2JEeTdfsj+LGlKOIxYS7U7GrT1NY2
 BtNeck+XkgosFLw/UEtWOm2h9LV19VBzX3uN5HzYwRVd/vPG/EZuUJZf06UOnGpb6Abn
 Lh7CPu6yzDG8+gjkdO+gj+d6JQOLvL+wY0X2KRb6nfGSo1h7AWLxwJtnXb3Y9bQqnOnu Gw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3we843r2a0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 14:33:49 +0000
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41MEWhrL024669;
	Thu, 22 Feb 2024 14:33:49 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3we843r293-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 14:33:48 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 41MEDsxp003623;
	Thu, 22 Feb 2024 14:33:47 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3wb74ty0xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Feb 2024 14:33:47 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 41MEXgn327132480
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Feb 2024 14:33:44 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 787822004F;
	Thu, 22 Feb 2024 14:33:42 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65B222004B;
	Thu, 22 Feb 2024 14:33:42 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 22 Feb 2024 14:33:42 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id DED5CE0375; Thu, 22 Feb 2024 15:33:41 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>
Subject: [PATCH v2 RESEND 5/5] sched/vtime: do not include <asm/vtime.h> header
Date: Thu, 22 Feb 2024 15:33:41 +0100
Message-Id: <a1d6ac49eb8fe5529dee184e8d62da4a7dedc461.1708612016.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1708612016.git.agordeev@linux.ibm.com>
References: <cover.1708612016.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aOz7Fjqea4Byyh_gockVFzsERdL-DRGs
X-Proofpoint-ORIG-GUID: BE-CQrDmRMYPIaCK-n7uGJL0aCkmOCUf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-22_11,2024-02-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 mlxscore=0 lowpriorityscore=0
 mlxlogscore=451 clxscore=1015 malwarescore=0 bulkscore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2402220116
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Frederic Weisbecker <frederic@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no architecture-specific code or data left
that generic <linux/vtime.h> needs to know about.
Thus, avoid the inclusion of <asm/vtime.h> header.

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/powerpc/include/asm/Kbuild | 1 -
 include/asm-generic/vtime.h     | 1 -
 include/linux/vtime.h           | 4 ----
 3 files changed, 6 deletions(-)
 delete mode 100644 include/asm-generic/vtime.h

diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index 61a8d5555cd7..e5fdc336c9b2 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -6,5 +6,4 @@ generic-y += agp.h
 generic-y += kvm_types.h
 generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
-generic-y += vtime.h
 generic-y += early_ioremap.h
diff --git a/include/asm-generic/vtime.h b/include/asm-generic/vtime.h
deleted file mode 100644
index b1a49677fe25..000000000000
--- a/include/asm-generic/vtime.h
+++ /dev/null
@@ -1 +0,0 @@
-/* no content, but patch(1) dislikes empty files */
diff --git a/include/linux/vtime.h b/include/linux/vtime.h
index 593466ceebed..29dd5b91dd7d 100644
--- a/include/linux/vtime.h
+++ b/include/linux/vtime.h
@@ -5,10 +5,6 @@
 #include <linux/context_tracking_state.h>
 #include <linux/sched.h>
 
-#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
-#include <asm/vtime.h>
-#endif
-
 /*
  * Common vtime APIs
  */
-- 
2.40.1

