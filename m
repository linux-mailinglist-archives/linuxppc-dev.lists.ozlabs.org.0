Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2AE513ABD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 19:21:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kq2TG1s6Nz3bs2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Apr 2022 03:21:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aoJ5u4cT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aoJ5u4cT; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kq2SY0sNkz3bWG
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Apr 2022 03:20:28 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23SGxVwg030270;
 Thu, 28 Apr 2022 17:20:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=b81Gpf58B1llpSnoIWzOlyyA7TxuZToP2ay+KjLRyA0=;
 b=aoJ5u4cTHYwLX8caDwjcOw9MztBXn1ds2yQkX4kW4HR/9wVXsgMisJdwWKvc2Mn+H3Gv
 ZxezaQ6/wfEydNd4mfuxL4btSU5g+bXmLeqO9ZSFV8PvUZyptp0WzjIm2MDRGmRbVEAg
 +kNN9/P+m2H7Hj0EBfQuFLbR5jYDZ2zeCss9FyaoDuc+V1pRlIFfsHB9E/AAKXiJ+Qex
 AJMPSCWUSuVlTQsZBq92749NC7EunvN13yTduAGwSz0ATuz+JMytiMC+RJGdFsg7NwSv
 G8kvXiJofCE1AHAQspHDxAzkh70R4X9dZ0beWWSNUgW5EJhSjVppE0L3rzpMknY5uV7a VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtvwynms-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 17:20:13 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 23SHDb0r025666;
 Thu, 28 Apr 2022 17:20:12 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3fqtvwynkt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 17:20:12 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 23SHCmWc015445;
 Thu, 28 Apr 2022 17:20:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3fm938yu03-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 Apr 2022 17:20:10 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 23SHK8Fi46858656
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 28 Apr 2022 17:20:08 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF765A4055;
 Thu, 28 Apr 2022 17:20:08 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A92E5A404D;
 Thu, 28 Apr 2022 17:20:05 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.8.21])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 28 Apr 2022 17:20:05 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Steven Rostedt <rostedt@goodmis.org>
Subject: [PATCH v2 0/2] ftrace/recordmcount: Handle object files without
 section symbols
Date: Thu, 28 Apr 2022 22:49:50 +0530
Message-Id: <cover.1651166001.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vBxMN0AtfqFLmBDSoaaBQDg7Z5jcuklQ
X-Proofpoint-GUID: jWT1IvNYrKeUGYORWvVdJ8qdO7dFK1UI
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-28_02,2022-04-28_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 impostorscore=0 mlxlogscore=689 adultscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204280103
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
Cc: Nathan Chancellor <nathan@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is v2 of the series posted at:
http://lkml.kernel.org/r/cover.1651047542.git.naveen.n.rao@linux.vnet.ibm.com

For v2, the first patch is slightly modified to skip the loop, rather 
than depending on addr == 0 to do so. The second patch is updated to 
make this behavior be opt-in by architectures so that they can validate 
the read mcount locations.

- Naveen


Naveen N. Rao (2):
  ftrace: Drop duplicate mcount locations
  ftrace: recordmcount: Handle sections with no non-weak symbols

 Makefile                           |  4 ++
 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/ftrace.h  |  8 +--
 arch/powerpc/kernel/trace/ftrace.c | 11 ++++
 kernel/trace/Kconfig               |  6 ++
 kernel/trace/ftrace.c              | 13 ++++-
 scripts/Makefile.build             |  3 +
 scripts/recordmcount.c             |  6 +-
 scripts/recordmcount.h             | 94 ++++++++++++++++++++++++++----
 9 files changed, 125 insertions(+), 21 deletions(-)


base-commit: 83d8a0d166119de813cad27ae7d61f54f9aea707
-- 
2.35.1

