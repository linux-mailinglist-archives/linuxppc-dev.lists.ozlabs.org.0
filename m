Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A92911BBBD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Dec 2019 19:28:49 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Y56Q3KJpzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Dec 2019 05:28:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Y21q3rxRzDqjj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:09:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47Y21p6b2Mz8wHf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Dec 2019 03:09:34 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47Y21p3mWyzB3y5; Thu, 12 Dec 2019 03:09:34 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47Y21n3rKRz9sfR
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Dec 2019 03:09:33 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xBBG7XiC062744
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Dec 2019 11:09:31 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2wu1fmeggg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Dec 2019 11:09:31 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Wed, 11 Dec 2019 16:09:29 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Dec 2019 16:09:26 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xBBG9O5454853638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Dec 2019 16:09:24 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F21FA405B;
 Wed, 11 Dec 2019 16:09:24 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 30AD8A4054;
 Wed, 11 Dec 2019 16:09:22 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.85.74.172])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Dec 2019 16:09:21 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v6 2/6] sysfs: wrap __compat_only_sysfs_link_entry_to_kobj
 function to change the symlink name
Date: Wed, 11 Dec 2019 21:39:06 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
References: <20191211160910.21656-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19121116-4275-0000-0000-0000038E019D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19121116-4276-0000-0000-000038A1B82A
Message-Id: <20191211160910.21656-3-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-11_04:2019-12-11,2019-12-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 bulkscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 mlxscore=0 mlxlogscore=999 impostorscore=0 phishscore=0
 adultscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-1910280000 definitions=main-1912110136
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
Cc: corbet@lwn.net, mahesh@linux.vnet.ibm.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sourabh Jain <sourabhjain@linux.ibm.com>,
 linuxppc-dev@ozlabs.org, gregkh@linuxfoundation.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The __compat_only_sysfs_link_entry_to_kobj function creates a symlink to a
kobject but doesn't provide an option to change the symlink file name.

This patch adds a wrapper function compat_only_sysfs_link_entry_to_kobj
that extends the __compat_only_sysfs_link_entry_to_kobj functionality
which allows function caller to customize the symlink name.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 fs/sysfs/group.c      | 28 +++++++++++++++++++++++++---
 include/linux/sysfs.h | 12 ++++++++++++
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index d41c21fef138..0993645f0b59 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -424,6 +424,25 @@ EXPORT_SYMBOL_GPL(sysfs_remove_link_from_group);
 int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
 				      struct kobject *target_kobj,
 				      const char *target_name)
+{
+	return compat_only_sysfs_link_entry_to_kobj(kobj, target_kobj,
+						target_name, NULL);
+}
+EXPORT_SYMBOL_GPL(__compat_only_sysfs_link_entry_to_kobj);
+
+/**
+ * compat_only_sysfs_link_entry_to_kobj - add a symlink to a kobject pointing
+ * to a group or an attribute
+ * @kobj:		The kobject containing the group.
+ * @target_kobj:	The target kobject.
+ * @target_name:	The name of the target group or attribute.
+ * @symlink_name:	The name of the symlink file (target_name will be
+ *			considered if symlink_name is NULL).
+ */
+int compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
+					 struct kobject *target_kobj,
+					 const char *target_name,
+					 const char *symlink_name)
 {
 	struct kernfs_node *target;
 	struct kernfs_node *entry;
@@ -448,12 +467,15 @@ int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
 		return -ENOENT;
 	}
 
-	link = kernfs_create_link(kobj->sd, target_name, entry);
+	if (!symlink_name)
+		symlink_name = target_name;
+
+	link = kernfs_create_link(kobj->sd, symlink_name, entry);
 	if (IS_ERR(link) && PTR_ERR(link) == -EEXIST)
-		sysfs_warn_dup(kobj->sd, target_name);
+		sysfs_warn_dup(kobj->sd, symlink_name);
 
 	kernfs_put(entry);
 	kernfs_put(target);
 	return PTR_ERR_OR_ZERO(link);
 }
-EXPORT_SYMBOL_GPL(__compat_only_sysfs_link_entry_to_kobj);
+EXPORT_SYMBOL_GPL(compat_only_sysfs_link_entry_to_kobj);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 5420817ed317..15b195a4529d 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -300,6 +300,10 @@ void sysfs_remove_link_from_group(struct kobject *kobj, const char *group_name,
 int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
 				      struct kobject *target_kobj,
 				      const char *target_name);
+int compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
+					 struct kobject *target_kobj,
+					 const char *target_name,
+					 const char *symlink_name);
 
 void sysfs_notify(struct kobject *kobj, const char *dir, const char *attr);
 
@@ -508,6 +512,14 @@ static inline int __compat_only_sysfs_link_entry_to_kobj(
 	return 0;
 }
 
+static int compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
+						struct kobject *target_kobj,
+						const char *target_name,
+						const char *symlink_name)
+{
+	return 0;
+}
+
 static inline void sysfs_notify(struct kobject *kobj, const char *dir,
 				const char *attr)
 {
-- 
2.17.2

