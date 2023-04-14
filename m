Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E58CE6E2435
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:25:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PycdZ5LyPz3f6n
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:25:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iYYEiYoV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pycck0Nnmz3chl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:24:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iYYEiYoV;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pyccj6G0vz4xFL;
	Fri, 14 Apr 2023 23:24:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478693;
	bh=EKBqSc1jcyxH8ldPhRk7vgjgkOLs/AjSiZxV7uOTyZw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iYYEiYoVLBxp0HRWn+B60ZAxxFPQ2STg8B0UWz8jrSvCIvS5fxthhU1mNQF/iUi8S
	 hJG7U8y4I1U526U3kAyGmysrDFMKsG6aZ5OSViIcUy89at73E+rvEZJ5GN0L2hwP1b
	 D+bRHN0kzypZqoBhzsXmBLmegVJGtL3lXkAJEnlsotfIlxlAiXL38tQJ+CBnJBpqI+
	 OsGm7VGsWREzgqDeFnFShUB/kTM+fmG1wlYIha8p7g77XQA7DgF/m62AU6BYSNHQQp
	 9vk9YojaCElZ6XB0yzgDCn42f5f85zxjNEgqsAbHyu4tw/Amu5Wex2yLCuxJkX48Z4
	 tNEtGr0WXk1fQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 02/32] powerpc/configs/64s: Drop SPLPAR which is default y
Date: Fri, 14 Apr 2023 23:23:45 +1000
Message-Id: <20230414132415.821564-2-mpe@ellerman.id.au>
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

SPLPAR is default y since commit 20c0e8269e9d ("powerpc/pseries:
Implement paravirt qspinlocks for SPLPAR"), so doesn't need to be in the
defconfig.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc64_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index 1028b90ce121..0a3a2fefb652 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -26,7 +26,6 @@ CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_PPC64=y
 CONFIG_NR_CPUS=2048
-CONFIG_PPC_SPLPAR=y
 CONFIG_DTL=y
 CONFIG_PPC_SMLPAR=y
 CONFIG_IBMEBUS=y
-- 
2.39.2

