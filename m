Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C1F22DAEB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 02:40:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BDkcP1Px7zF1LZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Jul 2020 10:40:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=V0pggUR7; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BDkZF5SZ8zDrDN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Jul 2020 10:38:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=kRlm4puZpGJjazmeLM31S2T7/zfx00sZ7wU19LshKI8=; b=V0pggUR7hSLwhalDDaiNjibhDy
 AUbjPtV1k2xUe63N2ygpENGLsKdRHdh/i1q1dxaM1P1NkWHm8ws/7xZndgI2KJzYIgTzSF8H0EQGo
 x+24mBOMOBNHy6dnwEnLeUp6mgdMuvpe1XLqZo58CFeOie0bzizo0j7uMkk1vvauy7fDf/lJQ3Psd
 Xuhj7areJ+8SvpqtvE2qKu2AOYhY3YB8P/gEnL9v8feTPOmUx/HpPFmb0zHboqU2BNGS8FKFr4g/s
 RVFxPk7IXGZHFuJa7oK414Kdv/uyJe+QMG8szuxDhDpXg5Q97Q+cgQEYnNBm25WzgLH4M+mk7a6iI
 KY53cKMg==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
 by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jzUgI-0003Cq-8B; Sun, 26 Jul 2020 00:38:22 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] powerpc: hw_breakpoint.h: delete duplicated word
Date: Sat, 25 Jul 2020 17:38:05 -0700
Message-Id: <20200726003809.20454-6-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200726003809.20454-1-rdunlap@infradead.org>
References: <20200726003809.20454-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Drop the repeated word "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/include/asm/hw_breakpoint.h |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200720.orig/arch/powerpc/include/asm/hw_breakpoint.h
+++ linux-next-20200720/arch/powerpc/include/asm/hw_breakpoint.h
@@ -17,7 +17,7 @@ struct arch_hw_breakpoint {
 	u16		hw_len; /* length programmed in hw */
 };
 
-/* Note: Don't change the the first 6 bits below as they are in the same order
+/* Note: Don't change the first 6 bits below as they are in the same order
  * as the dabr and dabrx.
  */
 #define HW_BRK_TYPE_READ		0x01
