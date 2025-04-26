Return-Path: <linuxppc-dev+bounces-8007-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B769A9D850
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 08:20:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zl02S5lCxz2xlK;
	Sat, 26 Apr 2025 16:20:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745648448;
	cv=none; b=TYbUJEYhZ5wXLW+oB1aYP0o8tCNFQuTOSPOpUe3PLrMB9PNgKWl7PkLNMGHebUf8m+qdPdBQo1cZBdRaiY4dt7OkcOqKO14PvPq0qsh4ncvoQMgFWv3ceV5UpcTxfiSENrIE1AC1I7KPsdT+PfUSfe68/wqG2feh0KxPaK0EpxWXf0jS/93Egsn110QSQY6/vFAiUkd2pp/3oOyKI6QFfTMBK+J+tqDAsp2vQbN+zDgmCI6FkaR4I2guEQ+pXO/yIHU0/WwewgqCCSYuRe+mV+7BLxi2CU3jiXcTvfhUkOXv+ys/Wohi/BVPttwyfCFkTZc8xLCxOtJIhrIYG+Brig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745648448; c=relaxed/relaxed;
	bh=tIyeZ4J0ITuIfGNBEjwEzxbhDS+oF6WcKAJBTAprjgI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ldRJi7AS6vPlQYPMlPWVcUCs3UcprlVh6+VyT7kYjOCdhZtoh2eHqjhsOSIaXmUQZXFttB5sdQWAOC5TrPtGoJcJuAfV+lg7lECihFkCDP5by0gV64QtmC4/K6n/RvQi33/QoWwHFZv4SBmjAQt5DcfhmV0pa/3vXV4ztsESUQyrax+65g6qin5cfOc7MdRXSJdsWgKp7IthTnXIHVyqvPkE/OGcFMoz12fKnJxFTW6XlUiQoNRYPGgUY1mQLPQ3YVGwJLYEK+VwP7NaiEJGWGBKPJqP33CYusI5KVVRRidCNSdcWxqbgRZ8Fr5WFezSwiONSZhWXan4gLNaNtzivA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J0CKb8Gh; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=J0CKb8Gh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zl02R4ypJz2xk5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 16:20:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B1B5D4A3F4;
	Sat, 26 Apr 2025 06:20:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553F2C4CEE2;
	Sat, 26 Apr 2025 06:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745648445;
	bh=EuZdc4J+N9m/JbbBsyBVqTEk6tsczDB+aFkCtyPfgrg=;
	h=From:To:Cc:Subject:Date:From;
	b=J0CKb8GhCyu89m8WLk6wgl8fGUla0vi9Pe2HOsorNfOjSAM5L4kLv1Q3YXYknTFbp
	 FuoUq+2gNoShdMjnPjkLgKTaxMp6wmoyzM0xUwQGeJ+UrGR9v57r4pO19kQwyI0vMB
	 n9rGm/xINtg9G32RPmFNsKpzB2Ad8QESzzIbxiOA47OwNf11o6lN5P83wQIbrPcTeg
	 o+Sv2Jyy6APE/QqvueAqvkzynle5Y/nmSskgrWgJDGq8edIj1TJLSXG4KJh0iffQ+l
	 UDgsrDgM/Dotxtt3dHg0kSfd6+P0mDtmAhqTk3itKXQIxSZovAbj3Q6Bz80PL8wPih
	 m3xUeCtmY0aWA==
From: Kees Cook <kees@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Kees Cook <kees@kernel.org>,
	Sean Anderson <sean.anderson@linux.dev>,
	Camelia Groza <camelia.groza@nxp.com>,
	"David S. Miller" <davem@davemloft.net>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	"Dr. David Alan Gilbert" <linux@treblig.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] soc: fsl: qbman: Remove const from portal->cgrs allocation type
Date: Fri, 25 Apr 2025 23:20:41 -0700
Message-Id: <20250426062040.work.047-kees@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1669; i=kees@kernel.org; h=from:subject:message-id; bh=EuZdc4J+N9m/JbbBsyBVqTEk6tsczDB+aFkCtyPfgrg=; b=owGbwMvMwCVmps19z/KJym7G02pJDBk81ZZf9c6mN37K3TlZ8NlKx19Hu/4zST1oeHL4eaOol 9vC7k79jlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIkcD2RkeHJ+ypGWe59nP5wo FDX9f2tg8tH/+yL5I6/UOM/7PS33dSnDP0XbhDsLHsx+rCsgm1F1sj7zepPEE/sTk7rtb7hJvly 7gR8A
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

In preparation for making the kmalloc family of allocators type aware,
we need to make sure that the returned type from the allocation matches
the type of the variable being assigned. (Before, the allocator would
always return "void *", which can be implicitly cast to any pointer type.)

The assigned type is "struct qman_cgrs *", but the returned type,
while technically matching, is const qualified. As there is no general
way to remove const qualifiers, adjust the allocation type to match
the assignment.

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Sean Anderson <sean.anderson@linux.dev>
Cc: Camelia Groza <camelia.groza@nxp.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-arm-kernel@lists.infradead.org>
---
 drivers/soc/fsl/qbman/qman.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/fsl/qbman/qman.c b/drivers/soc/fsl/qbman/qman.c
index 4dc8aba33d9b..9be240999f87 100644
--- a/drivers/soc/fsl/qbman/qman.c
+++ b/drivers/soc/fsl/qbman/qman.c
@@ -1270,7 +1270,7 @@ static int qman_create_portal(struct qman_portal *portal,
 	qm_dqrr_set_ithresh(p, QMAN_PIRQ_DQRR_ITHRESH);
 	qm_mr_set_ithresh(p, QMAN_PIRQ_MR_ITHRESH);
 	qm_out(p, QM_REG_ITPR, QMAN_PIRQ_IPERIOD);
-	portal->cgrs = kmalloc_array(2, sizeof(*cgrs), GFP_KERNEL);
+	portal->cgrs = kmalloc_array(2, sizeof(*portal->cgrs), GFP_KERNEL);
 	if (!portal->cgrs)
 		goto fail_cgrs;
 	/* initial snapshot is no-depletion */
-- 
2.34.1


