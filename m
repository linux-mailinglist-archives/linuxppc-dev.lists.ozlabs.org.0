Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F92634B45
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 00:40:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NH12l411Fz3cNR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Nov 2022 10:40:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YxB+eGrq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=YxB+eGrq;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NH11r5yFhz300l
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Nov 2022 10:39:28 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AMND25w031086;
	Tue, 22 Nov 2022 23:39:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=y9NwiyaAyko9Bxl4KDhwRGthR364Cj3FAVjovSAT9S4=;
 b=YxB+eGrq4kuLeZYcCtt0Za6ZlmCXegGEvYZUVvs+FXZwvd/GkRLzI01yrl95oOMQe/E3
 Y8AGRJmjOBuyYHkCU06seqVAt6pSvLGyS+hxsLihez5RqFnVn+Ywi8uqpcoPwSFjKmTL
 vHVhQ6uFZOO0o0Jbf88nyMrt+j4M2qscNWLy+/2jJ5eyNx01j6JZ0VqwjRo9XKnnZHJb
 6R6yp4NlrAzq5xQXmaqOOo9X1O8a0qwP2JMLLYrMq4Sg7g92JMIO0cTQZVL2bTNAq7Ci
 huNT6D/PI1QrkMLQ9Pvw3eyW2uXLnUaB5/WT+u9LoAtX/IayLvpIZdD9uCmTAF5lu+FS Tw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0y4w6y58-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 23:39:25 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AMN6UwN001299;
	Tue, 22 Nov 2022 23:12:02 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06fra.de.ibm.com with ESMTP id 3kxpdj3jmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 23:12:02 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AMN5kb549414436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 23:05:46 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ECF8B5204E;
	Tue, 22 Nov 2022 23:11:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4EEAB5204F;
	Tue, 22 Nov 2022 23:11:59 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id ABA5160151;
	Wed, 23 Nov 2022 10:11:56 +1100 (AEDT)
From: Benjamin Gray <bgray@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/7] Expand selftest utils
Date: Wed, 23 Nov 2022 10:10:56 +1100
Message-Id: <20221122231103.15829-1-bgray@linux.ibm.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6qS62Rr60axVkNQje3wJe9klem1hMQ7U
X-Proofpoint-ORIG-GUID: 6qS62Rr60axVkNQje3wJe9klem1hMQ7U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_13,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=999
 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220177
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

(No changes to contents from v1, added signed-off-by's and fixed up commit messages)

Started this when writing tests for a feature I'm working on, needing a way to
read/write numbers to system files. After writing some utils to safely handle
file IO and parsing, I realised I'd made the ~6th file read/write implementation
and only(?) number parser that checks all the failure modes when expecting to
parse a single number from a file.

So these utils ended up becoming this series. I also modified some other test
utils I came across while doing so. My understanding is selftests are not expected
to be backported, so I wasn't concerned about only introducing new utils and leaving
the existing implementations be.

Changes:
- Use the mtfspr/mfspr macros where possible over inline asm
- Fix potential non-null terminated buffer in ptrace tests
- Add read_file / write_file to read and write raw bytes given appropriate
  path and buffers. Replace hand rolled read/write with this where easy.
- Make read/write_debugfs_file work on byte buffers and introduce
  read/write_debugfs_int for int specific contents. This more naturally aligns
  with the read/write_file functions, and allows for future *_long, *_ulong
  variants when required.
- Add an error checking number parser. It's an ugly function generating macro.
  The issue is the result param type can't be made generic, so there needs to
  be a separate definition per type (or at least for signed/unsigned). Also
  can't seem to use generics with the variable type declaration, so the max
  sized type for the input sign has to be specified manually.
  It's at least grep-able and language servers recognise it as defining
  parse_int, etc., though.
- Add the read_long, write_long, etc., utils that combine file IO and parsing.
  These are the utils I really wanted, useful for system files that are just
  numbers.
- Add an allocating file read for when the buffer is potentially too big to
  preallocate on the stack or needs to live especially long.


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
