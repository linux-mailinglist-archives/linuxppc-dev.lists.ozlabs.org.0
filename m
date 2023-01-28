Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D68C67F822
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 14:37:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3wV30lgbz3fLY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jan 2023 00:37:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mV/K6ZyP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mV/K6ZyP;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3wT638p9z3cdC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jan 2023 00:36:26 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 66DA660BF9;
	Sat, 28 Jan 2023 13:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A8A9BC433EF;
	Sat, 28 Jan 2023 13:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674912982;
	bh=RvsXLt3jtOi+fa454bVDIfyl7OhqRvd7dFiGrnsbL88=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mV/K6ZyPDiJg1yvjjD69N06b3ko1lwcuHxYuiXMGknLOrx4L0rpdAr4QmEhj8GBPF
	 P5avS8/vy9cl4xnTm3utMeFEKm5YUlScbzpMnGyIhXRcmNTOFlM9kiIKTtzGAHrERa
	 o+OIA55VM3cEz5IoL9gv4UMmE3Bv7g1IF4n6Uu8BNzHLCZDjBLgO6GOXuwPiUj1Uo+
	 vAh/pZ+u7/HW0Q0Viqo+KrnhZlSHJoZ/YT8htH8aUsWLSNX+wz+IQL002nlkRmLVib
	 L0I5Njz/x+5S0XZ86UTFLxllh83kNgJ0JzkOtnRGrUUfB3a5x0ywlpSmzVPNpeIFYi
	 CkElJW47Mqyvg==
Received: by pali.im (Postfix)
	id 1CEDC639; Sat, 28 Jan 2023 14:36:20 +0100 (CET)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 1/2] powerpc/pci: Enable PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT by default
Date: Sat, 28 Jan 2023 14:34:58 +0100
Message-Id: <20230128133459.32123-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220817163927.24453-1-pali@kernel.org>
References: <20220817163927.24453-1-pali@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It makes sense to enable CONFIG_PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT by default
(when possible by dependencies) to take advantages of all 256 PCI buses on
each PCI domain, like it is already on all other kernel architectures.

Fixes: 566356813082 ("powerpc/pci: Add config option for using all 256 PCI buses")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8c4ac56bddc..fad25aa602c8 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -392,6 +392,7 @@ config PPC_PCI_BUS_NUM_DOMAIN_DEPENDENT
 	depends on PPC32
 	depends on !PPC_PMAC && !PPC_CHRP
 	bool "Assign PCI bus numbers from zero individually for each PCI domain"
+	default y
 	help
 	  By default on PPC32 were PCI bus numbers unique across all PCI domains.
 	  So system could have only 256 PCI buses independently of available
-- 
2.20.1

