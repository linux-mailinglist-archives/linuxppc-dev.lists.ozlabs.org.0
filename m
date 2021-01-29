Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11FA9308A11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 16:48:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DS1vc6gcpzDsWQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 02:48:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=aKqrDMWM; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DS1hk139szDrhh
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 02:38:46 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 969DC64E07;
 Fri, 29 Jan 2021 15:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611934723;
 bh=8eU1kZakRpD69eguGY0XAU41DgXoTE2EH38U74TnHSQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aKqrDMWM2ApQmVBZt/OCtWD8nzpZF96fC+1iREpuofOTC2PZcIBy5/o2PvwWzK/Hu
 CtWu5odbMpXnsZzUpz1JEIM+VIL5Ii5/vSlPrfJI0L8rmPQyCdkkc0LUaVp7/PhAfJ
 hhY/R3PVfQTw4jr337Uh1HbyuGu3drxFqm/MGKd2nMhQB9P9LxcaFz9nMk1Izw62yH
 5tA99dEgBSHoqj/7055vFLoZiL8aHcUA0imxD2vu+w4KYRF408FjJqKAJGR8x7d4LO
 BoEAtway7vn9S+NHoKKhHHvNsDKWfZ51mIm6epYjHTmGaUEPXdqVrMvgooC8ECN4ue
 7U/JqkmmGX4Vw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 09/12] selftests/powerpc: Only test lwm/stmw on
 big endian
Date: Fri, 29 Jan 2021 10:38:28 -0500
Message-Id: <20210129153831.1592769-9-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210129153831.1592769-1-sashal@kernel.org>
References: <20210129153831.1592769-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Libor Pechacek <lpechacek@suse.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit dd3a44c06f7b4f14e90065bf05d62c255b20005f ]

Newer binutils (>= 2.36) refuse to assemble lmw/stmw when building in
little endian mode. That breaks compilation of our alignment handler
test:

  /tmp/cco4l14N.s: Assembler messages:
  /tmp/cco4l14N.s:1440: Error: `lmw' invalid when little-endian
  /tmp/cco4l14N.s:1814: Error: `stmw' invalid when little-endian
  make[2]: *** [../../lib.mk:139: /output/kselftest/powerpc/alignment/alignment_handler] Error 1

These tests do pass on little endian machines, as the kernel will
still emulate those instructions even when running little
endian (which is arguably a kernel bug).

But we don't really need to test that case, so ifdef those
instructions out to get the alignment test building again.

Reported-by: Libor Pechacek <lpechacek@suse.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Tested-by: Libor Pechacek <lpechacek@suse.com>
Link: https://lore.kernel.org/r/20210119041800.3093047-1-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../testing/selftests/powerpc/alignment/alignment_handler.c  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index 169a8b9719fb9..4f8335e0c9858 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -384,7 +384,6 @@ int test_alignment_handler_integer(void)
 	LOAD_DFORM_TEST(ldu);
 	LOAD_XFORM_TEST(ldx);
 	LOAD_XFORM_TEST(ldux);
-	LOAD_DFORM_TEST(lmw);
 	STORE_DFORM_TEST(stb);
 	STORE_XFORM_TEST(stbx);
 	STORE_DFORM_TEST(stbu);
@@ -403,7 +402,11 @@ int test_alignment_handler_integer(void)
 	STORE_XFORM_TEST(stdx);
 	STORE_DFORM_TEST(stdu);
 	STORE_XFORM_TEST(stdux);
+
+#ifdef __BIG_ENDIAN__
+	LOAD_DFORM_TEST(lmw);
 	STORE_DFORM_TEST(stmw);
+#endif
 
 	return rc;
 }
-- 
2.27.0

