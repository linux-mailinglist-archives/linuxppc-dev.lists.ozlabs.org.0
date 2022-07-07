Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7319D56A562
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 16:28:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdzLG2r9Jz3f7h
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Jul 2022 00:28:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdzK264zBz3cdM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jul 2022 00:27:50 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4LdzJm3j8Vz9tGb;
	Thu,  7 Jul 2022 16:27:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0uB7LieCrfBd; Thu,  7 Jul 2022 16:27:36 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4LdzJk1VrLz9tGf;
	Thu,  7 Jul 2022 16:27:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 248418B768;
	Thu,  7 Jul 2022 16:27:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CacGwGZP75Y9; Thu,  7 Jul 2022 16:27:34 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.233.174])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E548F8B79F;
	Thu,  7 Jul 2022 16:27:33 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 267ERT5t537825
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 7 Jul 2022 16:27:29 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 267ERTZ3537824;
	Thu, 7 Jul 2022 16:27:29 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2 4/4] powerpc: Finally remove unnecessary headers from asm/prom.h
Date: Thu,  7 Jul 2022 16:27:04 +0200
Message-Id: <f1903e53ce71685cda46e8c6be0d287d4a580143.1657204012.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <d107b9ed8b4ba5d10d1df7ba6317c36d07f2317e.1657204012.git.christophe.leroy@csgroup.eu>
References: <d107b9ed8b4ba5d10d1df7ba6317c36d07f2317e.1657204012.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1657204023; l=1143; s=20211009; h=from:subject:message-id; bh=rhMeWgMRVJCcnZ4LkUB/MevA+zWJ66UrLEuQIoq1Yg0=; b=G0WIU5plSD2sEfmcdSgEna8elpVP61NvtTlhaaMw66yT1yvcEWW3qjOj+ROYRKaqeu/UL0wjcfGB D3tj5DR6Cw+0SvKw0X80RUXMkYFouOfW5/q3muvsCeQC4RFDcpge
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Remove all headers included from asm/prom.h which are not used
by asm/prom.h itself.

Declare struct device_node and struct property locally to
avoid including of.h

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/prom.h | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/include/asm/prom.h b/arch/powerpc/include/asm/prom.h
index 6f109b5cb84e..2e82820fbd64 100644
--- a/arch/powerpc/include/asm/prom.h
+++ b/arch/powerpc/include/asm/prom.h
@@ -12,16 +12,10 @@
  * Updates for PPC64 by Peter Bergner & David Engebretsen, IBM Corp.
  */
 #include <linux/types.h>
-#include <asm/irq.h>
-#include <linux/atomic.h>
 #include <asm/firmware.h>
 
-/* These includes should be removed once implicit includes are cleaned up. */
-#include <linux/of.h>
-#include <linux/of_fdt.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
-#include <linux/platform_device.h>
+struct device_node;
+struct property;
 
 #define OF_DT_BEGIN_NODE	0x1		/* Start of node, full name */
 #define OF_DT_END_NODE		0x2		/* End node */
-- 
2.36.1

