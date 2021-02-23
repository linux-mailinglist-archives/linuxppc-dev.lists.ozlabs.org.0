Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A35B0322868
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 11:01:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DlF1r4jhrz3cSV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 21:01:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux-m68k.org
 (client-ip=195.130.137.77; helo=leibniz.telenet-ops.be;
 envelope-from=geert@linux-m68k.org; receiver=<UNKNOWN>)
X-Greylist: delayed 417 seconds by postgrey-1.36 at boromir;
 Tue, 23 Feb 2021 21:01:04 AEDT
Received: from leibniz.telenet-ops.be (leibniz.telenet-ops.be [195.130.137.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DlF1X4NC1z30Qx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 21:01:03 +1100 (AEDT)
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by leibniz.telenet-ops.be (Postfix) with ESMTPS id 4DlDsB2QmJzMr3Jt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 10:53:50 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:254f:253d:debc:790b])
 by xavier.telenet-ops.be with bizsmtp
 id YZto2400E1v7dkx01Ztort; Tue, 23 Feb 2021 10:53:49 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lEUO3-0010Q5-Qd; Tue, 23 Feb 2021 10:53:47 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1lEUO2-008yZU-SQ; Tue, 23 Feb 2021 10:53:46 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Oliver O'Halloran <oohall@gmail.com>
Subject: [PATCH] powerpc/chrp: Make hydra_init() static
Date: Tue, 23 Feb 2021 10:53:45 +0100
Message-Id: <20210223095345.2139416-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 407d418f2fd4c20a ("powerpc/chrp: Move PHB discovery") moved the
sole call to hydra_init() to the source file where it is defined, so it
can be made static.

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
Compile-tested only.  My LongTrail died in 2004.
---
 arch/powerpc/include/asm/hydra.h  | 2 --
 arch/powerpc/platforms/chrp/pci.c | 3 +--
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/powerpc/include/asm/hydra.h b/arch/powerpc/include/asm/hydra.h
index ae02eb53d6ef8221..d024447283a0cf3c 100644
--- a/arch/powerpc/include/asm/hydra.h
+++ b/arch/powerpc/include/asm/hydra.h
@@ -94,8 +94,6 @@ extern volatile struct Hydra __iomem *Hydra;
 #define HYDRA_INT_EXT7		18	/* Power Off Request */
 #define HYDRA_INT_SPARE		19
 
-extern int hydra_init(void);
-
 #endif /* __KERNEL__ */
 
 #endif /* _ASMPPC_HYDRA_H */
diff --git a/arch/powerpc/platforms/chrp/pci.c b/arch/powerpc/platforms/chrp/pci.c
index 8c421dc78b28334b..76e6256cb0a788f4 100644
--- a/arch/powerpc/platforms/chrp/pci.c
+++ b/arch/powerpc/platforms/chrp/pci.c
@@ -131,8 +131,7 @@ static struct pci_ops rtas_pci_ops =
 
 volatile struct Hydra __iomem *Hydra = NULL;
 
-int __init
-hydra_init(void)
+static int __init hydra_init(void)
 {
 	struct device_node *np;
 	struct resource r;
-- 
2.25.1

