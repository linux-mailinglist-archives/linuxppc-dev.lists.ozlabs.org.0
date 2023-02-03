Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01860688C0F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 01:43:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7H2r5cGTz3fBC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 11:43:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gdcI3tis;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gdcI3tis;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Gyp3yzZz3cNY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 11:40:18 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 312NZKmT001622
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=6VD6fMjiJqJKH5HqIzG7rlUy7gdEW8IzYniYhPUWil4=;
 b=gdcI3tisyeSfGndO6QLwvY4fQ4xh5UR7zx6De9Qly3MAr+E7MCOMB/EoHagQBWVvj/eS
 ptEWGVUKFtA6HWkoJFYOUvHRVWv6XoPlvgBfMa/tPx5GB3LfaHiW9FljWnPxtdejHxSU
 3rRq+rjeRLqZ4ntUCP3D2C12XRRYZ8te+1AALKgViuGvZaSHvjP4YsYU10QuoiVSC8oB
 hKErdhVAhPcG5hWkGsPxO7vwxZVcBlW/l0BQmIr33er+nsA5jRZ2z/r0ZxRSiNJEK18a
 V1A1VcCw+AOwmRgoFIFSjqEDQDHobe/XiWC2zDcCIRrHI7dTlzFZrf5NQK/DlJkBf7ZH RQ== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ngmhqmquw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:13 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3129bQrB025999
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:10 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3ndn6uc4du-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 00:40:10 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3130e7Cl50004280
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Feb 2023 00:40:07 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8C7C2004D
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C6AF20040
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 00:40:07 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9070E60418;
	Fri,  3 Feb 2023 11:40:03 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/5] Expand selftest utils
Date: Fri,  3 Feb 2023 11:39:42 +1100
Message-Id: <20230203003947.38033-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FJDRbRKEJWc_UXZPSOe95PLUOnEVPyIN
X-Proofpoint-GUID: FJDRbRKEJWc_UXZPSOe95PLUOnEVPyIN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-02_16,2023-02-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302030003
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

Started this when writing tests for a feature I'm working on, needing a way to
read/write numbers to system files. After writing some utils to safely handle
file IO and parsing, I realised I'd made the ~6th file read/write implementation
and only(?) number parser that checks all the failure modes when expecting to
parse a single number from a file.

So these utils ended up becoming this series. I also modified some other test
utils I came across while doing so. My understanding is selftests are not expected
to be backported, so I wasn't concerned about only introducing new utils and leaving
the existing implementations be.

V3:	* Add reviewed-by from previous version
	* Fix write(2) call to include creation mode
V4:	* Drop patches merged in v3
	* Miscellaneous refactoring
	* Bigger changes mentioned on the relevant patch

Benjamin Gray (5):
  selftests/powerpc: Add generic read/write file util
  selftests/powerpc: Add read/write debugfs file, int
  selftests/powerpc: Parse long/unsigned long value safely
  selftests/powerpc: Add {read,write}_{long,ulong}
  selftests/powerpc: Add automatically allocating read_file

 tools/testing/selftests/powerpc/dscr/dscr.h   |  34 +-
 .../selftests/powerpc/dscr/dscr_sysfs_test.c  |  25 +-
 .../testing/selftests/powerpc/include/utils.h |  20 +-
 .../selftests/powerpc/nx-gzip/gzfht_test.c    |  52 +--
 tools/testing/selftests/powerpc/pmu/lib.c     |  34 +-
 .../selftests/powerpc/ptrace/core-pkey.c      |  28 +-
 .../selftests/powerpc/security/entry_flush.c  |  12 +-
 .../selftests/powerpc/security/rfi_flush.c    |  12 +-
 .../powerpc/security/uaccess_flush.c          |  18 +-
 .../selftests/powerpc/syscalls/Makefile       |   2 +-
 .../selftests/powerpc/syscalls/rtas_filter.c  |  81 +---
 tools/testing/selftests/powerpc/utils.c       | 412 +++++++++++++++---
 12 files changed, 431 insertions(+), 299 deletions(-)


base-commit: ca272751ba18ca8f137af631cbc9f3f987fab6e3
--
2.39.1
