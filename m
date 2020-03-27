Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD39E195692
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 12:49:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pgBn1dZ6zDr7q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 22:49:53 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pfqK56nFzDr7D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 22:33:01 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02RB7DLk015793; Fri, 27 Mar 2020 07:32:56 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ywe7x1fxt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 07:32:56 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02RBVSgV006135;
 Fri, 27 Mar 2020 11:32:55 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma02dal.us.ibm.com with ESMTP id 2ywaw2x8qm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 27 Mar 2020 11:32:55 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02RBWt1K50856434
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 27 Mar 2020 11:32:55 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C538124052;
 Fri, 27 Mar 2020 11:32:55 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CE4F124055;
 Fri, 27 Mar 2020 11:32:54 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.72.108])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 27 Mar 2020 11:32:54 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 317932E3B0A; Fri, 27 Mar 2020 17:02:45 +0530 (IST)
From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v4 6/6] pseries/sysfs: Minimise IPI noise while reading
 [idle_][s]purr
Date: Fri, 27 Mar 2020 17:02:40 +0530
Message-Id: <1585308760-28792-7-git-send-email-ego@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
References: <1585308760-28792-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-27_03:2020-03-27,
 2020-03-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 bulkscore=0 phishscore=0 spamscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003270097
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
Since these aforementioned sysfs are typically read one after another,
we end up generating 4 IPIs per CPU in a short duration.

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
 arch/powerpc/kernel/sysfs.c | 117 ++++++++++++++++++++++++++++++++++++--------
 1 file changed, 97 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/kernel/sysfs.c b/arch/powerpc/kernel/sysfs.c
index 571b325..bd92023 100644
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
@@ -761,22 +757,110 @@ static void create_svm_file(void)
 }
 #endif /* CONFIG_PPC_SVM */
 
+#ifdef CONFIG_PPC64
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
+#ifdef CONFIG_PPC_PSERIES
+	u64 latest_idle_purr;
+	u64 latest_idle_spurr;
+#endif
+	unsigned long last_update_jiffies;
+};
+
+DEFINE_PER_CPU(struct util_acct_stats, util_acct_stats);
+
+static void update_util_acct_stats(void *ptr)
+{
+	struct util_acct_stats *stats = ptr;
+
+	stats->latest_purr = mfspr(SPRN_PURR);
+	stats->latest_spurr = mfspr(SPRN_SPURR);
 #ifdef CONFIG_PPC_PSERIES
-static void read_idle_purr(void *val)
+	stats->latest_idle_purr = read_this_idle_purr();
+	stats->latest_idle_spurr = read_this_idle_spurr();
+#endif
+	stats->last_update_jiffies = jiffies;
+}
+
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
-	u64 *ret = val;
+	struct cpu *cpu = container_of(dev, struct cpu, dev);
+	struct util_acct_stats *stats;
 
-	*ret = read_this_idle_purr();
+	stats = get_util_stats_ptr(cpu->dev.id);
+	return sprintf(buf, "%llx\n", stats->latest_purr);
 }
 
+static void write_purr(void *val)
+{
+	mtspr(SPRN_PURR, *(unsigned long *)val);
+}
+
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
+}
+static DEVICE_ATTR(spurr, 0400, show_spurr, NULL);
+#endif /* CONFIG_PPC64 */
+
+#ifdef CONFIG_PPC_PSERIES
 static ssize_t idle_purr_show(struct device *dev,
 			      struct device_attribute *attr, char *buf)
 {
 	struct cpu *cpu = container_of(dev, struct cpu, dev);
-	u64 val;
+	struct util_acct_stats *stats;
 
-	smp_call_function_single(cpu->dev.id, read_idle_purr, &val, 1);
-	return sprintf(buf, "%llx\n", val);
+	stats = get_util_stats_ptr(cpu->dev.id);
+	return sprintf(buf, "%llx\n", stats->latest_idle_purr);
 }
 static DEVICE_ATTR(idle_purr, 0400, idle_purr_show, NULL);
 
@@ -792,21 +876,14 @@ static void remove_idle_purr_file(struct device *s)
 		device_remove_file(s, &dev_attr_idle_purr);
 }
 
-static void read_idle_spurr(void *val)
-{
-	u64 *ret = val;
-
-	*ret = read_this_idle_spurr();
-}
-
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

