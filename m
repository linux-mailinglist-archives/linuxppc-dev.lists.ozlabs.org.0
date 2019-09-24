Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC555BD0C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 19:35:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d7cn1k1ZzDqJ5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 03:35:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="YkG3pnG+"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6WM4NS1zDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:45:35 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7A72C222BE;
 Tue, 24 Sep 2019 16:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343533;
 bh=jY3qVanxeRquDLEImQZu/x/re51v+SLrET3Sx0RMqiY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YkG3pnG++bPB4uko56piCo1DDW1g99M3u7rK0UaNw4qET+MVADxC+T2+QmGJs/RMi
 +g+SYm56NFChUHpdNDO+NBYuzGGnHbyYYATWaaOY9Udt3YNjrVUbjIx+BZri4dpgyv
 0LrWyrQD/Q8JywIvy3fZPwtgalmxhyAr7BKfxKw8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.3 80/87] powerpc: dump kernel log before carrying
 out fadump or kdump
Date: Tue, 24 Sep 2019 12:41:36 -0400
Message-Id: <20190924164144.25591-80-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164144.25591-1-sashal@kernel.org>
References: <20190924164144.25591-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ganesh Goudar <ganeshgr@linux.ibm.com>

[ Upstream commit e7ca44ed3ba77fc26cf32650bb71584896662474 ]

Since commit 4388c9b3a6ee ("powerpc: Do not send system reset request
through the oops path"), pstore dmesg file is not updated when dump is
triggered from HMC. This commit modified system reset (sreset) handler
to invoke fadump or kdump (if configured), without pushing dmesg to
pstore. This leaves pstore to have old dmesg data which won't be much
of a help if kdump fails to capture the dump. This patch fixes that by
calling kmsg_dump() before heading to fadump ot kdump.

Fixes: 4388c9b3a6ee ("powerpc: Do not send system reset request through the oops path")
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20190904075949.15607-1-ganeshgr@linux.ibm.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/traps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 11caa0291254e..82f43535e6867 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -472,6 +472,7 @@ void system_reset_exception(struct pt_regs *regs)
 	if (debugger(regs))
 		goto out;
 
+	kmsg_dump(KMSG_DUMP_OOPS);
 	/*
 	 * A system reset is a request to dump, so we always send
 	 * it through the crashdump code (if fadump or kdump are
-- 
2.20.1

