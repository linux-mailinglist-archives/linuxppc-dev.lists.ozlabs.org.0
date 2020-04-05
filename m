Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 740FF19EB3D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 14:29:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wCdz3h4GzDqfP
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Apr 2020 22:29:11 +1000 (AEST)
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
 header.s=20161025 header.b=fJ1ZlYHp; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wCZN6ZxBzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Apr 2020 22:26:02 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id n10so6156155pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Apr 2020 05:26:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=mblZgCC2Cl9506DCpo/VF03PoaE1EG2NCS/yPRhOyVc=;
 b=fJ1ZlYHpiC1YETL+MpOGOhen2lYkAFpSNfdQwn56F/eqWl78ShJ75UG0vPwAkNPc7s
 mc9AJlqmcXOZBeizj1v96RTUf6bBBK7mNOGdrbqJZvLxW5SH6xknxnCA1FANunKiaz36
 bnzCsHHXBoiFUEt/ZyJTf6IOqhGfimvXGwnpCyyLvNVarMYxAbKAaeev+qlmPsCRrRRL
 2zo7VwFeulBDRK4v4iealA/UEJIjAWsrBcXWUhQcOyFQQdOaFNVaTe0l/7MC8sqdbO8E
 QDMtTY7/lXbszNk16igin42MJeruNb2M0xsvix8XEZZpbjpt3e6ENpGtc7g8y09f1KxM
 0Pqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mblZgCC2Cl9506DCpo/VF03PoaE1EG2NCS/yPRhOyVc=;
 b=AV+G3qZ81pGBEeZDj70VYalQaHkwBMmx26CWb87jj4g1BLFLZvtFCuBs7jLvGbdK85
 hAl3mjEN3/MD+6KX8WodNLyukQeWvhdAyZf0tzeLWIWguoNipNF7b0iTCa+0Xr2QdL4M
 8wI9k9KcMwNS5RJKjB1glOKlMVSCg7+M8ZvtzbGoDYYDEQoN22oaI5F/oTNg40Y5OoUB
 e881gk6NWZElQCDw2unCpSw2DTb5Jvl5e2TZ1sUQH3WXuaUCHcnVDwGxJN+Z16XFVnvI
 1FcOwK2n3l+DwobNiTzuRKagQMFQ9UZSw56wVH5O6G+/gWHe23IVqqT7bQe2fQhvH1Uc
 SFPg==
X-Gm-Message-State: AGi0PuZ18AR+/67R+AVY9VWii4AVCXZMjQOLppdogyBagdeAr8xd9Gft
 asiRVRNIb+U80i3VlC0ApEo=
X-Google-Smtp-Source: APiQypJQUqDjf/IeYoPYu4U+unuDH9yiglYxc4QpmhiuOWuRnx9jcIZm24TtJmxIW1p4es3hQcSQxA==
X-Received: by 2002:a63:7a49:: with SMTP id j9mr16094104pgn.183.1586089560133; 
 Sun, 05 Apr 2020 05:26:00 -0700 (PDT)
Received: from localhost (n112120135125.netvigator.com. [112.120.135.125])
 by smtp.gmail.com with ESMTPSA id n100sm9561716pjc.38.2020.04.05.05.25.59
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 05 Apr 2020 05:25:59 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 tglx@linutronix.de
Subject: [PATCH v3] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
Date: Sun,  5 Apr 2020 20:25:54 +0800
Message-Id: <20200405122554.357-1-hqjagain@gmail.com>
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
 arch/powerpc/platforms/powernv/opal.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 2b3dfd0b6cdd..908d749bcef5 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -801,16 +801,19 @@ static ssize_t export_attr_read(struct file *fp, struct kobject *kobj,
 static int opal_add_one_export(struct kobject *parent, const char *export_name,
 			       struct device_node *np, const char *prop_name)
 {
-	struct bin_attribute *attr = NULL;
-	const char *name = NULL;
+	struct bin_attribute *attr;
+	const char *name;
 	u64 vals[2];
 	int rc;
 
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

