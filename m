Return-Path: <linuxppc-dev+bounces-2224-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 731B199CC94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 16:17:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRznY2Z7Pz3bmf;
	Tue, 15 Oct 2024 01:17:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728915425;
	cv=none; b=X+l5fXjdi1eRLiVValGdNde1BekmNwccyo93qd7dm9eizZ8SnPb7pWT8vQqLDKQiBgM3GM/jLQCiH8V3HPLcwLyl1yt9L4aoERdQ9dNs/OsmMIJEvc2fK8emDRavCFwLK/2pjC0RFVal5M6UXx7NW5UppCMYMAQy2Ah62KoFxH6i92ArfxLgwsbrYsxetyNKX1kUZOcQEtMykyldoYw+7l5Wb3YKEXTUNxA1/Sm7tGqTVCcmS9k6yNv9NmbK3tqnYMhm/1rkWT6ABHqeL/r9u4/JJMIhnUYkthJCtTXpNb+L9JMb8WvoMs4UxhVMTUcj5GsG+SPmCBy991V6o7PK3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728915425; c=relaxed/relaxed;
	bh=V4ZSJh+/gINXd1XQOEDszc54S60PZh0QEq00yayxAHg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MosJY0rIn8S63LfzdMNwTsDdUyNjqJD2aYz87yPeFLG6yQ8OItAdU5CcleOJQZf1ybXWSQc+8TWU1kV83f3pIZfkCKEAJ1IvwDfMagqdMmV3CrOKVH5kY/I0p+Ft7VfU2mPLUsnXlB/tRSyIDaTjjHv46a13Kv+KojacVyn8pC3HF6eaL6/IXKx/Mice6tj1q8Ooakfy+RlDWLyWOWO7yTNVdO0p6yP8CIfmDX/nmfa2x1KQEVK4U5cbudrym8vIlskyLGbmODmo/VPn9okTXtRVrSy0NIUuqd379Sw0ekagF5M160pgSeA9Ltfpfb9c2LPxrjO2qKWDlyd1JPr95A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sDGyU9dh; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sDGyU9dh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRznW69VQz2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Oct 2024 01:17:03 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49EDo2Ur025375;
	Mon, 14 Oct 2024 14:16:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=V4ZSJh+/gINXd1XQOEDszc54S6
	0PZh0QEq00yayxAHg=; b=sDGyU9dh+SuUWfYRzRCNWixcdxcacaebP5R8sCvDut
	XLvXwayQHy/6FDSKyk3qH6kmYbUJJiS0/frNdLe/Nwr203rXSjRjFjCkT5WwoSrd
	9I8u5hQZRW5b/3T5sP6rlpYC4DtfzdSA9UV26CpKjkLPPsbht2LlKUzFeZ+Z6W1W
	24YAF/d9rExQ1pBdEeqAl0t/W28YTrfEDlNGR+zJkwAu1mmRIwcdEZM1RarNhKAz
	Nlo+QLxPK4G7j0Vs4W9Y5TeBOwZGhvhKrFdHIoQB/1um20kWkMf25qnfvKBfZxPR
	C3tXa4WWcm47Nir49Hy5y/oahxnRx66uXGXyBZAX+QJw==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4294heg4kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 14:16:58 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49EDmwnB027452;
	Mon, 14 Oct 2024 14:16:57 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4283txf2ee-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 14:16:57 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49EEGutp48497024
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Oct 2024 14:16:56 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6873558056;
	Mon, 14 Oct 2024 14:16:56 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 110005803F;
	Mon, 14 Oct 2024 14:16:56 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 14 Oct 2024 14:16:55 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        jarkko@kernel.org
Cc: linux-kernel@vger.kernel.org, Stefan Berger <stefanb@linux.ibm.com>
Subject: [PATCH] tpm: ibmvtpm: Set TPM_OPS_AUTO_STARTUP flag on driver
Date: Mon, 14 Oct 2024 10:16:43 -0400
Message-ID: <20241014141643.3101129-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0aBf7fkdgq3XZUQFyWYEQFy7zRSFB2aG
X-Proofpoint-GUID: 0aBf7fkdgq3XZUQFyWYEQFy7zRSFB2aG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-14_10,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 mlxscore=0 spamscore=0 mlxlogscore=999 impostorscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140103
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Set the TPM_OPS_AUTO_STARTUP on the driver so that the ibmvtpm driver now
uses tpm2_auto_startup and tpm1_auto_startup like many other drivers do.
Remove tpm_get_timeouts, tpm2_get_cc_attrs_tbl, and tpm2_sessions_init
calls from it since these will all be called in tpm2_auto_startup and
tpm1_auto_startup.

The exporting of the tpm2_session_init symbol was only necessary while the
ibmvtpm driver was calling this function. Since this is not the case
anymore, remove this symbol from being exported.

What is new for the ibmvtpm driver is that now tpm2_do_selftest and
tpm1_do_selftest will be called that send commands to the TPM to perform
or continue its selftest. However, the firmware should already have sent
these commands so that the TPM will not do much work at this time.

Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 drivers/char/tpm/tpm2-sessions.c |  1 -
 drivers/char/tpm/tpm_ibmvtpm.c   | 15 +--------------
 2 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/char/tpm/tpm2-sessions.c b/drivers/char/tpm/tpm2-sessions.c
index 511c67061728..b1a0a37f14d7 100644
--- a/drivers/char/tpm/tpm2-sessions.c
+++ b/drivers/char/tpm/tpm2-sessions.c
@@ -1362,5 +1362,4 @@ int tpm2_sessions_init(struct tpm_chip *chip)
 
 	return rc;
 }
-EXPORT_SYMBOL(tpm2_sessions_init);
 #endif /* CONFIG_TCG_TPM2_HMAC */
diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index 1e5b107d1f3b..76d048f63d55 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -450,6 +450,7 @@ static bool tpm_ibmvtpm_req_canceled(struct tpm_chip *chip, u8 status)
 }
 
 static const struct tpm_class_ops tpm_ibmvtpm = {
+	.flags = TPM_OPS_AUTO_STARTUP,
 	.recv = tpm_ibmvtpm_recv,
 	.send = tpm_ibmvtpm_send,
 	.cancel = tpm_ibmvtpm_cancel,
@@ -690,20 +691,6 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 	if (!strcmp(id->compat, "IBM,vtpm20"))
 		chip->flags |= TPM_CHIP_FLAG_TPM2;
 
-	rc = tpm_get_timeouts(chip);
-	if (rc)
-		goto init_irq_cleanup;
-
-	if (chip->flags & TPM_CHIP_FLAG_TPM2) {
-		rc = tpm2_get_cc_attrs_tbl(chip);
-		if (rc)
-			goto init_irq_cleanup;
-
-		rc = tpm2_sessions_init(chip);
-		if (rc)
-			goto init_irq_cleanup;
-	}
-
 	return tpm_chip_register(chip);
 init_irq_cleanup:
 	do {
-- 
2.43.0


