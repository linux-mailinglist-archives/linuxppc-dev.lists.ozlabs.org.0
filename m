Return-Path: <linuxppc-dev+bounces-16245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEJLDQioc2mtxwAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 17:55:36 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F5878ADE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 17:55:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dyPFH4q19z2yFY;
	Sat, 24 Jan 2026 03:55:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769187331;
	cv=none; b=QOxsB9ZZFA1NFp2EQFn7LlZW2vIJE+vv46gAhTF4sbDLy8GxVt3GAQvetqEDJvAPCguDLkY9ROMduFBm4H8CEdvvVg5UrOz2l+b3WtMbBs1F7WirqoTEfJE6Ks+rqfEmsTw501uMDiT19JqMDbq6X22bUzVa96otd5Ry8WqjiQT5bE65Ui5TSDuqX6xkSb3o/Ls8cxmHVb03Lbv4d2jDOE6QttZTjU8W4fFtYxnLzYN0ufdJA59HAPBZYkj2a1qit22TsvG7LJItuvfjzeDwoYNH+xHAf0B8L48dHZI2Q/uHGKfDw96OSyfgx31SKBCqCiXGKQtrtOHtVU1Ts7oqBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769187331; c=relaxed/relaxed;
	bh=mAVb05/RS/j/lQA6wXu+0VFr45JJKxNpoWd7gnEZ7L4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=drPv+2UafHb7sbaSQEte4cKcxolRmxoib0dLmUfmLAF3OZFLEXfymrmVuqf0R1CBuleqNi9jWJVc4AerZj/O5s+bmUCJdJJwFCON5/MjdxWYlpf8IBo4bsPPhhCP/x4BZyJznncS8KD72kPRq6uJ+q2i3RaiT+NfiDaqAPVhXarZFUxbi+9KNUTFA19G/XcSNcoXsNUgJsyEJClZ3ZQNy8iEEwnfCoUToyZDp/qBPQ0AVuUCSSO+j99DP7AzL60tIjhg7mksabwcpUYFdPI+cyYmTFZQBlaIASyPPZ0Ss6S1/LpBd56c33WvH15sQGF1rkf4/+uHrt1TZ9+mtuKBRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M0xjmR3H; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M0xjmR3H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ssrish@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dyPFG0l8Qz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Jan 2026 03:55:29 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60NCaXMl019525;
	Fri, 23 Jan 2026 16:55:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=mAVb05/RS/j/lQA6wXu+0VFr45JJKxNpoWd7gnEZ7
	L4=; b=M0xjmR3HAcs7STeEt4nn8J6lkyIzNjqvrEnr+lTl089opU39EsV3knjvt
	LiI+8Y5fhNYl/QxWKFbyX0YFFN8GHPMxxhfE92LzRsacbr8RxA+PxhTgDYNvTNwL
	ieSmZmZ0bcc4nQA0p+lgKAIc8bU2jPGxpctvKKomMSBlvoiaJvIk2hgZCElC/kjH
	gNvbdJeSYFpfHKDLgqGTamXnGDAxCzezG2y10z88I4m3ZPHlSIUhiF4byFNsRDKu
	aaAB2woosUQaP/sG4gAL3HcsOUJEFc7TpoQFV+jlQenChiDDbNniGnEu5Vda14Nq
	msPzfjHWuVjF4FOUwMDviA30ILotA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br256h6vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 16:55:15 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60NGX7AK023219;
	Fri, 23 Jan 2026 16:55:14 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br256h6vg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 16:55:14 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60NF6LqE006393;
	Fri, 23 Jan 2026 16:55:13 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brqf21vpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jan 2026 16:55:13 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60NGt8pe46268924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 Jan 2026 16:55:09 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B190620043;
	Fri, 23 Jan 2026 16:55:08 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6CCD620040;
	Fri, 23 Jan 2026 16:55:05 +0000 (GMT)
Received: from li-fc74f8cc-3279-11b2-a85c-ef5828687581.ibm.com.com (unknown [9.39.24.251])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 Jan 2026 16:55:05 +0000 (GMT)
From: Srish Srinivasan <ssrish@linux.ibm.com>
To: linux-integrity@vger.kernel.org, keyrings@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, James.Bottomley@HansenPartnership.com,
        jarkko@kernel.org, zohar@linux.ibm.com, nayna@linux.ibm.com,
        stefanb@linux.ibm.com, rnsastry@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
        ssrish@linux.ibm.com
