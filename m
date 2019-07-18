Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C0936D4D0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 21:35:29 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qPVk5D5yzDqdj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 05:35:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qPNF3lvjzDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 05:29:49 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6IJQrqB002959
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:29:45 -0400
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttvupd0tb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:29:44 -0400
Received: from localhost
 by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Thu, 18 Jul 2019 20:29:43 +0100
Received: from b01cxnp23034.gho.pok.ibm.com (9.57.198.29)
 by e12.ny.us.ibm.com (146.89.104.199) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 18 Jul 2019 20:29:42 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6IJTfS347972608
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 19:29:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7051CAC059
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 19:29:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 55966AC05B
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 19:29:41 +0000 (GMT)
Received: from localhost (unknown [9.41.179.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 19:29:41 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] powerpc/rtas: use device model APIs and serialization
 during LPM
Date: Thu, 18 Jul 2019 14:29:39 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190718192940.16103-1-nathanl@linux.ibm.com>
References: <20190718192940.16103-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19071819-0060-0000-0000-00000362D8AE
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011453; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01234057; UDB=6.00650298; IPR=6.01015385; 
 MB=3.00027783; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-18 19:29:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071819-0061-0000-0000-00004A3445EF
Message-Id: <20190718192940.16103-2-nathanl@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180199
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

During LPAR migration, cpu hotplug and migration operations can
interleave like so:

cd /sys/devices/system/cpu/cpu7/ | drmgr -m -c pmig -p pre \
echo 0 > online                  | -s 0xd7a884f83d830e6d -t 19 \
echo 1 > online                  | -n -d 1 5
---------------------------------+-------------------------------------------
online_store() {                 |
  device_offline() {             |
    cpu_subsys_offline() {       |
      cpu_down(7);               |
    }                            |
    dev->offline = true;         |
  }                              | migration_store() {
}                                |   rtas_ibm_suspend_me() {
                                 |     rtas_online_cpus_mask() {
                                 |       cpu_up(7);
				 |     }
                                 |     cpu_hotplug_disable();
                                 |     on_each_cpu(rtas_percpu_suspend_me());
                                 |     cpu_hotplug_enable();
online_store() {                 |
  device_online() {              |
    cpu_subsys_online() {        |
      cpu_up(7);                 |
    }                            |
    dev->offline = false;        |
  }                              |     rtas_offline_cpus_mask() {
}                                |       rtas_cpu_state_change_mask() {
                                 |         cpu_down(7);
				 |       }
				 |     }
				 |   }
				 | }

This leaves cpu7 in a state where the driver core considers the cpu
device online, but in all other respects it is offline and
unused. Attempts to online the cpu via sysfs appear to succeed but the
driver core actually does not pass the request to the lower-level
cpuhp support code. This makes the cpu unusable until the system is
rebooted.

Instead of directly calling cpu_up/cpu_down, the migration code should
use the higher-level device core APIs to maintain consistent state and
serialize operations.

Fixes: 120496ac2d2d ("powerpc: Bring all threads online prior to migration/hibernation")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 9b4d2a2ffb4f..fbefd9ff6dab 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -875,15 +875,17 @@ static int rtas_cpu_state_change_mask(enum rtas_cpu_state state,
 		return 0;
 
 	for_each_cpu(cpu, cpus) {
+		struct device *dev = get_cpu_device(cpu);
+
 		switch (state) {
 		case DOWN:
-			cpuret = cpu_down(cpu);
+			cpuret = device_offline(dev);
 			break;
 		case UP:
-			cpuret = cpu_up(cpu);
+			cpuret = device_online(dev);
 			break;
 		}
-		if (cpuret) {
+		if (cpuret < 0) {
 			pr_debug("%s: cpu_%s for cpu#%d returned %d.\n",
 					__func__,
 					((state == UP) ? "up" : "down"),
@@ -972,6 +974,8 @@ int rtas_ibm_suspend_me(u64 handle)
 	data.token = rtas_token("ibm,suspend-me");
 	data.complete = &done;
 
+	lock_device_hotplug();
+
 	/* All present CPUs must be online */
 	cpumask_andnot(offline_mask, cpu_present_mask, cpu_online_mask);
 	cpuret = rtas_online_cpus_mask(offline_mask);
@@ -1011,6 +1015,7 @@ int rtas_ibm_suspend_me(u64 handle)
 				__func__);
 
 out:
+	unlock_device_hotplug();
 	free_cpumask_var(offline_mask);
 	return atomic_read(&data.error);
 }
-- 
2.20.1

