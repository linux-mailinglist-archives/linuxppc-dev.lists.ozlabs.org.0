Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 184554C90E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Mar 2022 17:50:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7NXs1SqCz3bcr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 03:50:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yx2Cou9K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=muriloo@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Yx2Cou9K; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7NX705lwz30H3
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 03:49:58 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 221GIHGi016548; 
 Tue, 1 Mar 2022 16:49:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=pp1; bh=Gh0GqLspMvTvwvXYAgolNSAveiOEEAf2SSkZXzSi8ME=;
 b=Yx2Cou9K7z1Wp8dPzRyH8xfQk5W6HFswFvzmhy7mEosE9TkQQYGvcn0Ar3QBttPFI8Ts
 yDaEtr6Tx5wIkOanTOk0fRyVtbgOrPByJooigTEzzVyKUtKgsYIerx0jMkgHOpV6Bxdq
 W9iDfwG4szK2g2ewZeisgV/Xk2qmH2/44sGWhbIGVBRZatDNfuK3LIL7HdoMOUfydioN
 bGPo5OUfzg4qD/ScXuVHHX1IGaTnHM+KbFE45BDOXyAXfoMvoKxHy4GX3GSswHfkuxSl
 vMw80HeVJRsrokVPKqivk4IydFpC42ufE9EA43Y9KeWKAuFfyx2aoxZD6/3ismLck4aq UA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ehpd4st0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 16:49:54 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 221Gc1qW008913;
 Tue, 1 Mar 2022 16:49:53 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03dal.us.ibm.com with ESMTP id 3egfss48tk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Mar 2022 16:49:53 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 221GndGu14418500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Mar 2022 16:49:39 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6E48AE067;
 Tue,  1 Mar 2022 16:49:38 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 422D1AE066;
 Tue,  1 Mar 2022 16:49:38 +0000 (GMT)
Received: from localhost (unknown [9.65.81.114])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  1 Mar 2022 16:49:38 +0000 (GMT)
From: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: Fix build failure when CONFIG_PPC_64S_HASH_MMU
 is not set
Date: Tue,  1 Mar 2022 13:48:43 -0300
Message-Id: <20220301164843.29170-1-muriloo@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ehXpSUCSWPVpdlCeQ3AGqPVG_BFouthc
X-Proofpoint-GUID: ehXpSUCSWPVpdlCeQ3AGqPVG_BFouthc
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-01_07,2022-02-26_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 priorityscore=1501 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2203010087
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
Cc: "Erhard F ." <erhard_f@mailbox.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Nick Child <nick.child@ibm.com>,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, mopsfelder@gmail.com,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following build failure occurs when CONFIG_PPC_64S_HASH_MMU is not set:

    arch/powerpc/kernel/setup_64.c: In function ‘setup_per_cpu_areas’:
    arch/powerpc/kernel/setup_64.c:811:21: error: ‘mmu_linear_psize’ undeclared (first use in this function); did you mean ‘mmu_virtual_psize’?
      811 |                 if (mmu_linear_psize == MMU_PAGE_4K)
          |                     ^~~~~~~~~~~~~~~~
          |                     mmu_virtual_psize
    arch/powerpc/kernel/setup_64.c:811:21: note: each undeclared identifier is reported only once for each function it appears in

Move the declaration of mmu_linear_psize outside of CONFIG_PPC_64S_HASH_MMU
ifdef.

Fixes: 387e220a2e5e (powerpc/64s: Move hash MMU support code under CONFIG_PPC_64S_HASH_MMU)
Reported-by: Erhard F. <erhard_f@mailbox.org>
Signed-off-by: Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Fabiano Rosas <farosas@linux.ibm.com>
Cc: Nick Child <nick.child@ibm.com>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=215567
---
 arch/powerpc/include/asm/book3s/64/mmu.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index ba5b1becf518..006cbec70ffe 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -202,7 +202,6 @@ static inline struct subpage_prot_table *mm_ctx_subpage_prot(mm_context_t *ctx)
 /*
  * The current system page and segment sizes
  */
-extern int mmu_linear_psize;
 extern int mmu_virtual_psize;
 extern int mmu_vmalloc_psize;
 extern int mmu_io_psize;
@@ -213,6 +212,7 @@ extern int mmu_io_psize;
 #define mmu_virtual_psize MMU_PAGE_4K
 #endif
 #endif
+extern int mmu_linear_psize;
 extern int mmu_vmemmap_psize;
 
 /* MMU initialization */
-- 
2.35.1

