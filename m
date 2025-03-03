Return-Path: <linuxppc-dev+bounces-6621-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA3EA4BD9C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:11:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2W2gkSz30VS;
	Mon,  3 Mar 2025 22:11:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000275;
	cv=none; b=Zdv2C7l/8IAr++f+qxjrq3FOQZPitl4MrXtXTc/73hO+urBwBYTpuLEBfufB6blG0c7q94Crg1hwlk9A1z0LGBhVzhvTbthWbliNZQbTVyiefUD22jkMujK6Os7146Kbn3+ir04RMiNRFw54lFUCkVNAo1EqM060yzzO38IA8OjcXv5964QCY8TSN0vA1ux60fVrfbvz+hU83ErwH3PBoYQu+aROVB/9yUdyDZz0clULpHi/WsmBKE6y94qzyj2xOWZWVqq6gUknvcn3ITQYo9bMz+p948AZty0ZUwNMlTvBBEb7lWXGpFNp2Djsxg0IfEhe6IXdFyZzJ2phLsn6kw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000275; c=relaxed/relaxed;
	bh=bCdwRb62VTrbR5xUivRBa4yVRFUw7ANF4zJUEJ52hKQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DSyUr1I5/Rik1ZUAsk6tTGK4zFp/91L0iuXbPT3ut1tfT8Xs5Ll8Oekty7snvU4vFcNY8wgzrPMDiyi/1B6rJ7qCHA1Jtdvf5WB0lPtAVAiubwMopqliAjQ6xQE4uPb1gHDHPEotAwD8X5frEcklr0tTf4wRZcjGThNgoc2lRkMYqHprgiFvSjIsbS8N6ifwcJlDGZCPCveWTYM5YOW8P9sy/3kORahpsdersUJLuI1shYgoZVG3ij+e+u0tY1UQuWZVgwMDjU6EwJ0T7TYhBs6jY9D8gx2na4E5+o4aS4dcLkOv4owenaNWOnA9bM4imvp2L2pF4N+DbMWQlh48dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HBXAYc6x; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BsJE+rCd; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HBXAYc6x;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=BsJE+rCd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2V1nMBz30Vj
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:13 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCdwRb62VTrbR5xUivRBa4yVRFUw7ANF4zJUEJ52hKQ=;
	b=HBXAYc6xl7KXGh/flCRILcVk+FA2fkf2y+XEkkT1eiInvI/WfegoID9q/3cIc6OHUqczQF
	PQ49lZDS2Y/Fv2QRZ8112jLN7GiEnYGu/yh+XnDCfOB/9SGVDHAFD9V9jdStmPpM3ABntq
	GsLYgwzT+9+c1Lw8VU9SftKkk2q/usKIBCN+bqSgFpqjRxL0YA2gkEorjyv4YN/5R1ZEkX
	Qw6YbVEqPHHPDJGw3ayhJpxHlKzzXE1HIiT3eL9ovTtk0Jkt3bJqXZSGsFl1QBIij92k+7
	mUZHjIT4lwCNeFK+4MY1FJAUL109K4ASHusMTysKX5yNBFMDuxvnmnQUgrufPA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000270;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bCdwRb62VTrbR5xUivRBa4yVRFUw7ANF4zJUEJ52hKQ=;
	b=BsJE+rCdiKDKT4eQUddPU2LUS6jWIEVrQpYFv2koHUfZ/lOXdy1hh77RadF1ejnQXTtr34
	L5yNu905zFXDMuAQ==
Date: Mon, 03 Mar 2025 12:11:06 +0100
Subject: [PATCH 04/19] vdso/datapage: Define for vdso_data to make rework
 of vdso possible
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-4-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=1096;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=0x93loxlpgWqAeU5hAZly4hP7dcYpQTwV/L9FcTK/DQ=;
 b=kgUrJ5kC5QvnFU2yA/1gFs7qZQK2tK6WILz/EsO+Lns9Hz6h0FnvKg0dzWfpJEOg1yXiisPne
 d9rskmxoF0LDOR4RMMR3hpSsg0OkwAHBZhyMnuEvNn5qZQzT76LSfSA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Anna-Maria Behnsen <anna-maria@linutronix.de>

PTP clocks could also be supported by the vdso to use the advantages of
this implementation. Therefore the struct must be reworked. For a
transition to the new structure of the vdso, add a define which maps
vdso_clock to vdso_data. This will be removed when all users are updated
step by step.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/vdso/datapage.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/vdso/datapage.h b/include/vdso/datapage.h
index dfd98f969f151eca3c551c3e90f69af9ee8f22bb..1df22e8bb9b31153546b72b1e8b8c8aeaed7d9e3 100644
--- a/include/vdso/datapage.h
+++ b/include/vdso/datapage.h
@@ -129,6 +129,8 @@ struct vdso_time_data {
 	struct arch_vdso_time_data arch_data;
 } ____cacheline_aligned;
 
+#define vdso_clock vdso_time_data
+
 /**
  * struct vdso_rng_data - vdso RNG state information
  * @generation:	counter representing the number of RNG reseeds

-- 
2.48.1


