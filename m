Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AD9217EA4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 06:53:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1n593N3BzDr2w
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 14:53:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1n2L1C8RzDr37
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 14:51:15 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0684Zfga136800; Wed, 8 Jul 2020 00:51:02 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3251muysuh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 00:51:02 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0684j268011419;
 Wed, 8 Jul 2020 00:51:02 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3251muysts-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 00:51:02 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0684klqX012028;
 Wed, 8 Jul 2020 04:50:59 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 322h1h4252-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 04:50:59 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0684oumC47579336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 04:50:56 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EB74AE057;
 Wed,  8 Jul 2020 04:50:56 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A96D3AE045;
 Wed,  8 Jul 2020 04:50:52 +0000 (GMT)
Received: from bangoria.ibmuc.com (unknown [9.199.51.84])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 04:50:52 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
To: mpe@ellerman.id.au, mikey@neuling.org
Subject: [PATCH v3 0/9] powerpc/watchpoint: Enable 2nd DAWR on baremetal and
 powervm
Date: Wed,  8 Jul 2020 10:20:37 +0530
Message-Id: <20200708045046.135702-1-ravi.bangoria@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_01:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0 cotscore=-2147483648
 lowpriorityscore=0 bulkscore=0 mlxlogscore=604 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080024
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
 peterz@infradead.org, fweisbec@gmail.com, miltonm@us.ibm.com, oleg@redhat.com,
 npiggin@gmail.com, linux-kernel@vger.kernel.org, paulus@samba.org,
 jolsa@kernel.org, pedromfc@br.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Last series[1] was to add basic infrastructure support for more than
one watchpoint on Book3S powerpc. This series actually enables the 2nd 
DAWR for baremetal and powervm. Kvm guest is still not supported.

v2: https://lore.kernel.org/linuxppc-dev/20200604033443.70591-1-ravi.bangoria@linux.ibm.com/

v2->v3:
 - patch #2 is new. It fixes an issue with DAWR exception constraint
 - Rename dawr1 to debug-facilities-v31 in dt cpu feature, suggested
   by Nick Piggin.
 - Rebased to powerpc/next

[1]: https://lore.kernel.org/linuxppc-dev/20200514111741.97993-1-ravi.bangoria@linux.ibm.com/

Ravi Bangoria (9):
  powerpc/watchpoint: Fix 512 byte boundary limit
  powerpc/watchpoint: Fix DAWR exception constraint
  powerpc/watchpoint: Enable watchpoint functionality on power10 guest
  powerpc/dt_cpu_ftrs: Add feature for 2nd DAWR
  powerpc/watchpoint: Set CPU_FTR_DAWR1 based on pa-features bit
  powerpc/watchpoint: Rename current H_SET_MODE DAWR macro
  powerpc/watchpoint: Guest support for 2nd DAWR hcall
  powerpc/watchpoint: Return available watchpoints dynamically
  powerpc/watchpoint: Remove 512 byte boundary

 arch/powerpc/include/asm/cputable.h       | 13 ++-
 arch/powerpc/include/asm/hvcall.h         |  3 +-
 arch/powerpc/include/asm/hw_breakpoint.h  |  5 +-
 arch/powerpc/include/asm/machdep.h        |  2 +-
 arch/powerpc/include/asm/plpar_wrappers.h |  7 +-
 arch/powerpc/kernel/dawr.c                |  2 +-
 arch/powerpc/kernel/dt_cpu_ftrs.c         |  7 ++
 arch/powerpc/kernel/hw_breakpoint.c       | 98 +++++++++++++++--------
 arch/powerpc/kernel/prom.c                |  2 +
 arch/powerpc/kvm/book3s_hv.c              |  2 +-
 arch/powerpc/platforms/pseries/setup.c    |  7 +-
 11 files changed, 103 insertions(+), 45 deletions(-)

-- 
2.26.2

