Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A58602E1FC5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 18:14:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D1KZK1cHTzDqQc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Dec 2020 04:14:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.77;
 helo=conuserg-10.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=l1im/Q9w; 
 dkim-atps=neutral
Received: from conuserg-10.nifty.com (conuserg-10.nifty.com [210.131.2.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D1KXc4KrwzDqNG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Dec 2020 04:13:03 +1100 (AEDT)
Received: from grover.flets-west.jp (softbank126090214151.bbtec.net
 [126.90.214.151]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id 0BNHBjDJ029748;
 Thu, 24 Dec 2020 02:11:47 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com 0BNHBjDJ029748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1608743508;
 bh=F4eygMIL/heychEdy4AUgBnfOqgJupp0qUMNlr5k7z0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=l1im/Q9wt7wMKJkT2ai+kxcbSSB4ooSml+4uTOMZF0HAKq/G3hIqQyCzqgR/67xJd
 etw4HCJd21di4Cp+ii9FicPoqn73/f2JrPrBaFR3BXLspbpnSjwO3eZO9HzZ4nzGlZ
 3riWteY7tUS5XgjvRMf9E2lZfxqDhzOV6VpcQmCQ/jSuqWe2e8vWZQ/94jBFLtEfqj
 5+WYqeE30NLgVQqLQ87TK7NwnBDALpKK2x24JM5v8aZgXvSBFmFXAlhTqQyta7RK11
 u5iwIqcoMhYoTLtIhsKB9VZvDWQAQqRlj9wOTM89Ij7LtoTt0P7Hr/lwZTdfYcHm1h
 Lg3/e8PRqL4ZA==
X-Nifty-SrcIP: [126.90.214.151]
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc/vdso64: remove meaningless vgettimeofday.o build
 rule
Date: Thu, 24 Dec 2020 02:11:42 +0900
Message-Id: <20201223171142.707053-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20201223171142.707053-1-masahiroy@kernel.org>
References: <20201223171142.707053-1-masahiroy@kernel.org>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

VDSO64 is only built for the 64-bit kernel, hence vgettimeofday.o is
built by the generic rule in scripts/Makefile.build.

This line does not provide anything useful.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/kernel/vdso64/Makefile | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso64/Makefile
index b50b39fedf74..422addf394c7 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -32,8 +32,6 @@ asflags-y := -D__VDSO64__ -s
 targets += vdso64.lds
 CPPFLAGS_vdso64.lds += -P -C -U$(ARCH)
 
-$(obj)/vgettimeofday.o: %.o: %.c FORCE
-
 # link rule for the .so file, .lds has to be first
 $(obj)/vdso64.so.dbg: $(src)/vdso64.lds $(obj-vdso64) $(obj)/vgettimeofday.o FORCE
 	$(call if_changed,vdso64ld_and_check)
-- 
2.27.0

