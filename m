Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DE6F3836E67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jan 2024 18:52:34 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rPYZGmvR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TJd8w5qflz3dDk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 04:52:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rPYZGmvR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TJd5X45fKz3c5q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 04:49:36 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40MHekUM030654;
	Mon, 22 Jan 2024 17:49:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KeUg6p5geUeb/5YLtDehZnb7ENy/rqnJYmLETJS5zEA=;
 b=rPYZGmvRvTrSHy9pog3AK8894pa5fARralnW3DykbaPMoOhYZWVGgig7PdCzzWW89nwq
 QIVIL5I4/A+YkywssC2RRMyro5StnWvwIztSlR7nV14dkzmBa/+0vpQtRaPcRUpvhfkk
 ylylfah7CqqehKiJuk6AArKSYPK5XiKIwGjDyNzXOwBvlR2LUKalyYzJy5DbYNcKtcYI
 yzu9hLWLqe2vpZSf4OhVGlLfUXJQ1BvqK1n7JFXwKwg9+ECZzkjARtuqK2Ner8oE29aY
 v/lX3vTD3A4ZwoZ+dqcmUkT7BVGGCxbZhbJKkpF18KFkjin7x2+vYHaXcwyPkR8TKbKs FQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vsurfa5q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:49:25 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40MHA9CN025298;
	Mon, 22 Jan 2024 17:49:24 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vrtqk1uqp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jan 2024 17:49:24 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40MHnMpm16974504
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 22 Jan 2024 17:49:22 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6DB262004F;
	Mon, 22 Jan 2024 17:49:22 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EEB12005A;
	Mon, 22 Jan 2024 17:49:20 +0000 (GMT)
Received: from li-c1fdab4c-355a-11b2-a85c-ef242fe9efb4.ibm.com.com (unknown [9.43.53.45])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 22 Jan 2024 17:49:19 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linux-kernel@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
        linux-xfs@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH v2 3/4] ntfs: remove duplicate ifdefs
Date: Mon, 22 Jan 2024 23:19:03 +0530
Message-Id: <20240122174904.178594-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20240122174904.178594-1-sshegde@linux.ibm.com>
References: <20240122174904.178594-1-sshegde@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XeEMsl10Wmu77LMj_tWv9LOPZ8Y6ZYBd
X-Proofpoint-GUID: XeEMsl10Wmu77LMj_tWv9LOPZ8Y6ZYBd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-22_07,2024-01-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 mlxscore=0
 mlxlogscore=841 adultscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

In the ntfs code, one such pattern was seen. Hence remove that duplicate
ifdef.
No functional change is intended here. It only aims to improve code
readability.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 fs/ntfs/inode.c | 2 --
 1 file changed, 2 deletions(-)

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
--
2.39.3

