Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 930586D96F9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 14:22:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Psgc52t3Dz3fTj
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 22:22:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cfTJPjbA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsgbC0vB9z3f9s
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 22:21:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cfTJPjbA;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Psgb80R0Yz4x1f;
	Thu,  6 Apr 2023 22:21:24 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680783684;
	bh=IKRww6Uo8txh3N2AVix3zuTXYto1mu7bnYCv7E6yxUI=;
	h=From:To:Subject:Date:From;
	b=cfTJPjbAkxLZuyf+7RFVcB9oZ8AhVPxVs6EYGEYn1P31i2G6UvawxLcPCK8uOVNyP
	 JP6mYM5zml6JnLNG58vzsMmj3EXaZ3M2tiJhQKLK/i+L0gUF0HMU6pV7k0b0YT9m7I
	 ndWR/U15nfx+YtSH7zhWiPZtO2pay0oSu10heSbXGOTAcPkYL9shbDRND+EeXLUB93
	 smYntxlLel46/m5Cp+pb5CTSvGZKZxslk3Ghwe/EVa2gRGTZyG+Igeh9M0ArZ/EPB9
	 kNP26qbTWuriz/PiTKqIK02vnbl2bRkNSNVcoBN3+MURfERl3f17jr27dJnq9vm2cf
	 TItrXa2B4lCVQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/irq: Mark check_return_regs_valid() notrace
Date: Thu,  6 Apr 2023 22:21:18 +1000
Message-Id: <20230406122118.3760344-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

check_return_regs_valid() is called from the middle of the irq exit
handling, which is all notrace, so mark it notrace also.

Rerported-by: Sachin Sant <sachinp@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/interrupt.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
index 0ec1581619db..e34c72285b4e 100644
--- a/arch/powerpc/kernel/interrupt.c
+++ b/arch/powerpc/kernel/interrupt.c
@@ -95,7 +95,7 @@ static notrace void booke_load_dbcr0(void)
 #endif
 }
 
-static void check_return_regs_valid(struct pt_regs *regs)
+static notrace void check_return_regs_valid(struct pt_regs *regs)
 {
 #ifdef CONFIG_PPC_BOOK3S_64
 	unsigned long trap, srr0, srr1;
-- 
2.39.2

