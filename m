Return-Path: <linuxppc-dev+bounces-17352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKYJOnJAoWnsrQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17352-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:57:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 159D61B391A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:57:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMfKV2RgYz2xMt;
	Fri, 27 Feb 2026 17:57:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772175470;
	cv=none; b=gH+dPp4JxIZr/IwfLgbxgFPKlQ5XCJOwlA/DAk3hjt6eTk0JLPYL587T8t7ZoNTafmFYDSIpN7mQStIm9KkIyIrLU9zQ6Y8yd/bUCxIfE5Kq1Mz7k5MTkOhQtj8Sp2iu/tD4qXWgMkC3KrqsaFJmzxQBn5TNXmeMSNvRQa2gAuH6FSlPe8k4h082lrb9cW1GBZOaZCdR5OUFO8XzHA+01bWT2wo0kSjXDX+wNGmQ9QwBGncLB/C5AfwV5QdI8WeRobyyVeFsuToNp6i9/Fi3Q5a4Rb/A/ZarQwoanoEp3oVxGfkh/rZ6VucugSlkt+KSNha4ICLQ2DUY4hbV75/RuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772175470; c=relaxed/relaxed;
	bh=uI4rN+o786Yb4YBX5SDM0UB57RWA9Fv/jfoGfsX/yrs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NkEB9JV9lKA1gY1J9i3fZ4Hvki3Rrh3fDAuLydNHxRcNnz3nuGnGOwHqTa5XYhpSfFDLvNsiCSJMkfMPPuaVeJxHaySEQEC0tnTpn9qZlCazEf59S270ZtQ2GvOvFZrTnXpDCf3V7mcIF+RctzgkujF8vc53TT8142eKXguwi8wfc7OYT1Fwh5kpCqxKwhCkAlWLc6EWegOSyl+HmVQcabNg2mH7S/o6CULkwgdWCWqNGrRug4knOFrGBB+qVq58fmK6wLL3gBwDDIorVCGTrondmP5J3Q4DaoUNTTX6XgFizaPbIeqC+1xzjcY4r0C4FcYsIGg4jwKK2Xnhou6w5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=s5/+gkjV; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qjio/8IU; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=s5/+gkjV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=qjio/8IU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMfKT3Wh6z2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 17:57:49 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uI4rN+o786Yb4YBX5SDM0UB57RWA9Fv/jfoGfsX/yrs=;
	b=s5/+gkjVizzktnhsVUSZyYkMCeXZFhoXA9JLcMQMMjYaTItjo0gt9yZShXndYz2zS1c5yb
	st1utoLXbotlVRmlUEhbuLn7cB0pzeQ10ufkIqD/iCzF/ueHheLj5bw3FwgG8aQPoMhU+q
	lnCZwLhp/qNfzvn3N47xpeLiaFDxXWzbDrPF3dbSvu5oy6r5K0040dMvkNeCgf9iAkFOGF
	vX0iZ7X2124HP75OZqNN8CYV/lO6V0yqRyeXINslN8+3ty+ztvTWniFvhiP+lchzamqyu1
	T3hEfzbddrTJaNbapUeZ3d71U5RGICjAMQVg8t1ldUGkkPoAuBzxKtkgFg2m7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uI4rN+o786Yb4YBX5SDM0UB57RWA9Fv/jfoGfsX/yrs=;
	b=qjio/8IUUpLhARF1kZco1eI0ng8AuORSKJbIuzqR6n7s6WQlR6mg6syc/dKCYqM7g1+A+w
	tx4tz/96oWShraDQ==
Date: Fri, 27 Feb 2026 07:57:40 +0100
Subject: [PATCH 1/7] x86/vdso: Respect COMPAT_32BIT_TIME
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
Message-Id: <20260227-vdso-compat_32bit_time-v1-1-3f0286a7bac3@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=3434;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=FgFyWd9y9Cpt46MJBsKjGyDO3WVy4aSq91RM5Jo19RQ=;
 b=TaGXpZc+bPtJpYJ/U1xX+5+0VES/56W0ad9REZpJpoQOimP7CjrTUkTvuxgkdnd6mO41YjydS
 Xp46ggLdry/Bzyoe8v5oTynBdH8ekzwdnYcBGvPPKqeNNYGxWpzSxJn
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17352-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 159D61B391A
X-Rspamd-Action: no action

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality. This is the intended
effect of the kconfig option and also the fallback system calls would
also not be implemented.

