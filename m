Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AFA76E243D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:28:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PychL2qc6z3fZS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:28:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T6ovXTno;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pyccl3Kytz3cMT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=T6ovXTno;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccl2Xxbz4xFp;
	Fri, 14 Apr 2023 23:24:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478695;
	bh=6wx+Qtqpj8JOkLwbgfN5jOutj527fW38w9WFEI6JoZ4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T6ovXTnoLfSHOPShcZOi1MlbzDzt64pAZzetQ3mz3/rnFrIjEpLClXJEJ4yGy+OE3
	 DDT+GId8V2BrvIZA8yAh2nIWElPlQuEI+LTbi6/aThHMabdrk+qMzbOB+1NaIEsTHU
	 XXl6S+XaeWwetLLo+4+CKmxBcHTtzN67TyBHhMRkfc4qmzn5CJYsTBcvcsSa1F8R83
	 GNeVnmJgiaCJKnICZUf7r0U5cRVOl52VSELnVHaG2JORFL+WmGvv270jUoVgAEZyy/
	 x/hN1CYdG8BXcyOo0HXg02lv553Z40kRksMx8Jhq1JtPt8x7bwRv54nljt+gpc2lUc
	 O4BE2ir5S73rg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 05/32] powerpc/configs/64s: Enable PAPR_SCM
Date: Fri, 14 Apr 2023 23:23:48 +1000
Message-Id: <20230414132415.821564-5-mpe@ellerman.id.au>
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

This is a powerpc specific driver so add the symbols required to enable
it so it gets some build/boot test coverage.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 74477f89c108..d98fe52a5892 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -29,6 +29,7 @@ CONFIG_NR_CPUS=2048
 CONFIG_DTL=y
 CONFIG_PPC_SMLPAR=y
 CONFIG_IBMEBUS=y
+CONFIG_PAPR_SCM=m
 CONFIG_PPC_SVM=y
 CONFIG_PPC_MAPLE=y
 CONFIG_PPC_PASEMI=y
@@ -69,6 +70,7 @@ CONFIG_MEMORY_HOTPLUG=y
 CONFIG_MEMORY_HOTREMOVE=y
 CONFIG_KSM=y
 CONFIG_TRANSPARENT_HUGEPAGE=y
+CONFIG_ZONE_DEVICE=y
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_UNIX=y
-- 
2.39.2

