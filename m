Return-Path: <linuxppc-dev+bounces-14985-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6420ACDB5F6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 06:07:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbfyf72Qyz2yKn;
	Wed, 24 Dec 2025 16:07:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766551926;
	cv=none; b=l88mIc//df/pyro5N7HzEgCtKXUFqFMDVsWZWBkvkJEuRot9cl+O8T85MRpv9T2wukwCvv7Lp5CM6yEQckbcczwwCoVEt1m3NnRlxJweZRDPh6owTNyqSl8ODsBki98HjkvLgb7xb3mgEIFmzGN+O/WHNhEH+fdezxKCbgw3d8hzSr1YX1omVbQ8j9BcMfFSP2bryy+wCtmxw4ndGUnIEIGUfva4O6uv1hEqqMamniaOp7xkC9au2hi19v/rlDQ3Rcy50fhhZmTjE0Q7bPC+n5c2BcW9vIwY4ZbrOjN9AM130CTeJwZvZRWoDiGhHEzbbFmgXHf7oWzp2LpmsOIUAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766551926; c=relaxed/relaxed;
	bh=x6/MMeD5/AUdp0FVFwFdO42dOdeFpKNO7VU0ajUp0cw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WoTV3BNioYRJ3w6WFP33mBUqGnwAuv3aeAKaBx900++bKlpiAhqiB+iO0oQ0y/q5oN2wxjGErKAnJq59tIzUiiDNvWyI1SA6WbWzcdOlS1ZoEb977vmmIL+lKdmzZiK31InPflGP3e12YwFgE1R1nmsm9lj0XgRqdIyoNRX3unjplkCGCdxK6q7qRV5eRv8vkB/ewGUYjbn+KJUs8lY4TTV+Tn49AJnhA3kRJoEc0qfTrs1LXmlPahqfgOz6B1H2ld8jCK7OFe26dRj7+hjSRTEtQQGHZTyX0h5yyEUzy2ibqzDdGMf30BFvh4OOPjP1/EwoponQh6yXhXxQGyqOJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=wangruikang@iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbfcP1Hb3z2x99
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 15:52:04 +1100 (AEDT)
Received: from [192.168.0.109] (unknown [114.241.82.59])
	by APP-05 (Coremail) with SMTP id zQCowADHWAxmcUtp2LW8AQ--.30082S2;
	Wed, 24 Dec 2025 12:51:51 +0800 (CST)
Message-ID: <2eb2ad42-67e7-4f5b-bade-4a3627eb270c@iscas.ac.cn>
Date: Wed, 24 Dec 2025 12:51:51 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] PCI/MSI: Generalize no_64bit_msi into msi_addr_mask
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
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
 linux-riscv@lists.infradead.org
References: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
Content-Language: en-US
From: Vivian Wang <wangruikang@iscas.ac.cn>
In-Reply-To: <20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:zQCowADHWAxmcUtp2LW8AQ--.30082S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Zw1rGFyUZF4fuFW7AFW8Zwb_yoW8Jw4rpF
	4UGFW3uFWFy3yftFWay3Wj9F15Z3Z3K343W3y3Kwn3ZFnIqr17XrnrGF13JwnFqrWxJr40
	qFy7Gwn0gFnxWr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvmb7Iv0xC_KF4lb4IE77IF4wAFF20E14v26ryj6rWUM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rw
	A2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_JFI_Gr1l84ACjcxK6xII
	jxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv67AKxVWxJr0_GcWl84ACjcxK6I
	8E87Iv6xkF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI
	64kE6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8Jw
	Am72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l
	c7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
	1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
	14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
	IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E
	87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4UJVWxJrUvcSsGvfC2KfnxnU
	UI43ZEXa7IUn1v3UUUUUU==
X-Originating-IP: [114.241.82.59]
X-CM-SenderInfo: pzdqw2pxlnt03j6l2u1dvotugofq/
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 12/24/25 11:10, Vivian Wang wrote:
> The Sophgo SG2042 is a cursed machine in more ways than one.
>
[...]

> ---
> Vivian Wang (5):
>       PCI/MSI: Conservatively generalize no_64bit_msi into msi_addr_mask
>       PCI/MSI: Check msi_addr_mask in msi_verify_entries()
>       drm/radeon: Raise msi_addr_mask to 40 bits for pre-Bonaire
>       ALSA: hda/intel: Raise msi_addr_mask to dma_bits
>       [RFC net-next] net: ionic: Set msi_addr_mask to IONIC_ADDR_LEN-bit everywhere
>
>  arch/powerpc/platforms/powernv/pci-ioda.c           |  2 +-
>  arch/powerpc/platforms/pseries/msi.c                |  4 ++--
>  drivers/gpu/drm/radeon/radeon_irq_kms.c             |  4 ++--
>  drivers/net/ethernet/pensando/ionic/ionic_bus_pci.c |  4 +---
>  drivers/pci/msi/msi.c                               | 11 +++++++----
>  drivers/pci/msi/pcidev_msi.c                        |  2 +-
>  drivers/pci/probe.c                                 |  7 +++++++
>  include/linux/pci.h                                 |  8 +++++++-
>  sound/hda/controllers/intel.c                       | 10 +++++-----
>  9 files changed, 33 insertions(+), 19 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251223-pci-msi-addr-mask-2d765a7eb390
>
> Best regards,

+cc linux-riscv and sophgo lists. Please see:

    https://lore.kernel.org/r/20251224-pci-msi-addr-mask-v1-0-05a6fcb4b4c0@iscas.ac.cn/

This is what happens when I rely on get_maintainers.pl too much...


