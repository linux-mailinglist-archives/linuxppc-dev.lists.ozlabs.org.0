Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A54A186F61
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:53:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h1703bBfzDqH4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:53:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gyYg3TGpzDqDY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 00:57:55 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02GDu6uS163550
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 09:57:53 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yt9pharmu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 09:57:52 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <psampat@linux.ibm.com>;
 Mon, 16 Mar 2020 13:57:49 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 16 Mar 2020 13:57:46 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02GDvjDu15532088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 16 Mar 2020 13:57:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9FC52A405B;
 Mon, 16 Mar 2020 13:57:45 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07F41A4060;
 Mon, 16 Mar 2020 13:57:44 +0000 (GMT)
Received: from pratiks-thinkpad.ibmuc.com (unknown [9.85.92.169])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 16 Mar 2020 13:57:43 +0000 (GMT)
From: Pratik Rajesh Sampat <psampat@linux.ibm.com>
To: linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, psampat@linux.ibm.com,
 pratik.r.sampat@gmail.com, ego@linux.vnet.ibm.com, dja@axtens.net
Subject: [PATCH] cpufreq: powernv: Fix frame-size-overflow in
 powernv_cpufreq_work_fn
Date: Mon, 16 Mar 2020 19:27:43 +0530
X-Mailer: git-send-email 2.24.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031613-0008-0000-0000-0000035E25A7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031613-0009-0000-0000-00004A7F790A
Message-Id: <20200316135743.57735-1-psampat@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-16_03:2020-03-12,
 2020-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003160065
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

The patch avoids allocating cpufreq_policy on stack hence fixing frame
size overflow in 'powernv_cpufreq_work_fn'

Fixes: 227942809b52 ("cpufreq: powernv: Restore cpu frequency to policy->cur on unthrottling")
Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
---
 drivers/cpufreq/powernv-cpufreq.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
index 56f4bc0d209e..20ee0661555a 100644
--- a/drivers/cpufreq/powernv-cpufreq.c
+++ b/drivers/cpufreq/powernv-cpufreq.c
@@ -902,6 +902,7 @@ static struct notifier_block powernv_cpufreq_reboot_nb = {
 void powernv_cpufreq_work_fn(struct work_struct *work)
 {
 	struct chip *chip = container_of(work, struct chip, throttle);
+	struct cpufreq_policy *policy;
 	unsigned int cpu;
 	cpumask_t mask;
 
@@ -916,12 +917,14 @@ void powernv_cpufreq_work_fn(struct work_struct *work)
 	chip->restore = false;
 	for_each_cpu(cpu, &mask) {
 		int index;
-		struct cpufreq_policy policy;
 
-		cpufreq_get_policy(&policy, cpu);
-		index = cpufreq_table_find_index_c(&policy, policy.cur);
-		powernv_cpufreq_target_index(&policy, index);
-		cpumask_andnot(&mask, &mask, policy.cpus);
+		policy = cpufreq_cpu_get(cpu);
+		if (!policy)
+			continue;
+		index = cpufreq_table_find_index_c(policy, policy->cur);
+		powernv_cpufreq_target_index(policy, index);
+		cpumask_andnot(&mask, &mask, policy->cpus);
+		cpufreq_cpu_put(policy);
 	}
 out:
 	put_online_cpus();
-- 
2.24.1

