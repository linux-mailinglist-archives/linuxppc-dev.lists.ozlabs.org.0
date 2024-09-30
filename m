Return-Path: <linuxppc-dev+bounces-1691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E82B98A1E9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 14:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHKpn03DVz2ym2;
	Mon, 30 Sep 2024 22:18:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.134.164.83
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727695367;
	cv=none; b=NUCQf6gd0qo9ds1FIv3+7UaKvyWq/qJchgmfVcZf8SkEeBbAUCi/K+uQuGNSfFxFmBco+lYREZnvjShmVpsodLISsUiCe4aq7aJIYV1j3WiQMEIUD5hCEr3gb/pEYy2Tk3N87FHEXHsNf/LETv06mQ92igXpfSkZTp5ONo1lYiNPb8OUql1Bns+/iAw28Z/03nR7ukSlCBi5lZTsEsVXdAeFRzo6+L8Adcxui1m/aWmGVmjgZEN7vQqMD8hVvIr6TQbkpKwRf4CPcdUEMXtNOhZ1EXhjrTLWcp9k7tDg4iYll13tiZg5NAs8RWCMzgW/y3qsmwIAoqca3UJAfpuSEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727695367; c=relaxed/relaxed;
	bh=3CE01wnnuaV12E63oXSfBewShL+SIE6Xrnixx2NRW5c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=edqwbfQ3DSOLfy8X9El1k8v6O+sNGUOaUNN3NdhA53sA3dr8KdxOGjXR/BEyCPaLEix6X56pTQARqTvkDvEGR0bXqzKO1SXB08g/SEpsulfOcTQWtt0W3Y/xsBImtcGl6nbAohAkA7oe72NwDIbGYPEP3LDyGyQ9LK03QnyeZzBITqryJRc8oXCj4kVHwMaDaEDE7ZChWV5PrlVufQGWPeRImkhmOwImhbKUOUIMw2rmXgFbwGfkDkfzoijGmn0uY1X/Mm4smE8SabYYfOe8YWcyE04uJiBKUWle7K1tIiZ1YOKd8oIsBPLMK06AH7T2/NpSrAz93c0TOZNlndu2XQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr; dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=YloFHyI+; dkim-atps=neutral; spf=pass (client-ip=192.134.164.83; helo=mail2-relais-roc.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org) smtp.mailfrom=inria.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=YloFHyI+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.83; helo=mail2-relais-roc.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org)
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHJZt0lftz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 21:22:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3CE01wnnuaV12E63oXSfBewShL+SIE6Xrnixx2NRW5c=;
  b=YloFHyI+f1M5jGXmlZKNqzmamICNGcErZFAYjcWcAknKBCjGcOmw2hci
   7oPHyljJuQY/quZwbU6VDyOGkpXnteOWe9sBWLN1FI5c6MeplqhI1SZLb
   YANADl+3kMiYIsRLNXp7R9JviCML/kMa5+vPq/hNtnW+xEvtJKQSQMjKJ
   o=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,165,1725314400"; 
   d="scan'208";a="185956882"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Sep 2024 13:21:26 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: Geoff Levand <geoff@infradead.org>
Cc: kernel-janitors@vger.kernel.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/35] powerpc/ps3: Reorganize kerneldoc parameter names
Date: Mon, 30 Sep 2024 13:20:57 +0200
Message-Id: <20240930112121.95324-12-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20240930112121.95324-1-Julia.Lawall@inria.fr>
References: <20240930112121.95324-1-Julia.Lawall@inria.fr>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Reorganize kerneldoc parameter names to match the parameter
order in the function header.

Problems identified using Coccinelle.

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

---
 arch/powerpc/platforms/ps3/interrupt.c  |    2 +-
 arch/powerpc/platforms/ps3/repository.c |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/interrupt.c b/arch/powerpc/platforms/ps3/interrupt.c
index 49871427f599..af3fe9f04f24 100644
--- a/arch/powerpc/platforms/ps3/interrupt.c
+++ b/arch/powerpc/platforms/ps3/interrupt.c
@@ -378,9 +378,9 @@ int ps3_send_event_locally(unsigned int virq)
 
 /**
  * ps3_sb_event_receive_port_setup - Setup a system bus event receive port.
+ * @dev: The system bus device instance.
  * @cpu: enum ps3_cpu_binding indicating the cpu the interrupt should be
  * serviced on.
- * @dev: The system bus device instance.
  * @virq: The assigned Linux virq.
  *
  * An event irq represents a virtual device interrupt.  The interrupt_id
diff --git a/arch/powerpc/platforms/ps3/repository.c b/arch/powerpc/platforms/ps3/repository.c
index 1abe33fbe529..b8c030eab138 100644
--- a/arch/powerpc/platforms/ps3/repository.c
+++ b/arch/powerpc/platforms/ps3/repository.c
@@ -940,7 +940,7 @@ int __init ps3_repository_read_vuart_sysmgr_port(unsigned int *port)
 
 /**
   * ps3_repository_read_boot_dat_info - Get address and size of cell_ext_os_area.
-  * address: lpar address of cell_ext_os_area
+  * @lpar_addr: lpar address of cell_ext_os_area
   * @size: size of cell_ext_os_area
   */
 


