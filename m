Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E548BD13E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Sep 2019 20:12:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46d8RN5PkgzDqYY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2019 04:12:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="ihvCSFqI"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46d6bS3PLRzDqLl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2019 02:49:08 +1000 (AEST)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CD59B21D6C;
 Tue, 24 Sep 2019 16:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1569343745;
 bh=hYVt0RUpuwd8TcWj9uwviXzVdy6fGVwf5peNzZMmb6c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ihvCSFqIIj/GPL8hMTrhxTwJ3izH1FR8eT/1oYUQaryQvQvp4kKc66CuSVedRIjE1
 1lKfJOiXMIrSNrWp4JL0NNCE6fv3UGZw8zZpLCrTYZFj3oKVB9jPxxetd61H1QEaGx
 tYMlklKkU3qEop3hBwPuR7ckX0qtjh1THs8y+nT0=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 11/50] PCI: rpaphp: Avoid a
 sometimes-uninitialized warning
Date: Tue, 24 Sep 2019 12:48:08 -0400
Message-Id: <20190924164847.27780-11-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190924164847.27780-1-sashal@kernel.org>
References: <20190924164847.27780-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com,
 linux-pci@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Joel Savitz <jsavitz@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Chancellor <natechancellor@gmail.com>

[ Upstream commit 0df3e42167caaf9f8c7b64de3da40a459979afe8 ]

When building with -Wsometimes-uninitialized, clang warns:

drivers/pci/hotplug/rpaphp_core.c:243:14: warning: variable 'fndit' is
used uninitialized whenever 'for' loop exits because its condition is
false [-Wsometimes-uninitialized]
        for (j = 0; j < entries; j++) {
                    ^~~~~~~~~~~
drivers/pci/hotplug/rpaphp_core.c:256:6: note: uninitialized use occurs
here
        if (fndit)
            ^~~~~
drivers/pci/hotplug/rpaphp_core.c:243:14: note: remove the condition if
it is always true
        for (j = 0; j < entries; j++) {
                    ^~~~~~~~~~~
drivers/pci/hotplug/rpaphp_core.c:233:14: note: initialize the variable
'fndit' to silence this warning
        int j, fndit;
                    ^
                     = 0

fndit is only used to gate a sprintf call, which can be moved into the
loop to simplify the code and eliminate the local variable, which will
fix this warning.

Fixes: 2fcf3ae508c2 ("hotplug/drc-info: Add code to search ibm,drc-info property")
Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
Acked-by: Tyrel Datwyler <tyreld@linux.ibm.com>
Acked-by: Joel Savitz <jsavitz@redhat.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://github.com/ClangBuiltLinux/linux/issues/504
Link: https://lore.kernel.org/r/20190603221157.58502-1-natechancellor@gmail.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/pci/hotplug/rpaphp_core.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index 857c358b727b8..cc860c5f7d26f 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -230,7 +230,7 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
 	struct of_drc_info drc;
 	const __be32 *value;
 	char cell_drc_name[MAX_DRC_NAME_LEN];
-	int j, fndit;
+	int j;
 
 	info = of_find_property(dn->parent, "ibm,drc-info", NULL);
 	if (info == NULL)
@@ -245,17 +245,13 @@ static int rpaphp_check_drc_props_v2(struct device_node *dn, char *drc_name,
 
 		/* Should now know end of current entry */
 
-		if (my_index > drc.last_drc_index)
-			continue;
-
-		fndit = 1;
-		break;
+		/* Found it */
+		if (my_index <= drc.last_drc_index) {
+			sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix,
+				my_index);
+			break;
+		}
 	}
-	/* Found it */
-
-	if (fndit)
-		sprintf(cell_drc_name, "%s%d", drc.drc_name_prefix, 
-			my_index);
 
 	if (((drc_name == NULL) ||
 	     (drc_name && !strcmp(drc_name, cell_drc_name))) &&
-- 
2.20.1

