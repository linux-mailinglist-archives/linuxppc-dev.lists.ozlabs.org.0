Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 662CD496616
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jan 2022 20:55:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JgVVd2Drjz3bPR
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Jan 2022 06:55:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H6K12CHd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H6K12CHd; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JgVTm0dkVz3cN1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Jan 2022 06:55:07 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20LJGSM7020503; 
 Fri, 21 Jan 2022 19:55:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=InAtI8wWXbnRQ5VcDW2U8gTdxjDNEK43tUX6v9clFq8=;
 b=H6K12CHdCzZZGrMKNd++WxTAdX0CCR4oUmQFcm7wXHfLJLr4YfMlrFI0pSFA4Ua7recf
 EODXP56ncy9FUDzzjChPJsn8lgjkzQwED8VILITMt0kYHXrkqYmC3LGsaeAWEFXBTZ9Z
 qkUWcKWBXEl7XKb4PQFp7cyCqpy4uxKiKyd0b9U+CQI6ON1aGFRlqDogeNCZ/ZVqTPMQ
 xt8rw2ajlDSB6sqk/1rQ3Lyxq4zkXjWEhqq4LNT5aIYwB0lFTiVM6e+LSGLQIIbKLaRD
 SHPeMabmV2MLGHw15DN9QMv393S/QF1eZQskHoQ0TNAwRgftwKGHYQ+snPqLrQ8lyRmj Cw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr2ujgpdt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:55:03 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20LJR1Lr001409;
 Fri, 21 Jan 2022 19:55:02 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dr2ujgpd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:55:02 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20LJqFWS009033;
 Fri, 21 Jan 2022 19:55:01 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03wdc.us.ibm.com with ESMTP id 3dr1umhmtr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Jan 2022 19:55:01 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20LJt0TX27525422
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Jan 2022 19:55:00 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C0486A066;
 Fri, 21 Jan 2022 19:55:00 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8BA536A051;
 Fri, 21 Jan 2022 19:54:59 +0000 (GMT)
Received: from sig-9-77-130-163.ibm.com (unknown [9.77.130.163])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 21 Jan 2022 19:54:59 +0000 (GMT)
Message-ID: <68ec2a354a932670fabd600a18eccbfcacd84464.camel@linux.ibm.com>
Subject: [PATCH v3 02/10] powerpc/pseries/vas: Add notifier for DLPAR core
 removal/add
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Fri, 21 Jan 2022 11:54:57 -0800
In-Reply-To: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nKm38AaRxNeFaeWUUmdVhKhQp_h29vUD
X-Proofpoint-GUID: XHil5yaB-IUeBZNgaq5h7Z9q_OjUkYXi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-21_09,2022-01-21_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201210127
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


The hypervisor assigns credits for each LPAR based on number of
cores configured in that system. So expects to release credits
(means windows) when the core is removed. This patch adds notifier
for core removal/add so that the OS closes windows if the system
looses credits due to core removal and reopen windows when the
credits available later.

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas.c | 37 ++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index c0737379cc7b..d2c8292bfb33 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -538,6 +538,39 @@ static int __init get_vas_capabilities(u8 feat, enum vas_cop_feat_type type,
 	return 0;
 }
 
+/*
+ * Total number of default credits available (target_credits)
+ * in LPAR depends on number of cores configured. It varies based on
+ * whether processors are in shared mode or dedicated mode.
+ * Get the notifier when CPU configuration is changed with DLPAR
+ * operation so that get the new target_credits (vas default capabilities)
+ * and then update the existing windows usage if needed.
+ */
+static int pseries_vas_notifier(struct notifier_block *nb,
+				unsigned long action, void *data)
+{
+	struct of_reconfig_data *rd = data;
+	struct device_node *dn = rd->dn;
+	const __be32 *intserv = NULL;
+	int len, rc = 0;
+
+	if ((action == OF_RECONFIG_ATTACH_NODE) ||
+		(action == OF_RECONFIG_DETACH_NODE))
+		intserv = of_get_property(dn, "ibm,ppc-interrupt-server#s",
+					  &len);
+	/*
+	 * Processor config is not changed
+	 */
+	if (!intserv)
+		return NOTIFY_OK;
+
+	return rc;
+}
+
+static struct notifier_block pseries_vas_nb = {
+	.notifier_call = pseries_vas_notifier,
+};
+
 static int __init pseries_vas_init(void)
 {
 	struct hv_vas_cop_feat_caps *hv_cop_caps;
@@ -591,6 +624,10 @@ static int __init pseries_vas_init(void)
 			goto out_cop;
 	}
 
+	/* Processors can be added/removed only on LPAR */
+	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR))
+		of_reconfig_notifier_register(&pseries_vas_nb);
+
 	pr_info("GZIP feature is available\n");
 
 out_cop:
-- 
2.27.0


