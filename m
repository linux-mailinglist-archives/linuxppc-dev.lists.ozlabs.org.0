Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F486AD39B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 02:00:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxvN6H5nz3fFY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 12:00:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TycfZk82;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TycfZk82;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxpQ43GPz3bgr
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:56:14 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326M5ASX024431
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/hvRJqDyHZKqCCSHLmKw6SnhSGu7LQZ3HwobE11MCUg=;
 b=TycfZk824/11Z2NJZZS6eWlkrLr6O3kQPk2yR98C/cV3AN27UwptOAL0tL4miPIHeMur
 3f4haMx8uRxHHk9+13pNRevF36N+98vGtEiAIFrA1WLSSoqRk+AnHeVgefm4NdOpZVGK
 csGjSvZ3WrEp4DI4h8E+nYMyS3M8HypdvV8Dv2DrYRJhFHFQAUeYXJs8lyh/W+ffBTLu
 /hrFC1SRpWcM0lX9AHRxCDLkrDaNcwsA0FI7P+r1Y84pxH18E89zsFuXe1f4AY+aPuP4
 52DkaKVTU6UJeAHzXVvL+QYi9eLuocf8TNLulJUmvxOh0RSvD5HRKR5Iq6/TgoQtJpfO +A== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p5p6xpn87-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:12 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326NFA9c011629
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:10 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3p418v2rh6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:10 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3270u7Ze58065390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:08 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD87420043
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:07 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E25E20040
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:07 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A3A7D60634;
	Tue,  7 Mar 2023 11:56:02 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/5] selftests/powerpc/dscr: Restore timeout to DSCR selftests
Date: Tue,  7 Mar 2023 11:55:15 +1100
Message-Id: <20230307005515.174362-6-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307005515.174362-1-bgray@linux.ibm.com>
References: <20230307005515.174362-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UwLQudqJBvKXEwljuKau8dlgrEkRoTgO
X-Proofpoint-ORIG-GUID: UwLQudqJBvKXEwljuKau8dlgrEkRoTgO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 mlxlogscore=999 bulkscore=0 phishscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303070003
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
Cc: Benjamin Gray <bgray@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Reducing the time taken by dscr_sysfs_test.c allows restoring the
default timeout, which was removed in
commit 850507f30c38 ("selftests/powerpc: Turn off timeout setting for
benchmarks, dscr, signal, tm") because that test took too long.

Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
---
 tools/testing/selftests/powerpc/dscr/Makefile | 2 --
 tools/testing/selftests/powerpc/dscr/settings | 1 -
 2 files changed, 3 deletions(-)
 delete mode 100644 tools/testing/selftests/powerpc/dscr/settings

diff --git a/tools/testing/selftests/powerpc/dscr/Makefile b/tools/testing/selftests/powerpc/dscr/Makefile
index b29a8863a734..9289d5febe1e 100644
--- a/tools/testing/selftests/powerpc/dscr/Makefile
+++ b/tools/testing/selftests/powerpc/dscr/Makefile
@@ -3,8 +3,6 @@ TEST_GEN_PROGS := dscr_default_test dscr_explicit_test dscr_user_test	\
 	      dscr_inherit_test dscr_inherit_exec_test dscr_sysfs_test	\
 	      dscr_sysfs_thread_test
 
-TEST_FILES := settings
-
 top_srcdir = ../../../../..
 include ../../lib.mk
 
diff --git a/tools/testing/selftests/powerpc/dscr/settings b/tools/testing/selftests/powerpc/dscr/settings
deleted file mode 100644
index e7b9417537fb..000000000000
--- a/tools/testing/selftests/powerpc/dscr/settings
+++ /dev/null
@@ -1 +0,0 @@
-timeout=0
-- 
2.39.2

