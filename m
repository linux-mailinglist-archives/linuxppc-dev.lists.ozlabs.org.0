Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 302467EFDE3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 06:25:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=szlX9FHH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXMfY0gl8z3vf8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 16:25:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=szlX9FHH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXMQT19pWz3cnK
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 16:14:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 83C93B82169;
	Sat, 18 Nov 2023 05:14:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 19F81C433CA;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700284470;
	bh=aIC9E4tY/InqP7Jbswo3qiaosrYC1FsMO3TRb+zYPiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=szlX9FHH/e+WAC42052EVahX2bs7aXuLF0x90EhvywfrUcNxJKsTchIB8+Wf1UKj/
	 c8Tr4ILK4JdpICGEpWR6tdhoB7pnfwK1NYSGnZQahDGA5MWp46TqXmvQXECZj+ifc6
	 uswdrmBINoOFc94YJgJ6ThBhWWsohaMvCti5jFZ2ZzOKAc/vcaBFYzN6JRZN99Kf4D
	 qUlkPJZg//oNGxfYpuQVZ/hBARGtH+v1LlGtk9WKc7dolwXscVz1SvI/VLuRWdof2x
	 5eZyq1d3Ea8gQA3vAcLvFkBaEdkfjz2TZzSEtQy7fOv9M5MkOV1SPrT/jxdKO7xfgJ
	 vAaIPZxzDewWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02B9FC5AD4C;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 17 Nov 2023 23:14:20 -0600
Subject: [PATCH v4 02/13] powerpc/rtas: Fall back to linear search on
 failed token->function lookup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231117-papr-sys_rtas-vs-lockdown-v4-2-b794d8cb8502@linux.ibm.com>
References:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
In-Reply-To:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700284468; l=2224;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=fqR135MhV0/mnXuWPlHbA4mjYrNmb6V6F7NtjxwwWz4=;
 b=1gj1CVGDNGrQ3ZnE1gH+Hb4OObRILu/JUtm/Vyb9MInRD39awwl4U0OVriXbAyMlX5jwCkaza
 9EZa2bNMQ0/DDRpYB6/oNo3QjnWU+JaDPwdG+JGyNPho6Rk4lL4MrVk
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Enabling any of the powerpc:rtas_* tracepoints at boot is likely to
result in an oops on RTAS platforms. For example, booting a QEMU
pseries model with 'trace_event=powerpc:rtas_input' in the command
line leads to:

  BUG: Kernel NULL pointer dereference on read at 0x00000008
  Oops: Kernel access of bad area, sig: 7 [#1]
  NIP [c00000000004231c] do_enter_rtas+0x1bc/0x460
  LR [c00000000004231c] do_enter_rtas+0x1bc/0x460
  Call Trace:
    do_enter_rtas+0x1bc/0x460 (unreliable)
    rtas_call+0x22c/0x4a0
    rtas_get_boot_time+0x80/0x14c
    read_persistent_clock64+0x124/0x150
    read_persistent_wall_and_boot_offset+0x28/0x58
    timekeeping_init+0x70/0x348
    start_kernel+0xa0c/0xc1c
    start_here_common+0x1c/0x20

(This is preceded by a warning for the failed lookup in
rtas_token_to_function().)

This happens when __do_enter_rtas_trace() attempts a token to function
descriptor lookup before the xarray containing the mappings has been
set up.

Fall back to linear scan of the table if rtas_token_to_function_xarray
is empty.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
Fixes: 24098f580e2b ("powerpc/rtas: add tracepoints around RTAS entry")
---
 arch/powerpc/kernel/rtas.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 1ad1869e2e96..f0051881348a 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -557,11 +557,21 @@ static const struct rtas_function *rtas_token_to_function(s32 token)
 		return NULL;
 
 	func = xa_load(&rtas_token_to_function_xarray, token);
+	if (func)
+		return func;
+	/*
+	 * Fall back to linear scan in case the reverse mapping hasn't
+	 * been initialized yet.
+	 */
+	if (xa_empty(&rtas_token_to_function_xarray)) {
+		for_each_rtas_function(func) {
+			if (func->token == token)
+				return func;
+		}
+	}
 
-	if (WARN_ONCE(!func, "unexpected failed lookup for token %d", token))
-		return NULL;
-
-	return func;
+	WARN_ONCE(true, "unexpected failed lookup for token %d", token);
+	return NULL;
 }
 
 /* This is here deliberately so it's only used in this file */

-- 
2.41.0

