Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8526D7E260B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 14:49:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=se2hWWu7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPCPc3HYyz3dTs
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 00:49:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=se2hWWu7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPCHF07xbz3c5k
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 00:43:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0BC7D60F86;
	Mon,  6 Nov 2023 13:43:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB412C433CB;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699278209;
	bh=9cAHuCEqfJgpkGKOzKqx+ICMmM+tRSs009/M3ecDsOo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=se2hWWu7Hb5N3far/UOk5mz8OMbVziEQeZEozh2skdKiQ+Cs2NMnrKCUIlBr3Z8bd
	 2pbg3ev79OGidbcjNPpNvWHihQLEdVodJdo9vPA2xs1jTm2Q+vcz3bhlu6hOp9PAQ+
	 U+mowPcfbby+yiFrLoGEgOOwLDJycbW5i+NFQRhpf6VREHBs5+gGPj/DyOJ7tn8XRB
	 dhuHCg9LwzRiUmKuHYLiturMBp7gFqqEspvAlahL8OP0eblFXyn5PBaYWHi5wYBq51
	 aUJJpiDJIItoT4I1jixQct5U/QU9VzKC6z/ckIWdW/wquhlUIRhP2GueJZwqkQ8LVR
	 QK4yu8Q8xXbEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96603C4167D;
	Mon,  6 Nov 2023 13:43:29 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Mon, 06 Nov 2023 07:42:55 -0600
Subject: [PATCH 3/7] powerpc/rtas: Drop declaration of undefined
 call_rtas() function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231106-rtas-trivial-v1-3-61847655c51f@linux.ibm.com>
References: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
In-Reply-To: <20231106-rtas-trivial-v1-0-61847655c51f@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1699278208; l=819;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=UucQCjGJjbfL7SCFKJ6ZxnKyesG0uLC3Uuvu74A3Tv4=;
 b=CQbUgxnI9zw0h7Y5LYrKLnfGzCKSz1ZDD/0hSmycp+3MW0slUDRwdn1VF8R06HkmuKZFqgvGb
 X+Fk3lB00t+AgC7i4qyZu4Hmq+yk4uA5AvtWv1JhIdeAUwlwCy36xmK
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

The call_rtas() function has never been a part of arch/powerpc, and
its implementation was removed from arch/ppc by 0a26b1364f14 ("ppc:
Remove CHRP, POWER3 and POWER4 support from arch/ppc").

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

