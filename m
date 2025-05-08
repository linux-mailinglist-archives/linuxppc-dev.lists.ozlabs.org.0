Return-Path: <linuxppc-dev+bounces-8429-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C437CAAF457
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 May 2025 09:10:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZtNZT4QmXz2xPc;
	Thu,  8 May 2025 17:10:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::331"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746688241;
	cv=none; b=SwRUlAvfu6hIFFvl0BZICgLcVWabun0HtHYOfJ1Y5g0tpxoGPGBToKB4fn8eLe+XWWW/XnwQZJu6wzuLxL80mCOQ1xTnTuu5kXTVuf8chakdJwe2wWP9YR4f1dka1xF5z9qHEZ8u5zMIh16QsP2lHem7ij0BZf27gi+4V58CFYYGwe4ZtFQ5yTVwbSYUi+iS4O05tl9l/FKoSVrCvAcgNXNUqaQfDrC9COY532r1VEcREgQ8eA/Y4CIn+3AnPV8mVB5tJTWgwF14lirEpimheXJZUht1Wm09j8Ps80WY4rrQ3dR+sBu+58y1urr0uvuHy7yUxZU2UknoN3uvMligcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746688241; c=relaxed/relaxed;
	bh=w00OFq+nWohxSjTOLQvg8WLpoA5EQgRX6xuwn6BkYyQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D8/oCQa429Owfm9e7vW2SpsswI9grWujnDdebd8MeDrr47KVPr44E0YCgnIbCag1mblLzX/rXeUb/igIMxhW9sxkdZpdlDyudy/xNDgfk4Vt95rGsicMgrNKx3hANVIItc3D8bq4XyimkFmPv6xoU2/EIefPEq/fkWvdSvMTjv/EC8uMv6zMys+WPWvl3X2rQojuQFhoP5xx18sB6HxG51uW+QKqn5NEbBH5YuXhbFgB9y4LbxKf+J+A4knhszN7kmqsRQAR048jcfQKfU8im/6xzeWqpkANEdjeKiUOpF1FW0A+Elrjn3CfX91JguBcoBAkRMvHrGPOnpLQAumZMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xui01JON; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Xui01JON;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331; helo=mail-wm1-x331.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZtNZR6JP9z2xBb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 May 2025 17:10:38 +1000 (AEST)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so6355455e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 May 2025 00:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746688235; x=1747293035; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=w00OFq+nWohxSjTOLQvg8WLpoA5EQgRX6xuwn6BkYyQ=;
        b=Xui01JONoNo5e5HiciappKPhEBGyMwTOzuLz9C85Bk1DJKBJF7vpX9YZLcGDYBMYWr
         dGaLyVer4gYx4b+TmCSb8wvquu8iEykbtuWBKbQlS3zUE9EAeBa2WMNNTZkEYZ5UsZvu
         s5WlK/gjh5M7apJSuOVwRYzSOPl32H/5cjTZ2xmBOyBgy0SAFDXnetV9wjgi45RsdBMa
         sG+CKYwASJDk7jzwCvJDP/eVHTEG4clQPI1sYeAiMK8hDueT50TtbsjkO/rh5CldeIAo
         /NdfXPI3uzoPuC5eydiCo4kE07DNibO+8LZurfFurDeM7XBsCn6AqoZpmIx0QnkwJf+8
         /8QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746688235; x=1747293035;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w00OFq+nWohxSjTOLQvg8WLpoA5EQgRX6xuwn6BkYyQ=;
        b=Zyj4NfoHv3nbaYUaG+nzxMzXnpRDOl/EGcR7vz6Wfy8F4NB3yrjWwESi5rZmtsADTu
         Jy6RADla6BkdtNkjq0zHQFEnRSNchsO0kuwepzOxcRLmOLRsqMjoffznQlAQG9qdWJbd
         HcqCJXkwccoHL64jfLRWfjoSPxHFE7I5xztIH1hL7wNOtk0ZF++dwWFUSM3MuEchyQDn
         3AUGUCH7X6HBv2sqhUfJIkzaFH/fSPEQZ99dWdiO+qHHwt1/iK8a1uQsGbK+8I0G3rfT
         ggwP1tyHDMY/vHGJS/En/jSHDaVvfD1OYtITs+tXVn+DIA+ZdXiFQxsq/xPA+HY12Ne0
         ViXg==
