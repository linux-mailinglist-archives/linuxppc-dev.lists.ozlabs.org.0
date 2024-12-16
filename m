Return-Path: <linuxppc-dev+bounces-4179-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 489279F3257
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 15:11:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBhgR0gm7z300V;
	Tue, 17 Dec 2024 01:10:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734358258;
	cv=none; b=RQ6qY29AaazUwik3Kvj9bx6LfgbUqIpaFnXKZY7D30ag6U2Ga/KqY94MLBrLrfzkIgaXrHbHlzGvebgPeG4cFJTgepa1MVxfqeT3n8iFmI8qNx+9l6sx1tkqDhGLlhvAIUOkMP6cYznm/E3Xn8Yc6FMenTm1wcbWEfDx4YzPDTgaPIehHbvT0gVCEm8LhTximhvgqLlckAUhKeeipp69jOFWoqsNcfdjLaHkA308CqaLfnjLv+KFjup17eQu2KUxwo4iYQu0idCTmAGKqIsmkLG9AkDwkHIReIw9YWa5ZWSNwwV9eRUoyi/K+tV1xZ3ZIeZhZBzd9xXNBSDSJH2GrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734358258; c=relaxed/relaxed;
	bh=lbUS2hSpGUfA91ZBUqWCU2EUGjDUwjlK6bc3CIpIefE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Qrj2VTz0z2tS68JAlWXeMWKJy7H6IKjTA59WLXSr8m4iw0QbMZU28hptEhAfiq/P5QuFVYfeWzWx73YdVsfV3fUfbThHQZrenLTROXoK811Bw7a7uFKATNHJYSvUO8+bKsT2f4HodGI9Dt3ugu4YoqbrFKu1HYQnDlMTaRbRYCAAfNe6t5fKLi3xx8++rVhjnWVECNCojHpXcy/ydn8kxOLt0hdlsvQldBcRG+1uIKsgsXZKLyM8GVvbw4Gh/0NU/p5gyZZUIfJvmQkL5NMG+TLuJHdxNcZWqpIqL0+0FAp9WlzP0y8psCeRmuvAys+QNYs8/51d847ZK06klRr2vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GuH2uzo5; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hHswSq9R; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GuH2uzo5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=hHswSq9R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBhgN4vWMz2ywR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 01:10:56 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1734358251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbUS2hSpGUfA91ZBUqWCU2EUGjDUwjlK6bc3CIpIefE=;
	b=GuH2uzo5FyR0o68VJgLh22/tvAh4VO3tEUIc29jvZ8lPLWfEUfhNVtSSK4HXCnohLAwbXo
	gEvHjDWSFgEqrnTfKdaUVzxP8s5vskJ2urPXPUkPw83/2mrnYmmUmtERhGRPRyqbznf4z/
	TVaywADhuO62/QPyaae+wx5X5FFV9M6xrmUCZwtSxnJjI7TGlFQtv14U1ie1HeMP7FyoI3
	c1H/xkAQk/cMW7DvQZU32HKaDQtXwDyR962kNnn2WJH5P5qddPMfspglgzNhxbDwOoN8y+
	dtTDWffUBFUBMw1UmRJd6JaZJDQjLnMLryFw+HzWyUuw08nbuaNBceWbkpr+/Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1734358251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=lbUS2hSpGUfA91ZBUqWCU2EUGjDUwjlK6bc3CIpIefE=;
	b=hHswSq9RfYopT6aqpSY7CX9cu9WJ1N9ZlLIWnRYrgQChCxsQi0dPawuK/Q9SjHGdFt/Ezg
	DmHWkKKYf0nrzRBw==
Date: Mon, 16 Dec 2024 15:09:57 +0100
Subject: [PATCH 01/17] parisc: Remove unused symbol vdso_data
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
Message-Id: <20241216-vdso-store-rng-v1-1-f7aed1bdb3b2@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
In-Reply-To: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
To: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Russell King <linux@armlinux.org.uk>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 loongarch@lists.linux.dev, linux-s390@vger.kernel.org, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734358247; l=796;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NPXgHz1pg7k88XY5Q1tIpqIToZjmPGQbKRJBGkTsdlQ=;
 b=qIq583Nq2J6WTZk5uFF7tgmMVMT+mFXj9RQI8M6crN6E2uuxfEuALnkyGREgmp/vYO82I170d
 yKTyVvOCDqzB5fc8Z9c7wx+qHEKzuwOd6U9tdpzQYbFVujg6jSoRO3t
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The symbol vdso_data is and has been unused.
Remove it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/parisc/include/asm/vdso.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/parisc/include/asm/vdso.h b/arch/parisc/include/asm/vdso.h
index 2a2dc11b5545fc642a7ae4596dc174111433e948..5f581c1d64606b3ec8f9967efe31dd3d551adf76 100644
--- a/arch/parisc/include/asm/vdso.h
+++ b/arch/parisc/include/asm/vdso.h
@@ -12,8 +12,6 @@
 #define VDSO64_SYMBOL(tsk, name) ((tsk)->mm->context.vdso_base + (vdso64_offset_##name))
 #define VDSO32_SYMBOL(tsk, name) ((tsk)->mm->context.vdso_base + (vdso32_offset_##name))
 
-extern struct vdso_data *vdso_data;
-
 #endif /* __ASSEMBLY __ */
 
 /* Default link addresses for the vDSOs */

-- 
2.47.1


