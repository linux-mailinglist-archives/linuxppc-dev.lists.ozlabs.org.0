Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E64246E2486
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:45:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pyd4r5wgfz3ffh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:45:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UJaJnQ/t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccy5xrbz3fCJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UJaJnQ/t;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccy5B4Qz4xNH;
	Fri, 14 Apr 2023 23:25:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478706;
	bh=7r9l8f0pCkF28U+1ZT6GlmiR0/r4h3Faq7a3x/b9nLc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UJaJnQ/tVJhiJ1zPAA/OxLaGgtu5pvG6WsogRgmxc7vTaWBtH/21Pe3MS0CNpIWtU
	 Ldmp8LhK72HdX2LWywqMirjHKUO3RNjBqym7yAavcYqNmU8ZdZzxJPCx6yZEq0jELL
	 nsFqYxM3AXIcweAkpwOoeXVBmVI7hwbjMFAv8o16wduBz550xUg/kOu1UGHgarrha9
	 88jEV4lbAUCXQM4UPJ3/TXi9tOThF6HECmlWH1cFPdN/hsAGR3ThlIzqlcYfq98wmC
	 xbEVz8C+74283eJ1xwDHpeFDuglgwvrTfq9XiDVYBryyvGpgDYthZR/FhMojNokx4/
	 ez99rlfYMTK3A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 27/32] powerpc/configs/64s: Enable PSTORE
Date: Fri, 14 Apr 2023 23:24:10 +1000
Message-Id: <20230414132415.821564-27-mpe@ellerman.id.au>
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

Like pseries & powernv_defconfig, enable PSTORE.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 833847b775ec..037219dda19f 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -341,6 +341,7 @@ CONFIG_SQUASHFS=m
 CONFIG_SQUASHFS_XATTR=y
 CONFIG_SQUASHFS_LZO=y
 CONFIG_SQUASHFS_XZ=y
+CONFIG_PSTORE=y
 CONFIG_NFS_FS=y
 CONFIG_NFS_V3_ACL=y
 CONFIG_NFS_V4=y
-- 
2.39.2

