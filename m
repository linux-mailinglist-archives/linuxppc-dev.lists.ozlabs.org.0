Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC81181543
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 10:48:20 +0100 (CET)
Received: from lists.ozlabs.org (unknown [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48cnFs2TdnzDsN1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Mar 2020 20:48:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48cn233md8zDq9T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Mar 2020 20:38:03 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02B9TE5u089093; Wed, 11 Mar 2020 05:37:55 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ypw1s9u20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 05:37:55 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02B9Z8KC026658;
 Wed, 11 Mar 2020 09:37:55 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma03dal.us.ibm.com with ESMTP id 2ypjxrvqhm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 11 Mar 2020 09:37:54 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02B9brEA50528718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 09:37:53 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A40426E056;
 Wed, 11 Mar 2020 09:37:53 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1252C6E04E;
 Wed, 11 Mar 2020 09:37:53 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.122.202])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 11 Mar 2020 09:37:53 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 167922E3ABE; Wed, 11 Mar 2020 15:07:48 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v3 6/6] pseries/sysfs: Minimise IPI noise while reading
 [idle_][s]purr
Date: Wed, 11 Mar 2020 15:07:41 +0530
Message-Id: <1583919461-27405-7-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1583919461-27405-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1583919461-27405-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_02:2020-03-10,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 phishscore=0 adultscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110061
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

Currently purr, spurr, idle_purr, idle_spurr are exposed for every CPU
via the sysfs interface
/sys/devices/system/cpu/cpuX/[idle_][s]purr. Each sysfs read currently
generates an IPI to obtain the desired value from the target CPU X.
Since these aforementioned sysfs files are typically read one after
another, we end up generating 4 IPIs per CPU in a short duration.

In order to minimize the IPI noise, this patch caches the values of
all the four entities whenever one of them is read. If subsequently
any of these are read within the next 10ms, the cached value is
returned. With this, we will generate at most one IPI every 10ms for
every CPU.

Test-results: While reading the four sysfs files back-to-back for a
given CPU every second for 100 seconds.

Without the patch:
		 16 [XICS 2 Edge IPI] = 422 times
		 DBL [Doorbell interrupts] = 13 times
		 Total : 435 IPIs.

With the patch:
		  16 [XICS 2 Edge IPI] = 111 times
		  DBL [Doorbell interrupts] = 17 times
		  Total : 128 IPIs.

Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
---
 arch/powerpc/kernel/sysfs.c | 109 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 90 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index c9ddb83..db8fc90 100644
--- a/arch/powerpc/kernel/sysfs.c
+++ b/arch/powerpc/kernel/sysfs.c
@@ -586,8 +586,6 @@ void ppc_enable_pmcs(void)
  * SPRs which are not related to PMU.
  */
 #ifdef CONFIG_PPC64
-SYSFS_SPRSETUP(purr, SPRN_PURR);
-SYSFS_SPRSETUP(spurr, SPRN_SPURR);
 SYSFS_SPRSETUP(pir, SPRN_PIR);
 SYSFS_SPRSETUP(tscr, SPRN_TSCR);
 
@@ -596,8 +594,6 @@ void ppc_enable_pmcs(void)
   enable write when needed with a separate function.
   Lets be conservative and default to pseries.
 */
-static DEVICE_ATTR(spurr, 0400, show_spurr, NULL);
-static DEVICE_ATTR(purr, 0400, show_purr, store_purr);
 static DEVICE_ATTR(pir, 0400, show_pir, NULL);
 static DEVICE_ATTR(tscr, 0600, show_tscr, store_tscr);
 #endif /* CONFIG_PPC64 */
@@ -761,39 +757,114 @@ static void create_svm_file(void)
 }
 #endif /* CONFIG_PPC_SVM */
 
