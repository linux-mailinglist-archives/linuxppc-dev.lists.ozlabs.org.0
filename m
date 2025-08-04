Return-Path: <linuxppc-dev+bounces-10563-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D907BB19F73
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 12:07:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwXLF4HfVz3bkb;
	Mon,  4 Aug 2025 20:07:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754302069;
	cv=none; b=YUQTtvjUJIFA/o2sbpkwUTkNPs6Sms+I9CBwS6U9NHeXvXpqW3QmR++qdsQY4r28Q9SIQfwYjNJFQLLq0JOGeQehZxN+p9qU4d+mwVdWzRG4bzd4BQe/sZ3UhnQ8Vvl+IML9O87t7GbLmxL1LgLmvH36vm1EL/4CGtIdI8jzqdX/NtFFvDj2NRYcMSwohKzZl8gdEEtg+c/X/BG5YGgPukvBvOu8H+afY/34/ehABBJxM2NCM/0eAkIVl43H2saOsFP6PBnXD9t8NDH/wlWQaQ66cw3i6N18R3pRfibb17hL4+TPpBZej79ynjYMIan3XhpwuNln26ZybMv0tUo2qw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754302069; c=relaxed/relaxed;
	bh=JjChbKi0Rx93+Tu2sjL4XTOUdNd3zTW9vbhD+j3CVZ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jfdJtPmMpPxMupdiJkkRFA0jqqYOHfO5btYGmSwBQJrIr0m8uWPbDC8NHdiPoW+iFPVc3jwoZh1dNwccjUP1UrsyiDqqoaI+1Aoupc9g351EUuvwNuqPZZhvnqioxXhbGW9ONdSpuXzL8ThUZK2YXvZ5ovaWgq4Py0fP4UArs7LDKkjopgCWBXHMPBW9RJAfrUEaXQ9W4YsWl0kHGLgatYToloGPJ47bxsJ360AvLtf+09TqzTBklbYiHXX7yBb3F05VJSkDITv9lLsRFfqYG+hWYBbuzNW5kpteEa/2LRSZNLsLqsyyOhIwqfxWDqiJrREUgrfbtzvli8tfXmTIhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cueDMIy8; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aE+VyAuq; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=cueDMIy8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=aE+VyAuq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwXLD6275z3bjG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 20:07:48 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754302057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjChbKi0Rx93+Tu2sjL4XTOUdNd3zTW9vbhD+j3CVZ8=;
	b=cueDMIy8Ro5gB+R96xllpBtDUM3dcrqgXK1eWLGoTc32TJde0nm+5uCv4QV15DEf6rw7AN
	uPs8MfcLhLB4KZeyb+wrt9XjlwQ06jl1Wwx75j7rO0q4KLuoQEReOEfJauBonnBwo2JIaH
	HkFBwQhbnVn1aPMpt5RLieH3ICpXp+0p1gyweMpjjSTB07SL9VNfzH1weAChE2UPdGjhzs
	8EEAL+F/wXQ9N3tGAt5h+S7mjxP9SF8Jo9NwdX4QXZS1B1vcpJ3ArlWk1hF1GyOdZxaDQf
	V054yG6dj87ds1abhK3LOdwhMKVjXWBMhufJw98rMRJ+Xp3n1LgJ1oPqtMykBw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754302057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JjChbKi0Rx93+Tu2sjL4XTOUdNd3zTW9vbhD+j3CVZ8=;
	b=aE+VyAuqBsX0dOcnYOYHE7uJKfAO3KB/0ng80qh9CmmL6D/7lmf9bpCRHMYm2VrgyMzAMa
	y+OkvktQhtj3XBAw==
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
Subject: [PATCH 1/2] powerpc/pseries/msi: Fix potential underflow and leak issue
Date: Mon,  4 Aug 2025 12:07:27 +0200
Message-Id: <a980067f2b256bf716b4cd713bc1095966eed8cd.1754300646.git.namcao@linutronix.de>
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
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

pseries_irq_domain_alloc() allocates interrupts at parent's interrupt
domain. If it fails in the progress, all allocated interrupts are
freed.

The number of successfully allocated interrupts so far is stored
"i". However, "i - 1" interrupts are freed. This is broken:

  - One interrupt is not be freed

  - If "i" is zero, "i - 1" wraps around

Correct the number of freed interrupts to 'i'.

Fixes: a5f3d2c17b07 ("powerpc/pseries/pci: Add MSI domains")
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
 arch/powerpc/platforms/pseries/msi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/=
pseries/msi.c
index ee1c8c6898a3..9dc294de631f 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -593,7 +593,7 @@ static int pseries_irq_domain_alloc(struct irq_domain *=
domain, unsigned int virq
=20
 out:
 	/* TODO: handle RTAS cleanup in ->msi_finish() ? */
-	irq_domain_free_irqs_parent(domain, virq, i - 1);
+	irq_domain_free_irqs_parent(domain, virq, i);
 	return ret;
 }
=20
--=20
2.39.5


