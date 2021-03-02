Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0957632A7DF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 18:27:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dqkb90YlLz3dYB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 04:27:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqkY25YJgz3cPF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 04:25:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DqkXw1XPpz9v1C4;
 Tue,  2 Mar 2021 18:25:20 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id LhQkvn-K5PGS; Tue,  2 Mar 2021 18:25:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DqkXw0jTRz9v1Bx;
 Tue,  2 Mar 2021 18:25:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D8B9B8B7B5;
 Tue,  2 Mar 2021 18:25:21 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id huFmz8x1Abk4; Tue,  2 Mar 2021 18:25:21 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7FD0C8B75F;
 Tue,  2 Mar 2021 18:25:21 +0100 (CET)
Received: by localhost.localdomain (Postfix, from userid 0)
 id 5934E674A2; Tue,  2 Mar 2021 17:25:21 +0000 (UTC)
Message-Id: <54fd814a0c7aad690fa3aceaab5f35cb930c681a.1614705851.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1614705851.git.christophe.leroy@csgroup.eu>
References: <cover.1614705851.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 5/7] powerpc: add capability to prepend default command line
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 danielwa@cisco.com, robh@kernel.org, daniel@gimpelevich.san-francisco.ca.us
Date: Tue,  2 Mar 2021 17:25:21 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, devicetree@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch activates the capability to prepend default
arguments to the command line.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 386ae12d8523..0ab406f14513 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -912,6 +912,12 @@ config CMDLINE_EXTEND
 	  The command-line arguments provided by the boot loader will be
 	  appended to the default kernel command string.
 
+config CMDLINE_PREPEND
+	bool "Prepend bootloader kernel arguments"
+	help
+	  The default kernel command string will be prepend to the
+	  command-line arguments provided during boot.
+
 config CMDLINE_FORCE
 	bool "Always use the default kernel command string"
 	help
-- 
2.25.0

