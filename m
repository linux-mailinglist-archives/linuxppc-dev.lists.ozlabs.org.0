Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C104729853
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 13:44:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qczl96KNFz3fbn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:44:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SHskdAzn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SHskdAzn;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QczfY267sz3dtF
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 21:40:36 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359BHiOH026230;
	Fri, 9 Jun 2023 11:40:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=aO57hyPxacS4IDwJa3ULNql5OpdNxrkuDiZKvOiI2AM=;
 b=SHskdAznbbgZefxQ+Eu/OgLDAaxjj7dnA7nSekj1nSlXGBzdo5abKGIaF/1aYoV49BXF
 kHfIKx/QNclCSl+hleFB/wOSteu1wCilGieH6mQR+xeBp0WtNAOigujnWQhPJLdqt2qR
 xWKiaz52GpDbkLgTZuoVnUJFX7TuS/OAPRQ2lDTHnZcLk4S3qiYAJ3KxUaU/D7Ee3IPy
 9sw/F0WU00fg4Dki+Ds1R6luYGUsai5BEWwRPw25tHOaeqyAtsIXN/BzDseNTUv8/9Mx
 3eVSNT26LHxGq7iwaMlTccMqUSdCqxKcYQy2F3w6S8mLU0qBS/heMTPa1gnfzEkozQ2w VQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r43308ecb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:32 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3599S79k014397;
	Fri, 9 Jun 2023 11:40:30 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3r2a7a1ccu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 359BeQVs18023122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 11:40:27 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C9D8F2004B;
	Fri,  9 Jun 2023 11:40:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B00020040;
	Fri,  9 Jun 2023 11:40:24 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.70.150])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jun 2023 11:40:24 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 04/10] docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document processor_config sysfs interface file
Date: Fri,  9 Jun 2023 17:09:55 +0530
Message-Id: <20230609114001.169235-5-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230609114001.169235-1-kjain@linux.ibm.com>
References: <20230609114001.169235-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oRj01RXjEXzBemnELDIfekFZlljci7Ys
X-Proofpoint-ORIG-GUID: oRj01RXjEXzBemnELDIfekFZlljci7Ys
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_08,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 clxscore=1015 suspectscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2305260000 definitions=main-2306090097
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
Cc: disgoel@linux.ibm.com, kjain@linux.ibm.com, atrajeev@linux.vnet.ibm.com, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add details of the new hv-gpci interface file called
"processor_config" in the ABI documentation.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-hv_gpci        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
index 6d633167268e..003d94afbbcd 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
@@ -109,3 +109,18 @@ Description:	admin read only
 			   more information.
 
 		* "-EFBIG" : System information exceeds PAGE_SIZE.
+
+What:		/sys/devices/hv_gpci/interface/processor_config
+Date:		June 2023
+Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	admin read only
+		This sysfs file exposes the system topology information by making HCALL
+		H_GET_PERF_COUNTER_INFO. The HCALL is made with counter request value
+		PROCESSOR_CONFIG(0x90).
+		* This sysfs file is only be created for power10 and above platforms.
+		* User need root access to read data from this sysfs file.
+		* Incase the HCALL fails with hardware/permission issue, or the support for
+		  PROCESSOR_CONFIG counter request value removed, this sysfs file still be
+		  created and give error when reading it.
+		* The end user reading this sysfs file need to decode sysfs file data as per
+		  underneath platform/firmware.
-- 
2.35.3

