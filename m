Return-Path: <linuxppc-dev+bounces-2554-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 013059AF1AB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 21:13:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XZFtc50Grz3bbm;
	Fri, 25 Oct 2024 06:13:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729797192;
	cv=none; b=Z+uXX5DOxVDqEdjJPU9vXDa2aZxMlC83Ry9qfeRB5GRuca3alLHPcgwUk8AxVLUA0pW5XbASfz08XeKqyWx8Lo32CP256u7caEAADer6lpUTJckoESWe1qdeqB+Sks2TGXMCCXSMasqZrW+Idct5YUPHXdBY1kdsbi2FPb8QStzSNRMtV1WiA9xzxkRULw6hcf9RUXFiStp0Nx3DWC4VRS/9hKkIs+dt9rsIEXmJ9TeO1h1kahhgz1+IQ6UH8fNuS4eoxyzDe35DT7AW9ewyoTrEYFdg+gXKXmAFNFRFsWBcScyBjVD7w/bK4dumByA7LTVDpTY1O8q3rWK4Q08LTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729797192; c=relaxed/relaxed;
	bh=L1mgv8Oo2aiSACGAkiajajPkSyZIlsaky/nqHxX6wDk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cp9NzhMi0J2iIYygcWX/Jvrx5GWikCZGg08X6Kcq25l6oSJQukBAchZ0kfSroVgncOEdEzQ6bzMMxR3uePSJ+1C4sOxXZF9CG2SrAgg5TYsKArGJdwQyeo4gtbqkH3hMGg54mSG5fK5pIhq3+RJQf10PAxd6GdgQ2YDNBIihLlJ8ir7YtOrPIqxQQALPOyZcLE5eROVxYVNf4EjwgM/Af9yU8DHcnFpzfFn3dmIpUbKxYj97ANGl0rYkFuJoS9+jMwR0ukIRNOw3yKfflgthlDTR0ep0AlEcMNwr8q/daow1pEyz7BzTRIoteqoTWvBPX06OikJtIRdtKR7LCJXbDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sTSYez4o; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sTSYez4o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XZFtb4y95z3bZs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2024 06:13:11 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49OFcbKU002139;
	Thu, 24 Oct 2024 19:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=L1mgv8Oo2aiSACGAkiajajPkSyZIlsaky/nqHxX6w
	Dk=; b=sTSYez4oB3UZf1PazTG4xjYP1QtJwyEJyOdl4dTAsf083VCekB/Rnq/4b
	d9VL81JkOssrwco0vApwDaGLsLtiacJ7/TwxYz3VMiYUHmk3fkcshT9StpYRMWl3
	NDiqFbMGNqhgwOU2jDPp612fUfhmHucrOJ4SPFr/rifXlK8s++d4ZPxpBzWoHU0y
	TVRQX68wpIWQ95PLNtFUi54RMMZbE+R0mshlDQq1aqThy8lDB+H3S4+SfP7ZieI9
	Baqz6nwbIP6GQsQmyaMLk7HGvT/lMPUnz6XWP722HkmFScv6cF3hrXKYYPf8uqk5
	vVN5SULtYPN4+pgR+vKZ1lyvFlnQw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42fgyuuqdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 19:12:59 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49OJCxNW031392;
	Thu, 24 Oct 2024 19:12:59 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42fgyuuqde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 19:12:59 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49OI2HDH014287;
	Thu, 24 Oct 2024 19:12:58 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42emhft1c0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 19:12:57 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49OJCra052429196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Oct 2024 19:12:53 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C52D820043;
	Thu, 24 Oct 2024 19:12:53 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFAB020040;
	Thu, 24 Oct 2024 19:12:51 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.43.37.181])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 24 Oct 2024 19:12:51 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        maddy@linux.ibm.com, peterx@redhat.com, groug@kaod.org,
        sshegde@linux.ibm.com, mchauras@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/xmon: symbol lookup length fixed
Date: Fri, 25 Oct 2024 00:42:33 +0530
Message-ID: <20241024191232.1570894-2-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: p9m36YE5cZSWDNycHutVENENPzhQoSTW
X-Proofpoint-GUID: QFUPqyUUvpFtObGIeQ53XbNoAJBawy1y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=992 spamscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240155
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently this cannot lookup symbol beyond 64 characters in some cases
like "ls", "lp" and "t"

Fix this by using KSYM_NAME_LEN instead of fixed 64 characters

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/xmon/xmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

ChangeLog v1 -> v2:
  - Commit message updated with commands

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index e6cddbb2305f..22b8b5cc4df0 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3662,7 +3662,7 @@ symbol_lookup(void)
 	int type = inchar();
 	unsigned long addr, cpu;
 	void __percpu *ptr = NULL;
-	static char tmp[64];
+	static char tmp[KSYM_NAME_LEN];
 
 	switch (type) {
 	case 'a':
@@ -3671,7 +3671,7 @@ symbol_lookup(void)
 		termch = 0;
 		break;
 	case 's':
-		getstring(tmp, 64);
+		getstring(tmp, KSYM_NAME_LEN);
 		if (setjmp(bus_error_jmp) == 0) {
 			catch_memory_errors = 1;
 			sync();
@@ -3686,7 +3686,7 @@ symbol_lookup(void)
 		termch = 0;
 		break;
 	case 'p':
-		getstring(tmp, 64);
+		getstring(tmp, KSYM_NAME_LEN);
 		if (setjmp(bus_error_jmp) == 0) {
 			catch_memory_errors = 1;
 			sync();
-- 
2.47.0


