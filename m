Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A3C3285E7F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 13:53:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C5t5v0mzMzDqCF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Oct 2020 22:53:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=PnQAmRiU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C5t0F0TSjzDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Oct 2020 22:49:00 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 097BWwqn017297; Wed, 7 Oct 2020 07:48:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qAzYh3+7wGDNAdWrcz6PRSd3dT0ghHjZyINNp9FyqMU=;
 b=PnQAmRiUFSHhgZvYqr9kQlEPbUsE2DkEsK9DBaCsarmerw2fwY2GvwoqQHKWszH97k7G
 UdtSVvleC7RgcLAwXyzddv+pQlw3T3ngyxx6mL44MvS/6p7bnedQ+RL0cb6S3Qw4Bca8
 BUaAa75tlt7CK5toiw7/w6yuAcuxMkuKXZjH6g1jSA3vxp3X285tRDadpEkk0fl+9SJd
 wulvzhad0cJrkP9mfms+ISvYHpVNR5xIQFUYb39hCHr+m5ewlm+iV3Mf1TDGluaAl/gj
 quklAh4qvygFFyknbxDb2Dd6MeiJujI+uZPfeLj2KtPkBCW49QMT7Q4EScK61azTjoIP BQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 341bw1tht7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 07:48:54 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 097BkjXn002623;
 Wed, 7 Oct 2020 11:48:53 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04wdc.us.ibm.com with ESMTP id 33xgx9epfd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Oct 2020 11:48:53 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 097Bmr4V53018908
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Oct 2020 11:48:53 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1D1A8AC059;
 Wed,  7 Oct 2020 11:48:53 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EFBEAC05B;
 Wed,  7 Oct 2020 11:48:51 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.206.190])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Oct 2020 11:48:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 1/4] powerpc/drmem: Make lmb_size 64 bit
Date: Wed,  7 Oct 2020 17:18:33 +0530
Message-Id: <20201007114836.282468-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201007114836.282468-1-aneesh.kumar@linux.ibm.com>
References: <20201007114836.282468-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-07_08:2020-10-06,
 2020-10-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999
 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 suspectscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010070075
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
Cc: nathanl@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to commit 89c140bbaeee ("pseries: Fix 64 bit logical memory block panic")
make sure different variables tracking lmb_size are updated to be 64 bit.

This was found by code audit.

Cc: stable@vger.kernel.org
Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/drmem.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 030a19d92213..bf2402fed3e0 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -20,7 +20,7 @@ struct drmem_lmb {
 struct drmem_lmb_info {
 	struct drmem_lmb        *lmbs;
 	int                     n_lmbs;
-	u32                     lmb_size;
+	u64                     lmb_size;
 };
 
 extern struct drmem_lmb_info *drmem_info;
@@ -80,7 +80,7 @@ struct of_drconf_cell_v2 {
 #define DRCONF_MEM_RESERVED	0x00000080
 #define DRCONF_MEM_HOTREMOVABLE	0x00000100
 
-static inline u32 drmem_lmb_size(void)
+static inline u64 drmem_lmb_size(void)
 {
 	return drmem_info->lmb_size;
 }
-- 
2.26.2

