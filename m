Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24942806F4B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 12:58:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YSF7uBAt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SlbWy4XtKz3dXT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Dec 2023 22:58:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=YSF7uBAt;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (unknown [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SlbTR2Bldz3c4t
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Dec 2023 22:56:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701863761;
	bh=Q5kDnVJwE4LhZSH3tVplUiC4du4KhmLD/y8EdpINL3Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YSF7uBAt2YYNLHbN4+XcMGZYLPpY5ppLYNnIwxBNPanajKEEQ49oFM76miJb/h9V2
	 sLLxx0w2eIxl7dJ3B+fPn21/gdFU2chMGOrzWqbEXxOD/hZH8VrmrI6Yqclbakke8D
	 Xe7yvRQQmh5XlDWTNHwAQsvmVv19Rhbnzs52Vk1ifzmZ6pYFzkAICQTFLGBwCZxuNf
	 c+Zj8yCU5q168RMxRiw/S/T1+b/U6Qb0gI8cHzsuUlCm2fOX2ps5sBl8dVfPdaiPGH
	 /987ocAbJXhJgFG4ElKorTrKYInxcJoLKrcUtiw5dLULlVL4efHMxVuezmoyS/NZA/
	 PQwvhCoBGVz+w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SlbTF0vtbz4x1v;
	Wed,  6 Dec 2023 22:56:01 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/4] powerpc/Makefile: Default to ppc64le_defconfig when cross building
Date: Wed,  6 Dec 2023 22:55:47 +1100
Message-ID: <20231206115548.1466874-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231206115548.1466874-1-mpe@ellerman.id.au>
References: <20231206115548.1466874-1-mpe@ellerman.id.au>
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

If the kernel is being cross compiled, there is no information from
uname on which defconfig is most appropriate, so the Makefile defaults
to ppc64.

However these days almost all distros that support powerpc are little
endian, so it's more likely that defaulting to ppc64le_defconfig will
produce something useful for a user.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index b0bc17c35ed7..48c06f5a0dc1 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -16,9 +16,9 @@ HAS_BIARCH	:= $(call cc-option-yn, -m32)
 CROSS32_COMPILE ?=
 
 # If we're on a ppc/ppc64/ppc64le machine use that defconfig, otherwise just use
-# ppc64_defconfig because we have nothing better to go on.
+# ppc64le_defconfig because we have nothing better to go on.
 uname := $(shell uname -m)
-KBUILD_DEFCONFIG := $(if $(filter ppc%,$(uname)),$(uname),ppc64)_defconfig
+KBUILD_DEFCONFIG := $(if $(filter ppc%,$(uname)),$(uname),ppc64le)_defconfig
 
 new_nm := $(shell if $(NM) --help 2>&1 | grep -- '--synthetic' > /dev/null; then echo y; else echo n; fi)
 
-- 
2.43.0

