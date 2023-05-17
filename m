Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F271C7061AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 09:49:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLlcS60qKz3cgm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 17:49:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FXlmYeEQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLlbZ6w3Tz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 17:48:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FXlmYeEQ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QLlbW37thz4x1f;
	Wed, 17 May 2023 17:48:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684309719;
	bh=GV51bmIb2WR+LyI2bNRccI9vo2atgork4BZloksI5Tc=;
	h=From:To:Cc:Subject:Date:From;
	b=FXlmYeEQbvLXoH7ZNX7bl5wEvOgtM6JE7G7M3E5hVLSJT8niVBEd9ziUNHYZtqq+m
	 9K07TeGrbDLLKybxmBI20UFJO0EKrctS6PBCNnuFoyb/2Xs4+1fEfQ6+QUXit7ONrF
	 1SxtGTlovWbe7i81HvBY/Vo/x2ifwo60CE/fDEmDSLy/v9pGu8PO5Av9SPm7bWkqd+
	 k4mDWWiluKVRBYCkgw8EJW+LeZxPxJ6PLohGTBRJvv0rtkhXWEjR6jXcToL43MTemN
	 RVZXLhQhq8hzoZlDCcFtOJjkBd7n2zUKporugwQ9RZ81NMyH+jpd2O9c4eNlLqu8ND
	 wY4e0O4Nmi1UA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Mark powermac as orphan in MAINTAINERS
Date: Wed, 17 May 2023 17:48:19 +1000
Message-Id: <20230517074819.52546-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
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
Cc: linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Ben no longer has time to do any maintenance of the powermac code. Mark
it as orphan.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e0ad886d3163..865a50238f44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11907,9 +11907,8 @@ F:	lib/linear_ranges.c
 F:	lib/test_linear_ranges.c
 
 LINUX FOR POWER MACINTOSH
-M:	Benjamin Herrenschmidt <benh@kernel.crashing.org>
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Odd Fixes
+S:	Orphan
 F:	arch/powerpc/platforms/powermac/
 F:	drivers/macintosh/
 
-- 
2.40.1

