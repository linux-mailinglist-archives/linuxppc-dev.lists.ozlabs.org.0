Return-Path: <linuxppc-dev+bounces-9326-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215B0AD7926
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jun 2025 19:37:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJ8pV0yLyz30RK;
	Fri, 13 Jun 2025 03:36:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749749794;
	cv=none; b=oIKZO6QcL6aA5y9fNSSYbBf7RUj6ubEVzpXEV49ywhsgYCr1a0ZeFW1R/Liw1r+8lVuOTGdq3D6s4VUzoE55e8U2CJCe7oSVkgm/F6clrF9SPxMca3NjV/5bn2nG61/p8iE6+fc3RJdB2kAgHtjT/Sd9ekUOOoHbp6mCa85MuMH4/HdzDPcdu8VKynGUv5jp85h29NC8rboafJDsGlzQvDtTEgZaHXMA17/lfic7npT/Q3SlfC0a/1wYdWRgmdZaPOSRR5GNPCd72dTMAOsE/o0C/BY+nP6moOhGmUemJb+MaVdbe66y3n48oXq/TYWs3UFGgwmd3C4YRpOceorABA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749749794; c=relaxed/relaxed;
	bh=QpzxDfFD94KWII9K+6HadLtwTM81QAZAX1ucAb3kQ9o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WF6vGh+eX5/cg0S2Qito9Z/fN9qJELF6FsNxNAutHVwP/Zgh+lFIQow04+Z2occ3KkWBQYtC2VClku8ygdKtmaXvxVKzckueJMClc9KD+vER19Igy3z+J/ccE4iFAsMLrkMaAtX53UnpFx2UAC1CxoP/xf5C98T+KUlK9W5xsVRXfY6eJZmHwBGN3UTZ5K9lO578NduxO2+zgSgSzEZcxxBZOqlSApCnPUwwDX0j7E+mN9hzIhiNLA2+swx7dK5pjoBYrk3n9pr8ncm+R5KFYJbob8LkkfJPYmL2kGag1aOWJzfcdzX39VCRZtz0lyJ7bUZaxn7sx1hbTdYY3iHEew==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qzApvk7S; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qzApvk7S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJ8pS5pzmz30PF
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 03:36:32 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55CBGWVP017713;
	Thu, 12 Jun 2025 17:36:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=QpzxDfFD94KWII9K+
	6HadLtwTM81QAZAX1ucAb3kQ9o=; b=qzApvk7S2hlxQl1Bn2Btpu10ZAllpo5Ln
	KoZtJ5Dc5ebsGHYL7NJYxYDOAJV+QiKhNPjGUzyi5/p4smraFWFFpufSpMGzAkSs
	ijMES3tEQCL80ZymilIYQDcLGmaNEIE8zYtWSd1n3DnwRCmSMWFFrnWXVIMOvcU4
	3FTlbLfkovMjrogcNOJQy/OWjWG8T3XeFB0lZLwFpm4+bdXr+w/UwmyypaAsne2r
	gAzSFTJPL3eValXHYUhK4dMMnMvOe2n9ysA28sfKgF+EgtHkCd2WJoBbECxNmdyG
	yGLdYwa2Z/ZiCy8108YXetwWubfWr/782ZiXt2qPAO1hZCRLEMGhQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474dv7v8mc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:18 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55CHUNNC007629;
	Thu, 12 Jun 2025 17:36:17 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 474dv7v8m4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:17 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55CENRRG027927;
	Thu, 12 Jun 2025 17:36:16 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518mnu86-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Jun 2025 17:36:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55CHaE0J13173194
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Jun 2025 17:36:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F41CA20043;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E0ED420040;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 12 Jun 2025 17:36:13 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 55669)
	id A255BE19B9; Thu, 12 Jun 2025 19:36:13 +0200 (CEST)
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        Hugh Dickins <hughd@google.com>, Nicholas Piggin <npiggin@gmail.com>,
        Guenter Roeck <linux@roeck-us.net>, Juergen Gross <jgross@suse.com>,
        Jeremy Fitzhardinge <jeremy@goop.org>,
        Ryan Roberts <ryan.roberts@arm.com>
