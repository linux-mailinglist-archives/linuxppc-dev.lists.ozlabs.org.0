Return-Path: <linuxppc-dev+bounces-16244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC1IDQioc2lnxwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16244-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 17:55:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 559D478ADD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 17:55:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyPFH3Wx4z2yF1;
	Sat, 24 Jan 2026 03:55:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769187331;
	cv=none; b=TFfCFLDo2cGQvPXhFh1OAQtT55LVEI7UIfkOlSanpzm2pBtquFRB5KJmcnerryfYT2vUVQpYN2chzKXx40RqyLCFIGdSw5ucX46viBo0iB/3h93RmV1gEDSJCRVcvDTbi7XBwo69zga1s2zzsyEOKrfDtaD1qZcS9rLv/+AMHa1/5jhgo/Y0yeSukh8J45uCX+elp76Wje/+w1YF1OtU63N4By3l/QeLl2qd2/Z4TJlb6VNs17zhjcqpTEqcQ2Acjn+8Zt/m/Z/0UJ8I22JjMU2gJAWUiU7/1QMmFrVBUsJ8F6Yz838Fydl7RlHpaXCY4hV5vzqttf7+5sLcv7aMxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769187331; c=relaxed/relaxed;
	bh=sSSObmaBHzSZGv4otVJv66VVl55JRC8Pf8MrfzKU3xM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cySHcHIP7uN2fN2S6LUmZb2vv7lXDmeHm/VGbTvvtRQbbna0JV+Gy7/dJGXNiRDkvulWYelAnz43Rx1Sn92Ff1WwUZdFWaq2x3AAw+giUKB6yAMfXDSx8OufOq7BPQcZ4jRg4JGvViVYRriYdWqmKudgBwIjL1ZX/pWYMA+4tZzX6zmGsU+KjBpnlUhqtUqpxhku7wWRf2GpM5sc6YEA0OFYyzYO8gYOFLpWCvDFEeb62aKfLQ7qmYkzeHo43FtTG9bDCrM90c36J3FMB0JvPP8M8TqqS4VYICf6/QptB+MXGc/0XO6GAFvABGOfh3Es0G/HkJr2h8t9ioiER1VyGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k7fcMRav; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k7fcMRav;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyPFG2h3Jz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 03:55:30 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60NCHVLX006245;
	Fri, 23 Jan 2026 16:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=sSSObmaBHzSZGv4ot
	VJv66VVl55JRC8Pf8MrfzKU3xM=; b=k7fcMRavhE5QgpXpAV6bquaPoTBVfVyBU
	d2RRvQVRVJ7FiNPxUxHuptbI9QeKgCN/gZfOc5tm5vxMLUDz7hmjLFrWK1RXZYWg
	3qEj8o4nlAAsnpZ4l+o7yxpi+3XJ7DkL+3E//nvNDv5FOUDA84M5JXRCLE+X115Q
	SLzFpaPZnkAiUUVCq1R/ZHy9+9cAA56odq3bhSz/P9lPxUOS6GtKXm+u15uwBo2W
	7Ceo3e4zbQ9zXWJuF1XT2jBXmAbJmIJ2vYapimXVibqvFP6+xfr+vC+m3Xo3Zc1v
	GOVwUEoTKFI++I30Y8FJiAJ0nmTlt46tqkY8NMtEcL8v6ExZJnrDA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23sh9sn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 16:55:18 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60NGtIJx014779;
	Fri, 23 Jan 2026 16:55:18 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br23sh9sk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 16:55:18 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60NGWJuR024575;
	Fri, 23 Jan 2026 16:55:17 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brxas8ga8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 16:55:17 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60NGtCfR51053008
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 16:55:13 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C907C20043;
	Fri, 23 Jan 2026 16:55:12 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 17E2A20040;
	Fri, 23 Jan 2026 16:55:09 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.24.251])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 16:55:08 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        stefanb@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
        ssrish@linux.ibm.com
