Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BED568601
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 12:45:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdGQz1yFsz3dsm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Jul 2022 20:45:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K7qadzCU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=K7qadzCU;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdGNY5bkVz3bmD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Jul 2022 20:43:25 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 18A4AB81BCF;
	Wed,  6 Jul 2022 10:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93DD6C341CE;
	Wed,  6 Jul 2022 10:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657104201;
	bh=00N7ksHtwGEamPjFF10EZROWjybycuFTsa4YgD+Po3E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=K7qadzCUEt12Hkk2NuyJRLOe4+/ShN/ZMVSgZBzllDWUxecQFHIEmwvDbtyMrshy5
	 9aX4FVnp5P0EPDlYA8GBB5IuSDPkWEl4lKC9cunRh8JV2eQrMCSLtH4Yigo/+ocAUg
	 LAncEnYzO34XybOZppHLjVhwp93D8X8cHNIEDzd6ELPTFZDyPt1tCXe6GJvlV+pl2h
	 ytY4G2SlsBvMGDvWbvJo4qqu62Fkq5XaZ/vE8fve4V6FLrmY8SNqTeW6qnBunC/VJo
	 Nq4cPDVDNl+mfvKFW7mx5B9vmwH1cLCgvlHdmP0Kjo0Qvqr5hXBbabFdrB+UYiPW1E
	 i2qbBNJZrEkJA==
Received: by pali.im (Postfix)
	id 34131821; Wed,  6 Jul 2022 12:43:19 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
	Nick Child <nick.child@ibm.com>,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH 2/5] powerpc/pci: Make pcibios_make_OF_bus_map() static
Date: Wed,  6 Jul 2022 12:43:05 +0200
Message-Id: <20220706104308.5390-3-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220706104308.5390-1-pali@kernel.org>
References: <20220706104308.5390-1-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Function pcibios_make_OF_bus_map() is used only in pci_32.c file.
So make it static and do not export out of pci_32.o unit.

Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/kernel/pci_32.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/pci_32.c b/arch/powerpc/kernel/pci_32.c
index c3b91fb62a71..df981294df29 100644
--- a/arch/powerpc/kernel/pci_32.c
+++ b/arch/powerpc/kernel/pci_32.c
@@ -36,8 +36,6 @@ int pcibios_assign_bus_offset = 1;
 EXPORT_SYMBOL(isa_io_base);
 EXPORT_SYMBOL(pci_dram_offset);
 
-void __init pcibios_make_OF_bus_map(void);
-
 static void fixup_cpc710_pci64(struct pci_dev* dev);
 static u8* pci_to_OF_bus_map;
 
@@ -108,7 +106,7 @@ make_one_node_map(struct device_node* node, u8 pci_bus)
 	}
 }
 	
-void __init
+static void __init
 pcibios_make_OF_bus_map(void)
 {
 	int i;
-- 
2.20.1

