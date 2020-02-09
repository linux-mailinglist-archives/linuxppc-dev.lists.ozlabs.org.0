Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A39D156A8D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2020 14:10:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48FqCV112gzDqD8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 00:10:30 +1100 (AEDT)
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
 header.s=default header.b=mQ6J44Oa; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Fpvl0SPGzDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Feb 2020 23:56:50 +1100 (AEDT)
Received: from localhost (unknown [38.98.37.135])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8EAFC20733;
 Sun,  9 Feb 2020 12:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581253008;
 bh=GRNlCphWpXIvtZiNgAuJlAdnF1u0WDJDK9iyYMOqCT0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mQ6J44OaGNVpV9mF3MLMe0ePvDSGT/CMsNyBCqvcryzIYIuOeCqvidQWLcDBg7ezw
 N0Hc1LMUzAFCX2QUS4zuOzzB1R/5AEnVHARcL2q0n4yRngttPTcb7g5+xt9fEv6D5Y
 5f8eJpss/k4xgHtAaTTHpLafATKmhnohqDA+Bdfg=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 5/6] powerpc: cell: axon_msi: no need to check return value of
 debugfs_create functions
Date: Sun,  9 Feb 2020 11:59:00 +0100
Message-Id: <20200209105901.1620958-5-gregkh@linuxfoundation.org>
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When calling debugfs functions, there is no need to ever check the
return value.  The function can work or not, but the code logic should
never do something different based on this.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/powerpc/platforms/cell/axon_msi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/cell/axon_msi.c b/arch/powerpc/platforms/cell/axon_msi.c
index 57c4e0e86c88..ca2555b8a0c2 100644
--- a/arch/powerpc/platforms/cell/axon_msi.c
+++ b/arch/powerpc/platforms/cell/axon_msi.c
@@ -480,10 +480,6 @@ void axon_msi_debug_setup(struct device_node *dn, struct axon_msic *msic)
 
 	snprintf(name, sizeof(name), "msic_%d", of_node_to_nid(dn));
 
-	if (!debugfs_create_file(name, 0600, powerpc_debugfs_root,
-				 msic, &fops_msic)) {
-		pr_devel("axon_msi: debugfs_create_file failed!\n");
-		return;
-	}
+	debugfs_create_file(name, 0600, powerpc_debugfs_root, msic, &fops_msic);
 }
 #endif /* DEBUG */
-- 
2.25.0

