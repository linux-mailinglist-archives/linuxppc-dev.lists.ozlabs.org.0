Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD80FCFC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 21:39:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47DYHZ6QrczF7VR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2019 07:39:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47DVvp6q7QzF46H
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 05:52:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=mailbox.org header.i=@mailbox.org header.b="q3w3abch"; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="XiGWZajJ"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47DVvp4lKNz8snw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2019 05:52:06 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47DVvp4KVvz9sPc; Fri, 15 Nov 2019 05:52:06 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050::465:101;
 helo=mout-p-101.mailbox.org; envelope-from=erhard_f@mailbox.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mailbox.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=mailbox.org header.i=@mailbox.org header.b="q3w3abch"; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="XiGWZajJ"; dkim-atps=neutral
X-Greylist: delayed 478 seconds by postgrey-1.36 at bilbo;
 Fri, 15 Nov 2019 05:52:03 AEDT
Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org
 [IPv6:2001:67c:2050::465:101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47DVvl392xz9s4Y
 for <linuxppc-dev@ozlabs.org>; Fri, 15 Nov 2019 05:52:03 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [80.241.60.240])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-101.mailbox.org (Postfix) with ESMTPS id 47DVkF6j04zKmZ4
 for <linuxppc-dev@ozlabs.org>; Thu, 14 Nov 2019 19:43:49 +0100 (CET)
Authentication-Results: gerste.heinlein-support.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1573757029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZdwRfxHvd+KGHk16yUQzMnNRB4DglhbwLOvbFHcCUwE=;
 b=q3w3abchgAVV7ljXFw/KHoDlAqkW+6/EGh9t6gBeqt6M+GO80dgogzWUnFKhM0TKLBaNfU
 qpiKvXhECNtOPV4WW9nWDKIhiN3En7gT0sGSwwxtNe50kcBaTjnPDLFhSSzDbsS1fRgLJR
 7JUPR835GeSfNbWkXiMG1zv5TYplWLFMGv7lblxgh0kdSFpcyXVk6b+Lim8V0dVPxS1ZR8
 2HdrCaFcssaRHpmgjMFlhjFUxwRfHKkGfzJ8BNryNULXwlmAsnU7Y0z+W9pROm9y4gkmDy
 XgRDwhORAXhzNxT/sgVIvPFelunaEbypUEiWcnFuud4mzhtMdwRVWu2Cat+9+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received; s=mail20150812; t=
 1573757027; bh=f7JzG8OUhZH5FfgMRBI6Gk/w31yAbWHdQLvarN+HY1I=; b=X
 iGWZajJU8tPHIWopppKCCuYMklWewawIGF5O9R+mTkfhfjE2+lUBTc/w1U7c4r/x
 sAeoMnzEoFfzY8NRRktF+xi2VcJtIWOqwSyLGMCyHB+jJKnJ0ljHbMwtP0++SwYl
 ee4exwLobtgXf7sid/186dkKNHoMZR8CsEvl7NSGvANssTFzPddIZnHaHmAnAybN
 vQ7rAuk+O/1cIl0VJgk8qUkEQehPXf2KPU24EQR2tEKfKaLbmnQEiexTCRIuW/Gy
 RouKBP9WK9wZKPRh/B4Wnh6Z+JwZaCC9l5gveTfRT8Z0jq4525J7o5+mz/GN+sS0
 EGaV+mJ1rDAvgn/QTMPdA==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id 1Z5iXrg56_0y; Thu, 14 Nov 2019 19:43:47 +0100 (CET)
From: Erhard Furtner <erhard_f@mailbox.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH] of: unittest: fix memory leak in attach_node_and_children
Date: Thu, 14 Nov 2019 19:43:34 +0100
Message-Id: <20191114184334.2866770-1-erhard_f@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 15 Nov 2019 07:37:47 +1100
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
Cc: Erhard Furtner <erhard_f@mailbox.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In attach_node_and_children memory is allocated for full_name via
kasprintf. If the condition of the 1st if is not met the function
returns early without freeing the memory. Add a kfree() to fix that.

Signed-off-by: Erhard Furtner <erhard_f@mailbox.org>
---
 drivers/of/unittest.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/of/unittest.c b/drivers/of/unittest.c
index 92e895d86458..ca7823eef2b4 100644
--- a/drivers/of/unittest.c
+++ b/drivers/of/unittest.c
@@ -1146,8 +1146,10 @@ static void attach_node_and_children(struct device_node *np)
 	full_name = kasprintf(GFP_KERNEL, "%pOF", np);
 
 	if (!strcmp(full_name, "/__local_fixups__") ||
-	    !strcmp(full_name, "/__fixups__"))
+	    !strcmp(full_name, "/__fixups__")) {
+		kfree(full_name);
 		return;
+	}
 
 	dup = of_find_node_by_path(full_name);
 	kfree(full_name);
-- 
2.23.0

