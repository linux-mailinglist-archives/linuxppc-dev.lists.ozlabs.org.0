Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 091ADFF3FE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 17:43:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Fgxy71pvzDr6W
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2019 03:43:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="y3HiT4r4"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Fffl0nwrzF3sH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2019 02:44:47 +1100 (AEDT)
Received: from sasha-vm.mshome.net (unknown [50.234.116.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 912A12073B;
 Sat, 16 Nov 2019 15:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573919085;
 bh=VPtjYK0w0uuloqDArLaAMixd8sNqxlmnTNrSoitDDRs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=y3HiT4r4jfdNC9nCFT+soqsTcb8hytpY3lfXCn0aOIvRb8+67AkmEvzfJmoRiFmf/
 ofEZ4QCpdGWKjiif5iQII9OO6dY6Juizj432KMr5Pqk8S6ZHw28IDPJZ8LU9+9cEhA
 eotwILpYpNfSDeOPNh15QUgWOv1VFs1ZecGWBDxw=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 147/237] selftests/powerpc/cache_shape: Fix
 out-of-tree build
Date: Sat, 16 Nov 2019 10:39:42 -0500
Message-Id: <20191116154113.7417-147-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191116154113.7417-1-sashal@kernel.org>
References: <20191116154113.7417-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Michael Ellerman <mpe@ellerman.id.au>

[ Upstream commit 69f8117f17b332a68cd8f4bf8c2d0d3d5b84efc5 ]

Use TEST_GEN_PROGS and don't redefine all, this makes the out-of-tree
build work. We need to move the extra dependencies below the include
of lib.mk, because it adds the $(OUTPUT) prefix if it's defined.

We can also drop the clean rule, lib.mk does it for us.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 tools/testing/selftests/powerpc/cache_shape/Makefile | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/powerpc/cache_shape/Makefile b/tools/testing/selftests/powerpc/cache_shape/Makefile
index ede4d3dae7505..689f6c8ebcd8d 100644
--- a/tools/testing/selftests/powerpc/cache_shape/Makefile
+++ b/tools/testing/selftests/powerpc/cache_shape/Makefile
@@ -1,12 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
-TEST_PROGS := cache_shape
-
-all: $(TEST_PROGS)
-
-$(TEST_PROGS): ../harness.c ../utils.c
+TEST_GEN_PROGS := cache_shape
 
 top_srcdir = ../../../../..
 include ../../lib.mk
 
-clean:
-	rm -f $(TEST_PROGS) *.o
+$(TEST_GEN_PROGS): ../harness.c ../utils.c
-- 
2.20.1

