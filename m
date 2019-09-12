Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98EDCB0D1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 12:44:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Tb4338dTzF4LM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 20:44:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ego@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46TZtZ4bqzzF3WB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 20:36:03 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8CAX2We026048; Thu, 12 Sep 2019 06:35:55 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uym8prbx7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 06:35:54 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x8CAXQgI027988;
 Thu, 12 Sep 2019 06:35:54 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uym8prbwu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 06:35:54 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8CAU7n1025637;
 Thu, 12 Sep 2019 10:35:53 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 2uv467wfh6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 12 Sep 2019 10:35:53 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8CAZqOg43057540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 12 Sep 2019 10:35:52 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D58F112066;
 Thu, 12 Sep 2019 10:35:52 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EE23112061;
 Thu, 12 Sep 2019 10:35:52 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.237])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 12 Sep 2019 10:35:52 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 01C892E47C1; Thu, 12 Sep 2019 16:05:51 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH 1/2] pseries/hotplug-cpu: Change default behaviour of
 cede_offline to "off"
Date: Thu, 12 Sep 2019 16:05:40 +0530
Message-Id: <1568284541-15169-2-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1568284541-15169-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1568284541-15169-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-12_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909120112
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
Cc: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Kamalesh Babulal <kamaleshb@in.ibm.com>, linux-kernel@vger.kernel.org,
 "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>

Currently on Pseries Linux Guests, the offlined CPU can be put to one
of the following two states:
   - Long term processor cede (also called extended cede)
   - Returned to the Hypervisor via RTAS "stop-self" call.

This is controlled by the kernel boot parameter "cede_offline=on/off".

By default the offlined CPUs enter extended cede. The PHYP hypervisor
considers CPUs in extended cede to be "active" since they are still
under the control fo the Linux Guests. Hence, when we change the SMT
modes by offlining the secondary CPUs, the PURR and the RWMR SPRs will
continue to count the values for offlined CPUs in extended cede as if
they are online. This breaks the accounting in tools such as lparstat.

To fix this, ensure that by default the offlined CPUs are returned to
the Hypervisor via RTAS "stop-self" call by changing the default value
of "cede_offline_enabled" to false.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 Documentation/core-api/cpu_hotplug.rst       |  2 +-
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index 4a50ab7..5319593 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -53,7 +53,7 @@ Command Line Switches
 ``cede_offline={"off","on"}``
   Use this option to disable/enable putting offlined processors to an extended
   ``H_CEDE`` state on supported pseries platforms. If nothing is specified,
-  ``cede_offline`` is set to "on".
+  ``cede_offline`` is set to "off".
 
   This option is limited to the PowerPC architecture.
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index bbda646..f9d0366 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -46,7 +46,17 @@ static DEFINE_PER_CPU(enum cpu_state_vals, preferred_offline_state) =
 
 static enum cpu_state_vals default_offline_state = CPU_STATE_OFFLINE;
 
-static bool cede_offline_enabled __read_mostly = true;
+/*
+ * Determines whether the offlined CPUs should be put to a long term
+ * processor cede (called extended cede) for power-saving
+ * purposes. The CPUs in extended cede are still with the Linux Guest
+ * and are not returned to the Hypervisor.
+ *
+ * By default, the offlined CPUs are returned to the hypervisor via
+ * RTAS "stop-self". This behaviour can be changed by passing the
+ * kernel commandline parameter "cede_offline=on".
+ */
+static bool cede_offline_enabled __read_mostly;
 
 /*
  * Enable/disable cede_offline when available.
-- 
1.9.4

