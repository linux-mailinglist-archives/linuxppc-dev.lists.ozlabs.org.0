Return-Path: <linuxppc-dev+bounces-17353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CP5OCndAoWnsrQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17353-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:57:59 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 410D91B3938
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:57:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMfKW3vL1z2xKh;
	Fri, 27 Feb 2026 17:57:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772175471;
	cv=none; b=NaEzDqUVU8IbCtZZoxxA+CL8XRk1FJlLeXZetbAIU1OO04fG//UVvIk1N2fkMCTCpVSKgcK+FhVaSuzBChO34rMC87r6N6JMA78H+ij50JGrkNmjRWBH/cs0Dsy8AdK5AjwtB1qGPCPtHGQL6t7fDPfT6XP9wWl1DOUI4AjlVEtYVUAyXCmJ/4EE7bYoMh3XvM1Fo9oU8dusm0eQhOE0dl2ZjYsLb+I6FCnq/s54d1p1r+ARd6huuEpMhYKqXT/1UxR9G99BwJauQhsU7Zn/4ngBV/ssP1I2nOqLvaM1vMT8iOZvtjF8s6JAJz1ovysdeOnc+yMuurMcDJ708Jc+zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772175471; c=relaxed/relaxed;
	bh=8H789/lOZNe2DBEbx0PYSnCH5b5GM/X09GORIs8o1ck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xts/Z+js8IlM9xZiXAMiO5j/KuLc9KxsW5A9iNMtDBx+R9FqUHYiRJSzQWpYt+LdiW52KZDW5kDjfuZpfeWJWS5aYPH19zQ1x+hxi1BbQi9dxcxFXav9SHvDZR0UQ7CGnEf5+lXyAcNLfFWoTuiL+DhKn6pfZGrnTRnITbTX1RgghqNmsB91hkxbORT9t8vJxMV+LGdnNdatQCDvy690O6D6TJNgHYy8RWtMo2bY/hPFW9115+tI5PyZAFO3N1KvaDmvVtjd8aPUsB2aUjZodyA9Lq2QQd1vBVZxASJx23qQY8HKTjCuy/aV/o0qoULxDSY8fjK0iViBhyY6NexjNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2hLvWsco; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0ZlHKqjk; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=2hLvWsco;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=0ZlHKqjk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMfKV69DSz3bmR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 17:57:50 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8H789/lOZNe2DBEbx0PYSnCH5b5GM/X09GORIs8o1ck=;
	b=2hLvWscoYx/z3rmISbCR6SGLUmJD2CT+HiHSwh6cvAdJsI5wWmOK/QnnlPjqVz+P6Nuzza
	iFx75X5AL60Yc+23Y8NZKPnh/b0C97LhmsiJk3rG+RydghLY+4hpeH4EE3N8YnPU7W49F/
	lIOBREnMSqv525bgZ+qt/GH0IfEFBiEr2StxhGhDEeIWD1+2UfIlRNRTbQMRjmVFLjw7I4
	NkIzsFutaS667exloFgT5TxE1KrR8O3eYx2sgXx8gcuTjm0PXnw3Z5fw453LlfEVwLykfh
	vUafW0hRJacZ2YbjAO5PDbAb59LdP9VTNg/o2sPUFztVpMDDMFXkPssAr203DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8H789/lOZNe2DBEbx0PYSnCH5b5GM/X09GORIs8o1ck=;
	b=0ZlHKqjkUN43o0euq4qsmyDpIBZTImGj+YQ1LVe044iCwfLcleWlGJAeXQLVHwZ5iYS1V/
	j/VxGLJ4K6BZ66DA==
