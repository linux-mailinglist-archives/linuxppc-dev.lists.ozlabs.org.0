Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 55580EA84B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 01:36:31 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473RG42QPdzF3GY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 11:36:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="P8q6ecGk"; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473R924pgjzF3wC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 11:32:05 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id q70so4069394wme.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 17:32:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nviaR21RiU1nk2LZ5kFcjxEatw3WuqbBoBTo8fSflGU=;
 b=P8q6ecGkOH1cz6KavvYnvhkldy2tb8GnfywHDNOSmTJurUs0VpLx+KuDDNh7MPM44L
 5e0MnvX5DsJLANeS+IemAzatJQb4T0LUS6sA2On5F0pFAuLI6/uos7sX+kGwmdNe2rhz
 ZoQU3hea1E0m/TW45ofs64T/Ul8kX5U8MdK/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nviaR21RiU1nk2LZ5kFcjxEatw3WuqbBoBTo8fSflGU=;
 b=kiNtJDtRxUQeJPCOP06EYbki8F6Ix7xM1b5GmypQ4rW5XhT/B8uaTzKrZ2GsqgugQE
 QFq509mcT8Q9RClpCJS9irT/mm3ds8km5P1Uy8H3L1yIks38NsSM4v7bGKuLzDzeEbOr
 497HadZWb0KFmU+LaMYkmL/cR+kvXhJOhvRd69xkjvA67F4bD4cZqb0ZSBxAw+TsqlcW
 +gHSmcC1Yo5hdLpi/v7P+hRfKt+QQ8tN0DxnQ9XoBHSiZzz3t7uBOwYxMY0qUp6DlFOL
 Mwlj1FtpAFYdWfJXmFHost/Qr99MH0Q5+68dbUHYEURgTZ2z6jLnQo7UQihNyVkijdrZ
 rZQg==
X-Gm-Message-State: APjAAAWVB//PKBl0yXJA3i+5SS3hoB8upiAu/QOAtbUFGGguaBpva4LD
 6HSbv4SLLeDgvKZ+nUJzRwoOYw==
X-Google-Smtp-Source: APXvYqw3+GGNKPWfeYgL+Q1AJ6aouq9nqy+A5TiFT/Z3iyOgjPBzEBNst1ROKUpNxsiK1ff/4oXKsA==
X-Received: by 2002:a1c:558a:: with SMTP id j132mr2103148wmb.21.1572481921871; 
 Wed, 30 Oct 2019 17:32:01 -0700 (PDT)
Received: from prevas-ravi.prevas.se (ip-5-186-115-54.cgn.fibianet.dk.
 [5.186.115.54])
 by smtp.gmail.com with ESMTPSA id r13sm2357111wra.74.2019.10.30.17.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Oct 2019 17:32:01 -0700 (PDT)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 1/5] asm-generic: move pcu_iounmap from iomap.h to
 pci_iomap.h
Date: Thu, 31 Oct 2019 01:31:50 +0100
Message-Id: <20191031003154.21969-2-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191031003154.21969-1-linux@rasmusvillemoes.dk>
References: <20191031003154.21969-1-linux@rasmusvillemoes.dk>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

pci_iounmap seems misplaced in iomap.h. Move it to where its cousins
live. Since iomap.h includes pci_iomap.h, anybody relying on getting
the declaration through iomap.h will still get it.

It would be natural to put the static inline version inside the

#elif defined(CONFIG_GENERIC_PCI_IOMAP)

Since GENERIC_IOMAP selects GENERIC_PCI_IOMAP, that would be ok for
those who select GENERIC_IOMAP. However, I fear there are some that
select GENERIC_PCI_IOMAP without GENERIC_IOMAP, and which perhaps have
their own pci_iounmap stub definition somewhere. So for now at least,
define the static inline version under the same conditions as it were
in iomap.h.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 include/asm-generic/iomap.h     | 10 ----------
 include/asm-generic/pci_iomap.h |  7 +++++++
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/include/asm-generic/iomap.h b/include/asm-generic/iomap.h
index a008f504a2d0..5f8321e8fea9 100644
--- a/include/asm-generic/iomap.h
+++ b/include/asm-generic/iomap.h
@@ -101,16 +101,6 @@ extern void ioport_unmap(void __iomem *);
 #define ioremap_wt ioremap_nocache
 #endif
 
-#ifdef CONFIG_PCI
-/* Destroy a virtual mapping cookie for a PCI BAR (memory or IO) */
-struct pci_dev;
-extern void pci_iounmap(struct pci_dev *dev, void __iomem *);
-#elif defined(CONFIG_GENERIC_IOMAP)
-struct pci_dev;
-static inline void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
-{ }
-#endif
-
 #include <asm-generic/pci_iomap.h>
 
 #endif
diff --git a/include/asm-generic/pci_iomap.h b/include/asm-generic/pci_iomap.h
index d4f16dcc2ed7..c2f78db2420e 100644
--- a/include/asm-generic/pci_iomap.h
+++ b/include/asm-generic/pci_iomap.h
@@ -18,6 +18,8 @@ extern void __iomem *pci_iomap_range(struct pci_dev *dev, int bar,
 extern void __iomem *pci_iomap_wc_range(struct pci_dev *dev, int bar,
 					unsigned long offset,
 					unsigned long maxlen);
+/* Destroy a virtual mapping cookie for a PCI BAR (memory or IO) */
+extern void pci_iounmap(struct pci_dev *dev, void __iomem *);
 /* Create a virtual mapping cookie for a port on a given PCI device.
  * Do not call this directly, it exists to make it easier for architectures
  * to override */
@@ -52,4 +54,9 @@ static inline void __iomem *pci_iomap_wc_range(struct pci_dev *dev, int bar,
 }
 #endif
 
+#if !defined(CONFIG_PCI) && defined(CONFIG_GENERIC_IOMAP)
+static inline void pci_iounmap(struct pci_dev *dev, void __iomem *addr)
+{ }
+#endif
+
 #endif /* __ASM_GENERIC_IO_H */
-- 
2.23.0

