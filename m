Return-Path: <linuxppc-dev+bounces-8281-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4222BAA8D84
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 09:54:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrYh86Hjcz2ySV;
	Mon,  5 May 2025 17:54:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746431656;
	cv=none; b=e/OMDaODJsNDE7prZPTg8kAghvokTx8mzDKPOfaaXi9AXW77hWRQLWGHIoOpryiHfeA/XI5CbxEwjvyXFUiA9sYaYY2/+tY7nmGDYgveT89o49kEQuYsIrzFVELmDE9f/pBNEwBlRgJ9OEmnEOlrTnhTh/UIUG7PFg0CTT3f0fITWAHXdba89/S0oFV8y9nX//AvyDBXYT/ZQ6IOHuVmBrphOrySmtfsTVhmAndMgqCM/2Xh7GUowpyudP8sCYOAU83N/NVHNAIn0DZmtnvh7Q4XKE8wpo+rAqsMNQ1Ub4x2QLKRmupuPuuDSIVm29EmlmYbHkHFAiF8iWmajytkzA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746431656; c=relaxed/relaxed;
	bh=NPinY9SWU/ee+3fIrz7XxUVDSyaoAqVvptH07eohCDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gBYqStW3u3Sn0s0IhMnCnRJTu/qGrN/in0OnQRTBswxeLw+rvdTaL3ECwYL0bCToaSGg7A36QTqd0+q1iR+60h62n9luz/KJSls3pvPleIWD8WgGXXKBMGDO1Eo6JLG4PXelr1mqsut9xV8Y3ssh/Gz8jdzisQySkx4B9zJZDo/w/DIRXjdrSGvQJQ/GfRYA6+fVyV0DSFWjrLBzx3B58auxA74i5jA/h2hQwH+9o1s9ct6Cfju/bxOa9lag0Qoja1UY1nFOQdBBvm9ajoX/23G7PyfpGgS3KDuAulpaeTVCq1npSqdX0QnmGhWE8n+B1N21pSzyfYPWp6/JF4QcNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hmxpujyn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hmxpujyn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrYh81bLSz2ykc
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 17:54:15 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5450Lt5e001204;
	Mon, 5 May 2025 07:54:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=NPinY9SWU/ee+3fIr
	z7XxUVDSyaoAqVvptH07eohCDs=; b=hmxpujynEfv0dKg7T1hQ2F7EbGO5tljFZ
	HzJQ8KjpMGLyZcZu8KI+c82315VjglIFoMqbzR8hJimlsagzHQX+PlyWY+YIRvxn
	xN7eA3scASgwmJfCkawcoAaYW+1gI0v5anifS3in0ejTQ07hwInRlIP+Ac1m4D/q
	mUa/OOx5Y5vhbSZkOG5QjzjzAW1enchr4AXeGkUjGLGtnh8S63i6stEPm48F8eVW
	h430XVIF6gb2izNZS3Gx3MkQjHrDPPHC+/Sie82+H85JbX656T5MCqYTmMbB9lzo
	bUV76kIvXoK6ecgjTCWXVoqoqQcJyqWkiLuy7HWpbmdsmwmLO59AQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv1pnj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:03 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457s3EJ009468;
	Mon, 5 May 2025 07:54:03 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46egcv1pnd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:03 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5457bA5F025798;
	Mon, 5 May 2025 07:54:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dwuynbgk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:54:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457rw0K45613348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:53:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8ABE120043;
	Mon,  5 May 2025 07:53:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FD3320040;
	Mon,  5 May 2025 07:53:56 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:53:56 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org, Srikar Dronamraju <srikar@linux.ibm.com>
Subject: [PATCH v3 2/6] powerpc: rtas: use lock guard for mutex
Date: Mon,  5 May 2025 13:23:29 +0530
Message-ID: <20250505075333.184463-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250505075333.184463-1-sshegde@linux.ibm.com>
References: <20250505075333.184463-1-sshegde@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 4HDF4L-lSy4qP-TFiQP88WM2ogPnKmBW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfX6ghuW/Kv5mM2 sGyS/iMjM6g3nMBeDbxMJcZ7GIcbfv0B59Y2+coGCeiMaWq1fRvAh9/dBEQKmsqkMEZepnj+wav FdW3HnPq5TP+Dp5SHEMA6QzuS+aO0q02poyTPprecq53mr/iyfUhoy4uIB8+xX+PUlhy85cDgNO
 qSR6XgFl6wsh2uM21ALqsqW1s2pKgX6oXdC7kB+x3qwZQc7LhP/763QMAf4EKD8TlZx2nqVwnqU akhhusFF8APLABd7AwJnRaAHJw236Uou3BJvwYnVaVF8JjsUhu4AmNXEdEqX7n7Lfw2QwO6eiMI UibIjlbbvD1SJo2JhEFNB8V+Eeff88noxL40PoZG/0CLMYQujD5U5WrxoHmSt73qOPl+8vrEJEU
 z1C6vb8FssUSvPzVO71i5dyfwz4lvMj9FErrsl0SrOLKW0DDLGNbFAGQ4o3XgfNEQCKMPAHK
X-Authority-Analysis: v=2.4 cv=O7k5vA9W c=1 sm=1 tr=0 ts=68186e9b cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=OdULV7RJbOULiY8P7fIA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: ltOn1sfTTvZKo7nz7YaoKvsGFJvl7jXC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

use guard(mutex) for scope based resource management of mutex.
This would make the code simpler and easier to maintain.

More details on lock guards can be found at
https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>
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


