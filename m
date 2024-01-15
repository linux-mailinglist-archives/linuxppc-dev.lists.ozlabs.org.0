Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EEE82E35D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 00:27:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o+Mdg4Zq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDSwV3dsJz3cQf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 10:27:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=o+Mdg4Zq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDSrw5Rbvz3bqV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 10:24:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 711C6CE18BB;
	Mon, 15 Jan 2024 23:24:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126F7C433C7;
	Mon, 15 Jan 2024 23:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705361052;
	bh=EtHTrGE1eOqQboRLF4jG9BNVF54hCRlcPg6QD4VK/cA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o+Mdg4ZqxPleesyYhfB5XfVVzO9RCgDl7Jk33aJFConnc3WXrG6C3fvJSdhuDRC2S
	 aq7gfK5gTIFVKfWVJMTJLA0oiUkyZxc1s6YLLBV/ZleK47geLWIXTO3nXZQa4UjNHY
	 7NzIYGRgLtrxe6KAh4+xwQOPkEEBqOGsNP3LKgNK3YybfJcqAxgnJxgH9YxyvSp9eJ
	 grWrG4GdkQbXqusRLvHwE1kKybiC2Wsq6q5fyogcAtmjTHA5eHV0PaFuvOL6At1KAC
	 g2POgUT34jFcq7kf2JrDO7ywyIbMPW5pOHkqjrbgIFoalBtA9qnJ0ByTGTeAHT3uqD
	 HqYxEVCk2vcNw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.7 08/14] powerpc/64s: Fix CONFIG_NUMA=n build due to create_section_mapping()
Date: Mon, 15 Jan 2024 18:23:22 -0500
Message-ID: <20240115232351.208489-8-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115232351.208489-1-sashal@kernel.org>
References: <20240115232351.208489-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.7
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit ede66cd22441820cbd399936bf84fdc4294bc7fa ]

With CONFIG_NUMA=n the build fails with:

  arch/powerpc/mm/book3s64/pgtable.c:275:15: error: no previous prototype for ‘create_section_mapping’ [-Werror=missing-prototypes]
  275 | int __meminit create_section_mapping(unsigned long start, unsigned long end,
      |               ^~~~~~~~~~~~~~~~~~~~~~

That happens because the prototype for create_section_mapping() is in
asm/mmzone.h, but asm/mmzone.h is only included by linux/mmzone.h
when CONFIG_NUMA=y.

In fact the prototype is only needed by arch/powerpc/mm code, so move
the prototype into arch/powerpc/mm/mmu_decl.h, which also fixes the
build error.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://msgid.link/20231129131919.2528517-5-mpe@ellerman.id.au
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/powerpc/include/asm/mmzone.h | 5 -----
 arch/powerpc/mm/mmu_decl.h        | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/mmzone.h b/arch/powerpc/include/asm/mmzone.h
index 3764d3585d30..da827d2d0866 100644
--- a/arch/powerpc/include/asm/mmzone.h
+++ b/arch/powerpc/include/asm/mmzone.h
@@ -43,10 +43,5 @@ u64 memory_hotplug_max(void);
 #define memory_hotplug_max() memblock_end_of_DRAM()
 #endif /* CONFIG_NUMA */
 
-#ifdef CONFIG_MEMORY_HOTPLUG
-extern int create_section_mapping(unsigned long start, unsigned long end,
-				  int nid, pgprot_t prot);
-#endif
-
 #endif /* __KERNEL__ */
 #endif /* _ASM_MMZONE_H_ */
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 7f9ff0640124..72341b9fb552 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -181,3 +181,8 @@ static inline bool debug_pagealloc_enabled_or_kfence(void)
 {
 	return IS_ENABLED(CONFIG_KFENCE) || debug_pagealloc_enabled();
 }
+
+#ifdef CONFIG_MEMORY_HOTPLUG
+int create_section_mapping(unsigned long start, unsigned long end,
+			   int nid, pgprot_t prot);
+#endif
-- 
2.43.0

