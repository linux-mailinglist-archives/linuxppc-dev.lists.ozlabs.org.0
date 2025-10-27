Return-Path: <linuxppc-dev+bounces-13322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 218B5C0C625
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:45:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6Vy36hDz3dmy;
	Mon, 27 Oct 2025 19:44:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554650;
	cv=none; b=MA2JUBQJKh53pyIvBotbcd0Fk2+qgTjTry0UpAU/ExHXVnAPrDcC9E2qqex9onEB5poyq5W/vC8PQv5rs0zOsRHl4D7eI+B4LLditXxoLiTJlXSEFkKv5N2dyw2Dp4YZBSd7ZGZA96G+d9nzxEUP/4OIBOoyrLAMvAhXGbr9/gUHDhyFmtf+W4u9AxbfIRUWNEB9xVM7kfIfrrv6n0lkhw8LVIHHQjhVu6Dy8JPs3FLPp4ltxTjo6sQMnwe7uejmmKqY4DPgAncJxGP0QlOPFhCCnQ6sbTFgm6rhkbuVMS9i78W4ZrsTlLZ4itcyqe2t+4qZxq9WpRNDRDWH5tX0Sg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554650; c=relaxed/relaxed;
	bh=Zgu2fA8f5xJPsST4+i4W8NVv6qck0BV/bxjOydsn72k=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=G8PBD5xfbjCXPCIwq6vd3h1VweMHRriXPmI+D+u00Cilt9Z5UHV2mP6ReFcyfO4LAaIFkn5Dtuu1l9xKgATYDYCSqn72IsRz0FdePkk7XjH4iCf2FOqXxUeUCF70m5H9ThwAif+SmKk22JqpjDaS3TdFpjPcc+kFeMApYY0W8cAO5F6bWokzlM2E60Yy7rd47NI6AIREqoJIx0zV50tThqPMvejjJmaCDdtp+FBSM83BTTglB2OqlbOIqp1au0ec7ytnG53LHJ+4kTZ+Y+UjeN75QUEmedJ6KZRtxbF59nKhbVyUCnT6TxK7HIh/wUauT95LcpeCnB4mWg5j/jjMNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vc02t/+I; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=h5a/XjQ9; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=vc02t/+I;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=h5a/XjQ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6Vx6Nqqz3dfr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:44:09 +1100 (AEDT)
Message-ID: <20251027083745.862419776@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Zgu2fA8f5xJPsST4+i4W8NVv6qck0BV/bxjOydsn72k=;
	b=vc02t/+I+nf33n4SyJKuoN622JX8SnrnzVtfhDPK+/CUbQ/RqLF/DthXP1xJ7sULRhvFl2
	ervlj9kpfpMbHwMkAynBmHLcTJGBcGkuv85J1dwgCoOnI/zfTSvkKoRqQMa9Hf4Ov6KyNc
	2rN2oN1ArrM7znk74JARchtCqYx5WcGfoH2YzHDbunlrBv0LlZa49GKnmYBm5bRxysyvD4
	lAfZl2u+xJgpU+3ekTXaT18RIdUteVcBr/OibuH9jL9sg+2MENKRz5IiDVDBTQbsohFXwL
	icBtnSnGBPVlo/TpaDZdcBIO7NUpOu7h0egc6gY+lB4hcffx4LFtczx8LgyTUQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=Zgu2fA8f5xJPsST4+i4W8NVv6qck0BV/bxjOydsn72k=;
	b=h5a/XjQ9yWZ3Y3xQQNZYqfN6ytz0CnIzmt8Mgcy5kYj76XXOgxcRFSmKp7julm7XZYSWmA
	kYpiplU0qPYsnOCA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org,
 kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [patch V5 12/12] select: Convert to scoped user access
References: <20251027083700.573016505@linutronix.de>
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
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Oct 2025 09:44:04 +0100 (CET)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thomas Gleixner <tglx@linutronix.de>

Replace the open coded implementation with the scoped user access guard.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
---
V4: Use read guard - Peterz
    Rename once more
V3: Adopt to scope changes
---
 fs/select.c |   12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)
---
--- a/fs/select.c
+++ b/fs/select.c
@@ -776,17 +776,13 @@ static inline int get_sigset_argpack(str
 {
 	// the path is hot enough for overhead of copy_from_user() to matter
 	if (from) {
-		if (can_do_masked_user_access())
-			from = masked_user_access_begin(from);
-		else if (!user_read_access_begin(from, sizeof(*from)))
-			return -EFAULT;
-		unsafe_get_user(to->p, &from->p, Efault);
-		unsafe_get_user(to->size, &from->size, Efault);
-		user_read_access_end();
+		scoped_user_read_access(from, Efault) {
+			unsafe_get_user(to->p, &from->p, Efault);
+			unsafe_get_user(to->size, &from->size, Efault);
+		}
 	}
 	return 0;
 Efault:
-	user_read_access_end();
 	return -EFAULT;
 }
 


