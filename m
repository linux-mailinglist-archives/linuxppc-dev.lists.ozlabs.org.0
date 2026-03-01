Return-Path: <linuxppc-dev+bounces-17476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OL+ULciUpGmxkwUAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17476-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Mar 2026 20:34:32 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3277E1D15CD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 01 Mar 2026 20:34:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPC1Z2mC4z30MY;
	Mon, 02 Mar 2026 06:34:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772393666;
	cv=none; b=Y9Y6WHC2vIPn67n2XLLJWgfYlARMsUP4bQmW/fgbCBA3bS61eQBVT9gwx5IufY3reCxv7LwjwqmXo8Q2GiwgnNClgcIUJcX+81bMeHkh25miChrY7gxavrcT1aGcCrvEfu+vyQexkKqEBKY7LpR9X4KXYoqk5S9iAR0jEMOkmhToiwgJyhL+2B2+1ILCD7dETjdeP0kIMRdOSF+01zqhLQDPXKx0Ildc1mBe1yV1IMGX/O1fgJfG5s8sWvRDPprrMewXg4InhsinacnThz3gxKANlHUyAxB4BV8GXIJUs48ak1dk805HfLf9z/5Q3cxOKZY41NVpSV7RDNOf0RjagA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772393666; c=relaxed/relaxed;
	bh=CUm9HzLUU22F5cVwjfz4Zoc4xR/667vc4nney7zidvE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NN4iVEMKR7+yrZszce/ijE+g9j+ld6GSQg+OvR/pEkOETcfqBBPCQQJV8ON7XK1S7i26WN2T6PtMT42dqIPgRXTBuXot4HxAUFWS4H6uBsoGCI5dTq4A3O8TbVpsYdUHIZDfKeShdyeGq43fw8N19B8lk4TiwIbQXvwfvW7rda3vMMvP7Pq1L8ceQC34ipe6i3m8Ba6U4Yk1ryV5o+3HLaFlhAMxPRH/fFOMpbuUjQBN0gM5F+9GTyC9/BqvIkT92CjDIImUEwNNSwKxc0jY4v/YCnSTqXBAdrcFhIie26lIBWxVQROQckuudFaBFmfc4XgLdKYE149kD2eIhX62Hg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fBMoKZh/; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=fBMoKZh/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPC1X6YbYz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2026 06:34:24 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 245B560008;
	Sun,  1 Mar 2026 19:34:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46D9BC116C6;
	Sun,  1 Mar 2026 19:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772393656;
	bh=BS3ZMwHlDBcAakH4xSCy5YZLU7NRjvFZNyLUzpzSoag=;
	h=From:To:Cc:Subject:Date:From;
	b=fBMoKZh/LWCvwocBJu3/DdC0EKLnEGnsvFsFINLPykRPzdRWemfcP23uVosUvNyQU
	 LRS5bvFJZDxSZkMlwzOw4Q9gcfCc9YeJPDZ595R+nFJuTlGbuECzRBOyUNBixZFt5D
	 iE6iCR4qfZsuoqEikqKYjCmQqHupeKgd5ohtJHLAKZG9ct5D+lRrUezJ2xNtVUijBa
	 Af6pXyHwm+tJZeEEamUZy10vahwIWTBFKZnBtk749nsFwX6r3fnDReMFMlj+wF5hhC
	 s98itWgns3vCxpdLt7eM0O1669ALiZebwBSZ8BHviYayyJ1j0E9NlR26Z/ra4XBWdC
	 Zj+TlcM/lie1Q==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	LKML <linux-kernel@vger.kernel.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	linuxppc-dev@lists.ozlabs.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	linux-s390@vger.kernel.org,
	Julia Lawall <Julia.Lawall@inria.fr>,
	Nicolas Palix <nicolas.palix@imag.fr>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Andre Almeida <andrealmeid@igalia.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	linux-fsdevel@vger.kernel.org
