Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AFB45EED22
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 07:15:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdM5R1tW1z3c4S
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 15:15:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GpWv6Q7X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdM4p63ptz2yT0
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 15:15:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=GpWv6Q7X;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdM4n2TRZz4xGh;
	Thu, 29 Sep 2022 15:15:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664428521;
	bh=8+Bn0/iLaj7Ijggca+Lwi9U6V8/3H3Wz4E6J/V8wrow=;
	h=From:To:Cc:Subject:Date:From;
	b=GpWv6Q7XQWZ/23BOO5TRdruZh6xnDghs+8VXcoTWqLxTntiXWAB8QXFooNDZfGIz/
	 /CXUzH9DyxGHtPZsyzYLDYiyN9ztGrkA2UiFcTzT4ZRmZnltBEWkPimIHOJzeMOxg/
	 TXoN6MSidBL++pF97fScu+OeOAWbyxyWPNlfcbitDd+82LHtAKFrq29/AnasBIHnpJ
	 ZcezKiwPEvfjIJF19ecl+2k5IbZX3+Z22scKmKo93/yPpZ7HA9s7BH+jh5kfdl/TF8
	 8r60kk5diUJSyX5VlxS8MJn4YFsuyPPFegfWDOqU7XGFAIhGBOS+Gy1Z0BAQMI/RBp
	 SKY+ATeuxCoIQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/configs: Enable PPC_UV in powernv_defconfig
Date: Thu, 29 Sep 2022 15:15:17 +1000
Message-Id: <20220929051517.1903079-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
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
Cc: apopple@nvidia.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make sure the ultravisor code at least gets some build testing by
enabling it in powernv_defconfig.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/powernv_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index 49f49c263935..76fb6ff8769f 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -50,6 +50,7 @@ CONFIG_CPU_IDLE=y
 CONFIG_HZ_100=y
 CONFIG_BINFMT_MISC=m
 CONFIG_PPC_TRANSACTIONAL_MEM=y
+CONFIG_PPC_UV=y
 CONFIG_HOTPLUG_CPU=y
 CONFIG_KEXEC=y
 CONFIG_KEXEC_FILE=y
@@ -65,6 +66,8 @@ CONFIG_DEFERRED_STRUCT_PAGE_INIT=y
 CONFIG_SCHED_SMT=y
 CONFIG_PM=y
 CONFIG_HOTPLUG_PCI=y
+CONFIG_ZONE_DEVICE=y
+CONFIG_DEVICE_PRIVATE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
-- 
2.37.3

