Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDB2685E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 11:02:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nHbg642MzDqRw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 19:02:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="JtzeVjUl"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nHSs6ygVzDqQT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 18:56:29 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id b3so7958476plr.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 01:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nLAi09/WQzIs/j8bJLFsma1ombGiigM6qxBcnWHiUEs=;
 b=JtzeVjUlQbRW8Q7PknryB7pEHdIkY1Bz/6jv6aMtX9KfBK3SV/9khE595AiDnqAObZ
 pxECD0GU6C/sC8khHtsVvrNV2jcYU1AbQu4w5NRU7UMM0fjl2MrA784CsyDxW+XZr0tg
 ogs7MAS1J5bfZ5bmbB2Dh49jJTUK96I9yrgx5gHBuIjrXzhvLRnHJuhHeULxBFppYtQJ
 p3qIN3zKz2yBi0KW+MSwusmPpUi62ai3xtARiskArT5GjqG6BFcLky1vkjFI/ny+KiEa
 hQEluL80ThcWFN8HZnndo3UVOpCu2Z4ygEkMBCcFRC3jXjA8VwAxxh+8YGBY1cdt/l6Z
 cSfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nLAi09/WQzIs/j8bJLFsma1ombGiigM6qxBcnWHiUEs=;
 b=CDlbYdadZNWk8oxyW/jUUitrs2g+m6HOijYqJdV+rIuINTKi6gmjWVfCo1x6vlMz8I
 3vlNxCL+5Dq+eaB67L/R5nkUo9k/ryqfahcyqyWSPg+uErMqwI2FiCMxQXi3RKPk9Imj
 5VrcKVkCx47qSNX+qfOQ6NsgGkAfXaeOaalvCCMSZrdsXHceL7TRNYSXehmrQWgMBWxp
 o5cj0MlBTTlF/JAnC23CWXWXaIvZgOcIF1jg/d6I2WhBxKhh53cxn8dFZxwIAwQqp8kQ
 7nECnyuAR6jaBSZ27bHocSOohS1ixkQYoOWiP6wQNG9sml2Y4n07gQpWsUMS1ZX8Ta4Y
 Hv6Q==
X-Gm-Message-State: APjAAAXsald59gA9F148jlZ4Nn2HNDAkjHHUS2YVVvpSWAM7Y5d53+ip
 JmIxMJ+tI2vPoDUx6tp1OkpeYxcX1DM=
X-Google-Smtp-Source: APXvYqz/g+jKFEhfSc+DXR4ag1cKhI3NH6OKNaiSChiK3wXoLIgobAqRQJAPOKWFwPZWMUXweg7q8Q==
X-Received: by 2002:a17:902:b612:: with SMTP id b18mr953796pls.8.1563180987318; 
 Mon, 15 Jul 2019 01:56:27 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id d14sm22514815pfo.154.2019.07.15.01.56.25
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 15 Jul 2019 01:56:26 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/5] powerpc/eeh_sysfs: Fix incorrect comment
Date: Mon, 15 Jul 2019 18:56:09 +1000
Message-Id: <20190715085612.8802-3-oohall@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715085612.8802-1-oohall@gmail.com>
References: <20190715085612.8802-1-oohall@gmail.com>
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
Cc: sbobroff@linux.ibm.com, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The EEH_ATTR_SHOW() helper is used to display fields from struct eeh_dev
not struct pci_dn.

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/kernel/eeh_sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/eeh_sysfs.c b/arch/powerpc/kernel/eeh_sysfs.c
index 3fa04dd..6a2c2886f 100644
--- a/arch/powerpc/kernel/eeh_sysfs.c
+++ b/arch/powerpc/kernel/eeh_sysfs.c
@@ -30,7 +30,7 @@
 /**
  * EEH_SHOW_ATTR -- Create sysfs entry for eeh statistic
  * @_name: name of file in sysfs directory
- * @_memb: name of member in struct pci_dn to access
+ * @_memb: name of member in struct eeh_dev to access
  * @_format: printf format for display
  *
  * All of the attributes look very similar, so just
-- 
2.9.5

