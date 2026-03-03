Return-Path: <linuxppc-dev+bounces-17574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +NFoLI3mpmnjZAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17574-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:47:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E9F1F0A95
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 14:47:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQHDk5Nx7z3c4d;
	Wed, 04 Mar 2026 00:47:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772545670;
	cv=none; b=jQo3ShDWYcT0jg3Uy2aEcHoSUJkYx/L5+gkTTrFAFQ/A+HkNIITRKlzQtmg5HFVGHJa5W2jXWRZcwGufD5ejZHq9kkTD9WBA+yuIn/+V4yGrOm6gj9qGKJQeIwV3v2/fXzpZrRQdJng2xgh1IKEd1BWaIKDa1Zs9+lal3bntOedoPfOOclNG0+zxjCvz6zJTgPT1Qgd2jzOyQd5S/k699klxkJdEy7BSD44eBdLM/SsMF5Ji/Cq3k4KlH2QD8rSUoaGHOceFH2YLkWUl+jOGBbAcsVufHRafaWMtWAQOq+zhOOHk9tGb1e1jeDDd+g+317bmgvEtvmBKVT6//ftTrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772545670; c=relaxed/relaxed;
	bh=beEzyBsCHPmer9tjGhYo66b2SfICE46PlfHILn1Irts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T/cB8XrpEP5YwtlFQwzlFSRCRoGXh0pGD+Ikt4Ske2tFap0qbDx9Ls6WBdyx+u/sjYK4855brbWL1TgUdtSD6ODPJ24wVvNL2aM80B6xwvYkZqalS6HD9fB1yOplyaFEQoc/3x04eOAoQt8CR9bGeuii+JTu4Pq7uQe+2IN1ONPWavJbSPauTiUJ9X+q8i93mgUTuAMnO8EmvOE+MUFZatWYBrMt+YdSi81VwrexlfPdxD/ZwmBZoCOBsVIq7TAyYisxaDsMCz+NNxivqeZwzNEehLv17hiY6PZCm8I9jS9/ns1XkqHc0QhOH9jIQaTiS7sVHTAh4r4jKL2aQwnSjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hUrF1oqQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hUrF1oqQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQHDj6ySFz3btf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 00:47:49 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6238EmmP2148025;
	Tue, 3 Mar 2026 13:47:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=beEzyB
	sCHPmer9tjGhYo66b2SfICE46PlfHILn1Irts=; b=hUrF1oqQfywGgAuvWzKr+P
	WJY9n1duHC2OrOeIlOnW9uDMH6j0XKqq74TSsk/hLGdGB/Wg+SK0N//TsbiOw76W
	1L9LmWIW+Ug3wVqg6l/VirayO0YR5/0AhTbVVLBGw39zBe9nJ4IBxX4WzWABQyQf
	Utj400K1OBpl4oSTgTtQ0XfHkIQiWTvgWjpqftYyUdXeri3kyxvBA4O2LUhoMHFN
	tluHEChwOvpBIMAeFxyVQycUUSm40B+bgVq2zHZNkwOTs/QX8VjMvFmFwC/TkenW
	EiF8lwvUo5Lbw7tsFpLQ9yMFrmyQ04DgCKOp8oclR0eFJsl5ZTK0hzE01eQwYreQ
	==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cksjdb6q0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:47:42 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 623BU8Bh008816;
	Tue, 3 Mar 2026 13:47:41 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cmdd1a6n5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Mar 2026 13:47:41 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 623DlbQJ16187704
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 3 Mar 2026 13:47:38 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DE9F12004D;
	Tue,  3 Mar 2026 13:47:37 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDBFE2004B;
	Tue,  3 Mar 2026 13:47:35 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.in.ibm.com (unknown [9.109.204.116])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  3 Mar 2026 13:47:35 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
