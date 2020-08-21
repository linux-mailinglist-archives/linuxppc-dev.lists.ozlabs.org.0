Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 345DD24E04D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 21:02:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BY9rT2C74zDqT3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Aug 2020 05:02:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=anastas.io (client-ip=104.248.188.109; helo=alpha.anastas.io;
 envelope-from=shawn@anastas.io; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none)
 header.from=anastas.io
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=anastas.io header.i=@anastas.io header.a=rsa-sha256
 header.s=mail header.b=Q6clphOa; dkim-atps=neutral
Received: from alpha.anastas.io (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BY9hm058ZzDrHF
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Aug 2020 04:56:07 +1000 (AEST)
Received: from authenticated-user (alpha.anastas.io [104.248.188.109])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by alpha.anastas.io (Postfix) with ESMTPSA id 1FEBE7ECDD;
 Fri, 21 Aug 2020 13:56:04 -0500 (CDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=anastas.io; s=mail;
 t=1598036164; bh=UBljeAuBdWCbfDZzaKPFobi6RKGS3hyHukcQKEFDCmQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Q6clphOalIRRehkoJbq8SIUsVvWtw3QZq3B32cqW0wZ3Jh9xLetd889L2r7kQym8D
 iwPZTsNsKfHxethACNcrkf6FY/uQ2zl7UXkW1Vxdc7ffYMs4SFe2DeCc+mpvM22Ft9
 03oOyAb5UEXqiyrs3IogLLKFsnYQOYPmdlLwEnyayFZu1i+lRk/QddnqJs92D7/538
 lrcqxSgYXTLqIQyVtQLXew9iCyHNoDWmNoQ+LZSXjlGwhyWhgd2ZBPdznUTegVxfEp
 Ll6KXu4fN8zDb1yruKp6C/yODQ+OhJexNmTu2zBn+E28fow9myn5aDrV0MXJL5Vsij
 wJRzdq+QSlGfw==
From: Shawn Anastasio <shawn@anastas.io>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 3/3] selftests/powerpc: Update PROT_SAO test to skip ISA 3.1
Date: Fri, 21 Aug 2020 13:55:58 -0500
Message-Id: <20200821185558.35561-4-shawn@anastas.io>
In-Reply-To: <20200821185558.35561-1-shawn@anastas.io>
References: <20200821185558.35561-1-shawn@anastas.io>
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since SAO support was removed from ISA 3.1, skip the
prot_sao test if PPC_FEATURE2_ARCH_3_1 is set.

Signed-off-by: Shawn Anastasio <shawn@anastas.io>
---
 tools/testing/selftests/powerpc/mm/prot_sao.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/powerpc/mm/prot_sao.c b/tools/testing/selftests/powerpc/mm/prot_sao.c
index e2eed65b7735..e0cf8ebbf8cd 100644
--- a/tools/testing/selftests/powerpc/mm/prot_sao.c
+++ b/tools/testing/selftests/powerpc/mm/prot_sao.c
@@ -18,8 +18,9 @@ int test_prot_sao(void)
 {
 	char *p;
 
-	/* 2.06 or later should support SAO */
-	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06));
+	/* SAO was introduced in 2.06 and removed in 3.1 */
+	SKIP_IF(!have_hwcap(PPC_FEATURE_ARCH_2_06) ||
+		have_hwcap2(PPC_FEATURE2_ARCH_3_1));
 
 	/*
 	 * Ensure we can ask for PROT_SAO.
-- 
2.28.0

