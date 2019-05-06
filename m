Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC793147C5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 11:46:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yHvB08wNzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 19:46:46 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yHrK6rxWzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 May 2019 19:44:10 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x469hMJb107068
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 May 2019 05:44:08 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2saggen0e9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 05:44:07 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Mon, 6 May 2019 10:44:06 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 10:44:03 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x469i1sX50593914
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 09:44:01 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D12842041;
 Mon,  6 May 2019 09:44:01 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20BC24203F;
 Mon,  6 May 2019 09:43:59 +0000 (GMT)
Received: from naverao1-tp.in.ibm.com (unknown [9.199.155.34])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 09:43:58 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Lynch <nathanl@linux.ibm.com>, Mingming Cao <mingming.cao@ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: [RFC PATCH 0/6] Provide vcpu dispatch statistics
Date: Mon,  6 May 2019 15:13:43 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19050609-0016-0000-0000-00000278C5CE
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050609-0017-0000-0000-000032D56955
Message-Id: <cover.1557134488.git.naveen.n.rao@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=865 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060085
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds a new procfs file /proc/powerpc/vcpudispatch_stats for 
providing statistics around how the LPAR processors are dispatched by 
the POWER Hypervisor, in a shared LPAR environment. Patch 6/6 has more 
details on how the statistics are gathered.

An example output:
    $ sudo cat /proc/powerpc/vcpudispatch_stats
    cpu0 6839 4126 0 2683 30 0 6821 18 0
    cpu1 2515 1274 0 1229 12 0 2509 6 0
    cpu2 2317 1198 0 1109 10 0 2312 5 0
    cpu3 2259 1165 0 1088 6 0 2256 3 0
    cpu4 2205 1143 0 1056 6 0 2202 3 0
    cpu5 2165 1121 0 1038 6 0 2162 3 0
    cpu6 2183 1127 0 1050 6 0 2180 3 0
    cpu7 2193 1133 0 1052 8 0 2187 6 0
    cpu8 2165 1115 0 1032 18 0 2156 9 0
    cpu9 2301 1252 0 1033 16 0 2293 8 0
    cpu10 2197 1138 0 1041 18 0 2187 10 0
    cpu11 2273 1185 0 1062 26 0 2260 13 0
    cpu12 2186 1125 0 1043 18 0 2177 9 0
    cpu13 2161 1115 0 1030 16 0 2153 8 0
    cpu14 2206 1153 0 1033 20 0 2196 10 0
    cpu15 2163 1115 0 1032 16 0 2155 8 0

In the output above, for cpu0, we see that there have been 6839 vcpu 
dispatches since statistics were enabled. The next 5 numbers represent 
dispatch dispersions without taking the vcpu home nodes into account.
- 4126 dispatches were on the same physical cpu as the previous time
- 2683 were on a different core, but within the same chip,
- while 30 times, a vcpu was dispatched on a different chip compared to 
  its last dispatch.

The next 3 numbers represent statistics in relation to the vcpu home 
node. We see that there have been 6821 dispatches in the vcpu home node, 
while 18 dispatches were in a different chip.

TODO:
- Consider need for adding cond_resched() in some places.
- More testing, especially on larger machines.


- Naveen

Naveen N. Rao (6):
  powerpc/pseries: Use macros for referring to the DTL enable mask
  powerpc/pseries: Do not save the previous DTL mask value
  powerpc/pseries: Factor out DTL buffer allocation and registration
    routines
  powerpc/pseries: Generalize hcall_vphn()
  powerpc/pseries: Introduce helpers to gatekeep DTLB usage
  powerpc/pseries: Provide vcpu dispatch statistics

 arch/powerpc/include/asm/lppaca.h         |  11 +
 arch/powerpc/include/asm/plpar_wrappers.h |   4 +
 arch/powerpc/include/asm/topology.h       |   4 +
 arch/powerpc/mm/book3s64/vphn.h           |   8 +
 arch/powerpc/mm/numa.c                    | 139 +++++-
 arch/powerpc/platforms/pseries/dtl.c      |  22 +-
 arch/powerpc/platforms/pseries/lpar.c     | 543 +++++++++++++++++++++-
 arch/powerpc/platforms/pseries/setup.c    |  34 +-
 8 files changed, 690 insertions(+), 75 deletions(-)

-- 
2.21.0

