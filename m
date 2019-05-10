Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC8451A173
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 May 2019 18:28:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 450wcF6xtbzDqRy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 May 2019 02:27:57 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 450wZm6Q0nzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 May 2019 02:26:40 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4AGLsvC079050
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 12:26:38 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sdb4a4v66-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 May 2019 12:26:37 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Fri, 10 May 2019 17:26:36 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 10 May 2019 17:26:34 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4AGQWeH48496772
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 May 2019 16:26:32 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8A9B7A4040;
 Fri, 10 May 2019 16:26:32 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F4198A4057;
 Fri, 10 May 2019 16:26:30 +0000 (GMT)
Received: from naverao1-tp.ibm.com (unknown [9.79.183.144])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 10 May 2019 16:26:30 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/8] Provide vcpu dispatch statistics
Date: Fri, 10 May 2019 21:56:15 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19051016-0020-0000-0000-0000033B62F6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051016-0021-0000-0000-0000218E1061
Message-Id: <cover.1557502887.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905100111
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

This series adds a new procfs file /proc/powerpc/vcpudispatch_stats for 
providing statistics around how the LPAR processors are dispatched by 
the POWER Hypervisor, in a shared LPAR environment. Patch 6/8 has more 
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


- Naveen

Naveen N. Rao (8):
  powerpc/pseries: Use macros for referring to the DTL enable mask
  powerpc/pseries: Do not save the previous DTL mask value
  powerpc/pseries: Factor out DTL buffer allocation and registration
    routines
  powerpc/pseries: Generalize hcall_vphn()
  powerpc/pseries: Introduce helpers to gatekeep DTLB usage
  powerpc/pseries: Provide vcpu dispatch statistics
  powerpc/pseries: Protect against hogging the cpu while setting up the
    stats
  powerpc/pseries: Add documentation for vcpudispatch_stats

 Documentation/powerpc/vcpudispatch_stats.txt |  68 +++
 arch/powerpc/include/asm/lppaca.h            |  11 +
 arch/powerpc/include/asm/plpar_wrappers.h    |   4 +
 arch/powerpc/include/asm/topology.h          |   4 +
 arch/powerpc/mm/book3s64/vphn.h              |   8 +
 arch/powerpc/mm/numa.c                       | 134 ++++-
 arch/powerpc/platforms/pseries/dtl.c         |  22 +-
 arch/powerpc/platforms/pseries/lpar.c        | 550 ++++++++++++++++++-
 arch/powerpc/platforms/pseries/setup.c       |  34 +-
 9 files changed, 760 insertions(+), 75 deletions(-)
 create mode 100644 Documentation/powerpc/vcpudispatch_stats.txt

-- 
2.21.0

