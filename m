Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2C5710E73
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 16:35:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRrFh44QKz3fD2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 00:35:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F3zxfIxy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F3zxfIxy;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRrDq0z7Zz3bYW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 00:35:06 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34PEJdM1009458;
	Thu, 25 May 2023 14:34:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=A9y06tLKB9AeqdOzQUFfHb+m0cQE2VAMLEpNd/51LlU=;
 b=F3zxfIxyILvksQGFGXbdybi40p96jJfU656mgWzoPokC3u96Pn7W9TJ+3REZMzC8SaIs
 vFobslSHI18NDxY5MUYN+cNERwgvkflOJWxfqOsnuEUJpvw8XUKl7xJWtOys/g3eHAyt
 49VVRUu/jFnaQh7jTfGSoV42Uf7LguUm/SaPTDChHnFGkQvIejXj0GJkKA1o7WWbhI1V
 B021sbu3peQanqPDRgp0+N1GX0WrFSOErBoGVgUTX1rw7ZOcfuar2tNBOSVdIbiVwaXv
 kAeFHA48/dBGx4RUg2ic84rsS006M8umtQE1quM3bb4TYnxG1ENbgcRduFapt17YWMke Mw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qt98p8krm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 14:34:58 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34PCoFdc016415;
	Thu, 25 May 2023 14:34:57 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([9.208.129.117])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3qppdt9y9x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 14:34:57 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 34PEYujO3736076
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 May 2023 14:34:56 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0B8FB58063;
	Thu, 25 May 2023 14:34:56 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56ECC5803F;
	Thu, 25 May 2023 14:34:55 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.28.114])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 May 2023 14:34:55 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc/iommu: limit number of TCEs to 512 for H_STUFF_TCE hcall
Date: Thu, 25 May 2023 09:34:54 -0500
Message-Id: <20230525143454.56878-1-gbatra@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AfSXXKHJPoTM8DlJFBip_lETp_g9mc7w
X-Proofpoint-ORIG-GUID: AfSXXKHJPoTM8DlJFBip_lETp_g9mc7w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_07,2023-05-25_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 clxscore=1011
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305250115
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, Gaurav Batra <gbatra@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of now, in tce_freemulti_pSeriesLP(), there is no limit on how many TCEs
are passed to H_STUFF_TCE hcall. This was not an issue until now. Newer
firmware releases have started enforcing this requirement.

The interface has been in it's current form since the beginning.

Cc: stable@vger.kernel.org

Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index c74b71d4733d..f159a195101d 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -306,13 +306,22 @@ static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
 static void tce_freemulti_pSeriesLP(struct iommu_table *tbl, long tcenum, long npages)
 {
 	u64 rc;
+	long rpages = npages;
+	unsigned long limit;
 
 	if (!firmware_has_feature(FW_FEATURE_STUFF_TCE))
 		return tce_free_pSeriesLP(tbl->it_index, tcenum,
 					  tbl->it_page_shift, npages);
 
-	rc = plpar_tce_stuff((u64)tbl->it_index,
-			     (u64)tcenum << tbl->it_page_shift, 0, npages);
+	do {
+		limit = min_t(unsigned long, rpages, 512);
+
+		rc = plpar_tce_stuff((u64)tbl->it_index,
+			     	(u64)tcenum << tbl->it_page_shift, 0, limit);
+
+		rpages -= limit;
+		tcenum += limit;
+	} while (rpages > 0 && !rc);
 
 	if (rc && printk_ratelimit()) {
 		printk("tce_freemulti_pSeriesLP: plpar_tce_stuff failed\n");
-- 
2.39.2 (Apple Git-143)

