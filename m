Return-Path: <linuxppc-dev+bounces-1872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B42995F00
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Oct 2024 07:38:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNhW85pdhz2yVP;
	Wed,  9 Oct 2024 16:38:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728452292;
	cv=none; b=ZbTaJLpc9OJwtFnjSDuLjxDMeJtt97rfkRKPnQxbQcZ0wrz0I+BZN6a5gJH/CNbRXf+JfzPSrYrlsW+41vLybDae82FlOplHQLWd/1iB+20VR7VCHpD/FiSdo+TY7Y1D3vm1qvR4b8Wkix9QQ6fxsqD8/1AQ9TH6kWGQmzqpJS/92ZzWS7z+9ceUMO9bRuil/M17G26N7efoBjQbYJCOBxjH4b1BC/f4hMfw2K/sI+DXMRHsA6eI1GKY8hRqH3bv2gdPjKSxUSt2KHqDMz08b7HDC9mgL8uqGpBpvPX6sx3g7QAALLG3q26rPgPL4IhfOraV2cclhSzmOTH/G+vgWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728452292; c=relaxed/relaxed;
	bh=QNqrMxCWjFbB1u9R8PQLRcJUnHbswW2NIw7qH4L+Hww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KCQCOSCfqkfAZofoaOJM5avsL7Cz2CZlrk4uon29W2M5P8kN7ocok/E6CgVohCn0hcAUI+ScfY2beiQbabeYBywxxDJChv8fJYhUb61K8f4BQ0PaQvteewDDUjo175svWvDD4BOcE0Zp+qw5nePusb0P30LYzozik3IbUvtqU0vDyDC/2VU1wFShKNnFimWea8euTxIsHAIdwERKTPPawalbviimAwpTISR9ZY+M+NgTgSfyTV969CX6f4ZqjSrqo29BHhNNfFcX0Pi0Iqeq0yBLu+2Pd9deTwQCY7oDklK/Kvixd8h5tDNnclox1naHzKLLHwIu2ENOydrZrNNJ2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a93zj4Sd; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=a93zj4Sd;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNhW76Sbpz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 16:38:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728452291;
	bh=QNqrMxCWjFbB1u9R8PQLRcJUnHbswW2NIw7qH4L+Hww=;
	h=From:To:Cc:Subject:Date:From;
	b=a93zj4SdnDWBxPa3pK45EFWsB2n7WQPq6mIqV5d6Jp8fyj2syZJBiBS6JcY7okvUV
	 J32pbwp5hhIxa+gF3oJR4BUVavBVOPU+ZDbU3TeV7049N8/4S/p+VL+R2Uk3nc7D0q
	 2jdK10+3AJ2ovsdlPb90lAt7VDRZbbBxoULgVEp3Qt2T/SPcUSO9ECNuO4t57rIXNB
	 2fNzWml1qlPA0LRwNkCSS0FZ2cJ2eqigBsZPA7LDUWpkOXl1dd0eYPFUkWJWEYilYV
	 9sFV2zTnU6VtsflD65MZ++L8UIS/mJ5Wo8RFVXkqSLbrKds476ewHKz0VRhCjTMguT
	 OFwBV3hGGV5Hw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XNhW66Jwsz4wc3;
	Wed,  9 Oct 2024 16:38:10 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: linux@leemhuis.info
Subject: [PATCH] powerpc/boot: Remove bogus reference to lilo
Date: Wed,  9 Oct 2024 16:38:06 +1100
Message-ID: <20241009053806.135807-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.2
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
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The help text refers to lilo, but the install script does not run lilo
and never has. The reference to lilo seems to have come originally from
arch/ppc/Makefile, but it was not true there either.

Remove it.

Reported-by: Thorsten Leemhuis <linux@leemhuis.info>
Link: https://fosstodon.org/@kernellogger/113032940928131612
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index bbfe4a1f06ef..d115834817db 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -359,7 +359,7 @@ define archhelp
   echo '  install         - Install kernel using'
   echo '                    (your) ~/bin/$(INSTALLKERNEL) or'
   echo '                    (distribution) /sbin/$(INSTALLKERNEL) or'
-  echo '                    install to $$(INSTALL_PATH) and run lilo'
+  echo '                    install to $$(INSTALL_PATH)'
   echo '  *_defconfig     - Select default config from arch/powerpc/configs'
   echo ''
   echo '  Targets with <dt> embed a device tree blob inside the image'
-- 
2.46.2


