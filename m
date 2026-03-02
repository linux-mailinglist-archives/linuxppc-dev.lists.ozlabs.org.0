Return-Path: <linuxppc-dev+bounces-17521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8EJXNP+BpWltCwYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17521-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:26:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D8A1D8524
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:26:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPdSj3SDlz3cGY;
	Mon, 02 Mar 2026 23:25:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772454357;
	cv=none; b=YXLrj/JreMt0oaXQYT7mxPAtMPpwJtn16TXlq/8kqG4z5ZaESAlPDijRZbOV3VMG/ktT+NBc7ACXCyyM1J6V+jSo8iA2Tmokn7Rl1Ul78cGG5WbtomUAMQOK1eMil5uHfwd3XatcWxMJ/Lrgddk+YUPoiV7KzbzdAwia3jJL7hIOsRQ5bmaLfQDa0tJbZPUVcdDiVzI2w0b8RoTXlfXy7eWsFrbeEI9720B4iTWnKXqrQ2/o4uBUfpB/SxwyXJCHZyNt8CmfeRzp19ZAK3QjD/Bxi8uJgXjjGdDeC9Yw9r7j74SqjSh39TzZerX6wyEtJ8POsvtYzKPTiCEMUrCDuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772454357; c=relaxed/relaxed;
	bh=p/rC8JaKdvarxwfXTuFmyKVLUxrMKeBR1vS+B+mbt60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d8Ip1XPB+LUbj118YWr5GTbuhLUUdFO7y0cXBwkLJfXyc0QPsgtcq35zqhzSu1KNU8kdaSMTHfZfqR4qKGUQV7uS8Waw/EzEALEmt9NKkb4Vt0CEpbm413lJONptgHAQlYponSE3haUWHD02jFVa20405Q+FGCL79iCdiEE7se2Mim3nK5Ntb5qnnEsLXnXCXzyDgz1kz6FUHFWpgRrkH5x3FPcxJx6kDwB73MITTiK9p+FYThx5JrAVIiLuW6nmg6G48gRVNrBqOryQztvZFPAjaOFvgePAzZoGdOc4+HA4Y9EGSg6wSGeS3BbaOasdcxNyz/Rg1mHOjBtlCt7B8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ajSAQlia; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JwfnIxj0; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=ajSAQlia;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=JwfnIxj0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPdSg0TFLz3c8x
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 23:25:54 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/rC8JaKdvarxwfXTuFmyKVLUxrMKeBR1vS+B+mbt60=;
	b=ajSAQliaS2qS7tskq6tMH3t68+qJUkIdQPRiKkQMCt0DsJ7PTdi8iUy+3o2QlTfA/80+BY
	pL4KjEeMLMt5yVfqYI8OjS5j5Hgc0vW1HnPf+ayu8rkOjs3Vqzr3P8Pvk1qR09O6GiUPU7
	UjvxcgX0fxJ2BXwr0xwniOcLVDPzRXV2NpnJ6qmMXgvTVUCqPxt79l9TQoCuPBc5LqctF5
	MOP0zzVzjZIt8A9dHgSUvittHeK7AIKBGH1r07yFDH3F1nOQGX7jARYyieK4yCcZ8SyVqP
	WgJmsqUP71HlSfhNa2LCC30IGSGkt4eDD2DxsNAdFLLAYMipDWo+OKxY7VeX8A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454348;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p/rC8JaKdvarxwfXTuFmyKVLUxrMKeBR1vS+B+mbt60=;
	b=JwfnIxj0Sdg5oU0oqOjI3YutVwzh75rX2vx7bewd7VBp+XEcIlK6TmXTrPbufqiMTXJYxv
	PB8QnQj/S2BFCGBA==
Date: Mon, 02 Mar 2026 13:25:31 +0100
Subject: [PATCH 07/15] RISC-V: Remove AT_VECTOR_SIZE_ARCH from UAPI
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
Message-Id: <20260302-at-vector-size-arch-v1-7-a11f03ba2ca8@linutronix.de>
References: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
In-Reply-To: <20260302-at-vector-size-arch-v1-0-a11f03ba2ca8@linutronix.de>
To: Kees Cook <kees@kernel.org>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev, 
 linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-sh@vger.kernel.org, linux-alpha@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1455;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=Zpl+G7mVLygoIP0MMSeWtai1WKLwvJyTNt46U7Sw0iE=;
 b=1sF3PQMcvc8QkKpWrYiRBLQP3NxEkxGiX9D/WLc7u5XoilAqV1Gvh/xCY9I+JL4qVtUA6VIVB
 dt3gdx2a1ezB0KhTVbLa5Br+JAHDOGRPvkd3jjBSo797OWQR9U01GlA
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17521-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS(0.00)[m:kees@kernel.org,m:arnd@arndb.de,m:linux-mm@kvack.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-riscv@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-alpha@vger.kernel.org,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 36D8A1D8524
X-Rspamd-Action: no action

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/riscv/include/asm/auxvec.h      | 13 +++++++++++++
 arch/riscv/include/uapi/asm/auxvec.h |  2 --
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/auxvec.h b/arch/riscv/include/asm/auxvec.h
new file mode 100644
index 000000000000..fb4233445276
--- /dev/null
+++ b/arch/riscv/include/asm/auxvec.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2012 ARM Ltd.
+ * Copyright (C) 2015 Regents of the University of California
+ */
+
+#ifndef _ASM_RISCV_AUXVEC_H
+#define _ASM_RISCV_AUXVEC_H
+
+/* entries in ARCH_DLINFO */
+#define AT_VECTOR_SIZE_ARCH	10
+
+#endif /* _UAPI_ASM_RISCV_AUXVEC_H */
diff --git a/arch/riscv/include/uapi/asm/auxvec.h b/arch/riscv/include/uapi/asm/auxvec.h
index 95050ebe9ad0..0a725f2aa2e7 100644
--- a/arch/riscv/include/uapi/asm/auxvec.h
+++ b/arch/riscv/include/uapi/asm/auxvec.h
@@ -33,8 +33,6 @@
 #define AT_L3_CACHESIZE		46
 #define AT_L3_CACHEGEOMETRY	47
 
-/* entries in ARCH_DLINFO */
-#define AT_VECTOR_SIZE_ARCH	10
 #define AT_MINSIGSTKSZ		51
 
 #endif /* _UAPI_ASM_RISCV_AUXVEC_H */

-- 
2.53.0


