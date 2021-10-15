Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D00B642E834
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 07:00:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVvG71lzNz3bbv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 15:59:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y122mcwL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=gustavoars@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Y122mcwL; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVvFR0FlNz2yxj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 15:59:22 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 61FCB611BD;
 Fri, 15 Oct 2021 04:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634273960;
 bh=/uoHz+FQ9emMCfOnNYpHnuX4+14/9z8ccvDRKSLVoP0=;
 h=Date:From:To:Cc:Subject:From;
 b=Y122mcwLoD/b2wScp+5PQopFaEb6gR0jljnYfdJ8WTuF1/akfspve+cPzp1y3YShC
 v4gV6akOfvRasvStU+V2JIX/cgiXQE7b10eR4iLwC4EgrMeTULlG95nltbW6U4atQm
 aov3vHuN9LLbxQFeXiW4Qu1k1zRGGlD07PpvxB2KzrLLn5jy70kPO4Zrs9bOexCQKi
 ZYg06OMNThgTC4UcTqkCEvveHGrk92/2kAdEhVkh74kd4hjIIFPZUypny/G2aZ4rl7
 fQ/8rhrKbzgLPrKINnYy1i4aEUPeRzIYq79/k8QmFvJ6etlS00hdAJWF1LLLKJa2PY
 lFBD8l1U7shqQ==
Date: Fri, 15 Oct 2021 00:03:45 -0500
From: "Gustavo A. R. Silva" <gustavoars@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>,
 Haren Myneni <haren@linux.ibm.com>
Subject: [PATCH][next] powerpc/vas: Fix potential NULL pointer dereference
Message-ID: <20211015050345.GA1161918@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

(!ptr && !ptr->foo) strikes again. :)

The expression (!ptr && !ptr->foo) is bogus and in case ptr is NULL,
it leads to a NULL pointer dereference: ptr->foo.

Fix this by converting && to ||

This issue was detected with the help of Coccinelle, and audited and
fixed manually.

Fixes: 1a0d0d5ed5e3 ("powerpc/vas: Add platform specific user window operations")
Cc: stable@vger.kernel.org
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 arch/powerpc/platforms/book3s/vas-api.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platforms/book3s/vas-api.c
index 30172e52e16b..4d82c92ddd52 100644
--- a/arch/powerpc/platforms/book3s/vas-api.c
+++ b/arch/powerpc/platforms/book3s/vas-api.c
@@ -303,7 +303,7 @@ static int coproc_ioc_tx_win_open(struct file *fp, unsigned long arg)
 		return -EINVAL;
 	}
 
-	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->open_win) {
+	if (!cp_inst->coproc->vops || !cp_inst->coproc->vops->open_win) {
 		pr_err("VAS API is not registered\n");
 		return -EACCES;
 	}
@@ -373,7 +373,7 @@ static int coproc_mmap(struct file *fp, struct vm_area_struct *vma)
 		return -EINVAL;
 	}
 
-	if (!cp_inst->coproc->vops && !cp_inst->coproc->vops->paste_addr) {
+	if (!cp_inst->coproc->vops || !cp_inst->coproc->vops->paste_addr) {
 		pr_err("%s(): VAS API is not registered\n", __func__);
 		return -EACCES;
 	}
-- 
2.27.0

