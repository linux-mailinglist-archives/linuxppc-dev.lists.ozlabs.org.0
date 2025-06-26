Return-Path: <linuxppc-dev+bounces-9842-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 936A1AEA910
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 23:53:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSsrT1v5Dz2xYl;
	Fri, 27 Jun 2025 07:53:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750949867;
	cv=none; b=ddWjAyoczL7FMEdYsAC5sA3c0BTIE6OUfOo6Ht103+vnX3h8qCbO+P91Ff5ctWhzJyjzCsw7A1XKnKfyFfxJuGTHfTYFRuXfB5bM68O7uWk3pmkzeOFrI4iRt4RnKf3AT7J4sKiWIQbFNuEo/wSHp31bxhdONaYwx+EXGnp5ZeAwzqf5Bnn4l/QX7IpkkhqULOj7lvrSGzjBr5IidYWHUpeMcboN/SzrJsMAt1RwD2rf28/YW8grA8bRkiiDhLtoup52Z94Pixszb24q1q+px8DM9aMNkOEDlNSZeWhsSXSfX1cmAgII5ib/IbPiSdlnksUNTOiSHtB6Zf5vZXEW0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750949867; c=relaxed/relaxed;
	bh=K8YPmhgd7GRWdTq4p5rz0ar2G7c+A7AteQJ8okEmiyU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=OpN3OK1T4nH+7fjzLoVeZud1j3b9ggdJrqaQSpn1AmoLuMrJL5j1IHcEulSbgcYF97IV9/CthL7KhkDvdPGvOD1qJNLgrB3o9rdT1KV2JVbYlCRVdpgVC1eEOiCIddBGBEETelPTEJj1O+DZqmEwPv8aDCl/lsEdxGMwtdXXV/K44culzMunxapazYFuNq1HGpgGUqf7WBovTij4rfgukiMdmVkRm3aejUXEBz4+Itk82VxzA3ZN0e/Usxa4HabQKN8mcGynBttI2qmQECa2jGYk3ciabyxHEf2Bx0Rop2n5OOn0U0z5BkKASL5udqHfrU5RKVbF1siCEKRATkabrw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dkL6SNg1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=N7DjUNXQ; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=dkL6SNg1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=N7DjUNXQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bShcp0bc4z30Nl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jun 2025 00:57:45 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K8YPmhgd7GRWdTq4p5rz0ar2G7c+A7AteQJ8okEmiyU=;
	b=dkL6SNg1bPhA+biVVEeT8puaUIOg12+2SWQ7defQnHIGc9BDeWFkd1ctQ0gUNZYvNeApXP
	WKdDIs2QCoBK41hm/zn/jYT5Vh/jWy8U1ZykAdAolO8k+m2uoPgkAaXngSTm1YfYg9VL4s
	xKAITZgt8HJDg6q2TgfDS7EgorR3Kwo4z0iVceePevM56nPtvaBhlcsdz/rHvth0L7ZdkE
	lbHZiKhiM7y6T0d9NmsJ/FVmQYenLVaAs4br1GynVIFVRHhjwLnOaOXbrqcBiUzasF0T56
	F5wOZLlxBTirOCSLMJKWgpboqFAeZRPNL+frv5rz2eVmsW136HWHf72DD07kSA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949280;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=K8YPmhgd7GRWdTq4p5rz0ar2G7c+A7AteQJ8okEmiyU=;
	b=N7DjUNXQqh1nFLJCr+LThRh/bbiQX23ScEPQDSYJRD73sjpRqG1FOEFxPcaMl51rLMgJX1
	kQa/d6OKtvnYh4Bw==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 0/3] powerpc: Cleanup and convert to MSI parent domain
Date: Thu, 26 Jun 2025 16:47:39 +0200
Message-Id: <cover.1750861319.git.namcao@linutronix.de>
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
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The initial implementation of PCI/MSI interrupt domains in the hierarchical
interrupt domain model used a shortcut by providing a global PCI/MSI
domain.

This works because the PCI/MSI[X] hardware is standardized and uniform, but
it violates the basic design principle of hierarchical interrupt domains:
Each hardware block involved in the interrupt delivery chain should have a
separate interrupt domain.

For PCI/MSI[X], the interrupt controller is per PCI device and not a global
made-up entity.

Unsurprisingly, the shortcut turned out to have downsides as it does not
allow dynamic allocation of interrupt vectors after initialization and it
prevents supporting IMS on PCI. For further details, see:

https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/

The solution is implementing per device MSI domains, this means the
entities which provide global PCI/MSI domain so far have to implement MSI
parent domain functionality instead.

This series:

   - Untangle XIVE driver from Powernv and Pseries drivers

   - Convert the Powernv and Pseries drivers to implement MSI parent domain
     functionality

Nam Cao (3):
  powerpc/xive: Untangle xive from child interrupt controller drivers
  powerpc/powernv/pci: Switch to use msi_create_parent_irq_domain()
  powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()

 arch/powerpc/include/asm/pci-bridge.h     |   2 -
 arch/powerpc/include/asm/xive.h           |   1 -
 arch/powerpc/platforms/powernv/Kconfig    |   1 +
 arch/powerpc/platforms/powernv/pci-ioda.c |  96 ++++++-----------
 arch/powerpc/platforms/pseries/Kconfig    |   1 +
 arch/powerpc/platforms/pseries/msi.c      | 124 ++++++++--------------
 arch/powerpc/sysdev/xive/common.c         |  63 ++++++-----
 7 files changed, 113 insertions(+), 175 deletions(-)

--=20
2.39.5


