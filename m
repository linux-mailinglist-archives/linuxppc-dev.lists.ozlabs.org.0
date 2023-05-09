Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 848E66FD210
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 00:07:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QGC1S2p8Fz3bxY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 May 2023 08:06:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tXWL/1L+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gbatra@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tXWL/1L+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QGC0V41HGz3bbD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 May 2023 08:06:01 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 349M3p0a010232;
	Tue, 9 May 2023 22:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=QiLgcaGzMG6e3bA12KNRIQS/nr3016/UVkBIRIJEDU8=;
 b=tXWL/1L+TfCJlmWg0943uqdtHzKg+6o2Sb29kt65pYDA3ZR16zXy/DJ0OY7z3WXVVsH8
 vS2ArF5BxvsMs3+cAuxkPFDJL1MAvcmfjxyd3iLwzyo99WpfgYMgZPQAZj0oUbO7SPYe
 jpUT/NHI92QVflK6IAJoDCh+t4IlpwbqKfmoKbgCsI/eTOlnkLCPE40cTyP7jw66ba7/
 28BqnnntakgyjyoSKO/10hfQa8A5bHf9y8a+TkEuLi0t46BXqEZEMNytLy7x9fukryN5
 SK8SACvmaC61U2E5IJd7PleVvQ0UQyOUxUpXjoQky4UMFosXn+VIw6oG0b1w9eKAlGpu 6w== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qfwn1hj1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 22:05:54 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 349LkM5U012290;
	Tue, 9 May 2023 22:05:53 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([9.208.129.114])
	by ppma02dal.us.ibm.com (PPS) with ESMTPS id 3qf7wdy2bw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 May 2023 22:05:53 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 349M5p5524248808
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 May 2023 22:05:51 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 874D258062;
	Tue,  9 May 2023 22:05:51 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D5B5458061;
	Tue,  9 May 2023 22:05:50 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.114.206])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  9 May 2023 22:05:50 +0000 (GMT)
From: Gaurav Batra <gbatra@linux.vnet.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/iommu: limit number of TCEs to 512 for H_STUFF_TCE hcall
Date: Tue,  9 May 2023 17:05:49 -0500
Message-Id: <20230509220549.23946-1-gbatra@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R8YkovmWmlA2jgwYcCfmoqFINN_1LS6s
X-Proofpoint-GUID: R8YkovmWmlA2jgwYcCfmoqFINN_1LS6s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-09_14,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 suspectscore=0 impostorscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305090180
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
Cc: brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.vnet.ibm.com>, gjoyce@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of now, in tce_freemulti_pSeriesLP(), there is no limit on how many TCEs
are passed to H_STUFF_TCE hcall. PAPR is enforcing this to be limited to
512 TCEs.

Signed-off-by: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Reviewed-by: Brian King <brking@linux.vnet.ibm.com>
---
 arch/powerpc/platforms/pseries/iommu.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/iommu.c b/arch/powerpc/platforms/pseries/iommu.c
index c74b71d4733d..1b134b1b795a 100644
--- a/arch/powerpc/platforms/pseries/iommu.c
+++ b/arch/powerpc/platforms/pseries/iommu.c
@@ -306,13 +306,21 @@ static void tce_free_pSeriesLP(unsigned long liobn, long tcenum, long tceshift,
 static void tce_freemulti_pSeriesLP(struct iommu_table *tbl, long tcenum, long npages)
 {
 	u64 rc;
+	long limit, rpages = npages;
 
 	if (!firmware_has_feature(FW_FEATURE_STUFF_TCE))
 		return tce_free_pSeriesLP(tbl->it_index, tcenum,
 					  tbl->it_page_shift, npages);
 
-	rc = plpar_tce_stuff((u64)tbl->it_index,
-			     (u64)tcenum << tbl->it_page_shift, 0, npages);
+	do {
+		limit = min_t(long, rpages, 512);
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

