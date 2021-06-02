Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F6F397DEC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 03:10:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FvrYg5Rxtz3cBx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 11:10:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=moZ15tk5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org;
 envelope-from=geoff@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=moZ15tk5; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1234::107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FvrWG4SYMz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 11:08:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Date:Cc:To:Subject:From:References:
 In-Reply-To:Message-Id:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=ViBTZOEd/HJwgYvmi4ILDxz2gH7hn6gPs/QGbkBhmFM=; b=moZ15tk5h/G5bDncxcUxaIq6ju
 ZkxGRK2vgoU2PF3wTcsiJj+F639lVA3h3DSimygfob1JZP9aLRZKPK3Rh80ybg7MYPbpuKPoNOIQ3
 6lfzk81HQlw/e6AfHEk7k7xXAuNe2Tp6uwk+vV8H32NBVwn9upPEU6MTGCNBCHbbae3MHkY1CF5Dn
 6xqo5J6JX6Mc32TTahiMyPuSmouio1RCbWj9IlUpuevbY6wYL67ej4RR0dMJ/30XPcfy/FhPDFmh0
 7xiaDXmT3yjPOBzbZehKEofr9mfFe3WU8xw/u793A7CIoI3TVY8jjPbQq3Yh4piLyJ+cFzs+g1oiW
 VPNjMcSg==;
Received: from geoff by merlin.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1loFMi-00102h-B0; Wed, 02 Jun 2021 01:08:12 +0000
Message-Id: <0ce4b6969a08094a747bd382dbfd30b72ebc192d.1622577339.git.geoff@infradead.org>
In-Reply-To: <cover.1622577339.git.geoff@infradead.org>
References: <cover.1622577339.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Tue, 1 Jun 2021 12:27:43 -0700
Subject: [PATCH 1/5] powerpc/ps3: Add CONFIG_PS3_VERBOSE_RESULT option
To: Michael Ellerman <mpe@ellerman.id.au>, David@lists.ozlabs.org,
	S.Miller@lists.ozlabs.org,
	" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>"@lists.ozlabs.org
Date: Wed, 02 Jun 2021 01:08:12 +0000
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To aid debugging, add a new PS3 kernel config option
PS3_VERBOSE_RESULT that, when enabled, will print more
verbose messages for the result of LV1 hypercalls.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/include/asm/ps3.h     | 2 +-
 arch/powerpc/platforms/ps3/Kconfig | 9 +++++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/ps3.h b/arch/powerpc/include/asm/ps3.h
index e646c7f218bc..7df145901def 100644
--- a/arch/powerpc/include/asm/ps3.h
+++ b/arch/powerpc/include/asm/ps3.h
@@ -232,7 +232,7 @@ enum lv1_result {
 
 static inline const char* ps3_result(int result)
 {
-#if defined(DEBUG) || defined(PS3_VERBOSE_RESULT)
+#if defined(DEBUG) || defined(PS3_VERBOSE_RESULT) || defined(CONFIG_PS3_VERBOSE_RESULT)
 	switch (result) {
 	case LV1_SUCCESS:
 		return "LV1_SUCCESS (0)";
diff --git a/arch/powerpc/platforms/ps3/Kconfig b/arch/powerpc/platforms/ps3/Kconfig
index e32406e918d0..ebed94942d39 100644
--- a/arch/powerpc/platforms/ps3/Kconfig
+++ b/arch/powerpc/platforms/ps3/Kconfig
@@ -85,6 +85,15 @@ config PS3_SYS_MANAGER
 	  This support is required for PS3 system control.  In
 	  general, all users will say Y or M.
 
+config PS3_VERBOSE_RESULT
+	bool "PS3 Verbose LV1 hypercall results" if PS3_ADVANCED
+	depends on PPC_PS3
+	help
+	  Enables more verbose log mesages for LV1 hypercall results.
+
+	  If in doubt, say N here and reduce the size of the kernel by a
+	  small amount.
+
 config PS3_REPOSITORY_WRITE
 	bool "PS3 Repository write support" if PS3_ADVANCED
 	depends on PPC_PS3
-- 
2.25.1


