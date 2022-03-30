Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BCC914EC604
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 15:52:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KT7D94dqRz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 00:52:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f1WEaQcS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f1WEaQcS; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KT7CR3kKVz2xb1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 00:52:02 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22UBvaCc000506; 
 Wed, 30 Mar 2022 13:51:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=LwOiCD7ULa7QFysdbp5LCDxiSy4gGwG+AkFsd47R1Dg=;
 b=f1WEaQcSOeHnuOuofUx1qNFBYJs2zm6T9j1E+4y1khzDyXC3Xm+/lSns4JQ+X+T+n0N+
 hS8GFyyYDoDg4MqAcphykAsn0SC/MYi6N4Sucr6ktJXe4vbfGdiWav/eijjUKXJUcKWb
 sfQnwKPKHHgXMqFiZGmzGD03TWF106TFaOhcnG4FRvJ5vH/D42PWC0PTwzxpuun9r6WO
 TwzSJWFVxGdOonVzEy2VPK6jYktTv9sJncCgyNTjiJv746iDlpIkVGATotxRUV84bveH
 rfjtSRreyLzg1rQk7VVu0zMyWjysXiSvgrP+Vs1IbJEWZDJkStmfovbyXClmpolV+omK 6Q== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f4psu2j86-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 13:51:53 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22UDiLah016604;
 Wed, 30 Mar 2022 13:51:51 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3f1tf90qq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Mar 2022 13:51:51 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22UDpmXI40305016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 30 Mar 2022 13:51:48 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB3AF11C054;
 Wed, 30 Mar 2022 13:51:48 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05E9111C04A;
 Wed, 30 Mar 2022 13:51:47 +0000 (GMT)
Received: from saptagiri.in.ibm.com (unknown [9.43.100.4])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 30 Mar 2022 13:51:46 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/numa: Handle partially initialized numa nodes
Date: Wed, 30 Mar 2022 19:21:23 +0530
Message-Id: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OPgegmOLR9akDNkqQgO8Lw_7cQSqboq8
X-Proofpoint-GUID: OPgegmOLR9akDNkqQgO8Lw_7cQSqboq8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-30_04,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0 mlxlogscore=787
 malwarescore=0 clxscore=1011 suspectscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203300066
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Michal Hocko <mhocko@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit 09f49dca570a ("mm: handle uninitialized numa nodes
gracefully") NODE_DATA for even a memoryless/cpuless node is partially
initialized at boot time.

Before onlining the node, current Powerpc code checks for NODE_DATA to
be NULL. However since NODE_DATA is partially initialized, this check
will end up always being false.

This causes hotplugging a CPU to a memoryless/cpuless node to fail.

Before adding CPUs
$ numactl -H
available: 1 nodes (4)
node 4 cpus: 0 1 2 3 4 5 6 7
node 4 size: 97372 MB
node 4 free: 95545 MB
node distances:
node   4
4:  10

$ lparstat
System Configuration
type=Dedicated mode=Capped smt=8 lcpu=1 mem=99709440 kB cpus=0 ent=1.00

%user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
----- ----- -----    -----    ----- ----- ----- ----- ----- -----
2.66  2.67  0.16    94.51     0.00  0.00  5.33  0.00 67749     0

After hotplugging 32 cores
$ numactl -H
node 4 cpus: 0 1 2 3 4 5 6 7 120 121 122 123 124 125 126 127 128 129 130
131 132 133 134 135 136 137 138 139 140 141 142 143 144 145 146 147 148
149 150 151 152 153 154 155 156 157 158 159 160 161 162 163 164 165 166
167 168 169 170 171 172 173 174 175
node 4 size: 97372 MB
node 4 free: 93636 MB
node distances:
node   4
4:  10

$ lparstat
System Configuration
type=Dedicated mode=Capped smt=8 lcpu=33 mem=99709440 kB cpus=0 ent=33.00

%user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
----- ----- -----    -----    ----- ----- ----- ----- ----- -----
0.04  0.02  0.00    99.94     0.00  0.00  0.06  0.00 1128751     3

As we can see numactl is listing only 8 cores while lparstat is showing
33 cores.

Also dmesg is showing messages like:
[ 2261.318350 ] BUG: arch topology borken
[ 2261.318357 ]      the DIE domain not a subset of the NODE domain

Fixes: 09f49dca570a ("mm: handle uninitialized numa nodes gracefully")
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org
Cc: Michal Hocko <mhocko@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Reported-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
 arch/powerpc/mm/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index b9b7fefbb64b..13022d734951 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1436,7 +1436,7 @@ int find_and_online_cpu_nid(int cpu)
 	if (new_nid < 0 || !node_possible(new_nid))
 		new_nid = first_online_node;
 
-	if (NODE_DATA(new_nid) == NULL) {
+	if (!node_online(new_nid)) {
 #ifdef CONFIG_MEMORY_HOTPLUG
 		/*
 		 * Need to ensure that NODE_DATA is initialized for a node from
-- 
2.27.0

