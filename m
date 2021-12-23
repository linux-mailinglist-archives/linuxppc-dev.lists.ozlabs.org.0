Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DA747DBF7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 01:25:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JK9vz6RdVz3cNV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 11:25:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IQwS9riD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=IQwS9riD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JK9vF0SX8z2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 11:25:12 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BMMfnMq023788; 
 Thu, 23 Dec 2021 00:25:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=JeswOe4blNTznbkcicvetAuiyUveaKCgqHtVj1VAfTU=;
 b=IQwS9riDUdHyzJGkcrRCIo2kvUpmASXLyoMuTom57YAYNeZi6vQfZ06Z/A8OJE/3YlOu
 k8/m3rf2A5AX29DcSd6Wiy39hk10Um4e3SaTfhQr6sqaTGc09X8OjrUA57hodi5ZGgao
 3yZ45DSObkbS1edF5D0B5TMz96DYpPF79P8gq6G11aG67Y91PKR3DD+ki4iKnrD9ICDq
 x9WCh3jy2RW/4BmDhpawP2WBPRglmz8UfjJDlroy6x0muWYLqOh/wQG4lEE2q0YBwMS/
 YgwwWsNCUdqLH4h9JuD3Ur8+U9fzKB2kaBisqqsFixXpb99NqHFSZ21Z88/I8XmUOJom 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4d1khcb4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:25:07 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BN0P75Y002682;
 Thu, 23 Dec 2021 00:25:07 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3d4d1khcau-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:25:07 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BN0C2Wn003270;
 Thu, 23 Dec 2021 00:25:06 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma01dal.us.ibm.com with ESMTP id 3d179cbgh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Dec 2021 00:25:06 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BN0P5WB20578768
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Dec 2021 00:25:05 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B112CAE05F;
 Thu, 23 Dec 2021 00:25:05 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A971FAE066;
 Thu, 23 Dec 2021 00:25:04 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.90.83])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 Dec 2021 00:25:04 +0000 (GMT)
Message-ID: <85f0e64cea546994eaf1834904ebafe243653835.camel@linux.ibm.com>
Subject: [PATCH v2 01/10] powerpc/pseries/vas: Use common names in VAS
 capability structure
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Wed, 22 Dec 2021 16:25:02 -0800
In-Reply-To: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
References: <9d1730d5e0daf39ef17196b4699294dc2ccf4a63.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0GtpZ0MDqO1S7_B-7GhYc598c5Ss9MFD
X-Proofpoint-GUID: 4IZgUrDxdEa7BGD-y2EFaNZ4Jo7qZ7WY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-22_09,2021-12-22_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112220124
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


