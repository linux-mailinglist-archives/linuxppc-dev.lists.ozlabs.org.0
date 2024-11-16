Return-Path: <linuxppc-dev+bounces-3338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2C99D00A8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2024 20:25:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrP3X35Jdz2yhG;
	Sun, 17 Nov 2024 06:24:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731785096;
	cv=none; b=nA5FSemds2tQjtSL6EVHauYl6tpaCndHHd15nM1kuKrXwl+74vjOgpr3qJ1dbRq8yMUEr/tA6+9XwbqU2wM7ifyS0QNA7YBLc7iQMuF02nn6hFeGuRSmYt4+dJpHyKEoPXTcbjkm3378Kg3AFgKtmC1L4HpgKozp6C/Db2hKHfM9tm04yoHuW7q/ikZpe5DNcF5YIwI42AYwLz/OsV4+dKkMVefcV6CrLNFX5NtLkCAZT0e+bIPphAmkjis21MPokNi6ZWATmKT+Ah3mjQRnTSVDMa4MKQ6z8kTWSpeOTfnNDhBd0h40tj+kXY365DYs8EU/HDXuN8mciyfAIjfKQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731785096; c=relaxed/relaxed;
	bh=VrXm4CcyPZMofJB5rtl6eM3KG+92o/0fEeQSzM6etFs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUK5h544gOhj/PUYYzt+yp/HYXGHhgFEaQRl1vpdO/LOS4XZ5wsvDJ8szRvsFt7tZWZDYBQXJsrhHq9/M6wcK96m7MaAbI/j4EeRQiVc7Xu/fIVgaAP3APVSFtG7ltOo7ICgB0vNWBUlYDMIGFFZarvSp2fZOmGaNvtA3qOv1qP8Ln2pRPH+e8V8FJupMfjhqKowpjzsUjtLz61qxpioz561sbncALB9plOoAkdlClqaY1jjNxAL4eqDzGYPtQqr8HRlT3N/JOhE4dJsiNj5VQVmWBmvHP3xQk27DX8dtmnzDgMeqgDu+Lytp6f5d4Q/avHMrRGcIYJfyjpBAoQBHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pQpo47wX; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pQpo47wX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrP3W33m4z2ygx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 06:24:55 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AGHTUjs023793;
	Sat, 16 Nov 2024 19:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=VrXm4CcyPZMofJB5r
	tl6eM3KG+92o/0fEeQSzM6etFs=; b=pQpo47wXALyEOOOKSd7JCZodJRCH1EJKB
	Pozagr59R9uczuih6FsJg3w/GGg38Y3YSY4TSgHseUlDsynzPMnBhUKwBaHqFnYA
	N4OWbLgHJN19aS90WVBDDb+KgnhRCPK2OZAA48oDFeP5NIzKqeGEFPfZjkByZl+R
	UVWsxSc/HlcMYwmF7ErNBo2zBQG9smUxPxM/9UluvvFqD4GvngfV/5UaYI8dgbZk
	BLpp6MUz16H/Ord4ajOEi+aTj2U4g3B/9oqLQ/cGJtWWYq/1F/ifNBbCqNKwfSWj
	TNP9PUxtLcD3ee64RaPw+o87QArPGRO5PODSeDuJFo+dQ7OxesrDg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xyu18ag9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Nov 2024 19:24:34 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4AGJK7ZL032457;
	Sat, 16 Nov 2024 19:24:33 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42xyu18ag7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Nov 2024 19:24:33 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AGHwjVa008392;
	Sat, 16 Nov 2024 19:24:32 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 42tjf0y5hc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Nov 2024 19:24:32 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AGJOTmb53412138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 16 Nov 2024 19:24:29 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03D3520043;
	Sat, 16 Nov 2024 19:24:29 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BAC4120040;
	Sat, 16 Nov 2024 19:24:26 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.220.93])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 16 Nov 2024 19:24:26 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, bigeasy@linutronix.de, ankur.a.arora@oracle.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] powerpc: Large user copy aware of full:rt:lazy preemption
Date: Sun, 17 Nov 2024 00:53:06 +0530
Message-ID: <20241116192306.88217-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20241116192306.88217-1-sshegde@linux.ibm.com>
References: <20241116192306.88217-1-sshegde@linux.ibm.com>
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
X-Proofpoint-GUID: EdNCyaoVO74elOKg6CZ6IappUiebcywk
X-Proofpoint-ORIG-GUID: -mJAzlN_T8nOW_D2ZgQuWCuNhBTMAScI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 bulkscore=0 spamscore=0 mlxlogscore=999 adultscore=0 mlxscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411160165
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Large user copy_to/from (more than 16 bytes) uses vmx instructions to 
speed things up. Once the copy is done, it makes sense to try schedule 
as soon as possible for preemptible kernels. So do this for 
preempt=full/lazy and rt kernel. 

Not checking for lazy bit here, since it could lead to unnecessary 
context switches.

Suggested-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 arch/powerpc/lib/vmx-helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
index d491da8d1838..58ed6bd613a6 100644
--- a/arch/powerpc/lib/vmx-helper.c
+++ b/arch/powerpc/lib/vmx-helper.c
@@ -45,7 +45,7 @@ int exit_vmx_usercopy(void)
 	 * set and we are preemptible. The hack here is to schedule a
 	 * decrementer to fire here and reschedule for us if necessary.
 	 */
-	if (IS_ENABLED(CONFIG_PREEMPT) && need_resched())
+	if (IS_ENABLED(CONFIG_PREEMPTION) && need_resched())
 		set_dec(1);
 	return 0;
 }
-- 
2.43.5


