Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3750F257CC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 17:33:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgDkk4YDCzDqPF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 01:33:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=pIpne26A; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgDg50sX8zDqN9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 01:30:40 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 20EF021527;
 Mon, 31 Aug 2020 15:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598887838;
 bh=ZjKWjBFa8jx2a1LkBVVi50zo2hxUJAg7OKt/hGAhRLg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=pIpne26ARZRZ1AzeM8M0zger2+AVlH4O8PX24rUlBFVrGl7DB/dAV1jTo6aibOdDA
 QQQzu5B90zyWkeiSHLm7dUeSl2dMxsWR9klHLApnW9VdHyw7XV1FDYsfkLcVLmFiGz
 Tebz7Lu7gCii7HAATY6CoTg3QzLfTUFMt8gVkFnw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 42/42] fsldma: fix very broken 32-bit ppc ioread64
 functionality
Date: Mon, 31 Aug 2020 11:29:34 -0400
Message-Id: <20200831152934.1023912-42-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200831152934.1023912-1-sashal@kernel.org>
References: <20200831152934.1023912-1-sashal@kernel.org>
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
 Linus Torvalds <torvalds@linux-foundation.org>, dmaengine@vger.kernel.org,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Linus Torvalds <torvalds@linux-foundation.org>

[ Upstream commit 0a4c56c80f90797e9b9f8426c6aae4c0cf1c9785 ]

Commit ef91bb196b0d ("kernel.h: Silence sparse warning in
lower_32_bits") caused new warnings to show in the fsldma driver, but
that commit was not to blame: it only exposed some very incorrect code
that tried to take the low 32 bits of an address.

That made no sense for multiple reasons, the most notable one being that
that code was intentionally limited to only 32-bit ppc builds, so "only
low 32 bits of an address" was completely nonsensical.  There were no
high bits to mask off to begin with.

But even more importantly fropm a correctness standpoint, turning the
address into an integer then caused the subsequent address arithmetic to
be completely wrong too, and the "+1" actually incremented the address
by one, rather than by four.

Which again was incorrect, since the code was reading two 32-bit values
and trying to make a 64-bit end result of it all.  Surprisingly, the
iowrite64() did not suffer from the same odd and incorrect model.

This code has never worked, but it's questionable whether anybody cared:
of the two users that actually read the 64-bit value (by way of some C
preprocessor hackery and eventually the 'get_cdar()' inline function),
one of them explicitly ignored the value, and the other one might just
happen to work despite the incorrect value being read.

This patch at least makes it not fail the build any more, and makes the
logic superficially sane.  Whether it makes any difference to the code
_working_ or not shall remain a mystery.

Compile-tested-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/dma/fsldma.h | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
index 56f18ae992332..308bed0a560ac 100644
--- a/drivers/dma/fsldma.h
+++ b/drivers/dma/fsldma.h
@@ -205,10 +205,10 @@ struct fsldma_chan {
 #else
 static u64 fsl_ioread64(const u64 __iomem *addr)
 {
-	u32 fsl_addr = lower_32_bits(addr);
-	u64 fsl_addr_hi = (u64)in_le32((u32 *)(fsl_addr + 1)) << 32;
+	u32 val_lo = in_le32((u32 __iomem *)addr);
+	u32 val_hi = in_le32((u32 __iomem *)addr + 1);
 
-	return fsl_addr_hi | in_le32((u32 *)fsl_addr);
+	return ((u64)val_hi << 32) + val_lo;
 }
 
 static void fsl_iowrite64(u64 val, u64 __iomem *addr)
@@ -219,10 +219,10 @@ static void fsl_iowrite64(u64 val, u64 __iomem *addr)
 
 static u64 fsl_ioread64be(const u64 __iomem *addr)
 {
-	u32 fsl_addr = lower_32_bits(addr);
-	u64 fsl_addr_hi = (u64)in_be32((u32 *)fsl_addr) << 32;
+	u32 val_hi = in_be32((u32 __iomem *)addr);
+	u32 val_lo = in_be32((u32 __iomem *)addr + 1);
 
-	return fsl_addr_hi | in_be32((u32 *)(fsl_addr + 1));
+	return ((u64)val_hi << 32) + val_lo;
 }
 
 static void fsl_iowrite64be(u64 val, u64 __iomem *addr)
-- 
2.25.1