X-Forwarded-Encrypted: i=1; AJvYcCUQ0Z5oNJgMmCrlxc1ItzBaIdWwW60YJCsaAitiS+Cz/APPKGWKzdf1bYulFBuwLvjdj2lzlzv/kYgkJBc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxNueOd8wuaSYd5CZJD1eU2L30knmvs7boGk8G287/zTvklQT2b
	Ang2/B72fXBmmctzHAYorNnD6gGBVdehGvsFkLMS7Z1fkQ1RQANtLXN27SCw/Q==
X-Gm-Gg: ASbGncv3KjUAZHQtm5jZ+OCUn/QjxqCPQ2cOT5dgzBis2hBpA9jcggT/H5hZozhknAC
	SmLihj9B5W0Slou3qNKpULCacvTxNZp2VnYO0sdemd4asy74aFLmEpqydJT2kW+bdy2j0gaeuZV
	e/jc4hyDZdbghqwxm0pYrqXReYAE63GhosrXZomEhw9mWk9N85YUR1KA2+22N1C2GuU2cE701GD
	R26irsaPqeiZY45aYdek40IMVuewH+91q+iF/j57nhvswmzec56KCm5ONIzMivEDKAj7dr5sk0P
	tQdK3FCbLKgXO30tU66HhTV+9YQln4ewc0Uh0CKMGKSsj8yqL9CdQbXnDBBpmMS/obltVIhRhkm
	GQ1/d4gViPRuypziNS3d/rGJlvpE=
X-Google-Smtp-Source: AGHT+IGyLqEV7FV8nWWqYY5qCj+3cSwPattjz/CT/mpsRNB9xus7yRn9kwCjspweE93CFzg64EvzTw==
X-Received: by 2002:a05:600c:8205:b0:43c:ed61:2c26 with SMTP id 5b1f17b1804b1-441d44c7c7bmr63780445e9.17.1746688235432;
        Thu, 08 May 2025 00:10:35 -0700 (PDT)
Received: from [127.0.1.1] (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b178absm19500236f8f.97.2025.05.08.00.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 00:10:34 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v4 0/5] PCI: Add support for resetting the slots in a
 platform specific way
Date: Thu, 08 May 2025 12:40:29 +0530
Message-Id: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
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
X-B4-Tracking: v=1; b=H4sIAOZYHGgC/3XNSw6DIBCA4asY1qVh8AF01Xs0XSAdlMSIAUPaG
 O9edGVjuvwnM98sJGJwGMmtWEjA5KLzY47qUhDT67FD6l65CWe8ZhWr6GQc0oARZxoHP1NRstZ
 qATpvkHw1BbTuvYuPZ+7exdmHz/4gwTb9byWgjCqpaq5Atlax++BGHfzVh45sWOIHAJozwDOAF
 kXTciENnIHyCIgzUGagVhqYBDCq4T/Auq5fm/p35DEBAAA=
X-Change-ID: 20250404-pcie-reset-slot-730bfa71a202
To: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>, 
 Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
 Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
 Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, 
 linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4736;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=LPKZpjoorPcJ0i3sy5Fe9gxmCowL7rHoa3+8Kx1k5I8=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoHFjoZn2Vau5rBgSkqFonGWIjBD9vXqMQSpvxQ
 iz76V7WG0mJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaBxY6AAKCRBVnxHm/pHO
 9baVCACcMZ+oGHyyvjtszQkQwoCc4LQEhNyBVCLMAukrkzlHUKuJuUgMLxOaizVKaBzVqZ+ImAm
 KFJDCmiXyQNskAOrCdFyEWeHP2rLBoNzxWKTODzgJ8uppEcksqBFWh1rEl5psqx7nS58ivJfwBF
 0IR7EBandYxRPofAprBmAyD/3pvvYcpIxlTilooBHNn2VzXduU0KYkSDDK5b4wJXryWat2+Mt8n
 BCAblJUCeBFK49eRl8FOHziOW4nIj4aSgX4clBB2igJ2YPjOa8wv2Ubvw1u6kDAMRQ1cSqP3A4B
 ktlGEOIB0nYlE+VSnH51tHJvblCq9bTJqJpTyBKZObEDWDGZ
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Currently, in the event of AER/DPC, PCI core will try to reset the slot and its
subordinate devices by invoking bridge control reset and FLR. But in some
cases like AER Fatal error, it might be necessary to reset the slots using the
PCI host bridge drivers in a platform specific way (as indicated by the TODO in
the pcie_do_recovery() function in drivers/pci/pcie/err.c). Otherwise, the PCI
link won't be recovered successfully.

