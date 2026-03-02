Return-Path: <linuxppc-dev+bounces-17499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aEI0IWpDpWld7QUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:59:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5521D4463
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:59:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPWXj0sbXz3cDV;
	Mon, 02 Mar 2026 18:59:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772438340;
	cv=none; b=AmONwstEaKdvJ1tN8t2KllANTp9B2eKD0Mn9mCz+CAfflzCxKeBxKo10zF3FoRtlyR98ojZktOaEv8E0d3zf0lf8b6LgHMfFEfTmi1D+k1B3bGAt0gfAB0r8Wq6cKqIVirROTlpZVfcj4+7GYznBqR/s/9rr7B/YbNAYouhfRVwhppY3h4Mt+/lXJ+zVTkM/9m+0jlrhJFAGIMTrPG0jAwFqpW3ILeTj4GaSelY/N5yVnZav4wcIRPpPuHricJyVlosoNB2jaBpE3YHIDejHQjgiVMSPpPrg+8tT24QQoeoZ64wXhmkotM5ZDcyk6DTpv4ohKByK5Hfg+YouUUgbLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772438340; c=relaxed/relaxed;
	bh=7mI2rabXaAbR/YnFrW0tM4r08T3dQVWOtIR4ie4zo3o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cyFSpGH9cm5ZXWijOo3vT7GS5ss0Y/+WczTznDbcimYbO0IUJmmaBBXkiAXcnQcsBy4jocO+qsutIpUwUaCp+33UEHJen4ZCUKWDIYV1qOaGWmMIH1Zxm8ZOQWNr7iBKISutCFGOf8ao4/u5uHXD3/W8ElVWx2HAkX8nMGGj7ZSSrUS4WIb/PAjIjOA/igR59j1R3+XJ/op0bY05xm9APblCGIIYL+5qfqFbyy+8GMBSWwfr8qDhXo4Zd0eNP1os3UGBGuQ3kmJ79pCpNF73cxQPL7nkvI2XDrwJJf47MBlXfc0wt26w0+Vt+N1PKDiuuoh5T4rwUpt9wZOZskBL+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=p8FqyHOm; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NP4qPJlE; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=p8FqyHOm;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NP4qPJlE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPWXh2b0dz3cBb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 18:59:00 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772438332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mI2rabXaAbR/YnFrW0tM4r08T3dQVWOtIR4ie4zo3o=;
	b=p8FqyHOmkJHYpPNhYhThF45B8NXfjuqeW+KMfD5NSW9slZ2D4dzWmXRdwTy+zwB7hmgeyp
	AIqtPPv02rHjZuORVE4prl2ouDsyZAuf4VbIczoF4L+WQpPOY99MUuDzBW3iplsio1sdvO
	KvSGB1GT/HEwoEaIn6hMflsAk/TIkaawbL+tPgUWWqcacZXLj8oxRhsXPP4AXkz5u+/0ZF
	kMKJXzxj0tEvWDN3SpNXOT6UReGvlzcQ+oZP0E0j697ochamdnqIIXB1AihPSC5MqDLQ+P
	dSmv9tBH7s5JpOHa1wzR/iE4sexOuiyjF63ZkaIyau09sJbUxOkUQzgUXyd9Dg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772438332;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7mI2rabXaAbR/YnFrW0tM4r08T3dQVWOtIR4ie4zo3o=;
	b=NP4qPJlEsfbZcsJh2MCzm7yhxzQLQGDYH6J0mbdc3AB7YcExGhGSt0Qf6n+bYKzrMJe4MN
	8Kj4DO9dM580BrCg==
Date: Mon, 02 Mar 2026 08:58:41 +0100
Subject: [PATCH v2 5/5] asm-generic/bitsperlong.h: Add sanity checks for
 __BITS_PER_LONG
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
Message-Id: <20260302-vdso-compat-checkflags-v2-5-78e55baa58ba@linutronix.de>
References: <20260302-vdso-compat-checkflags-v2-0-78e55baa58ba@linutronix.de>
In-Reply-To: <20260302-vdso-compat-checkflags-v2-0-78e55baa58ba@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772438327; l=1561;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=rruAPBqVSw+HPUqu0oOkWelmtswIYn2lhLTqTiJ53vE=;
 b=jsEuD2JRemugj3Kh+6TKAD0gkuvtmrqxpibTTZZ8prtNXAz7vSKNElj3VZrERLX5EQ/DGzIub
 eOVRbIPOYXuD+pT3ErAQIm4w1IhPu9WROaT/REZDfb6RlybADa6wjC7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17499-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:andreas@gaisler.com,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-s390@vger.kernel.org,m:david.laight.linux@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:thomas.weissschuh@linutronix.de,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[davemloft.net,gaisler.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[26];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.ozlabs.org,linutronix.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,arndb.de:email]
X-Rspamd-Queue-Id: 9C5521D4463
X-Rspamd-Action: no action

The value of __BITS_PER_LONG from architecture-specific logic should
always match the generic one if that is available. It should also match
the actual C type 'long'.

Mismatches can happen for example when building the compat vDSO. Either
during the compilation, see commit 9a6d3ff10f7f ("arm64: uapi: Provide
correct __BITS_PER_LONG for the compat vDSO"), or when running sparse
when mismatched CHECKFLAGS are inherited from the kernel build.

Add some consistency checks which detect such issues early and clearly.

The kernel-internal BITS_PER_LONG is not checked as it is derived from
CONFIG_64BIT and therefore breaks for the compat vDSO. See the similar,
deactivated check above.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 include/asm-generic/bitsperlong.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/asm-generic/bitsperlong.h b/include/asm-generic/bitsperlong.h
index 1023e2a4bd37..90e8aeebfd2f 100644
--- a/include/asm-generic/bitsperlong.h
+++ b/include/asm-generic/bitsperlong.h
@@ -19,6 +19,15 @@
 #error Inconsistent word size. Check asm/bitsperlong.h
 #endif
 
+#if __CHAR_BIT__ * __SIZEOF_LONG__ != __BITS_PER_LONG
+#error Inconsistent word size. Check asm/bitsperlong.h
+#endif
+
+#ifndef __ASSEMBLER__
+_Static_assert(sizeof(long) * 8 == __BITS_PER_LONG,
+	       "Inconsistent word size. Check asm/bitsperlong.h");
+#endif
+
 #ifndef BITS_PER_LONG_LONG
 #define BITS_PER_LONG_LONG 64
 #endif

-- 
2.53.0


