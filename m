Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC083724A4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 05:09:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZ4ZM4xsfz30Gt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 13:09:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BfLe8U6E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=BfLe8U6E; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZ4SD64zPz2yyb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 13:04:12 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 144347Bh134882; Mon, 3 May 2021 23:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=g+VPU2PigfWhPtCi+ELQgZIjtOe9AsXs7wWOhX27W1Y=;
 b=BfLe8U6E9cnzoUOFSnslhuOaJPaBvv6jLtSIha9RsHsmvAJ+73cxp59WuctXp2oBNToQ
 lFlnv++5DkDcXuhBDNrOsoWOAT+gqdZAgjcIrlflGiZxVpj3eeZhFB8ngstJ2l2UPmwJ
 D4iv/EcV4KfknZJt9hgSlC5edZaXuY39Y7QjK04vZcv/S/IikeFExlllaHUTOLc7iJZz
 zJ4Z4nbX0oSBtzls5wupl8GNLXFHvEE13BFtDC1WdqK0ZKfMcHx996CLS9DJ8j+MbSJq
 PfS2ZOkRbw19H0gGU70FZKuU4/DabTUpjdLFBmQo87m2ZKk65MbTchqe2dHpdqbupvxM +w== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38avfc1nqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 May 2021 23:04:07 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 1442vgV6031765;
 Tue, 4 May 2021 03:04:07 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma04wdc.us.ibm.com with ESMTP id 388xm8thff-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 04 May 2021 03:04:07 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 144346ai46989684
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 4 May 2021 03:04:06 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A42A2AC059;
 Tue,  4 May 2021 03:04:06 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5E33AAC060;
 Tue,  4 May 2021 03:04:06 +0000 (GMT)
Received: from localhost (unknown [9.211.126.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  4 May 2021 03:04:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC 09/10] powerpc/rtas: convert to rtas_sched_if_busy()
Date: Mon,  3 May 2021 22:03:57 -0500
Message-Id: <20210504030358.1715034-10-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210504030358.1715034-1-nathanl@linux.ibm.com>
References: <20210504030358.1715034-1-nathanl@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3OkfqhFo-lDHpXc4aSQAbalkyrHj2Gqs
X-Proofpoint-GUID: 3OkfqhFo-lDHpXc4aSQAbalkyrHj2Gqs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-04_01:2021-05-03,
 2021-05-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105040023
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
Cc: aik@ozlabs.ru, ajd@linux.ibm.com, tyreld@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

rtas_sched_if_busy() has better behavior for RTAS_BUSY (-2) and small
extended delay values.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 4177f7385ea2..c5cc4542856f 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -743,7 +743,7 @@ int rtas_set_power_level(int powerdomain, int level, int *setlevel)
 
 	do {
 		rc = rtas_call(token, 2, 2, setlevel, powerdomain, level);
-	} while (rtas_busy_delay(rc));
+	} while (rtas_sched_if_busy(rc));
 
 	if (rc < 0)
 		return rtas_error_rc(rc);
@@ -761,7 +761,7 @@ int rtas_get_sensor(int sensor, int index, int *state)
 
 	do {
 		rc = rtas_call(token, 2, 2, state, sensor, index);
-	} while (rtas_busy_delay(rc));
+	} while (rtas_sched_if_busy(rc));
 
 	if (rc < 0)
 		return rtas_error_rc(rc);
@@ -822,7 +822,7 @@ int rtas_set_indicator(int indicator, int index, int new_value)
 
 	do {
 		rc = rtas_call(token, 3, 1, NULL, indicator, index, new_value);
-	} while (rtas_busy_delay(rc));
+	} while (rtas_sched_if_busy(rc));
 
 	if (rc < 0)
 		return rtas_error_rc(rc);
@@ -990,7 +990,7 @@ void rtas_activate_firmware(void)
 
 	do {
 		fwrc = rtas_call(token, 0, 1, NULL);
-	} while (rtas_busy_delay(fwrc));
+	} while (rtas_sched_if_busy(fwrc));
 
 	if (fwrc)
 		pr_err("ibm,activate-firmware failed (%i)\n", fwrc);
-- 
2.30.2

