Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D84A719EA67
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 12:32:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48w93S6zf0zDqXv
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 20:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pYDVOzYS; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48w91p1nhXzDqNt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 20:31:09 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id c21so6074706pfo.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 03:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=qinCPIMlZEhPNHm7wWCE1/v5NXvmFAaiCevaQ476mMU=;
 b=pYDVOzYSqSqQqWF1YQl0SGrQi7oysyqgKEqFg1L80NxFZL0EVvc5cwWXsXK1ZzGPHZ
 75j7uXZHwIb17izPRUR4eoRyK13qJz7Ez+YU6p3ovEO1zGlOAIj4KSaKpjupSGczJ6hJ
 J+RCILQRTNOYyjshk0yrBh8hhup+3xTEuPjxV/wnv5c/z35c3hrD0sHpfBfAUB5L8CoH
 /X07g7Q+vmCoZWxXM/UiKZ+TMFLdZNnjwg2OoBjpb8BkxvRao7+XhdO++wYJ+RqeFLNu
 7cmTLemLnhnCdxemUvSRerr7NrAN6pUy4ljN1TBjq/hYjh5hqilsig6bdjwdhJqJLr0t
 tSsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=qinCPIMlZEhPNHm7wWCE1/v5NXvmFAaiCevaQ476mMU=;
 b=iMZGTNT/y3qxl2kyAlDrmo1Cayo6CQ9ZhjAxTvp02hsxtfLHp2HdI0yckdJTcOUm4c
 06TKcAmXgOgRRdsCM4gQ2aBNGUzrVGU8DvdMfbYw5MTr7T+wVEyiyf8W9vnm8STSKZG5
 1YwQw0ti+pnPQ8X6diQJ7jDYt/v712SsbyeEfckKTBp2BGl6R1fa7gG3peqNjQGcs33H
 tE/t70hz6oJqwKrBLPIlWVueGbfbh4mp8MWDbZ9jPHt59x3PyTWmtOly2sBFXtS21jZa
 GQRTAhDdEhV851BMqZ5TgA+tYrr2YocvF8nq3fpDP6nXCaRWE0P1GAK9W13gcHcus2Zy
 /ftQ==
X-Gm-Message-State: AGi0PuZuNVqGd5bmf8kc+bpxeCteWYswlQE45rfdCedQrLkmP7ypV7zT
 PTP2wIxkpY/eqsEOfXl0LXo=
X-Google-Smtp-Source: APiQypLIbRwWdRFOaNEcVTmtQWuyzBmj0AA6Li8NoxPIsCXuoBUhm/ylTX47OvW1ZhIuYGJnZaSqAQ==
X-Received: by 2002:a63:ee4f:: with SMTP id n15mr654418pgk.149.1586082666760; 
 Sun, 05 Apr 2020 03:31:06 -0700 (PDT)
Received: from localhost (n112120135125.netvigator.com. [112.120.135.125])
 by smtp.gmail.com with ESMTPSA id b2sm9357482pjc.6.2020.04.05.03.31.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 03:31:06 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 tglx@linutronix.de
Subject: [PATCH v2] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
Date: Sun,  5 Apr 2020 18:30:59 +0800
Message-Id: <20200405103059.30769-1-hqjagain@gmail.com>
X-Mailer: git-send-email 2.17.1
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
 Qiujun Huang <hqjagain@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here needs a NULL check.

Issue found by coccinelle.

Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
---
 arch/powerpc/platforms/powernv/opal.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 2b3dfd0b6cdd..5b98c98817aa 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -808,9 +808,12 @@ static int opal_add_one_export(struct kobject *parent, const char *export_name,
 
 	rc = of_property_read_u64_array(np, prop_name, &vals[0], 2);
 	if (rc)
-		goto out;
+		return rc;
 
 	attr = kzalloc(sizeof(*attr), GFP_KERNEL);
+	if (!attr)
+		return -ENOMEM;
+
 	name = kstrdup(export_name, GFP_KERNEL);
 	if (!name) {
 		rc = -ENOMEM;
-- 
2.17.1

