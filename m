Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF459AFC2D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 14:07:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T0yH3JW3zF34t
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 22:07:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T0n9106mzF33C
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Sep 2019 21:59:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="nccu4sUw"; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 46T0n739Wxz9sP6; Wed, 11 Sep 2019 21:59:23 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 46T0n70WYmz9sNx; Wed, 11 Sep 2019 21:59:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1568203163;
 bh=Ug7u/HQGkSwDLHWHp5/4EK9Pu+ixbz3YSDtnNvf3jWw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nccu4sUwdhEKYvPd/IPsMifrzVggF7dmEuU7ayhTa133cgCYNB+r+6CXapgygLw/e
 Rt9I64+NfjhvACXvuxDlJTXZWhzFkA00weUOK/Uvv67t3NGV6qYbicm8lwUzPJGnV/
 vx+BiFANmLQQSctTtg+TxQJRcMWR2hzqeUlKk1tLrLY/4EExZBOfqx48Gn9wHemCNQ
 b/k8N32+UPSrxJ9UPC43r6C8X5bbPT3NaJ/qAugUkORrNP4XM5YSWHxtK16jZal1bU
 YXW9grLmYAVj1ulgTgO9RAdFtB130mSIR6VDe5/tfj0WDwgdiiJTLc1/GGZao9liTS
 PqvS0pLNRnc2g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 4/4] powerpc/kvm: Add ifdefs around template code
Date: Wed, 11 Sep 2019 21:57:46 +1000
Message-Id: <20190911115746.12433-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190911115746.12433-1-mpe@ellerman.id.au>
References: <20190911115746.12433-1-mpe@ellerman.id.au>
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
Cc: cai@lca.pw, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some of the templates used for KVM patching are only used on certain
platforms, but currently they are always built-in, fix that.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/kvm_emul.S | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/powerpc/kernel/kvm_emul.S b/arch/powerpc/kernel/kvm_emul.S
index 9dd17dce10a1..7af6f8b50c5d 100644
--- a/arch/powerpc/kernel/kvm_emul.S
+++ b/arch/powerpc/kernel/kvm_emul.S
@@ -192,6 +192,8 @@
 kvm_emulate_mtmsr_len:
 	.long (kvm_emulate_mtmsr_end - kvm_emulate_mtmsr) / 4
 
+#ifdef CONFIG_BOOKE
+
 /* also used for wrteei 1 */
 .global kvm_emulate_wrtee
 kvm_emulate_wrtee:
@@ -285,6 +287,10 @@
 kvm_emulate_wrteei_0_len:
 	.long (kvm_emulate_wrteei_0_end - kvm_emulate_wrteei_0) / 4
 
+#endif /* CONFIG_BOOKE */
+
+#ifdef CONFIG_PPC_BOOK3S_32
+
 .global kvm_emulate_mtsrin
 kvm_emulate_mtsrin:
 
@@ -334,6 +340,8 @@
 kvm_emulate_mtsrin_len:
 	.long (kvm_emulate_mtsrin_end - kvm_emulate_mtsrin) / 4
 
+#endif /* CONFIG_PPC_BOOK3S_32 */
+
 	.balign 4
 	.global kvm_tmp
 kvm_tmp:
-- 
2.21.0

