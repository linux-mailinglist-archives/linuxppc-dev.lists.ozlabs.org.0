Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890817EE0A0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 13:22:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H1x6UYnE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SWK1N3LYzz3dBH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 23:22:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H1x6UYnE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SWJzb0vNBz3cRj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 23:21:14 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AGCErIn028406;
	Thu, 16 Nov 2023 12:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=qIzt65Rc1tQ4qirRfMlizVt7Fh/Zt/dEZ9IXZKLRnqg=;
 b=H1x6UYnE1g12ZLN4zBsdnl0w/ybqBtZXUt3WvELPiTZFlYYJY9AjOmgobYiOnNGX5MWg
 KPAPGTu2ygXE92b2HcvY0Tr9q70P1NW+UT1HP1sIWhNtT3CGV5DsJS1xFt4/csG4OyAf
 vzAumT6bKlcCrWAHdKMCeY/vTX1ghpStCITOBBBeqR8UYS4kvIOnfNpkBfwzIZbQJAWJ
 pyKXTGxk0coK7AsPe3hRqmwH8NpCnbhDOL1khaSt1sVRQ9rdN8XiS2RaRqmy+d4siYPs
 Evbz5nuPyOF9KVVAGotPPUcZuOD6EdCvicqTk0r6tgWz4DlaVv2rbdoPMfskNqvzPRhu rQ== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3udjwsr57s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 12:21:02 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AGBZ8t7026743;
	Thu, 16 Nov 2023 12:21:02 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3uakxt6vdg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Nov 2023 12:21:02 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AGCKxJs1442304
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Nov 2023 12:20:59 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 829F92004B;
	Thu, 16 Nov 2023 12:20:59 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3BD2820040;
	Thu, 16 Nov 2023 12:20:57 +0000 (GMT)
Received: from li-e8dccbcc-2adc-11b2-a85c-bc1f33b9b810.ibm.com.com (unknown [9.171.0.150])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Nov 2023 12:20:57 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 2/2] powerpc/hv-gpxi: Fix access permission of hv-gpci interface files
Date: Thu, 16 Nov 2023 17:50:33 +0530
Message-Id: <20231116122033.160964-2-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
In-Reply-To: <20231116122033.160964-1-kjain@linux.ibm.com>
References: <20231116122033.160964-1-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: G0hf5Ptcrf-g996m3Xn-MMJJDEl1Q2mB
X-Proofpoint-ORIG-GUID: G0hf5Ptcrf-g996m3Xn-MMJJDEl1Q2mB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-16_09,2023-11-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 mlxlogscore=889 clxscore=1015 malwarescore=0
 adultscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311160098
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
Cc: atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com, Disha Goel <disgoel@linux.vnet.ibm.com>, maddy@linux.ibm.com, disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix access permission of the hv-gpci topology information
interface files from 0444 to 0400 (admin read only).

Fixes: 71f1c39647d8 ("powerpc/hv_gpci: Add sysfs file inside hv_gpci device to show processor bus topology information")
Reported-by: Disha Goel <disgoel@linux.vnet.ibm.com>
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/perf/hv-gpci.c b/arch/powerpc/perf/hv-gpci.c
index 27f18119fda1..303d160319e8 100644
--- a/arch/powerpc/perf/hv-gpci.c
+++ b/arch/powerpc/perf/hv-gpci.c
@@ -890,7 +890,7 @@ static struct device_attribute *sysinfo_device_attr_create(int
 			return NULL;
 
 		sysfs_attr_init(&attr->attr);
-		attr->attr.mode = 0444;
+		attr->attr.mode = 0400;
 
 		switch (sysinfo_interface_group_index) {
 		case INTERFACE_PROCESSOR_BUS_TOPOLOGY_ATTR:
-- 
2.39.3

