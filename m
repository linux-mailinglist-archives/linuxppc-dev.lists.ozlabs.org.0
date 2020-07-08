Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F44B218F6B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 20:02:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B26b35GC0zDqlY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 04:02:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=efficios.com (client-ip=167.114.26.124; helo=mail.efficios.com;
 envelope-from=mathieu.desnoyers@efficios.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256
 header.s=default header.b=VnCoXr4o; dkim-atps=neutral
X-Greylist: delayed 345 seconds by postgrey-1.36 at bilbo;
 Thu, 09 Jul 2020 04:00:48 AEST
Received: from mail.efficios.com (mail.efficios.com [167.114.26.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B26YD3wvJzDq5n
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 04:00:48 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id D99B01B7544;
 Wed,  8 Jul 2020 13:54:58 -0400 (EDT)
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10032)
 with ESMTP id cixDZTLiRr9g; Wed,  8 Jul 2020 13:54:58 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mail.efficios.com (Postfix) with ESMTP id 985D91B7699;
 Wed,  8 Jul 2020 13:54:58 -0400 (EDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.efficios.com 985D91B7699
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=efficios.com;
 s=default; t=1594230898;
 bh=tG0SW0H0y5JVaR2gINRbwVBgmbDHv9ts1fEwU9c48XM=;
 h=From:To:Date:Message-Id;
 b=VnCoXr4okwkbSTWgOoO+QNz9LBkYu/WVLNkgsv6YSkrFEyQy+EdUM8Hp6eaZXEmzh
 Q2g/D9TnyTqhPm5RSX0B/xDxH55cuGIE6l0jaCFx9eQkJ43ZCQ/YeB7TcdD66LLB4r
 0anyedL/RfL5PMydziEtqD/crxLQhriTfzMrVwFWs8faIVZdDvIi5K4tSNIuv0ad0u
 mVGyknYPItsj9AfdhVUrCI5UOl2doqSuUGDFgtWRtRkn8Qbh4+2DKCbW1Y3to/DQzJ
 qeRKRONZRKNwzR+X2+t3zeZpqq5M80tyR6KB1AK+XidoqYxKrv65FImUMweiC45GlO
 LzxEw/M4/cx+A==
X-Virus-Scanned: amavisd-new at efficios.com
Received: from mail.efficios.com ([127.0.0.1])
 by localhost (mail03.efficios.com [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id wzKZ4p8sXa7N; Wed,  8 Jul 2020 13:54:58 -0400 (EDT)
Received: from thinkos.etherlink (unknown [192.222.236.144])
 by mail.efficios.com (Postfix) with ESMTPSA id 539FA1B7543;
 Wed,  8 Jul 2020 13:54:58 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 1/1] powerpc: Fix incorrect stw{, ux, u,
 x} instructions in __set_pte_at
Date: Wed,  8 Jul 2020 13:54:23 -0400
Message-Id: <20200708175423.28442-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.11.0
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
Cc: linux-kernel@vger.kernel.org, "# v2 . 6 . 28+" <stable@vger.kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The placeholder for instruction selection should use the second
argument's operand, which is %1, not %0. This could generate incorrect
assembly code if the instruction selection for argument %0 ever differs
from argument %1.

Fixes: 9bf2b5cdc5fe ("powerpc: Fixes for CONFIG_PTE_64BIT for SMP support")
Signed-off-by: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Kumar Gala <galak@kernel.crashing.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: <stable@vger.kernel.org> # v2.6.28+
---
 arch/powerpc/include/asm/book3s/32/pgtable.h | 2 +-
 arch/powerpc/include/asm/nohash/pgtable.h    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 224912432821..f1467b3c417a 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -529,7 +529,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 	__asm__ __volatile__("\
 		stw%U0%X0 %2,%0\n\
 		eieio\n\
-		stw%U0%X0 %L2,%1"
+		stw%U1%X1 %L2,%1"
 	: "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
 	: "r" (pte) : "memory");
 
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index 4b7c3472eab1..a00e4c1746d6 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -199,7 +199,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 		__asm__ __volatile__("\
 			stw%U0%X0 %2,%0\n\
 			eieio\n\
-			stw%U0%X0 %L2,%1"
+			stw%U1%X1 %L2,%1"
 		: "=m" (*ptep), "=m" (*((unsigned char *)ptep+4))
 		: "r" (pte) : "memory");
 		return;
-- 
2.11.0

