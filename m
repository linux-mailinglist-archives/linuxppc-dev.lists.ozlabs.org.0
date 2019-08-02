Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 263CB80110
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 21:37:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460crY304wzDr7L
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2019 05:37:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 460cg33TVYzDrCM
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2019 05:29:35 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x72JRbSY100416
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Aug 2019 15:29:31 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u4sm343vk-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Aug 2019 15:29:31 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Fri, 2 Aug 2019 20:29:30 +0100
Received: from b01cxnp23033.gho.pok.ibm.com (9.57.198.28)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 2 Aug 2019 20:29:28 +0100
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x72JTRUj50397548
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 2 Aug 2019 19:29:27 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B41CF124058
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 19:29:27 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90C0D124053
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 19:29:27 +0000 (GMT)
Received: from localhost (unknown [9.80.205.161])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 19:29:27 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/3] powerpc/rtas: use device model APIs and serialization
 during LPM
Date: Fri,  2 Aug 2019 14:29:24 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190802192926.19277-1-nathanl@linux.ibm.com>
References: <20190802192926.19277-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19080219-0072-0000-0000-000004500F0C
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011539; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01241144; UDB=6.00654544; IPR=6.01022576; 
 MB=3.00028013; MTD=3.00000008; XFM=3.00000015; UTC=2019-08-02 19:29:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19080219-0073-0000-0000-00004CC10F40
Message-Id: <20190802192926.19277-2-nathanl@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-02_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908020205
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

The LPAR migration implementation and userspace-initiated cpu hotplug
can interleave their executions like so:

1. Set cpu 7 offline via sysfs.

2. Begin a partition migration, whose implementation requires the OS
   to ensure all present cpus are online; cpu 7 is onlined:

     rtas_ibm_suspend_me -> rtas_online_cpus_mask -> cpu_up

   This sets cpu 7 online in all respects except for the cpu's
   corresponding struct device; dev->offline remains true.

3. Set cpu 7 online via sysfs. _cpu_up() determines that cpu 7 is
   already online and returns success. The driver core (device_online)
   sets dev->offline = false.

4. The migration completes and restores cpu 7 to offline state:

     rtas_ibm_suspend_me -> rtas_offline_cpus_mask -> cpu_down

This leaves cpu7 in a state where the driver core considers the cpu
device online, but in all other respects it is offline and
unused. Attempts to online the cpu via sysfs appear to succeed but the
driver core actually does not pass the request to the lower-level
cpuhp support code. This makes the cpu unusable until the cpu device
is manually set offline and then online again via sysfs.

Instead of directly calling cpu_up/cpu_down, the migration code should
use the higher-level device core APIs to maintain consistent state and
serialize operations.

Fixes: 120496ac2d2d ("powerpc: Bring all threads online prior to migration/hibernation")
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 5faf0a64c92b..05824eb4323b 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -871,15 +871,17 @@ static int rtas_cpu_state_change_mask(enum rtas_cpu_state state,
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
@@ -968,6 +970,8 @@ int rtas_ibm_suspend_me(u64 handle)
 	data.token = rtas_token("ibm,suspend-me");
 	data.complete = &done;
 
+	lock_device_hotplug();
+
 	/* All present CPUs must be online */
 	cpumask_andnot(offline_mask, cpu_present_mask, cpu_online_mask);
 	cpuret = rtas_online_cpus_mask(offline_mask);
@@ -1006,6 +1010,7 @@ int rtas_ibm_suspend_me(u64 handle)
 				__func__);
 
 out:
+	unlock_device_hotplug();
 	free_cpumask_var(offline_mask);
 	return atomic_read(&data.error);
 }
-- 
2.20.1