Subject: [PATCH 1/2] keys/trusted_keys: fix handle passed to tpm_buf_append_name during unseal
Date: Fri, 23 Jan 2026 22:25:03 +0530
Message-ID: <20260123165504.461607-2-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260123165504.461607-1-ssrish@linux.ibm.com>
References: <20260123165504.461607-1-ssrish@linux.ibm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MoLwE31rfx7i8-GuLQPgs9pBEn8jRUew
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEyNiBTYWx0ZWRfXwJqjHt/+m8MH
 3Wg51FmYSC2KbpxjvF8wORafer6kypv8d6POsKb+e5R6+kSv8QWuDiWnm8G/C2ck3+SL9qC5UgC
 popO/dt70otSTXTXlStK+QSEo/oDVSJaBkjLVUJNQWSdUOXXTkpJJBHzcjFykS5Kp3+Ddq33e5x
 NZUIVWBaaUSy5Bzt+70K60eTqSIBh5OT7+YFQxfT/Wn8j2kvMBpat5qYnezOfUnxW1+N7tD0+Hg
 1tpIinqeCEhUzharpHUj3fmr4ZrX9+gyXpdMzCzYnQ0yiGkaoBdvFVvFYexwyZajXXbCVyT7XRD
 vCe03e/YWC0T+1z2MRH8/IanpZ10cE3GspXBWxQmDJuJHtn1AWxxuXISLEKrsumAMXl9PyT/6K4
 owMJzrc+eDSPL4n04JruPwmK5BTmdK3ZH+eAXRtWs2oqB1NamegdIRTBYtMU6cgI1Av3T81OR6X
 K9Cv/zkdO7jFN26PEgw==
X-Authority-Analysis: v=2.4 cv=J9SnLQnS c=1 sm=1 tr=0 ts=6973a7f6 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=xt6ew7UTAAAA:8 a=VnNF1IyMAAAA:8
 a=EpWLErYAll7kcGvWJ9YA:9 a=tn93DeGZTgJ6DdWMtdD4:22
X-Proofpoint-ORIG-GUID: tOxMknpbSxKblg1LmuFLTb5WundC0547
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 adultscore=0 suspectscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601230126
X-Spam-Status: No, score=0.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,URI_WP_DIRINDEX autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,HansenPartnership.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-16244-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:stefanb@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ssrish@linux.ibm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.153];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWELVE(0.00)[12];
	DKIM_TRACE(0.00)[ibm.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	HAS_WP_URI(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[16];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: 559D478ADD
X-Rspamd-Action: no action

TPM2_Unseal[1] expects the handle of a loaded data object, and not the
handle of the parent key. But the tpm2_unseal_cmd provides the parent
keyhandle instead of blob_handle for the session HMAC calculation. This
causes unseal to fail.

Fix this by passing blob_handle to tpm_buf_append_name().

Fixes: 6e9722e9a7bf ("tpm2-sessions: Fix out of range indexing in name_size")

References:
[1] trustedcomputinggroup.org/wp-content/uploads/
    Trusted-Platform-Module-2.0-Library-Part-3-Version-184_pub.pdf

Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
---
 security/keys/trusted-keys/trusted_tpm2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/security/keys/trusted-keys/trusted_tpm2.c b/security/keys/trusted-keys/trusted_tpm2.c
index a7ea4a1c3bed..6340823f8b53 100644
--- a/security/keys/trusted-keys/trusted_tpm2.c
+++ b/security/keys/trusted-keys/trusted_tpm2.c
@@ -465,7 +465,7 @@ static int tpm2_load_cmd(struct tpm_chip *chip,
 }
 
 /**
- * tpm2_unseal_cmd() - execute a TPM2_Unload command
+ * tpm2_unseal_cmd() - execute a TPM2_Unseal command
  *
  * @chip: TPM chip to use
  * @payload: the key data in clear and encrypted form
@@ -498,7 +498,7 @@ static int tpm2_unseal_cmd(struct tpm_chip *chip,
 		return rc;
 	}
 
-	rc = tpm_buf_append_name(chip, &buf, options->keyhandle, NULL);
+	rc = tpm_buf_append_name(chip, &buf, blob_handle, NULL);
 	if (rc)
 		goto out;
 
-- 
2.43.0


