Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0200813FA6F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 21:17:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zFq951cgzDqlV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 07:17:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=CkA6S0aF; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zBTd2F2fzDqf9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 04:47:01 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A5F38246DF;
 Thu, 16 Jan 2020 17:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579196819;
 bh=fQJtNVaV4DsQ61t6sF1IyLdmwc8TWrk8/h8SZp53dwE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CkA6S0aFhgEm91X13Oe0VtuG66eziVuNL8GN9GmvAq213JL4mmejQYsBeC9OPWHE/
 ZIjtRFb/4GGhebfa/IOuwnNFqwN4Kn6Ti+mcR468pzHqdSFAsjxsXS8gwsXFHkaodh
 6SfG/Sj4cJtEVjWESc18ukgWRFyFFY8dyzNAspXk=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.4 174/174] powerpc/archrandom: fix
 arch_get_random_seed_int()
Date: Thu, 16 Jan 2020 12:42:51 -0500
Message-Id: <20200116174251.24326-174-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200116174251.24326-1-sashal@kernel.org>
References: <20200116174251.24326-1-sashal@kernel.org>
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
 Ard Biesheuvel <ardb@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Ard Biesheuvel <ardb@kernel.org>

[ Upstream commit b6afd1234cf93aa0d71b4be4788c47534905f0be ]

Commit 01c9348c7620ec65

  powerpc: Use hardware RNG for arch_get_random_seed_* not arch_get_random_*

updated arch_get_random_[int|long]() to be NOPs, and moved the hardware
RNG backing to arch_get_random_seed_[int|long]() instead. However, it
failed to take into account that arch_get_random_int() was implemented
in terms of arch_get_random_long(), and so we ended up with a version
of the former that is essentially a NOP as well.

Fix this by calling arch_get_random_seed_long() from
arch_get_random_seed_int() instead.

Fixes: 01c9348c7620ec65 ("powerpc: Use hardware RNG for arch_get_random_seed_* not arch_get_random_*")
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20191204115015.18015-1-ardb@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/archrandom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/archrandom.h b/arch/powerpc/include/asm/archrandom.h
index 85e88f7a59c0..9ff848e3c4a6 100644
--- a/arch/powerpc/include/asm/archrandom.h
+++ b/arch/powerpc/include/asm/archrandom.h
@@ -27,7 +27,7 @@ static inline int arch_get_random_seed_int(unsigned int *v)
 	unsigned long val;
 	int rc;
 
-	rc = arch_get_random_long(&val);
+	rc = arch_get_random_seed_long(&val);
 	if (rc)
 		*v = val;
 
-- 
2.20.1

