Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AB9222402A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 09:35:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ7673nwHzDqGg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 17:35:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VkzXa55o; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ6lz0lVxzDqNf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 17:19:26 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A73H6A176532; Mon, 10 Aug 2020 03:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=R4cXQesq5YrQSp8j2SK9ClMXcspoeGwGaqpBIKTSWI4=;
 b=VkzXa55ojE1+myVpSG3XY2Ohtx5SP9jaQ3SscXfClIknNOaFLDxpSfQ/Xs5cCsBfMCzM
 1sCNLrKKMxUsPFM0ohnjQMcKTdz2KSXHo0W3j9gOz8UBQBcu30bqD8bgtqQrg6bRVdbx
 QgRfrmpar6E+LttQWJgSGQ5KG1DPCFPcm3XPLNLaFp7/APUbzf5urvAbcNRuoaool14N
 KrPEmV7aGeVGn88cXQYcjqlOPhKB1pvG0EwUKsuC12ZWcOffljQ/1fpS7FkfJFRzw7r2
 V3khBh3F0p6YI4Z85OXEAKnUEJmF/MTrEwt4XcuY5rlWXZK5/kFrEbWirytEf35t4EOd 3w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32srj6aw6j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:19:18 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07A784TA005807;
 Mon, 10 Aug 2020 03:19:18 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32srj6aw5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 03:19:18 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07A7GEf5019372;
 Mon, 10 Aug 2020 07:19:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 32skp81ynx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 Aug 2020 07:19:15 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07A7Hjhn63767016
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 07:17:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ED23B11C052;
 Mon, 10 Aug 2020 07:19:12 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5197B11C050;
 Mon, 10 Aug 2020 07:19:10 +0000 (GMT)
Received: from srikart450.in.ibm.com (unknown [9.102.18.208])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 10 Aug 2020 07:19:10 +0000 (GMT)
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v5 10/10] powerpc/smp: Implement cpu_to_coregroup_id
Date: Mon, 10 Aug 2020 12:48:34 +0530
Message-Id: <20200810071834.92514-11-srikar@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
References: <20200810071834.92514-1-srikar@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_02:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 mlxlogscore=849 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100048
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Jordan Niethe <jniethe5@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lookup the coregroup id from the associativity array.

If unable to detect the coregroup id, fallback on the core id.
This way, ensure sched_domain degenerates and an extra sched domain is
not created.

Ideally this function should have been implemented in
arch/powerpc/kernel/smp.c. However if its implemented in mm/numa.c, we
don't need to find the primary domain again.

If the device-tree mentions more than one coregroup, then kernel
implements only the last or the smallest coregroup, which currently
corresponds to the penultimate domain in the device-tree.

Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: LKML <linux-kernel@vger.kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Anton Blanchard <anton@ozlabs.org>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Cc: Michael Neuling <mikey@neuling.org>
Cc: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Valentin Schneider <valentin.schneider@arm.com>
Cc: Jordan Niethe <jniethe5@gmail.com>
Cc: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
Signed-off-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
---
Changelog v1 -> v2:
	Move coregroup_enabled before getting associativity (Gautham)

 arch/powerpc/mm/numa.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index 0d57779e7942..8b3b3ec7fcc4 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1218,6 +1218,26 @@ int find_and_online_cpu_nid(int cpu)
 
 int cpu_to_coregroup_id(int cpu)
 {
+	__be32 associativity[VPHN_ASSOC_BUFSIZE] = {0};
+	int index;
+
+	if (cpu < 0 || cpu > nr_cpu_ids)
+		return -1;
+
+	if (!coregroup_enabled)
+		goto out;
+
+	if (!firmware_has_feature(FW_FEATURE_VPHN))
+		goto out;
+
+	if (vphn_get_associativity(cpu, associativity))
+		goto out;
+
+	index = of_read_number(associativity, 1);
+	if (index > min_common_depth + 1)
+		return of_read_number(&associativity[index - 1], 1);
+
+out:
 	return cpu_to_core_id(cpu);
 }
 
-- 
2.18.2

