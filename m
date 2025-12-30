Return-Path: <linuxppc-dev+bounces-15095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CC46CE8D98
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Dec 2025 08:06:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dgPK7321lz2yF1;
	Tue, 30 Dec 2025 18:06:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767078411;
	cv=none; b=Xbq+Pd4W95x+OoX1czZHwV2JukRmSyxwtJ64D/gqxUHKyPaHlzuSu/F74jrlqsnhvf8yA9q1WxhTK00mynYo5aOM6JtmSKrTMUXoyM0fH6mPl6ObXoDp0Z6QAw+xWNvdzLku2eotDEYJNvjvMTfCYsE8cGtF94h/d/p6Yof8XXEpSh67lgsCyb+kxzitSeQCeRoSH4Oubl93vXTcIWJ1is6tx5Nx4W+wE1XwKSLUXB8Sq3HeJ2c1xGVbLN5CNpIKAlYkN/GNYElUG7Gm6AuK7vX7O7UB4huMRrrJP2CskG318wWnLG04+K/xBTG+XFlWVqEzKL3K3qGGekIiKqInPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767078411; c=relaxed/relaxed;
	bh=b1xPGbzuTr1LSu9nNPB/3ljn0u/93ZcpdrYp3MCRdIM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Lr7g4E2Gf3ibAgvnEeoYSOKnU4cudMjlCpHY7VrN4VUiwdpPvAvkLjvpqMJ0VztIvjQskdGQivz7GtbYW2BVMu8/yuDdJLiZ/PgQJ9Ej/XXg6ShQgFXJ7kXkMiAgmcFkehXGHUFTLyzvoGJVBfqDIePyrffiaUnObV5zi4xYKuv+Fmx0YLpoNnxRxi7GLd991jhO3SFRztvgRrux12KLwTqTLn9fRZS0DXYMkQPNu7gdceXsGcOdRs88EuK4dPNuZkuUBt6xtPsIPa1Akg2TeCNGuIr8HYvQGQcSfpnAvPc5Sf6aPx/pDYOiYr3lB+O6pAVq7k4XaQymfgUvxYwFTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hh16YiRM; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2GG6MLyM; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=hh16YiRM;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=2GG6MLyM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dgPK54rcmz2xdV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Dec 2025 18:06:49 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1767078372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b1xPGbzuTr1LSu9nNPB/3ljn0u/93ZcpdrYp3MCRdIM=;
	b=hh16YiRMsRLlucVT/KU+FWt6580yhZHH0JME4PWxj1VDt0L7iHxHKkdrnAv/Amj1riBvtb
	v/jLMPsPdKlrv/4Pgv8WBRooFT+Vwnelckx218OdfalKOnLzzWHdkVmncq55NZTmAnTBxC
	WtUdFka1roZ6jtADwgmMTXtC4iOF/OeRrIrq6FMo1rDmSBzH42SS67bGBHdOevjk/Nh1uK
	KjwnsysTXyWK3w90ftWi7Diarhha2e1jNoXifDEIpNllLvN1E2msLDwAOAxZAgPwtDYKKc
	47tkre6pr/GtFG+eebuUYXAhWgoPlyaD3k1rIpQyHmVj9id6Pf+LTZFTS7CsNQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1767078372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=b1xPGbzuTr1LSu9nNPB/3ljn0u/93ZcpdrYp3MCRdIM=;
	b=2GG6MLyMb9wEU/FbzflYTWjI6Lpa0ipt7+VIXps4mqaG0avsEvYc37EZt3Ed6NCgMBc0wN
	TgkmWGWou53OBaDQ==
Date: Tue, 30 Dec 2025 08:06:10 +0100
Subject: [PATCH] powerpc: Implement ARCH_HAS_CC_CAN_LINK
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
Content-Transfer-Encoding: 8bit
Message-Id: <20251230-cc-can-link-powerpc-v1-1-82298df6e3bf@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAOJ5U2kC/x3MQQoCMQxA0auUrA3YYAW9irioSToGpS0tOEKZu
 0+Z5Vv8P6BrM+1wdwOa/qxbyRP+5IDfMS+KJtNAZwqeiJAZOWb8Wv5gLau2yhhEhC7XW5Lwgln
 Wpsn+x/Xx3LYdwwPPmmUAAAA=
X-Change-ID: 20251222-cc-can-link-powerpc-5ddd2469fd5b
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767078370; l=1829;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=E4HkiIB9B7tc63pFuMTGeDGcq4l+vohVXKTRCjI0+pw=;
 b=vHjWSkP643fsjY0SlPDhJ7dt0o1ZUXOG/WzzQRKB+M4jY8dNxaNjb6qF4v+FB32s3MDsCN9uj
 CXLkKV2HNgmDNn01CAuwAzx5FM2Da93yBAcwUX5N54tNVvSNvB3SilQ
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The generic CC_CAN_LINK detection does not handle different byte orders.
This may lead to userprogs which are not actually runnable on the target
kernel.

Use architecture-specific logic supporting byte orders instead.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 arch/powerpc/Kconfig | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 9537a61ebae0..6bb2f90e97ea 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -127,6 +127,7 @@ config PPC
 	select ARCH_DMA_DEFAULT_COHERENT	if !NOT_COHERENT_CACHE
 	select ARCH_ENABLE_MEMORY_HOTPLUG
 	select ARCH_ENABLE_MEMORY_HOTREMOVE
+	select ARCH_HAS_CC_CAN_LINK
 	select ARCH_HAS_COPY_MC			if PPC64
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL
@@ -1342,6 +1343,20 @@ endif
 config PPC_LIB_RHEAP
 	bool
 
+config ARCH_CC_CAN_LINK
+	bool
+	default $(cc_can_link_user,$(m64-flag) -mlittle-endian) if 64BIT && CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,$(m64-flag) -mbig-endian) if 64BIT && CPU_BIG_ENDIAN
+	default $(cc_can_link_user,$(m32-flag) -mlittle-endian) if CPU_LITTLE_ENDIAN
+	default $(cc_can_link_user,$(m32-flag) -mbig-endian) if CPU_BIG_ENDIAN
+
+config ARCH_USERFLAGS
+	string
+	default "$(m64-flag) -mlittle-endian" if 64BIT && CPU_LITTLE_ENDIAN
+	default "$(m64-flag) -mbig-endian" if 64BIT && CPU_BIG_ENDIAN
+	default "$(m32-flag) -mlittle-endian" if CPU_LITTLE_ENDIAN
+	default "$(m32-flag) -mbig-endian" if CPU_BIG_ENDIAN
+
 source "arch/powerpc/kvm/Kconfig"
 
 source "kernel/livepatch/Kconfig"

---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251222-cc-can-link-powerpc-5ddd2469fd5b

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>


