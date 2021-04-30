Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208336F9CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 14:10:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWrmH71Mfz30B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 22:10:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=mNqisGyU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f32;
 helo=mail-qv1-xf32.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mNqisGyU; dkim-atps=neutral
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com
 [IPv6:2607:f8b0:4864:20::f32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWrlM5qQKz2xMd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 22:09:35 +1000 (AEST)
Received: by mail-qv1-xf32.google.com with SMTP id a30so7487727qvb.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 05:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FCHEd8Oh4sCwiIDjkXQVGV2uAW8LNQRKR2dIMMW/YVA=;
 b=mNqisGyUH3dJi+bN/KUV3DwODntofLI7rFtbngQQ1nIR4Eu7uapEv3QmBLkBsoidAb
 Nh7+H87wEe12m8N3grJ7QdH854m1QMjOSHCK7MHFqUI40YQukrrFy2DecdGkDyo/qNDj
 L/v7vb/KCNxu8sgKOJn2IfvCgVMpRh04huj+Haed5SSLnj1Q6IfUnuCLKvLyfxcUCS33
 IYawWWHenCJw+7Um7cwNvPKOmor4jtlrE6wmPU4tJ/zXPTaBYto92aHkwC8Kek9OFxI1
 qaGGgAXsHeZECk1sFlAXT62pVjtAdP5NeIovoNwJcdW90633FXN9VVD96CcaF2hn5Lef
 Rx9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FCHEd8Oh4sCwiIDjkXQVGV2uAW8LNQRKR2dIMMW/YVA=;
 b=DHbHNuU+jqz2xaTJ5EAmKSaGVhw/pWJnl/dmHKC19VCQWv9CgZO42vZfbtH6P7sE2T
 6OmGr0wb/dA2H3HGBx41UD+5qsBy0pWzV9UWVb0hZqVJTgUVHLShf/W1K869B1r6jrQr
 1Du/JYROAXwR1rrMIByZAyjhxjqUs1Z7zZh7skuTd0qKLtTjUlIJnTZ9qvGzgEYjH9Eb
 Rj16m6gxXkdZgn7V2bxB+t36nfSiBWtgKqzIMp7TkWUvj7cOtuK+ctZ09DeSE1yyS2CU
 gPO9jK4rJjZvzod5WbHQaXu7DqvHNXcKAaQHWgvuS83m53+hGFUbZZyvds7No0+AzqsH
 JUmQ==
X-Gm-Message-State: AOAM533kMesU/dc6Rfa/hqDuOFd3uM7IViowbAEEfodnupTyg1AaoENf
 A51dV4cOwRYrAa5J9S5NcXoObkQTtiazSw==
X-Google-Smtp-Source: ABdhPJzycOGUzsZ66+ljhJQeLti3DPpXtuu2D00aaJN3x01NpFKDJVB7EEj/OumbB3XlCDEVyJ9H8g==
X-Received: by 2002:a0c:9e17:: with SMTP id p23mr5264983qve.7.1619784572456;
 Fri, 30 Apr 2021 05:09:32 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:6de0:3db1:1b8e:b097:6036])
 by smtp.gmail.com with ESMTPSA id p190sm928951qke.13.2021.04.30.05.09.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 05:09:32 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] hotplug-memory.c: enhance dlpar_memory_remove* LMB checks
Date: Fri, 30 Apr 2021 09:09:16 -0300
Message-Id: <20210430120917.217951-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210430120917.217951-1-danielhb413@gmail.com>
References: <20210430120917.217951-1-danielhb413@gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

dlpar_memory_remove_by_ic() validates the amount of LMBs to be removed
by checking !DRCONF_MEM_RESERVED, and in the following loop before
dlpar_remove_lmb() a check for DRCONF_MEM_ASSIGNED is made before
removing it. This means that a LMB that is both !DRCONF_MEM_RESERVED and
!DRCONF_MEM_ASSIGNED will be counted as valid, but then not being
removed.  The function will end up not removing all 'lmbs_to_remove'
LMBs while also not reporting any errors.

Comparing it to dlpar_memory_remove_by_count(), the validation is done
via lmb_is_removable(), which checks for DRCONF_MEM_ASSIGNED and fadump
constraints. No additional check is made afterwards, and
DRCONF_MEM_RESERVED is never checked before dlpar_remove_lmb(). The
function doesn't have the same 'check A for validation, then B for
removal' issue as remove_by_ic(), but it's not checking if the LMB is
reserved.

There is no reason for these functions to validate the same operation in
two different manners. This patch addresses that by changing
lmb_is_removable() to also check for DRCONF_MEM_RESERVED to tell if a
lmb is removable, making dlpar_memory_remove_by_count() take the
reservation state into account when counting the LMBs.
lmb_is_removable() is then used in the validation step of
dlpar_memory_remove_by_ic(), which is already checking for both states
but in different stages, to avoid counting a LMB that is not assigned as
eligible for removal. We can then skip the check before
dlpar_remove_lmb() since we're validating all LMBs beforehand.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-memory.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index bb98574a84a2..4e6d162c3f1a 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -348,7 +348,8 @@ static int pseries_remove_mem_node(struct device_node *np)
 
 static bool lmb_is_removable(struct drmem_lmb *lmb)
 {
-	if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
+	if ((lmb->flags & DRCONF_MEM_RESERVED) ||
+		!(lmb->flags & DRCONF_MEM_ASSIGNED))
 		return false;
 
 #ifdef CONFIG_FA_DUMP
@@ -523,7 +524,7 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 
 	/* Validate that there are enough LMBs to satisfy the request */
 	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-		if (lmb->flags & DRCONF_MEM_RESERVED)
+		if (!lmb_is_removable(lmb))
 			break;
 
 		lmbs_available++;
@@ -533,9 +534,6 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 		return -EINVAL;
 
 	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
-			continue;
-
 		rc = dlpar_remove_lmb(lmb);
 		if (rc)
 			break;
-- 
2.30.2

