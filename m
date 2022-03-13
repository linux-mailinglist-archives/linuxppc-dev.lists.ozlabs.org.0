Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9985C4D7326
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 07:59:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KGVsP33K0z30Kq
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Mar 2022 17:59:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k61IbrTF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=bombadil.20210309 header.b=k61IbrTF; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KGVrh0j0qz2xTn
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Mar 2022 17:58:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=419BJhG3nW8rf1Ih0w0MrCaT5MQLcWKN9x2nNkexFbc=; b=k61IbrTFQwPmbNFPCaIDaFqzAS
 C7kUq84GYt9VZChK0u6D0hsZug2MsIiFDeRmUw1bRAjnn/h5FJjbemaVN9QbOcsf0ivcHlZkScI7X
 1LsUxOdZjZL4UQrrZgRmtn3P1m0P9a072DS7kGb8lUEOYfqxFHcYLj/UvTqVZ5E0LdB/gQsZdx3+L
 jc/TO3J2vzwqnLgu1/1BdXl94Cz425FA07dUBbtpjM7zO3l7g03qf6Mc9mMGXw9hNqRa70OL8IVwW
 UlTheuxrOdw7BQLTh1CcSKfTCOXgoMtmrso2aIQMeB4tlRp6cYlJYF+sT/Z1AO+nP9/0LTO32uf5E
 XRPSBKtg==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTIBn-002HYU-T9; Sun, 13 Mar 2022 06:58:51 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] POWERPC: idle: fix return value of __setup handler
Date: Sat, 12 Mar 2022 22:58:48 -0800
Message-Id: <20220313065848.2150-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 patches@lists.linux.dev, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__setup() handlers should return 1 to obsolete_checksetup() in
init/main.c to indicate that the boot option has been handled.
A return of 0 causes the boot option/value to be listed as an Unknown
kernel parameter and added to init's (limited) argument or environment
strings. Also, error return codes don't mean anything to
obsolete_checksetup() -- only non-zero (usually 1) or zero.
So return 1 from powersave_off().

Fixes: 302eca184fb8 ("[POWERPC] cell: use ppc_md->power_save instead of cbe_idle_loop")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
From: Igor Zhbanov <i.zhbanov@omprussia.ru>
Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
---
 arch/powerpc/kernel/idle.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20220310.orig/arch/powerpc/kernel/idle.c
+++ linux-next-20220310/arch/powerpc/kernel/idle.c
@@ -37,7 +37,7 @@ static int __init powersave_off(char *ar
 {
 	ppc_md.power_save = NULL;
 	cpuidle_disable = IDLE_POWERSAVE_OFF;
-	return 0;
+	return 1;
 }
 __setup("powersave=off", powersave_off);
 
