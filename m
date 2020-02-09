Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 91694156A80
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2020 14:08:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Fq8b262JzDqNL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 00:07:59 +1100 (AEDT)
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
 header.s=default header.b=LhQ9KwU6; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48FpvY3YW6zDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2020 23:56:41 +1100 (AEDT)
Received: from localhost (unknown [38.98.37.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7CAD920733;
 Sun,  9 Feb 2020 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581252999;
 bh=UzFJVOYPOVgXmoTrDrMUaZer8nC8kfZFkwknGpfqs1I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LhQ9KwU6fGCTULt/7XZhHCoUrOzlIM7eMTU729gLOaiSMegw4FwVUufLZSL4WbD76
 aY/eyGG2Xo8Y4X9FcDgunhxQo8HeC9vr3V0dEQ48wxPVuC1kfULpmRW0nmEB+8x5Lk
 w4sveno6NnMei9TbyD/26Opae/+G7KaXaeJJWIQI=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/6] powerpc: mm: ptdump: no need to check return value of
 debugfs_create functions
Date: Sun,  9 Feb 2020 11:58:59 +0100
Message-Id: <20200209105901.1620958-4-gregkh@linuxfoundation.org>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/mm/ptdump/bats.c          | 8 +++-----
 arch/powerpc/mm/ptdump/hashpagetable.c | 7 ++-----
 arch/powerpc/mm/ptdump/ptdump.c        | 8 +++-----
 arch/powerpc/mm/ptdump/segment_regs.c  | 8 +++-----
 4 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
index 4154feac1da3..d3a5d6b318d1 100644
--- a/arch/powerpc/mm/ptdump/bats.c
+++ b/arch/powerpc/mm/ptdump/bats.c
@@ -164,10 +164,8 @@ static const struct file_operations bats_fops = {
 
 static int __init bats_init(void)
 {
-	struct dentry *debugfs_file;
-
-	debugfs_file = debugfs_create_file("block_address_translation", 0400,
-					   powerpc_debugfs_root, NULL, &bats_fops);
-	return debugfs_file ? 0 : -ENOMEM;
+	debugfs_create_file("block_address_translation", 0400,
+			    powerpc_debugfs_root, NULL, &bats_fops);
+	return 0;
 }
 device_initcall(bats_init);
diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
index a07278027c6f..b6ed9578382f 100644
--- a/arch/powerpc/mm/ptdump/hashpagetable.c
+++ b/arch/powerpc/mm/ptdump/hashpagetable.c
@@ -527,13 +527,10 @@ static const struct file_operations ptdump_fops = {
 
 static int ptdump_init(void)
 {
-	struct dentry *debugfs_file;
-
 	if (!radix_enabled()) {
 		populate_markers();
-		debugfs_file = debugfs_create_file("kernel_hash_pagetable",
-				0400, NULL, NULL, &ptdump_fops);
-		return debugfs_file ? 0 : -ENOMEM;
+		debugfs_create_file("kernel_hash_pagetable", 0400, NULL, NULL,
+				    &ptdump_fops);
 	}
 	return 0;
 }
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 206156255247..d92bb8ea229c 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -417,12 +417,10 @@ void ptdump_check_wx(void)
 
 static int ptdump_init(void)
 {
-	struct dentry *debugfs_file;
-
 	populate_markers();
 	build_pgtable_complete_mask();
-	debugfs_file = debugfs_create_file("kernel_page_tables", 0400, NULL,
-			NULL, &ptdump_fops);
-	return debugfs_file ? 0 : -ENOMEM;
+	debugfs_create_file("kernel_page_tables", 0400, NULL, NULL,
+			    &ptdump_fops);
+	return 0;
 }
 device_initcall(ptdump_init);
diff --git a/arch/powerpc/mm/ptdump/segment_regs.c b/arch/powerpc/mm/ptdump/segment_regs.c
index 501843664bb9..dde2fe8de4b2 100644
--- a/arch/powerpc/mm/ptdump/segment_regs.c
+++ b/arch/powerpc/mm/ptdump/segment_regs.c
@@ -55,10 +55,8 @@ static const struct file_operations sr_fops = {
 
 static int __init sr_init(void)
 {
-	struct dentry *debugfs_file;
-
-	debugfs_file = debugfs_create_file("segment_registers", 0400,
-					   powerpc_debugfs_root, NULL, &sr_fops);
-	return debugfs_file ? 0 : -ENOMEM;
+	debugfs_create_file("segment_registers", 0400, powerpc_debugfs_root,
+			    NULL, &sr_fops);
+	return 0;
 }
 device_initcall(sr_init);
-- 
2.25.0

