Return-Path: <linuxppc-dev+bounces-17515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aKOqHNWBpWl1CgYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:25:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F17F1D84A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:25:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPdSb4vt0z3bn4;
	Mon, 02 Mar 2026 23:25:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772454351;
	cv=none; b=ZYZV9tc2V4+7CwuWgmomKOpzckxcj/HxevQaQzzTz9eS/MKW3wfeOEobjbhWKfKTJ1MMBg56oEh+XNlgIxIqnxHYC039Qlpx/MEvwNUnj0xZxk2RAeO2Cl5h3U0QuVfE5JJE6qDmMYbtCeOE/opnMieeA4OO0w4XvF78QwH1OB7Lq+4A8uPau6npMM/ZhmpWDtzCBLuwdj70kIN71tR81kCUOpbL5GL6IYZaBY+lesQJZuqQbZkqlvPWc7ZvPtPfdgMQRnQWN7/CKm7wvNPQXnXP9q0lh+t0QA+eEcAl354sOBqRo5IZMSjvuKhxovp6g92WOpo5wyWRQE75N4CxYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772454351; c=relaxed/relaxed;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NMTevcz2GAWUS4R2wwxXdB2eDjhbJNlzllfA2aYm50d18Fe+dBKxvZyhd4ANyERfk1LVvbGROTlrGFtOxnJCC77QIx398xfR4GsP7LLudyaUvl8UqhuA4hVM1V1m37hgi3SraiFB2t9chL/ABvSUQ+iuXCUJcY4VH5p9lOcNpYlfyB/g8m7jS1iBuRktwrwZuHSAfV38XxcXELtDG4HN70Z+HBMdb/98D2E5gmn8RkW8S4deO5LFjhw1pp6ECWrLJOJsvh1UtIX7mTHt15iARvdpqFmmXXs5r0aepuEQoLx4ubYXM6+oM3va7dS7t5sQ4HtEKUVatFpdau74PG9bSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rxZQv7hK; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4UlDmyzz; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rxZQv7hK;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=4UlDmyzz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPdSZ4KrWz3bW7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 23:25:50 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=;
	b=rxZQv7hKeFYWJyFKJsUWMqNlbl2vjnSpyMUWvtbM+KVkUK8WaqYOWnhTleOFkje/NFvInP
	Qt/vVXUdfFnn1iq74C1RCTqwoqvw522r7PU2TEuWmhtnt/N+13u0BFDqvSJ9+N50ZjfS4U
	BSarBmo8rYOEJLTRt0ek/3O3vhTop7sJQum0OPLLRalA9vrZx9iZHrKfjYg84JldDBDnZA
	t0WwlWRm4tnjSIcfZAdKa6/AeBM96TDCbJDRytzgPtYIaNnWXkYcPaqvUu9PXVyIRi67Kg
	DLHn9Iv+m+Ef7KGJDn9Agiynrv+ZuTEFjtwN8a9glkN8hM57G/egFrrJPWtgeg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=glnHOe4x1n8QotwxnJCfVYRyCZYHnBdaRGVCFc6KFbk=;
	b=4UlDmyzzjetdRsu/XceNY6w9k+iZB9u+rg7F/k0y7+4PQofKHMuBzzowktpEfzJO2FIgmM
	N2iAdlv556mYd5Bg==
Date: Mon, 02 Mar 2026 13:25:28 +0100
Subject: [PATCH 04/15] ARM: drop custom asm/auxvec.h
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
Message-Id: <20260302-at-vector-size-arch-v1-4-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=481;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=x3siZYFPocmk1PJ7pJ2spSV3FxjnTs1Nv3DHpd4VwUE=;
 b=rDZhb8bdTw53LKoUbzecX+TybS3+vD/iuZGnWTOdu4kbPRoekZDJcE/myi94bDcvoXoVfIa/j
 i0gchlTXUzRD5/MoKkZ/K9H2k8m5yzGUuEJql+dJlXH03noNQrp6bhu
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
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17515-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 7F17F1D84A0
X-Rspamd-Action: no action

With the introduction of asm-generic/auxvec.h, this header unnecessary.

Drop it.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm/include/asm/auxvec.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/include/asm/auxvec.h b/arch/arm/include/asm/auxvec.h
deleted file mode 100644
index fbd388c46299..000000000000
--- a/arch/arm/include/asm/auxvec.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <uapi/asm/auxvec.h>

-- 
2.53.0


