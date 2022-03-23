Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D594E51A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 12:53:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KNmw651w8z30CL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Mar 2022 22:53:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kuXSU+ug;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kuXSU+ug; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KNmtZ2wfWz2xCW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Mar 2022 22:52:20 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22NBgUDk022311; 
 Wed, 23 Mar 2022 11:52:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=yQrdKnRGSRLwHT5exwG5h3A7yjE1f/bmhKbN1zQ2BxA=;
 b=kuXSU+ugATpo3PioqOodxL7+b7KjHJ3u1UPgwvk7az1YR8bh5q+2gLWAb8qntKhHgxlF
 S3OVFPOn8d9pl1io/9Ju8qQzGHGb/e+FmyC00uksBKrVHen5fR64THw7WUzpzRYZuGIv
 KcMu4+SFLcwq/OAcLiiA3HAYGxLtiZ8WtI72vA9Y6YkdYsJT//sW1aqdHsuohymmIoZ2
 9Ow6mxbjCQmQFSap7WfWbvbk/QU+AnLmb1UpPQlWQ2IYF6geH5B/lDjPqZ7um832gXYI
 RfeVkudQe33ORGTktoJpbSdDeTfxs/Ebhz+GiLwM/dHuqMl5bmeNSwi+dV1qP00foMuX kg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f02wgg67d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 11:52:10 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22NBop07017750;
 Wed, 23 Mar 2022 11:52:10 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f02wgg66u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 11:52:10 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22NBgxhC021661;
 Wed, 23 Mar 2022 11:52:08 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3ew6ej0gu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Mar 2022 11:52:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22NBq9ZC45351386
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Mar 2022 11:52:09 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFD4B4C044;
 Wed, 23 Mar 2022 11:52:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48E244C040;
 Wed, 23 Mar 2022 11:52:04 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.106.108])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 23 Mar 2022 11:52:04 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 0/2] powerpc: Remove system call emulation
Date: Wed, 23 Mar 2022 17:21:34 +0530
Message-Id: <cover.1648030681.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Kgq-U0ok2aMHVtIPbYKhuHu1Jlll32_k
X-Proofpoint-ORIG-GUID: cDlNZNXoYFwBziGrlO_mXI8tf-H80jOB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-23_06,2022-03-22_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxlogscore=675 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203230066
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is an update to the series posted by Nick here:
http://lkml.kernel.org/r/20220124055741.3686496-1-npiggin@gmail.com

The first patch disables probes and breakpoints on instructions that
can't be single stepped, including sc and scv. The second patch removes
system call emulation for powerpc64.

- Naveen



Naveen N. Rao (1):
  powerpc: Reject probes on instructions that can't be single stepped

Nicholas Piggin (1):
  powerpc/64: remove system call instruction emulation

 arch/powerpc/include/asm/probes.h  | 55 ++++++++++++++++++++++++++++++
 arch/powerpc/kernel/interrupt_64.S | 10 ------
 arch/powerpc/kernel/kprobes.c      |  4 +--
 arch/powerpc/kernel/uprobes.c      |  5 +++
 arch/powerpc/lib/sstep.c           | 46 ++++++-------------------
 arch/powerpc/xmon/xmon.c           | 11 +++---
 6 files changed, 77 insertions(+), 54 deletions(-)


base-commit: e8833c5edc5903f8c8c4fa3dd4f34d6b813c87c8
-- 
2.35.1

