Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A485921F428
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 16:33:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5jgZ69b2zDqRk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 00:33:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=huawei.com;
 envelope-from=weiyongjun1@huawei.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5jZq5YFSzDqNL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 00:29:36 +1000 (AEST)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 51AE2774C1BD5835F576;
 Tue, 14 Jul 2020 22:14:02 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Tue, 14 Jul 2020 22:13:52 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Viresh Kumar <viresh.kumar@linaro.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH -next] cpufreq: powernv: Make some symbols static
Date: Tue, 14 Jul 2020 22:23:55 +0800
Message-ID: <20200714142355.29819-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
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
Cc: linuxppc-dev@lists.ozlabs.org, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The sparse tool complains as follows:

drivers/cpufreq/powernv-cpufreq.c:88:1: warning:
 symbol 'pstate_revmap' was not declared. Should it be static?
drivers/cpufreq/powernv-cpufreq.c:383:18: warning:
 symbol 'cpufreq_freq_attr_cpuinfo_nominal_freq' was not declared. Should it be static?
drivers/cpufreq/powernv-cpufreq.c:669:6: warning:
 symbol 'gpstate_timer_handler' was not declared. Should it be static?
drivers/cpufreq/powernv-cpufreq.c:902:6: warning:
 symbol 'powernv_cpufreq_work_fn' was not declared. Should it be static?

Those symbols are not used outside of this file, so mark
them static.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/cpufreq/powernv-cpufreq.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 8646eb197cd9..cf118263ec65 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -85,7 +85,7 @@ struct global_pstate_info {
 
 static struct cpufreq_frequency_table powernv_freqs[POWERNV_MAX_PSTATES+1];
 
-DEFINE_HASHTABLE(pstate_revmap, POWERNV_MAX_PSTATES_ORDER);
+static DEFINE_HASHTABLE(pstate_revmap, POWERNV_MAX_PSTATES_ORDER);
 /**
  * struct pstate_idx_revmap_data: Entry in the hashmap pstate_revmap
  *				  indexed by a function of pstate id.
@@ -380,7 +380,7 @@ static ssize_t cpuinfo_nominal_freq_show(struct cpufreq_policy *policy,
 		powernv_freqs[powernv_pstate_info.nominal].frequency);
 }
 
-struct freq_attr cpufreq_freq_attr_cpuinfo_nominal_freq =
+static struct freq_attr cpufreq_freq_attr_cpuinfo_nominal_freq =
 	__ATTR_RO(cpuinfo_nominal_freq);
 
 #define SCALING_BOOST_FREQS_ATTR_INDEX		2
@@ -666,7 +666,7 @@ static inline void  queue_gpstate_timer(struct global_pstate_info *gpstates)
  * according quadratic equation. Queues a new timer if it is still not equal
  * to local pstate
  */
-void gpstate_timer_handler(struct timer_list *t)
+static void gpstate_timer_handler(struct timer_list *t)
 {
 	struct global_pstate_info *gpstates = from_timer(gpstates, t, timer);
 	struct cpufreq_policy *policy = gpstates->policy;
@@ -899,7 +899,7 @@ static struct notifier_block powernv_cpufreq_reboot_nb = {
 	.notifier_call = powernv_cpufreq_reboot_notifier,
 };
 
-void powernv_cpufreq_work_fn(struct work_struct *work)
+static void powernv_cpufreq_work_fn(struct work_struct *work)
 {
 	struct chip *chip = container_of(work, struct chip, throttle);
 	struct cpufreq_policy *policy;

