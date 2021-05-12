Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1AEA37D43D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 22:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgRHm6Svmz3cCX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 06:30:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Rof9PNbs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82e;
 helo=mail-qt1-x82e.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Rof9PNbs; dkim-atps=neutral
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgRFS0FGlz2yxx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 06:28:27 +1000 (AEST)
Received: by mail-qt1-x82e.google.com with SMTP id c11so18136744qth.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 May 2021 13:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Dsy3PfYJ190WRITM13ezUcXmWtPBC6Plo+PBzZJW2rE=;
 b=Rof9PNbssi13Gw1S0Y09j4Sp0RBDCq8IJgnSr98HwGeBg0m65EDUJVgaVmEyS/+ZzZ
 zyQq3reW08EhD/dM2o4I99rj9aBw6Xk/AJ6+Slb6bqeKRhx3Yd3bPkLxLkIlz9HwERr6
 d1o3+gmJIQ8lsgxv9Tn1Dlu0SHQRpVMyw2CW4+lRl7QHIJZbUT/prIILunoaizJM2NQX
 WsNu/hB4m/w3fG3jf70DP/EcgWCQ/iKmTC3SB5ktOCuRBjwil+SC+HqWRiShzx8FZFFF
 SPgeoyGIAQyCJVETgK5l1RMGbD09UVnJY8H839GaOxczLdSTT3+3T1yGZ1h+f2nD66b5
 SGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Dsy3PfYJ190WRITM13ezUcXmWtPBC6Plo+PBzZJW2rE=;
 b=qvyPBXhP6T6GPcEqOJHsmJm0J6mwIvydoT6wviNam1EzosArwObFdapVxo/M+is7Nx
 y9ZdYSE1jGIwA7ntbALjlrGy9Luu25GXsG3uSGojALOtNrKj9H13HO5MV7KYcHr80DnV
 sEo0Cz7TJj6YQ/WydESOqCaYdISKkIlMvZEqxG84RLTzOCQ2SKtYcWfuIe5gdOO52vJ/
 x14tqZeYM8m/8EKovDywla9HQhhcPK2MkqVMckXKSfTZoMggxCNNQU73iLpFSELUcbrQ
 4H8PAbEejYMpUo2ittgWA95uyK7TXd5FIUinfhaFJgWBwusHla8C13O4DLbcCindaDlb
 GjWQ==
X-Gm-Message-State: AOAM533x4BXXtkFFWGhO0LsySYkKHLHZ/+lTYzZOEwStAL+2zr0gIM44
 QNqpI4AxRQKlwP7vmXFWhKnvLEuiYE5zrQ==
X-Google-Smtp-Source: ABdhPJwjkAztWLoP1FWpueqEJjMTiMAV3XkPm5stV3GkNcpNn77TW9J+ZrDstIXcRZIpM96qXijpNQ==
X-Received: by 2002:ac8:5cc4:: with SMTP id s4mr34130376qta.214.1620851305294; 
 Wed, 12 May 2021 13:28:25 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:fb9a:a1c9:c5a3:1e98:bc69])
 by smtp.gmail.com with ESMTPSA id j29sm778317qtv.6.2021.05.12.13.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 13:28:25 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 4/4] powerpc/pseries: minor enhancements in
 dlpar_memory_remove_by_ic()
Date: Wed, 12 May 2021 17:28:09 -0300
Message-Id: <20210512202809.95363-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210512202809.95363-1-danielhb413@gmail.com>
References: <20210512202809.95363-1-danielhb413@gmail.com>
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

We don't need the 'lmbs_available' variable to count the valid LMBs and
to check if we have less than 'lmbs_to_remove'. We must ensure that the
entire LMB range must be removed, so we can error out immediately if any
LMB in the range is marked as reserved.

Add a couple of comments explaining the reasoning behind the differences
we have in this function in contrast to what it is done in its sister
function, dlpar_memory_remove_by_count().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 .../platforms/pseries/hotplug-memory.c        | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 3c7ce5361ce3..ee88c1540fba 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -517,7 +517,6 @@ static int dlpar_memory_remove_by_index(u32 drc_index)
 static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 {
 	struct drmem_lmb *lmb, *start_lmb, *end_lmb;
-	int lmbs_available = 0;
 	int rc;
 
 	pr_info("Attempting to hot-remove %u LMB(s) at %x\n",
@@ -530,18 +529,29 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
 	if (rc)
 		return -EINVAL;
 
-	/* Validate that there are enough LMBs to satisfy the request */
+	/*
+	 * Validate that all LMBs in range are not reserved. Note that it
+	 * is ok if they are !ASSIGNED since our goal here is to remove the
+	 * LMB range, regardless of whether some LMBs were already removed
+	 * by any other reason.
+	 *
+	 * This is a contrast to what is done in remove_by_count() where we
+	 * check for both RESERVED and !ASSIGNED (via lmb_is_removable()),
+	 * because we want to remove a fixed amount of LMBs in that function.
+	 */
 	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
-		if (lmb->flags & DRCONF_MEM_RESERVED)
-			break;
-
-		lmbs_available++;
+		if (lmb->flags & DRCONF_MEM_RESERVED) {
+			pr_err("Memory at %llx (drc index %x) is reserved\n",
+				lmb->base_addr, lmb->drc_index);
+			return -EINVAL;
+		}
 	}
 
-	if (lmbs_available < lmbs_to_remove)
-		return -EINVAL;
-
 	for_each_drmem_lmb_in_range(lmb, start_lmb, end_lmb) {
+		/*
+		 * dlpar_remove_lmb() will error out if the LMB is already
+		 * !ASSIGNED, but this case is a no-op for us.
+		 */
 		if (!(lmb->flags & DRCONF_MEM_ASSIGNED))
 			continue;
 
-- 
2.31.1

