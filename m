Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0D663A084
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:22:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLC3p0rhVz3f7s
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:22:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KLpdXQ3q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KLpdXQ3q;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLC1r4xtvz3cJG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:20:32 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AS1RYqI008724;
	Mon, 28 Nov 2022 04:20:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=ZV57ptr8RIZ6QMbsMyPYheR+8kLQUfPZZPbF5b7oFgY=;
 b=KLpdXQ3qoUsiV/ms+C0iNEw18ppT9CUMu/tQspadu9/7l477xv2YHplMyA1e1KXQA7Eh
 95IP5Sl/Y20jfEqSv8Ytp03UPYPEGEXwWZH3T5P/M88RVcLFef7LZ8Jh0TMUl8IvxzGc
 pfwhcKVspNSaotFWvJcnTyRiO5tjZ6U0PuTp/jWj2qXROP3aazGjh/D2u2TwoDwN4QDC
 TgRCQRu2sSqxNjmwMy6Y3ddaNBHPBnY7DVtblCeHoQAwJd4oYsYWYBKLdBaAss00x3tH
 1Z0bewl4m0vCqraN2GcVYrO5VtrSkBeum32QiuwwzIY/zzLP4GCI787fXW6pG2s5LdVF 8Q== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m3vfjd8jq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:29 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AS45Gaw027639;
	Mon, 28 Nov 2022 04:20:27 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3m3ae99wrn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Nov 2022 04:20:27 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AS4KP3x8323658
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Nov 2022 04:20:25 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E6084C044;
	Mon, 28 Nov 2022 04:20:25 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08CDE4C040;
	Mon, 28 Nov 2022 04:20:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 28 Nov 2022 04:20:24 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id E48DE60306;
	Mon, 28 Nov 2022 15:20:22 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/7] Expand selftest utils
Date: Mon, 28 Nov 2022 15:19:41 +1100
Message-Id: <20221128041948.58339-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dSdIDy4HqTWBMOehkXjXQ_zx8m4ojvDL
X-Proofpoint-GUID: dSdIDy4HqTWBMOehkXjXQ_zx8m4ojvDL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-28_04,2022-11-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211280026
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ajd@linux.ibm.com
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

Benjamin Gray (7):
  selftests/powerpc: Use mfspr/mtspr macros
  selftests/powerpc: Add ptrace setup_core_pattern() null-terminator
  selftests/powerpc: Add generic read/write file util
  selftests/powerpc: Add read/write debugfs file, int
  selftests/powerpc: Parse long/unsigned long value safely
  selftests/powerpc: Add {read,write}_{long,ulong}
  selftests/powerpc: Add automatically allocating read_file

 tools/testing/selftests/powerpc/dscr/dscr.h   |  56 +---
 .../selftests/powerpc/dscr/dscr_sysfs_test.c  |  23 +-
 .../testing/selftests/powerpc/include/utils.h |  18 +-
 .../selftests/powerpc/nx-gzip/gzfht_test.c    |  52 +--
 tools/testing/selftests/powerpc/pmu/lib.c     |  35 +-
 .../selftests/powerpc/ptrace/core-pkey.c      |  28 +-
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c |   6 +-
 .../testing/selftests/powerpc/ptrace/ptrace.h |   5 +-
 .../selftests/powerpc/security/entry_flush.c  |  12 +-
 .../selftests/powerpc/security/flush_utils.c  |   3 +-
 .../selftests/powerpc/security/rfi_flush.c    |  12 +-
 .../powerpc/security/uaccess_flush.c          |  18 +-
 .../selftests/powerpc/syscalls/Makefile       |   2 +-
 .../selftests/powerpc/syscalls/rtas_filter.c  |  80 +----
 tools/testing/selftests/powerpc/utils.c       | 314 ++++++++++++++----
 15 files changed, 341 insertions(+), 323 deletions(-)


base-commit: 247f34f7b80357943234f93f247a1ae6b6c3a740
--
2.38.1
