Return-Path: <linuxppc-dev+bounces-114-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 715EA95464A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2024 11:56:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aXlIJ5Or;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlcnq0khqz2yLg;
	Fri, 16 Aug 2024 19:56:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aXlIJ5Or;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=alexs@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wlc9L2Nzjz2xst
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2024 19:28:06 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F64E62128;
	Fri, 16 Aug 2024 09:28:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04744C32782;
	Fri, 16 Aug 2024 09:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723800482;
	bh=wSUG6N0b072xD6DUFsCdzV84E/s31xj3kcg6qaEVlJk=;
	h=From:To:Cc:Subject:Date:From;
	b=aXlIJ5OrC84qslmThKj7xICdmqYSO20BsMqjM5iD/2rYV7QECLQVrqjo6Rl8ImC6P
	 OXGhi8nDwUhBSh0DqqgZVIGedy1053Nn1p8KDRl1Z3GG9AL+6A4CZo31fwo6eMLgY6
	 F8SMXlNokEo8p0Xgpo4Eiirgw7LmPq/WycQIy5dkTbbZyxdCWqyDtAxOH6pjN0d+9B
	 P/Btx23deA/QEDgbyscr0jU+DCoTs0ApXYrH8Pn40zl6Wvu4eL4oj90dOdGeywiJ3w
	 +Lwvt+uQEFasExrXQsa+OFPcKKyuPa0BZcPVnlFzoFSOsvQ5dHCflwdgz0LBgNXwc7
	 33HD+WNcrbyEw==
From: alexs@kernel.org
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org (open list)
Cc: Alex Shi <alexs@kernel.org>
Subject: [PATCH] KVM: PPC: remove unused varible
Date: Fri, 16 Aug 2024 17:33:12 +0800
Message-ID: <20240816093313.327268-1-alexs@kernel.org>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alex Shi <alexs@kernel.org>

During build testing, we found a error:
/arch/powerpc/kvm/book3s_hv.c:4052:17: error: variable 'loops' set but not used [-Werror,-Wunused-but-set-variable]
                unsigned long loops = 0;
1 error generated.

Remove the unused variable could fix this.

Signed-off-by: Alex Shi <alexs@kernel.org>
Cc: kvm@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/book3s_hv.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8f7d7e37bc8c..ac27ca4385e4 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4049,7 +4049,6 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 	/* Return to whole-core mode if we split the core earlier */
 	if (cmd_bit) {
 		unsigned long hid0 = mfspr(SPRN_HID0);
-		unsigned long loops = 0;
 
 		hid0 &= ~HID0_POWER8_DYNLPARDIS;
 		stat_bit = HID0_POWER8_2LPARMODE | HID0_POWER8_4LPARMODE;
@@ -4061,7 +4060,6 @@ static noinline void kvmppc_run_core(struct kvmppc_vcore *vc)
 			if (!(hid0 & stat_bit))
 				break;
 			cpu_relax();
-			++loops;
 		}
 		split_info.do_nap = 0;
 	}
-- 
2.43.0


