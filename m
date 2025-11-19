Return-Path: <linuxppc-dev+bounces-14328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8616EC6CE7E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:24:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBHY4sFyz3c1C;
	Wed, 19 Nov 2025 17:23:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533385;
	cv=none; b=JshoIJC3p6B3JIe83S9thv4J4mxXh1muMHsRe3Vn+ce4nVtF9tfwK4zMGK/0sHYz2zkCPtqApVlJhmpcq0t+YaXvmN1hB4ZgpRMp12yf++EKb72A8V6SgEkxncS6tgPYh2JQrVCOV1BkjYrjMI8LX+DNbkLVzAv7dh6PmCvIDeQWl3IPXJerM4aaxKjBJDbxucYabwUylWt2B2Y4r2edNQV30hQtt4++XcuZ13Hx345DB1QbqFUR1poXE31i/+fqikflluDfWTpUUP15O2qs3IQ3maEGkJuTCifgGrefzLjjMXOTUSmZlHl6wtxkGT8WnH4oXUEyDCS6QRNId4RMLw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533385; c=relaxed/relaxed;
	bh=qwwhPRiP3QoTjd03SMOrFTPp8by36pRPJD152aBemAk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jcvGgqdVPWS7QPvHn9WL5/bYB4xCdm0u2jWyK9gX6A61lLas2+cb8hqOLRMNTwXtKZ4a24sdGPepCrpP85dZk4+7ITy9195Xj9gwinDDXiXe9kRx/6MbPQRjNWEOTt4YXKAMBICwNfyUfv1B8ZgLET7pSDW1P/TrENdcPC1MlTMK1zL8YbKFNxDi4Wa9LkpHUMIqE8KIkyeluNtAt+KyFb4lSM8imfMLv8DWwu3Y1rNN13j877E4xY/b6D8SDFLDrpi2TbeO7z4ZUZo4LTtEjn060mO24rNWIwVSf873s+6UxObN3MdSRytYtMfRT7a3IozMTPy4k+Zyps/8ySLvVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jhRFbyFS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jhRFbyFS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBHX6wPvz30VZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:23:04 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ1RKjv014231;
	Wed, 19 Nov 2025 06:22:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=qwwhPRiP3QoTjd03S
	MOrFTPp8by36pRPJD152aBemAk=; b=jhRFbyFSqk06XroNrYJVqnPpCwC0bXsaL
	ZJfyYNcA8bx32Jyg8BQlsW5u5FypcKK6K6rwvTJ+dh0ePMNGrKlSx1+4CbIglJuC
	fErnVBBDjWdGICuHRpa7cPSInfhxMMPR4Gtr5nH+HQtcSj4pakIc0KYbulXRN1p9
	97O1Mq6rLr1h1jRvFU8ne81w13Uh3fyH95GKuCZhxVGHZcJu3haJPJaMhhEtjQzK
	PlSDWgk5O2QfNBGD+Xbllejvlue5sTxEm/veZnusua/52ItxRureTGGoR4u8hFrW
	sAW7xAXAS6Cx9i4nMfeJH0QBevnFjRAQfOb5Ghmg5ozzqXFSnunyg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ewcp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:46 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6MjTq024215;
	Wed, 19 Nov 2025 06:22:45 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ewcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:45 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ2k1uq030854;
	Wed, 19 Nov 2025 06:22:44 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af47xy950-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:44 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6MelF28836102
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:40 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2363420040;
	Wed, 19 Nov 2025 06:22:40 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3DD3A20043;
	Wed, 19 Nov 2025 06:22:36 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:22:36 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [HELPER PATCH 1] sysfs: Provide write method for paravirt
