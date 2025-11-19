Return-Path: <linuxppc-dev+bounces-14323-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A76EC6CE63
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 07:23:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBBHJ3FpFz3c2L;
	Wed, 19 Nov 2025 17:22:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763533372;
	cv=none; b=RKmg2QGGQUlZgGu+3RAOfTedO0Av53MAaxUk7Icg/6j1LeSXhESYKIPm3x1T7LBefu8wYUtO3i2Y7mzIFA+134G2eOHbdq+MtAG05ehFMWqFsj/cHUlQUsT8S2S4p/XvS143IJRFx2AvP70bzKGYUxZf36xIvIhsW89WUuPqfx/o4LOh8MB3XHx+ma6p1NSoYHZ5wv4zLqOlSg8K1bpikAOnt85XBdhCDxrxAdyCe70SPZbOISFdKojk+12cbJz0PDWb5hMRUkqYoIptW7HtlVm+O/L/jMsVwgL1mQXn8Zj2KBqqn6BC+icIhOwcAqDNccJi2D3g83WQRJubiUYTwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763533372; c=relaxed/relaxed;
	bh=vHuWVUPOHSbroZycTWVx10HJgxuZT2nuqVjge+1ptl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJ+0/k7uxWC2q9t8oDXx2oAcn7rH1Sid3Se7mN0OfBcQ6XAM4k+jyhh/8wZjFBX3idMKBFkVKwOB96Xs6i6ZYvU1h1o+ZCbZ6hU/z1ccyceNMvWUECqF18/jXEYB0hFSa6V7CGsjfC32ppbXe+Nqzy3K6DT5APYhtFm7y5+bNs/yjMZoofULSeUdDtyCTAAcGVKFVCqRlhlw+GMR7FBrtLdBYex9raqv0qJIg9+cipAMErBE6sTjdYLGuRexXDvwwbUMzkdmHKrWuLnf6yysxEXvWE1kHBPhIrOKwjASqVkKlwUS8gqk3W8bb/1SVMdfSKkoOFwiQmBmS8o3cbAqlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SUM0jsER; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SUM0jsER;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBBH94CyHz30TL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 17:22:45 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ1vf0V015741;
	Wed, 19 Nov 2025 06:22:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vHuWVUPOHSbroZycT
	WVx10HJgxuZT2nuqVjge+1ptl4=; b=SUM0jsERaXL8RQM83DIuFP5KmYGnAc/Yv
	MrZIrUnSbrHoSllmWrDiuiM+Vjr1DfUHP4R3SAZ8arsy+M76lMaRrYRa+iKx7b5V
	uRb3O6/TkNpK2soodusSffiBPhfPfaaG9UG46+3jKDUuMRjmbUdi6/I1zNx/i2Qq
	1dB7dTvn8gAsDrIWz39I6lp7iw4WDvwqK4/F9u2/uxhSBlXUGPSnoJwFNoYDli8C
	zsN7pJMHCw7+FXWY3tKDBuqJbu2kFMklG9TGHt1Pe3moGJICylZUtFrSCp3ggZeO
	j6QETXjSJOiNTsW6rmH/7YCmJjySRXvQ1+EDs/mz/QbvGVHjDnvhg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ewc0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:24 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJ6IIMQ018000;
	Wed, 19 Nov 2025 06:22:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1ewbx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ3wTV9022340;
	Wed, 19 Nov 2025 06:22:22 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af4umy57u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 06:22:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJ6MIUX41681170
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 06:22:18 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B62720043;
	Wed, 19 Nov 2025 06:22:18 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3933A20040;
	Wed, 19 Nov 2025 06:22:14 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 06:22:14 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [RFC PATCH v4 11/17] sysfs: Add paravirt CPU file
Date: Wed, 19 Nov 2025 11:50:54 +0530
Message-ID: <20251119062100.1112520-12-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691d6220 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=a_zpyIc2HxMjbloCHkAA:9
X-Proofpoint-GUID: aAeTXEk-5ZcKBz18j2bxgEnCHQkUOPu8
X-Proofpoint-ORIG-GUID: Kf2eUZOIzbYPpnRZO7PmO9JjHNd6xFdd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfXzJ7vsZqXmkK5
 p8wXTuyiOaWFoSpxy5WVIY43sj62nnV61XlmfrEOKNx1Ilfew5lVPO3TjqA55GxzHFIuqZHRXWi
 yELKMM0gu5lFAU35UitNM6bNeepdNR6JRvbYehdkb4dLEkUDs5ZGXCzm6ZCMHjCBhwqAa66jMXX
 S+1P4hhqphfR0iu+RQvwxKmg4JL2EVU0iGaZxmG2c8ByL6Vi7jduelwxSOLTWj5eycHJ/JN2k9W
 S42GwsdX9+RG9xpJzoZ9xv0vnMLqhrCWmTtx3jd6n3lvo/JMkpKR3tFP/cMjrBQvQvD7pNxllYt
 3xw11fox6h0EqefWXlVhI8PAePTWUygagEFeRajiFMVBK2EkZfYzjoX8bSo7xvoNkfy6g7CAMGm
 bA3a43Dzf4jsBNl5Ns3wddgnKY9zPg==
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

Add paravirt file in /sys/devices/system/cpu.

This offers
- User can quickly check which CPUs are marked as paravirt.
- Userspace algorithm such as sched_ext or with isolcpus could
  use the mask and make decision.
- daemon such as irqbalance could use this mask and don't spread
  irq's into paravirt CPUs.

For example:
cat /sys/devices/system/cpu/paravirt
600-719      <<< arch marked these are paravirt.

cat /sys/devices/system/cpu/paravirt
             <<< No paravirt CPUs at the moment.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 Documentation/ABI/testing/sysfs-devices-system-cpu |  9 +++++++++
 drivers/base/cpu.c                                 | 12 ++++++++++++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
index 8aed6d94c4cd..1da77430b776 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -777,3 +777,12 @@ Date:		Nov 2022
 Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
 Description:
 		(RO) the list of CPUs that can be brought online.
+
+What:		/sys/devices/system/cpu/paravirt
+Date:		Sep 2025
+Contact:	Linux kernel mailing list <linux-kernel@vger.kernel.org>
+Description:
+		(RO) the list of CPUs that are current marked as paravirt CPUs.
+		These CPUs are not meant to be used at the moment due to
+		contention of underlying physical CPU resource. Dynamically
+		changes to reflect the current situation.
diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index fa0a2eef93ac..59ceae217b22 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -374,6 +374,15 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
 }
 #endif
 
+#ifdef CONFIG_PARAVIRT
+static ssize_t print_paravirt_cpus(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_paravirt_mask));
+}
+static DEVICE_ATTR(paravirt, 0444, print_paravirt_cpus, NULL);
+#endif
+
 const struct bus_type cpu_subsys = {
 	.name = "cpu",
 	.dev_name = "cpu",
@@ -513,6 +522,9 @@ static struct attribute *cpu_root_attrs[] = {
 #endif
 #ifdef CONFIG_GENERIC_CPU_AUTOPROBE
 	&dev_attr_modalias.attr,
+#endif
+#ifdef CONFIG_PARAVIRT
+	&dev_attr_paravirt.attr,
 #endif
 	NULL
 };
-- 
2.47.3


