Return-Path: <linuxppc-dev+bounces-15692-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D02E5D1CFD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:02:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drdqp0WXLz2ynC;
	Wed, 14 Jan 2026 19:01:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768377717;
	cv=none; b=HonN7oNP2lqmAzH37i22kFz07vGq0L6KTvJPe5vG1CL3iU369PX03jQXnRJo0PN9bOgrJT6OjswqZ1krcwGmwEBomQw2Mk2AEJEGMFJq6g0wdkoh3KpQhptf+lQ4chKrEImizibPI2F9Os4+cuU23Qu35A8/xjOCvGk9xCY7FT8AxKk8IzaIKmAgVtSstd3CXkYd9cANoj80WnJpW3VSYaaLo3RCecvKaS3nSBLn6FK/OzL7nXChm90HjMp6c0hd84IV0gTTP7jdxvQ1vmfUT6f9vxCKX32cp6VB2+1wNgY811HoHCvxGEYQSn+nUplJIQYIojXhaAuZQQzc57vf2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768377717; c=relaxed/relaxed;
	bh=0kIfhCctwH/PXRTS/l0pyrY0rWJculxYA/h7dmY+/9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QNLkp2Qx1WF5yTaRD452+noOqZlBPJTBPFImi0DejeYrsXDMKEHVZnaVp++8uSNwKWSoS4q5tB2MrVZIi6ZDNvbKaW9CnZg61+vI9C52BeG9wZ6j8RYRZGUuwyYnBXkwpW2bijfAfBx6qmmsHdGQL1DhjMNKmLVrAzvPTcAeK/4E15QeZD3QkHGFDwkV5rUR6yum9cGtGwnsX1fonxcPzsN7fN43O5MxxRqfm0jDes1whLHOfEOxew4F/S82qevME1XXAlisigEzFYsXQV7Lxfkdz/hwpSNpQ/y+GYFkm48hi9L4YJDrkFrXhYdNvEtWJMBt+TYkKg5Ob1HzgWzh6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=R5HC7GTu; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qweOf2NE; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=R5HC7GTu;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qweOf2NE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drdqn0PN7z2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:01:57 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kIfhCctwH/PXRTS/l0pyrY0rWJculxYA/h7dmY+/9c=;
	b=R5HC7GTuc259FnQxZrp+F5cNuaIoqy8A+ES/ta60Un2RsZxIod0YLBs/5lvuk/8sCfBcAw
	CwfSEBD9J/oFYWHtkATRmZvTX3DL74gCiBcYV2lYjGZWiwpjPlHt2eUTne1FYso/qCPD3B
	7kCUi53E15QfiWJtVf1YcV775RxLushJo5GH1LVA07p6oq+HrUEkgf9k6TGAq5eVWxggUY
	K00RCb0YrS6j4b503xeAwxfr0XvA4ie2ixgYs+9cWm43F0ayCBsL1C77M/xAWOPRadxM42
	rgTCIbVPVdq7MXLdgHcpTMqflxCfPivR/7vm+TI8rM3yQu0YJzhanbRDkUGlTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1768377710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0kIfhCctwH/PXRTS/l0pyrY0rWJculxYA/h7dmY+/9c=;
	b=qweOf2NEn+Fp/jDOE0ObfArk2md0NGD1Z/8dF7nNyaA+uRwgAKPz/pww3+6mAnm7R0MfbP
	G4dmGsbg2zb55qDA==
Date: Wed, 14 Jan 2026 09:01:46 +0100
Subject: [PATCH 14/15] random: vDSO: trim vDSO includes
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260114-vdso-header-cleanups-v1-14-803b80ee97b4@linutronix.de>
References: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
In-Reply-To: <20260114-vdso-header-cleanups-v1-0-803b80ee97b4@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768377702; l=674;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=iHRl2iopmVoBePzD44Ct4WnbPDG3Iws20lECSBoN0BQ=;
 b=TVPL39Ltr/bfzoeZIk41jLl3TqbrMhbh4gc6ACjsLk7nBMd2BGcBUreA6Oc23LOS/NZtXPByZ
 OVgpnwljI5sDx8kJaHvSrgE0mqNtbsrGLWjIuxYgBqXYq+noXoe5/IK
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

These includes are not used, remove them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/char/random.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index bab03c7c4194..c5122ff33594 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -57,9 +57,7 @@
 #include <crypto/chacha.h>
 #include <crypto/blake2s.h>
 #ifdef CONFIG_VDSO_GETRANDOM
-#include <vdso/getrandom.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
 #endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>

-- 
2.52.0


