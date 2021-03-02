Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A02A329D5F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 12:58:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqbHf0pSfz3dX8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 22:58:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=S+cvuqYg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=S+cvuqYg; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqbGD68Mwz3dFk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 22:57:08 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6283C64F5C;
 Tue,  2 Mar 2021 11:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614686227;
 bh=JXnZzuhfjp+IoFjmftM4WsrePuwRN8h6VGXcC/RrJo4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S+cvuqYgyltNcPZU0ot6QiUrWqBnsEP+VTYSEkbRYisfmUMnxSEBr97GYQ+r7fnxb
 ONwh83/DluVORSrebnh+rlxJ83H+pbLwYXqN20FCeQbtcjKhHoyRHV8pq4bgSxDPbB
 pnPQkUtPA21ecB/7MUOO8SMZGtFEkvjTzcD1TiRaWfzfuWBrqW8idntfiHAhIQ8lQ4
 E5Adk0ILo0flJXSAzydEoTfQcnoA4xwVU5f6GR7EWAbGGeD6oYbrc8ahkfRLdPI7z8
 9usYp0IxLw80gkkiuMP3M7WJDievYB3zeBYJcBD99LKre20O4gpy2gnDmqlKSn/963
 SEwx80wu6aZeQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 16/47] powerpc: improve handling of unrecoverable
 system reset
Date: Tue,  2 Mar 2021 06:56:15 -0500
Message-Id: <20210302115646.62291-16-sashal@kernel.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210302115646.62291-1-sashal@kernel.org>
References: <20210302115646.62291-1-sashal@kernel.org>
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
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nicholas Piggin <npiggin@gmail.com>

[ Upstream commit 11cb0a25f71818ca7ab4856548ecfd83c169aa4d ]

If an unrecoverable system reset hits in process context, the system
does not have to panic. Similar to machine check, call nmi_exit()
before die().

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20210130130852.2952424-26-npiggin@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/kernel/traps.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index 5006dcbe1d9f..77dffea3d537 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -509,8 +509,11 @@ out:
 		die("Unrecoverable nested System Reset", regs, SIGABRT);
 #endif
 	/* Must die if the interrupt is not recoverable */
-	if (!(regs->msr & MSR_RI))
+	if (!(regs->msr & MSR_RI)) {
+		/* For the reason explained in die_mce, nmi_exit before die */
+		nmi_exit();
 		die("Unrecoverable System Reset", regs, SIGABRT);
+	}
 
 	if (saved_hsrrs) {
 		mtspr(SPRN_HSRR0, hsrr0);
-- 
2.30.1