Date: Wed, 19 Nov 2025 11:50:59 +0530
Message-ID: <20251119062100.1112520-17-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691d6236 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=nJnLclp8XjHwtpYBAkoA:9
X-Proofpoint-GUID: dnjxQUgrg9fnZQQJtsJgGaGwBCBpR8NQ
X-Proofpoint-ORIG-GUID: DyOM4WzZ6TfB-xoDIButFR1IGGTFaPcG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX/+TfAwqbG3Fj
 j1FWwlpxGUH6RdBxVochRZ1cOR7AVtsX75RobF78Vczt4DBhr/HAhpsKD3QJIajfwKteUuIQcIA
 XyY6Q0dPO5Kg/A6EbwbBT52oLZalaQ922vzFanHdJidS19sxtv/KCrF12gPy76tSnveZi0beCwD
 hFzaaBDHCqEmTNqBAvOHN/82wltORz7fckZwFpRG1+bFqqoEyWQcE1InZnfsdk1OcN8h6Ts13CE
 6mEH7WKcKS27P6wbUoiFzmbm6rHWArW/IFs2rn0NY4WIiuOXZ87apPKzvTSPY5/9MtBGvfXHwo+
 GNHG6QVcP63+RaW4YkM74HeeQ8GFayVLF1F15Io8gTCrdws0viht01PCzWlEMaYOc99DmUgi+JO
 b+aZ88JCRgMaYT+U8JAUhQsNbAL6Mg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is helper patch which could be used to set the range of CPUs as
paravirt. One could make use of this for quick testing of this infra
instead of writing arch specific code.

This is currently not meant be merged, since paravirt sysfs file is meant
to be Read-Only.

echo 100-200,600-700 >  /sys/devices/system/cpu/paravirt
cat /sys/devices/system/cpu/paravirt
100-200,600-700

echo > /sys/devices/system/cpu/paravirt
cat /sys/devices/system/cpu/paravirt

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 drivers/base/cpu.c | 48 ++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index 59ceae217b22..043e4f4ce1a9 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -375,12 +375,57 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
 #endif
 
 #ifdef CONFIG_PARAVIRT
+static ssize_t store_paravirt_cpus(struct device *dev,
+				   struct device_attribute *attr,
+				   const char *buf, size_t count)
+{
+	cpumask_var_t temp_mask;
+	int retval = 0;
+
+	if (!alloc_cpumask_var(&temp_mask, GFP_KERNEL))
+		return -ENOMEM;
+
+	retval = cpulist_parse(buf, temp_mask);
+	if (retval)
+		goto free_mask;
+
+	/* ALL cpus can't be marked as paravirt */
+	if (cpumask_equal(temp_mask, cpu_online_mask)) {
+		retval = -EINVAL;
+		goto free_mask;
+	}
+	if (cpumask_weight(temp_mask) > num_online_cpus()) {
+		retval = -EINVAL;
+		goto free_mask;
+	}
+
+	/* No more paravirt cpus */
+	if (cpumask_empty(temp_mask)) {
+		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
+	} else {
+		cpumask_copy((struct cpumask *)&__cpu_paravirt_mask, temp_mask);
+
+		/* Enable tick on nohz_full cpu */
+		int cpu;
+		for_each_cpu(cpu, temp_mask) {
+			if (tick_nohz_full_cpu(cpu))
+				tick_nohz_dep_set_cpu(cpu, TICK_DEP_BIT_SCHED);
+		}
+	}
+
+	retval = count;
+
+free_mask:
+	free_cpumask_var(temp_mask);
+	return retval;
+}
+
 static ssize_t print_paravirt_cpus(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
 	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_paravirt_mask));
 }
-static DEVICE_ATTR(paravirt, 0444, print_paravirt_cpus, NULL);
+static DEVICE_ATTR(paravirt, 0644, print_paravirt_cpus, store_paravirt_cpus);
 #endif
 
 const struct bus_type cpu_subsys = {
@@ -675,7 +720,6 @@ static void __init cpu_register_vulnerabilities(void)
 		put_device(dev);
 	}
 }
-
 #else
 static inline void cpu_register_vulnerabilities(void) { }
 #endif
-- 
2.47.3


