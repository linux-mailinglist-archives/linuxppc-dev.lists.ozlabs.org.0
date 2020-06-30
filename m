Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6154620EDE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:57:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wtsm0RLQzDqYC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 15:57:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bala24@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wtnl67ZMzDqb5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:53:31 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05U5UlLM046256; Tue, 30 Jun 2020 01:53:22 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31ycg3av9r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 01:53:22 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05U5cJTh018344;
 Tue, 30 Jun 2020 05:53:20 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06fra.de.ibm.com with ESMTP id 31wwcgsh31-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jun 2020 05:53:20 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05U5rHJh56688750
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jun 2020 05:53:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CD1EAE04D;
 Tue, 30 Jun 2020 05:53:17 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AB9ECAE045;
 Tue, 30 Jun 2020 05:53:14 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.47.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Jun 2020 05:53:14 +0000 (GMT)
From: Balamuruhan S <bala24@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 0/4] VSX 32-byte vector paired load/store instructions
Date: Tue, 30 Jun 2020 11:23:03 +0530
Message-Id: <20200630055307.1154135-1-bala24@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-06-29_21:2020-06-29,
 2020-06-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=765 priorityscore=1501 suspectscore=1 clxscore=1015
 adultscore=0 malwarescore=0 cotscore=-2147483648 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006300037
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
Cc: ravi.bangoria@linux.ibm.com, Balamuruhan S <bala24@linux.ibm.com>,
 paulus@samba.org, sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VSX vector paired instructions operates with octword (32-byte) operand
for loads and stores between storage and a pair of two sequential Vector-Scalar
Registers (VSRs). There are 4 word instructions and 2 prefixed instructions
that provides this 32-byte storage access operations - lxvp, lxvpx, stxvp,
stxvpx, plxvpx, pstxvpx.

Emulation infrastructure doesn't have support for these instructions, to
operate with 32-byte storage access and to operate with 2 VSX registers.
This patch series enables the instruction emulation support and adds test
cases for them respectively.

Balamuruhan S (4):
  powerpc/sstep: support new VSX vector paired storage access
    instructions
  powerpc/sstep: support emulation for vsx vector paired storage access
    instructions
  powerpc ppc-opcode: add opcodes for vsx vector paired instructions
  powerpc sstep: add testcases for vsx load/store instructions

 arch/powerpc/include/asm/ppc-opcode.h |  11 ++
 arch/powerpc/include/asm/sstep.h      |   2 +-
 arch/powerpc/lib/sstep.c              | 102 +++++++++-
 arch/powerpc/lib/test_emulate_step.c  | 273 ++++++++++++++++++++++++++
 4 files changed, 378 insertions(+), 10 deletions(-)


base-commit: 64677779e8962c20b580b471790fe42367750599
-- 
2.24.1

