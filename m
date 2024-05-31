Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A088D574B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 02:45:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H65rFeAt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr4CN6Hslz3fvn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 10:45:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=H65rFeAt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vr4Bg4kk4z3dWj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 10:44:27 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9058D62A08;
	Fri, 31 May 2024 00:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 431CDC2BBFC;
	Fri, 31 May 2024 00:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717116260;
	bh=p8P5EFg9jX/xIlWusoJGVR/jjFQ7suvFWvc+eVntG3o=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=H65rFeAt1H8IjDSk5Sq8WCDlN1wBpSw0QtlkjFWv5gW/vhKFJ/VWLBJyqrqncYf9+
	 tC05yqdLOJFfCXvf+72PmiDu0crwrHwDjria4L3aPYfPZgGQoHuiZPCOEm/0vgsJnD
	 9DjLtnkCCC3hMCJVx8EJgtCwS+uaiKgonL7/afOazvIuDzN4sSgcltfsc26d39giK1
	 r7/gHPsBZrPw3yUsXtRBudpdNHmQWjjSWML4MiedXT5iYYbCyEP/AmQqQByQ1KMvJ/
	 MoDRqqff0vfxPX4mEJ419FyrjYNRiWU5IIGngjZxma79+71tJfw8wgiLUZvFiScOGV
	 ysaNJ2fzI6Yfg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F583C25B74;
	Fri, 31 May 2024 00:44:20 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 30 May 2024 19:44:12 -0500
Subject: [PATCH] powerpc/rtas: Prevent Spectre v1 gadget construction in
 sys_rtas()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com>
X-B4-Tracking: v=1; b=H4sIAFsdWWYC/x2MQQqAMAzAvjJ6dlCnA/ErIlK0ai9TWhFF/LvDS
 yCH5AFjFTZo3QPKp5hsKUtZOBhXSgt7mbJDwFBjrNDbbYMeZD6RLpnKh6eyaZjmSBERcrkrz3L
 9165/3w+Mize3ZQAAAA==
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1717116259; l=1865;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=7xdTGOSOmIr2E7Iy/w6Rg7Grsm0W7C5NyiYeRCwJGRk=;
 b=K3GPmYx5N84KLR0/qh9q9edOJUNZHWejzXHxWhtyGcMGgZV+2MFcgwuA0kVuqTb6vgrnVVgB8
 YKELPWKjFKhA7C1N8mz+/fvBCPRfcx1VdeMBwpAHktyb8WCWem7PwzF
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received: by B4 Relay for nathanl@linux.ibm.com/20230817 with
 auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Reply-To: nathanl@linux.ibm.com
Cc: Breno Leitao <leitao@debian.org>, Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Smatch warns:

  arch/powerpc/kernel/rtas.c:1932 __do_sys_rtas() warn: potential
  spectre issue 'args.args' [r] (local cap)

The 'nargs' and 'nret' locals come directly from a user-supplied
buffer and are used as indexes into a small stack-based array and as
inputs to copy_to_user() after they are subject to bounds checks.

Use array_index_nospec() after the bounds checks to clamp these values
for speculative execution.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Reported-by: Breno Leitao <leitao@debian.org>
---
Based on a change originally submitted by Breno Leitao in 2018:

https://lore.kernel.org/linuxppc-dev/1534876926-21849-1-git-send-email-leitao@debian.org/

I've used a Reported-by: tag to credit Breno, let me know if you would
prefer a different tag (perhaps Co-developed-by?)
---
 arch/powerpc/kernel/rtas.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 8064d9c3de86..f7e86e09c49f 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -19,6 +19,7 @@
 #include <linux/lockdep.h>
 #include <linux/memblock.h>
 #include <linux/mutex.h>
+#include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/reboot.h>
@@ -1916,6 +1917,9 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 	    || nargs + nret > ARRAY_SIZE(args.args))
 		return -EINVAL;
 
+	nargs = array_index_nospec(nargs, ARRAY_SIZE(args.args));
+	nret = array_index_nospec(nret, ARRAY_SIZE(args.args) - nargs);
+
 	/* Copy in args. */
 	if (copy_from_user(args.args, uargs->args,
 			   nargs * sizeof(rtas_arg_t)) != 0)

---
base-commit: be2fc65d66e0406cc9d39d40becaecdf4ee765f3
change-id: 20240530-sys_rtas-nargs-nret-a188eaf5a500

Best regards,
-- 
Nathan Lynch <nathanl@linux.ibm.com>


