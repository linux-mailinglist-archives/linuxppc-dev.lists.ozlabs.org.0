Return-Path: <linuxppc-dev+bounces-14984-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A1ECDB5ED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 06:07:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbfxw1GKdz2yYq;
	Wed, 24 Dec 2025 16:07:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766546447;
	cv=none; b=ZKm3X95tO6DEFhfJgZedmK9zNlkk32NiBg0PuC/52cel7XnwuoWe46vE86/ttJt4/9bA9m2q3ll+dQOqS2ga9T4lDJ44gfaemesof4qs6U+qhffJ3+J0o7CbMS46G0MpWHmMcRVcMAUi8FE6Vz+uVAYNlpVHCICjNU1jcL/pmLhsYJdp4yNuONTgkiKhicMcVd1ut7vtseIOlKIfxWLVhFbzy20oqhUIuzjvWMuZYXbxEJEkLXUNkLc+fl3zWw1SOGB0Z0KeovYcRsQkCoZXlftIN8klgVa0kuCo5W+GHlafd3SCbaqxMIuA0CSKJ0Lz9KxPbBFvJ1I6IfFys6xGVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766546447; c=relaxed/relaxed;
	bh=EDV+aI9M/4aL205x+hVDvxabFX4/duFQS7By4/UR5mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lC2mzyuqVq+VCi8YYYo+nWIxFHLMXPd13VfvSH2PdrQfgtNJ768SEW5j75UQK2iLzPxNRPsGkRgQTO11HDdR+7QCaImMppSCkpQl8kHeFJYmorDprYCfQoywHpa+2bWKdL7Ur+y7zguxfZXbzyoOaJU4K8g3kNqRDRxk1NhH2TJsRN9liVlQ1mBOZ4ywe1+e330O3FAAezP2+6sDOL8mqwEryGnrySdrJcAOPvmpNij1P5UOjDRvvksg7kUM4p07H6H9OhwddtT9d4wbj7AxwEKBwgXGLKZBPNvomgnSNzFNZq1qh5Ppw90YwTAHE3uJWrZP84xVmC0ak1T7DT8JjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbcb25fgMz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 14:20:46 +1100 (AEDT)
Received: from [127.0.0.2] (unknown [114.241.82.59])
	by APP-05 (Coremail) with SMTP id zQCowADHXBDPWUtpQzS6AQ--.32153S6;
	Wed, 24 Dec 2025 11:11:12 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 24 Dec 2025 11:10:52 +0800
Subject: [PATCH 4/5] ALSA: hda/intel: Raise msi_addr_mask to dma_bits
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
Message-Id: <20251224-pci-msi-addr-mask-v1-4-05a6fcb4b4c0@iscas.ac.cn>
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
X-CM-TRANSID:zQCowADHXBDPWUtpQzS6AQ--.32153S6
X-Coremail-Antispam: 1UD129KBjvJXoW7tF4kGw13tw4DtFWDKFyrXrb_yoW8Ar45pw
	4UGayftF1jqFyrJa1kKa1DZF13CFZYkwn8GrWrK34fCa4Yyr10gF9Fkr1xJa4xGF4vgw1Y
	vrWjv3W8WF45ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
	AF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4l
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

Since msi_addr_mask is introduced, use DMA_BIT_MASK(dma_bits) instead of
DMA_BIT_MASK(32) here for msi_addr_mask, describing the restriction more
precisely and allowing these devices to work on platforms with MSI
doorbell address above 32-bit space, as long as it is within the
hardware's addressable space.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>

---

hda/intel maintainers: I don't know if this is the correct restriction.
Please help with checking. Thanks.
---
 sound/hda/controllers/intel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/hda/controllers/intel.c b/sound/hda/controllers/intel.c
index c9542ebdf7e2..a44de2306a2b 100644
--- a/sound/hda/controllers/intel.c
+++ b/sound/hda/controllers/intel.c
@@ -1903,11 +1903,6 @@ static int azx_first_init(struct azx *chip)
 		chip->gts_present = true;
 #endif
 
-	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
-		dev_dbg(card->dev, "Disabling 64bit MSI\n");
-		pci->msi_addr_mask = DMA_BIT_MASK(32);
-	}
-
 	pci_set_master(pci);
 
 	gcap = azx_readw(chip, GCAP);
@@ -1958,6 +1953,11 @@ static int azx_first_init(struct azx *chip)
 		dma_set_mask_and_coherent(&pci->dev, DMA_BIT_MASK(32));
 	dma_set_max_seg_size(&pci->dev, UINT_MAX);
 
+	if (chip->msi && chip->driver_caps & AZX_DCAPS_NO_MSI64) {
+		dev_dbg(card->dev, "Restricting MSI to %u-bit\n", dma_bits);
+		pci->msi_addr_mask = DMA_BIT_MASK(dma_bits);
+	}
+
 	/* read number of streams from GCAP register instead of using
 	 * hardcoded value
 	 */

-- 
2.51.2


