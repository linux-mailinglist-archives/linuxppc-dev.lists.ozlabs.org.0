Return-Path: <linuxppc-dev+bounces-7861-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 496ECA94F66
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Apr 2025 12:29:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zh1nS6Cdkz3cDd;
	Mon, 21 Apr 2025 20:29:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745231356;
	cv=none; b=i4G9CIkJ8F2tO3GJKxthYeeTUZmN7YWMtqww27UrEKBBLw5x+/0AF13Vx0OCswpCcTceT3mEoyT1TTguW0JUDXKMGIaCFeyzPsJD9J50vOhgMPI7PdFgRhzza21ipxVNg4664D6gl2/NT0K10ByCNLChkPjgmytsVmYeBvQhsmEYoG0rKhco8mL5SvScs1KKoTjkDViILnumCPho0jazuVIecj8VOup1LU6lDeErTElDVy6mkhbhAxkhbaznZ/tnOpOEnjxJ1/qMSvPPHYkrNhohSBjs7YGQR1pnzXk3Z6JJZo4rvS/tE2a5W1G52bH0n6Q4+zvhD+2lBwYK9nxicA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745231356; c=relaxed/relaxed;
	bh=tGb3lNCYBpFSkb4zAMAyzpuTDJz/4fnOirsnxXLBIbE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lb6yqsjqfmtTChsfm78hIdsty+c19XKmF7c9qZtThgSLGKcSXg2lL3dYyjxok0TqVS/dT+KxlwARqNup1Ro3lDXTZa7gKxQ6cGpF7PwsEi9kOutiuAxmfK9DDIE9utPFeZw4ODDp4xZYudYCGSkb+g+90tYVmft23rdPefJeG5LiUmPH54wuusqDD04WBEv0W811WsQHvMe1rkEwUROCaGQr10JDHGkWeRzjc7RzEGOYyG8xgbwXkPD8cBT/0O7n9dRhJc0bKr8CzvPdwiqbBt/y1Tq8OUdSdo847lGR4OFvj0nFlDLjYnawUCGy3al7mciZMPThKmH1PCugLOjzFA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGd4KV+Z; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HGd4KV+Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zh1nS1lDMz3c4Y
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Apr 2025 20:29:15 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMUu9g018926;
	Mon, 21 Apr 2025 10:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=tGb3lNCYBpFSkb4zA
	MAyzpuTDJz/4fnOirsnxXLBIbE=; b=HGd4KV+ZrjR4nPyqrkVe6WqkGQGOmAVSV
	qEwpamrfIo9zGxLZHojYCs1O2cstje7X8pwP4Tk1JiOteKPiz5Y2n019urIT75ee
	T9GIhZXXD7aPy4GnMLYjdDucv6auZc3cYElc+OHx4Jgp4nkQYdRzVahx0DBWnQl7
	+3EiP88UaoTRwEBauAbLVlLJWUUYxfiX0zh315xsAzDm9tJndgux5F+BqV+Cnoaw
	w7z851pcmuHA+Z9BnlsikGe21bRy0iBvPdQHILDsDn6cRM5m552Mf0s2XtsKr9gG
	tanp8eE04ba/6RaQGWvvzadPYf0SVJbse9hPpMy+2XsWYEqYs5h7g==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465918acdr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:29:02 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53LAOA1d003197;
	Mon, 21 Apr 2025 10:29:02 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465918acdn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:29:02 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53LALKkN012355;
	Mon, 21 Apr 2025 10:29:01 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5sx40r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:29:01 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53LASvSb43778454
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 10:28:57 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B061920073;
	Mon, 21 Apr 2025 10:28:57 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E8E092006A;
	Mon, 21 Apr 2025 10:28:55 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 10:28:55 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, sshegde@linux.ibm.com,
        gautam@linux.ibm.com, vaibhav@linux.ibm.com, bigeasy@linutronix.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] powerpc: enable to run posix cpu timers in task context
Date: Mon, 21 Apr 2025 15:58:37 +0530
Message-ID: <20250421102837.78515-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250421102837.78515-1-sshegde@linux.ibm.com>
References: <20250421102837.78515-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: ANrOnTUc0fTdogqeRCaOJKbV03qqTskh
X-Authority-Analysis: v=2.4 cv=Qt9e3Uyd c=1 sm=1 tr=0 ts=68061dee cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=rh6EaQSAbPCCfu5Ue3wA:9
X-Proofpoint-GUID: xAlduXUgwNxhcA8mqPvxOZpfVWMJO3y1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1015 mlxlogscore=931
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210077
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Now that all kvm entry to guest paths handle the task work
using the generic framework, enable HAVE_POSIX_CPU_TIMERS_TASK_WORK
which allows running posix cpu timers in task context instead of running
them in hardirq. This would is a necessary step towards enabling
PREEMPT_RT on powerNV systems.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 83807ae44..f42fa4181 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -277,6 +277,7 @@ config PPC
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
+	select HAVE_POSIX_CPU_TIMERS_TASK_WORK
 	select HAVE_RETHOOK			if KPROBES
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RELIABLE_STACKTRACE
-- 
2.48.1


