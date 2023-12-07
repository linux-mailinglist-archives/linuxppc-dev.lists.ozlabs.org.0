Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 094298096B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 00:42:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HO9pckOt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmW633MV5z3dK5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 10:42:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HO9pckOt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmW1V3rrGz3cGL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 10:38:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 333626223C;
	Thu,  7 Dec 2023 23:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1932C433CA;
	Thu,  7 Dec 2023 23:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701992314;
	bh=Zoxzxiw8GD+0wIrOLoWKqVMwe3HmRaqK0uwSwCSq7oE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=HO9pckOtDeD54/KVCwadFOA+4eYrOEfGMgJ9X5/Ucc4AWRPIBHN9czcswSejqc8vN
	 t4ZFL0pZyuhnP4LpYaFLjTUt58tq7QgUS6bzEknvO1MkAjP+S61ruvbAZrk1w/8oag
	 oTU0cSHS87eoIlKxJvvIDUuUGnh9u9Px+gIt8hbqjucSjUsKIG/V0efVV4kRUwJi12
	 GiQWnVvqN/6g5OdoOIbNz/tJLM+7CWwl1JdCFXQ34EwgBhEr4qdttFr+zGDeaHeIjx
	 70C+MaqVzSTZyBWzkBLI1/66zS0zS2O+HbNoew7cH/MD9vH3StBceR7EnD71yDndGI
	 6wEuiqIo9mmzA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA675C46CA3;
	Thu,  7 Dec 2023 23:38:34 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 07 Dec 2023 17:35:41 -0600
Subject: [PATCH v5 02/13] powerpc/rtas: Add for_each_rtas_function()
 iterator
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231207-papr-sys_rtas-vs-lockdown-v5-2-2ce965636a58@linux.ibm.com>
References:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
In-Reply-To:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701992313; l=1528;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=NWsKJAvOyJ6+fcTpCAe3hP9I68yS9JzeFyNNJdqL2GM=;
 b=t3rePbLwg/TsE/GU2yOBX8+1bShA6minwRF868QjivL/AqvPHfFBW+psT1ZHLnwGpnAJyNMWQ
 TCA2BjQfM1UCUaMAeTpY5RVz/4yJCd7UQwuzFD2pBCM2BbrOn0WLbHC
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Add a convenience macro for iterating over every element of the
internal function table and convert the one site that can use it. An
additional user of the macro is anticipated in changes to follow.

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index ce37dc9860ef..ae9b10c954a1 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -454,6 +454,11 @@ static struct rtas_function rtas_function_table[] __ro_after_init = {
 	},
 };
 
+#define for_each_rtas_function(funcp)                                       \
+	for (funcp = &rtas_function_table[0];                               \
+	     funcp < &rtas_function_table[ARRAY_SIZE(rtas_function_table)]; \
+	     ++funcp)
+
 /*
  * Nearly all RTAS calls need to be serialized. All uses of the
  * default rtas_args block must hold rtas_lock.
@@ -525,10 +530,10 @@ static DEFINE_XARRAY(rtas_token_to_function_xarray);
 
 static int __init rtas_token_to_function_xarray_init(void)
 {
+	const struct rtas_function *func;
 	int err = 0;
 
-	for (size_t i = 0; i < ARRAY_SIZE(rtas_function_table); ++i) {
-		const struct rtas_function *func = &rtas_function_table[i];
+	for_each_rtas_function(func) {
 		const s32 token = func->token;
 
 		if (token == RTAS_UNKNOWN_SERVICE)

-- 
2.41.0

