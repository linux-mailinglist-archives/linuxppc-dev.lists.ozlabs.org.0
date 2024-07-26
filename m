Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3099193D30C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 14:34:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qHCk5Uk5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WVnJZ09Bkz3dKF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jul 2024 22:34:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qHCk5Uk5;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WVnH05794z3bsR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jul 2024 22:33:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1721997212;
	bh=oXZ8hTiXrr2J08JXPlzoc5NFFxRHlOc2DDFImDTZtXo=;
	h=From:To:Cc:Subject:Date:From;
	b=qHCk5Uk5s5D3p2MqHEuKDOqds6crPQNDeur4bA0eM72cW8ZI8uUNNMLpvnrYfpaKz
	 zZJpd0vmJFpehLiBeNwaWfkSEZJOt3rj98YcozrNq+OpHySIYGAPPVSircuyrfFo+L
	 d5dBieIUr7SnNZ0zRmiWhfgAhEmghKWoYrR7agOEsfbBXRaAVKdDJXWP9XKPcVgDWv
	 RtnHurGvUKvxODqr3ftY/E0Mv3jHwl6tIF3o+bQYu5t14UFbbiJQmQAhu2q9Lfcn+a
	 OWZprCEdr40iF/yY5qjK/uqcgr73AuccfLNNBDdbUVlJrDcvFL1w94ZP6iCYXWW0Q1
	 T65J960IbVVSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WVnH044yKz4wb2;
	Fri, 26 Jul 2024 22:33:32 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 1/2] MAINTAINERS: Mark powerpc Cell as orphaned
Date: Fri, 26 Jul 2024 22:33:21 +1000
Message-ID: <20240726123322.1165562-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
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
Cc: geoff@infradead.org, jk@ozlabs.org, arnd@arndb.de, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Arnd is no longer actively maintaining Cell, mark it as orphan.

Also drop the dead developerworks link.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 CREDITS     | 3 +++
 MAINTAINERS | 4 +---
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/CREDITS b/CREDITS
index 053e5a5003eb..65165dc80f04 100644
--- a/CREDITS
+++ b/CREDITS
@@ -378,6 +378,9 @@ S: 1549 Hiironen Rd.
 S: Brimson, MN  55602
 S: USA
 
+N: Arnd Bergmann
+D: Maintainer of Cell Broadband Engine Architecture
+
 N: Hennus Bergman
 P: 1024/77D50909 76 99 FD 31 91 E1 96 1C  90 BB 22 80 62 F6 BD 63
 D: Author and maintainer of the QIC-02 tape driver
diff --git a/MAINTAINERS b/MAINTAINERS
index 07f753f039d2..ffcac216b57d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5087,10 +5087,8 @@ F:	Documentation/devicetree/bindings/media/cec/cec-gpio.yaml
 F:	drivers/media/cec/platform/cec-gpio/
 
 CELL BROADBAND ENGINE ARCHITECTURE
-M:	Arnd Bergmann <arnd@arndb.de>
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Supported
-W:	http://www.ibm.com/developerworks/power/cell/
+S:	Orphan
 F:	arch/powerpc/include/asm/cell*.h
 F:	arch/powerpc/include/asm/spu*.h
 F:	arch/powerpc/include/uapi/asm/spu*.h
-- 
2.45.2

