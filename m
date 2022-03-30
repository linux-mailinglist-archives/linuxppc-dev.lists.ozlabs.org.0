Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D304EC629
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 16:08:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT7ZH2nn1z3bj2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 01:08:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mhPp9BiR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mhPp9BiR; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT7Yd3PH2z2xtJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 01:07:49 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UDh0Sd005057; 
 Wed, 30 Mar 2022 14:07:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KOqoCqxMrBckgY/TpXLBjPlwTEbwMDlUHKPh56s6lNQ=;
 b=mhPp9BiR2i26kmtLDUJsZs4HuaC7dZ59PWCVIXcQ+raTefUTsQnN48zn1u8JU+n2/qlG
 HjLGwBKafcVJEO3ZzkKedNX7VRvBPpaVtWtf4l9UI4y59eCFr/57RmbN/IkAwZmQOC2b
 bnc19VUgZD70E1FtFyJ7NKiIteuC2W4wq4u1hAzdaudZKxIeJ6Kcq2rISNGmH9D7kJrC
 aWef8cZIePk5MqjuV9cXLhSoNo7E4tTWLHNy/S0khM+RK8RdupsI1+sn2CXu9SswdXRA
 geqZmlwRfWM5vNum1MDygYm2+GROx7AlUrmmcFDyMA4GfffOLhIRiVgMDDXEcJv2E0bc pg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f40q26mgv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:40 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22UDojda008090;
 Wed, 30 Mar 2022 14:07:39 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f40q26mfs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:39 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UE2ufU014891;
 Wed, 30 Mar 2022 14:07:37 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3f1tf8yepq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 14:07:36 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UE7YBI31261056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 14:07:34 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94870A404D;
 Wed, 30 Mar 2022 14:07:34 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED485A4040;
 Wed, 30 Mar 2022 14:07:32 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.30.177])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Mar 2022 14:07:32 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, mopsfelder@gmail.com
Subject: [PATCH v2 0/3] powerpc: Remove system call emulation
Date: Wed, 30 Mar 2022 19:37:16 +0530
Message-Id: <cover.1648648712.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: klA4IlWVrvMzJRmm6WrhisqImwJv8FuX
X-Proofpoint-ORIG-GUID: FIc6edR84UUYqKiBwEC_GW-Ahy2-fyVH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=771
 mlxscore=0 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203300069
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

Since v1, the main change is to use helpers to decode primary/extended 
opcode and the addition of macros for some of the used opcodes.

- Naveen



Naveen N. Rao (2):
  powerpc: Sort and de-dup primary opcodes in ppc-opcode.h
  powerpc: Reject probes on instructions that can't be single stepped

Nicholas Piggin (1):
  powerpc/64: remove system call instruction emulation

 arch/powerpc/include/asm/ppc-opcode.h | 87 +++++++++++++++------------
 arch/powerpc/include/asm/probes.h     | 36 +++++++++++
 arch/powerpc/kernel/interrupt_64.S    | 10 ---
 arch/powerpc/kernel/kprobes.c         |  4 +-
 arch/powerpc/kernel/uprobes.c         |  5 ++
 arch/powerpc/lib/sstep.c              | 46 +++-----------
 arch/powerpc/xmon/xmon.c              | 11 ++--
 7 files changed, 107 insertions(+), 92 deletions(-)


base-commit: e8833c5edc5903f8c8c4fa3dd4f34d6b813c87c8
-- 
2.35.1

