Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 097C28320C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 22:15:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hid5dLq6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGFs46gZpz3cSQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 08:15:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hid5dLq6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TFwJB2hWFz3bZK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jan 2024 19:04:26 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40I7wJRJ031217;
	Thu, 18 Jan 2024 08:04:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hnQzzb54EB6Nik9tA08SsWOYd/w2z1oIWszr1RROCZM=;
 b=hid5dLq6gdY3ewwsoy3mFW75v5sJh8x7pTlvEjBuWIzEh60czM6udDXOOPvZZVDf/+3l
 sdh1GZO6e2J70Q4cRDwNlr+3TllFAwglsYRGWTERLiEUfosEKeAe1W6nYPGuCgm5V6bz
 exfymJ6ZnJw3TJAeJehGNcl4kyXd82CkwSFlcltwWoIv+7qFWepcQdfljSgwa55IzUbi
 2+Jdr9yVmk/RLDCpU4wZFKgyKVll/QCvAOt106bJmZDKnTzXm7tBi7UqjTdX2+7PVNAb
 lOn+M7iLeKu7ERM6PNVWu7ig/86eO2Wcgv89PlPeKrykb4GdPXShLESpYAHXY3tHU72l gg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vq02f86hj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 08:04:11 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40I72xol000441;
	Thu, 18 Jan 2024 08:04:10 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vm4ut2bda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Jan 2024 08:04:10 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40I848TM15008286
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Jan 2024 08:04:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D570C2004B;
	Thu, 18 Jan 2024 08:04:08 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C712020043;
	Thu, 18 Jan 2024 08:04:06 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.in.ibm.com (unknown [9.109.201.126])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 18 Jan 2024 08:04:06 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        linux-xfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 2/3] fs: remove duplicate ifdefs
Date: Thu, 18 Jan 2024 13:33:25 +0530
Message-Id: <20240118080326.13137-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240118080326.13137-1-sshegde@linux.ibm.com>
References: <20240118080326.13137-1-sshegde@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: P-8pNzrwHJ2K49DWfj4Oc0tgPfJY7qbK
X-Proofpoint-GUID: P-8pNzrwHJ2K49DWfj4Oc0tgPfJY7qbK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-18_04,2024-01-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 mlxscore=0 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401180056
X-Mailman-Approved-At: Fri, 19 Jan 2024 08:12:35 +1100
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
Cc: peterz@infradead.org, sshegde@linux.ibm.com, mingo@kernel.org, anton@tuxera.com, chandan.babu@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

when a ifdef is used in the below manner, second one could be considered as
duplicate.

ifdef DEFINE_A
...code block...
ifdef DEFINE_A
...code block...
endif
...code block...
endif

There are few places in fs code where above pattern was seen.
No functional change is intended here. It only aims to improve code
readability.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 fs/ntfs/inode.c    | 2 --
 fs/xfs/xfs_sysfs.c | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/fs/ntfs/inode.c b/fs/ntfs/inode.c
index aba1e22db4e9..d2c8622d53d1 100644
--- a/fs/ntfs/inode.c
+++ b/fs/ntfs/inode.c
@@ -2859,11 +2859,9 @@ int ntfs_truncate(struct inode *vi)
  *
  * See ntfs_truncate() description above for details.
  */
-#ifdef NTFS_RW
 void ntfs_truncate_vfs(struct inode *vi) {
 	ntfs_truncate(vi);
 }
-#endif

 /**
  * ntfs_setattr - called from notify_change() when an attribute is being changed
diff --git a/fs/xfs/xfs_sysfs.c b/fs/xfs/xfs_sysfs.c
index 17485666b672..d2391eec37fe 100644
--- a/fs/xfs/xfs_sysfs.c
+++ b/fs/xfs/xfs_sysfs.c
@@ -193,7 +193,6 @@ always_cow_show(
 }
 XFS_SYSFS_ATTR_RW(always_cow);

-#ifdef DEBUG
 /*
  * Override how many threads the parallel work queue is allowed to create.
  * This has to be a debug-only global (instead of an errortag) because one of
@@ -260,7 +259,6 @@ larp_show(
 	return snprintf(buf, PAGE_SIZE, "%d\n", xfs_globals.larp);
 }
 XFS_SYSFS_ATTR_RW(larp);
-#endif /* DEBUG */

 STATIC ssize_t
 bload_leaf_slack_store(
@@ -319,10 +317,8 @@ static struct attribute *xfs_dbg_attrs[] = {
 	ATTR_LIST(log_recovery_delay),
 	ATTR_LIST(mount_delay),
 	ATTR_LIST(always_cow),
-#ifdef DEBUG
 	ATTR_LIST(pwork_threads),
 	ATTR_LIST(larp),
-#endif
 	ATTR_LIST(bload_leaf_slack),
 	ATTR_LIST(bload_node_slack),
 	NULL,
--
2.39.3

