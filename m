Return-Path: <linuxppc-dev+bounces-17494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MAcqA0lDpWkg7AUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17494-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:59:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717D41D43E0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:59:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPWXf1bP8z3bmR;
	Mon, 02 Mar 2026 18:58:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772438338;
	cv=none; b=AB9REvdYb4LDivQ2O/I0IBQAGT1UikW1AwOZyMJ8+QNq7456MX8HQfYuTDNPj1KDbW1fSWeTOqiE83XPN7QtGsT9mJjyb2BlkuL2d2T3N4j01P3qKSvlCHuVdggq9j+WYlom1pdgZ3QCO/xgJISrp7X3ZUHPxQPIx7XwFJa41ZVpi6EdbNe4Wkm90bYbMiI+cQuAn0kgJq1RLOI7hx64QyW724/fFQO4/yCtWeTipMTIexZIkBve/UwsZqyMmeLLU8MMDQhOapt6AobYDeXsAJhoQEL7fL4A43pWQDeuJkKwDtn3mDgviW6leeSYU0c7VFlyrfECVGoRXOgQwpXpGw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772438338; c=relaxed/relaxed;
	bh=CppVINWDU69mplj8+k/K366WYv0fGhniEacGlAHg1DU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZAIk8jj16WZzIL9r3/78AXkpV0Ow+/cwWRsbRaAeem8QpitGmnC+UC1Vh1Q8ioFKgMZtea1hWYfsj4YfRvC6Q/BfAw2QVZJERoIoykhOwX3hbpiDzmXIF91S8nZOjfXaCXzYOkg2ZT2KGdTElpgiybmWJWvtNlSWWk+gSpMTFR2kQKfIvA2Dbibslu/KvwOPnpzA0d2jR3KJEgY2R8PYYyDQFN71PFyMrjc3NxWfFuH81szn6OpyqZPr93hG7wQT9r/QM1U3Aq1EfDLKqiPMxijCVeFfmWiB9WsHbjcUlIgj6A0gVt2UUr+EBnFVNFLNy6+evmMGiJRt7dSYRlVuuA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=v+W0svcx; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jXG8V5V3; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=v+W0svcx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=jXG8V5V3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPWXc5241z3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 18:58:56 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772438329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CppVINWDU69mplj8+k/K366WYv0fGhniEacGlAHg1DU=;
	b=v+W0svcxWjvODHkF4KURqjcM8wAaw+WlIdEMkq4ngppf4gT/fmy6MtWKqRhhTweq+J3rv8
	MJcgxRx7mpMjSCCQPGVkoJFl7mRQgcoc9+rGDVZPbI+fihzeJIW/4zF0F2V3IVerR3ZYqp
	vyU1MOH/cQvROAdZWsdPKd7avf1251DhOhqMAfMErDvAIxlF6nKqV8B1Bbka2UGI+6mWDG
	/bc70Ggm1t5GwcDxnt/a2R4uqA8ig168AcjV43SaBN/QWGRqqUQO670I7Jn6OCmmhI7hhN
	duE15ko8bozxDHYcROnHQyf2exgxGqmCLZLJwzn18w/SeSY48ZUv39cYJ7rD5g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772438329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=CppVINWDU69mplj8+k/K366WYv0fGhniEacGlAHg1DU=;
	b=jXG8V5V3pA2/haiPpMZ9guEgfY1AO2AitAlh9Qt758wRbbUDxScB4f1GL4CtxrJVmU5bBu
	YeF9Uo5nflKaYECw==
Subject: [PATCH v2 0/5] vDSO: Use 32-bit CHECKFLAGS for compat vDSO
Date: Mon, 02 Mar 2026 08:58:36 +0100
Message-Id: <20260302-vdso-compat-checkflags-v2-0-78e55baa58ba@linutronix.de>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3XNyw6CMBCF4VchXTumLTfjyvcwLHoZYCK2pMUGQ
 3h3C3uX/0nmm41FDISR3YuNBUwUybsc8lIwMyo3IJDNzSSXtRC8hWSjB+Pfs1rAjGhe/aSGCLX
 Vba1LXWllWD6eA/a0nvCzyz1SXHz4nn+SONaDbLgQzT8yCeBQqVtGe625LR8Tuc8SvKP1apF1+
 77/AFK5eUvAAAAA
X-Change-ID: 20251107-vdso-compat-checkflags-5db75b3b4bac
To: "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski <luto@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, 
 David Laight <david.laight.linux@gmail.com>, linuxppc-dev@lists.ozlabs.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Sun Jian <sun.jian.kdev@gmail.com>, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772438327; l=1844;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=o0N8GcMd8Wv1v1vLFraNSKorTTZyIWNgl6SVsYTfGvc=;
 b=MZ2OUVAM3Gleol5ZSIQ3VTyufDy8HqTIN3psf4kzTZTtf9sT/PYCXgIptOdpvIFbxqTCLZjnl
 u+RXqDzMqNSCyLY/Zn0lSlGwSrdXlSVqa7nzpIWjfV2tcfFJB+c7vHz
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
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17494-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:andreas@gaisler.com,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-s390@vger.kernel.org,m:david.laight.linux@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:thomas.weissschuh@linutronix.de,m:sun.jian.kdev@gmail.com,m:lkp@intel.com,m:dan.carpenter@linaro.org,m:davidlaightlinux@gmail.com,m:sunjiankdev@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[davemloft.net,gaisler.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[29];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.ozlabs.org,linutronix.de,intel.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linutronix.de:+];
	NEURAL_HAM(-0.00)[-0.982];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 717D41D43E0
X-Rspamd-Action: no action

When building the compat vDSO the CHECKFLAGS from the 64-bit kernel
are used. These are combined with the 32-bit CFLAGS. This confuses
sparse, producing false-positive warnings or potentially missing
real issues.

Manually override the CHECKFLAGS for the compat vDSO with the correct
32-bit configuration.

Not all architectures are supported, as many do not use sparse for their
(compat) vDSO. These can be enabled later.

Also add some checks to bitsperlong.h to detect such issues earlier.

Based on tip/timers/vdso.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
Changes in v2:
- Simplify __BITS_PER_LONG consistency checks
- Fix an inconsistency in the powerpc audit code
- Move check to kernel headers instead of UAPI ones
- Use KBUILD_CPPFLAGS = -m64 on s390 instead,
  the previous include trimming turned out to require changes to many more files
- Rebase on v7.0-rc1
- Link to v1: https://lore.kernel.org/r/20260116-vdso-compat-checkflags-v1-0-4a83b4fbb0d3@linutronix.de

---
Thomas Weißschuh (5):
      x86/vdso: Use 32-bit CHECKFLAGS for compat vDSO
      sparc64: vdso: Use 32-bit CHECKFLAGS for compat vDSO
      s390: Add -m64 to KBUILD_CPPFLAGS
      powerpc/audit: directly include unistd_32.h from compat_audit.c
      asm-generic/bitsperlong.h: Add sanity checks for __BITS_PER_LONG

 arch/powerpc/kernel/compat_audit.c  | 3 +--
 arch/s390/Makefile                  | 3 +--
 arch/sparc/vdso/Makefile            | 3 +++
 arch/x86/entry/vdso/vdso32/Makefile | 4 ++++
 include/asm-generic/bitsperlong.h   | 9 +++++++++
 5 files changed, 18 insertions(+), 4 deletions(-)
---
base-commit: 740f1913cfa0d48222760eaa438c509ca9fc3710
change-id: 20251107-vdso-compat-checkflags-5db75b3b4bac

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


