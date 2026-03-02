Return-Path: <linuxppc-dev+bounces-17535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGk0OJOZpWnxEgYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:07:15 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 05BE41DA621
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:07:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPgjX3dCjz3bW7;
	Tue, 03 Mar 2026 01:07:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0c:5a00:149::25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772460432;
	cv=none; b=mr5RgCANwuayVUIPru1EeMXsO/bBAO8uoFuIW0gquVCrjK23MAxqw/NGt+ffRGEXZLq9Tk8I8rTyRLQaotPWgnWeq2QbiLR1Cd0sNoGTFhrCnlEhkZN/+ubVWYD69VupNR4y8QyeWamam6AOwGjs9v0ab8ZEMrcQ25t9lSFHIGlI8waIJbNzoku2pLuLQVaoou1ggDw3JMeo8eyaudNnC73VHcO4zmt1mulAhEE8nsl3DtBXB4qdw5J1mVW7sMSMVZ2aJhUaIXoY3qW602VJFpnUCLKp2PzR2VmBm75m1A4bc9d2nRSrcWuDOHy1yHVS3gZrZRC8S3bR3yU653QLrA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772460432; c=relaxed/relaxed;
	bh=o2ClYLRupqDrO68wbhPYoX/KO8vhOPlwFWoOd/NbY3w=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kkzEsVH0WWPEQZPVJBjFtJPaCXTCboepeFrskdfklBTjphWmBsJtDE9AG2q2Sr6fCiL/rphnnV0RMHZ/BM0SGkT0/AnNRUiLtvYfa0po6FjPkL6/9wzVVZ6B3W4YCF2AkuRrMxGc7IRxBL5971pqZQIJCr2xg7ZxNesVCeIxjCTvoSRpN8p1q7MgYDeCsFILM8HV8bVRGOYYa3JE2KyWUbwWfp+AlDjRhrrTLfximV/aXreBFiJ0wzgMtvz0xzlGa+iQxqaCje0Zk8aOuvOZzPTEF/QEEkfPNZZCfq8mlCPDGapHVmPnTupNHdB8ZrUH7bXOIaiW5dNgNb48ZKJ2lQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector2 header.b=RaIJo34Y; dkim-atps=neutral; spf=pass (client-ip=2a0c:5a00:149::25; helo=mailtransmit04.runbox.com; envelope-from=david.laight.linux_spam@runbox.com; receiver=lists.ozlabs.org) smtp.mailfrom=runbox.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector2 header.b=RaIJo34Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=runbox.com (client-ip=2a0c:5a00:149::25; helo=mailtransmit04.runbox.com; envelope-from=david.laight.linux_spam@runbox.com; receiver=lists.ozlabs.org)
Received: from mailtransmit04.runbox.com (mailtransmit04.runbox.com [IPv6:2a0c:5a00:149::25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPgjW4wb4z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 01:07:11 +1100 (AEDT)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit04.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jx-003ZEJ-9O; Mon, 02 Mar 2026 14:28:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:To:From;
	bh=o2ClYLRupqDrO68wbhPYoX/KO8vhOPlwFWoOd/NbY3w=; b=RaIJo34Y0Q7j2egm9oaHOlOtOd
	qIf5fI6+l/d2wpNaqq8G9dXTQ9MMLD3B96RqcrmcIuZWAbHSJrVvAOsCyxNnHmB0ApiOwjvIA/WUq
	2QHmlroveisu5RbpBCARdjIwFelcSMWSgnuhcGGnezIcVvrdSc/czwp60dIuZ0dJ0UBhYTt3Dir6A
	kPjMxT6Sx+w5jzEelLAoWpF5WZwr5068t7N9pLbu3BuEHsUXyhRpZNDULOe1NTcLEJsTarSsqPA3q
	jO3BiP4+6U4spuDiRYWorjNHk7ZXXdxC/8mJTlzMjB17nS6wB8o7mn+sdiXsOXXocQv+tO32ThUWi
	FRs2OCew==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jw-0001hU-9m; Mon, 02 Mar 2026 14:28:24 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vx3Jj-008UTR-SY; Mon, 02 Mar 2026 14:28:11 +0100
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
Subject: [PATCH v2 4/5] uaccess: Disable -Wshadow in __scoped_user_access()
Date: Mon,  2 Mar 2026 13:27:54 +0000
Message-Id: <20260302132755.1475451-5-david.laight.linux@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[runbox.com:s=selector2];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:andrealmeid@igalia.com,m:andrew.cooper3@citrix.com,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:christophe.leroy@csgroup.eu,m:chleroy@kernel.org,m:dvhart@infradead.org,m:david.laight.linux@gmail.com,m:dave@stgolabs.net,m:hca@linux.ibm.com,m:jack@suse.cz,m:Julia.Lawall@inria.fr,m:torvalds@linux-foundation.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:mathieu.desnoyers@efficios.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nicolas.palix@imag.fr,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peterz@infradead.org,m:linux@armlinux.org.uk,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:x86@kernel.org,m:kees@kernel.org,m:akpm@linux-foundation.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,igalia.com,citrix.com,linux.ibm.com,kernel.org,csgroup.eu,infradead.org,gmail.com,stgolabs.net,suse.cz,inria.fr,linux-foundation.org,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,efficios.com,ellerman.id.au,imag.fr,dabbelt.com,armlinux.org.uk,linutronix.de];
	TAGGED_FROM(0.00)[bounces-17535-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[34];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_TRACE(0.00)[runbox.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FROM_NO_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org]
X-Rspamd-Queue-Id: 05BE41DA621
X-Rspamd-Action: no action

From: David Laight <david.laight.linux@gmail.com>

-Wshadow is enabled by W=2 builds and __scoped_user_access() quite
deliberately creates a 'const' shadow of the 'user' address that
references a 'guard page' when the application passes a kernel pointer.

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 include/linux/uaccess.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 64bc2492eb99..445391ec5a6d 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -739,7 +739,9 @@ static __always_inline void __scoped_user_rw_access_end(const void *p)
 #define __scoped_user_access(mode, uptr, size, elbl)					\
 	with (auto _tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl))	\
 		/* Force modified pointer usage within the scope */			\
-		and_with (const auto uptr __cleanup(__scoped_user_##mode##_access_end) = _tmpptr)
+		__diag_push() __diag_ignore_all("-Wshadow", "uptr is readonly copy")	\
+		and_with (const auto uptr __cleanup(__scoped_user_##mode##_access_end) = _tmpptr) \
+		__diag_pop()
 
 /**
  * scoped_user_read_access_size - Start a scoped user read access with given size
-- 
2.39.5


