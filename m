Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9C25EA07
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:07:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f6x773YZzDqZP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 03:07:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f6sG5QDKzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:04:17 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63H2kCt088352
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 3 Jul 2019 13:04:15 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2th0728hx7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 13:04:14 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 3 Jul 2019 18:04:13 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:04:10 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x63H49YW44433598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:04:09 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C9F7AE055;
 Wed,  3 Jul 2019 17:04:09 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC66DAE04D;
 Wed,  3 Jul 2019 17:04:07 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.84.138])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:04:07 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 0/9] Provide vcpu dispatch statistics
Date: Wed,  3 Jul 2019 22:33:53 +0530
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070317-0020-0000-0000-0000034FDF2C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0021-0000-0000-000021A37841
Message-Id: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-03_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907030207
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mingming Cao <mingming.cao@ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Changes since v2:
- Moved most prototypes to asm/lppaca.h instead of asm/plpar_wrappers.h
- Patch 4/9 changed to use rwlocks for guarding DTL buffer usage across 
  debugfs and the new vcpudispatch_stats.
- Patch 6/9 has been updated to address breakage of the vphn selftest 
  under tools/testing/selftests/powerpc/vphn.
- Patch 7/9 has changes to accommodate use of rwlocks, as well as some 
  simplification for locking while enabling/disabling statistics.

Changes since v1:
- Changes have been done primarily to address a few build issues, by 
  moving changes out of mm/numa.c to other places.
- Patches 1-5,8-9 have been rebased with patches 4 and 5 being 
  interchanged, and patch 4 incorporating #ifdef CONFIG_PPC_SPLPAR.
- Patch 6 is new and moves vphn code under pseries.
- Patch 7 has changes to move most of the code from mm/numa.c into 
  platforms/pseries/lpar.c, along with guarding some of these under 
  CONFIG_PPC_SPLPAR. 

Changes since RFC:
- Patches 1/8 to 5/8: no changes, except rebase to powerpc/merge
- Patch 6/8: The mutex guarding the vphn hcall has been dropped. It was 
  only meant to serialize hcalls issued when stats are initially 
  enabled.  However, in reality, the various per-cpu workers will be 
  scheduled at slightly different times and chances of hcalls for 
  retrieving the same associativity information at the same time is very 
  less. Even in that case, there are no other side effects.
- Patch 6/8: The third column for vcpu dispatches on the same core, but 
  different thread has been dropped and merged with the second column.  
- Patch 7/8: new patch to ensure we don't take too much time while 
  enabling/disabling statistics on large systems with heavy workload.
- Patch 8/8: new patch adding a document describing the fields in the 
  procfs file.

--
This series adds a new procfs file /proc/powerpc/vcpudispatch_stats for 
providing statistics around how the LPAR processors are dispatched by 
the POWER Hypervisor, in a shared LPAR environment. Patch 7/9 has more 
details on how the statistics are gathered.

An example output:
    $ sudo cat /proc/powerpc/vcpudispatch_stats
    cpu0 6839 4126 2683 30 0 6821 18 0
    cpu1 2515 1274 1229 12 0 2509 6 0
    cpu2 2317 1198 1109 10 0 2312 5 0
    cpu3 2259 1165 1088 6 0 2256 3 0
    cpu4 2205 1143 1056 6 0 2202 3 0
    cpu5 2165 1121 1038 6 0 2162 3 0
    cpu6 2183 1127 1050 6 0 2180 3 0
    cpu7 2193 1133 1052 8 0 2187 6 0
    cpu8 2165 1115 1032 18 0 2156 9 0
    cpu9 2301 1252 1033 16 0 2293 8 0
    cpu10 2197 1138 1041 18 0 2187 10 0
    cpu11 2273 1185 1062 26 0 2260 13 0
    cpu12 2186 1125 1043 18 0 2177 9 0
    cpu13 2161 1115 1030 16 0 2153 8 0
    cpu14 2206 1153 1033 20 0 2196 10 0
    cpu15 2163 1115 1032 16 0 2155 8 0

In the output above, for vcpu0, there have been 6839 dispatches since
statistics were enabled. 4126 of those dispatches were on the same
physical cpu as the last time. 2683 were on a different core, but within
the same chip, while 30 dispatches were on a different chip compared to
its last dispatch.

Also, out of the total of 6839 dispatches, we see that there have been
6821 dispatches on the vcpu's home node, while 18 dispatches were
outside its home node, on a neighbouring chip.


- Naveen

Naveen N. Rao (9):
  powerpc/pseries: Use macros for referring to the DTL enable mask
  powerpc/pseries: Do not save the previous DTL mask value
  powerpc/pseries: Factor out DTL buffer allocation and registration
    routines
  powerpc/pseries: Introduce rwlock to gatekeep DTLB usage
  powerpc/pseries: Generalize hcall_vphn()
  powerpc/pseries: Move mm/book3s64/vphn.c under platforms/pseries/
  powerpc/pseries: Provide vcpu dispatch statistics
  powerpc/pseries: Protect against hogging the cpu while setting up the
    stats
  powerpc/pseries: Add documentation for vcpudispatch_stats

 Documentation/powerpc/vcpudispatch_stats.txt  |  68 ++
 arch/powerpc/include/asm/lppaca.h             |  40 ++
 arch/powerpc/include/asm/topology.h           |   6 +
 arch/powerpc/mm/book3s64/Makefile             |   1 -
 arch/powerpc/mm/book3s64/vphn.h               |  16 -
 arch/powerpc/mm/numa.c                        |  35 +-
 arch/powerpc/platforms/pseries/Makefile       |   1 +
 arch/powerpc/platforms/pseries/dtl.c          |  23 +-
 arch/powerpc/platforms/pseries/lpar.c         | 602 +++++++++++++++++-
 arch/powerpc/platforms/pseries/setup.c        |  34 +-
 .../{mm/book3s64 => platforms/pseries}/vphn.c |  20 +-
 tools/testing/selftests/powerpc/vphn/Makefile |   2 +-
 .../selftests/powerpc/vphn/asm/lppaca.h       |   1 +
 tools/testing/selftests/powerpc/vphn/vphn.c   |   2 +-
 tools/testing/selftests/powerpc/vphn/vphn.h   |   1 -
 15 files changed, 752 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/powerpc/vcpudispatch_stats.txt
 delete mode 100644 arch/powerpc/mm/book3s64/vphn.h
 rename arch/powerpc/{mm/book3s64 => platforms/pseries}/vphn.c (80%)
 create mode 120000 tools/testing/selftests/powerpc/vphn/asm/lppaca.h
 delete mode 120000 tools/testing/selftests/powerpc/vphn/vphn.h

-- 
2.22.0

