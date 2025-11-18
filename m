Return-Path: <linuxppc-dev+bounces-14287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E57C67D84
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 08:10:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9bP75SGLz3bTj;
	Tue, 18 Nov 2025 18:10:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763449851;
	cv=none; b=X/1DnmIAkzKfuOPhcasJi5u71Q2H9rxp8HyKQoXHNkvoSJ+vWlv0tmP30Ud1NIPyE8ZSEm6MUrbMcS6YhMwNrXN/GAOdua5NFcEZbkKX87DKyoUQINZslpE4JyILM1F+oSwsBO+JSxbfvYXm8dYYeSZicdT+xmENqehO+W8tXVvHCLt3KIda59TV6rGbqDRUI1vzV8mF0Gi+xWnx6bYNZL8Hhvky2lG1SYIJ9JLrqR70Ev0DUaZgxI0d8zy4FEswj377sQ593Ed5HgRmApjQwwkzKuIBvHzveKpEZNYI6WOIppa2+aRAkCBG4BuqAGD1bmDteYYw9Fz5TOPldEnHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763449851; c=relaxed/relaxed;
	bh=WLUl9zRKhU7pC7QdNOo0kmQUuFwVlZceAJXY26NlICU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lg7YfCiArnhm1qaHq5n4jG2W31A4cP2ODsB+F8BXWgvP4qMcnUOVahBi2v33IFOqi00VxgdGS/aqqBUZYygYFEiZ6Ty/wjtxg5/GlBQeOFtNM84RPcu8D287mGvr0U8PslBmXhwMQnBU3AKCz4/NjB+lDYXjw4hx1LXolVo2HuRFG6ILqj67zz2xA15PfsZz2mXapEPYnXbDPL53SlqywSWE9i2rRzuLO6Ziht91iZV6+fBQfoMe9bsHQPxH2qnTBNWMvD6Hdx+aN2KX4To/y3V4KB6U4T22SE8tK/AaHTgNwZN1REPteydlH03KFdATflmwR46Gs9y+jDnTj642Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DV+rNZnt; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DV+rNZnt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9bP63QLQz30YZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 18:10:49 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI6whct012148;
	Tue, 18 Nov 2025 07:10:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=WLUl9zRKhU7pC7QdNOo0kmQUuFwVlZceAJXY26NlI
	CU=; b=DV+rNZntjQT/M6KEI1Fp5zoPQ0TgQCuzOU8WgYaeKt4nEDDm2wqaKFwwZ
	bAsBFFoj6wpZUqPtbNp+0+0KGstzznYhQy2VzqGU6AwFk63WxvQBTAeWSxKs9Ybr
	Xf//LwUeXoEGR+hMEazE3dFOznb0fUKapW7YPtHDcWNd23igQIyoc3wlIJlbRHvD
	OG1PCJBjG/8jCmXp4acLUyVjSHg0VcRL6E74QfkStc+3DCTQLSck+36u8bU/99Oq
	+K0X6GKC4yxdjvQR+3YTXJNC7KOO6DZwBx/umEtSPekGj8aUXUo558ZUvA7Ae8k0
	6EGZWI1/6dIxhP8K53GVLKQVJw/ng==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk19h06-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 07:10:42 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AI75pJf030836;
	Tue, 18 Nov 2025 07:10:42 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk19h05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 07:10:42 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AI4nv7x017335;
	Tue, 18 Nov 2025 07:10:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af6j1hjvs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 07:10:40 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AI7AaVM40763788
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Nov 2025 07:10:36 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C753D20049;
	Tue, 18 Nov 2025 07:10:36 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1DC1820040;
	Tue, 18 Nov 2025 07:10:33 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.39.25.190])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Nov 2025 07:10:32 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Jiri Bohac <jbohac@suse.cz>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradead.org
Subject: [PATCH v6] crash: export crashkernel CMA reservation to userspace
Date: Tue, 18 Nov 2025 12:40:23 +0530
Message-ID: <20251118071023.1673329-1-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691c1bf2 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8
 a=JfrnYn6hAAAA:8 a=Tu7GEDxD-VmU2YT8bLkA:9 a=HkZW87K1Qel5hWWM3VKY:22
 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: sYITH5KJ-U216nk8FColBhsEWlXhHMHh
