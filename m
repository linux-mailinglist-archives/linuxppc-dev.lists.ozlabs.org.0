Return-Path: <linuxppc-dev+bounces-12006-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCAB0B51F49
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 19:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMSkP3T9Lz3dXL;
	Thu, 11 Sep 2025 03:44:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757526285;
	cv=none; b=Xm6wmIPRJcUPTgpU0pmI/AzEnZhDpr9+kk80SQ0bu9mjqerVfp9S+dzSeAjBpmSAsU6SoLOZ2EuLUsUVVRvPC+Gh0YU+1zzALrRSJHBzyfu7P5ll/935mzCxB/3WdfVr76wY52y17D6pB4NL6vLw0fnLmV/lzEbEQEgqY5yj9JvyGZQ34atmcDHyHAwzwsQPC8bQmiQ28KNu84duW9ZmsmF9R57GHWWetPqkG4RQEcL9DiRGuz3/FxtTYjFeIN55JtRr/HMARYztcR7BSIkcqxKKIlJR1b3zr0R4ltyzOiV8riU66GRdnev01o5TVf9dtZdAb+XMWYY1WGRydX+J6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757526285; c=relaxed/relaxed;
	bh=4z62H3/dUq5jAYTi2vBs82WKWvZqNRrPBP4kbBya9IQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Cz8RXURVNceoYKuN3P4gYEz3Q8tBN71rMj7PGAugVa4pslMEOthv2jPiVHfZNXrhOdlLnfcX6JE9Coj/bQXFNZQQmKIjsTwTRm1wsBcotl/phAH8AGXlxEOK8ehFM+U+ApXkHqy/oUE4XzZF7QeTBYv5GUgn/3bdAdn94U9DnEJEUvn/LqvVvrbyMUE3y79zCxqPft9d0PqSyhEzu8Lipg4lq1xlo9jg/tH1i5387rO2xa6GFNsqsm+G/bd+4Gvq07AVgru3eqQoEWuVyccZEvRe4mYgbX9NsyU8J5kxLx/pw9nsoN7LeGhAYUVAzU3wCaxxaaxx7XOHHdNpwuTLAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QEVPANdV; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QEVPANdV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMSkN4sbkz3dTB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 03:44:44 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AElKSj024268;
	Wed, 10 Sep 2025 17:44:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=4z62H3/dUq5jAYTi2
	vBs82WKWvZqNRrPBP4kbBya9IQ=; b=QEVPANdVCm81fNMqVx0aq5NNJqkUm8hl1
	QjfOskV94E6HuMERG15pITMgjP3Af9amCT8QtVWcn5zQ8Rwr0GCRd6WLBxJzJC1I
	sPDW5ev/FSTDR954RedZOIO/3YAUy+9Yw0O3jnKSdkhM0wBGWM6PX3cZWWyWmX4k
	OWKRLINbfSdJSowcgevPYm/EOIvqfmdBeCso0V30Tw4l/DX4SB/xuoGIONcdn0zO
	rasz3LIbe8x5+iWjmhpERlsEK5ylRsQ5ZtxwGdquEDYIDpC01KIiWISvdpMaaFgw
	GHQFmYcmCkyJkRymj/lCVf6umLyCSr8aNZaSwZVPPeUCZnssJ8NXQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsycp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:34 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58AHiYnH007324;
	Wed, 10 Sep 2025 17:44:34 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsycp3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:34 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58AHRVB4010613;
	Wed, 10 Sep 2025 17:44:33 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4910sn1pb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 17:44:33 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58AHiTQG49348896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 17:44:29 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 884A320043;
	Wed, 10 Sep 2025 17:44:29 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FBBC20040;
	Wed, 10 Sep 2025 17:44:22 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.208.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Sep 2025 17:44:22 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, gregkh@linuxfoundation.org
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        vineeth@bitbyteword.org, jgross@suse.com, pbonzini@redhat.com,
        seanjc@google.com
Subject: [RFC PATCH v3 08/10] sysfs: Add paravirt CPU file
Date: Wed, 10 Sep 2025 23:12:08 +0530
Message-ID: <20250910174210.1969750-9-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250910174210.1969750-1-sshegde@linux.ibm.com>
References: <20250910174210.1969750-1-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfXxx+8TpVUyyu4
 LwXUvqIaAM6dKRZCNw9AiVSdvlEwek6zOAqU+ayp+Y+LmOkey+LOsZMJyQGKOZ0WZpjZZbfTvU2
 I4iciEIBguhNOiwUcW+bc39mTnh7lPN4v5iSfvSfq+dThc/kZKI6idCom7Xa+BwTY74BK7JGUG0
 S+h3+hiiEtqAymMTCPBP+ElbGOt14YzPwBJ6W+Te3LTjLrQMeY/WxHO/44BqACicIpVs+lucUJ3
 mwNZvyUXsynwo6THyWzvsC/tDhaqh1YMv8EqYDW33y54W2rd0q136tiGDRLGkLTfY1a80Ee1PQu
 CXLPP0FF8MD4g6HjVSjx02qzr9lfSMS6Yo3VA13UGu6Ii5mE7yzJtij8TGpsjUH6r8Sn3CstYob
 DW+mfs+5
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68c1b902 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=yJojWOMRYYMA:10 a=VnNF1IyMAAAA:8 a=VwQbUJbxAAAA:8 a=a_zpyIc2HxMjbloCHkAA:9
X-Proofpoint-GUID: Lmcawx-SnNuLwMeaFBXvlprFfMb7lrJl
X-Proofpoint-ORIG-GUID: azK_oQvvshpQd4tv_KZ6wKj2lSbMOwKd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_03,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
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
index ab8cd337f43a..6701e97d3f8d 100644
--- a/Documentation/ABI/testing/sysfs-devices-system-cpu
+++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
@@ -776,3 +776,12 @@ Date:		Nov 2022
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
index efc575a00edd..902747ff4988 100644
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


