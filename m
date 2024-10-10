Return-Path: <linuxppc-dev+bounces-1943-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B0BB997E60
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:04:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLKm6gj0z3bxC;
	Thu, 10 Oct 2024 18:02:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543740;
	cv=none; b=A5clv9SAZFaC5c6Mqzkt+1g42TWVFJgLI1hx4X36eW5/hrb7JOPESvNtnX/tpCoGBSshpCYCc/AkFH42xdQVOKUOi2MYMYabKpNLbkTHv3W+vIVzpP2VQXNDdEhM/1noNr/A2Zz+AKIXo02S0/geUvLZC62t5+5uemZ23SMmDkN8M8Z1zgmaujhrx9YbrYTMc/6D60uZfOzs860ShQD8Ik3PDcpXzh1vLh+sxRuiW/AU6A4Fc7Db5OLIbsVPO0at776sbW/Tb0qRY5HpGY03YM7SgjJgFWzlBxHx9Izqw/KvR8ax/J+B3a3ELs+kVGj1iRGy21/gJQ5JYw2rsYS3Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543740; c=relaxed/relaxed;
	bh=H3pxKJZa6Dz9N7KL0fbqaL5NdHUudM6Tn8tfqCrpw3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fXrz3gJVVkg9cRAI9m8a5oaGBx1xlQEjO5OBYTYjhglu+xSpXZxByDTC56hr8BreV8Ej8Le1yPg/1eHgqRjJ3T2Q3ayNxJZomuxwdf5jbQeuyYl73OJ83hBQ+SQvo/GATf4z1Z5P4j8DnZR/UmY/a/ReVmnpuuqig7+rE34HBwA5t8EYwFDVr7tAXpKWD/sbzvhzOkcX1mnkJK7+K4qhwHQLCTjRotHpVrna/SOgarekOb5FtGmAxiyCli88S4mkkM60Ud9ZtZ1gxGvQzdwGNbYdrZIC7tY+ewWGn/frb4r2v3Cgm5uCGiK09nsZnFDXT8AOrYH36uaNmEhyrgBtrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2DTRy1A1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IV/lmQLC; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2DTRy1A1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=IV/lmQLC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLKm0crZz3bx1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:02:20 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3pxKJZa6Dz9N7KL0fbqaL5NdHUudM6Tn8tfqCrpw3A=;
	b=2DTRy1A1Cjt3N6qDqe5K0BoAWO29rvBuX3lWT/Kmdq6y6DUlcu+o5N8xMasJzUVFMAo323
	UCWJxZJB7uVwh7vYgi3rL2c0aF10kiV40gO86n/FY/Gs6ELFI+WXw7034+C6fvjVBU9+Km
	6cUj/yfxOGAwsXhHSJ2qvlw1ok88sEREx8RQhGYFJOIsTdYbYDwaEVkcsxgTzLpxI+TDis
	xeE+Yt3rVnUBreZ8INH6EZmxAjW4tIgl5jkaqNfISJLN0D4il65wDYfLb8f+yqiR/btJX7
	U8AKYv47UGDAMFlRmMSXU4DnS4ffmBoiLEGkqWweLFrxuGgKyqZ62pR70p4NYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1728543733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3pxKJZa6Dz9N7KL0fbqaL5NdHUudM6Tn8tfqCrpw3A=;
	b=IV/lmQLC+tb6/qwPperJNfOrXaHrcDq0MS4XMYW93SesVIBdhcL1FpwRI9clUaqYuSppji
	GOyanx7CMHQtKaDQ==
Date: Thu, 10 Oct 2024 09:01:25 +0200
Subject: [PATCH 23/28] powerpc/pseries/lparcfg: Fix printing of
 system_active_processors
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241010-vdso-generic-base-v1-23-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
To: Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Russell King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, 
 WANG Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728543717; l=1056;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=HfYxZYn096ZmYlxVv66aK8g/TgQVVJxm5uuInCFA/Ag=;
 b=oZA7lqIB0ZYZamYJTdMLiIdxhQ9YAXkJRqSzP0DH/sWgj/BV0RrnPmuB+2EWqY1XHIcr4xxVG
 83Z3yTTuW7NAeyn0FiM1R3/kFvm4xnMGIAGj4qfIF/57BcVneBBZgVP
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When printing the information "system_active_processors", the variable
partition_potential_processors is used instead of
partition_active_processors. The wrong value is displayed.

Use partition_active_processors instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/platforms/pseries/lparcfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
index 62da20f9700a974200c05a9d5de908746f2f151d..acc640fccca17b54c42eca1a242b37ad4299f685 100644
--- a/arch/powerpc/platforms/pseries/lparcfg.c
+++ b/arch/powerpc/platforms/pseries/lparcfg.c
@@ -553,7 +553,7 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
 	} else {		/* non SPLPAR case */
 
 		seq_printf(m, "system_active_processors=%d\n",
-			   partition_potential_processors);
+			   partition_active_processors);
 
 		seq_printf(m, "system_potential_processors=%d\n",
 			   partition_potential_processors);

-- 
2.47.0


