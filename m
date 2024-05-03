Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D638BA4C5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 03:01:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=kwM8XMwo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VVsvg6DHDz3cbH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 11:01:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=kwM8XMwo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=linux@treblig.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 2257 seconds by postgrey-1.37 at boromir; Fri, 03 May 2024 11:01:10 AEST
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VVstt6sLQz3bdV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 11:01:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=TwhhGJYX8S5isC/qXpdo6M+smqQWbmRemXXOvuWIYPs=; b=kwM8XMwoqP4IbG0+
	0zfWn62s1OSNbxh4YF4B8RdGoTlVfokrYBsIV2RqrmUN9Sxo34stiEMPB4DFCFIV+ZmlRlf0KNQhl
	lj3Be/du6TDKhzddcj1tNl1hiRt8WI8dERlvyTkp52z6LqGqgLjD7o9csEVud+9bFnKBDqTc1+ztR
	jRZnWO4G+gjhzNbBrL0b8uTODfv9ebsHmiEGrNuU8mNtvUDZFrpDoqVkhO4DI6GVjv8F0hShx2Ipc
	3X4i31UON2ywDuyE0V95GDhhZlUh59ILEJW8WZtAWCM8QkOKhZlTv13DwfjkdGf+SF7kumemGuLAA
	V/HAXJSTJKPcnJfAqg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1s2ghx-004Mi8-1m;
	Fri, 03 May 2024 00:23:25 +0000
From: linux@treblig.org
To: mpe@ellerman.id.au,
	npiggin@gmail.com
Subject: [PATCH] power: Remove arch specific module bug stuff
Date: Fri,  3 May 2024 01:23:17 +0100
Message-ID: <20240503002317.183500-1-linux@treblig.org>
X-Mailer: git-send-email 2.44.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The last function to reference module_bug_list went in 2008's
  commit b9754568ef17 ("powerpc: Remove dead module_find_bug code")
but I don't think that was called since 2006's
  commit 73c9ceab40b1 ("[POWERPC] Generic BUG for powerpc")

Now that the list has gone, I think we can also clean up the bug
entries in mod_arch_specific.

Lightly boot tested.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 arch/powerpc/include/asm/module.h | 5 -----
 arch/powerpc/kernel/module.c      | 2 --
 2 files changed, 7 deletions(-)

diff --git a/arch/powerpc/include/asm/module.h b/arch/powerpc/include/asm/module.h
index a8e2e8339fb7f..300c777cc3075 100644
--- a/arch/powerpc/include/asm/module.h
+++ b/arch/powerpc/include/asm/module.h
@@ -48,11 +48,6 @@ struct mod_arch_specific {
 	unsigned long tramp;
 	unsigned long tramp_regs;
 #endif
-
-	/* List of BUG addresses, source line numbers and filenames */
-	struct list_head bug_list;
-	struct bug_entry *bug_table;
-	unsigned int num_bugs;
 };
 
 /*
diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
index f6d6ae0a16923..8989e069e3aae 100644
--- a/arch/powerpc/kernel/module.c
+++ b/arch/powerpc/kernel/module.c
@@ -17,8 +17,6 @@
 #include <asm/setup.h>
 #include <asm/sections.h>
 
-static LIST_HEAD(module_bug_list);
-
 static const Elf_Shdr *find_section(const Elf_Ehdr *hdr,
 				    const Elf_Shdr *sechdrs,
 				    const char *name)
-- 
2.44.0

