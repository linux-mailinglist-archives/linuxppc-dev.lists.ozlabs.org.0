Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F9219A1B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 09:37:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2Sfz02WrzDr9N
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 17:36:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=CeYbgd7M; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2STz5mZGzDqyc
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 17:29:11 +1000 (AEST)
Received: from kozik-lap.mshome.net (unknown [194.230.155.195])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EF6E72073A;
 Thu,  9 Jul 2020 07:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594279747;
 bh=1OlynJThW+neP7pY3D7VyCLvh+Wto82XT3VjJdSrf14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CeYbgd7M7raXSRvjskZzCtfjiycAwkJSBQbaYu7SzskR+FdjOBJrPceWVDV2X+OEo
 wHxkB+BI5BO5O3chlrCGr7w6EPsitCmWmkZCYBWSFz8Zc40aAGUahEYYYI3PRdIg8z
 FrXikqSbMIQzhNovF0HG+T4q1vtDnEkxMhBT0lbc=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrew Morton <akpm@linux-foundation.org>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, virtualization@lists.linux-foundation.org,
 linux-arch@vger.kernel.org
Subject: [PATCH v3 3/4] ntb: intel: Constify ioreadX() iomem argument (as in
 generic implementation)
Date: Thu,  9 Jul 2020 09:28:36 +0200
Message-Id: <20200709072837.5869-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200709072837.5869-1-krzk@kernel.org>
References: <20200709072837.5869-1-krzk@kernel.org>
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ioreadX() helpers have inconsistent interface.  On some architectures
void *__iomem address argument is a pointer to const, on some not.

Implementations of ioreadX() do not modify the memory under the address
so they can be converted to a "const" version for const-safety and
consistency among architectures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Dave Jiang <dave.jiang@intel.com>
---
 drivers/ntb/hw/intel/ntb_hw_gen1.c  | 2 +-
 drivers/ntb/hw/intel/ntb_hw_gen3.h  | 2 +-
 drivers/ntb/hw/intel/ntb_hw_intel.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/ntb/hw/intel/ntb_hw_gen1.c b/drivers/ntb/hw/intel/ntb_hw_gen1.c
index 423f9b8fbbcf..3185efeab487 100644
--- a/drivers/ntb/hw/intel/ntb_hw_gen1.c
+++ b/drivers/ntb/hw/intel/ntb_hw_gen1.c
@@ -1205,7 +1205,7 @@ int intel_ntb_peer_spad_write(struct ntb_dev *ntb, int pidx, int sidx,
 			       ndev->peer_reg->spad);
 }
 
-static u64 xeon_db_ioread(void __iomem *mmio)
+static u64 xeon_db_ioread(const void __iomem *mmio)
 {
 	return (u64)ioread16(mmio);
 }
diff --git a/drivers/ntb/hw/intel/ntb_hw_gen3.h b/drivers/ntb/hw/intel/ntb_hw_gen3.h
index 2bc5d8356045..dea93989942d 100644
--- a/drivers/ntb/hw/intel/ntb_hw_gen3.h
+++ b/drivers/ntb/hw/intel/ntb_hw_gen3.h
@@ -91,7 +91,7 @@
 #define GEN3_DB_TOTAL_SHIFT		33
 #define GEN3_SPAD_COUNT			16
 
-static inline u64 gen3_db_ioread(void __iomem *mmio)
+static inline u64 gen3_db_ioread(const void __iomem *mmio)
 {
 	return ioread64(mmio);
 }
diff --git a/drivers/ntb/hw/intel/ntb_hw_intel.h b/drivers/ntb/hw/intel/ntb_hw_intel.h
index d61fcd91714b..05e2335c9596 100644
--- a/drivers/ntb/hw/intel/ntb_hw_intel.h
+++ b/drivers/ntb/hw/intel/ntb_hw_intel.h
@@ -103,7 +103,7 @@ struct intel_ntb_dev;
 struct intel_ntb_reg {
 	int (*poll_link)(struct intel_ntb_dev *ndev);
 	int (*link_is_up)(struct intel_ntb_dev *ndev);
-	u64 (*db_ioread)(void __iomem *mmio);
+	u64 (*db_ioread)(const void __iomem *mmio);
 	void (*db_iowrite)(u64 db_bits, void __iomem *mmio);
 	unsigned long			ntb_ctl;
 	resource_size_t			db_size;
-- 
2.17.1

