Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6745D731D1A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jun 2023 17:51:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m+WunK/I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QhmxR29FLz3c96
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 01:51:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m+WunK/I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QhmtM1yYJz3bX9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 01:48:59 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35FFHMOg017877;
	Thu, 15 Jun 2023 15:48:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Z3BXx87NONENKyRCVCG4NKF1gcn0Sn0umYhm4oYj4BE=;
 b=m+WunK/IOHWMbgZzY32kuxcQDnvGTp2wdGf0N5XWp9lvmn8+O7REY9SL+wjg7wjnREBY
 l51RIDawtCIERuv4y/kGq+w1ZkkVutMI5eMG2+taOF1RebzOQM761auH/krVI9dRLBQ8
 0Ag0sd0a+vqiUO57dq+sO0XWooI9tXdnoiOqXH6Q9/V520g10GVhDP5BU3fT9i7eBNuS
 qovrS2IK/7Gn8lmKNeXE0YdDwskiXw+Xr4dtEURMa4mPBuS+rojBsd3SX/QUAhVPle0n
 8OR4eujVdYCXiQB+wc63+o0IKKZaQfgnqlOgWdT0qJnh9ZM3zfYBJRUUMf6Z6W30TJGB hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r855fh7uu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:48:33 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35FFg3CH005425;
	Thu, 15 Jun 2023 15:47:25 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com [149.81.74.107])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r855fh3vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:47:25 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
	by ppma03fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35F5j377026971;
	Thu, 15 Jun 2023 15:46:40 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma03fra.de.ibm.com (PPS) with ESMTPS id 3r4gt52r2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Jun 2023 15:46:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35FFkbgF61931940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jun 2023 15:46:37 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C7C302004D;
	Thu, 15 Jun 2023 15:46:37 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F92520043;
	Thu, 15 Jun 2023 15:46:37 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.144.159.119])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 15 Jun 2023 15:46:37 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] cpu/SMT: Move smt/control simple exit cases earlier
Date: Thu, 15 Jun 2023 17:46:27 +0200
Message-ID: <20230615154635.13660-3-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230615154635.13660-1-ldufour@linux.ibm.com>
References: <20230615154635.13660-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FAcxk4wfwW8CUIwp5TqzGbT7Q6rnTN1S
X-Proofpoint-ORIG-GUID: U67IZCq5D10t0m1mh1XSjryU96tz66Bq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-15_12,2023-06-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 phishscore=0
 spamscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306150136
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

Move the simple exit cases, ie. which don't depend on the value written,
earlier in the function. That makes it clearer that regardless of the
input those states can not be transitioned out of.

That does have a user-visible effect, in that the error returned will
now always be EPERM/ENODEV for those states, regardless of the value
written. Previously writing an invalid value would return EINVAL even
when in those states.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 kernel/cpu.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index 237394e0574a..c67049bb3fc8 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2482,6 +2482,12 @@ __store_smt_control(struct device *dev, struct device_attribute *attr,
 {
 	int ctrlval, ret;
 
+	if (cpu_smt_control == CPU_SMT_FORCE_DISABLED)
+		return -EPERM;
+
+	if (cpu_smt_control == CPU_SMT_NOT_SUPPORTED)
+		return -ENODEV;
+
 	if (sysfs_streq(buf, "on"))
 		ctrlval = CPU_SMT_ENABLED;
 	else if (sysfs_streq(buf, "off"))
@@ -2491,12 +2497,6 @@ __store_smt_control(struct device *dev, struct device_attribute *attr,
 	else
 		return -EINVAL;
 
-	if (cpu_smt_control == CPU_SMT_FORCE_DISABLED)
-		return -EPERM;
-
-	if (cpu_smt_control == CPU_SMT_NOT_SUPPORTED)
-		return -ENODEV;
-
 	ret = lock_device_hotplug_sysfs();
 	if (ret)
 		return ret;
-- 
2.41.0

