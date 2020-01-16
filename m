Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2B913E9D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 18:40:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zBL620fFzDqMb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 04:40:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=DQgBoH4k; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z9VH0ZfYzDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:02:31 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B5CA2077B;
 Thu, 16 Jan 2020 17:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579194148;
 bh=ym474XaUAzg8O52I4veViPZJ5pKolRrM+e+R9cUVBp0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DQgBoH4kgHn/niKQ53i4AaY2d1e7N9ayBDbQ9c73nm6y3wwOk0RucJpD0CcAIiBig
 /1oFoSevypSj1y/SyYmKZxYBMjVA/mRyZ76088jhbizxSdjj4Jy5q+SrHe/oV9WNxW
 R/GDp/E7Q4h7PNbr3KjndSMIE/L3JFCxcya5gxrw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 233/671] powerpc/mm: Check secondary hash page
 table
Date: Thu, 16 Jan 2020 11:52:22 -0500
Message-Id: <20200116165940.10720-116-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116165940.10720-1-sashal@kernel.org>
References: <20200116165940.10720-1-sashal@kernel.org>
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
Cc: Sasha Levin <sashal@kernel.org>, Rashmica Gupta <rashmica.g@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Rashmica Gupta <rashmica.g@gmail.com>

[ Upstream commit 790845e2f12709d273d08ea7a2af7c2593689519 ]

We were always calling base_hpte_find() with primary = true,
even when we wanted to check the secondary table.

mpe: I broke this when refactoring Rashmica's original patch.

Fixes: 1515ab932156 ("powerpc/mm: Dump hash table")
Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/mm/dump_hashpagetable.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/dump_hashpagetable.c b/arch/powerpc/mm/dump_hashpagetable.c
index 869294695048..b430e4e08af6 100644
--- a/arch/powerpc/mm/dump_hashpagetable.c
+++ b/arch/powerpc/mm/dump_hashpagetable.c
@@ -342,7 +342,7 @@ static unsigned long hpte_find(struct pg_state *st, unsigned long ea, int psize)
 
 	/* Look in secondary table */
 	if (slot == -1)
-		slot = base_hpte_find(ea, psize, true, &v, &r);
+		slot = base_hpte_find(ea, psize, false, &v, &r);
 
 	/* No entry found */
 	if (slot == -1)
-- 
2.20.1

