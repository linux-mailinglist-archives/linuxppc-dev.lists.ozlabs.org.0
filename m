Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D90E6A5002
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 01:09:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQd5S2BTWz3cdr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 11:09:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mzcoxx//;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Mzcoxx//;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQd3R5rBsz3c3G
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 11:07:31 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31RMVKxW017306
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=p9tYgfLkDSKEvSCqXF6/PZmdiYt8YRfEBs2RjWaLLJI=;
 b=Mzcoxx//IglMBXAWtMd+dZeskifafTmDKJckkG0XZczgZjgrZBuTXNuU6z3oJzud1nWW
 9MhSEGT6EiMRQ6u5o7ur285vTvbgojt/7hXOA42JUyhbitT26qI5R418L/UcH7kQNEiz
 TrnDtLUiT2kSKlYWAGOOUjNrGjjkxLTCOt/mYvj1yTJOIeMZRtCIpQQklU9Xpi4rEfIJ
 nNUjw8uUgVWernlJxWKmR5yH9YRcR9E6VolotVivRHjH0WkR+tfp7L/JkLKpzuFDP10a
 WlE99YaO5g1pRtBTtNsNFB4G/q0W8sFKNoj1i3gjpqxrP13t6W/G4MT7wZB0CH77jMpL 9Q== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p11738kqk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:27 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31QKaWv0023871
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:26 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3nybdfssgc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:25 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31S07MZu28377516
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:23 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63CD220043
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB2BE20040
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:21 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 00:07:21 +0000 (GMT)
Received: from bgray-lenovo-p15.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 96CA4602FD;
	Tue, 28 Feb 2023 11:07:18 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] Clean up PowerPC selftest stderr output
Date: Tue, 28 Feb 2023 11:07:06 +1100
Message-Id: <20230228000709.124727-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FjCjfD-z61MaSYvwg15Gx0JHftWgv-q7
X-Proofpoint-GUID: FjCjfD-z61MaSYvwg15Gx0JHftWgv-q7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-27_17,2023-02-27_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 spamscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302270189
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

There are several messages being logged to stderr when building the PowerPC
selftests:

  $ make -j$(nproc) O=build -C tools/testing/selftests \
    INSTALL_PATH="$PWD"/out/selftests TARGETS=powerpc install > /dev/null

  Makefile:50: warning: overriding recipe for target 'clean'
  ../../lib.mk:124: warning: ignoring old recipe for target 'clean'
  1+0 records in
  1+0 records out
  65536 bytes (66 kB, 64 KiB) copied, 7.71e-05 s, 850 MB/s
  Makefile:50: warning: overriding recipe for target 'clean'
  ../../lib.mk:124: warning: ignoring old recipe for target 'clean'
  make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
  ...
  make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
  Makefile:50: warning: overriding recipe for target 'clean'
  ../../lib.mk:124: warning: ignoring old recipe for target 'clean'
  make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.
  ...
  make[2]: warning: jobserver unavailable: using -j1.  Add '+' to parent make rule.

This series fixes or silences them to make any legitimate build warnings more
apparent.


Benjamin Gray (3):
  selftests/powerpc: Use CLEAN macro to fix make warning
  selftests/powerpc: Pass make context to children
  selftests/powerpc: Make dd output quiet

 tools/testing/selftests/powerpc/Makefile     |  8 ++---
 tools/testing/selftests/powerpc/mm/Makefile  |  2 +-
 tools/testing/selftests/powerpc/pmu/Makefile | 31 +++++++++++---------
 3 files changed, 22 insertions(+), 19 deletions(-)


base-commit: ec0a1b360aec1ba0bdfad3dd69e300b028529c0d
--
2.39.2
