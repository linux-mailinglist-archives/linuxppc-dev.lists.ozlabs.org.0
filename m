Return-Path: <linuxppc-dev+bounces-7661-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77F63A89ADD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Apr 2025 12:48:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZcLV11LGfz2yr7;
	Tue, 15 Apr 2025 20:48:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744714089;
	cv=none; b=Rql3pQknB/QBB0n8QJQY98GbQ52G4VbDvu1SFp7gzzPcyuHJJlcI6ZgA/wyns0jiodsFJ9Voi2+a4mxFU3tovDGRzUKV2caIsA6fy134xUbreHqFyxY2FQALNOJEVWJywkoiWg+JTlSmXDmZQfTW+YNgI59SWSxvqwAgqYgT7W3KKUM4zPKWonKXo1kjC2t1Uqw7ciZFG67h7no/mnIcuIaojlvhj2PBq9df2G0XcR6RjFu00zOUxPLmiqcbyZQZNOWD/IjLC66/awVJ25S3C7TfJHwUOsNIabuYv/k/WxPpRrq3HyBtsAonA3oXPD7d3Q0iGVrmbod+FsBRxAbDXw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744714089; c=relaxed/relaxed;
	bh=9VpB6zOVlonKgJ/idDEdn46RPdjbpDQzqpRgO98fh4c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=At3el7zy82rgi6anJGClLm0nA837BgZM2TOHoKHhFCrlX1+GSXsdI8D06YDgUYduVOe+Ah7xzlAKKrPxmkRJlP7WMWVpXidr9oIoaeT1dxX1bf6pksZtdRqV7ixFYYX4QPZtUU3Vfc51z/YJAmkQ7wNAHk7S/P87ry3PLe6+4hvxLU339ZLuGwJZEH9r+H2sZAPuP8Jq5tsyFkiX0ESCKRGpak/VbTuwilrj+h3lcyQ1YCNZvwfmiS0SyLD/06L01acNdTFhPSvtpxAbcp/JSM8rP2YFfnUHpReRFAkJlbV3H4WL3JTC7v6B6+0TmFqZC5wGZBcC26PsSMq7qBtQlw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kNbP0vZE; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kNbP0vZE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZcLTz5rQHz2yRn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Apr 2025 20:48:07 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 114A349B38;
	Tue, 15 Apr 2025 10:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0BD1C4CEDD;
	Tue, 15 Apr 2025 10:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744714082;
	bh=FSX8SbdRKPNp84bkmuiN4rStU0bu5akTlewHxkcc4YE=;
	h=From:To:Cc:Subject:Date:From;
	b=kNbP0vZEpWv+6Ckavd6b7H5jnyW4qFM7eSPPIzxN8LygQQ8+QgSJ99C65SJTwk48B
	 HbnNv2Y9Lvphx8Nvh/lkr9L5SS0WzxKYXXsOZIbzuW4Wsf1irjWV8J1l9x6ubOSMnv
	 zkcsAA7mWRIkgjFKq7acfwJX/I9n0W9qJglh99C7WgJuHMpz2IZDfDEqHIMIZNUHa5
	 nJvQKt0z1hiVbMj7sQNUtXVU8WKj1t2krYH56FpIVXVnT1KJNtx9eN/ZUzoy9zogr9
	 1o0wdqyDp8Z16fNX9+wSoBuKdvUhE92Sdwuax1vphTnOgCmi2IMJZ9JXqS5TcC+u0J
	 kIR9NmgsXysyA==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: maddy@linux.ibm.com
Cc: tglx@linutronix.de,
	maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] irqdomain: ppc: Switch to of_fwnode_handle()
Date: Tue, 15 Apr 2025 12:47:58 +0200
Message-ID: <20250415104758.106890-1-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

of_node_to_fwnode() is irqdomain's reimplementation of the "officially"
defined of_fwnode_handle(). The former is in the process of being
removed, so use the latter instead.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org
---
This is an indepent patch, please apply directly.

The patch was previously a part of a large series [1], but I would like
maintainers to feed the independent parts through their trees.

[1] https://lore.kernel.org/all/20250319092951.37667-1-jirislaby@kernel.org/
---
 arch/powerpc/platforms/powernv/pci-ioda.c | 2 +-
 arch/powerpc/platforms/pseries/msi.c      | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
index ae4b549b5ca0..d8ccf2c9b98a 100644
--- a/arch/powerpc/platforms/powernv/pci-ioda.c
+++ b/arch/powerpc/platforms/powernv/pci-ioda.c
@@ -1897,7 +1897,7 @@ static int __init pnv_msi_allocate_domains(struct pci_controller *hose, unsigned
 		return -ENOMEM;
 	}
 
-	hose->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(hose->dn),
+	hose->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(hose->dn),
 						     &pnv_msi_domain_info,
 						     hose->dev_domain);
 	if (!hose->msi_domain) {
diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index f9d80111c322..5b191f70c088 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -628,7 +628,7 @@ static int __pseries_msi_allocate_domains(struct pci_controller *phb,
 		return -ENOMEM;
 	}
 
-	phb->msi_domain = pci_msi_create_irq_domain(of_node_to_fwnode(phb->dn),
+	phb->msi_domain = pci_msi_create_irq_domain(of_fwnode_handle(phb->dn),
 						    &pseries_msi_domain_info,
 						    phb->dev_domain);
 	if (!phb->msi_domain) {
-- 
2.49.0


