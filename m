Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E332D7EB579
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Nov 2023 18:24:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rd1GtQc9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVCpJ60jwz3dHp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 04:24:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rd1GtQc9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVCmN3l9zz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Nov 2023 04:22:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 16AC1CE193E;
	Tue, 14 Nov 2023 17:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51737C433C8;
	Tue, 14 Nov 2023 17:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699982561;
	bh=DfCgoKwag1m35T0OENERhTO2gdvwKnY6rOJWWHx4BYs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rd1GtQc91dqnKz+RuxwUEmEaW7c0Gipo84hYouGBIzZY2Oi437P0jYJQ4xiS14MdG
	 o0k1b2kQY6gX5vwBw3rkTySdAwHW2QukQbQCJF8UpkMw2i4UTyoTMJf32BFK22b2PY
	 KppgI28wNkzX6VObw+H6EFvDVdgW3npXr4KEIChygx0oV4SCOUdbOn4WKt6cBN6Za2
	 ARbhDAROiVM+gOBFxM2hKtXoa+I2/hJqTiOOrYj+Fid3dXvtka1j6CQYYyeaR5G/fh
	 xW3+zD7T4fsAOfVB3dw/eLtHnZaL4ZGHvUrmwUGmRXZli0FkWaff9JlTw/1jM6sooy
	 eIp6SL37X1MjA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE2BC4167D;
	Tue, 14 Nov 2023 17:22:41 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 14 Nov 2023 11:22:25 -0600
Subject: [PATCH v2 1/5] powerpc/rtas: Drop declaration of undefined
 call_rtas() function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231114-rtas-trivial-v2-1-59cbab208d57@linux.ibm.com>
References: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
In-Reply-To: <20231114-rtas-trivial-v2-0-59cbab208d57@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699982560; l=826;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=yqYsNNWpscBBnfwIq3gGBTDwPfEYG5PijEQAt12Z9Ug=;
 b=bb4l3eSK0ecBknMjqfI6rvh+mZO6l0BVH3Bpv+qtwmpkzjzIS31A+yj6l5qtnW63iemnV2tmA
 kYgd3SJOn8kBGeue8Cp/Qd/lXJzJKBw4XtjseLOk4dyiAI/FTNITYOH
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

The call_rtas() function has never been a part of arch/powerpc, and
its implementation was removed from arch/ppc by commit 0a26b1364f14
("ppc: Remove CHRP, POWER3 and POWER4 support from arch/ppc").

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/asm/rtas.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index c697c3c74694..3bf7f0a4b07e 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -542,8 +542,6 @@ static inline void pSeries_coalesce_init(void) { }
 static inline void rtas_initialize(void) { }
 #endif
 
-extern int call_rtas(const char *, int, int, unsigned long *, ...);
-
 #ifdef CONFIG_HV_PERF_CTRS
 void read_24x7_sys_info(void);
 #else

-- 
2.41.0

