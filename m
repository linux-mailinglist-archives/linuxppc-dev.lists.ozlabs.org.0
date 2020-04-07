Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CAE9C1A0989
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 10:50:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xLhq2q8TzDqkP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 18:50:35 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xLf34lDVzDqcP
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Apr 2020 18:48:11 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0378XIHl135959; Tue, 7 Apr 2020 04:48:05 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3082hx98mq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 04:48:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0378iAvs026111;
 Tue, 7 Apr 2020 08:48:04 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 306hv6mbtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 07 Apr 2020 08:48:04 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0378m3J149349104
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Apr 2020 08:48:03 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A53AC605D;
 Tue,  7 Apr 2020 08:48:03 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA2F8C605A;
 Tue,  7 Apr 2020 08:48:02 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.79.178.96])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  7 Apr 2020 08:48:02 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id D58072E3219; Tue,  7 Apr 2020 14:17:58 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v5 0/5] Track and expose idle PURR and SPURR ticks
Date: Tue,  7 Apr 2020 14:17:38 +0530
Message-Id: <1586249263-14048-1-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-07_01:2020-04-07,
 2020-04-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 impostorscore=0
 malwarescore=0 phishscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 adultscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004070072
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

This is the fifth version of the patches to track and expose idle PURR
and SPURR ticks. These patches are required by tools such as lparstat
to compute system utilization for capacity planning purposes.

The previous versions can be found here:
v4: https://lkml.org/lkml/2020/3/27/323
v3: https://lkml.org/lkml/2020/3/11/331
v2: https://lkml.org/lkml/2020/2/21/21
v1: https://lore.kernel.org/patchwork/cover/1159341/

They changes from v4 are:

   - As suggested by Naveen, moved the functions read_this_idle_purr()
     and read_this_idle_spurr() from Patch 2 and Patch 3 respectively
     to Patch 4 where it is invoked.

   - Dropped Patch 6 which cached the values of purr, spurr,
     idle_purr, idle_spurr in order to minimize the number of IPIs
     sent.

   - Updated the dates for the idle_purr, idle_spurr in the
     Documentation Patch 5.

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
sudo ./src/lparstat -E 1 3

System Configuration
type=Dedicated mode=Capped smt=8 lcpu=2 mem=4834112 kB cpus=0 ent=2.00 

---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
1  99.99   0.00  3.35GHz[111%] 110.99   0.00
2 100.00   0.00  3.35GHz[111%] 111.01   0.00
3 100.00   0.00  3.35GHz[111%] 111.00   0.00

With patches, when lparstat is run on and idle LPAR
=========================================================================
System Configuration
type=Dedicated mode=Capped smt=8 lcpu=2 mem=4834112 kB cpus=0 ent=2.00 
---Actual---                 -Normalized-
%busy  %idle   Frequency     %busy  %idle
------ ------  ------------- ------ ------
1   0.15  99.84  2.17GHz[ 72%]   0.11  71.89
2   0.24  99.76  2.11GHz[ 70%]   0.18  69.82
3   0.24  99.75  2.11GHz[ 70%]   0.18  69.81

Gautham R. Shenoy (5):
  powerpc: Move idle_loop_prolog()/epilog() functions to header file
  powerpc/idle: Store PURR snapshot in a per-cpu global variable
  powerpc/pseries: Account for SPURR ticks on idle CPUs
  powerpc/sysfs: Show idle_purr and idle_spurr for every CPU
  Documentation: Document sysfs interfaces purr, spurr, idle_purr,
    idle_spurr

 Documentation/ABI/testing/sysfs-devices-system-cpu | 39 +++++++++
 arch/powerpc/include/asm/idle.h                    | 93 ++++++++++++++++++++++
 arch/powerpc/kernel/sysfs.c                        | 82 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/setup.c             |  8 +-
 drivers/cpuidle/cpuidle-pseries.c                  | 39 ++-------
 5 files changed, 224 insertions(+), 37 deletions(-)
 create mode 100644 arch/powerpc/include/asm/idle.h

-- 
1.9.4

