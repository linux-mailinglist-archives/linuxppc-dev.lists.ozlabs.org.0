Return-Path: <linuxppc-dev+bounces-7035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0605A6086D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 06:46:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDYJj1x42z3brN;
	Fri, 14 Mar 2025 16:46:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741931189;
	cv=none; b=DYVueOA1O2tE85fY4+VR8bl9RnDJymCfbFvvDGueIilTm+K3V7+is3sIRQMin4ha6w4fHw+1JC8nJwAcZC68pU4GEUz+jGfsbodVaw5pEwjE8YmWOJSsFs9OX5a3mHlW/a5ULKOQ+w72NNP/lex8wzmOTJhrgd/E/gHgh11kDUKUL+uoIf7NLgLW3ZQHHHoxfafBF6GMHED5CYi7eqJ4ud5p0RstuvZ9BV1vuyICrp3fAPx+O1mMin83eu8WrYOOjFgz0ZjDOdfdAq28uoXppuFdCAqXWTQUNG5d/43pqPRm/EMV3mHZ2/ZpSisVx73aFTDRquF0LunlsQClpJSeBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741931189; c=relaxed/relaxed;
	bh=rHiuokT753NlluXTPeZq8TFHySwH4S01ZogXJ3+Y+w0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJBb4tLcaP02Dw+xT/8651Nb9ph0FBVF8qYNlJBEfWwGQtozXBCZ3JpUsbJsA7VRrgEOnJmRrXSvRZDd28IebGvj61zQKIMSveI7KdmUqswE0B+llqXOYFheRI0hNTrTLvVe+xhI+LTe/N3dmm7Lai0d+479gdOylUWbDgAmDtac4ll3ZKxyjnd0jgKWISDHomZdVy1+5eXslUN9xOY4DifOlnlvGu9aqpdE0x9M4l87ewJSixQeNkyEhswVjkULhdj2kbEq6NvXZcBxws7TncqKADQZd7xn2+21NYWA4i8Vt/uYDxxrp2x5IC5roKQyAd+CAV/SGdNwgE5tjZe2iA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VaOKzo0G; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VaOKzo0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDYJh4p3Rz30gC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 16:46:28 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DNP1bY030636;
	Fri, 14 Mar 2025 05:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=rHiuokT753NlluXTP
	eZq8TFHySwH4S01ZogXJ3+Y+w0=; b=VaOKzo0GdpXRufdfxNuVB1cDGzh7EXbCf
	6N1SJsJ/1iekCMyWfkCvn6FueLWNVqX2c7coXP2v30sy+DNTmBnFeEN+tDQZIh8T
	AIBZ/5ekJV9JJIbGq2A3zXJLKfUsEM95SNTcGQwy0pyGxLP/BglQ5f5hP5bOziwG
	RSC0Ao7aDdh9vImD6AUS7qPvJs79esS7eTcTBsDS6dNSy7BnxgMiSYc0DC+pRGYI
	agQFMS9jMZBy/5J7z9JbcTZtmC/NUvrNPtJn7OB3FhEmrQnusIBtx1BWrhImBk1w
	YDmJyyKbUW1sbJ3vLZJvNnKse3/yuM6ljwNLJRguPxrurMqw+JWyg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8vf8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:17 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E5kHUo031530;
	Fri, 14 Mar 2025 05:46:17 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45byd8vf8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:17 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E42Xb6003181;
	Fri, 14 Mar 2025 05:46:16 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atstwes5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 05:46:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E5kCrE56885648
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 05:46:12 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD9732004B;
	Fri, 14 Mar 2025 05:46:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54AF820043;
	Fri, 14 Mar 2025 05:46:09 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.22.126])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 05:46:09 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, fbarrat@linux.ibm.com,
        ajd@linux.ibm.com, mahesh@linux.ibm.com, oohall@gmail.com,
        hbathini@linux.ibm.com, dhowells@redhat.com, haren@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] powerpc: rtas: use lock guard for mutex
Date: Fri, 14 Mar 2025 11:15:40 +0530
Message-ID: <20250314054544.1998928-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250314054544.1998928-1-sshegde@linux.ibm.com>
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: IBlATTYsNKDMT8dsNglSO243_h1UCjor
X-Proofpoint-ORIG-GUID: GLkJoCAn9DenybbOgYEdK--V0EnxENV3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_01,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140041
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

use guard(mutex) for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/kernel/rtas_flash.c | 64 ++++++++++----------------------
 1 file changed, 20 insertions(+), 44 deletions(-)

