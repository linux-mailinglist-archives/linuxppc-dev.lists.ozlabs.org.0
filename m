Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E546419F62F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 14:55:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wr9R6FYjzDr43
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 22:55:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ug5cN9ID; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wr6y4PlrzDqQX
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 22:52:58 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id o26so7486644pgc.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 05:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=cHpVfF2u9C4oNMESIKL8KGjVklpXtV8TmmsyFDre/+I=;
 b=ug5cN9IDnfElN3u13WhUXXW8BuloW0AB9iJNPo4ymQymQVjipNKcrpcc2HsAe6aeSe
 0FrcA1SsnBub/9y7wMTz51oGViMOfUEAMWOmfxoRdb30arSAnaHHur4rAvTp0S4/2R9Q
 U43Fq7+HRywGlNsKbRJtsfxQtOZ8EBo5dbeX1yqHUnR2svEYke3RCk7Vevp5uEanN7iw
 5xsG+ON2vsHObuDmvIBjv3NS7hKPJL4jAlYiwf3pNwmXyhPVwu5IfAKLbEMsi8DHrv7Z
 7ycUAWRcQYEf226PKjx5bayCkNmWDZOeVCrBpiXEtqTtGAApTcpUQhsK+K0/Y0mQaly8
 u5lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=cHpVfF2u9C4oNMESIKL8KGjVklpXtV8TmmsyFDre/+I=;
 b=WFbeo6mwlITUyrUgLiCBR5CJ6eoa0qfDMorsK2NdBRJ6EAqpohdYV5ItBE/b+PEUkN
 AfonyyUmYTUDnmSSY7/cndG6htIX6IrOfnoq+OfSJSMQ9hw+NQhgQ7c/sw//K3YUY9nx
 Szb/rRGeXOP70QjuoissK2Tl85CnTmuzEUH30/jqV/E3nDI8Klu3iA5MnRo+FsU2pVEB
 9NlNyLUGdK72EawluF1Dv1sUd7f+mOjZn2f5ygGrO3m3Ui46SmmMLpU3RWGOPVG1peux
 uCZK7Wy4NHEbVT0dJd0OGMZcHoLddSGanSKYhNy5Q+Wde3t/HV82Hk1/3/YClDlK/JS5
 6F8g==
X-Gm-Message-State: AGi0PubvWITVjS50od5EyEAXYdebMw1iVFyK5kvlqRgD0xk4HDivmkpI
 zt1SojW4LHFgI59zih0ympdNABzV
X-Google-Smtp-Source: APiQypK4XlUOBbb1IowGUtnHmtknkxFlNbZmujatVvRj9b8DxMvxo7x8jihHA1AExMiKHbAsJ6HgKA==
X-Received: by 2002:a63:f252:: with SMTP id d18mr20843132pgk.228.1586177575607; 
 Mon, 06 Apr 2020 05:52:55 -0700 (PDT)
Received: from localhost (n112120135125.netvigator.com. [112.120.135.125])
 by smtp.gmail.com with ESMTPSA id s65sm4954709pgs.30.2020.04.06.05.52.54
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 05:52:55 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 oohall@gmail.com
Subject: [PATCH v5 1/2] powerpc/powernv: Remove redundant assignments to attr
 and name
Date: Mon,  6 Apr 2020 20:52:41 +0800
Message-Id: <20200406125242.4973-2-hqjagain@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200406125242.4973-1-hqjagain@gmail.com>
References: <20200406125242.4973-1-hqjagain@gmail.com>
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
Cc: linux-kernel@vger.kernel.org, Markus.Elfring@web.de, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, Qiujun Huang <hqjagain@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We don't need to go to the labal of out when of_property_read_u64_array
fails, as there is nothing to do. Just return.
And we can remove the redundant assignments to attr and name.

Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/platforms/powernv/opal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal.c b/arch/powerpc/platforms/powernv/opal.c
index 2b3dfd0b6cdd..71af1cbc6334 100644
--- a/arch/powerpc/platforms/powernv/opal.c
+++ b/arch/powerpc/platforms/powernv/opal.c
@@ -801,14 +801,14 @@ static ssize_t export_attr_read(struct file *fp, struct kobject *kobj,
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
 	name = kstrdup(export_name, GFP_KERNEL);
-- 
2.17.1

