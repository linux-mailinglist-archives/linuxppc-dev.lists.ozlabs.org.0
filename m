Return-Path: <linuxppc-dev+bounces-13827-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E00ACC391D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 05:51:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d28t15jhzz3ccr;
	Thu,  6 Nov 2025 15:51:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762404697;
	cv=none; b=Q4y7cQ6MVhZ5GDDImC19fXVy0TO0sFIUAp3Of+BRvbbizkgSI5TtLgwfZmrM0CpVcyhaEPaXymscPa34Bsov0ozAFL9WfVqgpgs8bJjcGF8vGIA9rFmextoFy7x8PlKsCtHHKXzFEEyAUKNs5CKv7UQatr1JLeEQDv9QYlZ4qeWWeGmohjO2VWiruviYELElmTC+17/DVnAhtV6Uf6+7L25q8s+tGYsE4zBREBmZAmEsLysocI7XUTFIQ6J3m2Ylmof6vi9b8moGelU1TungOlz0keON9+wRgynqjorkah6pVaezSSMyqxnddEfFs45peeBL4tcl9VghQwjAz6t6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762404697; c=relaxed/relaxed;
	bh=T98toL3WRCrRsv5kuQ1L3LAsNFaeNulv4FwQH6BM8eA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iUswYU8hG9IubmrUjfF0BY55DdFRNjh5cGRkhT0bSm3nEKLUZ3p/xB4RX35FKzHrbq4vOpBymv1Hgw6ILkj+QBBqIxG+PPO6ooJjl91wCc8DBqy1VMcPreV67NHiaNrHT59ghQjnb/5HuhS/iQNIGr9nfWnSlEh1+SO4usJj41/rEUwLGBuA1q7/+LBJodVfpR+iv/NHfx5PK3iV6xQV/TDgEZz3TrDS8xOJUClBUe3P0OzzEk8vFNdA0WU9jig+/8J+VdGlLcWjngMjQasgYi6PqIypvi7vb62CnwhRgwMoKqSHnecGaYRxMa0IZCA8L1Th3Xf1BxaDxIZkZWr9bw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KMVFPKSB; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KMVFPKSB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d28t10l0qz3cYG
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 15:51:36 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A5HQvtf012367;
	Thu, 6 Nov 2025 04:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=T98toL3WRCrRsv5ku
	Q1L3LAsNFaeNulv4FwQH6BM8eA=; b=KMVFPKSBKG1yEDEkpcQFX075Hh4xjGbZm
	T7TzVT58fOplUzk+H1uTOka5sJNZ06U1a3wSxzgdnwmHKzusGAwZfh1zE3rfGP1f
	UxGzcOKg9Bl7bBgAPmT/ceveRk4O0mEktfIHn/w+Q2f1Bp7XN/fLiyx2fHY/tCBp
	Nsymbuvx3dfkNau4W5fOoZ/R6RQUGjxvwzWZKAF8m+GXtwiF2L/agDeijXGoc3tn
	3p5sdSLXErY+eVpGTOZvBgerd7+PQel8IWBws7891cE9gXoedQskEtTK8GMo5VOD
	HL2X5l9tRSQQv/0vWGLaM74+S8An8dh9jjgOpfvCWcLpXQ8TMjqcA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a58mm4h54-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:51:32 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A64pVgq013096;
	Thu, 6 Nov 2025 04:51:31 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a58mm4h53-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:51:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A63tr5t009874;
	Thu, 6 Nov 2025 04:51:31 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1kknda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 04:51:30 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A64pRa946399962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Nov 2025 04:51:27 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D05720049;
	Thu,  6 Nov 2025 04:51:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6E0A820040;
	Thu,  6 Nov 2025 04:51:23 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Nov 2025 04:51:23 +0000 (GMT)
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
Subject: [PATCH v2 2/5] kexec: move sysfs entries to /sys/kernel/kexec
Date: Thu,  6 Nov 2025 10:21:04 +0530
Message-ID: <20251106045107.17813-3-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251106045107.17813-1-sourabhjain@linux.ibm.com>
References: <20251106045107.17813-1-sourabhjain@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: z-2NTfWLO7M7G9Qz_UUPo3CHwaBFYT3C
X-Proofpoint-GUID: rAObDXFRdIlBfSWLkaB1y5Py-4Ps04Ot
X-Authority-Analysis: v=2.4 cv=SqidKfO0 c=1 sm=1 tr=0 ts=690c2954 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=_1xw4giDfGel_dwv_FAA:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwOSBTYWx0ZWRfX0SCvhaPcOs9h
 MCC5giHrpLRCI069eBBBuYys44xNKRT5k+RiTXy5T6B4JYFG1f4dcytICQu84Q67367pskYcekl
 EMdYDAO+SmOYBMdRy7DRSqj0LU5O2OLQUBySOpHfMpvhdlo0lx9NPGcgp6fBmEBELvr39SLhH7r
 kY2dkegEocwtJx1rrGTnYD3LQSCDIhirD5XazV2yKVcNaw39FG5g5fSkkWaR16I+BQVwNakO4YU
 jRO9oKI0BxP1N+Xj6KPT0+g2FkM6i2qGYHGXbsIsuOUbPYZAnb6wzLRluA9HK88Q0+1AbW80uIo
 diMtVLEzfmBiYBWkf3b+YNz78TGTr3NUZoAJu4cBVEJtfJNmMCYtap5ipwz5yVVR5Eif2gAQj0T
 kENHEFfP76l96R+2QgozoOSILzdhTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_09,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010009
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Several kexec and kdump sysfs entries are currently placed directly
under /sys/kernel/, which clutters the directory and makes it harder to
identify unrelated entries. To improve organization and readability,
these entries are now moved under a dedicated directory,
/sys/kernel/kexec.

