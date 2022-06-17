Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6E454F277
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:03:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPWkk0Mfvz3dpG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:03:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NV2fwnti;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LPWk673xdz2xvw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:02:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NV2fwnti;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LPWk23BNQz4xXJ;
	Fri, 17 Jun 2022 18:02:50 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655452970;
	bh=vvQQ9dW7uySr9c9qitB9W/WMS/96KEoCF1rruuPFuYk=;
	h=From:To:Cc:Subject:Date:From;
	b=NV2fwntifasu6TQjhK0+Vw8tWYoGXfhMNQY3uSbArkin9t5HQpZgV+ngcvyKjg+21
	 FFci1Ui8RskrWs7ZgbJPty32xfeaM7q0Q+CWLTO53vWd3EQIpUEsoYTh+Q1n9q/QRk
	 Fbo9Y+YAOi6HauKYd2FMXx/agqkJqqZjmFrBDpRtWKoZr2yo2VRV3x8OhDIAVJQ61W
	 XHa//0A9d4y+QqMu48/vQSovwwK0Wk6n56VgiGW56m6cbSoV6xV124/f7WZyZtwooH
	 frD+E0vxR6kE/9tS2rtFmm8Kjoe1pLnNhidsA48hpwp7DKiqOGGCifdoLIL5nnnAYC
	 moDl4hpmkvbdw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerc: Update asm-prototypes.h comment
Date: Fri, 17 Jun 2022 18:02:43 +1000
Message-Id: <20220617080243.2177583-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This header was recently cleaned up in commit 76222808fc25 ("powerpc:
Move C prototypes out of asm-prototypes.h"), update the comment to
reflect it's proper purpose.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/asm-prototypes.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
index d995c65d18ab..eda6dba9378f 100644
--- a/arch/powerpc/include/asm/asm-prototypes.h
+++ b/arch/powerpc/include/asm/asm-prototypes.h
@@ -2,8 +2,9 @@
 #ifndef _ASM_POWERPC_ASM_PROTOTYPES_H
 #define _ASM_POWERPC_ASM_PROTOTYPES_H
 /*
- * This file is for prototypes of C functions that are only called
- * from asm, and any associated variables.
+ * This file is for C prototypes of asm symbols that are EXPORTed.
+ * It allows the modversions logic to see their prototype and
+ * generate proper CRCs for them.
  *
  * Copyright 2016, Daniel Axtens, IBM Corporation.
  */
-- 
2.35.3

