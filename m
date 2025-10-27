Return-Path: <linuxppc-dev+bounces-13320-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D2AC0C60D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Oct 2025 09:45:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cw6Vs2BMkz3dXB;
	Mon, 27 Oct 2025 19:44:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761554645;
	cv=none; b=Kc70OoLW0icH2RjQZUOTTIeVekL3LMn1OPkW3fiMka0tHMlmBbPkFNwiyGdetQT1NUrm1R8h4LdPhPJ00M5+NVf5SxH3/Lh1kMrGdzeKGwJsDQX1bzjhP75LIKSFFPjj0EscyewnczWen4nWdqHtgE13tshJnsHGSB6f1MRoTm29psB9VgMYnQAi39yRoKm4FSeCxuKEImZpmQTDwL90Wg39wTPPmMMoIAwCqu/FUT7d48S5fFHSyZTmxts0Yp7OmKosk3253wz9A/mJftZfgZFRYKN1aimImn1+Njuxxe+CP+W7bnW4tc3LbyWf+nMGnyMHQoBXGwciyZrNAYTn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761554645; c=relaxed/relaxed;
	bh=uMwKIluQZ/G+KoDWjXfgtZpH34AaSudGJEkVAvBfiV4=;
	h=Message-ID:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Date; b=cZdG7d17VZ2IB3wUHvTMe06aGDNHErPAhOSEczvqIdT0w9R7iC2N7zBBeafNziho2XxEeBvgABzk3pBRyoJOCZ2PUKJSkd+Iw2endX1ChUVfwUiXaZMG5zO7a8dSJ35zf/OlHCWRdotfHP0XPJzyIrRddWE5msTcxvE+NEANwyMetUTk+0BuJQlfKm6HG0j8kgzQ6zSVoWhzONHCFQELzxDdkwhWS1obWUYwiDE4Bldac8ULburQIWVCsxkdt3rCsiUAWCp8X6qPs7FFsk9cYGYuJLw8m/byCla2PFD/pUE2WZ/b3UAo7YeTt5JvkoOV6oVShKTYG0o+SL9iHLoWqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xItvuyS+; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tYimNmTf; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xItvuyS+;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tYimNmTf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cw6Vr2Hvmz3dWv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Oct 2025 19:44:04 +1100 (AEDT)
Message-ID: <20251027083745.673465359@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1761554640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uMwKIluQZ/G+KoDWjXfgtZpH34AaSudGJEkVAvBfiV4=;
	b=xItvuyS+liJchgafJHpU9tYzPOno9TqkarDH1yZCK3/SY8LaeF0qT3opEQkDdO2pbpY6RP
	Htv+fdHsKQ7EcNx1mU7B7kjkr2MwCU/4llsA9ZTs/iz+8JRvkjQPVcPUyemRxjlbtktGKw
	GsJHGW2ZY09kGlWJaszbHS77TSX4HGu2viKiUm9yVfGlp4Wr7eYi0dBWXqDf+lbjgf3UOL
	EK1SbwjiDt9mqIf2xFqEMIs2XBc6hrKI7n1ZGKPIsTdyVEWZ5039b7tBmAnJ6wMzAJxKjx
	WAWU5PRgWHSrODttFM/9WH+13KTG9uP6NXR5SYwhtmgFY+wKA/oNAOAMka0zHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1761554640;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 references:references; bh=uMwKIluQZ/G+KoDWjXfgtZpH34AaSudGJEkVAvBfiV4=;
	b=tYimNmTfzHE55VQN/cxG6Mfbc65avtlgEq43Xb/8LXKZ65sSl0k4ojYbJ4I2f258Ii1cd0
	MyXDnpD51wgg7VCQ==
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
 David Laight <david.laight.linux@gmail.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
Subject: [patch V5 09/12] [RFC] coccinelle: misc: Add
 scoped_masked_$MODE_access() checker script
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
Date: Mon, 27 Oct 2025 09:43:58 +0100 (CET)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
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
+  'scoped_user_read_access_size'  : 'scoped_user_read_access',
+  'scoped_user_write_access_size' : 'scoped_user_write_access',
+  'scoped_user_rw_access_size'    : 'scoped_user_rw_access',
+}
+
+# Most common accessors. Incomplete list
+noaccessmap = {
+  'scoped_user_read_access'       : ('unsafe_put_user', 'unsafe_copy_to_user'),
+  'scoped_user_write_access'      : ('unsafe_get_user', 'unsafe_copy_from_user'),
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
+iterator name scoped_user_read_access,
+	      scoped_user_read_access_size,
+	      scoped_user_write_access,
+	      scoped_user_write_access_size,
+	      scoped_user_rw_access,
+	      scoped_user_rw_access_size;
+iterator scope;
+statement S;
+@@
+
+(
+(
+scoped_user_read_access(...) S
+|
+scoped_user_read_access_size(...) S
+|
+scoped_user_write_access(...) S
+|
+scoped_user_write_access_size(...) S
+|
+scoped_user_rw_access(...) S
+|
+scoped_user_rw_access_size(...) S
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
+    <...
+    ac@p(a0, a1, ...);
+    ...>
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


