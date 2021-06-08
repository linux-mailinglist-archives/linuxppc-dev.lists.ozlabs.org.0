Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7245139F20A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 11:14:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fzl1j64Xbz3c3G
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 19:14:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MSPk8XP/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=MSPk8XP/; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fzl0S2bjpz30DN
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 19:13:44 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 772B76127A;
 Tue,  8 Jun 2021 09:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623143621;
 bh=5M6SI0E8FaPqJBzrojGurF0bG6c1so4urASqP1MJ6OI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MSPk8XP/fk/HQXwQR0Y8X62d/zOfv3kCpxM2mgVp0yMl7xGTgSgJ6awXhx4yAVG3v
 5byIdcpdttB0jtR+0YGpI1sethOsTHVJWfNUJY7+qhuUbKld0uYkWcQ9WINSpcrwus
 E11KhPbHhno3hkty1rt2rw/QxWboDsiZ1qlahi+WW4fkUd7RnjOBxr3Zr7qJdc0qMQ
 wg6SQ4ojIq5rDG8FiHgoN8aYP75GHBOsrUGkafVgrmB1H8TsemMLwY+eQBZ/uW9xEY
 ourFYcy5QDhZVTfn6Zx3jTKWLUFIA5icx2/1V4WIICpvDjLI8buDIL5lq3FHWUjueL
 uR0PflBnBFzaw==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 2/9] arc: update comment about HIGHMEM implementation
Date: Tue,  8 Jun 2021 12:13:09 +0300
Message-Id: <20210608091316.3622-3-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210608091316.3622-1-rppt@kernel.org>
References: <20210608091316.3622-1-rppt@kernel.org>
MIME-Version: 1.0
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Mike Rapoport <rppt@linux.ibm.com>

Arc does not use DISCONTIGMEM to implement high memory, update the comment
describing how high memory works to reflect this.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
Acked-by: Vineet Gupta <vgupta@synopsys.com>
---
 arch/arc/mm/init.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/arch/arc/mm/init.c b/arch/arc/mm/init.c
index e2ed355438c9..397a201adfe3 100644
--- a/arch/arc/mm/init.c
+++ b/arch/arc/mm/init.c
@@ -139,16 +139,13 @@ void __init setup_arch_memory(void)
 
 #ifdef CONFIG_HIGHMEM
 	/*
-	 * Populate a new node with highmem
-	 *
 	 * On ARC (w/o PAE) HIGHMEM addresses are actually smaller (0 based)
-	 * than addresses in normal ala low memory (0x8000_0000 based).
+	 * than addresses in normal aka low memory (0x8000_0000 based).
 	 * Even with PAE, the huge peripheral space hole would waste a lot of
-	 * mem with single mem_map[]. This warrants a mem_map per region design.
-	 * Thus HIGHMEM on ARC is imlemented with DISCONTIGMEM.
-	 *
-	 * DISCONTIGMEM in turns requires multiple nodes. node 0 above is
-	 * populated with normal memory zone while node 1 only has highmem
+	 * mem with single contiguous mem_map[].
+	 * Thus when HIGHMEM on ARC is enabled the memory map corresponding
+	 * to the hole is freed and ARC specific version of pfn_valid()
+	 * handles the hole in the memory map.
 	 */
 #ifdef CONFIG_DISCONTIGMEM
 	node_set_online(1);
-- 
2.28.0

