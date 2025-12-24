Return-Path: <linuxppc-dev+bounces-14982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B4F2CDB5E7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 06:07:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbfxg0VY0z2yGQ;
	Wed, 24 Dec 2025 16:07:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766546447;
	cv=none; b=HcuggYbh/z3aTDpZO/JCDgUhUfcWfATPsMw/tLQJzu0Np8urUCQNKCB38BYrEvhoHO78UjQ0DmZNY/bWrMP+CmrGzTgjI8I6USMQzUfRISTB1h/tKptRvH1mjmYd1b7a5GXOZsPh6vrMO2WpRrYipALUJjknWJvk18NkwW1PQw5Xc5PSX1wm8LnOhkMru3aYGOFksziKu69YC4Rl/eQM87fbNDb9risSsymDTPh1OHpBUGCTIxIFrWPsIGz+ECsOBEUSujJhEav0Tp3nL+QfMTpOh7YDMMiFlZ04EesyWOkrRoi4rnMiQ3mfKTTr0DlxYlEhH9PAAemxmDEPdvohog==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766546447; c=relaxed/relaxed;
	bh=xPhTVv1fqR/DiJhTM015FSvHMu1IOfFcHcCOFoyv5cU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=j2B/Wv6PtP9skcSEBbwlu57tmt4KcaXgHE2v2UiyHQvwmW4MvkYmKgo3Zpy507IcccaBFDbd8fgtPNxsGqNXs9p6f8XJdXRtSEETeU5ZRjLjITb8Jbt4AXH1JguH3ky4yzExQADrdMmgFpzwzpjfPxDS7OJH6GEgnjYdIMEEerLVju69RbcDpoREMMGjrEYIiqeZHLbfihpwOYbeQdJBfIPU83RNDR2KRSKfZVNDAk3BmSWDRRG6L9yZeryfNqJsrYM+cmXp8916q+C7PE0+ZomDcS8OpB3DU1wvFuhnEiT+MXI0DsMbe5A7igXM0QcdLb0q59EnBrm0wd7UPvLW2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbcb25ZDLz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 14:20:46 +1100 (AEDT)
Received: from [127.0.0.2] (unknown [114.241.82.59])
	by APP-05 (Coremail) with SMTP id zQCowADHXBDPWUtpQzS6AQ--.32153S5;
	Wed, 24 Dec 2025 11:11:12 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Date: Wed, 24 Dec 2025 11:10:51 +0800
Subject: [PATCH 3/5] drm/radeon: Raise msi_addr_mask to 40 bits for
 pre-Bonaire
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
Message-Id: <20251224-pci-msi-addr-mask-v1-3-05a6fcb4b4c0@iscas.ac.cn>
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
X-CM-TRANSID:zQCowADHXBDPWUtpQzS6AQ--.32153S5
X-Coremail-Antispam: 1UD129KBjvJXoW7Wr1xWFW7JryDKr1UWrW7Jwb_yoW8JF1kpa
	98Ca9xKrZIy34jka9rCa9rZF15Aa18KayrGrZrG3y3Ww1YyFyj9FZIvw17Jw1kXr1vgr4j
	vFy8Ga1rZF109FJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_JrWl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j6F4UJw
	A2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1l
	e2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI
	8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwAC
	jcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2Y2ka0x
	kIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_
	Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1V
	AY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAI
	cVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnI
	WIevJa73UjIFyTuYvjTRM6wCDUUUU
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The code was originally written using no_64bit_msi, which restricts the
device to 32-bit MSI addresses.

Since msi_addr_mask is introduced, use DMA_BIT_MASK(40) instead of
DMA_BIT_MASK(32) here for msi_addr_mask, describing the restriction more
precisely and allowing these devices to work on platforms with MSI
doorbell address above 32-bit space, as long as it is within the
hardware restriction of 40-bit space.

Signed-off-by: Vivian Wang <wangruikang@iscas.ac.cn>
---
 drivers/gpu/drm/radeon/radeon_irq_kms.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_irq_kms.c b/drivers/gpu/drm/radeon/radeon_irq_kms.c
index d550554a6f3f..ea519d43348b 100644
--- a/drivers/gpu/drm/radeon/radeon_irq_kms.c
+++ b/drivers/gpu/drm/radeon/radeon_irq_kms.c
@@ -251,8 +251,8 @@ static bool radeon_msi_ok(struct radeon_device *rdev)
 	 * IBM POWER servers, so we limit them
 	 */
 	if (rdev->family < CHIP_BONAIRE) {
-		dev_info(rdev->dev, "radeon: MSI limited to 32-bit\n");
-		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(32);
+		dev_info(rdev->dev, "radeon: MSI limited to 40-bit\n");
+		rdev->pdev->msi_addr_mask = DMA_BIT_MASK(40);
 	}
 
 	/* force MSI on */

-- 
2.51.2


