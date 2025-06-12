Return-Path: <linuxppc-dev+bounces-9320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9C6AD790F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 19:36:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ8pQ1Rjcz2yZ6;
	Fri, 13 Jun 2025 03:36:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749749790;
	cv=none; b=Z0a5HwIPDQavY/Ns2QDP4rWktAEW2pLSOZT49MikzfuERUIOvQJQJd5DQ1P71234qWvllPtWZq1VvQFsY//yp3T07GgX51mVURpb/7STndvpiYm5/J5tz6qRigOLsLIKZgS7FyC6C8bqhRmcb0izHmuAcijNPQFk2FJsVKvOtutJSMGw3QZEiq7CtyxOq363IXyp2lJPpDZb6alLP+b26VXJagesjvKflUk0/E1cMT5g9kRiHwPkDQuH3nExinTrCeiU7IE9XGtjMNyKwzf2WRDD9cbEs/hRQByBGj+YTE4hK8fJqHvPywPd9wU9AC2dFQKnIbn9k/UQy+CL10G5jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749749790; c=relaxed/relaxed;
	bh=4hV4IXUZ8LEPGuSQG01CQzmpidG+/SLdlI31Go35JsY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jqjk8zUv7iZ+ZA2gh+D5pkwg58QNoZCa0lW1TAv4KUdVNxLHKE5klSwuH4v2b2ppp4N2G+2IFjQMT7cuuRlQjoPBWQJ0RTM49j7tAl+ALnKlW34cDX+aDqrUPYb+X3RLDYIMfPCzE2FX9CiPKTUtt9EGaKd4BCrqflxwaYOzmI3tDAoMQlQIG6M0G1r2D+3Fz9RT2Rg7eurQikiF/TPFHmNGPh6k+w74WX3gA6/SbaDDl3WlawKlFeGiwtBDxFgiELhjgSu3x0ABlR0G8tRqLMxyC3hilRwP1Ui8ds52e8oUNlmAy/fBqn2vipMo0Ye/q7H0pGn9t0Uvr9xN3qcFTA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s1GKeiAi; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=s1GKeiAi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ8pN1gn9z2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 03:36:27 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CCr3E5027868;
	Thu, 12 Jun 2025 17:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=4hV4IXUZ8LEPGuSQG
	01CQzmpidG+/SLdlI31Go35JsY=; b=s1GKeiAiMdnysT0X4IxcglrScCDxHGupI
	zA15vl63KE6Seni7PWOENpJ/Gv59FM2b1Ca6r2wUSawQqzznf++bc8pp+JrLepvD
	11bMaHktb6H3M6gxH1wWrRWImCuQvvEnNAl5zja2tALWGEHRiMhzoaVOi8QGHYaw
	aZz6TyrWN7R8ZtTMfSaiN5+qPDW6ofgwqKI4u93tJjADKNFDM9eGeeyxox6+z/Tg
	/YvxI01+Nyzw+6LR0Ko1q4QdNC8AvCEPF/VQKQe07zyBatxjhnu2th41Vj34ykJb
	VJ7AFrQxxkj8nBsjbedXmLfZ9S4sPBvTCF878vtwezm8Z8t+8f7XQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguue6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:17 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CHXi2p029325;
	Thu, 12 Jun 2025 17:36:16 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474hguue6f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:16 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CGdbAS015184;
	Thu, 12 Jun 2025 17:36:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 474yrtp6b4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55CHaEtZ33358432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 17:36:14 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45F9520043;
	Thu, 12 Jun 2025 17:36:14 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 31BD320040;
	Thu, 12 Jun 2025 17:36:14 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Jun 2025 17:36:14 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id A6F65E19CF; Thu, 12 Jun 2025 19:36:13 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>,
        Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH 5/6] powerpc/64s: Do not disable preemption in lazy MMU mode
Date: Thu, 12 Jun 2025 19:36:12 +0200
Message-ID: <448f6e26a9d72fb2c873245ea948807491f6b798.1749747752.git.agordeev@linux.ibm.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1749747752.git.agordeev@linux.ibm.com>
References: <cover.1749747752.git.agordeev@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=Pfr/hjhd c=1 sm=1 tr=0 ts=684b1011 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=Nsn6zn2YLSyj-wdhBosA:9
X-Proofpoint-GUID: Y7JL08S83tcOGpHgHyKOLNsFJBfulgi4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMiBTYWx0ZWRfXxvLPCGltFBs6 pER1hH7Vt06TbX8owkaLIhYurkg/bfiZiDeVHa0PPT4UG5RzmpaRyaYzy4ZzCd+x8pHRBQxHNsW LlMM92svD1VKZhMAfFH8HhjxN6kzFIktURb71PQI+3H4WVjFhd6e0GNz+MKZ65cpAblc41X74IX
 VWf/EXsyOP+k9EtZQhTtCLK0y9XnX1bfZybbHwQJ+iYyzR+cu2qDSo2vTQjKBcaqzXtO6QCws/G ahxfH8pkJ/OernQEEfBz8Qu/RAndqb3+4jUDYJorjlTofk/Ag29ituHGNj7JG2D1/13Yq1Xceww QO2NYvvcSi2BXvJvwSvBOgqw+ea0ndyQmYpre/Tbc4lnWu8mCsCWILjWTkHUy9oPg7cQuigdRwF
 pFY0gzFF6leNeCu5EA1j0z0C62x0JAJFBWJjNW0G83T1t2FdFvdOnFeb4KXHaR+HM9fW5qE1
X-Proofpoint-ORIG-GUID: ES5ST5n3tkdVQkhjd27yAL3iJS4bjEER
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 impostorscore=0 suspectscore=0 adultscore=0
 clxscore=1015 phishscore=0 bulkscore=0 malwarescore=0 mlxlogscore=654
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506120132
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Commit b9ef323ea168 ("powerpc/64s: Disable preemption in hash lazy
mmu mode") is not necessary anymore, since the lazy MMU mode is
entered with a spinlock held and powerpc does not support Real-Time.
Thus, upon entering the lazy mode the preemption is already disabled.

Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush-hash.h | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
index 146287d9580f..aeac22b576c8 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-hash.h
@@ -30,13 +30,9 @@ static inline void arch_enter_lazy_mmu_mode(void)
 {
 	struct ppc64_tlb_batch *batch;
 
+	VM_WARN_ON_ONCE(preemptible());
 	if (radix_enabled())
 		return;
-	/*
-	 * apply_to_page_range can call us this preempt enabled when
-	 * operating on kernel page tables.
-	 */
-	preempt_disable();
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
 	batch->active = 1;
 }
@@ -45,6 +41,7 @@ static inline void arch_leave_lazy_mmu_mode(void)
 {
 	struct ppc64_tlb_batch *batch;
 
+	VM_WARN_ON_ONCE(preemptible());
 	if (radix_enabled())
 		return;
 	batch = this_cpu_ptr(&ppc64_tlb_batch);
@@ -52,10 +49,12 @@ static inline void arch_leave_lazy_mmu_mode(void)
 	if (batch->index)
 		__flush_tlb_pending(batch);
 	batch->active = 0;
-	preempt_enable();
 }
 
-#define arch_flush_lazy_mmu_mode()      do {} while (0)
+static inline void arch_flush_lazy_mmu_mode(void)
+{
+	VM_WARN_ON_ONCE(preemptible());
+}
 
 extern void hash__tlbiel_all(unsigned int action);
 
-- 
2.48.1


