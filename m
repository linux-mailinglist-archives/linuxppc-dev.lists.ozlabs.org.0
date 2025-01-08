Return-Path: <linuxppc-dev+bounces-4836-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA029A058A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 11:50:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSl733HXSz30T1;
	Wed,  8 Jan 2025 21:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736333407;
	cv=none; b=W/yEKU26Wlz+Xyqs6VbS8D/0GwnNEgb146JB8ZWhAYJCeOl0Ixf7RNzDkV40H0C2qQhB8Irz5EJsIf7kihuk6yiOHXEIjfv5rmDLsxqnIoR0SYFA1SpWhpNrhDukH81m9aVFkk0XkIyNoVc6jNLGd+pY6ZXMYRqOzIj2NGEFZk5OJClkm8EYYe56bMp83bWJbzxW8wtLQXZ9pzLwNuLGDAFmpkhbJXjRlexa0kYomTvAEW+PwrmJxneDx3Q9eh1zac5Yj2lNt+mpDE31DCg5en+JOkXF8eXtPcqTfoUTr5XEW0EelO1LZYdlbVwrbXSTidWoYpSgw6iCBdRwYMqVPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736333407; c=relaxed/relaxed;
	bh=+yEH8897po3o8wfVVwTF5R8ks6B+/IQiBfiy0OJzIhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N71PzrmRjkmtiT93Pp8/QJpr2WvQh01aMdFbYpueCSfWDp/rOwgQawaS+DBMDXrzy29LswkUZViN7ayN9d+o1rZZjcVSA5paoaREaeDK8cWMZocApLCxewYexKK0nOskJVIzvmLTdBeLzr4DKocfsIqQE9EMLKpf//UiF6OiuZMMb7LyeWI0ZCcjAZBUCkVLkK9x3KY8N3+KBsaykEPZlVAWtCJ3TW5NS14au7weMtVifC1E9J19xue0Pe56uQcx3imsgdbVGi3j4WbVJiZAPqX1blBd7XKKVXDlQp2tBcGZoTzwrbdeIKpWAUFTjAIEPUj2h2/6/zVl6NGKX+2PPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSl713Qc0z30Ss
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 21:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YSkYz1l3yz9sPd;
	Wed,  8 Jan 2025 11:24:55 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tKW6bR3EAy7f; Wed,  8 Jan 2025 11:24:55 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YSkYz0TYlz9rvV;
	Wed,  8 Jan 2025 11:24:55 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C6FA18B768;
	Wed,  8 Jan 2025 11:24:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hvISgO05s3Wc; Wed,  8 Jan 2025 11:24:54 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 558358B767;
	Wed,  8 Jan 2025 11:24:54 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] powerpc/44x: Declare primary_uic static in uic.c
Date: Wed,  8 Jan 2025 11:24:54 +0100
Message-ID: <0e11233d30333610ab460b3a1fd0f43c3a51e34d.1736331884.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736331894; l=825; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=21ivfBwVCMvA2qFp8OpQRDnZmgAqNKKXias6MJqt5Sk=; b=wGpIAQz50BTGfGjbVCxlG/LoDY9GxNGPI5fWl/J+6Kh/ctAVPS5NtLjvYzTK9bSbRUzW5Ew4Q KiU1fimHIsYBAuhHPVfq3Qdbg8jckNKghiEnlduBgTm2596RDMl5wLH
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

primary_uic is not used outside uic.c, declare it static.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202411101746.lD8YdVzY-lkp@intel.com/
Fixes: e58923ed1437 ("[POWERPC] Add arch/powerpc driver for UIC, PPC4xx interrupt controller")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/platforms/44x/uic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/44x/uic.c b/arch/powerpc/platforms/44x/uic.c
index e3e148b9dd18..8b03ae4cb3f6 100644
--- a/arch/powerpc/platforms/44x/uic.c
+++ b/arch/powerpc/platforms/44x/uic.c
@@ -37,7 +37,7 @@
 #define UIC_VR		0x7
 #define UIC_VCR		0x8
 
-struct uic *primary_uic;
+static struct uic *primary_uic;
 
 struct uic {
 	int index;
-- 
2.47.0


