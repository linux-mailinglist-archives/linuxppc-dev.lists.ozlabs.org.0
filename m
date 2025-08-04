Return-Path: <linuxppc-dev+bounces-10561-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0425AB19F70
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 12:07:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwXL75J3Wz30Yb;
	Mon,  4 Aug 2025 20:07:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754302063;
	cv=none; b=DuRRJjOlRyVKYcCiADppLPG4VDoC4MjRwT5Mxdljp/IkXrkiRjKOmuzfdY7V/XeQFht4QyYRcPtjONkBzvRA7OYbi5khoo1m1jfL3IZQKzmgqPZ0Y8NFQZFjdOQ21UXK/LPpHe1JykqzttcdxRZU/DGAKKA4AxZM8WE61fPOHuCiYg/tm/p19yHjIJKrWjktkSCjRwGbTHwsi73n6zGm7h4/JeSD+BugVeZHKjah0r3c7YUEMBz6UFAKPLb9i+Z8cpAurY4bTwu4KWkAM4n8T0nYwbo4GvsLVF7QtZPzIPpcCIrGbS/NgSns7ReTyUNLLlI3SIb1lpYS82QaRSfMGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754302063; c=relaxed/relaxed;
	bh=vfNEYV4azBODPkXCFpVp5ETyBOPcIAUZ4WPfo58yan0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=lOKN7+r5NXGfgWxJQQjRvDlGO0e2P51bG5KesKH5LLff5Aef/+qBtEphwxOrBZCMTpqt06mbLaIh+zHjn29qUchMC8bZ7CAN7Di7jyAiCP2vNjK3ThwSmVGA/mzXFZsJHk8QmB90wN3Ook+y6nYPEL99FmvgiVoiOlESmv3R8rPrvFLYyN1tLkWrkma0nZ+LO0DpR9l17kV33kW/erc/199WCYwcr8NpW4QuTaTZl0k9J3b/l6bfunNZDVSON0Pq2RvLjrMPUZ7mg8JnGUruNysyamZX3fxYz1fv9BrPRnK61oeK+b4drODxdEVrNfg5Y/7Ir1dT0wULEorHuqQ92Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jhQi5Miz; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cSUMp+lC; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=jhQi5Miz;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=cSUMp+lC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwXL64WQxz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 20:07:42 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754302057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfNEYV4azBODPkXCFpVp5ETyBOPcIAUZ4WPfo58yan0=;
	b=jhQi5Miz84mSJDlCRDll/KaL0uUb4xBNytAYfmdikDUa09352eXlbvYz5JQrMI8+hlVmQG
	lqvAe20rWJiE1mUcXiOn4gHV/Yxg4WFQuqgehpCXBj2m7Rom+XP8MhT26or4ejesQ2ZL2T
	xLMhflezjrAlSG2gdXGKStEBTe4d0p0QNZwyxxXrsQVThzn/CRDaFOq91m4GH+iR3GrEPQ
	c5Yz+g2lPwQEXB255EQd0UBz94xwoeGxzCSNKC9X3+gI3osAZqzTW70LSJHyTy7TqSWyLn
	JRVXciCcSCLo3Q2woGN/Q09Kg33x4wrQ0zynjDWRVIhheb8pjkd5qpHzQVzAGA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754302057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vfNEYV4azBODPkXCFpVp5ETyBOPcIAUZ4WPfo58yan0=;
	b=cSUMp+lC1a9J9y9pYNmaymkHXnLszknvyani9UfAClOFVCEZZoBnhhQ7zV9IcDgr0pk9zF
	PNSi05pwk+pTJVAA==
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Gautam Menghani <gautam@linux.ibm.com>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	stable@vger.kernel.org
Subject: [PATCH 2/2] powerpc/powernv/pci: Fix underflow and leak issue
Date: Mon,  4 Aug 2025 12:07:28 +0200
Message-Id: <70f8debe8688e0b467367db769b71c20146a836d.1754300646.git.namcao@linutronix.de>
In-Reply-To: <cover.1754300646.git.namcao@linutronix.de>
References: <cover.1754300646.git.namcao@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

pnv_irq_domain_alloc() allocates interrupts at parent's interrupt
domain. If it fails in the progress, all allocated interrupts are
freed.

The number of successfully allocated interrupts so far is stored
"i". However, "i - 1" interrupts are freed. This is broken:

    - One interrupt is not be freed

    - If "i" is zero, "i - 1" wraps around

Correct the number of freed interrupts to "i".

Fixes: 0fcfe2247e75 ("powerpc/powernv/pci: Add MSI domains")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platf=
orms/powernv/pci-ioda.c
index d8ccf2c9b98a..0166bf39ce1e 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1854,7 +1854,7 @@ static int pnv_irq_domain_alloc(struct irq_domain *do=
main, unsigned int virq,
 	return 0;
=20
 out:
-	irq_domain_free_irqs_parent(domain, virq, i - 1);
+	irq_domain_free_irqs_parent(domain, virq, i);
 	msi_bitmap_free_hwirqs(&phb->msi_bmp, hwirq, nr_irqs);
 	return ret;
 }
--=20
2.39.5


