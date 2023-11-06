Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC8177E25F3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:46:45 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eeZHRk1N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPCLq5PFbz3dL1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:46:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=eeZHRk1N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPCHD5n6sz3c5H
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:43:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8C082CE0CFB;
	Mon,  6 Nov 2023 13:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1048C433C9;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699278209;
	bh=ZLJTGr1hINH/9KcIuL9KqapOBOkoy27BscHYYShS01E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eeZHRk1NIt9ngFBSe5eKaUfiGvaYmsvCjDGvxxtHm4PsK6W/dgs89EEDHA4ulytrb
	 l6nl0VVn83fP9R4Ac+bVQ0L/Z+C73YI3hGSrDSidX7mAOYMHRheNOtTpK5jVS52HoB
	 RxrxEi6K+hXJ0BhEgs9/iaMNFLxaOUHs9aEUAnMYqe6rAs3TQaIljwb1Z0gwNw63KD
	 faA9U4qFFi4Aj/OcI+WoOYpwnElcZymwwZeoXkYlz86phU4xkkOqlgnZ3+gOGQMHx+
	 QRayU9kMavI7OvE1FvBk2j9vZDfGs60Lldd04l8P9El1TH7oJC5Y5gYQYfGitj7Dzx
	 a6YoNzPC5FAng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABABEC4167B;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Nov 2023 07:42:56 -0600
Subject: [PATCH 4/7] powerpc/rtas: Remove unused rtas_service_present()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-rtas-trivial-v1-4-61847655c51f@linux.ibm.com>
References: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
In-Reply-To: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699278208; l=1479;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=DZvLOdDIHUxKijnpi1Z0q0XnG4VEsIXvpzPh6vLb/O4=;
 b=Zx9ZE6MAsw4TvhGqLNJy0o6cspILWbNDy5vO+Pw8Zbyyjddhz2gRQTPq9kL292s2G/YXSaBGW
 9hEDpqog0BIBnqnKf4011izANZbfeoA2s80mgbxsVMUYxCu3nMYpiNU
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

rtas_service_present() has no more users.

rtas_function_implemented() is now the appropriate API for determining
whether a given RTAS function is available to call.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h | 1 -
 arch/powerpc/kernel/rtas.c      | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 3bf7f0a4b07e..c6568a647cd0 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -409,7 +409,6 @@ static inline bool rtas_function_implemented(const rtas_fn_handle_t handle)
 	return rtas_function_token(handle) != RTAS_UNKNOWN_SERVICE;
 }
 extern int rtas_token(const char *service);
-extern int rtas_service_present(const char *service);
 extern int rtas_call(int token, int, int, int *, ...);
 void rtas_call_unlocked(struct rtas_args *args, int token, int nargs,
 			int nret, ...);
diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index eddc031c4b95..b5b340a91157 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -900,11 +900,6 @@ int rtas_token(const char *service)
 }
 EXPORT_SYMBOL_GPL(rtas_token);
 
-int rtas_service_present(const char *service)
-{
-	return rtas_token(service) != RTAS_UNKNOWN_SERVICE;
-}
-
 #ifdef CONFIG_RTAS_ERROR_LOGGING
 
 static u32 rtas_error_log_max __ro_after_init = RTAS_ERROR_LOG_MAX;

-- 
2.41.0

