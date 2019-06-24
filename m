Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A29950355
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 09:27:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45XLVF3QJTzDq8g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2019 17:27:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="DJ7VtSfE"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45XLKf0CZbzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2019 17:20:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45XLKQ1dzlz9vBmm;
 Mon, 24 Jun 2019 09:20:10 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=DJ7VtSfE; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EVGMQM8g4W45; Mon, 24 Jun 2019 09:20:10 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45XLKQ0cdBz9vBmR;
 Mon, 24 Jun 2019 09:20:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561360810; bh=qtRDjQOmzU0jcEi1abEzapHHsVFqfQHgt0aZqDG8tp8=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=DJ7VtSfEndHazbdObGLIennmW//Bzzp8tAt34vhHuMOl+sPiynwkGgZzcCD1LEWuz
 JwVSzq6TFKybaFKNrYmhojmmxGaucIpAFYL7xQ4IlWcxdVjYv2V7Z9zS6WMU4J7WBX
 uhb5ECl6I1ciWOzRGZTHr1a+dtViu5BNrRar8cWE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A4AE68B787;
 Mon, 24 Jun 2019 09:20:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fI-BdEW2J8X1; Mon, 24 Jun 2019 09:20:14 +0200 (CEST)
Received: from po16838vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 832AD8B74C;
 Mon, 24 Jun 2019 09:20:14 +0200 (CEST)
Received: by po16838vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 86A6A67424; Mon, 24 Jun 2019 07:20:14 +0000 (UTC)
Message-Id: <5271b86a5b6bea0bec068c01e1124fb0a3cfa750.1561360551.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1561360551.git.christophe.leroy@c-s.fr>
References: <cover.1561360551.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v5 1/4] lib/scatterlist: Fix mapping iterator when sg->offset
 is greater than PAGE_SIZE
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>, horia.geanta@nxp.com
Date: Mon, 24 Jun 2019 07:20:14 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All mapping iterator logic is based on the assumption that sg->offset
is always lower than PAGE_SIZE.

But there are situations where sg->offset is such that the SG item
is on the second page. In that case sg_copy_to_buffer() fails
properly copying the data into the buffer. One of the reason is
that the data will be outside the kmapped area used to access that
data.

This patch fixes the issue by adjusting the mapping iterator
offset and pgoffset fields such that offset is always lower than
PAGE_SIZE.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
Fixes: 4225fc8555a9 ("lib/scatterlist: use page iterator in the mapping iterator")
Cc: stable@vger.kernel.org
---
 lib/scatterlist.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/lib/scatterlist.c b/lib/scatterlist.c
index 739dc9fe2c55..f0757a67affe 100644
--- a/lib/scatterlist.c
+++ b/lib/scatterlist.c
@@ -678,17 +678,18 @@ static bool sg_miter_get_next_page(struct sg_mapping_iter *miter)
 {
 	if (!miter->__remaining) {
 		struct scatterlist *sg;
-		unsigned long pgoffset;
 
 		if (!__sg_page_iter_next(&miter->piter))
 			return false;
 
 		sg = miter->piter.sg;
-		pgoffset = miter->piter.sg_pgoffset;
 
-		miter->__offset = pgoffset ? 0 : sg->offset;
+		miter->__offset = miter->piter.sg_pgoffset ? 0 : sg->offset;
+		miter->piter.sg_pgoffset += miter->__offset >> PAGE_SHIFT;
+		miter->__offset &= PAGE_SIZE - 1;
 		miter->__remaining = sg->offset + sg->length -
-				(pgoffset << PAGE_SHIFT) - miter->__offset;
+				     (miter->piter.sg_pgoffset << PAGE_SHIFT) -
+				     miter->__offset;
 		miter->__remaining = min_t(unsigned long, miter->__remaining,
 					   PAGE_SIZE - miter->__offset);
 	}
-- 
2.13.3

