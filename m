Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08ED835B0DF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 02:29:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHt6r6tzCz3by6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 10:29:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=aXxG2Rds;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=aXxG2Rds; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHt6Q5P3Jz2yyM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 10:29:34 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13B04KuJ145885; Sat, 10 Apr 2021 20:29:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=BpUOCiXkn3Lnaz7oK7kSbg4xQWKMOF02ZZA9A0eflHg=;
 b=aXxG2RdsdtWHw1zhQk6R9YUCiLctAgrfvQa/P/OWIxkFLBDU6r8d2bozgdHaDmIdWUbk
 QcQdOgJQlfz+ko8212YSAnmmjV5NV9YsiwLie+W5LBD3Wnnq7oEuhZ/g+wjemoK857nE
 +fZDy6qyXtfFkcUZ0QKPh5dJEbc38TsY+gnUNHLpVjqWZWgZqZHazexxldo2Akj80x4K
 T2gIB1Y2oXHHPrnFzYRZZwbd/T4hRygSyPIHRjwtmbV1uCWAsCQ5gT/IRLAaGAIlkJdA
 ahFZ3pHzbXotiGPc+6cAOaAW7fiZC9J5P7AjxoDu42bMA8OtCrrU8T9Axkb4H1n19NuI Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37u85xc3g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Apr 2021 20:29:29 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13B0H8fF179570;
 Sat, 10 Apr 2021 20:29:29 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37u85xc3g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 10 Apr 2021 20:29:29 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13B0Swq2002031;
 Sun, 11 Apr 2021 00:29:28 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03dal.us.ibm.com with ESMTP id 37u3n8ebvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sun, 11 Apr 2021 00:29:28 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13B0TRNs26935730
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 11 Apr 2021 00:29:27 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00BED6E04E;
 Sun, 11 Apr 2021 00:29:27 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C0CC6E04C;
 Sun, 11 Apr 2021 00:29:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.232.48])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 11 Apr 2021 00:29:25 +0000 (GMT)
Message-ID: <3d21a23080fd0efc09a4784791abb94968b2bad8.camel@linux.ibm.com>
Subject: [PATCH 01/16] powerpc/powernv/vas: Rename register/unregister
 functions
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 mpe@ellerman.id.au, herbert@gondor.apana.org.au, npiggin@gmail.com
Date: Sat, 10 Apr 2021 17:29:23 -0700
In-Reply-To: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
References: <b4631127bd025d9585246606c350ec88dbe1e99a.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uo0BjxXah-u77BmoD37Hz1TmNF5xETRw
X-Proofpoint-GUID: WjkyLHJjqa5xahQWvA9mP9Cm682n3h6N
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-10_07:2021-04-09,
 2021-04-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104100182
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
VAS code separately. So rename powerNV VAS API register/unregister
functions.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/include/asm/vas.h           |  6 +++---
 arch/powerpc/platforms/powernv/vas-api.c | 10 +++++-----
 drivers/crypto/nx/nx-common-powernv.c    |  6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/vas.h b/arch/powerpc/include/asm/vas.h
index e33f80b0ea81..41f73fae7ab8 100644
--- a/arch/powerpc/include/asm/vas.h
+++ b/arch/powerpc/include/asm/vas.h
@@ -170,8 +170,8 @@ int vas_paste_crb(struct vas_window *win, int offset, bool re);
  * Only NX GZIP coprocessor type is supported now, but this API can be
  * used for others in future.
  */
-int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
-				const char *name);
-void vas_unregister_coproc_api(void);
+int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
+			     const char *name);
+void vas_unregister_api_powernv(void);
 
 #endif /* __ASM_POWERPC_VAS_H */
diff --git a/arch/powerpc/platforms/powernv/vas-api.c b/arch/powerpc/platforms/powernv/vas-api.c
index 98ed5d8c5441..72d8ce39e56c 100644
--- a/arch/powerpc/platforms/powernv/vas-api.c
+++ b/arch/powerpc/platforms/powernv/vas-api.c
@@ -207,8 +207,8 @@ static struct file_operations coproc_fops = {
  * Supporting only nx-gzip coprocessor type now, but this API code
  * extended to other coprocessor types later.
  */
-int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
-				const char *name)
+int vas_register_api_powernv(struct module *mod, enum vas_cop_type cop_type,
+			     const char *name)
 {
 	int rc = -EINVAL;
 	dev_t devno;
@@ -262,9 +262,9 @@ int vas_register_coproc_api(struct module *mod, enum vas_cop_type cop_type,
 	unregister_chrdev_region(coproc_device.devt, 1);
 	return rc;
 }
-EXPORT_SYMBOL_GPL(vas_register_coproc_api);
+EXPORT_SYMBOL_GPL(vas_register_api_powernv);
 
-void vas_unregister_coproc_api(void)
+void vas_unregister_api_powernv(void)
 {
 	dev_t devno;
 
@@ -275,4 +275,4 @@ void vas_unregister_coproc_api(void)
 	class_destroy(coproc_device.class);
 	unregister_chrdev_region(coproc_device.devt, 1);
 }
-EXPORT_SYMBOL_GPL(vas_unregister_coproc_api);
+EXPORT_SYMBOL_GPL(vas_unregister_api_powernv);
diff --git a/drivers/crypto/nx/nx-common-powernv.c b/drivers/crypto/nx/nx-common-powernv.c
index 13c65deda8e9..88d728415bb2 100644
--- a/drivers/crypto/nx/nx-common-powernv.c
+++ b/drivers/crypto/nx/nx-common-powernv.c
@@ -1090,8 +1090,8 @@ static __init int nx_compress_powernv_init(void)
 		 * normal FIFO priority is assigned for userspace.
 		 * 842 compression is supported only in kernel.
 		 */
-		ret = vas_register_coproc_api(THIS_MODULE, VAS_COP_TYPE_GZIP,
-						"nx-gzip");
+		ret = vas_register_api_powernv(THIS_MODULE, VAS_COP_TYPE_GZIP,
+					       "nx-gzip");
 
 		/*
 		 * GZIP is not supported in kernel right now.
@@ -1127,7 +1127,7 @@ static void __exit nx_compress_powernv_exit(void)
 	 * use. So delete this API use for GZIP engine.
 	 */
 	if (!nx842_ct)
-		vas_unregister_coproc_api();
+		vas_unregister_api_powernv();
 
 	crypto_unregister_alg(&nx842_powernv_alg);
 
-- 
2.18.2


