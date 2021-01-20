Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E7A2FCC15
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 08:54:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLHps2G7LzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 18:54:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLHjF0hDGzDqrV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 18:49:17 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DLHj545f5z9tyjv;
 Wed, 20 Jan 2021 08:49:13 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id aUZQ7k60osz0; Wed, 20 Jan 2021 08:49:13 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DLHj53GvCz9tyjn;
 Wed, 20 Jan 2021 08:49:13 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 656648B7DF;
 Wed, 20 Jan 2021 08:49:14 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ZfMJvtburgwY; Wed, 20 Jan 2021 08:49:14 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 438648B7E1;
 Wed, 20 Jan 2021 08:49:14 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 3ACF166A54; Wed, 20 Jan 2021 07:49:14 +0000 (UTC)
Message-Id: <f9981e819009aa121a998dc483052ec76f78f991.1611128938.git.christophe.leroy@csgroup.eu>
In-Reply-To: <2fed79b1154c872194f98bac4422c23918325e61.1611128938.git.christophe.leroy@csgroup.eu>
References: <2fed79b1154c872194f98bac4422c23918325e61.1611128938.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc/44x: Remove STDBINUTILS kconfig option
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 20 Jan 2021 07:49:14 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

STDBINUTILS is just a toggle to allow 256k page size
to appear in the possible page sizes list for the 44x.

Make 256k page size appear all the time with an
explicit warning on binutils, and remove this unneccessary
STDBINUTILS config option.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a685e42d3993..3e29995540a7 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -720,18 +720,6 @@ config ARCH_MEMORY_PROBE
 	def_bool y
 	depends on MEMORY_HOTPLUG
 
-config STDBINUTILS
-	bool "Using standard binutils settings"
-	depends on 44x
-	default y
-	help
-	  Turning this option off allows you to select 256KB PAGE_SIZE on 44x.
-	  Note, that kernel will be able to run only those applications,
-	  which had been compiled using binutils later than 2.17.50.0.3 with
-	  '-zmax-page-size' set to 256K (the default is 64K). Or, if using
-	  the older binutils, you can patch them with a trivial patch, which
-	  changes the ELF_MAXPAGESIZE definition from 0x10000 to 0x40000.
-
 choice
 	prompt "Page size"
 	default PPC_4K_PAGES
@@ -771,17 +759,16 @@ config PPC_64K_PAGES
 	select HAVE_ARCH_SOFT_DIRTY if PPC_BOOK3S_64
 
 config PPC_256K_PAGES
-	bool "256k page size"
-	depends on 44x && !STDBINUTILS && !PPC_47x
+	bool "256k page size (Requires non-standard binutils settings)"
+	depends on 44x && !PPC_47x
 	help
 	  Make the page size 256k.
 
-	  As the ELF standard only requires alignment to support page
-	  sizes up to 64k, you will need to compile all of your user
-	  space applications with a non-standard binutils settings
-	  (see the STDBINUTILS description for details).
-
-	  Say N unless you know what you are doing.
+	  That kernel will be able to run only those applications,
+	  which had been compiled using binutils later than 2.17.50.0.3 with
+	  '-zmax-page-size' set to 256K (the default is 64K). Or, if using
+	  the older binutils, you can patch them with a trivial patch, which
+	  changes the ELF_MAXPAGESIZE definition from 0x10000 to 0x40000.
 
 endchoice
 
-- 
2.25.0

