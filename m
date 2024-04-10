Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1D589FB3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:13:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EXO212fS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF5vH34DTz3dX4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:13:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EXO212fS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF5qh5QM9z3vXM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 01:10:40 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 43AEWEYf015923;
	Wed, 10 Apr 2024 15:09:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Z/5bfzM7V7qVpO1EyKZZQnXhM4gz8TxFOwY22JPu/4o=;
 b=EXO212fSJZqyF2H9AndbclL8+95nf5FuC3AbTNrw+cfHg9eVYDpUAI/TwdvLBgCA034E
 zL3tqf15uNSnO6Q5ro/4CKgQsPHzlwyTzJV5GZRmMhm9hzBipXYZtySoyAih8D1JYMPP
 4c4ITmMpZZm5rBEKgZblQLEi6Ym9zW9JIJHssH6RmA9DuIEQSYywp4QCf/8Y6YCfGNTa
 FU8iP1l+hJKhTdNYvbCB5mABa8l0xlVPBTNauF1TeTqlLWUJLeztVPKQhNKzrrwV5RnE
 vpiRhlhMYBN2ZlzbSirNdjguwo4QnVJa7XZ9VjzSoomxZjb/q26ssGXU4p9OENEMYQ0c +g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdvm584at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:56 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 43AF9tRn018130;
	Wed, 10 Apr 2024 15:09:56 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xdvm584ap-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:55 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 43ACHtgW017031;
	Wed, 10 Apr 2024 15:09:54 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3xbke2n0jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Apr 2024 15:09:54 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 43AF9nMr48497084
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Apr 2024 15:09:51 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2B18D2006E;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17E6A20063;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 10 Apr 2024 15:09:49 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id D0C8DE06C8; Wed, 10 Apr 2024 17:09:48 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 RESEND 3/5] s390/vtime: remove unused __ARCH_HAS_VTIME_TASK_SWITCH leftover
Date: Wed, 10 Apr 2024 17:09:46 +0200
Message-Id: <b1055852eab0ffea33ad16c92d6a825c83037c3e.1712760275.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <cover.1712760275.git.agordeev@linux.ibm.com>
References: <cover.1712760275.git.agordeev@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rKeDBuvZrttnyO9uIiawmcM-uzMJVHiH
X-Proofpoint-ORIG-GUID: eq12QW-AOTml5-ZP88z-o1nBE5EIgPf_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_04,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=710 spamscore=0
 priorityscore=1501 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2404010000
 definitions=main-2404100109
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Frederic Weisbecker <frederic@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Heiko Carstens <hca@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__ARCH_HAS_VTIME_TASK_SWITCH macro is not used anymore.

Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
Acked-by: Heiko Carstens <hca@linux.ibm.com>
Acked-by: Nicholas Piggin <npiggin@gmail.com>
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

