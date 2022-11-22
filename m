Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9692263356D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 07:42:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGZS63lZYz3cKW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 17:42:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LJGh6MtX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LJGh6MtX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGZR60CRmz3bjY
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 17:41:21 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AM5vXNV016662;
	Tue, 22 Nov 2022 06:41:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=SlG1nHSODnNDUlFpidIWJvFh58k88h3M+QiqAhuAY5Q=;
 b=LJGh6MtXBJC4b602tNNrvCFI7KChTIqPR/FnUXY/rgi42TilrTcmLtRj6kuzMzlgIruD
 DnBdo7jadyTmH288eEEG1HyqetBnjF3OOOY+aPTLA5Unf9885+3fp1Ua+LbHJMWA7Viv
 l5H0ZKqiAz8bIZ6OFtyL9XLsbiQAfG7+3ivIWVdI/OH9ZzFkXfv6XuYWv10MszD3vGPT
 DH22fM98cwQX3c+z3KQe4bRCT9CB67o+9CC5l5zcIwdACWtjQYGCp0ugFmfcxM3gMRa6
 VbZwBZmS3ouVaj/LQHOW5VM0VqGRZ2SuHDz7viroFPs+m3O8c8ncTeSMgZiG4BR7fAO+ QQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m0rr2gx5a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:41:13 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AM6cMEC021845;
	Tue, 22 Nov 2022 06:41:11 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma02fra.de.ibm.com with ESMTP id 3kxps8tqpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Nov 2022 06:41:11 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AM6fooo48890264
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Nov 2022 06:41:50 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3351B11C052;
	Tue, 22 Nov 2022 06:41:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 018F111C04C;
	Tue, 22 Nov 2022 06:41:08 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.65.119])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 22 Nov 2022 06:41:07 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/3] selftests/powerpc: ptrace/perf_hwbreak test fixes
Date: Tue, 22 Nov 2022 12:10:51 +0530
Message-Id: <cover.1669096083.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: RJ2Iz8z1NQDSFbBrzApeBMXAqzN-0RbD
X-Proofpoint-GUID: RJ2Iz8z1NQDSFbBrzApeBMXAqzN-0RbD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-22_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 suspectscore=0
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0
 mlxscore=0 mlxlogscore=938 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211220047
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
Cc: Rohan Deshpande <rohan_d@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series fixes two issues with the perf_hwbreak test:
- Test fails on systems with large number of cpus due to hitting the 
  resource limit for maximum number of open file descriptors.
- Test fails on systems running with lower SMT levels since it assumes 
  all cpus are online.

Fix those issues. The first patch is a small cleanup to aid subsequent 
fixes.

- Naveen


Naveen N. Rao (3):
  selftests/powerpc: Move perror closer to its use
  selftests/powerpc: Bump up rlimit for perf-hwbreak test
  selftests/powerpc: Account for offline cpus in perf-hwbreak test

 .../selftests/powerpc/ptrace/perf-hwbreak.c   | 78 +++++++++++++------
 1 file changed, 56 insertions(+), 22 deletions(-)


base-commit: eb05539de71d4784705d3e502d951ac17fea05e3
-- 
2.38.1

