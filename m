Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1542BD6369
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2019 15:08:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46sJlw4xPnzDqnc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Oct 2019 00:08:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46sJfc134nzDqhk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2019 00:04:07 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9ED2BKC021026
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 09:04:03 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vmseggcue-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2019 09:04:03 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Mon, 14 Oct 2019 14:04:00 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 14 Oct 2019 14:03:56 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9ED3tm259900046
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Oct 2019 13:03:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E4194C063;
 Mon, 14 Oct 2019 13:03:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D17F4C04A;
 Mon, 14 Oct 2019 13:03:52 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.59.28])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Oct 2019 13:03:52 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: christophe.leroy@c-s.fr, mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v5 0/7] Powerpc/Watchpoint: Few important fixes
Date: Mon, 14 Oct 2019 18:33:39 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19101413-0012-0000-0000-00000357EF6B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19101413-0013-0000-0000-000021930186
Message-Id: <20191014130346.22660-1-ravi.bangoria@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-14_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910140126
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

v4: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-September/197621.html

v4->v5:
 - patch 1,2,3/7: Split v4 patch1 into three differnet patches.
   * 1st patch to replace hardcoded watchpoint length with macros
   * 2nd patch that fixes the unaligned watchpoint issue
   * 3rd patch that fixes ptrace code that mucks around address/len
 - patch 3/7: v4 patch1 was creating a regression in watchpoint length
   calculation in ptrace code. Fixed that.
 - patch 7/7: Disabled MODE_RANGE and 512 byte testcases for 8xx. (Build
   tested only)
 - patch 7/7: Unaligned watchpoints are not supported with DABR. Test
   unaligned watchpoint only when DAWR is present.

Ravi Bangoria (7):
  Powerpc/Watchpoint: Introduce macros for watchpoint length
  Powerpc/Watchpoint: Fix length calculation for unaligned target
  Powerpc/Watchpoint: Fix ptrace code that muck around with address/len
  Powerpc/Watchpoint: Don't ignore extraneous exceptions blindly
  Powerpc/Watchpoint: Rewrite ptrace-hwbreak.c selftest
  Powerpc/Watchpoint: Add dar outside test in perf-hwbreak.c selftest
  Powerpc/Watchpoint: Support for 8xx in ptrace-hwbreak.c selftest

 arch/powerpc/include/asm/hw_breakpoint.h      |   9 +-
 arch/powerpc/kernel/dawr.c                    |   6 +-
 arch/powerpc/kernel/hw_breakpoint.c           | 119 ++--
 arch/powerpc/kernel/process.c                 |   3 +
 arch/powerpc/kernel/ptrace.c                  |  16 +-
 arch/powerpc/xmon/xmon.c                      |   2 +-
 .../selftests/powerpc/ptrace/perf-hwbreak.c   | 111 +++-
 .../selftests/powerpc/ptrace/ptrace-hwbreak.c | 581 +++++++++++-------
 8 files changed, 582 insertions(+), 265 deletions(-)

-- 
2.21.0

