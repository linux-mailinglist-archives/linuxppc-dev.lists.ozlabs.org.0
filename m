Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 651C543838C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 13:48:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HbzyH67vqz3dch
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Oct 2021 22:48:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hbzwp2SrLz2ywf
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Oct 2021 22:47:38 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4HbzwT1sY9z9s3J;
 Sat, 23 Oct 2021 13:47:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ebcbtIIX8j1N; Sat, 23 Oct 2021 13:47:21 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.203.87])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (Client did not present a certificate)
 by pegase1.c-s.fr (Postfix) with ESMTPS id 4HbzwS0YvNz9s2p;
 Sat, 23 Oct 2021 13:47:20 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1) with ESMTPS id 19NBlK0J441171
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Sat, 23 Oct 2021 13:47:20 +0200
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.16.1/8.16.1/Submit) id 19NBlKrs441170;
 Sat, 23 Oct 2021 13:47:20 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 04/10] powerpc/fsl_booke: Rename fsl_booke.c to fsl_book3e.c
Date: Sat, 23 Oct 2021 13:47:09 +0200
Message-Id: <dcddf2a3470738072fa51388a13522dbafe9e543.1634983809.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <33e7fe0f6134c58e044eb63d3925cd34aa120104.1634983809.git.christophe.leroy@csgroup.eu>
References: <33e7fe0f6134c58e044eb63d3925cd34aa120104.1634983809.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1634989633; l=1737; s=20211009;
 h=from:subject:message-id; bh=9FKtB4GWA22UDQ2x5GMODY3gN9eqmdzTri+KQAD4Le0=;
 b=NLblCz1VYXDvCrnAm0JMWZl7nDMWyWG5Hh9mwDoWvIfpFG0PU6aqD9w93wSGIjfWXr54BvkcFowd
 cF9H5WufAB0aKwU2tS6wtv3SePa/OY7EqEOrrZ6HK7SV5sX2sETx
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have a myriad of CONFIG symbols around different variants
of BOOKEs, which would be worth tidying up one day.

But at least, make file names and CONFIG option match:

We have CONFIG_FSL_BOOKE and CONFIG_PPC_FSL_BOOK3E.

fsl_booke.c is selected by and only by CONFIG_PPC_FSL_BOOK3E.
So rename it fsl_book3e to reduce confusion.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: No change
---
 arch/powerpc/mm/nohash/Makefile                      | 4 ++--
 arch/powerpc/mm/nohash/{fsl_booke.c => fsl_book3e.c} | 0
 2 files changed, 2 insertions(+), 2 deletions(-)
 rename arch/powerpc/mm/nohash/{fsl_booke.c => fsl_book3e.c} (100%)

diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index 0424f6ce5bd8..b1f630d423d8 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -7,7 +7,7 @@ obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_low_64e.o book3e_pgtable.o
 obj-$(CONFIG_40x)		+= 40x.o
 obj-$(CONFIG_44x)		+= 44x.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
-obj-$(CONFIG_PPC_FSL_BOOK3E)	+= fsl_booke.o
+obj-$(CONFIG_PPC_FSL_BOOK3E)	+= fsl_book3e.o
 obj-$(CONFIG_RANDOMIZE_BASE)	+= kaslr_booke.o
 ifdef CONFIG_HUGETLB_PAGE
 obj-$(CONFIG_PPC_FSL_BOOK3E)	+= book3e_hugetlbpage.o
@@ -16,4 +16,4 @@ endif
 # Disable kcov instrumentation on sensitive code
 # This is necessary for booting with kcov enabled on book3e machines
 KCOV_INSTRUMENT_tlb.o := n
-KCOV_INSTRUMENT_fsl_booke.o := n
+KCOV_INSTRUMENT_fsl_book3e.o := n
diff --git a/arch/powerpc/mm/nohash/fsl_booke.c b/arch/powerpc/mm/nohash/fsl_book3e.c
similarity index 100%
rename from arch/powerpc/mm/nohash/fsl_booke.c
rename to arch/powerpc/mm/nohash/fsl_book3e.c
-- 
2.31.1