-static void read_idle_purr(void *val)
+/*
+ * The duration (in ms) from the last IPI to the target CPU until
+ * which a cached value of purr, spurr, idle_purr, idle_spurr can be
+ * reported to the user on a corresponding sysfs file read. Beyond
+ * this duration, fresh values need to be obtained by sending IPIs to
+ * the target CPU when the sysfs files are read.
+ */
+static unsigned long util_stats_staleness_tolerance_ms = 10;
+struct util_acct_stats {
+	u64 latest_purr;
+	u64 latest_spurr;
+	u64 latest_idle_purr;
+	u64 latest_idle_spurr;
+	unsigned long last_update_jiffies;
+};
+
+DEFINE_PER_CPU(struct util_acct_stats, util_acct_stats);
+
+static void update_util_acct_stats(void *ptr)
 {
-	u64 *ret = val;
+	struct util_acct_stats *stats = ptr;
 
-	*ret = read_this_idle_purr();
+	stats->latest_purr = mfspr(SPRN_PURR);
+	stats->latest_spurr = mfspr(SPRN_SPURR);
+	stats->latest_idle_purr = read_this_idle_purr();
+	stats->latest_idle_spurr = read_this_idle_spurr();
+	stats->last_update_jiffies = jiffies;
 }
 
-static ssize_t idle_purr_show(struct device *dev,
-			      struct device_attribute *attr, char *buf)
+struct util_acct_stats *get_util_stats_ptr(int cpu)
+{
+	struct util_acct_stats *stats = per_cpu_ptr(&util_acct_stats, cpu);
+	unsigned long delta_jiffies;
+
+	delta_jiffies = jiffies - stats->last_update_jiffies;
+
+	/*
+	 * If we have a recent enough data, reuse that instead of
+	 * sending an IPI.
+	 */
+	if (jiffies_to_msecs(delta_jiffies) < util_stats_staleness_tolerance_ms)
+		return stats;
+
+	smp_call_function_single(cpu, update_util_acct_stats, stats, 1);
+	return stats;
+}
+
+static ssize_t show_purr(struct device *dev,
+			 struct device_attribute *attr, char *buf)
 {
 	struct cpu *cpu = container_of(dev, struct cpu, dev);
-	u64 val;
+	struct util_acct_stats *stats;
 
-	smp_call_function_single(cpu->dev.id, read_idle_purr, &val, 1);
-	return sprintf(buf, "%llx\n", val);
+	stats = get_util_stats_ptr(cpu->dev.id);
+	return sprintf(buf, "%llx\n", stats->latest_purr);
 }
-static DEVICE_ATTR(idle_purr, 0400, idle_purr_show, NULL);
 
-static void read_idle_spurr(void *val)
+static void write_purr(void *val)
 {
-	u64 *ret = val;
+	mtspr(SPRN_PURR, *(unsigned long *)val);
+}
 
-	*ret = read_this_idle_spurr();
+static ssize_t __used store_purr(struct device *dev,
+				 struct device_attribute *attr,
+				 const char *buf, size_t count)
+{
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+	unsigned long val;
+	int ret = kstrtoul(buf, 16, &val);
+
+	if (ret != 0)
+		return -EINVAL;
+
+	smp_call_function_single(cpu->dev.id, write_purr, &val, 1);
+	return count;
+}
+static DEVICE_ATTR(purr, 0400, show_purr, store_purr);
+
+static ssize_t show_spurr(struct device *dev,
+			  struct device_attribute *attr, char *buf)
+{
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+	struct util_acct_stats *stats;
+
+	stats = get_util_stats_ptr(cpu->dev.id);
+	return sprintf(buf, "%llx\n", stats->latest_spurr);
 }
+static DEVICE_ATTR(spurr, 0400, show_spurr, NULL);
+
+static ssize_t idle_purr_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+	struct util_acct_stats *stats;
+
+	stats = get_util_stats_ptr(cpu->dev.id);
+	return sprintf(buf, "%llx\n", stats->latest_idle_purr);
+}
+static DEVICE_ATTR(idle_purr, 0400, idle_purr_show, NULL);
 
 static ssize_t idle_spurr_show(struct device *dev,
 			       struct device_attribute *attr, char *buf)
 {
 	struct cpu *cpu = container_of(dev, struct cpu, dev);
-	u64 val;
+	struct util_acct_stats *stats;
 
-	smp_call_function_single(cpu->dev.id, read_idle_spurr, &val, 1);
-	return sprintf(buf, "%llx\n", val);
+	stats =  get_util_stats_ptr(cpu->dev.id);
+	return sprintf(buf, "%llx\n", stats->latest_idle_spurr);
 }
 static DEVICE_ATTR(idle_spurr, 0400, idle_spurr_show, NULL);
 
-- 
1.9.4

