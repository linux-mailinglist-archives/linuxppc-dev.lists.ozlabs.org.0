Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F3665DDA7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jan 2023 21:25:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NnLhW6m20z3c8y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Jan 2023 07:25:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IJc3lnQl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ojaswin@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IJc3lnQl;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NnLgX13B2z2ywn
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jan 2023 07:24:55 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 304JGoK6004867;
	Wed, 4 Jan 2023 20:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=Mei9t6cHV+CiCDZO7EStwabQuZFte07tkOMF7DHyagA=;
 b=IJc3lnQllk4yvtsQNB4L2R8Ls+CQAI1APLzu2r1uj7gCIPKypO62jx4xhmSQ+hMJ2jTf
 Z+DfrKp4am0q5w9qdax6zqeDXo11I6t1g8cmoNY+/+XyvHPDVryAtLj59sA2nVtvNhs+
 GSvPjvmyDSMt3A6Xbo4Tz8zXileHnORRTw/82hH8MZDEAB/1L4OPcWG7h2HYPUBzogYE
 9OX/ggMZqy40KPj3BMy1y4aAHszUKHGj5enEtJpsXj3z/2cBM4GmFyRFrN5ArIb6aLiP
 mG1rWCeUXB8AOrsJiYtr2PvlIRORDvRqGY/lJBSUXnfHcUhAJN/se8Olok3Vqu4s/e4/ sg== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mwffnh7u4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 20:24:46 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 304D7XpL028210;
	Wed, 4 Jan 2023 20:24:44 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3mtcq6v8c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Jan 2023 20:24:44 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 304KOfvi45023628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 4 Jan 2023 20:24:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D511820049;
	Wed,  4 Jan 2023 20:24:41 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 831FD20040;
	Wed,  4 Jan 2023 20:24:40 +0000 (GMT)
Received: from li-bb2b2a4c-3307-11b2-a85c-8fa5c3a69313.ibm.com (unknown [9.43.53.27])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  4 Jan 2023 20:24:40 +0000 (GMT)
From: Ojaswin Mujoo <ojaswin@linux.ibm.com>
To: "Michael Ellerman" <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc: Fix a wrong version calculation issue in ld_version
Date: Thu,  5 Jan 2023 01:54:37 +0530
Message-Id: <20230104202437.90039-1-ojaswin@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mjb1ZD__m2_lZvPZJCcGERpzqgJaQLPb
X-Proofpoint-ORIG-GUID: mjb1ZD__m2_lZvPZJCcGERpzqgJaQLPb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-04_07,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 mlxlogscore=999 clxscore=1015
 adultscore=0 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301040162
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
Cc: Andreas Schwab <schwab@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

** The Issue **

The ld_version() function seems to compute the wrong version value for
certain ld versions like the following:

$ ld --version GNU ld (GNU Binutils; SUSE Linux Enterprise 15)
2.37.20211103-150100.7.37

For input 2.37.20211103, the value computed is 202348030000 which is way
more the value for a higher version like 2.39.0, that is 23900000.

This issue was highlighted because with the above ld version, powerpc
kernel build started failing with ld error: "unrecognized option
--no-warn-rwx-segments".  This was caused due to the recent patch
579aee9fc594 added --no-warn-rwx-segments linker flag if the ld version
was greater than 2.39.

Due to the bug in ld_version(), ld version 2.37.20111103 was
wrongly calculated to be greater than 2.39 and the unsupported flag was
added.

** The fix **

If version is of the form x.y.z and length(z) == 8, then most probably
it is a date [yyyymmdd] commonly used for release snapshots and not an
actual new version. Hence, ignore the date part replacing it with 0.

Signed-off-by: Ojaswin Mujoo <ojaswin@linux.ibm.com>
---

* Changes since v1 [1] *

- Instead of using the mm part of the date ignore it completely
  replacing it with zero

[1] https://lore.kernel.org/r/20230103095740.916038-1-ojaswin@linux.ibm.com 

 arch/powerpc/boot/wrapper | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index af04cea82b94..352d7de24018 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -210,6 +210,10 @@ ld_version()
 	gsub(".*version ", "");
 	gsub("-.*", "");
 	split($1,a, ".");
+	if( length(a[3]) == "8" )
+		# a[3] is probably a date of format yyyymmdd used for release snapshots. We
+		# can assume it to be zero as it does not signify a new version as such.
+		a[3] = 0;
 	print a[1]*100000000 + a[2]*1000000 + a[3]*10000;
 	exit
     }'
-- 
2.31.1

