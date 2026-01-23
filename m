Return-Path: <linuxppc-dev+bounces-16188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6GLfL1AQc2klsAAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16188-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:08:16 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E815570BDB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jan 2026 07:08:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dy6t622rTz3blq;
	Fri, 23 Jan 2026 17:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769148477;
	cv=none; b=nzvdA3oooy9wQ9vyw1IqJiTfTrlCeYCz/UE3r55sUqYIFZCWrSF/+h4x7ea/6ONSD3Y5imYPvtBTYbejQUlVffqG2jNiEyHWTE17nhxli7/u8qMR/l3M21s12bXKxkwwEPHC8bmvTupSKInhtdrynMRu8QJNBkHnuG25QdWAfrslKhmWy1NqdR6+PcUTOfOLEcAc9Ko6EmDX5e6q8dD1gOZ5OBtfXJnc9PswWSdofdh+SEyg7S2+xF9DgahC7ecRpQqQKZBLSDzbqWdaqU7WwIsuloCE6CrDM/VEXKH6le41jPxGlLC++xK1oCDS9YZPL1HjwiEM+6o6zUvLCwUfXg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769148477; c=relaxed/relaxed;
	bh=/8RcmFg5MY8KP6euUpJE80E99dRZEPmoFPNeQ3h9l9o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=i+bmosJJ+wkYV+6qxbZihuJppmvUz6rBcTc2YtSiOL/XnxVfhy15omBIY+8/ObjrsoRcBrd/nxgsPH1nRlQM5OAqStDyQCMMenK2Bx0gft2nqWbq3e2FYKb0MKO1FQQl6+tQuoxgTPjgsjnLXFHwBeWjU2L5ZjbJ/8S6KwhSbZIxPQMJ9fc78AqnyN2HuXBiXRAX3QLKkZq7UJleLwkSEEJ8qjXb9AO2KU+l9+2CZDMGwocq5Jg1anzhjXjuBP7FSn2PPqZ2WyzyIBNsKiIp7FK4EmLm3rVptDp9Eb50myfjsVNcp0LiWrfNUye/WIZlm9q7Ai3UrIgwR2Nf7mGZtw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (unknown [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dy6t31MGGz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jan 2026 17:07:54 +1100 (AEDT)
Received: from [127.0.0.2] (unknown [210.73.43.101])
	by APP-05 (Coremail) with SMTP id zQCowACnPBAiEHNp9tMuBg--.1678S2;
	Fri, 23 Jan 2026 14:07:32 +0800 (CST)
From: Vivian Wang <wangruikang@iscas.ac.cn>
Subject: [PATCH v3 0/4] PCI/MSI: Generalize no_64bit_msi into msi_addr_mask
Date: Fri, 23 Jan 2026 14:07:27 +0800
Message-Id: <20260123-pci-msi-addr-mask-v3-0-9f9baa048524@iscas.ac.cn>
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
X-B4-Tracking: v=1; b=H4sIAB8Qc2kC/23OwW6DMAwG4FdBOc8oMZA2Pe09qk0KJqzWBHQxj
 TYh3r0pbQ+Tevwt/5+9KAmRg6hDsagYEgtPYw7VW6Ho5MevANzlrFBjYxArOBPDIAy+6yIMXr4
 Bu51t/C60ldMq984x9Py7mcePe47h55Lp+T5UrZcANA0Dz4ci2dI4iGQ+l1Xd9k8s8xT/tpeS2
 QqP6/WL68mABt1421NbtzXpdxbyUnoqady8hE/DaoPmlYHZ6GtsXGXs3u3df2Nd1ysS8Ij3KAE
 AAA==
X-Change-ID: 20251223-pci-msi-addr-mask-2d765a7eb390
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 "Creeley, Brett" <bcreeley@amd.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>
Cc: Han Gao <gaohan@iscas.ac.cn>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Thomas Gleixner <tglx@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, 
 linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
 linux-riscv@lists.infradead.org, sophgo@lists.linux.dev, 
 Takashi Iwai <tiwai@suse.de>
X-Mailer: b4 0.14.3
X-CM-TRANSID:zQCowACnPBAiEHNp9tMuBg--.1678S2
X-Coremail-Antispam: 1UD129KBjvJXoWxJFy3ZFy7CrWxur4kZryrZwb_yoWrurW8pF
	Z8GayagF48tryxKa9rCw47ZF4ayan5t34fKr1DK3sa9an0vFy8Zrn3tr45X34UXr4xJw40
	qr9rW3WkZaykuaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26ryj6F1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
	6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0pRVVbgUUUUU=
X-Originating-IP: [210.73.43.101]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-1.0 required=3.0 tests=RCVD_IN_DNSWL_MED,RDNS_NONE,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[iscas.ac.cn];
	FORGED_RECIPIENTS(0.00)[m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:bcreeley@amd.com,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:perex@perex.cz,m:tiwai@suse.com,m:gaohan@iscas.ac.cn,m:wangruikang@iscas.ac.cn,m:tglx@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:sophgo@lists.linux.dev,m:tiwai@suse.de,m:andrew@lunn.ch,s:lists@lfdr.de];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	FORGED_SENDER(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[30];
	FREEMAIL_TO(0.00)[linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-16188-lists,linuxppc-dev=lfdr.de];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	HAS_XOIP(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[wangruikang@iscas.ac.cn,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.996];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E815570BDB
X-Rspamd-Action: no action

The Sophgo SG2042 is a cursed machine in more ways than one.

The one way relevant to this patch series is that its PCIe controller
has neither INTx nor a low-address MSI doorbell wired up. Instead, the
only usable MSI doorbell is a SoC one at 0x7030010300, which is above
32-bit space.

Currently, the no_64bit_msi flag on a PCI device declares that a device
needs a 32-bit MSI address. Since no more precise indication is
possible, devices supporting less than 64 bits of MSI addresses are all
lumped into one "need 32-bit MSI address" bucket. This of course
prevents these devices from working with MSI enabled on SG2042 because a
32-bit MSI doorbell address is not possible. Combined with a lack of
INTx, some of them have trouble working on SG2042 at all.

There were previous dirtier attempts to allow overriding no_64bit_msi
for radeon [1] and hda/intel [2].

To fix this, generalize the single bit no_64bit_msi into a full address
mask msi_addr_mask to more precisely describe the restriction. The
existing DMA masks seems insufficient, as for e.g. radeon the
msi_addr_mask and coherent_dma_mask seems to be different on more recent
devices.

The patches are structured as follows:

- Patch 1 conservatively introduces msi_addr_mask, without introducing
  any functional changes (hopefully, if I've done everything right), by
  only using DMA_BIT_MASK(32) and DMA_BIT_MASK(64).
- The rest of the series actually make use of intermediate values of
  msi_addr_mask, and should be independently appliable. Patch 2 relaxes
  msi_verify_entries() to allow intermediate values of msi_addr_mask.
  Patch 3 onwards raises msi_addr_mask in individual device drivers.

I still believe this safe approach is the way to go, since we don't know
the MSI addressing limitations of *every single* PCI(e) device out
there. Brett's comment from v1 [3] indicates at least the *possibility*
of MSI mask being larger than DMA mask, so let's play it safe for now
and not randomly disable some other device's MSI just because of this
one cursed platform.

Tested on SG2042 with a Radeon R5 220 which makes use of radeon and
hda/intel. PPC changes and pensanto/ionic changes are compile-tested
only, since I do not have the hardware.

I would appreciate if driver maintainers can take a look and see whether
the masks I've set makes sense, although I believe they shouldn't cause
problems on existing platforms. I'm also not familiar with PPC enough to
touch the arch/powerpc firmware calls further - help would be
appreciated.

My intention is that the first two patches are taken up by PCI
maintainers, and the rest go through the maintainers of individual
drivers since they could use more device-specific testing and review. If
this is not convenient I'll be happy to split it up or something.

[1]: https://lore.kernel.org/all/20251220163338.3852399-1-gaohan@iscas.ac.cn/
[2]: https://lore.kernel.org/all/20251220170501.3972438-1-gaohan@iscas.ac.cn/
[3]: https://lore.kernel.org/all/970e6955-d345-48e3-8ea5-83c577ecc563@amd.com/

---
Changes in v3:
- Patch 2: %llx -> %#llx while printing addresses (Bjorn)
- Link to v2: https://lore.kernel.org/r/20260121-pci-msi-addr-mask-v2-0-f42593168989@iscas.ac.cn

Changes in v2:
- Patch 3: Fix the mask for radeon (Christian)
- Drop what was patch 5, keep the behavior for pensando unchanged for now
- Add Cc for linux-riscv and sophgo. Oops.
- Link to v1: https://lore.kernel.org/r/20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn/

---
Vivian Wang (4):
      PCI/MSI: Conservatively generalize no_64bit_msi into msi_addr_mask
      PCI/MSI: Check msi_addr_mask in msi_verify_entries()
      drm/radeon: Raise msi_addr_mask to dma_bits
      ALSA: hda/intel: Raise msi_addr_mask to dma_bits

 arch/powerpc/platforms/powernv/pci-ioda.c           |  2 +-
 arch/powerpc/platforms/pseries/msi.c                |  4 ++--
 drivers/gpu/drm/radeon/radeon_device.c              |  1 +
 drivers/gpu/drm/radeon/radeon_irq_kms.c             | 10 ----------
 drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c |  2 +-
 drivers/pci/msi/msi.c                               | 11 +++++++----
 drivers/pci/msi/pcidev_msi.c                        |  2 +-
 drivers/pci/probe.c                                 |  7 +++++++
 include/linux/pci.h                                 |  8 +++++++-
 sound/hda/controllers/intel.c                       | 10 +++++-----
 10 files changed, 32 insertions(+), 25 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251223-pci-msi-addr-mask-2d765a7eb390

Best regards,
-- 
Vivian "dramforever" Wang


