Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D23ED11507D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 13:39:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Tsbp2MLszDqd0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Dec 2019 23:39:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47TsGt15wXzDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:24:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47TsGs68XHz8swt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2019 23:24:53 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47TsGs4lGBz9sRH; Fri,  6 Dec 2019 23:24:53 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47TsGr71xHz9sRG
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Dec 2019 23:24:52 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB6CGuIP083055
 for <linuxppc-dev@ozlabs.org>; Fri, 6 Dec 2019 07:24:50 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wq2xd4a82-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 06 Dec 2019 07:24:50 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Fri, 6 Dec 2019 12:24:48 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 6 Dec 2019 12:24:45 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB6COiZI55312510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Dec 2019 12:24:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37E374C04A;
 Fri,  6 Dec 2019 12:24:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 950D44C044;
 Fri,  6 Dec 2019 12:24:42 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.191])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  6 Dec 2019 12:24:42 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v4 2/6] sysfs: wrap __compat_only_sysfs_link_entry_to_kobj
 function to change the symlink name
Date: Fri,  6 Dec 2019 17:54:30 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
References: <20191206122434.29587-1-sourabhjain@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 19120612-4275-0000-0000-0000038C6157
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120612-4276-0000-0000-000038A00A09
Message-Id: <20191206122434.29587-3-sourabhjain@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-06_03:2019-12-05,2019-12-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 spamscore=0 suspectscore=1 malwarescore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912060105
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

This patch adds a wrapper function create_sysfs_symlink_entry_to_kobj that
extends the __compat_only_sysfs_link_entry_to_kobj functionality which
allows function caller to customize the symlink name.

Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 fs/sysfs/group.c      | 28 +++++++++++++++++++++++++---
 include/linux/sysfs.h | 12 ++++++++++++
 2 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index d41c21fef138..5eb38145b957 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -424,6 +424,25 @@ EXPORT_SYMBOL_GPL(sysfs_remove_link_from_group);
 int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
 				      struct kobject *target_kobj,
 				      const char *target_name)
+{
+	return create_sysfs_symlink_entry_to_kobj(kobj, target_kobj,
+						target_name, NULL);
+}
+EXPORT_SYMBOL_GPL(__compat_only_sysfs_link_entry_to_kobj);
+
+/**
+ * create_sysfs_symlink_entry_to_kobj - add a symlink to a kobject pointing
+ * to a group or an attribute
+ * @kobj:		The kobject containing the group.
+ * @target_kobj:	The target kobject.
+ * @target_name:	The name of the target group or attribute.
+ * @symlink_name:	The name of the symlink file (target_name will be
+ *			considered if symlink_name is NULL).
+ */
+int create_sysfs_symlink_entry_to_kobj(struct kobject *kobj,
+				       struct kobject *target_kobj,
+				       const char *target_name,
+				       const char *symlink_name)
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
+EXPORT_SYMBOL_GPL(create_sysfs_symlink_entry_to_kobj);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 5420817ed317..123c6f10333a 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -300,6 +300,10 @@ void sysfs_remove_link_from_group(struct kobject *kobj, const char *group_name,
 int __compat_only_sysfs_link_entry_to_kobj(struct kobject *kobj,
 				      struct kobject *target_kobj,
 				      const char *target_name);
+int create_sysfs_symlink_entry_to_kobj(struct kobject *kobj,
+				       struct kobject *target_kobj,
+				       const char *target_name,
+				       const char *symlink_name);
 
 void sysfs_notify(struct kobject *kobj, const char *dir, const char *attr);
 
@@ -508,6 +512,14 @@ static inline int __compat_only_sysfs_link_entry_to_kobj(
 	return 0;
 }
 
+static int create_sysfs_symlink_entry_to_kobj(struct kobject *kobj,
+					      struct kobject *target_kobj,
+					      const char *target_name,
+					      const char *symlink_name)
+{
+	return 0;
+}
+
 static inline void sysfs_notify(struct kobject *kobj, const char *dir,
 				const char *attr)
 {
-- 
2.17.2

