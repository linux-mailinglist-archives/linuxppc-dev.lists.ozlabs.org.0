Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AA1496611
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 20:55:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgVTk3QFWz3bWG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 06:55:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lUpt8dRX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lUpt8dRX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgVSz4sD4z2ywt
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 06:54:27 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LHBhdZ034264; 
 Fri, 21 Jan 2022 19:54:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=RWbT4GFBLT5YvOLJ5FvYn6KXzpaeQWI2x0etT4s5y4I=;
 b=lUpt8dRXcnKAdIuKM984WwsBqy03X8bKfc1XPDijGG9s2vt0t6iEcyuX60l7hll9x9V5
 pHBWX5zTfQYfL4cpZ4LfwT1ECclKi4GbfoZdXH/TJo1M9wUgDnlJWCVdEANOMBORVP3o
 tQsiDTktgFFYPI6HjTQZyfCfrBDVe5u76mk2zuvSSgFRWq940jlUXszT/H7J6paXltbq
 /UJS5x1DBTf9AcsLQpas51y1d4WVc/RY/Fl5spehh/kkc1D2C28k8vY6MA0ReBoh3q3+
 4PRvljq7uvwhsCYGe+OBBpleHsfmJ3weqH4bYS13CS8SgZxjaqP91WvQesR4k3UXwNtl RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr10xb4cg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:54:23 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LJjBhK030515;
 Fri, 21 Jan 2022 19:54:23 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr10xb4c7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:54:22 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LJqfWm002850;
 Fri, 21 Jan 2022 19:54:22 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 3dqjaxx6h2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:54:22 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LJsKCQ15336156
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 19:54:20 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB48F6E04E;
 Fri, 21 Jan 2022 19:54:20 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A02386E056;
 Fri, 21 Jan 2022 19:54:19 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 19:54:19 +0000 (GMT)
Message-ID: <1de60767b71bcc714cf613ff8f660afc430a0720.camel@linux.ibm.com>
Subject: [PATCH v3 01/10] powerpc/pseries/vas: Use common names in VAS
 capability structure
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Fri, 21 Jan 2022 11:54:17 -0800
In-Reply-To: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rQe5__kn3w-ic42DJdZQdZyMjR49yzN2
X-Proofpoint-GUID: jTr6Nzs5imbCTn4ImtTuU4qxULOzfJTP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 spamscore=0 adultscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201210127
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


target/used/avail_creds provides credits usage to user space via
sysfs and the same interface can be used on PowerNV in future.
Remove "lpar" from these names so that applicable on both PowerVM
and PowerNV.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 10 +++++-----
 arch/powerpc/platforms/pseries/vas.h |  6 +++---
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index d243ddc58827..c0737379cc7b 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -310,8 +310,8 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 
 	cop_feat_caps = &caps->caps;
 
-	if (atomic_inc_return(&cop_feat_caps->used_lpar_creds) >
-			atomic_read(&cop_feat_caps->target_lpar_creds)) {
+	if (atomic_inc_return(&cop_feat_caps->used_creds) >
+			atomic_read(&cop_feat_caps->target_creds)) {
 		pr_err("Credits are not available to allocate window\n");
 		rc = -EINVAL;
 		goto out;
@@ -385,7 +385,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	free_irq_setup(txwin);
 	h_deallocate_vas_window(txwin->vas_win.winid);
 out:
-	atomic_dec(&cop_feat_caps->used_lpar_creds);
+	atomic_dec(&cop_feat_caps->used_creds);
 	kfree(txwin);
 	return ERR_PTR(rc);
 }
@@ -445,7 +445,7 @@ static int vas_deallocate_window(struct vas_window *vwin)
 	}
 
 	list_del(&win->win_list);
-	atomic_dec(&caps->used_lpar_creds);
+	atomic_dec(&caps->used_creds);
 	mutex_unlock(&vas_pseries_mutex);
 
 	put_vas_user_win_ref(&vwin->task_ref);
@@ -521,7 +521,7 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	}
 	caps->max_lpar_creds = be16_to_cpu(hv_caps->max_lpar_creds);
 	caps->max_win_creds = be16_to_cpu(hv_caps->max_win_creds);
-	atomic_set(&caps->target_lpar_creds,
+	atomic_set(&caps->target_creds,
 		   be16_to_cpu(hv_caps->target_lpar_creds));
 	if (feat == VAS_GZIP_DEF_FEAT) {
 		caps->def_lpar_creds = be16_to_cpu(hv_caps->def_lpar_creds);
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 4ecb3fcabd10..fa7ce74f1e49 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -72,9 +72,9 @@ struct vas_cop_feat_caps {
 	};
 	/* Total LPAR available credits. Can be different from max LPAR */
 	/* credits due to DLPAR operation */
-	atomic_t	target_lpar_creds;
-	atomic_t	used_lpar_creds; /* Used credits so far */
-	u16		avail_lpar_creds; /* Remaining available credits */
+	atomic_t	target_creds;
+	atomic_t	used_creds;	/* Used credits so far */
+	u16		avail_creds;	/* Remaining available credits */
 };
 
 /*
-- 
2.27.0


