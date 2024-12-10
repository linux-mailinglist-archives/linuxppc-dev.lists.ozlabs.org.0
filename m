Return-Path: <linuxppc-dev+bounces-3931-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A9D9EBBC0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2024 22:21:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y7BVl2z40z2xxt;
	Wed, 11 Dec 2024 08:21:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733865679;
	cv=none; b=OoHA6VHtnaT69NfVNUmgbuvkk0aRS2dFr6UungXcY1iCG0Sh83QHvQPizmdtQXx3OnKx5Qh89PQVdb+6QRZLhVMXCRfH2QWsuLZ7Nb/bUbnKEtG9zgZ5Uqbx7OX7BGQTdgEXoglBgwMOhuXv/u1wIYKqDWPO3iS/04dqiLJrjU9WWdY6lrn9rWDQ3gaD4nUXqR13jbWo1zZdDwMp2+ZVVuejE3tPCnqd5XvwtrE1I7snU2Z2GKoErM6fK4XZcvqrTLf2+aO91LF/kuyIMihYCzP1bi3ZetTg5znkx27476R4ZytEAxQzobfqSQb/iZDuGrTTJNClosUaDZgAWTxThA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733865679; c=relaxed/relaxed;
	bh=Pf34OojONVP7LNB6ICjh3yc06WTmNpDfYvUhl/RPtw4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bznbDawEeXmmd4PToqPDPBuYlag/6Iit78aWpoWTmQb/rL7b69Q2Asy0gs4wDngHHdWrxzKFPDVSagpJEwDjLCB6ZMpD+CartN6T/bsKR513DY46uAI+0rZmWsqmzA8B47Ev6QoEF9F3QI9T0LiWNKT6T+lwcSWOaI+47vdufUvr8SMQKFWp1NzxTD6zEvPXqnDlDu5xwyk6/jqTLXPagWOKMuT2s/kXoTkeyVztwLPdq+ASX5aZDYsQf4jYOrSqRGMAHeJiwz/aSzIRdEbF/GTJ1VablDsGrMnU4rT+33dgOIKzRN9OrgpixgVAyppIqnhk4Hy2x32zSVfc6ZYz4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::b0; helo=out-176.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b0; helo=out-176.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-176.mta0.migadu.com (out-176.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y7BVc1V1hz2xrJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Dec 2024 08:21:09 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1733865641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Pf34OojONVP7LNB6ICjh3yc06WTmNpDfYvUhl/RPtw4=;
	b=MVdkDVApxaLai0rN0j7l81NBAOnxNZIPit2MeqnKmkMERxSYjtN6RIcVMzAD0F5RDMThu6
	qbcqeQfRcxiwyZfGdcaHNlpYbPi2MqFTsETP1rxIZXPLPFhwDzWXLzZiGiSAK09FK0EWHc
	QZxEz4uErRWxZmRn618eLxQyfQHsRIE=
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
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: Use str_on_off() helper in check_cache_coherency()
Date: Tue, 10 Dec 2024 22:20:07 +0100
Message-ID: <20241210212009.258990-2-thorsten.blum@linux.dev>
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


