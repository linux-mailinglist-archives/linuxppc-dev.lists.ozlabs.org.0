Return-Path: <linuxppc-dev+bounces-17671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cK6hHBXkp2mrlAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17671-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:49:41 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F61FBDAF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 04 Mar 2026 08:49:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQlDX5WGjz3cCh;
	Wed, 04 Mar 2026 18:49:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772610556;
	cv=none; b=MQMV7ysI9gUtoCkK19ZIABeOFaLThFwlw6YFm/62uFnAO/A85vpMrdtqjBW/bC2AXD+G4+93K6L2ZC/7SGsABPLkQ8BnjRr4/PKS84zUZ5mvMLWZm3eLUpxr+JMeUoM3cGJQAzvPXZ9TVTTygAc2107VBc+qpN2C2LycimiG0WrrqQSKQsh5yM6sXCC9NenYwih9FqVMMeWKYJ6Pd0HtiVYgRQk1w41h0m0mkinmvBQrysOmk3y60d4o12tSvNvLNu/VUcU+srWsSbzN270Q98FQV8MjEHI389DLWLvJaD0pTvYyKzH9aU1ILydER+xVXQGcVkb/gOpDbEvxSfk0/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772610556; c=relaxed/relaxed;
	bh=3hLl3UJUe0JlUFYLj4nzIajK0L1mkr7Nq97mAHeU6ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CUiwQi/lF1CA2CLnxK6TfxcsSZr0PPyNJZBfg8Yj7FbZApk4+ZTv+6os6sCdpmVuAkVIBSC0fwl8tnwtjdL/HYIqYWVM+ESrj4zy+jgYw+y7R7iczmzw+kF1ACcZmdoIoLBaYmh9gjkRKaxL9ppAxVRhpwK/05hz3ihEZ3gx91AC5l6v7HuCSq4w3XERlEHsIdbxPD/texAThC+dCcc0PhAPlqPVMDMBKj6eYYvBTkVqnYeZdYdaKFK4kxMabR8qynFHoL1ZODRcTctL/bteCE819U2O9smoM9pfCG8xinfKTJ+OYwmWTzJT7OnTmS4Vt67Zp6X+oEpp1e6iAy6QAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L4y8/yF5; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Od0cLbs5; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=L4y8/yF5;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Od0cLbs5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQlDW5WCgz3c97
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 18:49:15 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772610553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3hLl3UJUe0JlUFYLj4nzIajK0L1mkr7Nq97mAHeU6ig=;
	b=L4y8/yF5PnoYaWH20duPNlNUuPV25olJfyTZyvoQzM2Pkrdt/kV7nwLSquubjcgOiGMBe/
	6HYQdEfBDaHsoloAnaw7WCB+s+OiSv8fmyz4PJ3xgg3Ehkis0nJ2UAlG8x8dCvCxHJiy0Y
	EF1M9cRfXPaUonbTkq5EJwU0WI3u2Jvp5B7LuE+ZYy935lepISZ1y4n/YPeNro8aNi+9sK
	RumpVlSaCC8eGmseya6Xt4aT6ZhS7GUueRvoH16kSFW5/Qp1M7j5l6mKMLOk5e2WLN2poi
	yrrz6PsyDoAvmLVLxEmJ7e8fSimE8NI4WgWWpzHCnvj5XpjI++AmGGHwtkpC0A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772610553;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3hLl3UJUe0JlUFYLj4nzIajK0L1mkr7Nq97mAHeU6ig=;
	b=Od0cLbs5ssx+x/GYzlkjDjWqNrc5QP65d9w7Sue9ZGGb/uWIVjksTQPxw4BV9+66XRUG+y
	FRojMnubw0bmXJCA==
Date: Wed, 04 Mar 2026 08:49:01 +0100
Subject: [PATCH v6 04/14] sparc64: vdso: Link with -z noexecstack
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
Message-Id: <20260304-vdso-sparc64-generic-2-v6-4-d8eb3b0e1410@linutronix.de>
References: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
In-Reply-To: <20260304-vdso-sparc64-generic-2-v6-0-d8eb3b0e1410@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>, Nick Alcock <nick.alcock@oracle.com>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Shuah Khan <shuah@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Theodore Ts'o <tytso@mit.edu>, 
 "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Shannon Nelson <sln@onemain.com>, 
 Thomas Gleixner <tglx@kernel.org>, Christophe Leroy <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 Arnd Bergmann <arnd@kernel.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772610551; l=1503;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=DbfqOziOrnW4MmYfhJif0AzTAR/TSeBQ63MMUE7Tk9k=;
 b=+70M4kqx+cEzvYJptNErQU/f7vOQKI/r3/zFKWQsNHKYEjPQcbVICMvMGCiqgVJfQ48XGAAC0
 Hr84p2bSVbQAfLf6ad70SVOi+sqV/4jj6fn2wY+ADyRA9XRnf0JNVER
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 914F61FBDAF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17671-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:arnd@arndb.de,m:davem@davemloft.net,m:andreas@gaisler.com,m:nick.alcock@oracle.com,m:jstultz@google.com,m:sboyd@kernel.org,m:glaubitz@physik.fu-berlin.de,m:shuah@kernel.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:tytso@mit.edu,m:Jason@zx2c4.com,m:linux@armlinux.org.uk,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:sln@onemain.com,m:tglx@kernel.org,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:linux-s390@vger.kernel.org,m:thomas.weissschuh@linutronix.de,m:arnd@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[39];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,arndb.de,davemloft.net,gaisler.com,oracle.com,google.com,physik.fu-berlin.de,mit.edu,zx2c4.com,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,onemain.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:dkim,linutronix.de:email,linutronix.de:mid,gaisler.com:email,lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

The vDSO stack does not need to be executable. Prevent the linker from
creating executable. For more background see commit ffcf9c5700e4 ("x86:
link vdso and boot with -z noexecstack --no-warn-rwx-segments").

Also prevent the following warning from the linker:
sparc64-linux-ld: warning: arch/sparc/vdso/vdso-note.o: missing .note.GNU-stack section implies executable stack
sparc64-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker

Suggested-by: Arnd Bergmann <arnd@kernel.org>
Link: https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
Fixes: 9a08862a5d2e ("vDSO for sparc")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Tested-by: Andreas Larsson <andreas@gaisler.com>
Reviewed-by: Andreas Larsson <andreas@gaisler.com>
Acked-by: Andreas Larsson <andreas@gaisler.com>
---
 arch/sparc/vdso/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 1a4e585c91d7..2e911ccc9db7 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -107,4 +107,4 @@ quiet_cmd_vdso = VDSO    $@
 		       $(VDSO_LDFLAGS) $(VDSO_LDFLAGS_$(filter %.lds,$(^F))) \
 		       -T $(filter %.lds,$^) $(filter %.o,$^)
 
-VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 -Bsymbolic --no-undefined
+VDSO_LDFLAGS = -shared --hash-style=both --build-id=sha1 -Bsymbolic --no-undefined -z noexecstack

-- 
2.53.0


