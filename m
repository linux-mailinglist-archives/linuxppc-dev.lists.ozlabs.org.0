Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC7936326B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 23:12:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN5Q70hHMz3dSt
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 07:12:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hxUK0mJk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hxUK0mJk; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN5Ph12Btz2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 07:12:23 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13HL3RgX157117; Sat, 17 Apr 2021 17:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=u+JBqnwj0F2DU2O+gzePPbaQbGSWFmasoJOhNAmfZp0=;
 b=hxUK0mJkmY/2+3vWZh26JmmLwgW+o+izhdY/XXyUrzZxKcg8LibppsRYguZLAPmi+Tf7
 i6dSRQKPy1XGRnbvcH39tEBKLwZ8ebVEvXHbV49rKkpwRVsvakFqayzETz+DnZ6zTPpI
 En/yejyY71zWn7JNP3w3o+ymRhaYnJsjb0mnpsDO+El2uiCfI0MIslA+YRu1eK0g1A6+
 psqEVpwg+FuVQFW3NakBPN9IDlnqFPaxTgCEdArhGGTljM4SYVMHDBgFNlB1Cfrf5A5J
 ZsDuywvVeW8qTQpSJuhdX4PdhDgjyPPSj4ijNEYt763+1kWZeuH7jn3WdUqKtXAZ3SN+ sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37yupr2y4u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 17:12:17 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13HL5CMN163994;
 Sat, 17 Apr 2021 17:12:16 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37yupr2y4n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 17:12:16 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13HKltbm019223;
 Sat, 17 Apr 2021 21:12:16 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01wdc.us.ibm.com with ESMTP id 37yqa85jxh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 17 Apr 2021 21:12:16 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13HLCFOf34210086
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 17 Apr 2021 21:12:15 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B435028058;
 Sat, 17 Apr 2021 21:12:15 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 871F32805A;
 Sat, 17 Apr 2021 21:12:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 17 Apr 2021 21:12:14 +0000 (GMT)
Message-ID: <875e8d7629cc2281672fc47a97b690b1de0e63d5.camel@linux.ibm.com>
Subject: [V3 PATCH 14/16] crypto/nx: Register and unregister VAS interface
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sat, 17 Apr 2021 14:12:12 -0700
In-Reply-To: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: AqN4D8663Y5T0MKWACMM63VKbnAVex-F
X-Proofpoint-ORIG-GUID: JvvqdVroplG6PZUrVjGYTryhAOEarxYT
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-17_12:2021-04-16,
 2021-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0
 bulkscore=0 impostorscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 clxscore=1015 malwarescore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104170152
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


Changes to create /dev/crypto/nx-gzip interface with VAS register
and to remove this interface with VAS unregister.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 drivers/crypto/nx/Kconfig             | 1 +
 drivers/crypto/nx/nx-common-pseries.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/drivers/crypto/nx/Kconfig b/drivers/crypto/nx/Kconfig
index 23e3d0160e67..2a35e0e785bd 100644
--- a/drivers/crypto/nx/Kconfig
+++ b/drivers/crypto/nx/Kconfig
@@ -29,6 +29,7 @@ if CRYPTO_DEV_NX_COMPRESS
 config CRYPTO_DEV_NX_COMPRESS_PSERIES
 	tristate "Compression acceleration support on pSeries platform"
 	depends on PPC_PSERIES && IBMVIO
+	depends on PPC_VAS
 	default y
 	help
 	  Support for PowerPC Nest (NX) compression acceleration. This
diff --git a/drivers/crypto/nx/nx-common-pseries.c b/drivers/crypto/nx/nx-common-pseries.c
index cc8dd3072b8b..9a40fca8a9e6 100644
--- a/drivers/crypto/nx/nx-common-pseries.c
+++ b/drivers/crypto/nx/nx-common-pseries.c
@@ -9,6 +9,7 @@
  */
 
 #include <asm/vio.h>
+#include <asm/vas.h>
 
 #include "nx-842.h"
 #include "nx_csbcpb.h" /* struct nx_csbcpb */
@@ -1101,6 +1102,12 @@ static int __init nx842_pseries_init(void)
 		return ret;
 	}
 
+	ret = vas_register_api_pseries(THIS_MODULE, VAS_COP_TYPE_GZIP,
+				       "nx-gzip");
+
+	if (ret)
+		pr_err("NX-GZIP is not supported. Returned=%d\n", ret);
+
 	return 0;
 }
 
@@ -1111,6 +1118,8 @@ static void __exit nx842_pseries_exit(void)
 	struct nx842_devdata *old_devdata;
 	unsigned long flags;
 
+	vas_unregister_api_pseries();
+
 	crypto_unregister_alg(&nx842_pseries_alg);
 
 	spin_lock_irqsave(&devdata_mutex, flags);
-- 
2.18.2


