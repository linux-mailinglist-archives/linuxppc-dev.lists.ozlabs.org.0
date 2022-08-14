Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A097592527
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Aug 2022 18:39:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M5NRx0kx9z3gRc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 02:39:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TZW9OK6Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TZW9OK6Q;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M5NFL5rmHz3fc9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Aug 2022 02:30:46 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2502060EF8;
	Sun, 14 Aug 2022 16:30:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8926C433D6;
	Sun, 14 Aug 2022 16:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660494644;
	bh=nKTuBtM4erHTsf5Z3wnlxZdKoymi6bvTtcHKXHd7hkU=;
	h=From:To:Cc:Subject:Date:From;
	b=TZW9OK6QvkQ/MBcZgKzIFqBW8Kd/Asbt4jubdznXZLrFJS6xXi1BYPPUu5/wHwRY4
	 QuvAHByELoEGjk/Kdf+5eYanJURWO9qquS0anA1wQJnC9fTSGIy+pelLsUu60NQn55
	 cI7fDfmQmqzd7UDYhLjz836W426Bw78M6P6ek3HGNLl9GR/lGYgEblR+NTPf6M7Ohf
	 xtYU59W2sc0It1Gq1p1Yw1XUlnRZ9yInct+LeNeJrBcLA54NBJ6Kx2ycGDfA1Fbt/d
	 MulqVn9AWNapnCOmnbi1ntBXLTTFMUfW7ULnSec9cFcb9tUADwe7hMNbVk8obV6Uvk
	 2Ucrmo/wWQcBw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 1/8] tty: serial: Fix refcount leak bug in ucc_uart.c
Date: Sun, 14 Aug 2022 12:30:34 -0400
Message-Id: <20220814163041.2399552-1-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
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
index 481eb2989a1e..ed1658b61e54 100644
--- a/drivers/tty/serial/ucc_uart.c
+++ b/drivers/tty/serial/ucc_uart.c
@@ -1143,6 +1143,8 @@ static unsigned int soc_info(unsigned int *rev_h, unsigned int *rev_l)
 		/* No compatible property, so try the name. */
 		soc_string = np->name;
 
+	of_node_put(np);
+
 	/* Extract the SOC number from the "PowerPC," string */
 	if ((sscanf(soc_string, "PowerPC,%u", &soc) != 1) || !soc)
 		return 0;
-- 
2.35.1

