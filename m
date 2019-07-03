Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42C5EA64
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2019 19:24:07 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45f7J242FxzDqCM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jul 2019 03:24:02 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45f6sd1GzYzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jul 2019 03:04:36 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x63H2RNF179566
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 3 Jul 2019 13:04:35 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tgxvqbr9s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Jul 2019 13:04:35 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <naveen.n.rao@linux.vnet.ibm.com>;
 Wed, 3 Jul 2019 18:04:33 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 3 Jul 2019 18:04:30 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x63H4T0559375704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 3 Jul 2019 17:04:29 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 549FBAE051;
 Wed,  3 Jul 2019 17:04:29 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C6479AE055;
 Wed,  3 Jul 2019 17:04:27 +0000 (GMT)
Received: from naverao1-tp.ibmuc.com (unknown [9.85.84.138])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  3 Jul 2019 17:04:27 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 9/9] powerpc/pseries: Add documentation for
 vcpudispatch_stats
Date: Wed,  3 Jul 2019 22:34:02 +0530
X-Mailer: git-send-email 2.22.0
In-Reply-To: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
References: <cover.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070317-0012-0000-0000-0000032EE355
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070317-0013-0000-0000-000021683740
Message-Id: <c67a23a2f20b6cc48a9361498ee937e148477ee3.1562171646.git.naveen.n.rao@linux.vnet.ibm.com>
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

Add a document describing the fields provided by
/proc/powerpc/vcpudispatch_stats.

Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
---
 Documentation/powerpc/vcpudispatch_stats.txt | 68 ++++++++++++++++++++
 1 file changed, 68 insertions(+)
 create mode 100644 Documentation/powerpc/vcpudispatch_stats.txt

diff --git a/Documentation/powerpc/vcpudispatch_stats.txt b/Documentation/powerpc/vcpudispatch_stats.txt
new file mode 100644
index 000000000000..e21476bfd78c
--- /dev/null
+++ b/Documentation/powerpc/vcpudispatch_stats.txt
@@ -0,0 +1,68 @@
+VCPU Dispatch Statistics:
+=========================
+
+For Shared Processor LPARs, the POWER Hypervisor maintains a relatively
+static mapping of the LPAR processors (vcpus) to physical processor
+chips (representing the "home" node) and tries to always dispatch vcpus
+on their associated physical processor chip. However, under certain
+scenarios, vcpus may be dispatched on a different processor chip (away
+from its home node).
+
+/proc/powerpc/vcpudispatch_stats can be used to obtain statistics
+related to the vcpu dispatch behavior. Writing '1' to this file enables
+collecting the statistics, while writing '0' disables the statistics.
+By default, the DTLB log for each vcpu is processed 50 times a second so
+as not to miss any entries. This processing frequency can be changed
+through /proc/powerpc/vcpudispatch_stats_freq.
+
+The statistics themselves are available by reading the procfs file
+/proc/powerpc/vcpudispatch_stats. Each line in the output corresponds to
+a vcpu as represented by the first field, followed by 8 numbers.
+
+The first number corresponds to:
+1. total vcpu dispatches since the beginning of statistics collection
+
+The next 4 numbers represent vcpu dispatch dispersions:
+2. number of times this vcpu was dispatched on the same processor as last
+   time
+3. number of times this vcpu was dispatched on a different processor core
+   as last time, but within the same chip
+4. number of times this vcpu was dispatched on a different chip
+5. number of times this vcpu was dispatches on a different socket/drawer
+(next numa boundary)
+
+The final 3 numbers represent statistics in relation to the home node of
+the vcpu:
+6. number of times this vcpu was dispatched in its home node (chip)
+7. number of times this vcpu was dispatched in a different node
+8. number of times this vcpu was dispatched in a node further away (numa
+distance)
+
+An example output:
+    $ sudo cat /proc/powerpc/vcpudispatch_stats
+    cpu0 6839 4126 2683 30 0 6821 18 0
+    cpu1 2515 1274 1229 12 0 2509 6 0
+    cpu2 2317 1198 1109 10 0 2312 5 0
+    cpu3 2259 1165 1088 6 0 2256 3 0
+    cpu4 2205 1143 1056 6 0 2202 3 0
+    cpu5 2165 1121 1038 6 0 2162 3 0
+    cpu6 2183 1127 1050 6 0 2180 3 0
+    cpu7 2193 1133 1052 8 0 2187 6 0
+    cpu8 2165 1115 1032 18 0 2156 9 0
+    cpu9 2301 1252 1033 16 0 2293 8 0
+    cpu10 2197 1138 1041 18 0 2187 10 0
+    cpu11 2273 1185 1062 26 0 2260 13 0
+    cpu12 2186 1125 1043 18 0 2177 9 0
+    cpu13 2161 1115 1030 16 0 2153 8 0
+    cpu14 2206 1153 1033 20 0 2196 10 0
+    cpu15 2163 1115 1032 16 0 2155 8 0
+
+In the output above, for vcpu0, there have been 6839 dispatches since
+statistics were enabled. 4126 of those dispatches were on the same
+physical cpu as the last time. 2683 were on a different core, but within
+the same chip, while 30 dispatches were on a different chip compared to
+its last dispatch.
+
+Also, out of the total of 6839 dispatches, we see that there have been
+6821 dispatches on the vcpu's home node, while 18 dispatches were
+outside its home node, on a neighbouring chip.
-- 
2.22.0

