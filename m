Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43E23831C63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jan 2024 16:26:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SVW7z7Cg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TG66G1HTJz3c1C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 02:26:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SVW7z7Cg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TG65Q1PtJz3bq0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 02:25:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B9C04CE1FBC;
	Thu, 18 Jan 2024 15:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1011DC43390;
	Thu, 18 Jan 2024 15:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705591542;
	bh=bv8EIfucd5lBrjjXVVDPU3FSiLtb8atCLikYS+cOi0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=SVW7z7Cg7uBzrupT3P+M0huZwscyqIFAUvkR8lMUWOI1kMhI7WutgJYTNKa60UXEl
	 3igECw7aCQd7Y3s8DQX7J8cYc1fkFRZ3AWN5yDVkYHsD9TcUrNh5fApx9L9yE2W8xq
	 1tzr6fKrAF4x42Q7G+/IPIVrc142OiEJeLuInikONOBwdJqp73peJ6celGZt2u2Htl
	 6C07wt2UWaOQx1GnpWXDj55qj3aEyEXdo3PtOvnH5tEIUomOwMKcmfqAbV2p4aQiFN
	 wtKdVNAlKi8wlepYq07zK8ejC56R/odwfe/SJvrszewChOnZ9etUOByQMF/u84jF85
	 Lro7blXHXaomA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECCAEC47DAF;
	Thu, 18 Jan 2024 15:25:41 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 18 Jan 2024 09:25:12 -0600
Subject: [PATCH RFC 1/5] dump_stack: Make arch description buffer
 __ro_after_init
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20240118-update-dump-stack-arch-str-v1-1-5c0f98d017b5@linux.ibm.com>
References:  <20240118-update-dump-stack-arch-str-v1-0-5c0f98d017b5@linux.ibm.com>
In-Reply-To:  <20240118-update-dump-stack-arch-str-v1-0-5c0f98d017b5@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, 
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
 Brian King <brking@linux.ibm.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 John Ogness <john.ogness@linutronix.de>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Petr Mladek <pmladek@suse.com>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>, 
 Steven Rostedt <rostedt@goodmis.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1705591541; l=904;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=uGRC5bEXAZpqbl74Y43nE5tPlwjA0DDYCHWXiMdO7oY=;
 b=mRB3b+vZUc4j1CZuAqps+dMLW3dhH0rtknvVIhYr75cbUsWxHXQzwL1XHsgm2Dka6lOqHqzli
 tuQArMMkTQ6A8GpmfpD4X7jCoFyeMG5WzBkP2vlcjAz4E3Oo1hWIy2X
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

The static hardware description buffer is populated by arch code
during boot and should not change afterwards, so mark it
__ro_after_init.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 lib/dump_stack.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/lib/dump_stack.c b/lib/dump_stack.c
index 83471e81501a..1057f102f6f2 100644
--- a/lib/dump_stack.c
+++ b/lib/dump_stack.c
@@ -6,6 +6,7 @@
 
 #include <linux/kernel.h>
 #include <linux/buildid.h>
+#include <linux/cache.h>
 #include <linux/export.h>
 #include <linux/sched.h>
 #include <linux/sched/debug.h>
@@ -15,7 +16,7 @@
 #include <linux/utsname.h>
 #include <linux/stop_machine.h>
 
-static char dump_stack_arch_desc_str[128];
+static char dump_stack_arch_desc_str[128] __ro_after_init;
 
 /**
  * dump_stack_set_arch_desc - set arch-specific str to show with task dumps

-- 
2.43.0