diff --git a/arch/powerpc/kernel/rtas_flash.c b/arch/powerpc/kernel/rtas_flash.c
index 5407024881e5..583dc16e9d3c 100644
--- a/arch/powerpc/kernel/rtas_flash.c
+++ b/arch/powerpc/kernel/rtas_flash.c
@@ -312,13 +312,13 @@ static ssize_t rtas_flash_write(struct file *file, const char __user *buffer,
 {
 	struct rtas_update_flash_t *const uf = &rtas_update_flash_data;
 	char *p;
-	int next_free, rc;
+	int next_free;
 	struct flash_block_list *fl;
 
-	mutex_lock(&rtas_update_flash_mutex);
+	guard(mutex)(&rtas_update_flash_mutex);
 
 	if (uf->status == FLASH_AUTH || count == 0)
-		goto out;	/* discard data */
+		return count;	/* discard data */
 
 	/* In the case that the image is not ready for flashing, the memory
 	 * allocated for the block list will be freed upon the release of the 
@@ -327,7 +327,7 @@ static ssize_t rtas_flash_write(struct file *file, const char __user *buffer,
 	if (uf->flist == NULL) {
 		uf->flist = kmem_cache_zalloc(flash_block_cache, GFP_KERNEL);
 		if (!uf->flist)
-			goto nomem;
+			return -ENOMEM;
 	}
 
 	fl = uf->flist;
@@ -338,7 +338,7 @@ static ssize_t rtas_flash_write(struct file *file, const char __user *buffer,
 		/* Need to allocate another block_list */
 		fl->next = kmem_cache_zalloc(flash_block_cache, GFP_KERNEL);
 		if (!fl->next)
-			goto nomem;
+			return -ENOMEM;
 		fl = fl->next;
 		next_free = 0;
 	}
@@ -347,25 +347,17 @@ static ssize_t rtas_flash_write(struct file *file, const char __user *buffer,
 		count = RTAS_BLK_SIZE;
 	p = kmem_cache_zalloc(flash_block_cache, GFP_KERNEL);
 	if (!p)
-		goto nomem;
+		return -ENOMEM;
 	
 	if(copy_from_user(p, buffer, count)) {
 		kmem_cache_free(flash_block_cache, p);
-		rc = -EFAULT;
-		goto error;
+		return -EFAULT;
 	}
 	fl->blocks[next_free].data = p;
 	fl->blocks[next_free].length = count;
 	fl->num_blocks++;
-out:
-	mutex_unlock(&rtas_update_flash_mutex);
-	return count;
 
-nomem:
-	rc = -ENOMEM;
-error:
-	mutex_unlock(&rtas_update_flash_mutex);
-	return rc;
+	return count;
 }
 
 /*
@@ -405,19 +397,18 @@ static ssize_t manage_flash_write(struct file *file, const char __user *buf,
 	static const char reject_str[] = "0";
 	static const char commit_str[] = "1";
 	char stkbuf[10];
-	int op, rc;
+	int op;
 
-	mutex_lock(&rtas_manage_flash_mutex);
+	guard(mutex)(&rtas_manage_flash_mutex);
 
 	if ((args_buf->status == MANAGE_AUTH) || (count == 0))
-		goto out;
+		return count;
 		
 	op = -1;
 	if (buf) {
 		if (count > 9) count = 9;
-		rc = -EFAULT;
 		if (copy_from_user (stkbuf, buf, count))
-			goto error;
+			return -EFAULT;
 		if (strncmp(stkbuf, reject_str, strlen(reject_str)) == 0) 
 			op = RTAS_REJECT_TMP_IMG;
 		else if (strncmp(stkbuf, commit_str, strlen(commit_str)) == 0) 
@@ -425,18 +416,11 @@ static ssize_t manage_flash_write(struct file *file, const char __user *buf,
 	}
 	
 	if (op == -1) {   /* buf is empty, or contains invalid string */
-		rc = -EINVAL;
-		goto error;
+		return -EINVAL;
 	}
 
 	manage_flash(args_buf, op);
-out:
-	mutex_unlock(&rtas_manage_flash_mutex);
 	return count;
-
-error:
-	mutex_unlock(&rtas_manage_flash_mutex);
-	return rc;
 }
 
 /*
@@ -499,16 +483,14 @@ static ssize_t validate_flash_write(struct file *file, const char __user *buf,
 {
 	struct rtas_validate_flash_t *const args_buf =
 		&rtas_validate_flash_data;
-	int rc;
 
-	mutex_lock(&rtas_validate_flash_mutex);
+	guard(mutex)(&rtas_validate_flash_mutex);
 
 	/* We are only interested in the first 4K of the
 	 * candidate image */
 	if ((*off >= VALIDATE_BUF_SIZE) || 
 		(args_buf->status == VALIDATE_AUTH)) {
 		*off += count;
-		mutex_unlock(&rtas_validate_flash_mutex);
 		return count;
 	}
 
@@ -519,20 +501,14 @@ static ssize_t validate_flash_write(struct file *file, const char __user *buf,
 		args_buf->status = VALIDATE_INCOMPLETE;
 	}
 
-	if (!access_ok(buf, count)) {
-		rc = -EFAULT;
-		goto done;
-	}
-	if (copy_from_user(args_buf->buf + *off, buf, count)) {
-		rc = -EFAULT;
-		goto done;
-	}
+	if (!access_ok(buf, count))
+		return -EFAULT;
+
+	if (copy_from_user(args_buf->buf + *off, buf, count))
+		return -EFAULT;
 
 	*off += count;
-	rc = count;
-done:
-	mutex_unlock(&rtas_validate_flash_mutex);
-	return rc;
+	return count;
 }
 
 static int validate_flash_release(struct inode *inode, struct file *file)
-- 
2.39.3


