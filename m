Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 186DE1F735C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:16:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jppl3tPpzDqwC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:15:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jpl36d0SzDqgl
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:12:47 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05C528SR138913; Fri, 12 Jun 2020 01:12:41 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kyekndmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:41 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 05C529UW138940;
 Fri, 12 Jun 2020 01:12:41 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31kyekndmj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 01:12:41 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05C5AXtX021982;
 Fri, 12 Jun 2020 05:12:40 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 31g2sb2xtf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Jun 2020 05:12:40 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05C5CdmV42467598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jun 2020 05:12:39 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59F122805A;
 Fri, 12 Jun 2020 05:12:39 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2A74228068;
 Fri, 12 Jun 2020 05:12:39 +0000 (GMT)
Received: from localhost (unknown [9.65.252.60])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 12 Jun 2020 05:12:39 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/18] remove extended cede offline mode and bogus topology
 update code
Date: Fri, 12 Jun 2020 00:12:20 -0500
Message-Id: <20200612051238.1007764-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-11_23:2020-06-11,
 2020-06-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 cotscore=-2147483648 phishscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006110174
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
Cc: tyreld@linux.ibm.com, srikar@linux.vnet.ibm.com, ego@linux.vnet.ibm.com,
 npiggin@gmail.com, svaidy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Two major parts to this series:

1. Removal of the extended cede offline mode for CPUs as well as the
   partition suspend code which accommodates it by temporarily
   onlining all CPUs prior to suspending the LPAR. This solves some
   accounting problems, simplifies the pseries CPU hotplug code, and
   greatly uncomplicates the existing partition suspend code, easing
   a much-needed transition to the Linux suspend framework. The two
   patches which make up this part have been posted before:

   https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=180718

   and they are simply incorporated unchanged into the larger series
   here, with Gautham's Reviewed-by added to patch #1.

2. Removal of the long-disabled "topology update" code, most of which
   resides in mm/numa.c, but there are pieces in pseries and rtasd to
   excise as well. This code was an attempt to honor changes in a
   partition's NUMA properties arising from resource reassignments
   which occur as part of a migration, VPHN change, or a Dynamic
   Platform Optimizer operation. Its main technique is to remove and
   re-add affected processors and LMBs and hope in vain that the
   changes in cpu-node and physaddr-node relationships aren't
   disruptive. We want to provide user space with some indication that
   Linux's logical NUMA representation has become out of sync with the
   platform's assignments, but we need to get this unusable stuff out
   of the way before this code can sustain new features.

Nathan Lynch (18):
  powerpc/pseries: remove cede offline state for CPUs
  powerpc/rtas: don't online CPUs for partition suspend
  powerpc/numa: remove ability to enable topology updates
  powerpc/numa: remove unreachable topology update code
  powerpc/numa: make vphn_enabled, prrn_enabled flags const
  powerpc/numa: remove unreachable topology timer code
  powerpc/numa: remove unreachable topology workqueue code
  powerpc/numa: remove vphn_enabled and prrn_enabled internal flags
  powerpc/numa: stub out numa_update_cpu_topology()
  powerpc/numa: remove timed_topology_update()
  powerpc/numa: remove start/stop_topology_update()
  powerpc/rtasd: simplify handle_rtas_event(), emit message on events
  powerpc/numa: remove prrn_is_enabled()
  powerpc/numa: remove arch_update_cpu_topology
  powerpc/pseries: remove prrn special case from DT update path
  powerpc/pseries: remove memory "re-add" implementation
  powerpc/pseries: remove dlpar_cpu_readd()
  powerpc/pseries: remove obsolete memory hotplug DT notifier code

 Documentation/core-api/cpu_hotplug.rst        |   7 -
 arch/powerpc/include/asm/rtas.h               |   3 -
 arch/powerpc/include/asm/topology.h           |  27 -
 arch/powerpc/kernel/rtas.c                    | 122 +----
 arch/powerpc/kernel/rtasd.c                   |  28 +-
 arch/powerpc/mm/numa.c                        | 486 ------------------
 arch/powerpc/platforms/pseries/hotplug-cpu.c  | 189 +------
 .../platforms/pseries/hotplug-memory.c        | 107 +---
 arch/powerpc/platforms/pseries/mobility.c     |  31 --
 .../platforms/pseries/offline_states.h        |  38 --
 arch/powerpc/platforms/pseries/pmem.c         |   1 -
 arch/powerpc/platforms/pseries/smp.c          |  28 +-
 arch/powerpc/platforms/pseries/suspend.c      |  27 +-
 13 files changed, 22 insertions(+), 1072 deletions(-)
 delete mode 100644 arch/powerpc/platforms/pseries/offline_states.h

-- 
2.25.4

