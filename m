Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 635AF195674
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 12:36:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pfvL1KzPzDrB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 22:36:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pfqJ3t5PzDr75
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 22:32:59 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02RB4A11003703; Fri, 27 Mar 2020 07:32:52 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywet7cg9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 07:32:52 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02RBUI9N022646;
 Fri, 27 Mar 2020 11:32:51 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 2ywawn9tfe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 11:32:51 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02RBWpoC54985032
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 11:32:51 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FFF52805A;
 Fri, 27 Mar 2020 11:32:51 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A332E28059;
 Fri, 27 Mar 2020 11:32:50 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.72.108])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 Mar 2020 11:32:50 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 383B82E3408; Fri, 27 Mar 2020 17:02:45 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v4 0/6] [PATCH v4 0/6] Track and expose idle PURR and SPURR
 ticks
Date: Fri, 27 Mar 2020 17:02:34 +0530
Message-Id: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-27_03:2020-03-27,
 2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 malwarescore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003270102
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

Hi,

This is the fourth version of the patches to track and expose idle PURR
and SPURR ticks. These patches are required by tools such as lparstat
to compute system utilization for capacity planning purposes.

The previous versions can be found here:
v3: https://lkml.org/lkml/2020/3/11/331
v2: https://lkml.org/lkml/2020/2/21/21
v1: https://lore.kernel.org/patchwork/cover/1159341/

They key changes from v3 are:

   - Fixed the build errors on !CONFIG_PPC64 and !CONFIG_PPC_PSERIES
     configurations notified by the kbuild bot.


Motivation:
===========
On PSeries LPARs, the data centers planners desire a more accurate
view of system utilization per resource such as CPU to plan the system
capacity requirements better. Such accuracy can be obtained by reading
PURR/SPURR registers for CPU resource utilization.

Tools such as lparstat which are used to compute the utilization need
to know [S]PURR ticks when the cpu was busy or idle. The [S]PURR
counters are already exposed through sysfs.  We already account for
PURR ticks when we go to idle so that we can update the VPA area. This
patchset extends support to account for SPURR ticks when idle, and
expose both via per-cpu sysfs files.

This patch series also introduces a patch (Patch 6/6) to send an IPI
in order to read and cache the values of purr, spurr, idle_purr and
idle_spurr of the target CPU when any one of them is read via
sysfs. These cached values will be presented if any of these sysfs are
read within the next 10ms. If these sysfs files are read after 10ms
from the earlier IPI, a fresh IPI is issued to read and cache the
values again. This minimizes the number of IPIs required to be sent
when these values are read back-to-back via the sysfs interface.

    Without patch 6/6 (Without caching): 
                 16 [XICS 2 Edge IPI] = 422 times
                 DBL [Doorbell interrupts] = 13 times
                 Total : 435 IPIs.
    
    With patch 6/6 (With caching):
                  16 [XICS 2 Edge IPI] = 111 times
                  DBL [Doorbell interrupts] = 17 times
                  Total : 128 IPIs.

These patches are required for enhancement to the lparstat utility
that compute the CPU utilization based on PURR and SPURR which can be
found here :
https://groups.google.com/forum/#!topic/powerpc-utils-devel/fYRo69xO9r4


With the patches, when lparstat is run on a LPAR running CPU-Hogs,
=========================================================================
sudo ./src/lparstat -E 1 3
System Configuration
type=Dedicated mode=Capped smt=8 lcpu=2 mem=4834176 kB cpus=0 ent=2.00 
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
 99.99   0.00  3.35GHz[111%] 110.99   0.00
100.00   0.00  3.35GHz[111%] 111.00   0.00
100.00   0.00  3.35GHz[111%] 111.00   0.00

With patches, when lparstat is run on and idle LPAR
=========================================================================
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
0.20  99.81  2.17GHz[ 72%]   0.19  71.82
0.42  99.58  2.11GHz[ 70%]   0.31  69.69
0.41  99.59  2.11GHz[ 70%]   0.31  69.69

Gautham R. Shenoy (6):
  powerpc: Move idle_loop_prolog()/epilog() functions to header file
  powerpc/idle: Add accessor function to always read latest idle PURR
  powerpc/pseries: Account for SPURR ticks on idle CPUs
  powerpc/sysfs: Show idle_purr and idle_spurr for every CPU
  Documentation: Document sysfs interfaces purr, spurr, idle_purr,
    idle_spurr
  pseries/sysfs: Minimise IPI noise while reading [idle_][s]purr

 Documentation/ABI/testing/sysfs-devices-system-cpu |  39 +++++
 arch/powerpc/include/asm/idle.h                    |  93 ++++++++++++
 arch/powerpc/kernel/sysfs.c                        | 167 ++++++++++++++++++++-
 arch/powerpc/platforms/pseries/setup.c             |   8 +-
 drivers/cpuidle/cpuidle-pseries.c                  |  39 +----
 5 files changed, 305 insertions(+), 41 deletions(-)
 create mode 100644 arch/powerpc/include/asm/idle.h

-- 
1.9.4

