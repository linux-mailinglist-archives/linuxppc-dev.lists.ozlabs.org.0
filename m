Return-Path: <linuxppc-dev+bounces-2528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AAE9AD7A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2024 00:33:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYkMp2Ys0z2xrC;
	Thu, 24 Oct 2024 09:33:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729718648;
	cv=none; b=n/+YVdE2uhlOF9K8bVwt/CUWYmFYwTEkoUmQfVFIRzTWZcbAqDGxEFUpj0ZwVjdtyE7FwMrrTPloa4Lpw/DYs6IxB/gmAjJbgOtlRZ/rbwyusPfmJ7rdjKBM5yQG4DvQjeg7ljLGZ7kUKvj/dlsuFfEVbLJhQxUfFTVAVgY1LkM/gf+x0RhXE4yX8/xxbrFrb156ftsFbtkVfxWlna+7L7Gkl+Lg2wMoKe0Vy0hvAhOUJ7rqHXzCHUyVbOZkUOL8lVxzveII9jCzLDShJ2XZZsl84unygmv8/MKwEObwbQdGSfm+le8yiWF+gbfF43qcMWCk4cD8juE4tBUFkuFVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729718648; c=relaxed/relaxed;
	bh=w6/XyakDp8eyHd3VBcLyqRn+Elmw9FFQMqdtyMVrS+A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WByHh7MudKoDSfNUSM69D4D3W95I9CG/39czyke0l1q9mzQ+VG5LHa951/PHieQvWANgmj5y8GRsuxlK9TNDKzr/Fb/6gLuNJsC26sqEUe926k0PkWVTX3iupJEeILuOeMtVPcsZhkCEWhnPNhF/fiJBvQJEap+MiYXcVazWBNvyWKHTTcQsVB+MtMr2qpc5OfWHRuTPcuBeKGAACoDjMjahZitAQvSz6FclR0A2/hDbtGv3MqvkzlvpBPFL8nnZdkzAMbkHa+eYgz7G8DgrY3iNjXMZ0LpKXb6Q8yjIyQsIuaOXwBTJxNUs+ySGBSp1fRzRYwz/cvdX8ww+DSjR2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MHNiOOwR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MHNiOOwR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYhr66j5Tz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Oct 2024 08:24:06 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NF6Nkm018844;
	Wed, 23 Oct 2024 21:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=w6/XyakDp8eyHd3VBcLyqRn+Elmw9FFQMqdtyMVrS
	+A=; b=MHNiOOwRTXTNLIcJ8qovp1ULJCHb/32/cnJjAepOj8LMwy7K9z/QjAEYe
	1TpNsqKOsXqp2gi19UEPNJvbSyFq2QGXJdhNefm1dnEdrM7ovrTrEjDbvGyK+tIq
	H0jVLxYp1oubr/qevzqLK2pn34NuS0rw4V0BAlz/FG3JVQ6XGHvW8/a5LOsVS76j
	UH1fZzd+TgX5Aiz95c1n9nKdVzAhfY8YaiZAXcw7CocMUqYmUNkNnDDS8M9ofPxv
	e/fhf51qkAo44Vc/JMrfFf/YApR+GtXxShLAe8Ji6503tlvcTfgXdA2SAXkRJ8Pv
	QpH1wUOq0Nqw3tQl/NDbr4uO9YavQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emajn693-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 21:23:48 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49NLNlB2005536;
	Wed, 23 Oct 2024 21:23:47 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42emajn68y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 21:23:47 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49NIuGR8008807;
	Wed, 23 Oct 2024 21:23:46 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 42emkan1q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 21:23:46 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49NLNhRo37159224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 23 Oct 2024 21:23:43 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F08E620043;
	Wed, 23 Oct 2024 21:23:42 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C512F20040;
	Wed, 23 Oct 2024 21:23:40 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.43.16.156])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 23 Oct 2024 21:23:40 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: mpe@ellerman.id.au
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
        maddy@linux.ibm.com, peterx@redhat.com, groug@kaod.org,
        sshegde@linux.ibm.com, mchauras@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/xmon: symbol lookup length fixed
Date: Thu, 24 Oct 2024 02:52:26 +0530
Message-ID: <20241023212225.1306609-2-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ZIc45Zu_WHg3HGSQcqhevGIeHX6PQS-x
X-Proofpoint-GUID: _Cme4AwGfZ0ENcCz5ImKYShPdhRxUccL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 mlxlogscore=785 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410230136
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Currently xmon cannot lookup symbol beyond 64 characters in some cases.

Fix this by using KSYM_NAME_LEN instead of fixed 64 characters.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/xmon/xmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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


