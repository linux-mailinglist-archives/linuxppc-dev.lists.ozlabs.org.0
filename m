Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B19D3ABD72
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 22:31:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5Ybv0Czjz3cDH
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:31:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jzikHo6z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jzikHo6z; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5YbL0jN2z3c8N
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 06:30:37 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15HK3JqL004759; Thu, 17 Jun 2021 16:30:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=O3CLKYThIuiecxtqyRPP9mqyJCtw+47uqRaX6C7FgtU=;
 b=jzikHo6zm0zrZqZqRl967jPazcECUpwEJHCtwuupMoZQEApg/4tKpREH4wsO9sId+vLo
 Z51bU8iaYbCUABowpIMnTrA76xrQE7frDh2Z53tmcFfQKJr/7ECFv5FVM1PCwUkJiEVa
 3IkhkLysLeK4daxxk3tyFl3eBVnm3YymqKKRReXr0NCtIWVSYeT7NLKE3Q7Gsj/cglVg
 Vqn4chriRqGWWIHvJ472CHFuA264kzBhLPGHI4dMgAYN71k2/8cFZksE8WycRo9hlYOb
 lOX/XuwZbTg6BJZ0uLlFYclQyFEV3cPYFQRcn76IgnUQBWq9aSj5eD8RTfmi2g+kxdHh SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398cem9phx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:30:30 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15HK4dWw011132;
 Thu, 17 Jun 2021 16:30:29 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 398cem9phm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 16:30:29 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15HKHmmn023259;
 Thu, 17 Jun 2021 20:30:28 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 394mjaeq5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Jun 2021 20:30:28 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15HKURIJ36766030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Jun 2021 20:30:27 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 18797B2067;
 Thu, 17 Jun 2021 20:30:27 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB3E8B206E;
 Thu, 17 Jun 2021 20:30:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Jun 2021 20:30:25 +0000 (GMT)
Message-ID: <9db00d58dbdcb7cfc07a1df95f3d2a9e3e5d746a.camel@linux.ibm.com>
Subject: [PATCH v6 03/17] powerpc/powernv/vas: Rename register/unregister
 functions
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Thu, 17 Jun 2021 13:30:24 -0700
In-Reply-To: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
References: <827bf56dce09620ebecd8a00a5f97105187a6205.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QTpnfjDwx9cgUHKqlQE6kCJoKZGm1zXD
X-Proofpoint-ORIG-GUID: fUsTBIQdKINxGnJPa2VbExVlTLEcnLsE
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-17_15:2021-06-15,
 2021-06-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106170122
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


powerNV and pseries drivers register / unregister to the corresponding
platform specific VAS separately. Then these VAS functions call the
common API with the specific window operations. So rename powerNV VAS
API register/unregister functions.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/vas.h              |  3 +++
 arch/powerpc/platforms/book3s/vas-api.c     |  2 --
 arch/powerpc/platforms/powernv/vas-window.c | 18 ++++++++++++++++++
 drivers/crypto/nx/nx-common-powernv.c       |  6 +++---
 4 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index 3be76e813e2d..6076adf9ab4f 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -164,6 +164,9 @@ int vas_paste_crb(struct vas_window *win, int offset, bool re);
 
 void vas_win_paste_addr(struct vas_window *window, u64 *addr,
 			int *len);
+int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
+			     const char *name);
+void vas_unregister_api_powernv(void);
 
 /*
  * Register / unregister coprocessor type to VAS API which will be exported
diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index cfc9d7dd65ab..72c126d87216 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -262,7 +262,6 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
 	unregister_chrdev_region(coproc_device.devt, 1);
 	return rc;
 }
-EXPORT_SYMBOL_GPL(vas_register_coproc_api);
 
 void vas_unregister_coproc_api(void)
 {
@@ -275,4 +274,3 @@ void vas_unregister_coproc_api(void)
 	class_destroy(coproc_device.class);
 	unregister_chrdev_region(coproc_device.devt, 1);
 }
-EXPORT_SYMBOL_GPL(vas_unregister_coproc_api);
diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
index 7ba0840fc3b5..41712b4b268e 100644
--- a/arch/powerpc/platforms/powernv/vas-window.c
+++ b/arch/powerpc/platforms/powernv/vas-window.c
@@ -1442,3 +1442,21 @@ struct vas_window *vas_pswid_to_window(struct vas_instance *vinst,
 
 	return window;
 }
+
+/*
+ * Supporting only nx-gzip coprocessor type now, but this API code
+ * extended to other coprocessor types later.
+ */
+int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
+			     const char *name)
+{
+
+	return vas_register_coproc_api(mod, cop_type, name);
+}
+EXPORT_SYMBOL_GPL(vas_register_api_powernv);
+
+void vas_unregister_api_powernv(void)
+{
+	vas_unregister_coproc_api();
+}
+EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index 446f611726df..3b159f2fae17 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -1092,8 +1092,8 @@ static __init int nx_compress_powernv_init(void)
 		 * normal FIFO priority is assigned for userspace.
 		 * 842 compression is supported only in kernel.
 		 */
-		ret = vas_register_coproc_api(THIS_MODULE, VAS_COP_TYPE_GZIP,
-						"nx-gzip");
+		ret = vas_register_api_powernv(THIS_MODULE, VAS_COP_TYPE_GZIP,
+					       "nx-gzip");
 
 		/*
 		 * GZIP is not supported in kernel right now.
@@ -1129,7 +1129,7 @@ static void __exit nx_compress_powernv_exit(void)
 	 * use. So delete this API use for GZIP engine.
 	 */
 	if (!nx842_ct)
-		vas_unregister_coproc_api();
+		vas_unregister_api_powernv();
 
 	crypto_unregister_alg(&nx842_powernv_alg);
 
-- 
2.18.2