Date: Fri, 27 Feb 2026 07:57:42 +0100
Subject: [PATCH 3/7] arm64: vdso32: Respect COMPAT_32BIT_TIME
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
Message-Id: <20260227-vdso-compat_32bit_time-v1-3-3f0286a7bac3@linutronix.de>
References: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
In-Reply-To: <20260227-vdso-compat_32bit_time-v1-0-3f0286a7bac3@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
 "H. Peter Anvin" <hpa@zytor.com>, Russell King <linux@armlinux.org.uk>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=2478;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=NxZxxvxiknln+O5AAR7jwJEyH6TfY0mjdJ+DVcxHm4E=;
 b=hFAV704d5xiuNwcSxD6X0a/NpOiptEPqEUD4Bjw9ctleEz0bheoLEoYZIZju4M43J/YIzd0vN
 7VgYl3TLaaMA34Cxd9JgQY2Q6uygWTcFTufs9+PMQY/Hi3CEl61gZih
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linutronix.de,none];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17353-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:tsbogend@alpha.franken.de,m:vincenzo.frascino@arm.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-mips@vger.kernel.org,m:arnd@arndb.de,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_TO(0.00)[kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,armlinux.org.uk,arm.com,linux.ibm.com,ellerman.id.au,gmail.com,alpha.franken.de];
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
X-Rspamd-Queue-Id: 410D91B3938
X-Rspamd-Action: no action

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality. This is the intended
effect of the kconfig option and also the fallback system calls would
also not be implemented.

Currently the kconfig option does not affect the gettimeofday() syscall,
so also keep that in the vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/arm64/kernel/vdso32/vdso.lds.S      |  4 +++-
 arch/arm64/kernel/vdso32/vgettimeofday.c | 14 ++++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/kernel/vdso32/vdso.lds.S b/arch/arm64/kernel/vdso32/vdso.lds.S
index c374fb0146f3..ea67f2dba431 100644
--- a/arch/arm64/kernel/vdso32/vdso.lds.S
+++ b/arch/arm64/kernel/vdso32/vdso.lds.S
@@ -82,9 +82,11 @@ VERSION
 {
 	LINUX_2.6 {
 	global:
+#ifdef CONFIG_COMPAT_32BIT_TIME
 		__vdso_clock_gettime;
-		__vdso_gettimeofday;
 		__vdso_clock_getres;
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+		__vdso_gettimeofday;
 		__vdso_clock_gettime64;
 		__vdso_clock_getres_time64;
 	local: *;
diff --git a/arch/arm64/kernel/vdso32/vgettimeofday.c b/arch/arm64/kernel/vdso32/vgettimeofday.c
index 0c6998ebe491..2e389c0a74df 100644
--- a/arch/arm64/kernel/vdso32/vgettimeofday.c
+++ b/arch/arm64/kernel/vdso32/vgettimeofday.c
@@ -8,17 +8,19 @@
 #define BUILD_VDSO32_64
 #include <vdso/gettime.h>
 
+#ifdef CONFIG_COMPAT_32BIT_TIME
 int __vdso_clock_gettime(clockid_t clock,
 			 struct old_timespec32 *ts)
 {
 	return __cvdso_clock_gettime32(clock, ts);
 }
 
-int __vdso_clock_gettime64(clockid_t clock,
-			   struct __kernel_timespec *ts)
+int __vdso_clock_getres(clockid_t clock_id,
+			struct old_timespec32 *res)
 {
-	return __cvdso_clock_gettime(clock, ts);
+	return __cvdso_clock_getres_time32(clock_id, res);
 }
+#endif /* CONFIG_COMPAT_32BIT_TIME */
 
 int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 			struct timezone *tz)
@@ -26,10 +28,10 @@ int __vdso_gettimeofday(struct __kernel_old_timeval *tv,
 	return __cvdso_gettimeofday(tv, tz);
 }
 
-int __vdso_clock_getres(clockid_t clock_id,
-			struct old_timespec32 *res)
+int __vdso_clock_gettime64(clockid_t clock,
+			   struct __kernel_timespec *ts)
 {
-	return __cvdso_clock_getres_time32(clock_id, res);
+	return __cvdso_clock_gettime(clock, ts);
 }
 
 int __vdso_clock_getres_time64(clockid_t clock_id, struct __kernel_timespec *res)

-- 
2.53.0


