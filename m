Return-Path: <linuxppc-dev+bounces-4896-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23D35A06EF4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 08:20:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTGQH0qxGz2ygY;
	Thu,  9 Jan 2025 18:20:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736407207;
	cv=none; b=kG3edk7g+tEv6IuM7TFyAfdLTOaF/WneC4SB+W0q6IZCJwOhAT3Ki/xW7ONbWHvfx5iFq7haTkK16scySMKQQYflFQDoZyYmMaQ0Y/+h0kXTS7k5irXnCqqyUSS2pelSs2VeyGUIKnirI/oNBNdX5wZNkA0jWQysWVpDF1xAb53SoYeNl9uQqKCGuUuAl3bllg3DzHAM6qyEpFJ96gpT+641Qmuhaq2mEznvcnDlIlgHiX+zQ8/0uZhq4r5kfK3X4+cXNZWbvEA+tWjtjX5oKKfRqOOzf8Qx+c5cLYnZ9GD0IA4M6Lg2n9VKr9Lm6mxG0ZX3OP7UOiohiu/eyIQGIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736407207; c=relaxed/relaxed;
	bh=eFl5M88xl9MCOteu6P482ZgxUJseyXuwRf9e4UwlXa8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MauQrE9LL9QXYUhV3jys018aNPhG1bYBaw8c0ENbsZF1YNbxj/2B2WxhmVUQckEeL7ltuzgqc3i9NCPJ2taJSo1m8MPb2fXztoKbR2vcvg3Mis6632dRFLGUfc58eMMUU1Y1MtgeW5W5V8b+Qc07uPPJWizxUH1lZ3pLyozMXKCq8zijijScUsMGS0bCNBQyEFfqEcDo0I8Q3grVvgwk4MiA5qwkh+ft5SR4wWimwxx8jE13wdUt7ekfOooBfnNCzPbrRhBTCpcr3LpkDpt7F096Vt+SPuAHSdCQ3DOQejWNn8K0AtwyPGxgX92aG9cXssnITJkE858mXUTRGPt1rQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTGQF6B95z30fK
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 18:20:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YTFl91S0fz9sTy;
	Thu,  9 Jan 2025 07:49:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3J7o4WG4m-Yo; Thu,  9 Jan 2025 07:49:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YTFk71VKnz9sSC;
	Thu,  9 Jan 2025 07:48:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 21BB98B783;
	Thu,  9 Jan 2025 07:48:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id D59MGwN2egiA; Thu,  9 Jan 2025 07:48:47 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B1B178B768;
	Thu,  9 Jan 2025 07:48:46 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/ipic: Stop printing address of registers
Date: Thu,  9 Jan 2025 07:48:36 +0100
Message-ID: <ecffb21d88405f99e7ffc906a733396c57c36d50.1736405302.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736405316; l=912; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=F+nUfFfSYDlH2v4BBspYm/WhP1UVUw2HniW5FkbTJwU=; b=eyXskOH6wf5nNThhR2s2Tvv+8sdTXj8mTnewGVOxuYd5mMyr5cOSdtIOYz2mO7fh0qTIwEz++ Lzzzr6NOOFYBrltQCA1IURdLkGD+h+fmXE7hEvpdu8V4kLFeHPJbv4s
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The following line appears at boot:

	IPIC (128 IRQ sources) at (ptrval)

This is pointless so remove the printing of the virtual address and
replace it by matching physical address.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/sysdev/ipic.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/sysdev/ipic.c b/arch/powerpc/sysdev/ipic.c
index 5f69e2d50f26..037b04bf9a9f 100644
--- a/arch/powerpc/sysdev/ipic.c
+++ b/arch/powerpc/sysdev/ipic.c
@@ -762,8 +762,7 @@ struct ipic * __init ipic_init(struct device_node *node, unsigned int flags)
 	ipic_write(ipic->regs, IPIC_SIMSR_H, 0);
 	ipic_write(ipic->regs, IPIC_SIMSR_L, 0);
 
-	printk ("IPIC (%d IRQ sources) at %p\n", NR_IPIC_INTS,
-			primary_ipic->regs);
+	pr_info("IPIC (%d IRQ sources) at MMIO %pa\n", NR_IPIC_INTS, &res.start);
 
 	return ipic;
 }
-- 
2.47.0


