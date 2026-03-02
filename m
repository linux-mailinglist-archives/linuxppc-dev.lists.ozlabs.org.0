Return-Path: <linuxppc-dev+bounces-17533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kEzVNFuZpWnxEgYAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17533-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:06:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E57EF1DA5D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 02 Mar 2026 15:06:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPghS29khz3bW7;
	Tue, 03 Mar 2026 01:06:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0c:5a00:149::26"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772460376;
	cv=none; b=j6LpaRs5RafVWKyvIFQBvHCeLKzU9uILnKETRjKRZVDEBbsPBkASqzf/26BibfpSDpnajS3SFyecrSPPicnYR05ZGRFygLEeYYE78hqCGAVxOrJki0haIjzNGb/7xOM7BMIaslAq6uncvYMPWOpOFKVY9q/tWJod9ShNcqSD9X1NFFk8hBndbxeUA05N//T5dlFL8GSSJoUvMC077zt1NYEH7HcRN8deyDV8So42TIX2SEtQ9G565k9bNCFg4HzDuTLMgmwGE50taox/AX5+Owpnni+dQO+veglcT5LFDichJggDEWMgLO/VspTxO8cHwcT11M3F+jxrAaOEjfqI0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772460376; c=relaxed/relaxed;
	bh=DqGOd6ipwPciYOEGbBHYVc1F4qmoJna8wv2iZM4469g=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DL7L+xWH3ISWfikTwygSArc1kSvfkPySiZx06Hv6Z8tWDMPFkDeWIyyfOuhAZPIL3mC7neZQIhMJ2uokRZ3/7oFQxYkxNfq0h1hfWJFnO/cISZadxxThEDvjulVEEK+Fx8DFtGHxyaLIvM8MHhNvSuujKcOeMxzuX/Us/nXWbZm2UREMFMzs98+ZFsakwCOwR4Q1ZvhAurLObWZKIpDGQPoed8dglyytQpjY3bu2LHTszoUgwNdu9oMs+Zosic5sMiXoPkXP5OHUZ1p7ERi6EenWQFYeRro7aHux+ECDehcNZBLsuajxP7DNMEpzTowrOkVX+qPBIpd22BMSzIvzKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector2 header.b=C3w8X+KC; dkim-atps=neutral; spf=pass (client-ip=2a0c:5a00:149::26; helo=mailtransmit05.runbox.com; envelope-from=david.laight.linux_spam@runbox.com; receiver=lists.ozlabs.org) smtp.mailfrom=runbox.com
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=runbox.com header.i=@runbox.com header.a=rsa-sha256 header.s=selector2 header.b=C3w8X+KC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=runbox.com (client-ip=2a0c:5a00:149::26; helo=mailtransmit05.runbox.com; envelope-from=david.laight.linux_spam@runbox.com; receiver=lists.ozlabs.org)
Received: from mailtransmit05.runbox.com (mailtransmit05.runbox.com [IPv6:2a0c:5a00:149::26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPghR34w2z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 01:06:15 +1100 (AEDT)
Received: from mailtransmit03.runbox ([10.9.9.163] helo=aibo.runbox.com)
	by mailtransmit05.runbox.com with esmtps  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.93)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Jw-003bl4-7x; Mon, 02 Mar 2026 14:28:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=runbox.com;
	 s=selector2; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To
	:Message-Id:Date:Subject:To:From;
	bh=DqGOd6ipwPciYOEGbBHYVc1F4qmoJna8wv2iZM4469g=; b=C3w8X+KCNPwwUnlCUtq46S90t1
	DaIzVd1U67pGzKoSNwRgDY0CkJR1WNOs2reVFFLbpCZJ5PTfZVq5TZTYpBtxMw2AfBFKsnU8eNfzL
	UyKZj1Ao3zw24M6GhXmw4q7AcjpvZz9fajrVInZguhOGa8NYPBkUrjhNlngU3Mr5PEAWm9Jc6JFne
	y3SR7NYQbKrUQi7nwwLTjarrREdk17HVYnhrX+G5V/PSUpfdGc3Axbaqn/zyoRSLpoMrqqb5dL7RX
	smVDc6yiyZoQchORsC5WgAugpAW3KLRRAwN3ak0bumYpByVPz6HVuheyobbQNDuH27z7AyGB9th3/
	IYE9RgWA==;
Received: from [10.9.9.73] (helo=submission02.runbox)
	by mailtransmit03.runbox with esmtp (Exim 4.86_2)
	(envelope-from <david.laight.linux_spam@runbox.com>)
	id 1vx3Ju-0001hC-Np; Mon, 02 Mar 2026 14:28:22 +0100
Received: by submission02.runbox with esmtpsa  [Authenticated ID (1493616)]  (TLS1.2:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.93)
	id 1vx3Jl-008UTR-0w; Mon, 02 Mar 2026 14:28:13 +0100
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
Subject: [PATCH v2 next 5/5] signal: Use scoped_user_access() instead of __put/get_user()
Date: Mon,  2 Mar 2026 13:27:55 +0000
Message-Id: <20260302132755.1475451-6-david.laight.linux@gmail.com>
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
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[runbox.com:s=selector2];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_RECIPIENTS(0.00)[m:viro@zeniv.linux.org.uk,m:andrealmeid@igalia.com,m:andrew.cooper3@citrix.com,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:christophe.leroy@csgroup.eu,m:chleroy@kernel.org,m:dvhart@infradead.org,m:david.laight.linux@gmail.com,m:dave@stgolabs.net,m:hca@linux.ibm.com,m:jack@suse.cz,m:Julia.Lawall@inria.fr,m:torvalds@linux-foundation.org,m:linux-arm-kernel@lists.infradead.org,m:linux-fsdevel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:maddy@linux.ibm.com,m:mathieu.desnoyers@efficios.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:nicolas.palix@imag.fr,m:palmer@dabbelt.com,m:pjw@kernel.org,m:peterz@infradead.org,m:linux@armlinux.org.uk,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:x86@kernel.org,m:kees@kernel.org,m:akpm@linux-foundation.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,igalia.com,citrix.com,linux.ibm.com,kernel.org,csgroup.eu,infradead.org,gmail.com,stgolabs.net,suse.cz,inria.fr,linux-foundation.org,lists.infradead.org,vger.kernel.org,lists.ozlabs.org,efficios.com,ellerman.id.au,imag.fr,dabbelt.com,armlinux.org.uk,linutronix.de];
	TAGGED_FROM(0.00)[bounces-17533-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[davidlaightlinux@gmail.com,linuxppc-dev@lists.ozlabs.org]
X-Rspamd-Queue-Id: E57EF1DA5D5
X-Rspamd-Action: no action

From: David Laight <david.laight.linux@gmail.com>

Mechanically change the access_ok() and __get/put_user() to use
scoped_user_read/write_access() and unsafe_get/put_user().

This generates better code with fewer STAC/CLAC pairs.

It also ensures that access_ok() is called near the user accesses.
I failed to find the one for __save_altstack().

Looking at the change, perhaps there should be aliases:
#define scoped_put_user unsafe_put_user
#define scoped_get_user unsafe_get_user

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 kernel/signal.c | 72 ++++++++++++++++++++++++++++---------------------
 1 file changed, 42 insertions(+), 30 deletions(-)

diff --git a/kernel/signal.c b/kernel/signal.c
index d65d0fe24bfb..fca257398cbc 100644
--- a/kernel/signal.c
+++ b/kernel/signal.c
@@ -4469,10 +4469,16 @@ int restore_altstack(const stack_t __user *uss)
 int __save_altstack(stack_t __user *uss, unsigned long sp)
 {
 	struct task_struct *t = current;
-	int err = __put_user((void __user *)t->sas_ss_sp, &uss->ss_sp) |
-		__put_user(t->sas_ss_flags, &uss->ss_flags) |
-		__put_user(t->sas_ss_size, &uss->ss_size);
-	return err;
+
+	scoped_user_write_access(uss, Efault) {
+		unsafe_put_user((void __user *)t->sas_ss_sp, &uss->ss_sp, Efault);
+		unsafe_put_user(t->sas_ss_flags, &uss->ss_flags, Efault);
+		unsafe_put_user(t->sas_ss_size, &uss->ss_size, Efault);
+	}
+	return 0;
+
+Efault:
+	return -EFAULT;
 }
 
 #ifdef CONFIG_COMPAT
@@ -4705,12 +4711,12 @@ SYSCALL_DEFINE3(sigaction, int, sig,
 
 	if (act) {
 		old_sigset_t mask;
-		if (!access_ok(act, sizeof(*act)) ||
-		    __get_user(new_ka.sa.sa_handler, &act->sa_handler) ||
-		    __get_user(new_ka.sa.sa_restorer, &act->sa_restorer) ||
-		    __get_user(new_ka.sa.sa_flags, &act->sa_flags) ||
-		    __get_user(mask, &act->sa_mask))
-			return -EFAULT;
+		scoped_user_read_access(act, Efault) {
+		    unsafe_get_user(new_ka.sa.sa_handler, &act->sa_handler, Efault);
+		    unsafe_get_user(new_ka.sa.sa_restorer, &act->sa_restorer, Efault);
+		    unsafe_get_user(new_ka.sa.sa_flags, &act->sa_flags, Efault);
+		    unsafe_get_user(mask, &act->sa_mask, Efault);
+		}
 #ifdef __ARCH_HAS_KA_RESTORER
 		new_ka.ka_restorer = NULL;
 #endif
@@ -4720,15 +4726,18 @@ SYSCALL_DEFINE3(sigaction, int, sig,
 	ret = do_sigaction(sig, act ? &new_ka : NULL, oact ? &old_ka : NULL);
 
 	if (!ret && oact) {
-		if (!access_ok(oact, sizeof(*oact)) ||
-		    __put_user(old_ka.sa.sa_handler, &oact->sa_handler) ||
-		    __put_user(old_ka.sa.sa_restorer, &oact->sa_restorer) ||
-		    __put_user(old_ka.sa.sa_flags, &oact->sa_flags) ||
-		    __put_user(old_ka.sa.sa_mask.sig[0], &oact->sa_mask))
-			return -EFAULT;
+		scoped_user_write_access(oact, Efault) {
+		    unsafe_put_user(old_ka.sa.sa_handler, &oact->sa_handler, Efault);
+		    unsafe_put_user(old_ka.sa.sa_restorer, &oact->sa_restorer, Efault);
+		    unsafe_put_user(old_ka.sa.sa_flags, &oact->sa_flags, Efault);
+		    unsafe_put_user(old_ka.sa.sa_mask.sig[0], &oact->sa_mask, Efault);
+		}
 	}
 
 	return ret;
+
+Efault:
+	return -EFAULT;
 }
 #endif
 #ifdef CONFIG_COMPAT_OLD_SIGACTION
@@ -4742,12 +4751,12 @@ COMPAT_SYSCALL_DEFINE3(sigaction, int, sig,
 	compat_uptr_t handler, restorer;
 
 	if (act) {
-		if (!access_ok(act, sizeof(*act)) ||
-		    __get_user(handler, &act->sa_handler) ||
-		    __get_user(restorer, &act->sa_restorer) ||
-		    __get_user(new_ka.sa.sa_flags, &act->sa_flags) ||
-		    __get_user(mask, &act->sa_mask))
-			return -EFAULT;
+		scoped_user_read_access(act, Efault) {
+		    unsafe_get_user(handler, &act->sa_handler, Efault);
+		    unsafe_get_user(restorer, &act->sa_restorer, Efault);
+		    unsafe_get_user(new_ka.sa.sa_flags, &act->sa_flags, Efault);
+		    unsafe_get_user(mask, &act->sa_mask, Efault);
+		}
 
 #ifdef __ARCH_HAS_KA_RESTORER
 		new_ka.ka_restorer = NULL;
@@ -4760,16 +4769,19 @@ COMPAT_SYSCALL_DEFINE3(sigaction, int, sig,
 	ret = do_sigaction(sig, act ? &new_ka : NULL, oact ? &old_ka : NULL);
 
 	if (!ret && oact) {
-		if (!access_ok(oact, sizeof(*oact)) ||
-		    __put_user(ptr_to_compat(old_ka.sa.sa_handler),
-			       &oact->sa_handler) ||
-		    __put_user(ptr_to_compat(old_ka.sa.sa_restorer),
-			       &oact->sa_restorer) ||
-		    __put_user(old_ka.sa.sa_flags, &oact->sa_flags) ||
-		    __put_user(old_ka.sa.sa_mask.sig[0], &oact->sa_mask))
-			return -EFAULT;
+		scoped_user_write_access(oact, Efault) {
+		    unsafe_put_user(ptr_to_compat(old_ka.sa.sa_handler),
+			       &oact->sa_handler, Efault);
+		    unsafe_put_user(ptr_to_compat(old_ka.sa.sa_restorer),
+			       &oact->sa_restorer, Efault);
+		    unsafe_put_user(old_ka.sa.sa_flags, &oact->sa_flags, Efault);
+		    unsafe_put_user(old_ka.sa.sa_mask.sig[0], &oact->sa_mask, Efault);
+		}
 	}
 	return ret;
+
+Efault:
+	return -EFAULT;
 }
 #endif
 
-- 
2.39.5