Subject: [PATCH 1/2] powerpc/crash: fix backup region offset update to eflcorehdr
Date: Tue,  3 Mar 2026 19:17:15 +0530
Message-ID: <20260303134722.2814049-2-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260303134722.2814049-1-sourabhjain@linux.ibm.com>
References: <20260303134722.2814049-1-sourabhjain@linux.ibm.com>
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
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=M9BA6iws c=1 sm=1 tr=0 ts=69a6e67e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=qf4gfuq51q0A:10 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8
 a=pGLkceISAAAA:8 a=tR4UYP6JrHl6jBHRX14A:9 a=3ZKOabzyN94A:10 a=k40Crp0UdiQA:10
X-Proofpoint-ORIG-GUID: uIfRPKTGGYGhhpMRmRRlfSoUsU0l7pmk
X-Proofpoint-GUID: rNEt14SCMeKrcgXKgidwf-WDi7lqNGGM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzAzMDEwOCBTYWx0ZWRfXxqAaHtaZ4Mo3
 2z35T28ykSkzoIeG2+hd+bl4JTQLhV3fXApff18L6pZdPVLqw8sRj8r7LqNKtFNg3VPcqvDPQXb
 UCQ1oIcBZzttagrAMDCf7VSaydlx7u97Me56BOm7YJiaUiv2iPro9Mez09hSZlanV1xKvM7g+ED
 qXr1ae10DYhQ+bhUbT9vrTLN4khz+sAppGhrZws5MPUaPt5EnNEMVeHFqznBYIuv8gkxauidt+G
 G9dR9maiuEAOEfmWa79D0n+Jn0G25KR+D98aKXlRUeeZW/PyTd6i8zxQMPYJS7xePgNj1ocX+s4
 sx2G/jyK9IcqHWxjo9fO34D+xiVi8hKiHt0dbbMW+XXUtws6q5Zf6bs7z9+1I4qGQPbdo7mKNIS
 eP7FjMW6jCgZplBBkLLBzs+KQrqiHHX+2NcM+HdehDKiYS6f9gabBcMu3ETpgTHZCsNvH5rTOIs
 iQejihrQeirakGHp7TQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-02_05,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603030108
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: C3E9F1F0A95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17574-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:rdns,lists.ozlabs.org:helo];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Action: no action

update_backup_region_phdr() in file_load_64.c iterates over all the
program headers in the kdump kernel’s elfcorehdr and updates the
p_offset of the program header whose physical address starts at 0.

However, the loop logic is incorrect because the program header pointer
is not updated during iteration. Since elfcorehdr typically contains
PT_NOTE entries first, the PT_LOAD program header with physical address
0 is never reached. As a result, its p_offset is not updated to point to
the backup region.

Because of this behavior, the capture kernel exports the first 64 KB of
the crashed kernel’s memory at offset 0, even though that memory
actually lives in the backup region. When a crash happens, purgatory
copies the first 64 KB of the crashed kernel’s memory into the backup
region so the capture kernel can safely use it.

This has not caused problems so far because the first 64 KB is usually
identical in both the crashed and capture kernels. However, this is
just an assumption and is not guaranteed to always hold true.

Fix update_backup_region_phdr() to correctly update the p_offset of the
program header with a starting physical address of 0 by correcting the
logic used to iterate over the program headers.

Fixes: cb350c1f1f86 ("powerpc/kexec_file: Prepare elfcore header for crashing kernel")
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/kexec/file_load_64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index e7ef8b2a2554..e631cf2eda2c 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -391,7 +391,7 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
 	unsigned int i;
 
 	phdr = (Elf64_Phdr *)(ehdr + 1);
-	for (i = 0; i < ehdr->e_phnum; i++) {
+	for (i = 0; i < ehdr->e_phnum; i++, phdr++) {
 		if (phdr->p_paddr == BACKUP_SRC_START) {
 			phdr->p_offset = image->arch.backup_start;
 			kexec_dprintk("Backup region offset updated to 0x%lx\n",
-- 
2.52.0


