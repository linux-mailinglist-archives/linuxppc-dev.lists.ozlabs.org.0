Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 428B6650657
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 03:24:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nb3Rg1Lxbz3cC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Dec 2022 13:23:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=nfschina.com (client-ip=124.16.136.209; helo=mail.nfschina.com; envelope-from=zeming@nfschina.com; receiver=<UNKNOWN>)
X-Greylist: delayed 293 seconds by postgrey-1.36 at boromir; Mon, 19 Dec 2022 13:23:28 AEDT
Received: from mail.nfschina.com (unknown [124.16.136.209])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nb3R44dkwz2xKX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Dec 2022 13:23:28 +1100 (AEDT)
Received: from localhost (unknown [127.0.0.1])
	by mail.nfschina.com (Postfix) with ESMTP id B3FFF1E80D6D;
	Mon, 19 Dec 2022 10:13:31 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
	by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id agkulhGKmcTu; Mon, 19 Dec 2022 10:13:29 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
	(Authenticated sender: zeming@nfschina.com)
	by mail.nfschina.com (Postfix) with ESMTPA id ED2C01E80D32;
	Mon, 19 Dec 2022 10:13:28 +0800 (CST)
From: Li zeming <zeming@nfschina.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	gregkh@linuxfoundation.org
Subject: [PATCH] boot: simple_alloc: check after increasing memory allocation
Date: Mon, 19 Dec 2022 10:18:16 +0800
Message-Id: <20221219021816.3012-1-zeming@nfschina.com>
X-Mailer: git-send-email 2.18.2
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Li zeming <zeming@nfschina.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pointer new adds judgment and should help with program robustness.

Signed-off-by: Li zeming <zeming@nfschina.com>
---
 arch/powerpc/boot/simple_alloc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/simple_alloc.c b/arch/powerpc/boot/simple_alloc.c
index 267d6524caac..db9aaa5face3 100644
--- a/arch/powerpc/boot/simple_alloc.c
+++ b/arch/powerpc/boot/simple_alloc.c
@@ -112,7 +112,9 @@ static void *simple_realloc(void *ptr, unsigned long size)
 		return ptr;
 
 	new = simple_malloc(size);
-	memcpy(new, ptr, p->size);
+	if (new)
+		memcpy(new, ptr, p->size);
+
 	simple_free(ptr);
 	return new;
 }
-- 
2.18.2

