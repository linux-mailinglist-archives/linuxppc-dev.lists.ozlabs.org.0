Return-Path: <linuxppc-dev+bounces-14358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A6ECC6E8FA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:46:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLnc2dKFz3fD7;
	Wed, 19 Nov 2025 23:46:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556372;
	cv=none; b=k6VWgS1oCR3w4prDSMd7xC7rInqeMbKPwwPX6jMu2SaueHCbuHmS8dHA5/DW8g8pe4M1zeK+mDSGtIKLzSwTg21RRCr9GGeS/tbDY1CKeSKOlN7RI1PY+dRZBKhpjr+qdUcWVZJYJlPqHWJ8Dx9Ejw9kLjaABzSfns0EOrpnRhmFnGSxWryU/+aSpLEFuQMSzzVlQBOhZyJam/KTj4C9t/Otraa27GzOkbuBf6245BWnbEOgcTx/E5lK6lBIAAZa4v7oH6UWgDdsXz5rIRvVc1VLbZe4bXAJGaCI/q0xmQYuaknqg/bKxA+Lbbu9xjYlx97XTMFMEMqSYYmi1Rw5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556372; c=relaxed/relaxed;
	bh=fp3wEgZfbEs1a3AHuEOaiMge68Gvr+SKIXwf3P50Lb0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Apy6TAAnadbIUU0OsqmkOSaSQ4erQYtDGiJtWgrO04gNz33FGkdouPndz0rpZVTl2z7+zxbrz0YKYeIHmB6ngZ8eJcdGPFwDb//PglUV0G3Wbuqmk9lcYT3q82XzeUq+vZXFShR31USZLHy8OhlVBfZ6oGzKclMMY2FK4wj9cSKoCtPNxcy/yStCPhpWu3qxbbYCjaQwzHd40hxkW+0zk50EHGFLuPRb7Nta6SW944rLILeZ9vq/vPNkOftzEny7M57oigs/w1ULc9RZX7FTEC3nt5vpVd9GVpkHAGwS6a8dJtFMxSX3WSArFFkdwZxX4thSiv1nCIT8TGEvdWCNyA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QDlUn/AC; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QDlUn/AC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLnb3pbnz3c4v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:46:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ9NBJO001887;
	Wed, 19 Nov 2025 12:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=fp3wEgZfbEs1a3AHu
	EOaiMge68Gvr+SKIXwf3P50Lb0=; b=QDlUn/ACkoAELvNooK2U7ORln6QGSAtCb
	cOfeNLy3eCotDcjSi6/usfs3dVhZMfc88a8dUvAj/WhJn6Yn2jhVwvBkQmVe9XlM
	JW5RZmCMnrXHLXn7U1v01qswzH20UquPQoxoaLxdZD60v6g0mIrWNXIVhZCgI5+F
	Lk98XqbZyn7eimUxHU+uDJgivi8JkwyPgGM0vJ1nuG9L+FQcZgdEzgIDioRcozgY
	GGYEdPx6GmnX7UD4zaC52LIXRaVy1HWZBP/Fq6sAXZ/1FQP6TMFol807JUGm5Hyk
	f3FaI9m1amlO3uIRU0/NOem8jJSEv/NYXhOcsMSWBADUjheKZl6vA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtykgq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:52 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCZSlx006801;
	Wed, 19 Nov 2025 12:45:52 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejjtykgn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:52 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJCHdwJ017319;
	Wed, 19 Nov 2025 12:45:51 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j1rce6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:45:51 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCjlLi30474632
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:45:47 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E4822004B;
	Wed, 19 Nov 2025 12:45:47 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 651D020040;
	Wed, 19 Nov 2025 12:45:43 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:45:43 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 11/17] sysfs: Add paravirt CPU file
Date: Wed, 19 Nov 2025 18:14:43 +0530
Message-ID: <20251119124449.1149616-12-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: kM-SW_RB9CwHTwYPtFJ878yGr_bcFusT
X-Proofpoint-ORIG-GUID: 3MWNP3_-6wVPt9-O81QW7CGYUTXwBK0K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX5KetOKyTsGUB
 t9Wx0kbWKTnK6dq7yGh3y8/JxaEunYW7rMgYnf3ul90tWv2UpJICUrOrcLBi0xHKVspLYFyrV4D
 31DgmEdE6qqoGfddK8xNOgN65SbvY5tw8YB++P/Rm4cqp9gY9i1MNmNx0gOLU5RejZc5PjckoNO
 tW3pIuxvkxGg3Q3+HRdOxMhrq9XK6DmH3hA05pss9a2Uretong9w3/OIVf4l+bjPbVl91cmyBAO
 m6XHLiU74urshg/hydcrwvGWm/WeD4y2RZVaR+/1UP2Z1AZB9SHRfsb4dlZU+/Rqqe+wzNf/kps
 2Lprknqv2OLGV8r+OoTo1p+OfHxQ1ppPyfWElvzOxdaTqxWgfzPZM1afUI8u+XN0cN/MNISN3gg
 TN0jdCJNf7gFwioeXwrvy0CFyeCbkQ==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691dbc00 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8
 a=a_zpyIc2HxMjbloCHkAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
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
index fa0a2eef93ac..c216e13c4e2d 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -374,6 +374,15 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
 }
 #endif
 
+#ifdef CONFIG_PARAVIRT
+static ssize_t paravirt_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_paravirt_mask));
+}
+static DEVICE_ATTR_RO(paravirt);
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


