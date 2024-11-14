Return-Path: <linuxppc-dev+bounces-3190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4837E9C8B23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 13:53:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq0QW3pntz30Hf;
	Thu, 14 Nov 2024 23:51:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731588691;
	cv=none; b=BxZPpkGdP+qEzfnmxr30WroApZZMZvQrMmmouGS6kGiL07pL4erD4EnLnRm75ZqJZG5sejCbEpAmu2N8bMlcSEJM5jZsaGxW4dHCa/vDerJIt358y2dAS/a/xyJ5GnGCvCXlBLQ22ckidggHJD2O3l4/ouF/3jtePTn5FgS4TGB07rlvxpQ73wd+CQOKaChXXuWemGBkchn7iaOspbwCTsTEFDw40D4/xyBHeChKSTZ7dktpNxwxBA/wFXoERT/or2eXmGgOF12gA0EzYFAOw2qa7mJJpWfWvCfnUjm1EoLy37T/JomKLSnyfz1Gk77WvwIPYv+y/iCd4Hw3M2n59A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731588691; c=relaxed/relaxed;
	bh=jI6uzr4iftvLEDrKaIrfDHLTu3TXT4BdDaqup2quvik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QWaUDZm78WJiryOYx5xJad6s84XWcM6Fj1HDiIuQe6XiYKPWKlpqstIAjIhNcsAdjeUihhFIE0n8GUWsg/hSK8s2UNgqW0aMKuSGbzHcdZtGE3rtOBgyWhub+JcskISlwGjmdwP+TMV/gGt/GYneLdK+7lFvcX41HWkoo+hZOP0yWC0+omd8ncXQNefKoKCvQAiC52GHfCjO/6AC6ZqVBZ61vmsBq4lcWuZQ3mc+HtKwlkokmB1O99PlEiHxCTTwOtUPl8xL/DkeKTO7aNCJEhBi4MxDg0S9hhdsyxNnUsdsBfGoZDUva/oJi6FGELZxYuK6j7lkIufMRrmdo2lj3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XgQM9uMr; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=XgQM9uMr;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq0QS3fglz306l
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 23:51:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731588685;
	bh=jI6uzr4iftvLEDrKaIrfDHLTu3TXT4BdDaqup2quvik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XgQM9uMrd8iaRiMJvZ9j+abUeH7VQN5utmtmMxLU1I9i7K4Or6My/OvaT2/pm2CG5
	 0qSqoHsI0zBh3qZKvCXUVGPlhqqJl54cY2Lmmks2HY8j1jZ4KKWRlBnmTTnZTjQ9u3
	 28bVtsT5/wLRcH20dfnIMhBuTN+y4upxmSddypEABk42MWJ4eY+8Cs8f5A12JQMZL6
	 qx82a05j3tyJ+ICsAYXL6V0Rybnwo2sML5a7OAbbsBdDMBBEGFRz5xAlCX5acAlOUf
	 WU9D88FiRTAhGfebBfGYxO0hUmz9hn21lbZVi3sEsouAmi0B0K0p7hChvjBk0OwMRB
	 88v7/LlcizCjA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xq0QP43dtz4xcN;
	Thu, 14 Nov 2024 23:51:25 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>,
	<jk@ozlabs.org>,
	<arnd@arndb.de>,
	<geoff@infradead.org>
Subject: [RFC PATCH 18/20] net: toshiba: Remove reference to PPC_IBM_CELL_BLADE
Date: Thu, 14 Nov 2024 23:51:07 +1100
Message-ID: <20241114125111.599093-18-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114125111.599093-1-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Remove a reference to PPC_IBM_CELL_BLADE which has been removed.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/net/ethernet/toshiba/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/toshiba/Kconfig b/drivers/net/ethernet/toshiba/Kconfig
index 2b1081598284..b1e27e3b99eb 100644
--- a/drivers/net/ethernet/toshiba/Kconfig
+++ b/drivers/net/ethernet/toshiba/Kconfig
@@ -6,7 +6,7 @@
 config NET_VENDOR_TOSHIBA
 	bool "Toshiba devices"
 	default y
-	depends on PCI && (PPC_IBM_CELL_BLADE || MIPS) || PPC_PS3
+	depends on PCI && MIPS || PPC_PS3
 	help
 	  If you have a network (Ethernet) card belonging to this class, say Y.
 
-- 
2.47.0


