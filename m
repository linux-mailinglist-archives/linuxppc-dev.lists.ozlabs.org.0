Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9019F10AF8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 13:28:48 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NKnT3rVtzDqsK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 23:28:45 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NKBN4Lp1zDqsC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 23:01:48 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARBqHYq087518; Wed, 27 Nov 2019 07:01:40 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2whhyfeu7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 07:01:40 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xARC07Qx021008;
 Wed, 27 Nov 2019 12:01:39 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 2wevd6wfer-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 27 Nov 2019 12:01:39 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xARC1bwS46530910
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 12:01:37 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB43FAE066;
 Wed, 27 Nov 2019 12:01:37 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BB6DAE06A;
 Wed, 27 Nov 2019 12:01:37 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.124.35.209])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 12:01:37 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 84CFF2E2F8D; Wed, 27 Nov 2019 17:31:35 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH 2/3] powerpc/sysfs: Show idle_purr and idle_spurr for every CPU
Date: Wed, 27 Nov 2019 17:31:11 +0530
Message-Id: <1574856072-30972-3-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1574856072-30972-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_02:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 phishscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270104
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

On Pseries LPARs, to calculate utilization, we need to know the
[S]PURR ticks when the CPUs were busy or idle.

The total PURR and SPURR ticks are already exposed via the per-cpu
sysfs files /sys/devices/system/cpu/cpuX/purr and
/sys/devices/system/cpu/cpuX/spurr.

This patch adds support for exposing the idle PURR and SPURR ticks via
/sys/devices/system/cpu/cpuX/idle_purr and
/sys/devices/system/cpu/cpuX/idle_spurr.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/sysfs.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 80a676d..42ade55 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -1044,6 +1044,36 @@ static ssize_t show_physical_id(struct device *dev,
 }
 static DEVICE_ATTR(physical_id, 0444, show_physical_id, NULL);
 
+static ssize_t idle_purr_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+	unsigned int cpuid = cpu->dev.id;
+	struct lppaca *cpu_lppaca_ptr = paca_ptrs[cpuid]->lppaca_ptr;
+	u64 idle_purr_cycles = be64_to_cpu(cpu_lppaca_ptr->wait_state_cycles);
+
+	return sprintf(buf, "%llx\n", idle_purr_cycles);
+}
+static DEVICE_ATTR_RO(idle_purr);
+
+DECLARE_PER_CPU(u64, idle_spurr_cycles);
+static ssize_t idle_spurr_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+	unsigned int cpuid = cpu->dev.id;
+	u64 *idle_spurr_cycles_ptr = per_cpu_ptr(&idle_spurr_cycles, cpuid);
+
+	return sprintf(buf, "%llx\n", *idle_spurr_cycles_ptr);
+}
+static DEVICE_ATTR_RO(idle_spurr);
+
+static void create_idle_purr_spurr_sysfs_entry(struct device *cpudev)
+{
+	device_create_file(cpudev, &dev_attr_idle_purr);
+	device_create_file(cpudev, &dev_attr_idle_spurr);
+}
+
 static int __init topology_init(void)
 {
 	int cpu, r;
@@ -1067,6 +1097,8 @@ static int __init topology_init(void)
 			register_cpu(c, cpu);
 
 			device_create_file(&c->dev, &dev_attr_physical_id);
+			if (firmware_has_feature(FW_FEATURE_SPLPAR))
+				create_idle_purr_spurr_sysfs_entry(&c->dev);
 		}
 	}
 	r = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "powerpc/topology:online",
-- 
1.9.4

