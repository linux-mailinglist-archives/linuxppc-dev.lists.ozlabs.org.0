Return-Path: <linuxppc-dev+bounces-4367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B184C9F9A6C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Dec 2024 20:27:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YFHVc30z2z30Vw;
	Sat, 21 Dec 2024 06:27:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::ae"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734722840;
	cv=none; b=NomtuVr+3hprEjJ8yeF1qtW5NmMQz0RRtEXKUfG0fXS4YHY8kHzo+o/lnzwXJvPlzNRE2khkZRZZ7dlhqXBHFBStcUBo3pJ8v1tJR96ynlAJTxYlowvFFEDjCuW8rqUjnIHFlTqiAMDp8hOk00RIgpQCXdrMxhzYD7hBDFXbTysW9DdnUMHVMu2xuK4L5cJYcA92G7ld0HvAu3Kds2MtcxHqVMYFmpFB5I2KjDcddK2fcARTU/6Bnt9PglkqoonMdqRMiHwI5OCP4bXxscDwlQMCNWDvkamHUZn12hhUEQJ4guhBs2M3HGt0VQI/VzP4PNu3B9/yP7ddy6xwIHD+gg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734722840; c=relaxed/relaxed;
	bh=Pf34OojONVP7LNB6ICjh3yc06WTmNpDfYvUhl/RPtw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WV/jFQ53MlW4N5CHDuLUPzTJz4USc2jlrm2b7ShBto1UhBsi664GRF8HZozGIkQY2kDTgNM1QukEwWlJVnjbjaiHxYADHOrPWhe8TXHc1fGyc7xDMatF6BybksOezu5rki3NW/aKRqWDEW+soTGTKL8xuqAgritl7/N/jhU0Ul99G07POIogaVwVI0TJ7g11Nrm9kHJDztLIuBvTpV9bI4tjRQhkJEo0Lys00O/XNnaZlYTaXXgeKNK2C+9mDljmQs2FnJ2PFDkvW6hvg/DVr/w/GOl/6zV9qlwU6HqD5pNezcw3tFgx7RVC40oaM+58Rqc7rPDghV1QldMYrv/ppw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:203:375::ae; helo=out-174.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::ae; helo=out-174.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 557 seconds by postgrey-1.37 at boromir; Sat, 21 Dec 2024 06:27:11 AEDT
Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [IPv6:2001:41d0:203:375::ae])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YFHVR3yRlz2yGT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Dec 2024 06:27:09 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1734722241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pf34OojONVP7LNB6ICjh3yc06WTmNpDfYvUhl/RPtw4=;
	b=ua0rrXeEXXIylFNilJijvdYEJ3TVUFGo3mG+In874+Sr3zei8nhpqn+yDgn56KbOu4n2yC
	ND9VONiwM4+7+OUDocX6w2Q9+ITD+1Xk9eeAxZgbcwKmfBvmqZ4A4vgqWn0glesFPPfTUQ
	J9KOgrvIp+5arRFaiB/WBDBLNsl8pBU=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Hari Bathini <hbathini@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Baoquan He <bhe@redhat.com>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] powerpc: Use str_on_off() helper in check_cache_coherency()
Date: Fri, 20 Dec 2024 20:17:04 +0100
Message-ID: <20241220191705.1446-2-thorsten.blum@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/powerpc/kernel/setup-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
index 6fa179448c33..f7d7a93f07fc 100644
--- a/arch/powerpc/kernel/setup-common.c
+++ b/arch/powerpc/kernel/setup-common.c
@@ -834,8 +834,8 @@ static int __init check_cache_coherency(void)
 	if (devtree_coherency != KERNEL_COHERENCY) {
 		printk(KERN_ERR
 			"kernel coherency:%s != device tree_coherency:%s\n",
-			KERNEL_COHERENCY ? "on" : "off",
-			devtree_coherency ? "on" : "off");
+			str_on_off(KERNEL_COHERENCY),
+			str_on_off(devtree_coherency));
 		BUG();
 	}
 
-- 
2.47.1


