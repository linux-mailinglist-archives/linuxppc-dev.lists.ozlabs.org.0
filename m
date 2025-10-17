Return-Path: <linuxppc-dev+bounces-12995-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18714BE7F7E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:10:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp0st24y8z3cZn;
	Fri, 17 Oct 2025 21:09:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760695762;
	cv=none; b=V6MZ9pdS0e0ygKKmq7j3qv/2DlaLZSwBgsKTfJtRqSat3pZOrIFW9w8ox3DK/lynyV7XGx+Ks/UZgJ7bPR0uIrIGU9FcqIbPMOpnpnKZfx2XWUvPNpP+98p8BfvJKfo5WFQOzjhy33EOz7JZno+HstUCbaFwOD2n7lQCD8rcK0L4bOUageaIhSfPZfNpJyFzuNia8SsxaqOyjZAI6jdsLKX8f5gHCs5P/IjmU6cI1Mj3iG8zNEy2I//TmNWRON2goxBUfMVLwzg/Bsar2o4ru3QXNNebF+dc4E56TtZYX2bEQOopjXdPE85EKM9J8NUPA7C+6lFonP+EmGt1NGHS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760695762; c=relaxed/relaxed;
	bh=pR7+HoSAZ5DPHGbJNIgf4IBT7k17Ap8Nygw2CprMOJk=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=cv43bhBuJ1qX6XecsJC69535B1ZqmYRv4ViAYyZcAqgYxXZ/CdcHEN/FJbg/RE8vdjE7joGTL4MDjdhz87dB9SQts7esFKBNYRARJzKIgqOcPM1aXaj9hb0MgCYeWzviQ2x2ZmmDNpFdnI7L+6o2KZ4INiTE3kr+Trbj0l9UFIS1XVHjmpLv5b7Ixb2ZEsjtT6pyZc18uk5FSurHMgkLueiFnhmflJE+G8xGvnJXqrNC6oenIFefJmR9a3hGeb6mC/taU17yvTZ7W+THrRrP3Z44Y13aSxgknJP5zOypsNitGPQ6tppL1QZ9nZF0pfz2sPHHmYRGOM+ke4D/L+TUkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=C9k9phXB; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NqCfqZvI; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=C9k9phXB;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=NqCfqZvI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp0ss59RQz3d7n
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:09:21 +1100 (AEDT)
Message-ID: <20251017093030.570048808@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=pR7+HoSAZ5DPHGbJNIgf4IBT7k17Ap8Nygw2CprMOJk=;
	b=C9k9phXBv3eSc0l2GIAi2J0FDFvKBMovIjwdFiDy0e0i1kEvIzJQWQtsVykSYWQA3zjanX
	qK3FqAmeA4xpyNd7UTfXnUV56EjTSIUeQtC9nFHZEArPQ/fbOm6glmVPTvfaVQoaS64AGl
	c0H5PbeukmuOWNI3zg7uznrWybvjBa9ctDylchNsPz63c2AcGkhbqt2XawHnh2gquvGOiY
	QZ6/TwVeXt4VR/n2CM0osByZwoQCPo5GbmlRV84rc5i3dXEBh5eUrp9liWqkWxgX8mlObi
	ABikS60oKdGSbS6eP+JMOOnnRu35rw9ZacukDYaMdGK1k0mW/MewxBrep5VpHQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=pR7+HoSAZ5DPHGbJNIgf4IBT7k17Ap8Nygw2CprMOJk=;
	b=NqCfqZvIshq24z2AZVleQwm35Sz2Df1iT0581FbObZM20gQEQEv4ZdvC1q1Mdnah93RMie
	jPyBo6i+7usluCDg==
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
 Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [patch V3 12/12] select: Convert to scoped masked user access
References: <20251017085938.150569636@linutronix.de>
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
Date: Fri, 17 Oct 2025 12:09:18 +0200 (CEST)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Thomas Gleixner <tglx@linutronix.de>

Replace the open coded implementation with the scoped masked user access
guard.

No functional change intended.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: Jan Kara <jack@suse.cz>
Cc: linux-fsdevel@vger.kernel.org
---
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
+		scoped_masked_user_rw_access(from, Efault) {
+			unsafe_get_user(to->p, &from->p, Efault);
+			unsafe_get_user(to->size, &from->size, Efault);
+		}
 	}
 	return 0;
 Efault:
-	user_read_access_end();
 	return -EFAULT;
 }
 


