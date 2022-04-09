Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F5454FA612
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 10:47:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kb7yw18pLz3bcY
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Apr 2022 18:47:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FbABM860;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FbABM860; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kb7yC0gGyz2xBv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Apr 2022 18:46:26 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2391A8iP008580; 
 Sat, 9 Apr 2022 08:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : content-type : mime-version :
 content-transfer-encoding; s=pp1;
 bh=jhXBn9hH826GLHCfaz6qdkfpQxprxRwUhB/Ugi0Jix4=;
 b=FbABM860nzBo1wQoNFKU046qj7KiGCHMZ8mDGlq1BqFSZhl4eCvAE3RMKpPqojLZkpoV
 vUaAiF/feXYE4h1XnXdsB2XW6WiYVCbi7LDGwF7IwP5edIX+/TQ6516lubbUdZMU/miU
 O2o0XVsEEHdJG0l/iHZoJsVyHmi/m7DUpVPx2hBSui9kMKD1lYCtWJn8uysh/0rOzdKj
 7/42YB5xyN0BlMuAtHB/EBzZilY8/qDoK/37xMMSJyu9YXUduRlzWTRkQvQzLft6cmSO
 +WxVsfrMUJLpyShs7LYpJKmJZn2Uax5JyFsox251EO7CJ3+S7/BmYxJVNMH+2IMaZop7 RA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fb089mssr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 09 Apr 2022 08:46:21 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2398kLWZ025324;
 Sat, 9 Apr 2022 08:46:21 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3fb089mssf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 09 Apr 2022 08:46:21 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2398bs9w028936;
 Sat, 9 Apr 2022 08:46:20 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01dal.us.ibm.com with ESMTP id 3fb1s8hxmu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 09 Apr 2022 08:46:20 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2398kI2b22938068
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 9 Apr 2022 08:46:18 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AD906A047;
 Sat,  9 Apr 2022 08:46:18 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D07C66A051;
 Sat,  9 Apr 2022 08:46:16 +0000 (GMT)
Received: from sig-9-65-94-83.ibm.com (unknown [9.65.94.83])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat,  9 Apr 2022 08:46:16 +0000 (GMT)
Message-ID: <6dee950c7b72a4965c102208041f14a063cf5a8c.camel@linux.ibm.com>
Subject: [PATCH] powerpc/pseries/vas: sysfs comments with the correct entries
From: Haren Myneni <haren@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 mscastanho@ibm.com
Date: Sat, 09 Apr 2022 01:46:15 -0700
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: od5C-dszN2ZOQXVxdlYYtZAViI7s3rZG
X-Proofpoint-ORIG-GUID: JNA75JV0Ou6ILH1BnqD1FegfdxrHcPeP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_09,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=979 priorityscore=1501 phishscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204090055
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


VAS entry is created as a misc device and the sysfs comments
should list the proper entries

Reported-by: Matheus Castanho <mscastanho@ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/vas-sysfs.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c b/arch/powerpc/platforms/pseries/vas-sysfs.c
index f3c58c309cff..e05d2bac8824 100644
--- a/arch/powerpc/platforms/pseries/vas-sysfs.c
+++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
@@ -74,26 +74,26 @@ struct vas_sysfs_entry {
 
 /*
  * Create sysfs interface:
- * /sys/devices/vas/vas0/gzip/default_capabilities
+ * /sys/devices/virtual/misc/vas/vas0/gzip/default_capabilities
  *	This directory contains the following VAS GZIP capabilities
  *	for the defaule credit type.
- * /sys/devices/vas/vas0/gzip/default_capabilities/nr_total_credits
+ * /sys/devices/virtual/misc/vas/vas0/gzip/default_capabilities/nr_total_credits
  *	Total number of default credits assigned to the LPAR which
  *	can be changed with DLPAR operation.
- * /sys/devices/vas/vas0/gzip/default_capabilities/nr_used_credits
+ * /sys/devices/virtual/misc/vas/vas0/gzip/default_capabilities/nr_used_credits
  *	Number of credits used by the user space. One credit will
  *	be assigned for each window open.
  *
- * /sys/devices/vas/vas0/gzip/qos_capabilities
+ * /sys/devices/virtual/misc/vas/vas0/gzip/qos_capabilities
  *	This directory contains the following VAS GZIP capabilities
  *	for the Quality of Service (QoS) credit type.
- * /sys/devices/vas/vas0/gzip/qos_capabilities/nr_total_credits
+ * /sys/devices/virtual/misc/vas/vas0/gzip/qos_capabilities/nr_total_credits
  *	Total number of QoS credits assigned to the LPAR. The user
  *	has to define this value using HMC interface. It can be
  *	changed dynamically by the user.
- * /sys/devices/vas/vas0/gzip/qos_capabilities/nr_used_credits
+ * /sys/devices/virtual/misc/vas/vas0/gzip/qos_capabilities/nr_used_credits
  *	Number of credits used by the user space.
- * /sys/devices/vas/vas0/gzip/qos_capabilities/update_total_credits
+ * /sys/devices/virtual/misc/vas/vas0/gzip/qos_capabilities/update_total_credits
  *	Update total QoS credits dynamically
  */
 
-- 
2.27.0


