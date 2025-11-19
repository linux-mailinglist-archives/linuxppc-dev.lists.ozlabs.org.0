Return-Path: <linuxppc-dev+bounces-14327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0E0C6CE78
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:23:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBHQ1NqVz3cnK;
	Wed, 19 Nov 2025 17:22:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533378;
	cv=none; b=jd7W2ATCKpdZfg+RTyQCbEurNQ8gS3HXhJBq3C2NTyZPtNKj/Nq/b2s2hQOYv8EkrvKgEjuLdCWg310VKgTtdaajYo01C1HlvzBZ6UDCzdn2/XCLPIOPMAfSW0FvRjEUv8IyARJWfeDGoLWTRattdg+qqXz0xZ3ygStn25kAjJJVBJ+/AsXOXY2EqSdbOKc61het7Wyk+BMaED3brF4vxQgyt9Kg6vE6X69YfTAxxyq76uGqDLHp+0qRrFf35tvYZrQQSF9StxSd/tpq5yI6/iqM8TbT6UHb5anVEm1bN+ibidJw8TcKw8ijBWQXZ59znf8nLnqNZYKHn9+QyJ3SAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533378; c=relaxed/relaxed;
	bh=AmpKMuL3w7icau4MKINf+cSEFiv6NLC2GZgmKjHG7h8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B7eVtx2x2cUFkqcK55io5Zgsic3xZC+Tnq4KibJkuu6C/2dDN+oEtr0Fz/J8Mv0Oq/2uxHPbQWPqzV/LYZV6JMymyaeIhhqBEAWO6FisvvzsAIZPDoX4UnrJHMOxZrkeJoo9cSlJSw9jm3Mn3px5GE0VOwtZKFXGX+y/2gG1j9FrexWoJAcJ3hRrCyOhveLsUrRBXPmVlO2D5RTKKks/lDS7qEzkAuq2H+W9Sp+MX6nfJyTrrRS8bmoFOSDF9le0KRbzkbkqrlLBVYmJd7UX9IXECiKEC3Bo5bNqNZsw65S3iU2xPp26QL1VEwRvuOoLjfBw7R2P/Cl5a91rE4tM+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o37QeSkZ; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o37QeSkZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBHP2mQ6z3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:57 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ5ZEh0017282;
	Wed, 19 Nov 2025 06:22:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=AmpKMuL3w7icau4MK
	INf+cSEFiv6NLC2GZgmKjHG7h8=; b=o37QeSkZMic2ZQKQ8Tz6zz8IDKWSnsE0F
	CM9LtXVmzFpYVoKfjqvokK0nAgQZ82zQkNcJSIsp8BejRvSX59xqQrpM9GvndwZT
	8esHTA5tmCRsIN9IlqVh/PSQd9/GLfJYog+rhVrpU5LMVvzmD+Wsybn4/3dyp/+6
	TfLk7nPVqSUFuKmoUijCjDagqAvH+jA25hq/u1Je5ouzK2E1ck+rmK1krilnYhy8
	BJoyHIqLtJhG3vINsjchlRcsarppn6lrWtltWkVTxxie3G9+I4LrqNfMwN2F0FnQ
	nsUumGvDwrEytmo99gX/eb9bSNWz+c4wlWXZVFzAwQ7zKKab52SRQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtx56p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:41 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6JRNU028691;
	Wed, 19 Nov 2025 06:22:40 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtx56m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:40 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ2lxZB030791;
	Wed, 19 Nov 2025 06:22:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47xy94n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:39 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6MaY249676648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:36 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E72FF2004D;
	Wed, 19 Nov 2025 06:22:35 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F47E20040;
	Wed, 19 Nov 2025 06:22:32 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:22:31 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 15/17] powerpc: add debugfs file for controlling handling on steal values
Date: Wed, 19 Nov 2025 11:50:58 +0530
Message-ID: <20251119062100.1112520-16-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119062100.1112520-1-sshegde@linux.ibm.com>
References: <20251119062100.1112520-1-sshegde@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NRNUqgjkv0GcbfqgAqz-QbJz39sCqPjH
X-Proofpoint-ORIG-GUID: -Vb2pUpvoiq2DrbIRBOkU-NUB7BTcK5R
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXzgw/ylopScYt
 X6NcsuUjliEN/PP4tm2QBiiBVvdiAbiYD8fCOeTykHK7HfHMkbNi+NBHQehishpG5kQ3I298yhY
 CU9m2p+sDFtLrTDr1/AihHKLcFIjsIrjysTzSCHa6xuYejD8qd1cVqmOUQvrseHoNwx9TJrax1E
 soN0zZHCGkKwTXF3BAuMT6aRA0zPRcs0A21m4VxuPZSzx37TwgrbvHG70pmJ3o/T8+pxCf8rjij
 qDO5j2PlN7n2TufKa17Vt0YarOuXuo7M6GHvmlN1RIV58WyJuNhe8Ed2xCdhvcOr2+n8ClOk1td
 HSkaKK5QtA3PR2y4BqKWjjDLz77AycP4MGyiQNaLU7w5c3yIZoIw+JYQQ7XLa5nr05ooVDewvjH
 sGHmDFwSmpElUodG+xH5i36tAEAHvA==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691d6231 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=KSc5eBifJ7cFlDAX9ZYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Since the low,high threshold for steal time can change based on the
system, make these values tunable.

Values are be to given as expected percentage value * 100. i.e one
wants say 8% of steal time is high, then should specify 800 as the high
threshold. Similar value computation holds true for low threshold.