Subject: [PATCH 3/6] mm/debug: Detect wrong arch_enter_lazy_mmu_mode() contexts
Date: Thu, 12 Jun 2025 19:36:10 +0200
Message-ID: <2d516308df177f169e3e158687852bf91c95c427.1749747752.git.agordeev@linux.ibm.com>
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
X-Proofpoint-ORIG-GUID: 9voeh4bv5cl5bR8-1UbklMpr0vy5aE9k
X-Proofpoint-GUID: 9Au_5T7dJBReJY8qjL4lDoqAoOEk9nHN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEyMDEzMiBTYWx0ZWRfXwvHzXkw1Ghwo VTWHN+cE0QcyT8/988a5Oy+uAOazKG7OlmsNXf6ZvKU2OyjqEb00Sa9h8VlU6IHLn1MggoDaL63 J4VspSDKrq2+1hsiPGGebKrNx1EbL+82psEcU80PFvDCmekkqaZ0vPpe50F3A5EaUR4LmuwQ/0/
 5epCz7Ptq9XMUYKeq1zKwhT+tfKcNQIo5OBB6gHBUbG+j6+i6nLPuvYTfHveUXDpsZodJnk3zhE dYIyrVXtl4+cv0sSN2VcggnidQvKiNBmeIRb1oZr2g8ApheWzI/LFgHDf9f1hikiirl+WDTTu2o hrO0CgP9O7GbjWJ1Qv5gnL+YaCYVb0XAW2qQksVnQpXkvM1+8blus9YJd/GZULoBxkCwuh7NK+D
 rogA/0jqvGwDi1VvpGA1UI8O2sBoSl5dajC9s32rmbJOY1rQ4pEeWsPUoLCQb5SieKUycFW4
X-Authority-Analysis: v=2.4 cv=CfMI5Krl c=1 sm=1 tr=0 ts=684b1013 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=VnNF1IyMAAAA:8 a=RJXGA7rP2o630YCXQOwA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-12_10,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1011 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=914 adultscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506120132
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Make default arch_enter|leave|flush_lazy_mmu_mode() callbacks
complain on enabled preemption to detect wrong contexts. That
could help to prevent the complicated lazy MMU mode semantics
misuse, such like one that was solved with commit b9ef323ea168
("powerpc/64s: Disable preemption in hash lazy mmu mode").

Skip fully preemptible kernels, since in such case taking the
page table lock does not disable preemption, so the described
check would be wrong.

Most platforms do not implement the lazy MMU mode callbacks,
so to aovid a performance impact allow the complaint when
CONFIG_DEBUG_VM option is enabled only.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
---
 include/linux/pgtable.h | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 33bf2b13c219..0cb8abdc58a8 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -232,9 +232,23 @@ static inline int pmd_dirty(pmd_t pmd)
  * Nesting is not permitted and the mode cannot be used in interrupt context.
  */
 #ifndef __HAVE_ARCH_ENTER_LAZY_MMU_MODE
-#define arch_enter_lazy_mmu_mode()	do {} while (0)
-#define arch_leave_lazy_mmu_mode()	do {} while (0)
-#define arch_flush_lazy_mmu_mode()	do {} while (0)
+static inline void arch_enter_lazy_mmu_mode(void)
+{
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		VM_WARN_ON_ONCE(preemptible());
+}
+
+static inline void arch_leave_lazy_mmu_mode(void)
+{
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		VM_WARN_ON_ONCE(preemptible());
+}
+
+static inline void arch_flush_lazy_mmu_mode(void)
+{
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		VM_WARN_ON_ONCE(preemptible());
+}
 #endif
 
 #ifndef pte_batch_hint
-- 
2.48.1


