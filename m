Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 171A093F6B3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 15:30:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UZlMKw37;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXfPM08kbz3cYy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 23:30:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UZlMKw37;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=stefanb@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXfNf3VL6z2xWb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 23:29:53 +1000 (AEST)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TAPIf4007086;
	Mon, 29 Jul 2024 13:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
	:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding; s=pp1; bh=eB6A9MrJh03YG6Qvz7znj4iY3W
	40u7jTthKBXdGxDA0=; b=UZlMKw37sIjJ7e2ackZCJs0HMNd4xtoR8nlArIBJtn
	Nb3FIwgsD2EmLh/GTbfWNv/1RSRMN4NdnA6O4U3jK00t8cD7dQ8pAwKSKPjrn6sR
	aFIhu8h8hSwf+zf5bp5CNkXfr/j+GAldcnFLqDItyJGzcQeFIYf6VnahDrdIW/HJ
	5VLsw28qoD/y3/2T48mvFYzjp+ogqzqLFCnmV1EkuN+nXClA35IBf8YGKvpJ5Lcm
	BudBgAvF3Cu3zE3/pvwjZ+ifN/7LqswzqFsWnGLlSGhAsTTgHr2g794Zf7jctelL
	4GaftpPzJhWwzvpWz/PvRifUgEL4NoUJgXoS0CxLeOeQ==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 40mtbemt64-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 13:29:45 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 46TDNZAn029128;
	Mon, 29 Jul 2024 13:29:43 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 40nbm0f0at-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 13:29:43 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 46TDTevW41288180
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jul 2024 13:29:42 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DF1D5804B;
	Mon, 29 Jul 2024 13:29:40 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B3FF58066;
	Mon, 29 Jul 2024 13:29:39 +0000 (GMT)
Received: from sbct-3.pok.ibm.com (unknown [9.47.158.153])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 29 Jul 2024 13:29:39 +0000 (GMT)
From: Stefan Berger <stefanb@linux.ibm.com>
To: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        jarkko@kernel.org
Subject: [PATCH v2] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize session support
Date: Mon, 29 Jul 2024 09:29:34 -0400
Message-ID: <20240729132934.311136-1-stefanb@linux.ibm.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: J_OEySM1r_qOd12P0g-88e86lwWUiQKw
X-Proofpoint-GUID: J_OEySM1r_qOd12P0g-88e86lwWUiQKw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-29_11,2024-07-26_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 clxscore=1011 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 bulkscore=0 suspectscore=0 phishscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407290090
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
Cc: naveen.n.rao@linux.ibm.com, linux-kernel@vger.kernel.org, zohar@linux.ibm.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit d2add27cf2b8 ("tpm: Add NULL primary creation") introduced
CONFIG_TCG_TPM2_HMAC. When this option is enabled on ppc64 then the
following message appears in the kernel log due to a missing call to
tpm2_sessions_init().

[    2.654549] tpm tpm0: auth session is not active

Add the missing call to tpm2_session_init() to the ibmvtpm driver to
resolve this issue.

Fixes: d2add27cf2b8 ("tpm: Add NULL primary creation")
Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
---
 drivers/char/tpm/tpm_ibmvtpm.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/char/tpm/tpm_ibmvtpm.c b/drivers/char/tpm/tpm_ibmvtpm.c
index d3989b257f42..1e5b107d1f3b 100644
--- a/drivers/char/tpm/tpm_ibmvtpm.c
+++ b/drivers/char/tpm/tpm_ibmvtpm.c
@@ -698,6 +698,10 @@ static int tpm_ibmvtpm_probe(struct vio_dev *vio_dev,
 		rc = tpm2_get_cc_attrs_tbl(chip);
 		if (rc)
 			goto init_irq_cleanup;
+
+		rc = tpm2_sessions_init(chip);
+		if (rc)
+			goto init_irq_cleanup;
 	}
 
 	return tpm_chip_register(chip);
-- 
2.45.2