Currently the kconfig option does not affect the gettimeofday() syscall,
so also keep that in the vDSO.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/x86/entry/vdso/common/vclock_gettime.c | 20 ++++++++++++--------
 arch/x86/entry/vdso/vdso32/vdso32.lds.S     |  4 +++-
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/arch/x86/entry/vdso/common/vclock_gettime.c b/arch/x86/entry/vdso/common/vclock_gettime.c
index 027b7e88d753..664d91437f45 100644
--- a/arch/x86/entry/vdso/common/vclock_gettime.c
+++ b/arch/x86/entry/vdso/common/vclock_gettime.c
@@ -23,12 +23,14 @@ int __vdso_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz)
 int gettimeofday(struct __kernel_old_timeval *, struct timezone *)
 	__attribute__((weak, alias("__vdso_gettimeofday")));
 
+#if defined(__x86_64__) || defined(CONFIG_COMPAT_32BIT_TIME)
 __kernel_old_time_t __vdso_time(__kernel_old_time_t *t)
 {
 	return __cvdso_time(t);
 }
 
 __kernel_old_time_t time(__kernel_old_time_t *t)	__attribute__((weak, alias("__vdso_time")));
+#endif /* CONFIG_COMPAT_32BIT_TIME */
 
 
 #if defined(CONFIG_X86_64) && !defined(BUILD_VDSO32_64)
@@ -51,6 +53,7 @@ int clock_getres(clockid_t, struct __kernel_timespec *)
 
 #else
 /* i386 only */
+#ifdef CONFIG_COMPAT_32BIT_TIME
 int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 {
 	return __cvdso_clock_gettime32(clock, ts);
@@ -59,14 +62,6 @@ int __vdso_clock_gettime(clockid_t clock, struct old_timespec32 *ts)
 int clock_gettime(clockid_t, struct old_timespec32 *)
 	__attribute__((weak, alias("__vdso_clock_gettime")));
 
-int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
-{
-	return __cvdso_clock_gettime(clock, ts);
-}
-
-int clock_gettime64(clockid_t, struct __kernel_timespec *)
-	__attribute__((weak, alias("__vdso_clock_gettime64")));
-
 int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res)
 {
 	return __cvdso_clock_getres_time32(clock, res);
@@ -74,6 +69,15 @@ int __vdso_clock_getres(clockid_t clock, struct old_timespec32 *res)
 
 int clock_getres(clockid_t, struct old_timespec32 *)
 	__attribute__((weak, alias("__vdso_clock_getres")));
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+
+int __vdso_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts)
+{
+	return __cvdso_clock_gettime(clock, ts);
+}
+
+int clock_gettime64(clockid_t, struct __kernel_timespec *)
+	__attribute__((weak, alias("__vdso_clock_gettime64")));
 
 int __vdso_clock_getres_time64(clockid_t clock, struct __kernel_timespec *ts)
 {
diff --git a/arch/x86/entry/vdso/vdso32/vdso32.lds.S b/arch/x86/entry/vdso/vdso32/vdso32.lds.S
index 55554f80d930..012bc3a62aca 100644
--- a/arch/x86/entry/vdso/vdso32/vdso32.lds.S
+++ b/arch/x86/entry/vdso/vdso32/vdso32.lds.S
@@ -23,10 +23,12 @@ VERSION
 {
 	LINUX_2.6 {
 	global:
+#ifdef CONFIG_COMPAT_32BIT_TIME
 		__vdso_clock_gettime;
-		__vdso_gettimeofday;
 		__vdso_time;
 		__vdso_clock_getres;
+#endif /* CONFIG_COMPAT_32BIT_TIME */
+		__vdso_gettimeofday;
 		__vdso_clock_gettime64;
 		__vdso_clock_getres_time64;
 		__vdso_getcpu;

-- 
2.53.0


