Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD826E2459
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pycsb5vF1z3fvZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:36:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CM4/14to;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccr4Qz7z3fSN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=CM4/14to;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccr3K0pz4xFL;
	Fri, 14 Apr 2023 23:25:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478700;
	bh=MDG8N742C2pqLMX/CpHdaGeIIvsnWTr+SIVE69YQwxY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CM4/14topDgCOfSKZjgwclNCEmi8P75AxFN7cqgOo2Ruxnt63/fe252Se+J52xtEG
	 bZJ19Ruvcxi3o+lOl26V/HgVb7i7BSMF+G/nPGOaOQsvBOioxWGI3nIitMPI+wTBw3
	 YCUtYISsztfYZbS5aTV+GElHYlGMYz2Q+pnvCPsTAA0gR70vnw+M13R39R1pz9NJvh
	 Qojn4Of4ZDIMgBbK7QnLj21yTBA+4CendNoVhEJqOClLetFR+xNMHV8vccpBuB3mNy
	 5hT8N0MX8drFiPVT5t/rAGALS02kRt4y+x9Ue39soQ7ugfR4G+ksE8LF7YfSF6mBJE
	 9ekKyIBzbJf8w==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 15/32] powerpc/configs/64s: Enable SLAB hardening options
Date: Fri, 14 Apr 2023 23:23:58 +1000
Message-Id: <20230414132415.821564-15-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
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

Fedora & CentOS enable these.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 59b9d8eb1c7b..0aafe64cd1d7 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -81,6 +81,10 @@ CONFIG_BINFMT_MISC=m
 CONFIG_ZSWAP=y
 CONFIG_Z3FOLD=y
 CONFIG_ZSMALLOC=y
+# CONFIG_SLAB_MERGE_DEFAULT is not set
+CONFIG_SLAB_FREELIST_RANDOM=y
+CONFIG_SLAB_FREELIST_HARDENED=y
+CONFIG_SHUFFLE_PAGE_ALLOCATOR=y
 # CONFIG_COMPAT_BRK is not set
 CONFIG_MEMORY_HOTPLUG=y
 CONFIG_MEMORY_HOTREMOVE=y
-- 
2.39.2

