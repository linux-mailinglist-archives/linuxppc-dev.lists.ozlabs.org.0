Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D47178CE0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 09:53:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48XSNG4P5mzDqSN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Mar 2020 19:53:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HLHhE6NC; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48XSJH1XxGzDqLj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Mar 2020 19:50:23 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id j20so319485pll.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2020 00:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=PbAG5DVp5Gwe/RZZ9j0NJf7u8QaXPmkMnI7g6z3JMC8=;
 b=HLHhE6NC/N2Num6RVigdOSImGbpk3nmwnQlk2QXjsRlmsQbb7rVGbhzCI79qMc4DOQ
 rglDWly5IB+23fcbexPX5ZL/YTlmfbbs0sQSBT3OtGGzbht8FSMM/0N/jKJBz9IR6Mft
 QZiGG/6CHHCAh8aYaS72EewgvnynAyu5BPYZDafkeOuc+QMZS0/LtA1iOQ6YeJwVlAHB
 +TiQ9oCTYHs/jq9NXolGDxQS6ceNp8BSNoKnxWJ/fmMznvgIF+RHwT80CAOmxw9UzcdG
 kdZXUjK3rCYnuVdHEIxSa3jEVbJoYDLQiBU3aS/swGU618NlhmvsGn1+N1/4xCKFStsW
 LVcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=PbAG5DVp5Gwe/RZZ9j0NJf7u8QaXPmkMnI7g6z3JMC8=;
 b=Q8IPrUvkLbgWulQJw1b20IRYjKSoS80AEAa7MNCbXd+InIJzqMmWw7+lXm+jjBVYkV
 BhhQW9KNcl62x1AmY9kvDpePazlI0gKFhPrftpsACi0lh+4IxQnKiKPKMjQIx29WirrJ
 H3nfnI8XDjTJ9U++nSVmUywvBEryN2YcQC/0RxAfwUr4DPbrbcfnb8Rzu4ZVWB+WOxDc
 zZqb8a96mPqA2n+PLQuCwBQZ/sxvK7oj9CoYv90hJxZ0Qxn3WrvBUr5dD4iNjPr8mVOs
 zQdIlgolqf7rBAMJliN9SyoHqtnngVeze1kuHxYd2eX79Wq8/TQgGRM3lP335z3ZwG2Y
 Cjtg==
X-Gm-Message-State: ANhLgQ3CMZuOa5FOGq8XrB6g7EDi85C+AlRdkkX84OUCk3zzlpxa8l9v
 +xXy8HYLQt8RZDUR2vLAbLtL+hY=
X-Google-Smtp-Source: ADFU+vv8xfB2TdqzoYxkWVhmod8311VaLoqVkmOG18qZwQFEIHdrRlKPnLs8enDR1iEXS04WBJve/A==
X-Received: by 2002:a17:902:14d:: with SMTP id
 71mr2053516plb.162.1583311820610; 
 Wed, 04 Mar 2020 00:50:20 -0800 (PST)
Received: from mylaptop.redhat.com ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id v123sm463085pfb.85.2020.03.04.00.50.15
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 Mar 2020 00:50:20 -0800 (PST)
From: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCHv3 1/2] powerpc/of: split out new_property() for reusing
Date: Wed,  4 Mar 2020 16:47:29 +0800
Message-Id: <1583311651-29310-2-git-send-email-kernelfans@gmail.com>
X-Mailer: git-send-email 2.7.5
In-Reply-To: <1583311651-29310-1-git-send-email-kernelfans@gmail.com>
References: <1582882895-3142-1-git-send-email-kernelfans@gmail.com>
 <1583311651-29310-1-git-send-email-kernelfans@gmail.com>
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
Cc: Andrew Donnellan <ajd@linux.ibm.com>, kexec@lists.infradead.org,
 Pingfan Liu <kernelfans@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Dan Williams <dan.j.williams@intel.com>,
 Frank Rowand <frowand.list@gmail.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Splitting out new_property() for coming reusing and moving it to
of_helpers.c.

Also do some coding style cleanup.

Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Cc: Oliver O'Halloran <oohall@gmail.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Andrew Donnellan <ajd@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@c-s.fr>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Frank Rowand <frowand.list@gmail.com>
Cc: kexec@lists.infradead.org
---
 arch/powerpc/platforms/pseries/of_helpers.c | 28 ++++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/of_helpers.h |  3 +++
 arch/powerpc/platforms/pseries/reconfig.c   | 26 --------------------------
 3 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/of_helpers.c b/arch/powerpc/platforms/pseries/of_helpers.c
index 66dfd82..1022e0f 100644
--- a/arch/powerpc/platforms/pseries/of_helpers.c
+++ b/arch/powerpc/platforms/pseries/of_helpers.c
@@ -7,6 +7,34 @@
 
 #include "of_helpers.h"
 
+struct property *new_property(const char *name, const int length,
+		const unsigned char *value, struct property *last)
+{
+	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
+
+	if (!new)
+		return NULL;
+
+	new->name = kstrdup(name, GFP_KERNEL);
+	if (!new->name)
+		goto cleanup;
+	new->value = kmalloc(length + 1, GFP_KERNEL);
+	if (!new->value)
+		goto cleanup;
+
+	memcpy(new->value, value, length);
+	*(((char *)new->value) + length) = 0;
+	new->length = length;
+	new->next = last;
+	return new;
+
+cleanup:
+	kfree(new->name);
+	kfree(new->value);
+	kfree(new);
+	return NULL;
+}
+
 /**
  * pseries_of_derive_parent - basically like dirname(1)
  * @path:  the full_name of a node to be added to the tree
diff --git a/arch/powerpc/platforms/pseries/of_helpers.h b/arch/powerpc/platforms/pseries/of_helpers.h
index decad65..34add82 100644
--- a/arch/powerpc/platforms/pseries/of_helpers.h
+++ b/arch/powerpc/platforms/pseries/of_helpers.h
@@ -4,6 +4,9 @@
 
 #include <linux/of.h>
 
+struct property *new_property(const char *name, const int length,
+		const unsigned char *value, struct property *last);
+
 struct device_node *pseries_of_derive_parent(const char *path);
 
 #endif /* _PSERIES_OF_HELPERS_H */
diff --git a/arch/powerpc/platforms/pseries/reconfig.c b/arch/powerpc/platforms/pseries/reconfig.c
index 7f7369f..8e5a2ba 100644
--- a/arch/powerpc/platforms/pseries/reconfig.c
+++ b/arch/powerpc/platforms/pseries/reconfig.c
@@ -165,32 +165,6 @@ static char * parse_next_property(char *buf, char *end, char **name, int *length
 	return tmp;
 }
 
-static struct property *new_property(const char *name, const int length,
-				     const unsigned char *value, struct property *last)
-{
-	struct property *new = kzalloc(sizeof(*new), GFP_KERNEL);
-
-	if (!new)
-		return NULL;
-
-	if (!(new->name = kstrdup(name, GFP_KERNEL)))
-		goto cleanup;
-	if (!(new->value = kmalloc(length + 1, GFP_KERNEL)))
-		goto cleanup;
-
-	memcpy(new->value, value, length);
-	*(((char *)new->value) + length) = 0;
-	new->length = length;
-	new->next = last;
-	return new;
-
-cleanup:
-	kfree(new->name);
-	kfree(new->value);
-	kfree(new);
-	return NULL;
-}
-
 static int do_add_node(char *buf, size_t bufsize)
 {
 	char *path, *end, *name;
-- 
2.7.5

