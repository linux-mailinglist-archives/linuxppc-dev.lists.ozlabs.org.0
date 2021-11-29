Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B035C461CF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Nov 2021 18:47:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J2t8P3xgKz3cT0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 04:47:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WDPlAQQw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WDPlAQQw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J2t7j48glz2yHM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 04:46:25 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1ATGudfP018361; 
 Mon, 29 Nov 2021 17:46:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=JeswOe4blNTznbkcicvetAuiyUveaKCgqHtVj1VAfTU=;
 b=WDPlAQQwwvHrNvtLBIMCOPsCUBBpEvjjc4aF5rGFM54pJDGkK4sMstmr5q4b0Zu94FVD
 JfXM4TCqMLAr5n+OP9TKGSYZARZ24tGx4YHK+bqUSkcwJFhRYmc+TQnJdd9m3NC5Fa38
 pAjuzs7zY8K0InIOGNK2OvNBn2Ll33FL6g9rWD9YoDXr181gcY4AoIO5+e1Yi0MI+RM0
 7jjSn63JVu5aK6BoQkn9+IWQtQ/S6aFdrZmDXmwm9x+HpN0OYABHg1yCQWmlmlWKDbqQ
 NNsdysLNyVpMkg1XqjVkLeOWshD6kRRJy0ugShzWBgYo3g5tiTLeRAEUsreQGMceLFki 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn2u117qn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:46:18 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1ATHkISU019320;
 Mon, 29 Nov 2021 17:46:18 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cn2u117q2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:46:18 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1ATHhtWd021262;
 Mon, 29 Nov 2021 17:46:16 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3ckcaa8124-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 29 Nov 2021 17:46:16 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1ATHkGlC33096088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 29 Nov 2021 17:46:16 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBCE56A061;
 Mon, 29 Nov 2021 17:46:15 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6D5B6A057;
 Mon, 29 Nov 2021 17:46:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 29 Nov 2021 17:46:14 +0000 (GMT)
Message-ID: <7f8eb95b6aa2e52b5844e1546892938c27a23b65.camel@linux.ibm.com>
Subject: [PATCH 01/10] powerpc/pseries/vas: Use common names in VAS
 capability structure
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 29 Nov 2021 09:46:12 -0800
In-Reply-To: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
References: <a2187018b4e030fe6c7e408b3a73c37c85472e10.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: rIrQFIufsCyT9javiAbKD3NZMawJzvVT
X-Proofpoint-ORIG-GUID: BeACd15Rankx2VWbhkVVLU-geB8TrWNv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-29_10,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111290082
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
index b043e3936d21..ecdd21f517c0 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -303,8 +303,8 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 
 	cop_feat_caps = &caps->caps;
 
-	if (atomic_inc_return(&cop_feat_caps->used_lpar_creds) >
-			atomic_read(&cop_feat_caps->target_lpar_creds)) {
+	if (atomic_inc_return(&cop_feat_caps->used_creds) >
+			atomic_read(&cop_feat_caps->target_creds)) {
 		pr_err("Credits are not available to allocate window\n");
 		rc = -EINVAL;
 		goto out;
@@ -378,7 +378,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	free_irq_setup(txwin);
 	h_deallocate_vas_window(txwin->vas_win.winid);
 out:
-	atomic_dec(&cop_feat_caps->used_lpar_creds);
+	atomic_dec(&cop_feat_caps->used_creds);
 	kfree(txwin);
 	return ERR_PTR(rc);
 }
@@ -438,7 +438,7 @@ static int vas_deallocate_window(struct vas_window *vwin)
 	}
 
 	list_del(&win->win_list);
-	atomic_dec(&caps->used_lpar_creds);
+	atomic_dec(&caps->used_creds);
 	mutex_unlock(&vas_pseries_mutex);
 
 	put_vas_user_win_ref(&vwin->task_ref);
@@ -514,7 +514,7 @@ static int get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
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


