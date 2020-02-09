Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D50F6156A6B
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2020 14:04:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Fq523mLNzDqQY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 00:04:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=198.145.29.99;
 helo=mail.kernel.org; envelope-from=gregkh@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=XJjlJPQR; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FpvM5M1szDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2020 23:56:31 +1100 (AEDT)
Received: from localhost (unknown [38.98.37.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A78BE20733;
 Sun,  9 Feb 2020 12:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581252989;
 bh=YD4NidAWtqA6u76URz+1LR9TLwrOmomcGvPe5nlw37Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XJjlJPQRwAzSeKC8LXioAXqAYmvVA03v0r//S68By2j4wk/2HfBNErshnE6m3q8Ea
 cc2jbAGQsz80hd6dE1qJz2vysIEiiI4oadPTK9XlaCtlXPlFX1FCLDsfMavYhulXwN
 gvVKvw2WgZERJ19tvIThhy1N2in+BY/Ak3OpZFr0=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/6] powerpc: mm: book3s64: hash_utils: no need to check
 return value of debugfs_create functions
Date: Sun,  9 Feb 2020 11:58:58 +0100
Message-Id: <20200209105901.1620958-3-gregkh@linuxfoundation.org>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200209105901.1620958-1-gregkh@linuxfoundation.org>
References: <20200209105901.1620958-1-gregkh@linuxfoundation.org>
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
Cc: linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 523d4d39d11e..7e5714a69a58 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -2018,11 +2018,8 @@ DEFINE_DEBUGFS_ATTRIBUTE(fops_hpt_order, hpt_order_get, hpt_order_set, "%llu\n")
 
 static int __init hash64_debugfs(void)
 {
-	if (!debugfs_create_file_unsafe("hpt_order", 0600, powerpc_debugfs_root,
-					NULL, &fops_hpt_order)) {
-		pr_err("lpar: unable to create hpt_order debugsfs file\n");
-	}
-
+	debugfs_create_file("hpt_order", 0600, powerpc_debugfs_root, NULL,
+			    &fops_hpt_order);
 	return 0;
 }
 machine_device_initcall(pseries, hash64_debugfs);
-- 
2.25.0

