Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 973496D8E67
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:40:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsTM42C7Xz3fYf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 14:40:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OAIKaMdV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OAIKaMdV;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsTCc2zxXz3f6y
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 14:33:48 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3364BfRD030541
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=/hvRJqDyHZKqCCSHLmKw6SnhSGu7LQZ3HwobE11MCUg=;
 b=OAIKaMdVV2vslDPGgnfc6ys/OuNxr7RzxFRO7Pu3H/YPO5glWUhBITH/7iaBlxACmIYR
 4xy05WGO7ABRHfHhthk7XjNYOcAmEYzas93Et6pp87CgvvjwDcKz/ylxPXSn1L3CwSD2
 V+Nrf5ukP+tMRt544UH2uq8PU9MWGbgFh/Ep8Agl1YBGdXulJL6itC8qFp9Ld/RtaYXG
 w3vWQpqrDUdqEImma/MHFTFoYKb4C/Ir7dbLmEk/6gtuPThNFfCKRUp4EYTz1QCK1Tr/
 HBOMGFWHOHTowncYv9Dr0rYmoHm+pi8Rt2tAyiYu7qA3tJKmcoaqOG0H+qLlEI+FxmSL 6Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3psayrgdn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3363FYvr002267
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:44 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3ppc87bx5j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Apr 2023 04:33:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3364XeAu45220544
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 Apr 2023 04:33:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C023720040
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40BEC2004D
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 04:33:40 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 2D63A60457;
	Thu,  6 Apr 2023 14:33:36 +1000 (AEST)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 7/7] selftests/powerpc/dscr: Restore timeout to DSCR selftests
Date: Thu,  6 Apr 2023 14:33:20 +1000
Message-Id: <20230406043320.125138-8-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406043320.125138-1-bgray@linux.ibm.com>
References: <20230406043320.125138-1-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -0tOFw8zyr41NnE9n7acpMu704ltAjNs
X-Proofpoint-GUID: -0tOFw8zyr41NnE9n7acpMu704ltAjNs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-05_15,2023-04-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060039
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

