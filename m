Return-Path: <linuxppc-dev+bounces-17359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aBQXNZlAoWnsrQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17359-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:58:33 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D541B3985
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:58:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMfKc34mPz3cG6;
	Fri, 27 Feb 2026 17:57:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772175476;
	cv=none; b=lwLpxI/hTGTtEFeW1OHVMuNBifEl1SJEguo9x3mv55VqjSR+eXBHPtQhI3M9/uKGEZcPC7qI2Tq5G+IC/Pk5iv1bFVuk66AMHLdI0rb80MIEv5ynXt3AzZoWJWP6ZAsd7fdzAMBCHOJ4tPIU938J6UNzaRTOjnCoYsdCZR5dAcEhhlphd1THfwQwQHw1sxkkRWGJ7/V11DcqCnkzfL3z71m4YYYo2vkGIxdX+bUF5O9ZsVajxdjDwefTK/FDalqU4aRBAMOzev24rNa1tjbF1j9N7hlYFWl86E6yeWyF+25IsPgoxNZ8MfBOHP3+mikuyOhCCRkGl+K1eRKvEc+1XA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772175476; c=relaxed/relaxed;
	bh=VxVvigSVkiA0ULS8sVET9zTxBqGaaQQOZYasgU53BKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n788/QCaQv8oUcXtj70D43h/qngx87OHFZm25d9pmPTMmBPxnYllJpH8cc4OQQt9bXcR3WpdBG3Ld+ChXQicXe5o4BRlodAty67S8HxnlWvXpeuKkMRPUIyZ0RsekCF2opp8WJAPeEr3YQ9k/l3m/8g7b6L+mdNxfWWeHKlg4sE563Qo4mU8KD8Wl2s+hBKydwJMzpTXyyv3Q0tpRDC5QQS6I2hq0VUoij5UHBEyrmRoYNxH0XF66wX0XhkYlo/zh8qg8acisgVT/JN1G+KVggr2jZfLcMgSqhYUX5X+nCZPF/zLrKVUmpVkc5URaTHaAOFYnyoRG7OjIrINmOXyGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WM9sl9D4; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=97LPGIJ+; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WM9sl9D4;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=97LPGIJ+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMfKb3Hvtz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 17:57:55 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772175470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxVvigSVkiA0ULS8sVET9zTxBqGaaQQOZYasgU53BKI=;
	b=WM9sl9D45G4EhBesYUN6X9bIzF4n7UWbfaWPLcczKr48l/eUKEn1PBHanrMc2xX9qALzHb
	oWc4oZFtQMPFhMkDNuPPX4obMLby73fs3uSz8CytLuQqxeAJwo/99arRzwuwDwb/qPXkup
	cplvt7DNdlg8oqDICn1/Re3b5SdHMhnDFLwzexrVMztfajKYA4pjFe0WgvFTMJA/lq/caI
	e++XWrqL6s+rRoW+XnrVAuqTObPMyz+nECA6+JwZcnuQTMJy8IQhbOSD7Z7XF4/AZH9d9K
	MJKlDPtA78I4V+o4QIX+mCO06mmdFyyurx8iWRuYyjxTgISGekzmX+cKedZZmw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772175470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxVvigSVkiA0ULS8sVET9zTxBqGaaQQOZYasgU53BKI=;
	b=97LPGIJ+SqRO5BCoiDwvuNzmWSD2Y2OZLcd5lia8oyY2WW1Hodb9e+KfCWyZzqdpsstEAH
	F6q5plVa/e4KTiCQ==
Date: Fri, 27 Feb 2026 07:57:46 +0100
Subject: [PATCH 7/7] vdso/gettimeofday: Verify COMPAT_32BIT_TIME
 interactions
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
Message-Id: <20260227-vdso-compat_32bit_time-v1-7-3f0286a7bac3@linutronix.de>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772175466; l=1692;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=cLipKDdg+OqB2lTcsId3exf9QOD1Z347Ahh8ryEqWfA=;
 b=E0vFBA+/8oxx+AiNSHHAbbL7OvIOo5Bn43vLxk0Bffm871HZFCm5mLjBLyPrKxdS2L+JikbEJ
 cnxOS5CW/3RA4cT6ZydiAjCUkTSMTDsFk6efPCwkKSdYgQIZ0a6ECwN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
	TAGGED_FROM(0.00)[bounces-17359-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 37D541B3985
X-Rspamd-Action: no action

If CONFIG_COMPAT_32BIT_TIME is disabled then the vDSO should not
provide any 32-bit time related functionality.

Add some build-time validations to make sure the architecture-specific
glue satisfies this requirement.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 lib/vdso/gettimeofday.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 4399e143d43a..0d134ac3dd84 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -6,6 +6,8 @@
 #include <vdso/datapage.h>
 #include <vdso/helpers.h>
 
+#include <linux/build_bug.h>
+
 /* Bring in default accessors */
 #include <vdso/vsyscall.h>
 
@@ -340,6 +342,8 @@ __cvdso_clock_gettime32_data(const struct vdso_time_data *vd, clockid_t clock,
 	struct __kernel_timespec ts;
 	bool ok;
 
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	ok = __cvdso_clock_gettime_common(vd, clock, &ts);
 
 	if (unlikely(!ok))
@@ -400,6 +404,8 @@ __cvdso_time_data(const struct vdso_time_data *vd, __kernel_old_time_t *time)
 	const struct vdso_clock *vc = vd->clock_data;
 	__kernel_old_time_t t;
 
+	BUILD_BUG_ON(sizeof(*time) != 8 && !IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	if (IS_ENABLED(CONFIG_TIME_NS) &&
 	    vc->clock_mode == VDSO_CLOCKMODE_TIMENS) {
 		vd = __arch_get_vdso_u_timens_data(vd);
@@ -491,6 +497,8 @@ __cvdso_clock_getres_time32_data(const struct vdso_time_data *vd, clockid_t cloc
 	struct __kernel_timespec ts;
 	bool ok;
 
+	BUILD_BUG_ON(!IS_ENABLED(CONFIG_COMPAT_32BIT_TIME));
+
 	ok = __cvdso_clock_getres_common(vd, clock, &ts);
 
 	if (unlikely(!ok))

-- 
2.53.0