X-Proofpoint-ORIG-GUID: Y1r_gFcXJclaYZfCBLsHr3_2XnSybMX1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX0jbPT1ciTtlA
 p+fYzvL5FbOvmV5WJ6oVRTBMS54BIu2LZWxEXo0t8z0e7tI4lrMPT0gfLhF5gU1Z8k44EjPohnA
 fyTTufOnNVRRTobNYnZPYFSw1KTQxw1NEHrW1h/RM9TZ5GWKlmZJUHo5TO89+J8OmROoiButTip
 gaenIkmTQgosUO0L9R3sXd5Y/x9jgvC1bwujK2j5aVPfnE94Zo1UZieV/x+KjOgA+972uqTesQP
 6cPekz6zxo5/MlE60mCh7Il+kEkH2NpBGgbta5rZ9/YnBaK5kE+HXEH83TFv6EU20PvZGqZX5IG
 rRtcdh3Q3pY1NaEm//1T2Kt9sbWvFv0FSTqEwW2PQEXALSY/FupbpOs/S/yp9I2ngHXAaruztSN
 5x82ubzo3hD4qKDqC5HVRISeidAyGQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Add a sysfs entry /sys/kernel/kexec_crash_cma_ranges to expose all
CMA crashkernel ranges.

This allows userspace tools configuring kdump to determine how much
memory is reserved for crashkernel. If CMA is used, tools can warn
users when attempting to capture user pages with CMA reservation.

The new sysfs hold the CMA ranges in below format:

cat /sys/kernel/kexec_crash_cma_ranges
100000000-10c7fffff

The reason for not including Crash CMA Ranges in /proc/iomem is to avoid
conflicts. It has been observed that contiguous memory ranges are sometimes
shown as two separate System RAM entries in /proc/iomem. If a CMA range
overlaps two System RAM ranges, adding crashk_res to /proc/iomem can create
a conflict. Reference [1] describes one such instance on the PowerPC
architecture.

Link: https://lore.kernel.org/all/20251016142831.144515-1-sourabhjain@linux.ibm.com/ [1]

Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: Pingfan Liu <piliu@redhat.com>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---

Changelog:

v4 -> v5:
 https://lore.kernel.org/all/20251114152550.ac2dd5e23542f09c62defec7@linux-foundation.org/
 - Splitted patch from the above patch series.
 - Code to create kexec node under /sys/kernel is added, eariler it was
   done in [02/05] of the above patch series.

v5 -> v6:
 - Add Crash CMA Range sysfs interface under /sys/kernel

Note:
This patch is dependent on the below patch:
https://lore.kernel.org/all/20251117035153.1199665-1-sourabhjain@linux.ibm.com/

---
 .../ABI/testing/sysfs-kernel-kexec-kdump      | 10 +++++++++
 kernel/ksysfs.c                               | 21 +++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
index 96b24565b68e..f6089e38de5f 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
@@ -41,3 +41,13 @@ Description:	read only
 		is used by the user space utility kexec to support updating the
 		in-kernel kdump image during hotplug operations.
 User:		Kexec tools
+
+What:		/sys/kernel/kexec_crash_cma_ranges
+Date:		Nov 2025
+Contact:	kexec@lists.infradead.org
+Description:	read only
+		Provides information about the memory ranges reserved from
+		the Contiguous Memory Allocator (CMA) area that are allocated
+		to the crash (kdump) kernel. It lists the start and end physical
+		addresses of CMA regions assigned for crashkernel use.
+User:		kdump service
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index eefb67d9883c..0ff2179bc603 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -135,6 +135,24 @@ static ssize_t kexec_crash_loaded_show(struct kobject *kobj,
 }
 KERNEL_ATTR_RO(kexec_crash_loaded);
 
+#ifdef CONFIG_CRASH_RESERVE
+static ssize_t kexec_crash_cma_ranges_show(struct kobject *kobj,
+				    struct kobj_attribute *attr, char *buf)
+{
+
+	ssize_t len = 0;
+	int i;
+
+	for (i = 0; i < crashk_cma_cnt; ++i) {
+		len += sysfs_emit_at(buf, len, "%08llx-%08llx\n",
+				     crashk_cma_ranges[i].start,
+				     crashk_cma_ranges[i].end);
+	}
+	return len;
+}
+KERNEL_ATTR_RO(kexec_crash_cma_ranges);
+#endif /* CONFIG_CRASH_RESERVE */
+
 static ssize_t kexec_crash_size_show(struct kobject *kobj,
 				       struct kobj_attribute *attr, char *buf)
 {
@@ -260,6 +278,9 @@ static struct attribute * kernel_attrs[] = {
 #ifdef CONFIG_CRASH_DUMP
 	&kexec_crash_loaded_attr.attr,
 	&kexec_crash_size_attr.attr,
+#ifdef CONFIG_CRASH_RESERVE
+	&kexec_crash_cma_ranges_attr.attr,
+#endif
 #endif
 #endif
 #ifdef CONFIG_VMCORE_INFO
-- 
2.51.1