Subject: [PATCH] uaccess: Fix build of scoped user access with const pointer
Date: Sun,  1 Mar 2026 20:33:58 +0100
Message-ID: <4e994e13b48420ef36be686458ce3512657ddb41.1772393211.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510; i=chleroy@kernel.org; h=from:subject:message-id; bh=BS3ZMwHlDBcAakH4xSCy5YZLU7NRjvFZNyLUzpzSoag=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQumbKswe2Zuf6EuTudmqtKPfYcXrNP0W3Fv5jev4WbX s0s28pV0lHKwiDGxSArpshy/D/3rhldX1Lzp+7Sh5nDygQyhIGLUwAmkpLB8D+a+w/zg3+ige3h eQsXCTO+PXiEYyrjCsvO1ltzHW5ZPPvO8IspVKT412bj9XLyP/d83ZRVd+LX0vcHZX+6RcXGh8T 9EmYFAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-17476-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:tglx@linutronix.de,m:linux-kernel@vger.kernel.org,m:chleroy@kernel.org,m:christophe.leroy@csgroup.eu,m:mathieu.desnoyers@efficios.com,m:andrew.cooper3@citrix.com,m:torvalds@linux-foundation.org,m:david.laight.linux@gmail.com,m:lkp@intel.com,m:linux@armlinux.org.uk,m:linux-arm-kernel@lists.infradead.org,m:x86@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:linuxppc-dev@lists.ozlabs.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:linux-riscv@lists.infradead.org,m:hca@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,m:Julia.Lawall@inria.fr,m:nicolas.palix@imag.fr,m:peterz@infradead.org,m:dvhart@infradead.org,m:dave@stgolabs.net,m:andrealmeid@igalia.com,m:viro@zeniv.linux.org.uk,m:brauner@kernel.org,m:jack@suse.cz,m:linux-fsdevel@vger.kernel.org,m:davidlaightlinux@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chleroy@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,csgroup.eu,efficios.com,citrix.com,linux-foundation.org,gmail.com,intel.com,armlinux.org.uk,lists.infradead.org,linux.ibm.com,ellerman.id.au,lists.ozlabs.org,dabbelt.com,vger.kernel.org,inria.fr,imag.fr,infradead.org,stgolabs.net,igalia.com,zeniv.linux.org.uk,suse.cz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 3277E1D15CD
X-Rspamd-Action: no action

After converting powerpc checksum wrappers to scoped user access,
following build failure happens:

	  CC      arch/powerpc/lib/checksum_wrappers.o
	In file included from arch/powerpc/lib/checksum_wrappers.c:12:
	arch/powerpc/lib/checksum_wrappers.c: In function 'csum_and_copy_from_user':
	./include/linux/uaccess.h:691:1: error: initialization discards 'const' qualifier from pointer target type [-Werror=discarded-qualifiers]
	  691 | ({                                                                      \
	      | ^
	./include/linux/uaccess.h:755:37: note: in expansion of macro '__scoped_user_access_begin'
	  755 |         for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
	      |                                     ^~~~~~~~~~~~~~~~~~~~~~~~~~
	./include/linux/uaccess.h:770:9: note: in expansion of macro '__scoped_user_access'
	  770 |         __scoped_user_access(read, usrc, size, elbl)
	      |         ^~~~~~~~~~~~~~~~~~~~
	arch/powerpc/lib/checksum_wrappers.c:17:9: note: in expansion of macro 'scoped_user_read_access_size'
	   17 |         scoped_user_read_access_size(src, len, efault)
	      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~

Cast __scoped_user_access_begin() to (void __user *) to fix it.

Fixes: e497310b4ffb ("uaccess: Provide scoped user access regions")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
Thomas, I encountered this problem while preparing some patches to start using
scope user access widely on powerpc in order to benefit more from masked user
access. Can you make this patch go into 7.0 as a fix in order avoid dependency
on this change when we start using scoped user access ?

 include/linux/uaccess.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
index 1f3804245c06..5d9f6d45d301 100644
--- a/include/linux/uaccess.h
+++ b/include/linux/uaccess.h
@@ -752,7 +752,8 @@ USER_ACCESS_GUARD(rw)
  */
 #define __scoped_user_access(mode, uptr, size, elbl)					\
 for (bool done = false; !done; done = true)						\
-	for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \
+	for (void __user *_tmpptr = (void __user *)					\
+				    __scoped_user_access_begin(mode, uptr, size, elbl); \
 	     !done; done = true)							\
 		for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)	\
 			/* Force modified pointer usage within the scope */		\
-- 
2.49.0


