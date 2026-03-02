Return-Path: <linuxppc-dev+bounces-17520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFSzB/qBpWl1CgYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17520-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:26:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD1D1D850D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 13:26:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPdSh6hhSz3cFG;
	Mon, 02 Mar 2026 23:25:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772454356;
	cv=none; b=PdNa4qv+68BNS49GzaRjaaigdf9aqbXon36h8qvwoDB0QzECkhKo4eS0JBH4Dxq5Av0/pkZhLaiEPf8Nd1xaFl8jeYpIxxlR8Xowt7C6TBZop54D3qcQPt7vE5g6tona6+tsNHVugaXrGxwFmjuQ4OzsLUeKADQJu9nubWv5YjdxcDWHA+3j+GlcwWDwyDapbDq7Rpw9SDTC0utqGfE24J4W35rwIiHXTL9WFacHJpeX5j063pPcPg2tjqYxYJWu2MU5UBOMjr6g38QXHc1fghARyqWmTIsmC02bwhiZi8oBENB87AEgTBgU3Dp5SiBXk5H3zX2zQoMKLnLm2RPWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772454356; c=relaxed/relaxed;
	bh=Y+wSVvr2iY1iH7k3F0iPCSqLzNSvbTbj527LLEkOjHE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=grJ/Ie0sARW8XWnp7Eh3HDfoUcs3tgzxRj424Rk14eeM+whmu+QovXLyr59Tr8Wq6ZPVpjP2QsS8KQUmEMdQQF5fg/3qrrMb9j3kS0UVuYHv36Q76IozlfDp4iiD3z9WXvNC9HPpolcI9D2DYcbib+QIb5YX96YWvTZB8a9zABZtrbjkCc4nasa6ldWSxl2emj0DNr6FVw0xkIiE9MMZ44BgNubLAJKajk5ZHMbR1VOI/FpHF2uiWzUuvGxMXL8KvkzmkAQdf/1JGOzu2CWNXeuFnM5eTt1dsoL2JPm8bZ0zxhIODMpPv6B/wx8ApaZzvQG5ZoxulEz60Ww4UV7rQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0ote18nb; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/aSPglB8; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=0ote18nb;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/aSPglB8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPdSf5DG0z3c7n
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 23:25:54 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wSVvr2iY1iH7k3F0iPCSqLzNSvbTbj527LLEkOjHE=;
	b=0ote18nbZ1t68zJyeexrdJSVHAZPwP9UOAsFgAAFR/fpqYcoez3egBK6lgBnGLIpBoYIKz
	byNNJflcxX/8kT7PsREcxt3F16BI7KnZB/m2IKc74GZSYeD2m3CHoAuFhIulLiNJ8gNHgT
	fEGJClPPwBHWhKwqt8bqeoHqX9DFdCRP2bHywf7Ar1A3BuZHm88vpLBma/whU2VfEjPu/N
	0AVHGyqtCyidsedREaPVbnXHovlkR1DKs3rnrmanu3HagPXtCHNl99JbLfJz39FsFs/Mnq
	gYBYIP+QlW6OTeMQ6Ptwvq/2BcQ8xXbDDHUKO8JYjy6dMfwBHZRxnLHMpnCOzg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772454345;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+wSVvr2iY1iH7k3F0iPCSqLzNSvbTbj527LLEkOjHE=;
	b=/aSPglB8AXbqg7opAXpO0/jUG+0+n3k3JqmDL/ll0iG0SJf+fha6jNyO8a0dtGc75s+t06
	2+O3rwMHLHMlBaCw==
Date: Mon, 02 Mar 2026 13:25:25 +0100
Subject: [PATCH 01/15] MAINTAINERS: exec: Add more auxvec.h variants
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
Message-Id: <20260302-at-vector-size-arch-v1-1-a11f03ba2ca8@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772454343; l=935;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=BIlr7zgi66zD1ig2kTolm4aENXktO7wosOLcoYFwhtU=;
 b=0OWgCWYeIEIelNOmr0tEyiBwM5q6MuFfywVklpSmD0OLBHIs+3QQGBNYsmCJJqT5R/0oHxk2v
 IVHrY681uTqCvAuwCRegS2QuY8D2kC+ODREUKmQlpZd3Q/msGQ3Pvmv
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17520-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[kvack.org:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 3AD1D1D850D
X-Rspamd-Action: no action

There are quite a few auxvec.h headers. Mark all of them maintained
as part of 'EXEC & BINFMT API, ELF'.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 55af015174a5..7a2c952d72bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9573,13 +9573,16 @@ L:	linux-mm@kvack.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/execve
 F:	Documentation/userspace-api/ELF.rst
+F:	arch/*/include/uapi/asm/auxvec.h
 F:	fs/*binfmt_*.c
 F:	fs/Kconfig.binfmt
 F:	fs/exec.c
 F:	fs/tests/binfmt_*_kunit.c
 F:	fs/tests/exec_kunit.c
+F:	include/linux/auxvec.h
 F:	include/linux/binfmts.h
 F:	include/linux/elf.h
+F:	include/uapi/asm-generic/auxvec.h
 F:	include/uapi/linux/auxvec.h
 F:	include/uapi/linux/binfmts.h
 F:	include/uapi/linux/elf.h

-- 
2.53.0


