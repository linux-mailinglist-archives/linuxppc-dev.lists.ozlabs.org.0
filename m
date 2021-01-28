Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03727306A82
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 02:37:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR34D56wjzDqtr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 12:37:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=SKqf4laQ; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR25h6trTzDqBZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 11:53:28 +1100 (AEDT)
Received: from oscar.flets-west.jp (softbank126026094251.bbtec.net
 [126.26.94.251]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id 10S0pjIq024172;
 Thu, 28 Jan 2021 09:52:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com 10S0pjIq024172
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1611795133;
 bh=TL0Lxb9L6uqgAXQZTpsgGcALdDAyn1jCaueREMxl1Kg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SKqf4laQkEgG2A9Aw5UsQqXZinwC9J9Gm3WRBgfmjOWQz0/OPrcQTzerEIRWXb900
 crV0MR/MYC0tozgk1iQJicaBB8lVHTnGxHapxTjxfQGqHYUO+QmQvr/sKvWSPitYg3
 JIwyUCkstFhIsvnWgwrhk8zMqdGsRKClkxBaLjn0y7pSNycRuNwkg3O/35faBmdnst
 EOvBJkx2YG1dkYKC/ThKJtFH23A+QAH5LzgKjkm0GD5irTaFM4l5YAdZKBkvZxS644
 p+IPCamWe22698XKTniyirF6H7KEwPLPbxFtAfTGUi5Yw/fOozA32oNIYPKk8SA2XJ
 +VFKf39ko9xUA==
X-Nifty-SrcIP: [126.26.94.251]
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-arch@vger.kernel.org, x86@kernel.org
Subject: [PATCH 21/27] sparc: remove wrong comment from
 arch/sparc/include/asm/Kbuild
Date: Thu, 28 Jan 2021 09:51:03 +0900
Message-Id: <20210128005110.2613902-22-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210128005110.2613902-1-masahiroy@kernel.org>
References: <20210128005110.2613902-1-masahiroy@kernel.org>
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
Cc: linux-xtensa@linux-xtensa.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kbuild@vger.kernel.org,
 Masahiro Yamada <masahiroy@kernel.org>, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are NOT exported to userspace.

The headers listed in arch/sparc/include/uapi/asm/Kbuild are exported.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/sparc/include/asm/Kbuild | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/sparc/include/asm/Kbuild b/arch/sparc/include/asm/Kbuild
index 3688fdae50e4..aec20406145e 100644
--- a/arch/sparc/include/asm/Kbuild
+++ b/arch/sparc/include/asm/Kbuild
@@ -1,6 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-# User exported sparc header files
-
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
 generated-y += syscall_table_c32.h
-- 
2.27.0

