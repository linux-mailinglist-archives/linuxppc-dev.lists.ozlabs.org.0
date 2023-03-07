Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7816AD387
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 01:57:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVxqJ6Xrzz3f4v
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 11:57:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MkrQyG+C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MkrQyG+C;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVxpN2RMCz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 11:56:12 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3270Xgd8031028
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=VhYYDTOjbQrlseMHf5glivED0hnTa/CKJUL8J3ggipU=;
 b=MkrQyG+Ckp+ew2DtOfB+3H5vpGvTOuQtUlZyQPiTlMBahCuVXNn+wnWb3RCTLx/izqPd
 KxJq1CQceFgChPNW1Q0DQYzDWQHm8s5Mg35P2ud7ATXiUJiO7Xpapqw9juXzu2bJArV+
 tsSp6fPoworEghkq+RrZklqsphM46vXe0LsPIIypWs/T8SpYHuWz8ffKzngOcN/g6ico
 c7zF+doMfR5ZKJJ9/1l7srEizgylTwKSZrIV4e9n2LI1SaCBOvKYhs5nc4OqkjdXZ+6+
 pkWAjafMpMUCe0MbRcNpfbs3cgfJ7FS5uGhqM0j4mBVBvbGuzrij/dOH/L+cwTe/1rUO PQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4yhrda4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:09 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326BqTQv007330
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:07 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p4188bg2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Mar 2023 00:56:07 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3270u5Js62456312
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 Mar 2023 00:56:05 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 638C92004F
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:05 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D872C2004D
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 00:56:04 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9951060235;
	Tue,  7 Mar 2023 11:56:02 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] Update DSCR tests
Date: Tue,  7 Mar 2023 11:55:10 +1100
Message-Id: <20230307005515.174362-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5EgghorQDynWIjMM2vG0ykD36XRMWneV
X-Proofpoint-ORIG-GUID: 5EgghorQDynWIjMM2vG0ykD36XRMWneV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 mlxlogscore=937 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The randomness based DSCR tests currently have a low probability of doing
any writes to the DSCR, making them inefficient in uncovering bugs.

This series adds lockstep variants to these RNG tests, to ensure the happy
path is always tested, and improves the randomness and size of the RNG
tests.

It also removes many iterations of the sysfs DSCR test, allowing the default
timeout to be re-enabled.

Benjamin Gray (5):
  selftests/powerpc/dscr: Correct typos
  selftests/powerpc/dscr: Add lockstep test cases to DSCR explicit tests
  selftests/powerpc/dscr: Improve DSCR explicit random test case
  selftests/powerpc/dscr: Speed up DSCR sysfs tests
  selftests/powerpc/dscr: Restore timeout to DSCR selftests

 tools/testing/selftests/powerpc/dscr/Makefile |   3 +-
 tools/testing/selftests/powerpc/dscr/dscr.h   |  22 +-
 .../powerpc/dscr/dscr_default_test.c          | 223 +++++++++++-------
 .../powerpc/dscr/dscr_explicit_test.c         | 173 +++++++++++---
 .../powerpc/dscr/dscr_inherit_test.c          |   4 +-
 .../selftests/powerpc/dscr/dscr_sysfs_test.c  |  11 +-
 .../selftests/powerpc/dscr/dscr_user_test.c   |   4 +-
 tools/testing/selftests/powerpc/dscr/settings |   1 -
 8 files changed, 300 insertions(+), 141 deletions(-)
 delete mode 100644 tools/testing/selftests/powerpc/dscr/settings


base-commit: 422fbcbf91303706823bc3babceb1df1a42112bf
--
2.39.2