Subject: [PATCH 0/2] move TPM-specific fields into trusted_tpm_options
Date: Fri, 23 Jan 2026 22:25:02 +0530
Message-ID: <20260123165504.461607-1-ssrish@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEyNiBTYWx0ZWRfX/XL9OH1pVLeS
 8nhq/KSiicfO7Ttsey3Gun7ufUwLhPeV4mQEsW5mKBj5443mjamW9auT2OSmW/hpN5Me5CA/xe+
 2WDJhSMZ3uQOsAD3VvA3buMEt9zu/HEETKftIA3jdr+51YBO6FQ6SRKFZ4voS+srUbiNIuu8lIs
 WAHzSZZ5jfitRk+3V0F2xakndoHZjlbMWHG5WD/pouMJ7ibT6YqAMsSkKrXZU2MvRhEovePlC5n
 6fVvyuhhfLWZyZBODNTxW+mZ4oSZ1VIE0ohZL4d1bKRgYOmAPQBVWU0+RmQX12tGDC80HnfwTNS
 JjsWe3n0yyzw+zFyybgw2b4pTC73iYRezSmbAswT/mdA8IE7+dWRhTRnjsgAOVcp2igaQ5LhYh4
 HfDy0IC4dNdezDLoXn+/Bo04ftjX6owKEqkZyFIMs+arVqFaJo8yNx8wyfZkyKSCO0MqsJUq2Nz
 9Tdv4zTbcKj5NAg4q1Q==
X-Authority-Analysis: v=2.4 cv=BpSQAIX5 c=1 sm=1 tr=0 ts=6973a7f3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8
 a=3yCG5LwcDJjBEDrlHn8A:9
X-Proofpoint-GUID: Yhj4Wdvrij7FI0Zneiz8DfRfamwcZVT-
X-Proofpoint-ORIG-GUID: Mtbi3pHXcwUi8uys7erHXBPRPZKtfjLW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601230126
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:linux-integrity@vger.kernel.org,m:keyrings@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:christophe.leroy@csgroup.eu,m:James.Bottomley@HansenPartnership.com,m:jarkko@kernel.org,m:zohar@linux.ibm.com,m:nayna@linux.ibm.com,m:stefanb@linux.ibm.com,m:rnsastry@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:ssrish@linux.ibm.com,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,HansenPartnership.com,kernel.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16245-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORGED_SENDER_FORWARDING(0.00)[];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ssrish@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-0.232];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid]
X-Rspamd-Queue-Id: 18F5878ADE
X-Rspamd-Action: no action

A recently posted patch series titled 'Extend "trusted" keys to support
a new trust source named the PowerVM Key Wrapping Module (PKWM)'
introduced a change in the handling of backend-specific fields in the
backend agnostic trusted_key_options structure. However, there are a
number of TPM-specific fields that are residing in trusted_key_options
and they have not been migrated yet.

This patch series intends to move all TPM-spcific fields out of
trusted_key_options into a newly defined trusted_tpm_options structure.
A pointer to the trusted_tpm_options struct is stored in
trusted_key_option's private.

Along with the migration of TPM-specific fields, this patch series includes
a preparatory bug-fix patch: passing the blob_handle to tpm_buf_append_name
during TPM2_Unseal instead of the keyhandle.

This patch series has been validated against both TPM 1.2 and TPM 2.0
trusted-key backends using a vTPM environment, on x86_64 and ppc64le.
Testing included key creation, loading, resealing (TPM 2.0), key revocation
, unlinking, invalidation, and reloading trusted keys from encrypted blobs.
I would welcome any additional testing from upstream to further strengthen
the validation.

This patch series is intended to be applied on top of the PKWM trusted-keys
series posted earlier [1], which introduces a pointer named private in the
trusted_key_options structure to handle backend-specific fields.

Srish Srinivasan (2):
  keys/trusted_keys: fix handle passed to tpm_buf_append_name during
    unseal
  keys/trusted_keys: move TPM-specific fields into trusted_tpm_options

[1]
lore.kernel.org/linuxppc-dev/20260115100504.488665-1-ssrish@linux.ibm.com/T

 include/keys/trusted-type.h               |  11 ---
 include/keys/trusted_tpm.h                |  14 +++
 security/keys/trusted-keys/trusted_tpm1.c | 103 ++++++++++++++--------
 security/keys/trusted-keys/trusted_tpm2.c |  66 +++++++++-----
 4 files changed, 123 insertions(+), 71 deletions(-)

-- 
2.43.0


