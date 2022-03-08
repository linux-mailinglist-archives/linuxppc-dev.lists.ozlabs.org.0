Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C954D214A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 20:21:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KClYC2cJgz3bZR
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 06:21:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KClXn6ywfz2xC6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 06:20:38 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KClXh6dmCz9sSY;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ybODevLGLuFg; Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KClXh5pY9z9sSV;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AF2A08B786;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4sDAj8rm35dU; Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.9])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 35EB18B77E;
 Tue,  8 Mar 2022 20:20:36 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 228JKTYW3553853
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 8 Mar 2022 20:20:29 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 228JKTrX3553852;
 Tue, 8 Mar 2022 20:20:29 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v1 4/6] powerpc: Add missing declaration in asm/drmem.h
Date: Tue,  8 Mar 2022 20:20:23 +0100
Message-Id: <5643ec410e51b749db0636471cb7979524f9ed0e.1646767214.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
References: <3c88286b55413730d7784133993a46ef4a3607ce.1646767214.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1646767223; l=760; s=20211009;
 h=from:subject:message-id; bh=mekaVXTCPn1sNWhK8UYxAQp3WpMd9vw87Reer+CRQmk=;
 b=QXnOnQ/tl8tULBuWRmeBgrwwlHLaC0B9LzxHvy4gRu3eUqploNsEUaSxX47nWyTdhyTPEkGaZCvz
 6Nskw2+eAEZaG2Mjrz1ZW4YyRheNLm16IKe5c2qDvzCbY4xuyF9j
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

Don't rely on random inclusion of linux/of.h by users
of asm/drmem.h

Add a forward declaration of struct property and
struct device_node.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/drmem.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
index 4265d5e95c2c..13bf6dee8e2d 100644
--- a/arch/powerpc/include/asm/drmem.h
+++ b/arch/powerpc/include/asm/drmem.h
@@ -23,6 +23,9 @@ struct drmem_lmb_info {
 	u64                     lmb_size;
 };
 
+struct device_node;
+struct property;
+
 extern struct drmem_lmb_info *drmem_info;
 
 static inline struct drmem_lmb *drmem_lmb_next(struct drmem_lmb *lmb,
-- 
2.34.1

