Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 688FC9424B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 05:03:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LK/ovx9M;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WYcNv2WMJz3cmg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2024 13:03:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LK/ovx9M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nysal@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYcNB0n28z3cT9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2024 13:02:49 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V1wCpU012216;
	Wed, 31 Jul 2024 03:02:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:in-reply-to:references
	:content-transfer-encoding:mime-version; s=pp1; bh=ZYIHr2zZWt/Su
	uAMd0JWNAyAI9xPq/ulbVbG9ZLFpe4=; b=LK/ovx9MUU8N2cc3qN/BgxBs48E3P
	fRqmRW49cEAgL6H22/PoRglt8PA/QyvohXAJqyDTKjwRoDMuJB1R8/ZNa3ZoRk3u
	LqApjmXCihXMLNCBuW8I4wSzUP+88Ndvolw6cEYEoJGUh0R2r+LW0aBKOz/gRFCh
	ot+N5Mo2HzLLpPbGUq0FmFVd002Y1HvH7+y2FTXIaav/NC63o8atERGA/1Q6/x1O
	iGu10zmCDP6Bzb9v2XEW0oYCBZuGfeGSvk0QjubYHRgMAIr/Y4drRUiE4YXUF4M1
	4Low+0vj26sjSXn+KanPdOQ3vnTMKoa0+SDdV44cshsLerxxL8/Dh4AOQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40q9errbpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 03:02:23 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 46V32MOB015255;
	Wed, 31 Jul 2024 03:02:22 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40q9errbpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 03:02:22 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46V1navi018928;
	Wed, 31 Jul 2024 03:02:21 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40nc7prxtq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 03:02:21 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46V32FSh40042786
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 31 Jul 2024 03:02:17 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B87E2004D;
	Wed, 31 Jul 2024 03:02:15 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F13120043;
	Wed, 31 Jul 2024 03:02:09 +0000 (GMT)
Received: from li-80eaad4c-2afd-11b2-a85c-af8123d033e3.ibm.com.com (unknown [9.43.68.49])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 31 Jul 2024 03:02:09 +0000 (GMT)
From: "Nysal Jan K.A." <nysal@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 1/2] cpu/SMT: Enable SMT only if a core is online
Date: Wed, 31 Jul 2024 08:31:12 +0530
Message-ID: <20240731030126.956210-2-nysal@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240731030126.956210-1-nysal@linux.ibm.com>
References: <20240731030126.956210-1-nysal@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oyx3NtoUPBi_b8wh_YPYpw34KjCGERzP
X-Proofpoint-ORIG-GUID: ZJsosXIEx8nsdNUBJdZ1WvhEEXg1OwB4
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-30_21,2024-07-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 spamscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407310019
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Peter Zijlstra <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, Laurent Dufour <ldufour@linux.ibm.com>, Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, "Nysal Jan K.A" <nysal@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Nysal Jan K.A" <nysal@linux.ibm.com>

If a core is offline then enabling SMT should not online CPUs of
this core. By enabling SMT, what is intended is either changing the SMT
value from "off" to "on" or setting the SMT level (threads per core) from a
lower to higher value.

On PowerPC the ppc64_cpu utility can be used, among other things, to
perform the following functions:

ppc64_cpu --cores-on                # Get the number of online cores
ppc64_cpu --cores-on=X              # Put exactly X cores online
ppc64_cpu --offline-cores=X[,Y,...] # Put specified cores offline
ppc64_cpu --smt={on|off|value}      # Enable, disable or change SMT level

If the user has decided to offline certain cores, enabling SMT should
not online CPUs in those cores. This patch fixes the issue and changes
the behaviour as described, by introducing an arch specific function
topology_is_core_online(). It is currently implemented only for PowerPC.

Fixes: 73c58e7e1412 ("powerpc: Add HOTPLUG_SMT support")
Reported-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Closes: https://groups.google.com/g/powerpc-utils-devel/c/wrwVzAAnRlI/m/5KJSoqP4BAAJ
Signed-off-by: Nysal Jan K.A <nysal@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-devices-system-cpu |  3 ++-
 kernel/cpu.c                                       | 12 +++++++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 325873385b71..de725ca3be82 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -562,7 +562,8 @@ Description:	Control Symmetric Multi Threading (SMT)
 			 ================ =========================================
 
 			 If control status is "forceoff" or "notsupported" writes
-			 are rejected.
+			 are rejected. Note that enabling SMT on PowerPC skips
+			 offline cores.
 
 What:		/sys/devices/system/cpu/cpuX/power/energy_perf_bias
 Date:		March 2019
diff --git a/kernel/cpu.c b/kernel/cpu.c
index 1209ddaec026..b1fd2a3db91a 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2689,6 +2689,16 @@ int cpuhp_smt_disable(enum cpuhp_smt_control ctrlval)
 	return ret;
 }
 
+/**
+ * Check if the core a CPU belongs to is online
+ */
+#if !defined(topology_is_core_online)
+static inline bool topology_is_core_online(unsigned int cpu)
+{
+	return true;
+}
+#endif
+
 int cpuhp_smt_enable(void)
 {
 	int cpu, ret = 0;
@@ -2699,7 +2709,7 @@ int cpuhp_smt_enable(void)
 		/* Skip online CPUs and CPUs on offline nodes */
 		if (cpu_online(cpu) || !node_online(cpu_to_node(cpu)))
 			continue;
-		if (!cpu_smt_thread_allowed(cpu))
+		if (!cpu_smt_thread_allowed(cpu) || !topology_is_core_online(cpu))
 			continue;
 		ret = _cpu_up(cpu, 0, CPUHP_ONLINE);
 		if (ret)
-- 
2.35.3

