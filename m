Return-Path: <linuxppc-dev+bounces-14363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F3EC6E918
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Nov 2025 13:47:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dBLp1164Xz3fKp;
	Wed, 19 Nov 2025 23:46:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763556393;
	cv=none; b=csWTn7ljnXcJ57IF55MfFACKvbwMfs81hSz+A0jNkhhFAy5+IFrBX9HrauHU4wA+88mgdObZiocfiU/MzSOTDs6epIfuBLBo8wOzDKmqu1T9YbenxB5rAYOJ4rx7x9fyv0zaPgWkFBu0IpW63lxi/ihKN4Pz+Gj8Bmh8UXCsF7kXpts4tBRWrWgbKGDgGqAo4THjHlTORL/Kp5SmZpTt5Dv0fvUgl1h9MVY15vfmZ61htbzucEurn5xFS11pXh1ZOoMQ8I21SjVX+9+sAf4RfV6XchUqj3TorkAMMuBoULzf8rq/L/LGkblULS156wENu9Jy/QfnLpHJqRhexBmPPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763556393; c=relaxed/relaxed;
	bh=YMqSwq6KrmjkrGRn/FphTkipGpgec4bt05KmPFzk9RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g+MWwHcAswyI9cs+9PZx633w8u4ca5tvAqTy3G5X94gfL5U5GkIsc5ISbT5qOLn0fczFad1vcjiUAy2VWn55DJnyoKSUzsloo3X0rgqF0gHrQoF6UN0eups53xuoYWJP3aRSWrCBWCVWEi6kJx+I+pWPJ9XQu34ILh4jlln/jAHAD8+PdnziSc3FcKVzgaJWN+JvXiCAuVlkWSXHYkPqKE6VqQpCTZpFtZSNrMJVjXdJbWOwE+PmvC/PghN/3Me0vOC1FLvQ1OGw50TSY1OOBVXTEVZvRTL58Kk6AaCZoRVU7tm6/UrSgQ7VKA6cS04PZATN+r47poWwJ0ukxlVsyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yrooy7bR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yrooy7bR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dBLp02kbFz3fKj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Nov 2025 23:46:32 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJ9wcrr002633;
	Wed, 19 Nov 2025 12:46:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=YMqSwq6KrmjkrGRn/
	FphTkipGpgec4bt05KmPFzk9RQ=; b=Yrooy7bRwjoqryL7NTq6fD4/tfewHnf02
	6sBifV5wvOkPEsUClysYZmMdT9rzt6Vhppa8PAwD5tASEpsNVS/lXODDBcEQ1/ys
	+GvInD+b5aepxtMj5d+75c3H6fGBiKW05KDlNgNopsO+ZAxooQJMXUSJDeFOMylC
	2+e+UhG47U+OOe0NGk5lO20B2ngkjByNft9bSwrHi0LA7gJJJ/S74XmE8fvbdfg+
	goxX1RjGCi+9mPVRKP2m2T8TqbLLan2U6kZdlsE8bmcwP/qlDd0X1AXUlz2kPZTk
	Ovzv8RVjBzMdfgmPLHLcfYRficDHA2e7gC5OlkLR1t8/r3nXXmfEw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1gf97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:15 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AJCWZDO022312;
	Wed, 19 Nov 2025 12:46:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1gf95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AJBUEh1005122;
	Wed, 19 Nov 2025 12:46:13 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bk8mnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Nov 2025 12:46:13 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AJCk9Ye43188588
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Nov 2025 12:46:09 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B36302004B;
	Wed, 19 Nov 2025 12:46:09 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A705E20040;
	Wed, 19 Nov 2025 12:46:05 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.25.220])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 19 Nov 2025 12:46:05 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, mingo@redhat.com, peterz@infradead.org,
        juri.lelli@redhat.com, vincent.guittot@linaro.org, tglx@linutronix.de,
        yury.norov@gmail.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
        gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
        kprateek.nayak@amd.com, vschneid@redhat.com, iii@linux.ibm.com,
        huschle@linux.ibm.com, rostedt@goodmis.org, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 16/17] sysfs: Provide write method for paravirt
Date: Wed, 19 Nov 2025 18:14:48 +0530
Message-ID: <20251119124449.1149616-17-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691dbc17 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=nJnLclp8XjHwtpYBAkoA:9
X-Proofpoint-GUID: canMmW5q6vWH340yCZ5AIBCROflXtUnx
X-Proofpoint-ORIG-GUID: wwReSnQNUxJqhaFvKLFRxbfHWod7q3Bx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX389yTbPFcJ3Z
 2SCOGbGPUPSj7i9ONlwxgsFKfZw7GgWk4DJ7HszhIeGpJSt1V1QcypPjvt9cfeuex7wPIhyHJj4
 dJ5Eb1oXremWHsXvGlPGbxvrzC7t28+AuCK+zZ784uvJC/0jOCkRtcW3fjcrTsTglSI32fP7h/N
 2e1iyYifEDVqPJ8xX1axiW7ZOb4tBrL+ZgjWYaKr8D1c5zrP8bvx/fR6RHkOlVUOj+XoXLyv01r
 W6gGalrN1usP7skz9fpqxJY9XSPBnwQeb+AaiPFkx9ww4A+eg0XPwtLlTYexgXMJlgtyfx3vWI3
 xjsvIt4deBOliXnqUqlIVB5x/ieDpAd+q8O4/z5lkVbn4r5auuWsvOYi893B87U2LcHajnsr77t
 cvZMi8HU2ceTb1PWZu85N/V47fJuKQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-19_03,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a debug patch which could be used to set the range of CPUs as
paravirt. 

One could make use of this for quick testing of this infra instead of writing
arch specific code. This allows checking some corner cases by providing custom
cpumasks which isn't possible with arch method.

echo 100-200,600-700 >  /sys/devices/system/cpu/paravirt
cat /sys/devices/system/cpu/paravirt
100-200,600-700

echo > /sys/devices/system/cpu/paravirt
cat /sys/devices/system/cpu/paravirt

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
This is currently not meant be merged, since paravirt sysfs file is meant
to be Read-Only. Hence the documentation hasn't changed. If this method is
really helpful, then can consider including it depending on the
discussion.

drivers/base/cpu.c | 47 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 46 insertions(+), 1 deletion(-)

diff --git a/drivers/base/cpu.c b/drivers/base/cpu.c
index c216e13c4e2d..766584c85051 100644
--- a/drivers/base/cpu.c
+++ b/drivers/base/cpu.c
@@ -375,12 +375,57 @@ static int cpu_uevent(const struct device *dev, struct kobj_uevent_env *env)
 #endif
 
 #ifdef CONFIG_PARAVIRT
+static ssize_t paravirt_store(struct device *dev,
+			      struct device_attribute *attr,
+			      const char *buf, size_t count)
+{
+	cpumask_var_t temp_mask;
+	int retval = 0;
+	int cpu;
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
 static ssize_t paravirt_show(struct device *dev,
 				   struct device_attribute *attr, char *buf)
 {
 	return sysfs_emit(buf, "%*pbl\n", cpumask_pr_args(cpu_paravirt_mask));
 }
-static DEVICE_ATTR_RO(paravirt);
+static DEVICE_ATTR_RW(paravirt);
 #endif
 
 const struct bus_type cpu_subsys = {
-- 
2.47.3


