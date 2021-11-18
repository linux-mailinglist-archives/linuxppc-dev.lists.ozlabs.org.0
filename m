Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B2F4551D1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 01:44:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hvh051K42z2ymq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 11:44:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=kzhHy3xF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HvgzS4G1lz2xCW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 11:44:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=kzhHy3xF; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HvgzR6pYZz4xbs;
 Thu, 18 Nov 2021 11:44:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1637196260;
 bh=9KU2sMAnIKxSPtVEFKiqZj1BCUP/qW05mJVZKrbNRpU=;
 h=From:To:Subject:Date:From;
 b=kzhHy3xFnASKKHC/+Mf+ZBh6U3iUZ2OPBPNaKwgpfkJ0dS2ngXu3Y8qlCJj8VL2eh
 zSeOyZNo1Yvy/u7OVLFum4GDGhFfkrgcs25FdPX2I424P8YBEbN7bJKezJVTWNU5dV
 CTvU3pVhyJEbel7lmze8AN1u85DQ5WQYqO6z7zwPCdKR87+sEQvkOXcZjYomQ63Fc+
 pQWCIOfIRk4OGVQgCXYK0hZeTbZSx2rcQRILz4SyQCczycbx28zmE0uU19GSBqdb6i
 KITFnLprc3BGwxgXnpIBvCYBbUNbSaOU+h2/0XNge68vG4HC4guBJOwfABUmtyJNQ8
 WFaoVPo/bOH3Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/microwatt: Make microwatt_get_random_darn() static
Date: Thu, 18 Nov 2021 11:44:15 +1100
Message-Id: <20211118004415.1706863-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.31.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make microwatt_get_random_darn() static, because it can be.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/microwatt/rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Report: https://lore.kernel.org/lkml/202111120545.dtEw8pTr-lkp@intel.com/

diff --git a/arch/powerpc/platforms/microwatt/rng.c b/arch/powerpc/platforms/microwatt/rng.c
index 3d8ee6eb7dad..7bc4d1cbfaf0 100644
--- a/arch/powerpc/platforms/microwatt/rng.c
+++ b/arch/powerpc/platforms/microwatt/rng.c
@@ -14,7 +14,7 @@
 
 #define DARN_ERR 0xFFFFFFFFFFFFFFFFul
 
-int microwatt_get_random_darn(unsigned long *v)
+static int microwatt_get_random_darn(unsigned long *v)
 {
 	unsigned long val;
 
-- 
2.31.1

