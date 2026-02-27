Return-Path: <linuxppc-dev+bounces-17341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eByjIpM9oWnsrQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17341-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:45:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB28F1B3691
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 07:45:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMf2Y5spjz3cGL;
	Fri, 27 Feb 2026 17:44:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772174693;
	cv=none; b=lf/X/unAImuP2ILBndcgpa8lDtOPMPNxxE4V5QMVpcmNfTrq2Fp6nrN+++O2txRd4QIOcCm5lGxLOY4R5u8jGLtGC25KOeeGP0+LTCs3L0uUAODlDNQ+JaSopaS87ZKKfhROtLGYzFOtdHbRhvraqQ2l7bo3suXw7iriJv1da9QajhHN3KrHj/DDvX/XcWt1vIP7t5DfYWdWDN0HQKqelGqfNsUD+spxdO74UQAF9Rv5GsU+ncsxbLG4XaWLd7hCcdVlGzK4C4zXJfknxQVxjwgIkSYDKeAV0OybYmM77InVWBbrCjH91P92u+QC99c2HUhT0j2RLF2FYWA+9mVTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772174693; c=relaxed/relaxed;
	bh=Ns/5VchQVCZoKSPGG69oVFKcL4Adw7WpxEQJ3c/B2CA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RGI1pJUmoHhxY5PJFAS7OpGGRuKXdGP7KntRp1Oi0FGU+mcdINAbqE0L1W1x9aKmPT8Mmz79kgC5YKxiCoRsTnXM6qTSpysb76itwu2gUR+doubktWC05Ub2XWeWbMFuoWxJkJGR/XAUhZIMMetqSxZai9clYRa/Pn0J5NhiRpxnVGrp24hdkrynItkeacoN14xYv1TVt7D7g/qW+/kOZns6EYZCRLiikft3lNjQ0U87MJPoUApbdx8RjMf20UREeSTpizStU+rlbkaZvXEMgn3QCv+7nzT64Rki8LcpxVELCeUGvhKbcq52hBjdlETsPntTxTOQ3CqFWbnl95Qkpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JCmZPwYW; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q34qgHOe; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=JCmZPwYW;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Q34qgHOe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMf2Y1ywPz3cFm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 17:44:53 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772174690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns/5VchQVCZoKSPGG69oVFKcL4Adw7WpxEQJ3c/B2CA=;
	b=JCmZPwYWDYToRyEQ9DR8fipEF/ULgK3B4oVRwWHLTcekFqTViMl2N/xXKz75LI5l1qr47j
	xPn9Rsn34YLZ/KdRp9IL3X+UgseOAA5Gw6UEoQYdfwz22lZl80Tfblc0sChWc6GBpsZI/X
	Ivbxyk0MeuNL2Juh5AUY+wlHXIUtLd1baIIerKeCUAi1yXNMPRPS+IZHAI98jUrgizIzOK
	8qin9uAxtsCYs1UsSNa2TBL3GgFusppXtMq5HGGPhOSMssvIQimvH+lscXk9wHq0CMgdSQ
	WTXWmZ1XohrP5u+BH2H+6HxknCbr+MJ/OBBBGUtbq9JrnV/R54GXj7ZL1/ouHg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772174690;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Ns/5VchQVCZoKSPGG69oVFKcL4Adw7WpxEQJ3c/B2CA=;
	b=Q34qgHOeSxFo3Ifozm8ShqwF2m6jrAUnaadKtDXG3hehTabXwbDdCf5WWlUypCd06X0U2E
	lxTt7rcOT8SLyJAg==
Date: Fri, 27 Feb 2026 07:44:40 +0100
Subject: [PATCH v2 14/15] random: vDSO: trim vDSO includes
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
Message-Id: <20260227-vdso-header-cleanups-v2-14-35d60acf7410@linutronix.de>
References: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
In-Reply-To: <20260227-vdso-header-cleanups-v2-0-35d60acf7410@linutronix.de>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Theodore Ts'o <tytso@mit.edu>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, 
 linux-mips@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772174681; l=674;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=kYG/ybqKszLJuacxc6F+IgigSyzq9bc/Tf+cZR6TFzc=;
 b=hRsrMQVPxwKxWQngl7rDhlf+sNF1zn7pg7IIBz8oApCVJ13R3dYi+fdcB1s31dvzbU6Sx8f15
 IpdV9+rftWEARi2FlzZ45wcpJn7tR73aFc0r+30IO7QgRivY2an1P9j
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
	TAGGED_FROM(0.00)[bounces-17341-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:will@kernel.org,m:linux@armlinux.org.uk,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:tsbogend@alpha.franken.de,m:luto@kernel.org,m:tglx@kernel.org,m:vincenzo.frascino@arm.com,m:tytso@mit.edu,m:Jason@zx2c4.com,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:linux-mips@vger.kernel.org,m:thomas.weissschuh@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FREEMAIL_TO(0.00)[arm.com,kernel.org,armlinux.org.uk,linux.ibm.com,ellerman.id.au,gmail.com,xen0n.name,alpha.franken.de,mit.edu,zx2c4.com];
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
X-Rspamd-Queue-Id: EB28F1B3691
X-Rspamd-Action: no action

These includes are not used, remove them.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 drivers/char/random.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/char/random.c b/drivers/char/random.c
index dcd002e1b890..9738673018f3 100644
--- a/drivers/char/random.c
+++ b/drivers/char/random.c
@@ -57,9 +57,7 @@
 #include <crypto/chacha.h>
 #include <crypto/blake2s.h>
 #ifdef CONFIG_VDSO_GETRANDOM
-#include <vdso/getrandom.h>
 #include <vdso/datapage.h>
-#include <vdso/vsyscall.h>
 #endif
 #include <asm/archrandom.h>
 #include <asm/processor.h>

-- 
2.53.0


