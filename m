Return-Path: <linuxppc-dev+bounces-17496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OMAEA05DpWkg7AUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:59:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1C21D43F7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 08:59:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPWXf6rmvz3bt7;
	Mon, 02 Mar 2026 18:58:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772438338;
	cv=none; b=nInG1V94Q+XiX9qm9LXVCJ4wh9hB8+mJVNKEknhkcxzRyaWaaXcastpR6gwfqhpKMKX77l46bTrMjLDTBSI87XdpVd5llP0PF0SMVkZZVo/dofu+go4ZGaRoXc1OQ/EY1boxfzQLHvE2x1Xge35tZzB12QmOUe2RGmhW8Q0y9RR5Wn4BrFqA8ev34DBkTIAzZGc0N/EZfptbdCYx8twXsJpbnJP12GG+SGVx0lJJGkEIue3zUouyHA4DZdeKppcoWoVFv76/o32Oi/Te43lJZkWkaMpEs9u2r59xc2JuRtkMJi3u1FpJxg+SKHI+SSJ7D9ARbFO2qFGBBb+yCu/WHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772438338; c=relaxed/relaxed;
	bh=jDCrcHt8O4dhTht762Lzzs+IBKZYqdQLeGb4eSwA3mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iFAf+t0aKESAyhh5B9txmimcE2uKez8kWieQaslX1WD95FhvV82EWFQJLHhec+MLxDZIqeJlFH1NUupQR+dBE0QBrNdDZeuawrgLiq2JZEPCfZv0JL6+FlPAwlllDD5k/LgWkQ+30L5VBp5jWeIV4KdS4bF6+ylN3654ohXzq25cOY7dN+tt4Pr23v6zuXZzAkqzdSbVIJOeRn5LD2vDYWmiitHQLIczirabWOPno+kkhqeFw8XiZImjhEblQRIkT3lOa23p7pbSqye6nAPQfIS3CqXm0lJijVrRoVKeae0YmRtVF1vEx7Eqh5bjIs6U9egCS5V8PsWy3dbcalctsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bxHB4cE7; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=efvxVqum; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bxHB4cE7;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=efvxVqum;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPWXc53Z4z3bkL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 18:58:56 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1772438330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDCrcHt8O4dhTht762Lzzs+IBKZYqdQLeGb4eSwA3mw=;
	b=bxHB4cE7MnNYGC3LGFJQZbAqR1AX7Fj2u4K/iJg3DmTgTPv6SMfC+jLrKfrfo48cNHCdcS
	kHgm1LXOX3Ulk7YNyobEBm6LA3UE+JS/ajFt59GmEeArXLSu9TZbpwBY0V4leeH+yaR59D
	tZJTJ+Qk1vW2vXSbeMLxeaOej/OSpsZaSsUEoHAb0/9/wyJobZOuZeR+HK69qB0I/SQ2i0
	gU5Z769UJXIQa4xv9omtW2LTJtS2OQAUvJ10ZjYFfCCIgEfO9N3H2fTgFPSsZZnDq9OG47
	Jf/T4JWoaDBRD5aq5CZMdxKd01JAbK9NjJhb68w+D2/ObDrUR52dcQH+0oGmbw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1772438330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jDCrcHt8O4dhTht762Lzzs+IBKZYqdQLeGb4eSwA3mw=;
	b=efvxVqumAur2T8LG28u5Yn0U0H8bRQKwT+Jh2uOlOmK4nUzUOsltLyESAuNhzX0970V5P6
	r2bYGqMgv6Z8JFCw==
Date: Mon, 02 Mar 2026 08:58:37 +0100
Subject: [PATCH v2 1/5] x86/vdso: Use 32-bit CHECKFLAGS for compat vDSO
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
Message-Id: <20260302-vdso-compat-checkflags-v2-1-78e55baa58ba@linutronix.de>
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
 Sun Jian <sun.jian.kdev@gmail.com>, kernel test robot <lkp@intel.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772438327; l=1516;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=5ZtWeLoIG1DUjNycBMtCEpprUXPJS/yxYX1kXl4i0fQ=;
 b=+NVtnS6EyY2Yoq5xKj8da3D2ktgjWUTfvnaXTMMqFJhyaa85rPvEJd4KytnY3lc96J0g8mRrj
 KMacJ1WhtFWAPq9kCvYgoREx0uRXMt7AQbPWjwUKsysaifcS2+RVPku
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[linutronix.de:s=2020,linutronix.de:s=2020e];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17496-lists,linuxppc-dev=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,linutronix.de:mid,linutronix.de:dkim,linutronix.de:email]
X-Rspamd-Queue-Id: 2A1C21D43F7
X-Rspamd-Action: no action

When building the compat vDSO the CHECKFLAGS from the 64-bit kernel
are used. These are combined with the 32-bit CFLAGS. This confuses
sparse, producing false-positive warnings or potentially missing
real issues.

Manually override the CHECKFLAGS for the compat vDSO with the correct
32-bit configuration.

Reported-by: Sun Jian <sun.jian.kdev@gmail.com>
Closes: https://lore.kernel.org/lkml/20260114084529.1676356-1-sun.jian.kdev@gmail.com/
Closes: https://lore.kernel.org/lkml/20260117215542.342638347@kernel.org/
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202602111941.PIhubgrb-lkp@intel.com/
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Acked-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/x86/entry/vdso/vdso32/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/x86/entry/vdso/vdso32/Makefile b/arch/x86/entry/vdso/vdso32/Makefile
index add6afb484ba..ded4fc6a48cd 100644
--- a/arch/x86/entry/vdso/vdso32/Makefile
+++ b/arch/x86/entry/vdso/vdso32/Makefile
@@ -15,6 +15,10 @@ flags-y			:= -DBUILD_VDSO32 -m32 -mregparm=0
 flags-$(CONFIG_X86_64)	+= -include $(src)/fake_32bit_build.h
 flags-remove-y          := -m64
 
+# Checker flags
+CHECKFLAGS := $(subst -m64,-m32,$(CHECKFLAGS))
+CHECKFLAGS := $(subst -D__x86_64__,-D__i386__,$(CHECKFLAGS))
+
 # The location of this include matters!
 include $(src)/../common/Makefile.include
 

-- 
2.53.0


