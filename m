Return-Path: <linuxppc-dev+bounces-12993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8554BE7F74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Oct 2025 12:10:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cp0sq15VFz3d0x;
	Fri, 17 Oct 2025 21:09:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760695759;
	cv=none; b=DIbjWX9wUXW0XiHXohOw0YxADc/u0ZrfSRF0E40wZ1EbNZdPVgj7FkGA4xJLcQpi+BUdWRk67l+z1hKAYwVGxhOGshFiv2RU17yN6UTJWRrIBuTVhdLP99LPIKVTy2nRbfSizDq54WMK937OSsB/CMo0guVX0oBVwt1MRGg6t1zWTLcMp10PSzRzyov8HJ+nOSrE9x7mbR3ZikHPU3aBUpRntXXPhuZnYCThaHY/0VpbUbymrMMuNvyquSWW0q8ihAMSAyc6YAuTiIYqLTBhYXMgYefqHOYTArXrQgTIHG0kJ7XpAYMSaJPPlH60ppwhUtRUfAZOEZELzExwMLPIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760695759; c=relaxed/relaxed;
	bh=eAYIGd5fXsjzeJJB6qw0P3j1iV5OhzS8DCs61XHs+jU=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=UcpVt7O23C8q0sm1knsi/hGb3RPkQQ1BCyYxBNk6KAGD2QVIYxVlGf5MUF13wfBL/zbvRyX5USAQRCoYGqx1edKKckfmfjW+NDu+xEFfxB/PaoxAVSe0JCm1LxXBZhd+gv0g8bg6CiQoYVs55rJrWpUMU6luubs2SpepX+G3dRO+2TUfJYCiNQ2W3QUqadxF4kJePqiBsmuulH8+vNSdkjLHPa3PMfnCNyWaC6TNbAhzbiKOQa50uAtRxLiWBERsA8+3DFaT/Yv8hVo6fkAVh3ImIt4A4Nf+td6xeJyc2r6SYXoddAlXlPD7Rfky4xrpgy95I0mxLRUpd3gEcEw8Ow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hta58kDN; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Y3LLmuFY; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hta58kDN;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Y3LLmuFY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cp0sp3191z3cYG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Oct 2025 21:09:18 +1100 (AEDT)
Message-ID: <20251017093030.378863263@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1760695753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=eAYIGd5fXsjzeJJB6qw0P3j1iV5OhzS8DCs61XHs+jU=;
	b=hta58kDNqoHEEa2fr4giEnDSVUkRAytH2cY/ek52tlnq3qWRDJ1K/krbS6McjLr93cNBLF
	jxOOuv3MuMs81dQjLKsp+HxNpsnTgQ/AV2HiNeFCNCOEMA5TyQDBQVDNKRi0p4vmte/Iai
	WI2zvCG2Lc8rTZzJwcobqA4uqJnd7maiACqPzHL4rChOYJNt1asJ1L2zIRm3uzq/0RMLy6
	A8wP+wL5pOyhN/8vXVVelN3NXYs+3rSq6QISL6DP0WxsINkHDR0UUbMorXnQDZ6tuIIGZ5
	6Pq6J6Lq/6Tl5eVFMQX8rlfddlnMhm/nPPww+gOl4tJKaR40xGv4tlBz/FwRNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1760695753;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=eAYIGd5fXsjzeJJB6qw0P3j1iV5OhzS8DCs61XHs+jU=;
	b=Y3LLmuFYZAakAFXAg95cIJVuHw48NRZZoUaiDyUbz89qP5xShyqzhFoiUg+TySC0spPGJK
	LkNvBVMjv0fTtoBA==
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>,
 Nicolas Palix <nicolas.palix@imag.fr>,
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
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V3 09/12] [RFC] coccinelle: misc: Add
 scoped_masked_$MODE_access() checker script
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
Date: Fri, 17 Oct 2025 12:09:12 +0200 (CEST)
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

A common mistake in user access code is that the wrong access mode is
selected for starting the user access section. As most architectures map
Read and Write modes to ReadWrite this goes often unnoticed for quite some
time.

