Return-Path: <linuxppc-dev+bounces-17536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEXvOF6apWnxEgYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:10:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 014C01DA6C7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:10:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPgnR0s69z3bW7;
	Tue, 03 Mar 2026 01:10:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0c:5a00:149::25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772460635;
	cv=none; b=TqYFmd9zOzyqQzQwJT0U95GnfMpNSb4dPodePXT9bw8bXuUdL6a3Oyef6Xk//GI3sx/Lxp5igaBZ6lS25xPFKmkPVaFAxJFxCv9fselkhNhTCK8PCORG34QgTS2qkyr7BDwtzYN4MSVHHqpWahHobnNKel8+TC56S1i9EQw9pIx+ft6ayR4QVrfVqcrmW91+K3nIp2MYTQuOj0ehf5YvYkCguRCjqFJXVGHmBNiVd7A+TP9ABi9LZwjrVICovCUGG8+h3q5m/0zyLjt5rrqAV3hKlzKUTgoU/Vq12xrGZzpFXVyhOVfgvm8nwuOANycrwcM3Lao3GpOB3AX5lcL4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772460635; c=relaxed/relaxed;
	bh=7cjIEqDAe6MTPa2yql8v8L5e7mjA+roV54bcD0Te3Y4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=CNf9aPZj4pndN/C9G0OJEczf3n9PRa/AtpnmBBManGolvrO3mKdA0QcXRZDArModetGVWiT7pwgDrEiRsoSl964G0f0LZynbTKJBQ0FsgRbdCft4sbxozC7fLas5aaVs9uJIE/xcZGaUmeAhIQCGRl5f9KFu0eiwj74FRzHO793MqZq+BN6UyOzjbP9R4SUtZDjJFpsy6FqfnLzPPAaJ+0kFUB4QdfrBYe+gXs+IPL3rpCZka8Mp5VVzWMJhGuBsN9EK3JvoiBVt8qsQyq63MImKK6DSm5VD+rkQcUNMAKt7avAxxg0b38oEYSFr+vvIp5wtPEAg+J9F7r/pjVznZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector2 header.b=pfYMBjDr; dkim-atps=neutral; spf=pass (client-ip=2a0c:5a00:149::25; helo=mailtransmit04.runbox.com; envelope-from=david.laight.linux_spam@runbox.com; receiver=lists.ozlabs.org) smtp.mailfrom=runbox.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector2 header.b=pfYMBjDr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=runbox.com (client-ip=2a0c:5a00:149::25; helo=mailtransmit04.runbox.com; envelope-from=david.laight.linux_spam@runbox.com; receiver=lists.ozlabs.org)
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [IPv6:2a0c:5a00:149::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPgnQ2nK0z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 01:10:34 +1100 (AEDT)
Received: from mailtransmit02.runbox ([10.9.9.162] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jw-003ZE4-Au; Mon, 02 Mar 2026 14:28:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:To:From;
	bh=7cjIEqDAe6MTPa2yql8v8L5e7mjA+roV54bcD0Te3Y4=; b=pfYMBjDrxtDGIuseYyHfRKhdlY
	wxGF1P6KMNx6ObRuGN6ZC4wsAsw2hRQ/moIf5DlPtJ4OdcFDVbbZfYlXOaHjFV7UCzwT+RFpEzmxH
	qWXXDA4ONYMAsNi6ePJIKCLTLb8MT74QJNuqJ6sdh6Tq/4chxS0eBiQlHuCMuynNI3HaM4H+mIWD+
	MfMF3aDGj96f3wG2XdkXTZREX71lpkYTiXzClo5Rgz07oqNqD1x1j5Sva9T4TMi13zMpJPrbafMuY
	y2tpwibHn24xe00sD61gejFnTEEHP9CDzwhRxR2Z0zEadqZouQs+4eZ2DS+v9eN8M5kbcQczC3zdl
	N7bMTDQg==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit02.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jv-0003tI-NG; Mon, 02 Mar 2026 14:28:23 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vx3Ji-008UTR-OY; Mon, 02 Mar 2026 14:28:10 +0100
From: david.laight.linux@gmail.com
To: Alexander Viro <viro@zeniv.linux.org.uk>,
	Andre Almeida <andrealmeid@igalia.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Darren Hart <dvhart@infradead.org>,
	David Laight <david.laight.linux@gmail.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Heiko Carstens <hca@linux.ibm.com>,
	Jan Kara <jack@suse.cz>,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-fsdevel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	LKML <linux-kernel@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Russell King <linux@armlinux.org.uk>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	x86@kernel.org,
	Kees Cook <kees@kernel.org>,
	akpm@linux-foundation.org
Subject: [PATCH v2 3/5] uaccess.h: Use with() and and_with() in __scoped_user_access()
Date: Mon,  2 Mar 2026 13:27:53 +0000
Message-Id: <20260302132755.1475451-4-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260302132755.1475451-1-david.laight.linux@gmail.com>
References: <20260302132755.1475451-1-david.laight.linux@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FORGED_GMAIL_RCVD,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	NML_ADSP_CUSTOM_MED,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[runbox.com:s=selector2];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:andrealmeid@igalia.com,m:andrew.cooper3@citrix.com,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:christophe.leroy@csgroup.eu,m:chleroy@kernel.org,m:dvhart@infradead.org,m:david.laight.linux@gmail.com,m:dave@stgolabs.net,m:hca@linux.ibm.com,m:jack@suse.cz,m:Julia.Lawall@inria.fr,m:torvalds@linux-foundation.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:mathieu.desnoyers@efficios.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nicolas.palix@imag.fr,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peterz@infradead.org,m:linux@armlinux.org.uk,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:x86@kernel.org,m:kees@kernel.org,m:akpm@linux-foundation.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,igalia.com,citrix.com,linux.ibm.com,kernel.org,csgroup.eu,infradead.org,gmail.com,stgolabs.net,suse.cz,inria.fr,linux-foundation.org,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,efficios.com,ellerman.id.au,imag.fr,dabbelt.com,armlinux.org.uk,linutronix.de];
	TAGGED_FROM(0.00)[bounces-17536-lists,linuxppc-dev=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[runbox.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[runbox.com:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 014C01DA6C7
X-Rspamd-Action: no action

From: David Laight <david.laight.linux@gmail.com>

Wrappers for autoterminating nested for() loops have been added to
compiler.h, use them to hide the gory details.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/uaccess.h | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 809e4f7dfdbd..64bc2492eb99 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -736,13 +736,10 @@ static __always_inline void __scoped_user_rw_access_end(const void *p)
  *
  * Don't use directly. Use scoped_masked_user_$MODE_access() instead.
  */
-#define __scoped_user_access(mode, uptr, size, elbl)				\
-for (bool done = false; !done; done = true)					\
-	for (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl);	\
-	     !done; done = true)						\
-		/* Force modified pointer usage within the scope */		\
-		for (const auto uptr  __cleanup(__scoped_user_##mode##_access_end) = \
-		     _tmpptr; !done; done = true)
+#define __scoped_user_access(mode, uptr, size, elbl)					\
+	with (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl))	\
+		/* Force modified pointer usage within the scope */			\
+		and_with (const auto uptr __cleanup(__scoped_user_##mode##_access_end) = _tmpptr)
 
 /**
  * scoped_user_read_access_size - Start a scoped user read access with given size
-- 
2.39.5