For backward compatibility, symlinks are created at the old locations
so that existing tools and scripts continue to work. These symlinks can
be removed in the future once users have switched to the new path.

While creating symlinks, entries are added in /sys/kernel/ that point
to their new locations under /sys/kernel/kexec/. If an error occurs
while adding a symlink, it is logged but does not stop initialization
of the remaining kexec sysfs symlinks.

The /sys/kernel/<crash_elfcorehdr_size | kexec/crash_elfcorehdr_size>
entry is now controlled by CONFIG_CRASH_DUMP instead of
CONFIG_VMCORE_INFO, as CONFIG_CRASH_DUMP also enables
CONFIG_VMCORE_INFO.

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
 kernel/kexec_core.c | 118 ++++++++++++++++++++++++++++++++++++++++++++
 kernel/ksysfs.c     |  68 +------------------------
 2 files changed, 119 insertions(+), 67 deletions(-)

diff --git a/kernel/kexec_core.c b/kernel/kexec_core.c
index fa00b239c5d9..2e12a164e870 100644
--- a/kernel/kexec_core.c
+++ b/kernel/kexec_core.c
@@ -41,6 +41,7 @@
 #include <linux/objtool.h>
 #include <linux/kmsg_dump.h>
 #include <linux/dma-map-ops.h>
+#include <linux/sysfs.h>
 
 #include <asm/page.h>
 #include <asm/sections.h>
@@ -1229,3 +1230,120 @@ int kernel_kexec(void)
 	kexec_unlock();
 	return error;
 }
+
+static ssize_t loaded_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", !!kexec_image);
+}
+static struct kobj_attribute loaded_attr = __ATTR_RO(loaded);
+
+#ifdef CONFIG_CRASH_DUMP
+static ssize_t crash_loaded_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%d\n", kexec_crash_loaded());
+}
+static struct kobj_attribute crash_loaded_attr = __ATTR_RO(crash_loaded);
+
+static ssize_t crash_size_show(struct kobject *kobj,
+				       struct kobj_attribute *attr, char *buf)
+{
+	ssize_t size = crash_get_memory_size();
+
+	if (size < 0)
+		return size;
+
+	return sysfs_emit(buf, "%zd\n", size);
+}
+static ssize_t crash_size_store(struct kobject *kobj,
+				struct kobj_attribute *attr,
+				const char *buf, size_t count)
+{
+	unsigned long cnt;
+	int ret;
+
+	if (kstrtoul(buf, 0, &cnt))
+		return -EINVAL;
+
+	ret = crash_shrink_memory(cnt);
+	return ret < 0 ? ret : count;
+}
+static struct kobj_attribute crash_size_attr = __ATTR_RW(crash_size);
+
+#ifdef CONFIG_CRASH_HOTPLUG
+static ssize_t crash_elfcorehdr_size_show(struct kobject *kobj,
+			       struct kobj_attribute *attr, char *buf)
+{
+	unsigned int sz = crash_get_elfcorehdr_size();
+
+	return sysfs_emit(buf, "%u\n", sz);
+}
+static struct kobj_attribute crash_elfcorehdr_size_attr = __ATTR_RO(crash_elfcorehdr_size);
+
+#endif /* CONFIG_CRASH_HOTPLUG */
+#endif /* CONFIG_CRASH_DUMP */
+
+static struct attribute *kexec_attrs[] = {
+	&loaded_attr.attr,
+#ifdef CONFIG_CRASH_DUMP
+	&crash_loaded_attr.attr,
+	&crash_size_attr.attr,
+#ifdef CONFIG_CRASH_HOTPLUG
+	&crash_elfcorehdr_size_attr.attr,
+#endif
+#endif
+	NULL
+};
+
+struct kexec_link_entry {
+	const char *target;
+	const char *name;
+};
+
+static struct kexec_link_entry kexec_links[] = {
+	{ "loaded", "kexec_loaded" },
+#ifdef CONFIG_CRASH_DUMP
+	{ "crash_loaded", "kexec_crash_loaded" },
+	{ "crash_size", "kexec_crash_size" },
+#ifdef CONFIG_CRASH_HOTPLUG
+	{ "crash_elfcorehdr_size", "crash_elfcorehdr_size" },
+#endif
+#endif
+
+};
+
+struct kobject *kexec_kobj;
+ATTRIBUTE_GROUPS(kexec);
+
+static int __init init_kexec_sysctl(void)
+{
+	int error;
+	int i;
+
+	kexec_kobj = kobject_create_and_add("kexec", kernel_kobj);
+	if (!kexec_kobj) {
+		pr_err("failed to create kexec kobject\n");
+		return -ENOMEM;
+	}
+
+	error = sysfs_create_groups(kexec_kobj, kexec_groups);
+	if (error)
+		goto kset_exit;
+
+	for (i = 0; i < ARRAY_SIZE(kexec_links); i++) {
+		error = compat_only_sysfs_link_entry_to_kobj(kernel_kobj, kexec_kobj,
+							     kexec_links[i].target,
+							     kexec_links[i].name);
+		if (error)
+			pr_err("Unable to create %s symlink (%d)", kexec_links[i].name, error);
+	}
+
+	return 0;
+
+kset_exit:
+	kobject_put(kexec_kobj);
+	return error;
+}
+
+subsys_initcall(init_kexec_sysctl);
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index eefb67d9883c..a9e6354d9e25 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -12,7 +12,7 @@
 #include <linux/sysfs.h>
 #include <linux/export.h>
 #include <linux/init.h>
