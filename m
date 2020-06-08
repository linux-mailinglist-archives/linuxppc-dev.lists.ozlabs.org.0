Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 936771F2476
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 01:21:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gq5P1DdCzDqSM
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jun 2020 09:21:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=rvDz3DiQ; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gpvH6WySzDq6J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Jun 2020 09:12:59 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1697D208C7;
 Mon,  8 Jun 2020 23:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1591657977;
 bh=jpDTO98NTAQXW0vDddw9K2FDKrrPkVG//C7RQILuNx0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rvDz3DiQklk9Udj2lX9/vBUrPmBdNgkGuZdmJY2RxtssrOVhZiKMj/VK3K+YbAXzk
 e5yGNyd4VyMF0MdlnlSbNpmazDq1O3KIqFBBP9GJRaXrzkOb0amGfPgRccjP4/TqH4
 eYSV+FteXGxjvxTOex5wU23qJkn5jAjCKP36rlOQ=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.6 039/606] powerpc/32s: Fix build failure with
 CONFIG_PPC_KUAP_DEBUG
Date: Mon,  8 Jun 2020 19:02:44 -0400
Message-Id: <20200608231211.3363633-39-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200608231211.3363633-1-sashal@kernel.org>
References: <20200608231211.3363633-1-sashal@kernel.org>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@c-s.fr>

commit 4833ce06e6855d526234618b746ffb71d6612c9a upstream.

gpr2 is not a parametre of kuap_check(), it doesn't exist.

Use gpr instead.

Fixes: a68c31fc01ef ("powerpc/32s: Implement Kernel Userspace Access Protection")
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/r/ea599546f2a7771bde551393889e44e6b2632332.1587368807.git.christophe.leroy@c-s.fr
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/include/asm/book3s/32/kup.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/book3s/32/kup.h b/arch/powerpc/include/asm/book3s/32/kup.h
index 3c0ba22dc360..db0a1c281587 100644
--- a/arch/powerpc/include/asm/book3s/32/kup.h
+++ b/arch/powerpc/include/asm/book3s/32/kup.h
@@ -75,7 +75,7 @@
 
 .macro kuap_check	current, gpr
 #ifdef CONFIG_PPC_KUAP_DEBUG
-	lwz	\gpr2, KUAP(thread)
+	lwz	\gpr, KUAP(thread)
 999:	twnei	\gpr, 0
 	EMIT_BUG_ENTRY 999b, __FILE__, __LINE__, (BUGFLAG_WARNING | BUGFLAG_ONCE)
 #endif
-- 
2.25.1

