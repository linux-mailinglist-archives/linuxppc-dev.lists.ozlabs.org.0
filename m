Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5341097A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 02:50:08 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47MRg207dbzDqfv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2019 12:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47MRdK33KjzDqcl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 12:48:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=mailbox.org header.i=@mailbox.org header.b="tfZz/hUh"; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="WU8WB3In"; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 47MRdK0FPgz8tBg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2019 12:48:37 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 47MRdJ6f93z9sPV; Tue, 26 Nov 2019 12:48:36 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=mailbox.org (client-ip=2001:67c:2050::465:202;
 helo=mout-p-202.mailbox.org; envelope-from=erhard_f@mailbox.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=mailbox.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=mailbox.org header.i=@mailbox.org header.b="tfZz/hUh"; 
 dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org
 header.b="WU8WB3In"; dkim-atps=neutral
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org
 [IPv6:2001:67c:2050::465:202])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 47MRdG07TDz9sPT
 for <linuxppc-dev@ozlabs.org>; Tue, 26 Nov 2019 12:48:33 +1100 (AEDT)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
 [IPv6:2001:67c:2050:105:465:1:1:0])
 (using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
 (No client certificate requested)
 by mout-p-202.mailbox.org (Postfix) with ESMTPS id 47MRcx4JGHzQlC4;
 Tue, 26 Nov 2019 02:48:17 +0100 (CET)
Authentication-Results: gerste.heinlein-support.de (amavisd-new);
 dkim=pass (2048-bit key) reason="pass (just generated, assumed good)"
 header.d=mailbox.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
 s=mail20150812; t=1574732895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=3vGTyx4hrjcs+n5a2EyZnoDC1MYkgE9tWQx/rXiB5Jg=;
 b=tfZz/hUhECWi98Ur/t45TDfhcHtd8n7kweUxvyoG2Hxe3iuq497B9zDKgr9yZ8tVD612U6
 c3e9gO4VrJ9fo+NcjBEKMajYlRKbpLS0l6QCs9Wu15ZFkAMSQTf22UpziRbfhaBI72nyEx
 bVMOykVbdveeIRkiJIwYMGb3aWQHDFtXSg8TzyCGCjQXYCqE//+chroTwyufwWR+fhD1HO
 6+F+a7GdqRNWuwQKFVgKreWxYCYH11vZ+e+PyE+AJy4ounzlS+/jD1x+FhSOIyBOJMw5Gu
 FHFOfpLDdjS2EO++HqpfoyYSjWXkJ2KTqLrHEOSfH8Of84LfTQqawP2oCf+jYQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
 content-transfer-encoding:mime-version:message-id:date:date
 :subject:subject:from:from:received; s=mail20150812; t=
 1574732893; bh=PWOAFg4hdwumD5Wgmmm4vIukmBf1tHCRGCyJGHCyzX0=; b=W
 U8WB3InnQZTnesO09wYOBTq74yclueWZR2ykRstZ+ZFCI8FX5d/NIV+cdZMxA+sU
 BM67mm2e9fXfYMbTYPyYLp6KEqTI7SRnLzDZ0YNjG/8DCQVnpKwYTU+mecJk5OSk
 vxEiOzmORXnym1Wxj/OI8NehWUjv9eVHU3A+oYRnIJo3EACTWS+S4J4OY8U2HH/u
 hq3MaNTwXvVT4PYAypu6ZjzDATFK929epNUX1+AeA515Mj5rin9lokPcjdDpUvxD
 czLTNYcOGKi9uYLStwNKKaZvJFYe5xH8+esXXAXsDW+sj0/VxEYKH1EOzKpuLqsi
 wQfAZOHzSoqBWLqaR1GUg==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
 by gerste.heinlein-support.de (gerste.heinlein-support.de [91.198.250.173])
 (amavisd-new, port 10030)
 with ESMTP id EnMWbBeg9YEO; Tue, 26 Nov 2019 02:48:13 +0100 (CET)
From: Erhard Furtner <erhard_f@mailbox.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] of: unittest: fix memory leak in attach_node_and_children
Date: Tue, 26 Nov 2019 02:48:04 +0100
Message-Id: <20191126014804.28267-1-erhard_f@mailbox.org>
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
Cc: devicetree@vger.kernel.org, Erhard Furtner <erhard_f@mailbox.org>,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 Tyrel Datwyler <tyreld@linux.ibm.com>, frowand.list@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In attach_node_and_children memory is allocated for full_name via
kasprintf. If the condition of the 1st if is not met the function
returns early without freeing the memory. Add a kfree() to fix that.

This has been detected with kmemleak:
Link: https://bugzilla.kernel.org/show_bug.cgi?id=205327

It looks like the leak was introduced by this commit:
Fixes: 5babefb7f7ab ("of: unittest: allow base devicetree to have symbol metadata")

Signed-off-by: Erhard Furtner <erhard_f@mailbox.org>
Reviewed-by: Michael Ellerman <mpe@ellerman.id.au>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
Changes in v2:
  - Make the commit message more clearer.

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

