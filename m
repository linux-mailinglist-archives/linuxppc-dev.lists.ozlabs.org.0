Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB2E6F8C97
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 01:01:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCmQf68rVz3fLm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 May 2023 09:01:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iwTVzskZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCmPT67VBz3bhQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 May 2023 09:00:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=ynYN/E5zV6U2+rofOUaL5Z5bxVP7BjOHSyyXh1vFy+w=; b=iwTVzskZWEh0tMmEBjm3qOS/rX
	JKdrBp3TdB08bFzwFZWUlfy8Xett54C8GbJAf84lju9ltpSe/veZy+5qVrXm6+Fng3JGh0QwNuFz0
	A2uIcGYAUoQHXScjKTFj0uNRGkT2HVE2/xSowLk2/MgUcZERCzn16q4KzOZOMdUELEmQKhKtWIRPB
	GoZYObc+0vLNHCEP9VONPxQZ9i//S91zqPl1mYjpch4UuXM2vUQrdY6qoT0usSZzXw5tAjYdmZe8a
	ZTRHrayir4x20v1NMa8jp9EB9oOq7r7SOEbOtRDo8DG3VEd0cF+PckCSO89pPZLb5d/UBv9R+Suq8
	JX9jepQQ==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1pv4Ph-00C2jt-2P;
	Fri, 05 May 2023 23:00:34 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/embedded6xx: select MPC10X_BRIDGE only if PCI is set
Date: Fri,  5 May 2023 16:00:32 -0700
Message-Id: <20230505230032.19156-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_SMP is not set, CONFIG_BROKEN_ON_SMP is set, and
CONFIG_PCI is not set, there can be a kconfig warning:

WARNING: unmet direct dependencies detected for PPC_INDIRECT_PCI
  Depends on [n]: PCI [=n]
  Selected by [y]:
  - MPC10X_BRIDGE [=y]

To fix that, make the selects of MPC10X_BRIDGE be conditional
on PCI.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
---
 arch/powerpc/platforms/embedded6xx/Kconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/arch/powerpc/platforms/embedded6xx/Kconfig b/arch/powerpc/platforms/embedded6xx/Kconfig
--- a/arch/powerpc/platforms/embedded6xx/Kconfig
+++ b/arch/powerpc/platforms/embedded6xx/Kconfig
@@ -10,7 +10,7 @@ config LINKSTATION
 	select FSL_SOC
 	select PPC_UDBG_16550 if SERIAL_8250
 	select DEFAULT_UIMAGE
-	select MPC10X_BRIDGE
+	select MPC10X_BRIDGE if PCI
 	help
 	  Select LINKSTATION if configuring for one of PPC- (MPC8241)
 	  based NAS systems from Buffalo Technology. So far only
@@ -24,7 +24,7 @@ config STORCENTER
 	select MPIC
 	select FSL_SOC
 	select PPC_UDBG_16550 if SERIAL_8250
-	select MPC10X_BRIDGE
+	select MPC10X_BRIDGE if PCI
 	help
 	  Select STORCENTER if configuring for the iomega StorCenter
 	  with an 8241 CPU in it.
