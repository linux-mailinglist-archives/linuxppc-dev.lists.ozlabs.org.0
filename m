Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E705E5D70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 10:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MY7hS6Zm5z3cBK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 18:28:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FGoTocwb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FGoTocwb;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MY7gj5w20z3bYM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Sep 2022 18:27:29 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28M8Cdkc019704;
	Thu, 22 Sep 2022 08:27:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YBjHU+MugPcT5GdoLCf5T+7RcqRAP13Ho5AoBPpCHPc=;
 b=FGoTocwb/rPjFX0icBV2F3jTnm3erg5qoa+RNQAXs3PiiNBXYQCkGcp+G2oPuYalB3Ny
 89UVcXR4EudhLFuxwF6o6jQaEKDcegrKTzHXDT9/aGhyKJekV7bVump1SUFUKiM/SulK
 +huPLGzDeWm2FGr6og9viofdLh7eFaLiwpzN19J8Z0KQml7maKUAREEeAeBH0/Hc7g9H
 A8sktUmX2olX0GtimA1meaw95cKisFSbOdh4fTE7FdoW0S9+v5ah3bxrkQwOi/DNR9Hm
 1y9hEK304gnwGazSBohDQE7AHHf272g0eRcnRAJssRDZYXdq8U/ZQmiBYCqWzWv1+5au qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrkhw18f7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 08:27:22 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28M85IdV006480;
	Thu, 22 Sep 2022 08:27:21 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrkhw18eu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 08:27:21 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28M8Lb7a011634;
	Thu, 22 Sep 2022 08:27:20 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma02wdc.us.ibm.com with ESMTP id 3jn5v9qfw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 08:27:20 +0000
Received: from smtpav02.wdc07v.mail.ibm.com ([9.208.128.114])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28M8RIZl8192696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Sep 2022 08:27:19 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 65CEA5805D;
	Thu, 22 Sep 2022 08:27:18 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 48B4958059;
	Thu, 22 Sep 2022 08:27:17 +0000 (GMT)
Received: from sig-9-77-146-251.ibm.com (unknown [9.77.146.251])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Sep 2022 08:27:17 +0000 (GMT)
Message-ID: <d8efade91dda831c9ed4abb226dab627da594c5f.camel@linux.ibm.com>
Subject: [PATCH] powerpc/pseries: Move vas_migration_handler early during
 migration
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, nathanl@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Date: Thu, 22 Sep 2022 01:27:07 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: V1NWbkZAyTLjs1SbryaKHDfEL2T7M8TU
X-Proofpoint-ORIG-GUID: 8tEHyvCqQ57vtz3aSfjZzd9sD1rxJ-m5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 mlxlogscore=930 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209220053
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


When the migration is initiated, the hypervisor changes VAS
mappings as part of pre-migration event. Then the OS gets the
migration event which closes all VAS windows before the migration
starts. NX generates continuous faults until windows are closed
and the user space can not differentiate these NX faults coming
from the actual migration. So to reduce this time window, close
VAS windows first in pseries_migrate_partition().

Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/mobility.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
index 3d36a8955eaf..884595b7c51f 100644
--- a/arch/powerpc/platforms/pseries/mobility.c
+++ b/arch/powerpc/platforms/pseries/mobility.c
@@ -740,11 +740,19 @@ static int pseries_migrate_partition(u64 handle)
 #ifdef CONFIG_PPC_WATCHDOG
 	factor = nmi_wd_lpm_factor;
 #endif
+	/*
+	 * When the migration is initiated, the hypervisor changes VAS
+	 * mappings to prepare before OS gets the notification and
+	 * closes all VAS windows. NX generates continuous faults during
+	 * this time and the user space can not differentiate these
+	 * faults from the migration event. So reduce this time window
+	 * by closing VAS windows at the beginning of this function.
+	 */
+	vas_migration_handler(VAS_SUSPEND);
+
 	ret = wait_for_vasi_session_suspending(handle);
 	if (ret)
-		return ret;
-
-	vas_migration_handler(VAS_SUSPEND);
+		goto out;
 
 	if (factor)
 		watchdog_nmi_set_timeout_pct(factor);
@@ -765,6 +773,7 @@ static int pseries_migrate_partition(u64 handle)
 	if (factor)
 		watchdog_nmi_set_timeout_pct(0);
 
+out:
 	vas_migration_handler(VAS_RESUME);
 
 	return ret;
-- 
2.26.3


