Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E94C6C8B97
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 07:13:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pk7zk0RQNz3fcj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Mar 2023 17:13:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VPc8dNXM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=VPc8dNXM;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pk7vK0g24z3fSr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Mar 2023 17:09:17 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DC28D609FA;
	Sat, 25 Mar 2023 06:09:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA6EFC433A1;
	Sat, 25 Mar 2023 06:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679724554;
	bh=rsWO9Gu3cLJfEZ6HGq7Yirp+4MPMX9dfat2W6BJq/Fk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VPc8dNXMBWIXJyN6sfN6LeTLRDC59T4bZLZBWq7JN53840Dl1l7ym8J18YFdxatIp
	 9DQpdhF4tu+AKAw0OjKnedcpW41C5WMuw9ucVi77g7PTxRglrMTBT3fovrTuqL36/2
	 Q3nBPLN01a2DhO70v9RrrtK15qCftbBFZGWwfhsPjuErp5vRGnR422qF2c+POTGGZo
	 YXcGQua+Kxj2QNTUxj+Ci8zoUOnJX4+qLLchS0FzJJ6eMnaOvqBEiB4VZr+a7f6noP
	 ypmyXJqvhzzN13BhkuTUs9QpJCd+dYk22bWNDDlH29JNUEDYaWLGwdmQk0iLZHu63b
	 RV9GjrGP5l0RA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 04/14] csky: drop ARCH_FORCE_MAX_ORDER
Date: Sat, 25 Mar 2023 09:08:18 +0300
Message-Id: <20230325060828.2662773-5-rppt@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230325060828.2662773-1-rppt@kernel.org>
References: <20230325060828.2662773-1-rppt@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Max Filippov <jcmvbkbc@gmail.com>, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Zi Yan <ziy@nvidia.com>, linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Mike Rapoport (IBM)" <rppt@kernel.org>

The default value of ARCH_FORCE_MAX_ORDER matches the generic default
defined in the MM code, the architecture does not support huge pages, so
there is no need to keep ARCH_FORCE_MAX_ORDER option available.

Drop it.

Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Reviewed-by: Zi Yan <ziy@nvidia.com>
Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
---
 arch/csky/Kconfig | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index c694fac43bed..00379a843c37 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -332,10 +332,6 @@ config HIGHMEM
 	select KMAP_LOCAL
 	default y
 
-config ARCH_FORCE_MAX_ORDER
-	int "Maximum zone order"
-	default "10"
-
 config DRAM_BASE
 	hex "DRAM start addr (the same with memory-section in dts)"
 	default 0x0
-- 
2.35.1

