Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A017F74349D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 07:57:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XNgcquj7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qsl365fXtz3btq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jun 2023 15:57:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XNgcquj7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qsl285088z302R
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jun 2023 15:56:47 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35U5l7Ab021335;
	Fri, 30 Jun 2023 05:56:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=Tf6cj+h9jeHfj+a/aY3L5KYxzE7xOSns3FleMysM8bg=;
 b=XNgcquj721Ocs4I0SH8728bJBZvW9ibUzvp8lxRM14OTtLQmMi8pwjWNE3x1rcrjUycV
 R3mPULW8ouwMz9IJWU8AawZPO1S+JOYMePdMzy3cWEeugBXDtuEqDtouxsYdfH6O2SDK
 BS6kVIncfngFcj+DU9ODWyarbwNuBFG5XU2xb4NuTj4y0EpSfDdPabqic6oWm31zSJBc
 bE5E3H1ItRBU8dK+IuDbuBKTq+1kiaczVVTggdO5UzJ+TArtt1SPfl4lfoLnsrj3jJbY
 gwt2MMBouZpD4w8ouB3xG5vIw8QKGJvRWLIB/OMMuebQRAXj6MCXZmnWw8Y+lYuvqdhP 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhs75r5xa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 05:56:39 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35U5lunb022168;
	Fri, 30 Jun 2023 05:56:39 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rhs75r5wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 05:56:39 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35U3sBUn023261;
	Fri, 30 Jun 2023 05:56:37 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3rdr452xeb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jun 2023 05:56:37 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35U5uZp049938708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jun 2023 05:56:35 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FECA20043;
	Fri, 30 Jun 2023 05:56:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C0BEF20040;
	Fri, 30 Jun 2023 05:56:33 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 30 Jun 2023 05:56:33 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Subject: [PATCH] arch/powerpc: Remove unnecessary endian conversion code in XICS
Date: Fri, 30 Jun 2023 11:26:28 +0530
Message-Id: <20230630055628.17790-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.39.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: SkgRipbPxWsXhcbs8NscDtbZRA84apYa
X-Proofpoint-GUID: BaDK2tKwHJMDmF4nD6LofJ4ViClp_LxS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-30_02,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 mlxlogscore=999 impostorscore=0 bulkscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306300048
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
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove an unnecessary piece of code that does an endianness conversion but
does not use the result. The following warning was reported by Clang's
static analyzer:

arch/powerpc/sysdev/xics/ics-opal.c:114:2: warning: Value stored to
'server' is never read [deadcode.DeadStores]
        server = be16_to_cpu(oserver);

As the result of endianness conversion is never used, delete the line
and fix the warning.

Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/sysdev/xics/ics-opal.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/sysdev/xics/ics-opal.c b/arch/powerpc/sysdev/xics/ics-opal.c
index 6cfbb4fac7fb..5fe73dabab79 100644
--- a/arch/powerpc/sysdev/xics/ics-opal.c
+++ b/arch/powerpc/sysdev/xics/ics-opal.c
@@ -111,7 +111,6 @@ static int ics_opal_set_affinity(struct irq_data *d,
 		       __func__, d->irq, hw_irq, rc);
 		return -1;
 	}
-	server = be16_to_cpu(oserver);
 
 	wanted_server = xics_get_irq_server(d->irq, cpumask, 1);
 	if (wanted_server < 0) {
-- 
2.39.3

