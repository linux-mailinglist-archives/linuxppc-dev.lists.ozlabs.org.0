Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16EB31EDBC2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 05:38:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49cs1d6FYYzDqbD
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 13:38:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49cryN1gqKzDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 13:35:24 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0543XlRY029240; Wed, 3 Jun 2020 23:35:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ds8j8hca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 23:35:09 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0543Xufd029513;
 Wed, 3 Jun 2020 23:35:08 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31ds8j8hbp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Jun 2020 23:35:08 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0543WLIl002650;
 Thu, 4 Jun 2020 03:35:06 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04fra.de.ibm.com with ESMTP id 31bf483qf9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Jun 2020 03:35:06 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0543Z36s65470502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Jun 2020 03:35:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0769311C05B;
 Thu,  4 Jun 2020 03:35:03 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6961311C052;
 Thu,  4 Jun 2020 03:34:59 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.58.254])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  4 Jun 2020 03:34:59 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v2 0/8] powerpc/watchpoint: Enable 2nd DAWR on baremetal and
 powervm
Date: Thu,  4 Jun 2020 09:04:35 +0530
Message-Id: <20200604033443.70591-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-03_13:2020-06-02,
 2020-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 cotscore=-2147483648 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=596 phishscore=0 malwarescore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006040020
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
Cc: christophe.leroy@c-s.fr, ravi.bangoria@linux.ibm.com, apopple@linux.ibm.com,
 peterz@infradead.org, fweisbec@gmail.com, oleg@redhat.com, npiggin@gmail.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, jolsa@kernel.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Last series[1] was to add basic infrastructure support for more than
one watchpoint on Book3S powerpc. This series actually enables the 2nd 
DAWR for baremetal and powervm. Kvm guest is still not supported.

v1: https://lore.kernel.org/linuxppc-dev/20200602040106.127693-1-ravi.bangoria@linux.ibm.com

v1->v2:
  - Milton reported an issue with one patch in last series[1]. patch #1
    fixes that. So patch#1 is new.
  - Rebased to powerpc/next which now has "Base support for POWER10"[2]
    series included.

[1]: https://lore.kernel.org/linuxppc-dev/20200514111741.97993-1-ravi.bangoria@linux.ibm.com/
[2]: https://lore.kernel.org/linuxppc-dev/20200521014341.29095-1-alistair@popple.id.au

Ravi Bangoria (8):
  powerpc/watchpoint: Fix 512 byte boundary limit
  powerpc/watchpoint: Enable watchpoint functionality on power10 guest
  powerpc/dt_cpu_ftrs: Add feature for 2nd DAWR
  powerpc/watchpoint: Set CPU_FTR_DAWR1 based on pa-features bit
  powerpc/watchpoint: Rename current H_SET_MODE DAWR macro
  powerpc/watchpoint: Guest support for 2nd DAWR hcall
  powerpc/watchpoint: Return available watchpoints dynamically
  powerpc/watchpoint: Remove 512 byte boundary

 arch/powerpc/include/asm/cputable.h       | 13 +++++++++----
 arch/powerpc/include/asm/hvcall.h         |  3 ++-
 arch/powerpc/include/asm/hw_breakpoint.h  |  5 +++--
 arch/powerpc/include/asm/machdep.h        |  2 +-
 arch/powerpc/include/asm/plpar_wrappers.h |  7 ++++++-
 arch/powerpc/kernel/dawr.c                |  2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c         |  7 +++++++
 arch/powerpc/kernel/hw_breakpoint.c       |  5 +++--
 arch/powerpc/kernel/prom.c                |  2 ++
 arch/powerpc/kvm/book3s_hv.c              |  2 +-
 arch/powerpc/platforms/pseries/setup.c    |  7 +++++--
 11 files changed, 40 insertions(+), 15 deletions(-)

-- 
2.26.2

