Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAE9729857
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 13:46:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qczn60YjGz3fqB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 21:46:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QgQ5vsJi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QgQ5vsJi;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qczfh537pz3fF9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 21:40:44 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359BajbV003593;
	Fri, 9 Jun 2023 11:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=BJ85Pcy20QswIe+ou/GRd8b7LJ74iobYGLUkXzTCmN0=;
 b=QgQ5vsJivHQ6rjT7wkgCWsJjPfX65Nd3Gb41TO5RCKShkunos7uyw8pjKhDLBn7EWV+L
 n7jnbIlgGWCZ8lTmaWFVSdz6gqdNlK2i4GmNyyPFra5RlmfQzHD78wzoU2wmjE3tv35O
 nohojFPg6yDKCoM55JiwbFOHqo6qK48J8XWe2UfUa6fBqG8LIhPe+5EZK+uKFSiem59Y
 b3UVrpDtoi3EgyuEcxiSO9bvEHdDPAu8ghUy3F6UXWruarKozbYtJhA63YCxcZzITNtH
 w51MapGXTn8Wsss05ZHDKppNnxZLZxaFirfK6d1r6mWQ8AnVs6xtHtCGL3hWAYxgN4kb NA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r432ygd47-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:40 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 359B1KRm019710;
	Fri, 9 Jun 2023 11:40:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r2a77hc6m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 11:40:37 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 359BeW3A60293444
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 11:40:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6ED4320040;
	Fri,  9 Jun 2023 11:40:32 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3062920043;
	Fri,  9 Jun 2023 11:40:30 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.43.70.150])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  9 Jun 2023 11:40:29 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 06/10] docs: ABI: sysfs-bus-event_source-devices-hv_gpci: Document affinity_domain_via_virtual_processor sysfs interface file
Date: Fri,  9 Jun 2023 17:09:57 +0530
Message-Id: <20230609114001.169235-7-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230609114001.169235-1-kjain@linux.ibm.com>
References: <20230609114001.169235-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1tI1U943bY_5b2Dy8eJfigGliI2jEvBp
X-Proofpoint-GUID: 1tI1U943bY_5b2Dy8eJfigGliI2jEvBp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_08,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 bulkscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090097
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
"affinity_domain_via_virtual_processor" in the ABI documentation.

Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 .../sysfs-bus-event_source-devices-hv_gpci        | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
index 003d94afbbcd..d8862808c955 100644
--- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
+++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_gpci
@@ -124,3 +124,18 @@ Description:	admin read only
 		  created and give error when reading it.
 		* The end user reading this sysfs file need to decode sysfs file data as per
 		  underneath platform/firmware.
+
+What:		/sys/devices/hv_gpci/interface/affinity_domain_via_virtual_processor
+Date:		June 2023
+Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
+Description:	admin read only
+		This sysfs file exposes the system topology information by making HCALL
+		H_GET_PERF_COUNTER_INFO. The HCALL is made with counter request value
+		AFFINITY_DOMAIN_INFORMATION_BY_VIRTUAL_PROCESSOR(0xA0).
+		* This sysfs file is only be created for power10 and above platforms.
+		* User need root access to read data from this sysfs file.
+		* Incase the HCALL fails with hardware/permission issue, or the support for
+		  AFFINITY_DOMAIN_INFORMATION_BY_VIRTUAL_PROCESSOR counter request value
+		  removed, this sysfs file still be created and give error when reading it.
+		* The end user reading this sysfs file need to decode sysfs file data as per
+		  underneath platform/firmware.
-- 
2.35.3

