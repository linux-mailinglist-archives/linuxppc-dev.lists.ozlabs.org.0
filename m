Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D19BF7486F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 16:55:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rF4hg2Hn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx2lM5Bhkz3bnQ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:55:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rF4hg2Hn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx2gc5qrbz3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:52:12 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 365EmRvf021440;
	Wed, 5 Jul 2023 14:51:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cG9/pDbZ6FXFTb7O2FLnvLgPQuiEQ1Jn4qTuiwFzTvA=;
 b=rF4hg2HnHsiuL2q4ZnAjUwD5dVbILMTMdbSdw7o9slLwwj9WD0KXpN7HNpYDlF7kbH13
 Nz/IrOXqbvg7D23opbt0TrOq0CcOZN7qLXGNuETqcIk2gEGa4e+8uAIDVhLbH9yjMjSK
 nETLvFUCTbBPvtjoqlB/iIlvq5ww3qg20Ak9Qw34hbxpC01jdy7Z5QCXI1J90fBKdMUK
 3ke1U/4QntCVkxAxiVLMkIYZ+UneEo/qtc730ozHeFdAoPwUwaNicRhkf/lp9/P7H8Wr
 YX2fma3aY7u7v0EZ3laEBL0Uxb9ZakFFqRMfRcUVtV/WbVB/xDhadSFmfN1Zg0QyAAgf LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnakjg31d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 14:51:54 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 365Enw0T027057;
	Wed, 5 Jul 2023 14:51:54 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rnakjg309-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 14:51:54 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3654rDNT022555;
	Wed, 5 Jul 2023 14:51:52 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3rjbde2n3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Jul 2023 14:51:52 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 365EpnZ121561962
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Jul 2023 14:51:49 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B948020043;
	Wed,  5 Jul 2023 14:51:49 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A032620040;
	Wed,  5 Jul 2023 14:51:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.171.79.178])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  5 Jul 2023 14:51:48 +0000 (GMT)
From: Laurent Dufour <ldufour@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 03/10] cpu/SMT: Move smt/control simple exit cases earlier
Date: Wed,  5 Jul 2023 16:51:36 +0200
Message-ID: <20230705145143.40545-4-ldufour@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230705145143.40545-1-ldufour@linux.ibm.com>
References: <20230705145143.40545-1-ldufour@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: AhOybAAUWlRm613PfmtCAgKhSQhaFbUH
X-Proofpoint-GUID: 8AnUnclHJ25gcTnK1cj9J-FOkWU8hm9x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-05_06,2023-07-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 mlxscore=0 clxscore=1015 phishscore=0
 spamscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2307050131
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
Cc: linux-arch@vger.kernel.org, dave.hansen@linux.intel.com, linux-kernel@vger.kernel.org, mingo@redhat.com, bp@alien8.de, npiggin@gmail.com, tglx@linutronix.de, rui.zhang@intel.com
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
index e02204c4675a..b6fe170c93e9 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -2841,6 +2841,12 @@ __store_smt_control(struct device *dev, struct device_attribute *attr,
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
@@ -2850,12 +2856,6 @@ __store_smt_control(struct device *dev, struct device_attribute *attr,
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