Provide one more tunable to control how often steal time compution is
done. By default it is 1 second. If one thinks thats too aggressive can
increase it. Max value is 10 seconds since one should act relatively
fast based on steal values.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/lpar.c | 94 ++++++++++++++++++++++++---
 1 file changed, 86 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/lpar.c b/arch/powerpc/platforms/pseries/lpar.c
index c16d97e1a1fe..090e5c48243b 100644
--- a/arch/powerpc/platforms/pseries/lpar.c
+++ b/arch/powerpc/platforms/pseries/lpar.c
@@ -662,7 +662,8 @@ machine_device_initcall(pseries, vcpudispatch_stats_procfs_init);
 #ifdef CONFIG_PARAVIRT_TIME_ACCOUNTING
 
 #define STEAL_MULTIPLE 10000
-#define PURR_UPDATE_TB NSEC_PER_SEC
+static int steal_check_freq = 1;
+#define PURR_UPDATE_TB (steal_check_freq * NSEC_PER_SEC)
 
 static bool should_cpu_process_steal(int cpu)
 {
@@ -2106,9 +2107,6 @@ void pseries_init_ec_vp_cores(void)
 	available_cores = max(entitled_cores, virtual_procs);
 }
 
-#define STEAL_RATIO_HIGH 400
-#define STEAL_RATIO_LOW  150
-
 /*
  * [0]<----------->[EC]---->{AC}-->[VP]
  * EC == Entitled Cores. Guaranteed number of cores by hypervsior.
@@ -2120,6 +2118,9 @@ void pseries_init_ec_vp_cores(void)
  * If steal time is low, increase Available Cores
  */
 
+static unsigned int steal_ratio_high = 400;
+static unsigned int steal_ratio_low = 150;
+
 void update_soft_entitlement(unsigned long steal_ratio)
 {
 	static int prev_direction;
@@ -2128,7 +2129,7 @@ void update_soft_entitlement(unsigned long steal_ratio)
 	if  (!entitled_cores)
 		return;
 
-	if (steal_ratio >= STEAL_RATIO_HIGH && prev_direction > 0) {
+	if (steal_ratio >= steal_ratio_high && prev_direction > 0) {
 		/*
 		 * System entitlement was reduced earlier but we continue to
 		 * see steal time. Reduce entitlement further.
@@ -2145,7 +2146,7 @@ void update_soft_entitlement(unsigned long steal_ratio)
 		}
 		available_cores--;
 
-	} else if (steal_ratio <= STEAL_RATIO_LOW && prev_direction < 0) {
+	} else if (steal_ratio <= steal_ratio_low && prev_direction < 0) {
 		/*
 		 * System entitlement was increased but we continue to see
 		 * less steal time. Increase entitlement further.
@@ -2160,13 +2161,90 @@ void update_soft_entitlement(unsigned long steal_ratio)
 
 		available_cores++;
 	}
-	if (steal_ratio >= STEAL_RATIO_HIGH)
+	if (steal_ratio >= steal_ratio_high)
 		prev_direction = 1;
-	else if (steal_ratio <= STEAL_RATIO_LOW)
+	else if (steal_ratio <= steal_ratio_low)
 		prev_direction = -1;
 	else
 		prev_direction = 0;
 }
+
+/*
+ * Any value above this set threshold will reduce the available cores
+ * Value can't be more than 100% and can't be less than low threshould value
+ * Specifying 500 means 5% steal time
+ */
+
+static int pv_steal_ratio_high_set(void *data, u64 val)
+{
+	if (val > 10000 || val < steal_ratio_low)
+		return -EINVAL;
+
+	steal_ratio_high = val;
+	return 0;
+}
+
+static int pv_steal_ratio_high_get(void *data, u64 *val)
+{
+	*val = steal_ratio_high;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_steal_ratio_high, pv_steal_ratio_high_get,
+			pv_steal_ratio_high_set, "%llu\n");
+
+static int pv_steal_ratio_low_set(void *data, u64 val)
+{
+	if (val < 1 || val > steal_ratio_high)
+		return -EINVAL;
+
+	steal_ratio_low = val;
+	return 0;
+}
+
+static int pv_steal_ratio_low_get(void *data, u64 *val)
+{
+	*val = steal_ratio_low;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_steal_ratio_low, pv_steal_ratio_low_get,
+			pv_steal_ratio_low_set, "%llu\n");
+
+static int pv_steal_check_freq_set(void *data, u64 val)
+{
+	if (val < 1 || val > 10)
+		return -EINVAL;
+
+	steal_check_freq = val;
+	return 0;
+}
+
+static int pv_steal_check_freq_get(void *data, u64 *val)
+{
+	*val = steal_check_freq;
+	return 0;
+}
+
+DEFINE_SIMPLE_ATTRIBUTE(fops_pv_steal_check_freq, pv_steal_check_freq_get,
+			pv_steal_check_freq_set, "%llu\n");
+
+static int __init steal_debugfs_init(void)
+{
+	if (!is_shared_processor() || is_kvm_guest())
+		return 0;
+
+	debugfs_create_file("steal_ratio_high", 0600, arch_debugfs_dir,
+			    NULL, &fops_pv_steal_ratio_high);
+	debugfs_create_file("steal_ratio_low", 0600, arch_debugfs_dir,
+			    NULL, &fops_pv_steal_ratio_low);
+	debugfs_create_file("steal_check_frequency", 0600, arch_debugfs_dir,
+			    NULL, &fops_pv_steal_check_freq);
+
+	return 0;
+}
+
+machine_arch_initcall(pseries, steal_debugfs_init);
 #else
 void pseries_init_ec_vp_cores(void) { return; }
 void update_soft_entitlement(unsigned long steal_ratio) { return; }
-- 
2.47.3


