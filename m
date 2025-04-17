Return-Path: <linuxppc-dev+bounces-7754-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B04A923C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 19:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zdl1S5NSBz3c2Z;
	Fri, 18 Apr 2025 03:16:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744910201;
	cv=none; b=KYcuQqdPyihyUD/9yYnWtT4bM6rOjDcQOP8WxOsKaaVg3Mi2VsfEpcl/Koi2wVFRl4mrNEOJpUUh0+oAztNARdZPFfekR0IZFESEKYWJbly7vbyX0oGwMHMgftP0zgJM1Pd+ekFbRHuz1bPD+UcL1Auxzy7qPiJ4SC4iIfaUkZC2xI/UP6ImOU7eD4CFOi2mZEiezWvUgV4rc02o28t06Y6xFvs6XfdMANVTwQsquFh237VoRp3ZvNO5jXj2Gfi2BX0A/is7HaJ67T+H0PbAQV9jLDuMCBwONrn9dZDgEsNglEa3oZovjrsnWIlo50cJCLQIHNm//mD24MwxEN3lZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744910201; c=relaxed/relaxed;
	bh=XP3MEViUYz1R6vXibcxQcr19dmD06YCcMbAkvej5Xzg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AlfR/+LJpAS0P+iJ/V9baccSg24yn7m9EPxB72XZBM/V0o9puQyhkPjBMWO/cj712EEHB7hmVfL+bIj8AO2XqaRdVFDmrUYqjbNTsJbJ2eukdHFGVyMPmNzdo0Hhs44U0wOP/bf0NUodUt66RY7inhnuT2K5sZd7tCaSd/tll7D5NNl2TANHTiH0yOrOvqoAfOe7ejU0WeJMrydnjU17FvKb1KzcPtA7EGFcBPQqqJ/qedLLBb5ZZ+T82ejMbZ9Cbh/9odIvryI324KqRWmhMeNhiZxRWg5RYS5QSEH+ZBg+2OErtgd01sO8X7/97PJC4ZckD62XL6n+Q1WCBiQVqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WJUH06Sv; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WJUH06Sv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=devnull+manivannan.sadhasivam.linaro.org@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zdl1N0J28z3bsf
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 03:16:39 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EA2ABA474BD;
	Thu, 17 Apr 2025 17:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D8B20C4CEE4;
	Thu, 17 Apr 2025 17:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744910196;
	bh=PvCdeV/T71+XdJMLiE0kUIteJDGjHav14JPcDUzEWbk=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WJUH06SvY8Ksr0nzZ7DCUDo5Di7SQoeF6dFkQW3NemsP8cvNAqoOA2s91iIo/YvyP
	 k8PRMNjQcOKH/9qx1cGBSCmXEy1AkfKAbY9p/1EFc6OibXdq3cS8C1N4jR0U22F9B7
	 W0Mq3sdRJb3z+Ug37awsk8cybqi79w5JHv/3aZx3JoDqMr61t0D6KO0Wj564qRrpb8
	 d6MynBi239RebUcYGwk4k5O8IYV9nKdcGVEFQV4eSqmexy4cCSx1u9MLtbSnyQjjQa
	 cAzceTCkgC5T+uLRuBJ/nqlefijOwNmjG2C/HENazcMKuxN0vsjHcJ/4VWqsqsOw/4
	 3XVhPEI7Vg37g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4343C369C9;
	Thu, 17 Apr 2025 17:16:36 +0000 (UTC)
From: Manivannan Sadhasivam via B4 Relay <devnull+manivannan.sadhasivam.linaro.org@kernel.org>
Subject: [PATCH v3 0/5] PCI: Add support for resetting the slots in a
 platform specific way
Date: Thu, 17 Apr 2025 22:46:26 +0530
Message-Id: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGo3AWgC/3XNzQrDIAzA8VcpnudQ+2Hdae8xdrAutoFSSyyyU
 frusz1tjB3/IfllZREIIbJLsTKChBHDlKM8FcwNduqB4yM3U0LVohIVnx0CJ4iw8DiGhetSdN5
 qafMGy1czgcfnId7uuQeMS6DX8SDJffrfSpILblpTKyPbzhtxHXGyFM6BerZjSX0AsvkFVAbAg
 246pVsnv4Ft2977FJM68AAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4498;
 i=manivannan.sadhasivam@linaro.org; h=from:subject:message-id;
 bh=PvCdeV/T71+XdJMLiE0kUIteJDGjHav14JPcDUzEWbk=;
 b=owEBbQGS/pANAwAKAVWfEeb+kc71AcsmYgBoATdtxd9VXuCzJQXALX9GONRBJRZvlq1rHHO2E
 vixk5tx8BOJATMEAAEKAB0WIQRnpUMqgUjL2KRYJ5dVnxHm/pHO9QUCaAE3bQAKCRBVnxHm/pHO
 9SGZB/9wO83g2WQiJXUe+pmJAGWUVZyOgslNdIVc+RJ1hJtslE2h7Sab5a93Ifm+nv6wpK569OR
 i1gjAn8JYIjUYRKqe549owUx0d61b6uUI9aqgk5KorUfpMWpCuCwZlALyUoR58nsedoG1u105el
 9BQX6K3r57OIC5YGIdFwZu+126TXcX02ygDt7e+aG1XmFJRjKOD3ir8NJRHge2Lweh1AkFMZ+by
 ApXkVlkdI1rqHa9ZDPwn/4UTjM2scyba3TkffP72FPsDzVQd7lhe65j6UpqS7AsaDkpkDAim/3z
 zqhI1xMxVGFaNU4cJ0tX3GrjjkOBQ8njtMdysDf6f6fkzXyf
X-Developer-Key: i=manivannan.sadhasivam@linaro.org; a=openpgp;
 fpr=C668AEC3C3188E4C611465E7488550E901166008
X-Endpoint-Received: by B4 Relay for
 manivannan.sadhasivam@linaro.org/default with auth_id=185
X-Original-From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reply-To: manivannan.sadhasivam@linaro.org
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
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

 drivers/pci/controller/Kconfig                    |  8 +-
 drivers/pci/controller/dwc/Kconfig                |  1 +
 drivers/pci/controller/dwc/pcie-hisi.c            |  1 +
 drivers/pci/controller/dwc/pcie-qcom.c            | 90 ++++++++++++++++++++++-
 drivers/pci/controller/pci-host-common.c          | 64 +++++++++++++++-
 drivers/pci/controller/pci-host-common.h          | 17 +++++
 drivers/pci/controller/pci-host-generic.c         |  2 +
 drivers/pci/controller/pci-thunder-ecam.c         |  2 +
 drivers/pci/controller/pci-thunder-pem.c          |  1 +
 drivers/pci/controller/pcie-apple.c               |  2 +
 drivers/pci/controller/plda/pcie-microchip-host.c |  1 +
 drivers/pci/pci.c                                 | 13 ++++
 drivers/pci/pcie/err.c                            |  7 +-
 include/linux/pci-ecam.h                          |  6 --
 include/linux/pci.h                               |  1 +
 15 files changed, 196 insertions(+), 20 deletions(-)
---
base-commit: 08733088b566b58283f0f12fb73f5db6a9a9de30
change-id: 20250404-pcie-reset-slot-730bfa71a202

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>



