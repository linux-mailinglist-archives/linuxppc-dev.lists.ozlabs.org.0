Return-Path: <linuxppc-dev+bounces-17498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJGwJ19DpWld7QUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:59:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B561D444D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:59:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPWXh1bV8z3bW7;
	Mon, 02 Mar 2026 18:59:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772438339;
	cv=none; b=ISUl3rzPDphkFaioneV0LS60sCCj5KQXyONGITevTNeztKBudaY4AqE4ISHtXByw9dLHkCmzI/IWUBzwXtiZ0ZdzuHUsFBCXRPvD1uR1hvrC5M3MQA2Fr6xMQeXUs1vrsK+93F80n9Wn43+gjZLeKZf7dt5iLCYZ33Xj/NCTv+I//8mzJRGLD89G1HBPcvE6hdJstEQvZDoTk4xYIa3Je+oRegb4unV/aXzqUAI6HP/GnOYirAOE838elkeHr3hSN9x2Cjl5IgAt/38KZMUjflafU4D4CUKrwIAmNM4i/a26yoCyB9HlQTenk8iKCquYTYcMhcuV8uMZL4nUuxJi4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772438339; c=relaxed/relaxed;
	bh=hYzDmJLESQDE0WGZOLxDeZB0k8diDoIRXYV8eHmiP4I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=c2gkN8dpdXKJwUIzlC0tNL9rJzAwDM9Y7iJExIumFNcZ9vOOqFzCm7s37Tv1X5TjGInNAkVYOloNKMM1vxn0BQdDCj8g+wUpNBHLEMMCAizgGzP/HeC1bzkYvoGDGqxQ+UJ70fw6rxJtB8yssfkQ9Y22MVxLwOYI+aQXhjxrYc+EtrXHShMZOGW8vRNCPBC6nLeIVA3gftF0JACFohNuxvEXFKmNCA8hAb6wVw7s/CXX2hMU59Bw9+TjYonyx0MsUAGJzc42sRupbR7XI1QDrBoE7agDCeZHk+ofvV5CSoCx1NSQqqLrrSOgCT/otmOI9wWEfIO4XtWOpfr35A/0lw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uyjMEpDU; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fr/HGqXy; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=uyjMEpDU;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=fr/HGqXy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPWXg1d7kz3c1T
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 18:58:59 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772438331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hYzDmJLESQDE0WGZOLxDeZB0k8diDoIRXYV8eHmiP4I=;
	b=uyjMEpDU+Ms1HTL60KWTsXDcQuLD7b4yjxeGhF8tgVTjQ2kkhq75vsgmGnXpq+8cnTXa4D
	NlV740cDY97hzfhxaqf+46PapcgZHM3gq8CE8RIib4dlrrZ3dXD6rVbf3QDfoCPW+Wl9CV
	fIAojNCIpmwsadApQeVOp0XlGmzA+oCh36feTuw2rjfy8hvAU0NO5gPPZA5ZQz4FnwJ/6p
	krCJW8vtMkGUvKjS2hJDtWYE5zCYVvUYmirfs+VbjdnrpMiGWrnjkAGBsJkUvnf8rIMIAf
	/4rnpF5/Ap+e6KKVqMrxmtke0Oq/DcTrDVeTWQGALaRy8CLcZnadb4lYmSPpPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772438331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hYzDmJLESQDE0WGZOLxDeZB0k8diDoIRXYV8eHmiP4I=;
	b=fr/HGqXyWU3Kci3r+yPCt6+p6Pqf+02Ssd1Pb1zEsVJbbH9+n0SKw2uwMCxMhExtDcG5VA
	3gqEiOxkN1sj6jDg==
Date: Mon, 02 Mar 2026 08:58:38 +0100
Subject: [PATCH v2 2/5] sparc64: vdso: Use 32-bit CHECKFLAGS for compat
 vDSO
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
Message-Id: <20260302-vdso-compat-checkflags-v2-2-78e55baa58ba@linutronix.de>
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
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 kernel test robot <lkp@intel.com>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772438327; l=1447;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=+ZNTvsS03cf/7hGvDJacLfCnOSDvf3VWGwKmuX5AIIY=;
 b=kspaAO2Nd+J47AMHG0hbuL+BuqH4VXDaOrQx3Oh8u8q9Ts994YT8aym1Wgdi+yqmVAf1E3CFM
 xPP9byI6x8wC16gAJRbrSBAnEgOpEOXAIgsN+ha/IFSD+jCl89niAri
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
	TAGGED_FROM(0.00)[bounces-17498-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:davem@davemloft.net,m:andreas@gaisler.com,m:luto@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:arnd@arndb.de,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:sparclinux@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-s390@vger.kernel.org,m:david.laight.linux@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:thomas.weissschuh@linutronix.de,m:lkp@intel.com,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[davemloft.net,gaisler.com,kernel.org,redhat.com,alien8.de,linux.intel.com,zytor.com,arndb.de,linux.ibm.com,ellerman.id.au,gmail.com];
	FORGED_SENDER(0.00)[thomas.weissschuh@linutronix.de,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[27];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.ozlabs.org,linutronix.de,intel.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linutronix.de:mid,linutronix.de:dkim,linutronix.de:email,intel.com:email,arndb.de:email]
X-Rspamd-Queue-Id: A6B561D444D
X-Rspamd-Action: no action

When building the compat vDSO the CHECKFLAGS from the 64-bit kernel
are used. These are combined with the 32-bit CFLAGS. This confuses
sparse, producing false-positive warnings or potentially missing
real issues.

Manually override the CHECKFLAGS for the compat vDSO with the correct
32-bit configuration.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/lkml/202511030021.9v1mIgts-lkp@intel.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
The actual false-positive is only reported when SPARC is converted over
to the generic vDSO library. However the issue is already present.
To avoid dependencies between different patch queues, I have this patch
in this one.
---
 arch/sparc/vdso/Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/sparc/vdso/Makefile b/arch/sparc/vdso/Makefile
index 13f1d7be00f1..7d6e3097ebfc 100644
--- a/arch/sparc/vdso/Makefile
+++ b/arch/sparc/vdso/Makefile
@@ -90,6 +90,9 @@ KBUILD_CFLAGS_32 += -DDISABLE_BRANCH_PROFILING
 KBUILD_CFLAGS_32 += -mv8plus
 $(obj)/vdso32.so.dbg: KBUILD_CFLAGS = $(KBUILD_CFLAGS_32)
 
+CHECKFLAGS_32 := $(filter-out -m64 -D__sparc_v9__ -D__arch64__, $(CHECKFLAGS)) -m32
+$(obj)/vdso32.so.dbg: CHECKFLAGS = $(CHECKFLAGS_32)
+
 $(obj)/vdso32.so.dbg: FORCE \
 			$(obj)/vdso32/vdso32.lds \
 			$(obj)/vdso32/vclock_gettime.o \

-- 
2.53.0