-#include <linux/kexec.h>
+#include <linux/vmcore_info.h>
 #include <linux/profile.h>
 #include <linux/stat.h>
 #include <linux/sched.h>
@@ -119,50 +119,6 @@ static ssize_t profiling_store(struct kobject *kobj,
 KERNEL_ATTR_RW(profiling);
 #endif
 
-#ifdef CONFIG_KEXEC_CORE
-static ssize_t kexec_loaded_show(struct kobject *kobj,
-				 struct kobj_attribute *attr, char *buf)
-{
-	return sysfs_emit(buf, "%d\n", !!kexec_image);
-}
-KERNEL_ATTR_RO(kexec_loaded);
-
-#ifdef CONFIG_CRASH_DUMP
-static ssize_t kexec_crash_loaded_show(struct kobject *kobj,
-				       struct kobj_attribute *attr, char *buf)
-{
-	return sysfs_emit(buf, "%d\n", kexec_crash_loaded());
-}
-KERNEL_ATTR_RO(kexec_crash_loaded);
-
-static ssize_t kexec_crash_size_show(struct kobject *kobj,
-				       struct kobj_attribute *attr, char *buf)
-{
-	ssize_t size = crash_get_memory_size();
-
-	if (size < 0)
-		return size;
-
-	return sysfs_emit(buf, "%zd\n", size);
-}
-static ssize_t kexec_crash_size_store(struct kobject *kobj,
-				   struct kobj_attribute *attr,
-				   const char *buf, size_t count)
-{
-	unsigned long cnt;
-	int ret;
-
-	if (kstrtoul(buf, 0, &cnt))
-		return -EINVAL;
-
-	ret = crash_shrink_memory(cnt);
-	return ret < 0 ? ret : count;
-}
-KERNEL_ATTR_RW(kexec_crash_size);
-
-#endif /* CONFIG_CRASH_DUMP*/
-#endif /* CONFIG_KEXEC_CORE */
-
 #ifdef CONFIG_VMCORE_INFO
 
 static ssize_t vmcoreinfo_show(struct kobject *kobj,
@@ -174,18 +130,6 @@ static ssize_t vmcoreinfo_show(struct kobject *kobj,
 }
 KERNEL_ATTR_RO(vmcoreinfo);
 
-#ifdef CONFIG_CRASH_HOTPLUG
-static ssize_t crash_elfcorehdr_size_show(struct kobject *kobj,
-			       struct kobj_attribute *attr, char *buf)
-{
-	unsigned int sz = crash_get_elfcorehdr_size();
-
-	return sysfs_emit(buf, "%u\n", sz);
-}
-KERNEL_ATTR_RO(crash_elfcorehdr_size);
-
-#endif
-
 #endif /* CONFIG_VMCORE_INFO */
 
 /* whether file capabilities are enabled */
@@ -255,18 +199,8 @@ static struct attribute * kernel_attrs[] = {
 #ifdef CONFIG_PROFILING
 	&profiling_attr.attr,
 #endif
-#ifdef CONFIG_KEXEC_CORE
-	&kexec_loaded_attr.attr,
-#ifdef CONFIG_CRASH_DUMP
-	&kexec_crash_loaded_attr.attr,
-	&kexec_crash_size_attr.attr,
-#endif
-#endif
 #ifdef CONFIG_VMCORE_INFO
 	&vmcoreinfo_attr.attr,
-#ifdef CONFIG_CRASH_HOTPLUG
-	&crash_elfcorehdr_size_attr.attr,
-#endif
 #endif
 #ifndef CONFIG_TINY_RCU
 	&rcu_expedited_attr.attr,
-- 
2.51.0


