Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EF338C385
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 11:41:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FmhSY1PWFz3cXj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 May 2021 19:41:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fYCeeGk9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fYCeeGk9; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FmhS55QJGz2xgK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 May 2021 19:40:53 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14L9YJi5111415; Fri, 21 May 2021 05:40:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=KFn/PAdMlE8AdkyS7MbXtuxQ9+Ij8Lu+nX3TyJKJH/M=;
 b=fYCeeGk91ZyqhegaIYxlWw1BRv9A3iTD1fdRlUkxv5t1PeLw1CqrlJuCeicd8RMEsgzL
 V1u+q9wB5GOQmfb5GHY6hnFB9XcSgLyVEb3I2KnUmW9noX5dN43lUBdkNQZsQxfuZuNS
 lH+OCSSnlJ1gDsv46m4w6jJJeHGE+zQnfvzcXDRyEOR9MuSJ+TPbH09di/hWbHCWBUnq
 7jN2WKywFNYYIUhiuulZbVif7/ZQkZbwA7/jXf4LGHZEUSmH2cKtfmmm8Z7s4d98pPpK
 UlDP5j6E+skSCzwGOrGhKXPt5djpflRFZFBTm/OVKhlTpWf0TS8/SyCKFQ2tzfHishIW og== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38paa2r6j4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:40:46 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14L9aXYY123157;
 Fri, 21 May 2021 05:40:46 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38paa2r6hv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 05:40:45 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14L9XAj1022064;
 Fri, 21 May 2021 09:40:45 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 38j5xaa6rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 May 2021 09:40:45 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14L9eijp13828532
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 May 2021 09:40:44 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DBD3112063;
 Fri, 21 May 2021 09:40:44 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E2513112062;
 Fri, 21 May 2021 09:40:42 +0000 (GMT)
Received: from sig-9-65-94-165.ibm.com (unknown [9.65.94.165])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 May 2021 09:40:42 +0000 (GMT)
Message-ID: <268d41061e2b8dd7163d66e085e91bbce0ceef51.camel@linux.ibm.com>
Subject: [PATCH v4 13/16] crypto/nx: Rename nx-842-pseries file name to
 nx-common-pseries
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Fri, 21 May 2021 02:40:36 -0700
In-Reply-To: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FYxFQj9ch7ItsO6Pb9pCeaovYbFYoBQU
X-Proofpoint-GUID: qZ8574LqPX1YGtKzw2K9YSUA0T4TGaIH
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-21_03:2021-05-20,
 2021-05-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 mlxlogscore=999
 impostorscore=0 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105210061
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


Rename nx-842-pseries.c to nx-common-pseries.c to add code for new
GZIP compression type. The actual functionality is not changed in
this patch.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 drivers/crypto/nx/Makefile                                  | 2 +-
 drivers/crypto/nx/{nx-842-pseries.c => nx-common-pseries.c} | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename drivers/crypto/nx/{nx-842-pseries.c => nx-common-pseries.c} (100%)

diff --git a/drivers/crypto/nx/Makefile b/drivers/crypto/nx/Makefile
index bc89a20e5d9d..d00181a26dd6 100644
--- a/drivers/crypto/nx/Makefile
+++ b/drivers/crypto/nx/Makefile
@@ -14,5 +14,5 @@ nx-crypto-objs := nx.o \
 obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_PSERIES) += nx-compress-pseries.o nx-compress.o
 obj-$(CONFIG_CRYPTO_DEV_NX_COMPRESS_POWERNV) += nx-compress-powernv.o nx-compress.o
 nx-compress-objs := nx-842.o
-nx-compress-pseries-objs := nx-842-pseries.o
+nx-compress-pseries-objs := nx-common-pseries.o
 nx-compress-powernv-objs := nx-common-powernv.o
diff --git a/drivers/crypto/nx/nx-842-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
similarity index 100%
rename from drivers/crypto/nx/nx-842-pseries.c
rename to drivers/crypto/nx/nx-common-pseries.c
-- 
2.18.2


