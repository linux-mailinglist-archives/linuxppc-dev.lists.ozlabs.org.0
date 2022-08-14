Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E7C5924AD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 18:35:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5NMG40Y2z3fNq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:35:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TdbP4Gwg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TdbP4Gwg;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5NBx2c6lz3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 02:28:41 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 0B160B80B7E;
	Sun, 14 Aug 2022 16:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1636C433B5;
	Sun, 14 Aug 2022 16:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494517;
	bh=Wvy1Op3i9vLGrYZm4IwP35X3KGCfoZ+j8ssDJnCh2xw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TdbP4GwgMVCKwY2nrPm7AU31XMYOgwQvlD0r3DtBq4/UQhGBMeZmlhWdglZCVnYPO
	 T9IM2xIgomc114YOX4MRC+ClCRp7i7qdPsRr6OyaFe80G4o6t4oKNJtYcHqcyJmA4b
	 uqJSHQDNOfFjyCr1YtekUyKFBmQoz6jRbjDWB7ZLkTPlrK7Z4bKKZDwOI2SzWVyYQe
	 MIy7OE0ovmO3s2kuUMfFOvcvhokEgkQbbe8c/jwsjByCbOUWWZVHKtA/k1eAqxsCIJ
	 rpMCfjdcZ4C89QfaelJfTXdB5rgMS04hncLx1hPkxYIgnE8L+LyWG+tEiMIQPjKNEv
	 R02ULkBkL3W/A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.4 02/16] tty: serial: Fix refcount leak bug in ucc_uart.c
Date: Sun, 14 Aug 2022 12:28:17 -0400
Message-Id: <20220814162833.2398478-2-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814162833.2398478-1-sashal@kernel.org>
References: <20220814162833.2398478-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Liang He <windhl@126.com>, Timur Tabi <timur@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-serial@vger.kernel.org, jirislaby@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Liang He <windhl@126.com>

[ Upstream commit d24d7bb2cd947676f9b71fb944d045e09b8b282f ]

In soc_info(), of_find_node_by_type() will return a node pointer
with refcount incremented. We should use of_node_put() when it is
not used anymore.

Acked-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Liang He <windhl@126.com>
Link: https://lore.kernel.org/r/20220618060850.4058525-1-windhl@126.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/tty/serial/ucc_uart.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/tty/serial/ucc_uart.c b/drivers/tty/serial/ucc_uart.c
index a0555ae2b1ef..181d55e0c60f 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1141,6 +1141,8 @@ static unsigned int soc_info(unsigned int *rev_h, unsigned int *rev_l)
 		/* No compatible property, so try the name. */
 		soc_string = np->name;
 
+	of_node_put(np);
+
 	/* Extract the SOC number from the "PowerPC," string */
 	if ((sscanf(soc_string, "PowerPC,%u", &soc) != 1) || !soc)
 		return 0;
-- 
2.35.1

