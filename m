Return-Path: <linuxppc-dev+bounces-17528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iOwwLS6CpWltCwYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:27:26 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F1D1D8597
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:27:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPdSn4jb2z3cPJ;
	Mon, 02 Mar 2026 23:26:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772454361;
	cv=none; b=CymLAfDdrwwjFNX11dDZMrvmbsH8jN9VLiycbaUubk2zfMYE6xYuTx5/OqxJWyx3zzS4LRrNXhtFY9Del82vTdITE/qruH75CSIjVtydCko1tMufMQDHGQvpHs8iv3TksaxFhJgT8iRSUWHIxCsC0b7TF8XP81q2oOqTzBaXxKKDzct01wmS2z8BoZwZ44oupZMV5paTFX2AI986BFOGHWK5LSqhCDbMT9PlIwvE15crtMAXMmO2XVgjEkP+Jmz3WYibXiEAKRh6Oy+rAlzK/dNdUIZ3OIAU2L1JHdeAZSLcot58kCmQeJZiy50MraxNulHjNUiMYVhkS61bvH64MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772454361; c=relaxed/relaxed;
	bh=rUatCUMGjSOAYdWwYL9kAf5S0UMPuz+Fx84eRD4pGU4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bL2/NSD+G74sqwXa10iLyUsvEfkfwpqMz/CJkFauc35KC1omw3lYPqllgV7X793EQqqBNUzCC84bJBhFSLNa7iKxLJIZcQmqVXbz3JIaMCUczS/cOhYoG3nWtCvbCOKnAiphRgfvzMFqE5LlQHUKwvk2AlWGJLmpJw15ZtXuKMWu5/0g62XkIDk9pGKAufgxSIXGU1zS7S4TTEWFgQOKmVB2gJ1ErUg0OEXQ3jR82/9Jfr+3wJZe60UgApwSIGR9xb6Zs/M37xQxnzwIb2EdLbSVD01SIULut86gwIlG80s01LFK/IzQTz72id+hE4YM+uidsCfNb6319gWlki6xDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MW1bGCsS; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Glqb/iX5; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=MW1bGCsS;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Glqb/iX5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPdSl1JMZz3cLr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 23:25:58 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUatCUMGjSOAYdWwYL9kAf5S0UMPuz+Fx84eRD4pGU4=;
	b=MW1bGCsS9DfO9X+v0DSKadvLFn+SWmk1pn+rddicrRlb+25XuZl0eJt6iP0G+BXg34cvQ+
	1Ypq8dU9/4H9JLtsbNLwN5Op4E1bl+T4qCK3Q+t4+bjDkmJqqKq1cZulRp0Q5bjxyuTa47
	wiRCfLK8Jy/Zk+I2mf8sQaKTwx9mwTzg39fMPaeuYCeMY1g5BgCHN7iPogP3geq0eUFj3Z
	1espng2OIo24NrTFZzZJjZfVEZhat3bTP91FgzcChTJq/X8HDD3/SOOdkrO038gUGid1NP
	/TG9xAya313yScFDighxypdFYvV3s2al8OVDGX6NMfe71/7TtA36WV+yKWJIog==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rUatCUMGjSOAYdWwYL9kAf5S0UMPuz+Fx84eRD4pGU4=;
	b=Glqb/iX58ImwLmydqxjJwzbHZqXKn5FJ/rKO/+KdO7fpIDILYZKeypk8G9y+WgL/AIWKQi
	8ZSn2D4OHrttUMCg==
Date: Mon, 02 Mar 2026 13:25:38 +0100
Subject: [PATCH 14/15] alpha: remove AT_VECTOR_SIZE_ARCH from UAPI
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
Message-Id: <20260302-at-vector-size-arch-v1-14-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=1621;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=1k5fCTPjgHXmT1wIddDgmvVMNFYPCfoGbNYiBvOaniE=;
 b=+emcoOjpmCtOGbRKRilDXun4wh9rZo8IxjTkm9zYNPepV3X+fcHLumuZs3KaZBdDmhAbmZz3X
 Sar6SiZRFKiDIiijEXUFkxsbjuuwCItZ6i5gyRlwHoXVec8Fv7oUaT2
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
	TAGGED_FROM(0.00)[bounces-17528-lists,linuxppc-dev=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: D1F1D1D8597
X-Rspamd-Action: no action

There is nothing userspace can do with this value. In the kernel is
always combined with AT_VECTOR_SIZE_BASE, which is not exposed to
userspace and also changes from time to time.

Move the symbol to a kernel-internal header.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/alpha/include/asm/auxvec.h      | 7 +++++++
 arch/alpha/include/uapi/asm/auxvec.h | 8 +++-----
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/alpha/include/asm/auxvec.h b/arch/alpha/include/asm/auxvec.h
new file mode 100644
index 000000000000..fa90ee4f899c
--- /dev/null
+++ b/arch/alpha/include/asm/auxvec.h
@@ -0,0 +1,7 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __ASM_ALPHA_AUXVEC_H
+#define __ASM_ALPHA_AUXVEC_H
+
+#define AT_VECTOR_SIZE_ARCH 4 /* entries in ARCH_DLINFO */
+
+#endif /* __ASM_ALPHA_AUXVEC_H */
diff --git a/arch/alpha/include/uapi/asm/auxvec.h b/arch/alpha/include/uapi/asm/auxvec.h
index 57cae8780d81..d21b87b6730a 100644
--- a/arch/alpha/include/uapi/asm/auxvec.h
+++ b/arch/alpha/include/uapi/asm/auxvec.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
-#ifndef __ASM_ALPHA_AUXVEC_H
-#define __ASM_ALPHA_AUXVEC_H
+#ifndef __UAPI_ASM_ALPHA_AUXVEC_H
+#define __UAPI_ASM_ALPHA_AUXVEC_H
 
 /* Reserve these numbers for any future use of a VDSO.  */
 #if 0
@@ -22,6 +22,4 @@
 #define AT_L2_CACHESHAPE	36
 #define AT_L3_CACHESHAPE	37
 
-#define AT_VECTOR_SIZE_ARCH 4 /* entries in ARCH_DLINFO */
-
-#endif /* __ASM_ALPHA_AUXVEC_H */
+#endif /* __UAPI_ASM_ALPHA_AUXVEC_H */

-- 
2.53.0


