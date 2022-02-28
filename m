Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 593744C63D6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 08:35:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6XGS31rVz3bbn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 18:35:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=teU0uEV7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=teU0uEV7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6XFk4Ybjz2xDM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Feb 2022 18:34:34 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21S5Z9KN025968; 
 Mon, 28 Feb 2022 07:34:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=CEg2X3ti0mL/kA3Ja7iG1zdikVF6ENaDUevtN3R4nKk=;
 b=teU0uEV7zggMXb2na+VwdazvYrxahBKDeJfi1dZo7kbNaMrah7kmhxhdWRlMAmOx7WgC
 fiwcIs8ndfLzcPI+xNQ2EpeZnOkjAXv/+n218f09hZsK3MFsX7fRMQ2/g75NR/7o6wov
 fGjP8Swd/+sVS4wDHM9wzSbs61m68X/UorK9NMlFXZWY6cdS5MwX71QxxoBsPu8173Wb
 QlKAuC1MSWtQtTeS+2WHlJoynjN32tRZxFI9lx+aSfju5xLy/JhbMNpW+KU55g2nvzYV
 0AfY7FWclXstKdl/dalXCmS1M6jEVEMtJzpYpW2X3tyFaTjawH0myoD4pJRjGpUg8liI Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egnuqdwj2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:34:30 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21S7Jw6v014765;
 Mon, 28 Feb 2022 07:34:29 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3egnuqdwhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:34:29 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21S7HIH6011012;
 Mon, 28 Feb 2022 07:34:28 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03wdc.us.ibm.com with ESMTP id 3efbu9hwj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Feb 2022 07:34:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21S7YO9u22806806
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Feb 2022 07:34:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 75B59C605F;
 Mon, 28 Feb 2022 07:34:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7133CC6055;
 Mon, 28 Feb 2022 07:34:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.161.44])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 28 Feb 2022 07:34:23 +0000 (GMT)
Message-ID: <f35fbb424668cff4e5a8eac348ad8809c3e62332.camel@linux.ibm.com>
Subject: [PATCH v5 1/9] powerpc/pseries/vas: Use common names in VAS
 capability structure
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 nathanl@linux.ibm.com
Date: Sun, 27 Feb 2022 23:34:21 -0800
In-Reply-To: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
References: <ccd9c0f85005c56b4d011d5c2384444ae71bda69.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8ZLkFYE1Zhu12W50EGQKUPKu8tRNjPxI
X-Proofpoint-ORIG-GUID: y2VZr-nMPgXQSn843nUej1DPgZlYjJBa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-28_02,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202280043
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


nr_total/nr_used_credits provides credits usage to user space
via sysfs and the same interface can be used on PowerNV in
future. Changed with proper naming so that applicable on both
pseries and PowerNV.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/platforms/pseries/vas.c | 10 +++++-----
 arch/powerpc/platforms/pseries/vas.h |  5 ++---
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index d243ddc58827..18aae037ffe9 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -310,8 +310,8 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 
 	cop_feat_caps = &caps->caps;
 
-	if (atomic_inc_return(&cop_feat_caps->used_lpar_creds) >
-			atomic_read(&cop_feat_caps->target_lpar_creds)) {
+	if (atomic_inc_return(&cop_feat_caps->nr_used_credits) >
+			atomic_read(&cop_feat_caps->nr_total_credits)) {
 		pr_err("Credits are not available to allocate window\n");
 		rc = -EINVAL;
 		goto out;
@@ -385,7 +385,7 @@ static struct vas_window *vas_allocate_window(int vas_id, u64 flags,
 	free_irq_setup(txwin);
 	h_deallocate_vas_window(txwin->vas_win.winid);
 out:
-	atomic_dec(&cop_feat_caps->used_lpar_creds);
+	atomic_dec(&cop_feat_caps->nr_used_credits);
 	kfree(txwin);
 	return ERR_PTR(rc);
 }
@@ -445,7 +445,7 @@ static int vas_deallocate_window(struct vas_window *vwin)
 	}
 
 	list_del(&win->win_list);
-	atomic_dec(&caps->used_lpar_creds);
+	atomic_dec(&caps->nr_used_credits);
 	mutex_unlock(&vas_pseries_mutex);
 
 	put_vas_user_win_ref(&vwin->task_ref);
@@ -521,7 +521,7 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	}
 	caps->max_lpar_creds = be16_to_cpu(hv_caps->max_lpar_creds);
 	caps->max_win_creds = be16_to_cpu(hv_caps->max_win_creds);
-	atomic_set(&caps->target_lpar_creds,
+	atomic_set(&caps->nr_total_credits,
 		   be16_to_cpu(hv_caps->target_lpar_creds));
 	if (feat == VAS_GZIP_DEF_FEAT) {
 		caps->def_lpar_creds = be16_to_cpu(hv_caps->def_lpar_creds);
diff --git a/arch/powerpc/platforms/pseries/vas.h b/arch/powerpc/platforms/pseries/vas.h
index 4ecb3fcabd10..d6ea8ab8b07a 100644
--- a/arch/powerpc/platforms/pseries/vas.h
+++ b/arch/powerpc/platforms/pseries/vas.h
@@ -72,9 +72,8 @@ struct vas_cop_feat_caps {
 	};
 	/* Total LPAR available credits. Can be different from max LPAR */
 	/* credits due to DLPAR operation */
-	atomic_t	target_lpar_creds;
-	atomic_t	used_lpar_creds; /* Used credits so far */
-	u16		avail_lpar_creds; /* Remaining available credits */
+	atomic_t	nr_total_credits;	/* Total credits assigned to LPAR */
+	atomic_t	nr_used_credits;	/* Used credits so far */
 };
 
 /*
-- 
2.27.0


