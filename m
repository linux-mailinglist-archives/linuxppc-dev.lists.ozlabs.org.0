Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F183836E5F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 18:51:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=na3zs/SB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJd7x1ctMz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 04:51:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=na3zs/SB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJd5R4054z3brc
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 04:49:31 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40MHTuAd004239;
	Mon, 22 Jan 2024 17:49:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qyDB3MUGpiqwHmFDZQYonWrl45UOQmMx3+ebuJTdasw=;
 b=na3zs/SBIIK0E9HV0MK2minHOi+C4UdBnZqpcJPqkJvHyjefvZOtCr8h2yOl0rUIRn/P
 nzFsykyUHFpJPFnD1IAc9kXEKRKb8bTppE3VHBo+LqVhCtNOxp5lG235mUpBigSTJG3F
 LEze+7L7bBqU5FO4fcHP4hQWsP9P1IokfZBPSqUuM0rbfWIj+2dMtLGS0A51iMaT1f9t
 nOlCz84TuWFrt3B4Rq+5F0lK/rdyIXM+p07RRYtxKk2BTMAk76/BIzyADqplsPENpz/W
 SHYjA01G8JJJmCp5PzWkKQ+4TWL4HYOC4wlbXmHMHR8all9izUPRQnb+bW+6yEW5fGom 2Q== 
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vstkfdt4s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:49:21 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40MGFaSN022510;
	Mon, 22 Jan 2024 17:49:20 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vrt0kt2mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:49:20 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40MHnIAX15860470
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jan 2024 17:49:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2E4020043;
	Mon, 22 Jan 2024 17:49:18 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0003A20040;
	Mon, 22 Jan 2024 17:49:15 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.ibm.com.com (unknown [9.43.53.45])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Jan 2024 17:49:15 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        linux-xfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 2/4] xfs: remove duplicate ifdefs
Date: Mon, 22 Jan 2024 23:19:02 +0530
Message-Id: <20240122174904.178594-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240122174904.178594-1-sshegde@linux.ibm.com>
References: <20240122174904.178594-1-sshegde@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hnGm0V7dji-YQfItNaSxH8to-qPFXDCc
X-Proofpoint-GUID: hnGm0V7dji-YQfItNaSxH8to-qPFXDCc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_07,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=816
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0
 mlxscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2401220124
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
Cc: peterz@infradead.org, sshegde@linux.ibm.com, djwong@kernel.org, mingo@kernel.org, anton@tuxera.com, chandan.babu@oracle.com
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

In the xfs code two such patterns were seen. Hence removing these ifdefs.
No functional change is intended here. It only aims to improve code
readability.

Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 fs/xfs/xfs_sysfs.c | 4 ----
 1 file changed, 4 deletions(-)

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