So this series adds a new callback 'pci_host_bridge::reset_slot' for the host
bridge drivers to reset the slot when a fatal error happens.

Also, this series allows the host bridge drivers to handle PCI link down event
by resetting the slots and recovering the bus. This is accomplished by the
help of a new API 'pci_host_handle_link_down()'. Host bridge drivers are
expected to call this API (preferrably from a threaded IRQ handler) when a link
down event is detected. The API will reuse the pcie_do_recovery() function to
recover the link if AER support is enabled, otherwise it will directly call the
reset_slot() callback of the host bridge driver (if exists).

For reference, I've modified the pcie-qcom driver to call
pci_host_handle_link_down() after receiving LINK_DOWN global_irq event and
populated the 'pci_host_bridge::reset_slot()' callback to reset the controller
(there by slots). Since the Qcom PCIe controllers support only a single root
port (slot) per controller instance, reset_slot() callback is going to be
invoked only once. For multi root port controllers, this callback is supposed to
identify the slots using the supplied 'pci_dev' pointer and reset them.

NOTE
====

This series is a reworked version of the earlier series [1] that I submitted for
handling PCI link down event. In this series, I've made use of the AER helpers
to recover the link as it allows notifying the device drivers and also
allows saving/restoring the config space.

Testing
=======

This series is tested on Qcom RB5 and SA8775p Ride boards by triggering the link
down event manually by writing to LTSSM register. For the error recovery to
succeed (if AER is enabled), all the drivers in the bridge hierarchy should have
the 'err_handlers' populated. Otherwise, the link recovery will fail.

[1] https://lore.kernel.org/linux-pci/20250221172309.120009-1-manivannan.sadhasivam@linaro.org

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
Changes in v4:
- Handled link down first in the irq handler
- Updated ICC & OPP bandwidth after link up in reset_slot() callback
- Link to v3: https://lore.kernel.org/r/20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org

Changes in v3:
- Made the pci-host-common driver as a common library for host controller
  drivers
- Moved the reset slot code to pci-host-common library
- Link to v2: https://lore.kernel.org/r/20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org

Changes in v2:
- Moved calling reset_slot() callback from pcie_do_recovery() to pcibios_reset_secondary_bus()
- Link to v1: https://lore.kernel.org/r/20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org

---
Manivannan Sadhasivam (5):
      PCI/ERR: Remove misleading TODO regarding kernel panic
      PCI/ERR: Add support for resetting the slots in a platform specific way
      PCI: host-common: Make the driver as a common library for host controller drivers
      PCI: host-common: Add link down handling for host bridges
      PCI: qcom: Add support for resetting the slot due to link down event

 drivers/pci/controller/Kconfig                    |   8 +-
 drivers/pci/controller/dwc/Kconfig                |   1 +
 drivers/pci/controller/dwc/pcie-hisi.c            |   1 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 112 ++++++++++++++++++++--
 drivers/pci/controller/pci-host-common.c          |  64 ++++++++++++-
 drivers/pci/controller/pci-host-common.h          |  17 ++++
 drivers/pci/controller/pci-host-generic.c         |   2 +
 drivers/pci/controller/pci-thunder-ecam.c         |   2 +
 drivers/pci/controller/pci-thunder-pem.c          |   1 +
 drivers/pci/controller/pcie-apple.c               |   2 +
 drivers/pci/controller/plda/pcie-microchip-host.c |   1 +
 drivers/pci/pci.c                                 |  13 +++
 drivers/pci/pcie/err.c                            |   7 +-
 include/linux/pci-ecam.h                          |   6 --
 include/linux/pci.h                               |   1 +
 15 files changed, 212 insertions(+), 26 deletions(-)
---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250404-pcie-reset-slot-730bfa71a202

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>