Aside of that the scoped user access mechanism requires that the same
pointer is used for the actual accessor macros that was handed in to start
the scope because the pointer can be modified by the scope begin mechanism
if the architecture supports masking.

Add a basic (and incomplete) coccinelle script to check for the common
issues. The error output is:

kernel/futex/futex.h:303:2-17: ERROR: Invalid pointer for unsafe_put_user(p) in scoped_masked_user_write_access(to)
kernel/futex/futex.h:292:2-17: ERROR: Invalid access mode unsafe_get_user() in scoped_masked_user_write_access()

Not-Yet-Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Julia Lawall <Julia.Lawall@inria.fr>
Cc: Nicolas Palix <nicolas.palix@imag.fr>
---
 scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

--- /dev/null
+++ b/scripts/coccinelle/misc/scoped_uaccess.cocci
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/// Validate scoped_masked_user*access() scopes
+///
+// Confidence: Zero
+// Options: --no-includes --include-headers
+
+virtual context
+virtual report
+virtual org
+
+@initialize:python@
+@@
+
+scopemap = {
+  'scoped_masked_user_read_access_size'  : 'scoped_masked_user_read_access',
+  'scoped_masked_user_write_access_size' : 'scoped_masked_user_write_access',
+  'scoped_masked_user_rw_access_size'    : 'scoped_masked_user_rw_access',
+}
+
+# Most common accessors. Incomplete list
+noaccessmap = {
+  'scoped_masked_user_read_access'       : ('unsafe_put_user', 'unsafe_copy_to_user'),
+  'scoped_masked_user_write_access'      : ('unsafe_get_user', 'unsafe_copy_from_user'),
+}
+
+# Most common accessors. Incomplete list
+ptrmap = {
+  'unsafe_put_user'			 : 1,
+  'unsafe_get_user'			 : 1,
+  'unsafe_copy_to_user'		 	 : 0,
+  'unsafe_copy_from_user'		 : 0,
+}
+
+print_mode = None
+
+def pr_err(pos, msg):
+   if print_mode == 'R':
+      coccilib.report.print_report(pos[0], msg)
+   elif print_mode == 'O':
+      cocci.print_main(msg, pos)
+
+@r0 depends on report || org@
+iterator name scoped_masked_user_read_access,
+	      scoped_masked_user_read_access_size,
+	      scoped_masked_user_write_access,
+	      scoped_masked_user_write_access_size,
+	      scoped_masked_user_rw_access,
+	      scoped_masked_user_rw_access_size;
+iterator scope;
+statement S;
+@@
+
+(
+(
+scoped_masked_user_read_access(...) S
+|
+scoped_masked_user_read_access_size(...) S
+|
+scoped_masked_user_write_access(...) S
+|
+scoped_masked_user_write_access_size(...) S
+|
+scoped_masked_user_rw_access(...) S
+|
+scoped_masked_user_rw_access_size(...) S
+)
+&
+scope(...) S
+)
+
+@script:python depends on r0 && report@
+@@
+print_mode = 'R'
+
+@script:python depends on r0 && org@
+@@
+print_mode = 'O'
+
+@r1@
+expression sp, a0, a1;
+iterator r0.scope;
+identifier ac;
+position p;
+@@
+
+  scope(sp,...) {
+    <+...
+    ac@p(a0, a1, ...);
+    ...+>
+  }
+
+@script:python@
+pos << r1.p;
+scope << r0.scope;
+ac << r1.ac;
+sp << r1.sp;
+a0 << r1.a0;
+a1 << r1.a1;
+@@
+
+scope = scopemap.get(scope, scope)
+if ac in noaccessmap.get(scope, []):
+   pr_err(pos, 'ERROR: Invalid access mode %s() in %s()' %(ac, scope))
+
+if ac in ptrmap:
+   ap = (a0, a1)[ptrmap[ac]]
+   if sp != ap.lstrip('&').split('->')[0].strip():
+      pr_err(pos, 'ERROR: Invalid pointer for %s(%s) in %s(%s)' %(ac, ap, scope, sp))


