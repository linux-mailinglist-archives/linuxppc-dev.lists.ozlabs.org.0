Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E984D4C9B1C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 03:20:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7dBj6z3mz3bqt
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:20:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=PI7qjJXO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=hbh25y@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=PI7qjJXO; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7dB50hzVz30Dv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 13:20:12 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id z15so586087pfe.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Mar 2022 18:20:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ut4FhFD89bZcY3y3faZEM5qMZpWcFX7wY9dfdN67y2k=;
 b=PI7qjJXOIkxen0fTtw2BH8lTxYwLVGDy3+/w//euncW4ziEjf5OwJv1idGU8cGDSeL
 tP2kKQpmtXKR6W+J4VsGvZxegrPIAERmISBIUIhN2CnJGXcn7FybAA86FNzaMNf/Y8K8
 jl9Fcu4KLOOT1/wOisQEXKtuHVtfEZrSGy0NwT0u+DypPW+twKw4YqZ7yq+AY/kZCjGj
 JW2QfvlkSlB2oU4Wf/lOZvzH2KznI6z0LHrff+lMTYGoIymuyvACNq2Af/1buJLvqttL
 nVB6hMVdB6i49tOyxO8PSZLO4cvKnuXV0ptScQFJCRuEbCPBl6Nz/m54T9EBNAzaFVhU
 8k6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ut4FhFD89bZcY3y3faZEM5qMZpWcFX7wY9dfdN67y2k=;
 b=7jc7R+uuiantj+uLabgxVMNKK3MR5kgCz8Eva9gfGpShbt5bxWNvSufFQW6IBJy8mO
 O4ifA2q0U+owaaTDsEu2ym/4vA5TvW47lL3LYwr9gg2fBTmjGbXK7B87DwF8Q6bGwr4y
 3gOjB757W1iT4TF69n5MLGOm9wegvdzQkKcOOhjOzK1u0Y5MtKiq3HzYIRYj/AtUURHN
 4FLPuhSitJYyERZFq6mbDxN07WMvKRjTV1vlACZtuIc1xYpHiFjpMbYQTP0CRlois7Se
 OGNlf+vNIyJce3b9l1tCzt2Gy5wXnwcGhUmlZdvWSge7I37Pd/BXFgwv6IwTmagMz/Xt
 KUMw==
X-Gm-Message-State: AOAM531g87Rj9cM0TjyzYvQov2ZDQe5wJuZlLyIxhEw2yTtf0wl9fKGS
 BRl8PbcsRCsT/Tx+IjfHZaU=
X-Google-Smtp-Source: ABdhPJxFYXTMuT381NlVCmxAj19K234v4+6N1ZkK8rDABRKo76PGDqBEAqHfgaO40eSWXuBYOofIQA==
X-Received: by 2002:a05:6a00:cc7:b0:4ec:c6f3:ad29 with SMTP id
 b7-20020a056a000cc700b004ecc6f3ad29mr30774100pfv.66.1646187610156; 
 Tue, 01 Mar 2022 18:20:10 -0800 (PST)
Received: from slim.das-security.cn ([103.84.139.53])
 by smtp.gmail.com with ESMTPSA id
 h5-20020a056a001a4500b004e177b8cbfdsm18589444pfv.197.2022.03.01.18.20.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Mar 2022 18:20:09 -0800 (PST)
From: Hangyu Hua <hbh25y@gmail.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 tyreld@linux.ibm.com
Subject: [PATCH v2] powerpc: kernel: fix refcount leak in format_show()
Date: Wed,  2 Mar 2022 10:19:59 +0800
Message-Id: <20220302021959.10959-1-hbh25y@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Hangyu Hua <hbh25y@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Refcount leak will happen when format_show returns failure in multiple
cases. Unified management of of_node_put can fix this problem.

Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
---

v2: 
1. change the title and description information. 
2. fix all possible refcount leak.

 arch/powerpc/kernel/secvar-sysfs.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kernel/secvar-sysfs.c b/arch/powerpc/kernel/secvar-sysfs.c
index a0a78aba2083..1ee4640a2641 100644
--- a/arch/powerpc/kernel/secvar-sysfs.c
+++ b/arch/powerpc/kernel/secvar-sysfs.c
@@ -26,15 +26,18 @@ static ssize_t format_show(struct kobject *kobj, struct kobj_attribute *attr,
 	const char *format;
 
 	node = of_find_compatible_node(NULL, NULL, "ibm,secvar-backend");
-	if (!of_device_is_available(node))
-		return -ENODEV;
+	if (!of_device_is_available(node)) {
+		rc = -ENODEV;
+		goto out;
+	}
 
 	rc = of_property_read_string(node, "format", &format);
 	if (rc)
-		return rc;
+		goto out;
 
 	rc = sprintf(buf, "%s\n", format);
 
+out:
 	of_node_put(node);
 
 	return rc;
-- 
2.25.1

