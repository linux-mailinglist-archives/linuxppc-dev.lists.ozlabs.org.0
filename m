Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F5F9357AA3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 05:06:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FG5l90G4Vz3bVL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Apr 2021 13:06:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=nrI2O1As;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.77;
 helo=conuserg-10.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=nrI2O1As; 
 dkim-atps=neutral
X-Greylist: delayed 55990 seconds by postgrey-1.36 at boromir;
 Thu, 08 Apr 2021 13:06:22 AEST
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FG5kk4SVFz2yxV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Apr 2021 13:06:22 +1000 (AEST)
Received: from localhost.localdomain (133-32-232-101.west.xps.vectant.ne.jp
 [133.32.232.101]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 13835cFD004262;
 Thu, 8 Apr 2021 12:05:38 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 13835cFD004262
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1617851139;
 bh=GpXRb8Xvp/w1GnVfjTpR+YiZfspPXvv4oGzHOYIKuJ8=;
 h=From:To:Cc:Subject:Date:From;
 b=nrI2O1AshjyLr6gExlk9z/rNuTeLwGOkQIvLp48wdJShXAZLoZjnL8cEhKZAYi/RK
 FTqW+fcg6KHfT8A1Hn0mL3KRSTWXZv/eGo+gE0CvmtmcKO5ajHxpiYY7qULQjFgyBo
 UHurizwjEEk+pPIvlIJddKLdbK9p0zXtZp0fk7kqUfTVrN1VBqaOTevXO9kxqSfsKM
 55X0GNJEhIeJOdVqarnt9z7ZAiSmQHxaBdKALOhq3ODwuFGnP5nlZnC0aig21NQt6r
 Shg+ATamzJ/QQtyh/M9Q/1ntijQW0WXLHpcaFhS7oWQ7VdaSdGMfWOEs7OiW2VaQZF
 y/+T0oM17y7gw==
X-Nifty-SrcIP: [133.32.232.101]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: remove old workaround for GCC < 4.9
Date: Thu,  8 Apr 2021 12:05:34 +0900
Message-Id: <20210408030534.196347-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
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
Cc: Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

According to Documentation/process/changes.rst, the minimum supported
GCC version is 4.9.

This workaround is dead code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/Makefile | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 5f8544cf724a..32dd693b4e42 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -181,12 +181,6 @@ CC_FLAGS_FTRACE := -pg
 ifdef CONFIG_MPROFILE_KERNEL
 CC_FLAGS_FTRACE += -mprofile-kernel
 endif
-# Work around gcc code-gen bugs with -pg / -fno-omit-frame-pointer in gcc <= 4.8
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=44199
-# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=52828
-ifndef CONFIG_CC_IS_CLANG
-CC_FLAGS_FTRACE	+= $(call cc-ifversion, -lt, 0409, -mno-sched-epilog)
-endif
 endif
 
 CFLAGS-$(CONFIG_TARGET_CPU_BOOL) += $(call cc-option,-mcpu=$(CONFIG_TARGET_CPU))
-- 
2.27.0

