Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB327468
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 04:33:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 458YTv5xqVzDqRc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 May 2019 12:33:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::842; helo=mail-qt1-x842.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="fs3cKvK0"; 
 dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 458YSS1pMbzDqQN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 12:32:39 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id z19so2131368qtz.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2019 19:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1BRoEDPELMK0Gyp9/s2p/rcYNsdRckdJGf7yGafkuk=;
 b=fs3cKvK0NKboTT76WS2fOatBli8xun3JE9RHPbc8Y7ra9i2bA9b+aNHPVgi2NOuEh9
 Sd5ZMaa4Iqwn3Y0zFXXwS/t9vhQ7qx3cqzUWZd6BtEVHeKeT/2YC8ACuc89T9bhYBlBN
 tAwI7GH7qRt/ANpVMLvKLfRpD27QtExgoc+e0V3JY4w5S1QSuTnhvAFsxpzZ6+ZmVE4J
 BUBbKREis/mvL9qmSOyoE+eKFb9VFUnaT2QHpkA9LuxeAYAX2w8eNE5f+G+deolb8+tt
 Hlbd1wFXYtOudAn3gYWzSAfpsEbdY+YIY9zLQx04JTViMMr+MJjbn2lIZC+kUWlObBTD
 Yvkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=w1BRoEDPELMK0Gyp9/s2p/rcYNsdRckdJGf7yGafkuk=;
 b=OrMljvags0ANqYpQzikbrvHa4THmnjblywsP6BX4tYvF6Eoaq5hDYgaVAFbA9r6XmG
 LdoOWSI2U+G8zibBplRzs1yuF2+Le5RPZsAhuUPxb4qwb+1+6BcM2B59HzcwKUhys5qR
 hYZLiUXiWCYlHHEp+i987rc6oMC2sur6X+dPsplYkX5sQjpWL/7mW4/Lx4G9U6axTEyg
 +Q+VDhsqNAQAAfDp+kwwZxPyFtzVI1AywmU1yr8J/JV+LCi6HAMM0vG+pZI1su24TKjc
 fWdqDHHs3PrplLRGJCw/Ig/fgIKkoJNGqIRyjTGV5RqI1DnVGy82XOY/VPcOy1PL931G
 L1Kg==
X-Gm-Message-State: APjAAAXYhLBGI9pRt3xNimMHSE89tb2y9s4J1Ih1mMmSISLDoKQKdg7W
 JQYurR9LBmauYP8BuDb8P5TFiw==
X-Google-Smtp-Source: APXvYqwXTOyP/ZR1b0OccJMZC/QtNGYrA/lcBr6HbpCaQNFLZZ1gWevztbjKZgn+0FbHLGRp5kaoRQ==
X-Received: by 2002:a0c:9228:: with SMTP id a37mr15950616qva.221.1558578756618; 
 Wed, 22 May 2019 19:32:36 -0700 (PDT)
Received: from ovpn-121-0.rdu2.redhat.com
 (pool-71-184-117-43.bstnma.fios.verizon.net. [71.184.117.43])
 by smtp.gmail.com with ESMTPSA id q66sm12891044qke.66.2019.05.22.19.32.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
 Wed, 22 May 2019 19:32:35 -0700 (PDT)
From: Qian Cai <cai@lca.pw>
To: benh@kernel.crashing.org,
	paulus@samba.org,
	mpe@ellerman.id.au
Subject: [PATCH] powerpc/powernv: fix variable "c" set but not used
Date: Wed, 22 May 2019 22:31:41 -0400
Message-Id: <20190523023141.2973-1-cai@lca.pw>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
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
Cc: aik@ozlabs.ru, Qian Cai <cai@lca.pw>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The commit 58629c0dc349 ("powerpc/powernv/npu: Fault user page into the
hypervisor's pagetable") introduced a variable "c" to be used in
__get_user() and __get_user_nocheck() which need to stay as macros for
performance reasons, and "c" is not actually used in
pnv_npu2_handle_fault(),

arch/powerpc/platforms/powernv/npu-dma.c: In function 'pnv_npu2_handle_fault':
arch/powerpc/platforms/powernv/npu-dma.c:1122:7: warning: variable 'c'
set but not used [-Wunused-but-set-variable]

Fixed it by appending the __maybe_unused attribute, so compilers would
ignore it.

Signed-off-by: Qian Cai <cai@lca.pw>
---
 arch/powerpc/platforms/powernv/npu-dma.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/npu-dma.c b/arch/powerpc/platforms/powernv/npu-dma.c
index 495550432f3d..5bbe59573ee6 100644
--- a/arch/powerpc/platforms/powernv/npu-dma.c
+++ b/arch/powerpc/platforms/powernv/npu-dma.c
@@ -1119,7 +1119,8 @@ int pnv_npu2_handle_fault(struct npu_context *context, uintptr_t *ea,
 	int i, is_write;
 	struct page *page[1];
 	const char __user *u;
-	char c;
+	/* To silence a -Wunused-but-set-variable warning. */
+	char c __maybe_unused;
 
 	/* mmap_sem should be held so the struct_mm must be present */
 	struct mm_struct *mm = context->mm;
-- 
2.20.1 (Apple Git-117)

