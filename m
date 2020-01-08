Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33923134D8C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2020 21:29:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tLSR1pcczDqWt
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 07:29:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=krzk@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="uacif0ui"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tKz31p1jzDqS5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 07:07:11 +1100 (AEDT)
Received: from localhost.localdomain (unknown [83.218.167.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 45F7F2070E;
 Wed,  8 Jan 2020 20:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1578514029;
 bh=e7zymn5GkwXFBJ9xZ48Z4+1aODcYqk4TrhvOgBsVevY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uacif0uikEAKR8gpyD7Ls1NQI8Y6LsrG1L/r1o4hEjkq1Wwh+zgyPZ47gh8ceWBCk
 vWBz4kRD0kxM96/7ABU7hPXwiIzwJ6gtZlvNehakTu9WI+k8NatOKFhPCrBa1sx28l
 cpvYGF3xktkqqjlDb2jAQUKLkXSIhWAXFeHArp1s=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jiri Slaby <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, virtualization@lists.linux-foundation.org,
 linux-arch@vger.kernel.org
Subject: [PATCH v2 9/9] net: wireless: ath5k: Constify ioreadX() iomem
 argument (as in generic implementation)
Date: Wed,  8 Jan 2020 21:05:28 +0100
Message-Id: <20200108200528.4614-10-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200108200528.4614-1-krzk@kernel.org>
References: <20200108200528.4614-1-krzk@kernel.org>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The ioreadX() helpers have inconsistent interface.  On some architectures
void *__iomem address argument is a pointer to const, on some not.

Implementations of ioreadX() do not modify the memory under the address
so they can be converted to a "const" version for const-safety and
consistency among architectures.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/net/wireless/ath/ath5k/ahb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath5k/ahb.c b/drivers/net/wireless/ath/ath5k/ahb.c
index 2c9cec8b53d9..8bd01df369fb 100644
--- a/drivers/net/wireless/ath/ath5k/ahb.c
+++ b/drivers/net/wireless/ath/ath5k/ahb.c
@@ -138,18 +138,18 @@ static int ath_ahb_probe(struct platform_device *pdev)
 
 	if (bcfg->devid >= AR5K_SREV_AR2315_R6) {
 		/* Enable WMAC AHB arbitration */
-		reg = ioread32((void __iomem *) AR5K_AR2315_AHB_ARB_CTL);
+		reg = ioread32((const void __iomem *) AR5K_AR2315_AHB_ARB_CTL);
 		reg |= AR5K_AR2315_AHB_ARB_CTL_WLAN;
 		iowrite32(reg, (void __iomem *) AR5K_AR2315_AHB_ARB_CTL);
 
 		/* Enable global WMAC swapping */
-		reg = ioread32((void __iomem *) AR5K_AR2315_BYTESWAP);
+		reg = ioread32((const void __iomem *) AR5K_AR2315_BYTESWAP);
 		reg |= AR5K_AR2315_BYTESWAP_WMAC;
 		iowrite32(reg, (void __iomem *) AR5K_AR2315_BYTESWAP);
 	} else {
 		/* Enable WMAC DMA access (assuming 5312 or 231x*/
 		/* TODO: check other platforms */
-		reg = ioread32((void __iomem *) AR5K_AR5312_ENABLE);
+		reg = ioread32((const void __iomem *) AR5K_AR5312_ENABLE);
 		if (to_platform_device(ah->dev)->id == 0)
 			reg |= AR5K_AR5312_ENABLE_WLAN0;
 		else
@@ -202,12 +202,12 @@ static int ath_ahb_remove(struct platform_device *pdev)
 
 	if (bcfg->devid >= AR5K_SREV_AR2315_R6) {
 		/* Disable WMAC AHB arbitration */
-		reg = ioread32((void __iomem *) AR5K_AR2315_AHB_ARB_CTL);
+		reg = ioread32((const void __iomem *) AR5K_AR2315_AHB_ARB_CTL);
 		reg &= ~AR5K_AR2315_AHB_ARB_CTL_WLAN;
 		iowrite32(reg, (void __iomem *) AR5K_AR2315_AHB_ARB_CTL);
 	} else {
 		/*Stop DMA access */
-		reg = ioread32((void __iomem *) AR5K_AR5312_ENABLE);
+		reg = ioread32((const void __iomem *) AR5K_AR5312_ENABLE);
 		if (to_platform_device(ah->dev)->id == 0)
 			reg &= ~AR5K_AR5312_ENABLE_WLAN0;
 		else
-- 
2.17.1

