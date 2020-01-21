Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 79597143636
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 05:34:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 481wgB60n8zDqHL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jan 2020 15:34:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 481wYq67WRzDqWw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jan 2020 15:30:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=i3iq18bo; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 481wYq4f57z9sP6; Tue, 21 Jan 2020 15:30:07 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 481wYq3VmCz9sRl; Tue, 21 Jan 2020 15:30:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1579581007;
 bh=NN3uQ0Wvk8ioLvU6n7tCJP575Z7UL6+fpTfJ8i14UUA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=i3iq18bo5TF70wlD3735WPtTAjJjV5bCEeIwS6tpv9FacqtUvfldR6gNStfjQ/NmY
 hyKMAojWUtZXKUsnN/ezgFwCUJtLBsoYy1RLIaJo44KE4NQCsiFrtMof32jgVBFwGJ
 afEyT8YsiMkc1Q1oJc6gLr5nIIr280LAjHSN0f5GFqZ0jFQqSnVj1IEP44Ikr01gQq
 BGd7lS7LkoTXI7cctBmK/JVGY77SmKXOaauCl4YcfqLAX1HxbA9wgw2Lnnmc9FGOtH
 ZkeecqSyI2Q60dtj9MNADlA4BPyvvr82i0gEnJA+lscMzRWM5aaesTR8NNAc6quQbW
 1JCF0XKVkVAQg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2 03/10] powerpc/configs: Drop NET_VENDOR_HP which moved to
 staging
Date: Tue, 21 Jan 2020 15:29:53 +1100
Message-Id: <20200121043000.16212-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200121043000.16212-1-mpe@ellerman.id.au>
References: <20200121043000.16212-1-mpe@ellerman.id.au>
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
Cc: oohall@gmail.com, joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The HP network driver moved to staging in commit 52340b82cf1a ("hp100:
Move 100BaseVG AnyLAN driver to staging") meaning we don't need to
disable it any more in our defconfigs.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/44x/akebono_defconfig | 1 -
 arch/powerpc/configs/skiroot_defconfig     | 1 -
 2 files changed, 2 deletions(-)

v2: No change.

diff --git a/arch/powerpc/configs/44x/akebono_defconfig b/arch/powerpc/configs/44x/akebono_defconfig
index f0c8a07cc274..7705a5c3f4ea 100644
--- a/arch/powerpc/configs/44x/akebono_defconfig
+++ b/arch/powerpc/configs/44x/akebono_defconfig
@@ -59,7 +59,6 @@ CONFIG_BLK_DEV_SD=y
 # CONFIG_NET_VENDOR_DLINK is not set
 # CONFIG_NET_VENDOR_EMULEX is not set
 # CONFIG_NET_VENDOR_EXAR is not set
-# CONFIG_NET_VENDOR_HP is not set
 CONFIG_IBM_EMAC=y
 # CONFIG_NET_VENDOR_MARVELL is not set
 # CONFIG_NET_VENDOR_MELLANOX is not set
diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index eaaffe9ae8b9..3eee39c50941 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -146,7 +146,6 @@ CONFIG_CHELSIO_T1=m
 # CONFIG_NET_VENDOR_DLINK is not set
 CONFIG_BE2NET=m
 # CONFIG_NET_VENDOR_EZCHIP is not set
-# CONFIG_NET_VENDOR_HP is not set
 # CONFIG_NET_VENDOR_HUAWEI is not set
 CONFIG_E1000=m
 CONFIG_E1000E=m
-- 
2.21.1

