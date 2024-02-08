Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A0084E984
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 21:18:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lbl9l7ZL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TW7bt2LB8z3cby
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 07:18:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Lbl9l7ZL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TW7Xh1fmCz3cBb
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 07:16:03 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 418JYqma013853;
	Thu, 8 Feb 2024 20:15:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=7/WCPTz+SYsbI0BE/Xci4RbfspxHDVvpG2N4ZkvAbp8=;
 b=Lbl9l7ZLynkaJmNowGT2EqjXFviV3SVMReqNmMXqfvWdY1vAYwo1sqs+7v/6bYh+BhrO
 8+Xg48V3Re5I7klP5HY76sawMciq8akzCn6E14Mvcml/C9i6u3BbBmwyXu3+byvwVdI4
 +OUUQ8sLA+wsqNwAaqu5zGiz3zITV/RW1OlkzZqFBiWovVXeip+ThIRfDZj4k7s0X2DY
 mnLAfQPARxao8Ly6liYEMJ8al/BKtOELp0TDd48km2LRWzUnkZB7YdFnpbDiYdpuwA4I
 rtsi5pDMPACfIyUl+icRND5EVCIHJPIAxoGYNES1w9dCoPyOVlyjcuvf0zXupW13s9ed xA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w52n8vxh9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 20:15:54 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 418K03R2012748;
	Thu, 8 Feb 2024 20:15:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3w52n8vxh1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 20:15:54 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 418HoVab014837;
	Thu, 8 Feb 2024 20:15:53 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3w20tp6xqx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Feb 2024 20:15:53 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 418KFncT63897994
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Feb 2024 20:15:49 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B56F92006A;
	Thu,  8 Feb 2024 20:15:49 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A5BE92004F;
	Thu,  8 Feb 2024 20:15:49 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  8 Feb 2024 20:15:49 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id 7CB83E1506; Thu,  8 Feb 2024 21:15:49 +0100 (CET)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>
Subject: [PATCH v2 3/5] s390/vtime: remove unused __ARCH_HAS_VTIME_TASK_SWITCH leftover
Date: Thu,  8 Feb 2024 21:15:47 +0100
Message-Id: <2fcc4503851ef7cbb6106ba6706179605b7449fd.1707422448.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1707422448.git.agordeev@linux.ibm.com>
References: <cover.1707422448.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: lYdknQdTuxHJi3DIu_qdhzuqJ0AFDCak
X-Proofpoint-ORIG-GUID: viJi4lte1G6rRyc-3KH12DC1wPw-alKU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-08_08,2024-02-08_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=607
 lowpriorityscore=0 spamscore=0 suspectscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1011 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2402080108
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__ARCH_HAS_VTIME_TASK_SWITCH macro is not used anymore.

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/s390/include/asm/vtime.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/s390/include/asm/vtime.h b/arch/s390/include/asm/vtime.h
index fe17e448c0c5..561c91c1a87c 100644
--- a/arch/s390/include/asm/vtime.h
+++ b/arch/s390/include/asm/vtime.h
@@ -2,8 +2,6 @@
 #ifndef _S390_VTIME_H
 #define _S390_VTIME_H
 
-#define __ARCH_HAS_VTIME_TASK_SWITCH
-
 static inline void update_timer_sys(void)
 {
 	S390_lowcore.system_timer += S390_lowcore.last_update_timer - S390_lowcore.exit_timer;
-- 
2.40.1

