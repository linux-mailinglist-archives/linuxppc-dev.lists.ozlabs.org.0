Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 85BA9166EFB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 06:24:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48P0JT2W1NzDr0N
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 16:24:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48P09s1ljZzDqc5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 16:18:56 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L5EcVq078002; Fri, 21 Feb 2020 00:18:51 -0500
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y9sbv3xmb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 00:18:51 -0500
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01L5BsIs024158;
 Fri, 21 Feb 2020 05:18:49 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 2y6897f3u9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 05:18:49 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01L5ImD559441660
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 05:18:48 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 041AFBE059;
 Fri, 21 Feb 2020 05:18:48 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AE7A0BE053;
 Fri, 21 Feb 2020 05:18:47 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.31.110])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 05:18:47 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 02BA02E334A; Fri, 21 Feb 2020 10:48:43 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v2 0/5] Track and expose idle PURR and SPURR ticks
Date: Fri, 21 Feb 2020 10:48:29 +0530
Message-Id: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 mlxlogscore=999 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210035
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

This is the second version of the patches to track and expose idle
PURR and SPURR ticks. These patches are required by tools such as
lparstat to compute system utilization for capacity planning purposes.

v1 can be found here: https://lore.kernel.org/patchwork/cover/1159341/

The key changes from v1 are

    - The sysfs reads of idle PURR and SPURR now send an
      smp_call_function to the target CPU in order to read the most
      recent value of idle PURR and SPURR. This is required if the
      target CPU was idle for a long duration, in which case the
      cycles corresponding to its latest idle duration would not be
      updated in the variable tracking idle PURR/SPURR. Thus merely
      reading the variable would not reflect the most accurate idle
      PURR/SPURR ticks.
    
    - Ensured that even when idle PURR/SPURR values are read in an
      interrupt context in-between idle_loop_prolog() and
      idle_loop_epilog(), we return the value that includes the cycles
      spent in the most recent idle period.

    - The sysfs files for idle_purr and idle_spurr are created only
      when the FW_FEATURE_LPAR is enabled (the earlier version was
      checking for FW_FEATURE_SPLPAR)

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

These patches are required for enhancement to the lparstat utility
that compute the CPU utilization based on PURR and SPURR which can be
found here :
https://groups.google.com/forum/#!topic/powerpc-utils-devel/fYRo69xO9r4

With the patches, when lparstat is run on a LPAR running CPU-Hogs,
=========================================================================
$sudo ./src/lparstat -E 1 3
System Configuration
type=Dedicated mode=Capped smt=8 lcpu=2 mem=4834176 kB cpus=0 ent=2.00 
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
 99.99   0.00  3.35GHz[111%] 110.99   0.00
100.00   0.00  3.35GHz[111%] 111.00   0.00
100.00   0.00  3.35GHz[111%] 111.00   0.00
=========================================================================

When lparstat is run on an LPAR that is idle,
=========================================================================
$ sudo ./src/lparstat -E 1 3
System Configuration
type=Dedicated mode=Capped smt=8 lcpu=2 mem=4834176 kB cpus=0 ent=2.00 
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
  0.09  99.91  2.11GHz[ 70%]   0.11  69.90
  0.32  99.68  2.17GHz[ 72%]   0.25  71.75
  0.56  99.44  2.18GHz[ 72%]   0.42  71.58
=========================================================================

Gautham R. Shenoy (5):
  powerpc: Move idle_loop_prolog()/epilog() functions to header file
  powerpc/idle: Add accessor function to always read latest idle PURR
  powerpc/pseries: Account for SPURR ticks on idle CPUs
  powerpc/sysfs: Show idle_purr and idle_spurr for every CPU
  Documentation: Document sysfs interfaces purr, spurr, idle_purr,
    idle_spurr

 Documentation/ABI/testing/sysfs-devices-system-cpu | 39 ++++++++++
 arch/powerpc/include/asm/idle.h                    | 88 ++++++++++++++++++++++
 arch/powerpc/kernel/sysfs.c                        | 54 ++++++++++++-
 arch/powerpc/platforms/pseries/setup.c             |  8 +-
 drivers/cpuidle/cpuidle-pseries.c                  | 39 ++--------
 5 files changed, 191 insertions(+), 37 deletions(-)
 create mode 100644 arch/powerpc/include/asm/idle.h

-- 
1.9.4

