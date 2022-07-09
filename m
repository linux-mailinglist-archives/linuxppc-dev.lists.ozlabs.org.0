Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 068B456CA7E
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jul 2022 18:04:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LgFMv65mHz3cf4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Jul 2022 02:04:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wanadoo.fr (client-ip=80.12.242.131; helo=smtp.smtpout.orange.fr; envelope-from=christophe.jaillet@wanadoo.fr; receiver=<UNKNOWN>)
Received: from smtp.smtpout.orange.fr (smtp09.smtpout.orange.fr [80.12.242.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LgFMW6WSpz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Jul 2022 02:04:21 +1000 (AEST)
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id ACp2olvOKOXCyACp2oyRKl; Sat, 09 Jul 2022 17:56:47 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Sat, 09 Jul 2022 17:56:47 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>
Subject: [PATCH] KVM: PPC: Book3S HV: Use the bitmap API to allocate bitmaps
Date: Sat,  9 Jul 2022 17:56:43 +0200
Message-Id: <52e843a460bc374973149b8da0bd04f9761b80b7.1657382184.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
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
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linuxppc-dev@lists.ozlabs.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use bitmap_zalloc()/bitmap_free() instead of hand-writing them.

It is less verbose and it improves the semantic.

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 arch/powerpc/kvm/book3s_hv_uvmem.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
index 598006301620..95de5fac6497 100644
--- a/arch/powerpc/kvm/book3s_hv_uvmem.c
+++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
@@ -1187,8 +1187,7 @@ int kvmppc_uvmem_init(void)
 
 	pfn_first = res->start >> PAGE_SHIFT;
 	pfn_last = pfn_first + (resource_size(res) >> PAGE_SHIFT);
-	kvmppc_uvmem_bitmap = kcalloc(BITS_TO_LONGS(pfn_last - pfn_first),
-				      sizeof(unsigned long), GFP_KERNEL);
+	kvmppc_uvmem_bitmap = bitmap_zalloc(pfn_last - pfn_first, GFP_KERNEL);
 	if (!kvmppc_uvmem_bitmap) {
 		ret = -ENOMEM;
 		goto out_unmap;
@@ -1212,5 +1211,5 @@ void kvmppc_uvmem_free(void)
 	memunmap_pages(&kvmppc_uvmem_pgmap);
 	release_mem_region(kvmppc_uvmem_pgmap.range.start,
 			   range_len(&kvmppc_uvmem_pgmap.range));
-	kfree(kvmppc_uvmem_bitmap);
+	bitmap_free(kvmppc_uvmem_bitmap);
 }
-- 
2.34.1

