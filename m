Return-Path: <linuxppc-dev+bounces-2916-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C68949BEF2B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2024 14:36:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xk5np6zBQz2yxN;
	Thu,  7 Nov 2024 00:36:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.130.132.49
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730900174;
	cv=none; b=PJdD2rIVFwkxozGg+IoMwHd4a1+M61r/vh7jQN0Q71GLrl2Lm/nXhjHPBEBROc/kEB6AIGqLbpf/jbC7525FHMpUroNDkxSKGX675VSM8XLnjOaS9bukHlmSoYFfDMNyTiHFuDO3A5rOA3R7B3Ds6u4iOM6pAEfn61+5qQdtBhMsTv+hvY3t6tbn+i4yZ8JqAF84AexbnB/FYgpyRiQa094cOPVL6tsumJAukIUVb9txskXbeqrGpEafLLyeyosmViCBN8zrmVEWOtHVeACm0iQAV4ejMFGKFX5UXgtjsunDgdYVFpJ+Rh2RpORzu8dvGHVKoF5EW4W7D5g/AG9V6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730900174; c=relaxed/relaxed;
	bh=20jwimtIOlnS8RZTK/cESqk4DxFFHkZL/aLaDxatl+4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=mXmdeAKs8OQeigpUDzOu6Kp0hmR+Rk6D1n4tcuSWnll5EbHltQ/tzfZ5zXXfHc/yKZl1eNmTpB911H7joKhrgnFXBCn5CxoQgZqdBsjMlFe1s+210uFSpSAKY9K1WBf5LNuyW4q3Mn8auLS4gJ2WlG62xapr7uMRm8LK+zmrCbSQ2lcHuCzQucbVF0rszrb0FN58iuo/ly/tAQl9pHJOBgu/YSJ5ZFjnbRPjrlsctm1vgpjj84ktzJMKd8xRfO1cmwKRDxJjRiYQhyTQTb7V9DQd7pZwNufNVNvDK9zWu1OO98ZjXqmB40JAU7NejNHLgYTpeZYF8QVAQC1E/aRv8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=pass (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=gauss.telenet-ops.be
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=gauss.telenet-ops.be (client-ip=195.130.132.49; helo=gauss.telenet-ops.be; envelope-from=geert@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 575 seconds by postgrey-1.37 at boromir; Thu, 07 Nov 2024 00:36:13 AEDT
Received: from gauss.telenet-ops.be (gauss.telenet-ops.be [195.130.132.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xk5nn1Hqrz2yV6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 00:36:12 +1100 (AEDT)
Received: from baptiste.telenet-ops.be (baptiste.telenet-ops.be [IPv6:2a02:1800:120:4::f00:13])
	by gauss.telenet-ops.be (Postfix) with ESMTPS id 4Xk5ZY3LNNz4x2wW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2024 14:26:29 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:2473:2222:191a:9acf])
	by baptiste.telenet-ops.be with cmsmtp
	id ZRSS2D00e52sj0y01RSTcZ; Wed, 06 Nov 2024 14:26:28 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t8g2x-006MWd-2p;
	Wed, 06 Nov 2024 14:26:26 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1t8g3G-006VYZ-OI;
	Wed, 06 Nov 2024 14:26:26 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Geoff Levand <geoff@infradead.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] powerpc/ps3: Mark ps3_setup_uhc_device() __init
Date: Wed,  6 Nov 2024 14:26:25 +0100
Message-Id: <31fe9435056fcfbf82c3a01693be278d5ce4ad0f.1730899557.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.2 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

ps3_setup_uhc_device() is only called from ps3_setup_ehci_device() and
ps3_setup_ohci_device(), which are both marked __init.  Hence replace
the former's __ref marker by __init.

Note that before commit bd721ea73e1f9655 ("treewide: replace obsolete
_refok by __ref"), the function was marked __init_refok, which probably
should have been __init in the first place.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/powerpc/platforms/ps3/device-init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index b18e1c92e554ce87..61722133eb2d3f99 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -178,7 +178,7 @@ static int __init ps3_setup_gelic_device(
 	return result;
 }
 
-static int __ref ps3_setup_uhc_device(
+static int __init ps3_setup_uhc_device(
 	const struct ps3_repository_device *repo, enum ps3_match_id match_id,
 	enum ps3_interrupt_type interrupt_type, enum ps3_reg_type reg_type)
 {
-- 
2.34.1


