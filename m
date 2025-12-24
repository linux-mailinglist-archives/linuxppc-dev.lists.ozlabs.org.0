Return-Path: <linuxppc-dev+bounces-14979-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C450CDB5C3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 06:04:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbftf2ZpVz2xqG;
	Wed, 24 Dec 2025 16:04:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766546267;
	cv=none; b=gCBSibK9DsBQaHmXmrW3fSCOLKi944+hlTXocvXdSDLFW8N5eNBSEjb/UtbbyKZ4tjZ3CsyU02sqtftuvu3W+uvTgRjt9eA+95Suv0SsnSl0geCbnGBRuTsKiCvfyfTvm1wvyAMXsx5bDFwjffv650AnqSel4fNNb/WbuecNzk/2S/PDMhzhaCI4CwplZZ7DCG6o2qAmGZQmudAV7URSDcy1xWTSdpmv9B8Zr6JpqQ22KqF9qyeLRYto3UoYTbHnuP6c+ePuxbMN+tEy/FI+5yGLyhDq+Po0o4UxroToqy+ocQyI3NIa+ll6CBPxxOMVlbKvO3j32OSaZg4JCARKJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766546267; c=relaxed/relaxed;
	bh=e1iBEtJrnotlEwXR3QKiIgTIe4elgnJ7bMXeqBQumbc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CAQY0AK3CVah5J70Fs+KgB2hTj2ENex39/SJc280Gvr+o4lw5BknEtl7C3C7i9C7qXji93aepNwZbql+upEeBTP5qCxiUxHX58zegEv5AeboLHGq7A8YzzOlVG+sfGOXPcuQi5GgTG9uJnVUhLKMeEZzgSSEvAc+j1+zzykEI4A+BUbP7P1vrSNsjDNu0La34X72YiDLylb6g8qldkaiahmMbKzyxJeFSD7uO24g0KIUP+8rJQGN8PhsE5dUcDRFGHxHe/TPlxiSFvpSyP02lcLsNo5bempScOPvyxfi8WieIVPuKJ1a9K4E7tv8r7TP0ix2VadpFiF4krGUaQBzNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbcWZ4mddz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 14:17:46 +1100 (AEDT)
Received: from [127.0.0.2] (unknown [114.241.82.59])
	by APP-05 (Coremail) with SMTP id zQCowADHXBDPWUtpQzS6AQ--.32153S7;
	Wed, 24 Dec 2025 11:11:12 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 24 Dec 2025 11:10:53 +0800
Subject: [PATCH RFC net-next 5/5] net: ionic: Set msi_addr_mask to
 IONIC_ADDR_LEN-bit everywhere
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-pci-msi-addr-mask-v1-5-05a6fcb4b4c0@iscas.ac.cn>
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
In-Reply-To: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Brett Creeley <brett.creeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 Vivian Wang <wangruikang@iscas.ac.cn>
X-Mailer: b4 0.14.3
X-CM-TRANSID:zQCowADHXBDPWUtpQzS6AQ--.32153S7
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4kXFWruF1rGF13GF15urg_yoW8WF1Dpa
	98Ga4Iqr4rXryUGa1vyw4kZF98AayFkry5Wrn3Z3sa93sxtFy8tF17tF9xJ34UXrW8ua1S
	qFyjkw15XFn8Za7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmq14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JF0E3s1l82xGYI
	kIc2x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2
	z4x0Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F
	4UJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE
	3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2I
	x0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8
	JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2
	ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Y
	z7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zV
	AF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_JFI_Gr1l
	IxAIcVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r
	1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIY
	CTnIWIevJa73UjIFyTuYvjTRNdb1DUUUU
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The code was originally written using no_64bit_msi, which restricts the
device to 32-bit MSI addresses.

Since msi_addr_mask is introduced, use DMA_BIT_MASK(IONIC_ADDR_LEN)
instead of DMA_BIT_MASK(32) here for msi_addr_mask, describing the
restriction more precisely and allowing these devices to work on
platforms with MSI doorbell address above 32-bit space, as long as it is
within the hardware's addressable space.

Also remove #ifdef CONFIG_PPC64 wrapped around it, since this is a
hardware restriction and not a platform one.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

---

RFC because net-next is closed

pensando maintainers: I don't know if this is the actual restriction,
and do not have any Pensando device to test this. Please help with
checking this.  Thanks.
---
 drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
index 0671deae9a28..16133537c535 100644
--- a/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
+++ b/drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c
@@ -329,10 +329,8 @@ static int ionic_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 		goto err_out;
 	}
 
-#ifdef CONFIG_PPC64
 	/* Ensure MSI/MSI-X interrupts lie within addressable physical memory */
-	pdev->msi_addr_mask = DMA_BIT_MASK(32);
-#endif
+	pdev->msi_addr_mask = DMA_BIT_MASK(IONIC_ADDR_LEN);
 
 	err = ionic_setup_one(ionic);
 	if (err)

-- 
2.51.2


