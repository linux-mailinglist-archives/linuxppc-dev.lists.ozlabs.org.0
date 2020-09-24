Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4635F276A3D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 09:13:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmVd3z8pzDq7W
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 17:13:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mVB1TOA8; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxlkp5LRbzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:39:14 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id m15so1138084pls.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:39:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zAwF4NRxv1a4fAkh5ifbzgbxF54V3rFyD1n+9m4ZTik=;
 b=mVB1TOA84H7tKi/+1uoIFdXFWlr997NN/hqiYM/fZHhn+fc7RffdN0f4BYHbY2VlTg
 xqWKEI6ZAPVkj9qTo84VNpQ9BKIYxqBc0030Zle19oXW5KuoIWSIktjMUyyikT5wNLUa
 QDUWiyX1yulwnBvFfgkYAUm8cm4ViLsRuNGWznlYVREyNxlZoj6ZhYHwDzmMN6jyoMps
 6xmgB36fwkvNzG7bTiGZpaME8mXSdeAvxQI+OoyisF5T2c9r8TPSiUjcyUU8bi7vVBNH
 xwZfLd4FApHZirNOdz/rBvAtZmQChFzxvhA+fgw5VXRJqv3DuF3AbY38NH2TqyjaWQ1/
 198Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zAwF4NRxv1a4fAkh5ifbzgbxF54V3rFyD1n+9m4ZTik=;
 b=iRF0wDc7qm9cjfL9EdR14GuDVgDWfaT3ewWpIAUVDoc/I9MEjkVJgDn2bxcXMm6b1x
 wwA+KTf9sX7kv/72ERyUjAwdIR7zhs23sviA7K+3Y1PEWLnXrM4OPOPPhKWPX83+YY3P
 nxB3FEf6uARuVlWbo4BToDxw91XkdYrhLsN9wJMmVFLY4Pzg2Rz8C7kr/ifzudNd5y81
 vxrwkvB4Wvmuj0fQnT0k9fvGcaiXvnpBxdqJBjfkI3g05lAbq89sH0MSDR2A5jTQ2PUm
 yHukthA/sfoQzjEd/VZmORQVItSAtOB4Ql1faMLHM6HDg21SjASNBPyhEq7IS7dEO0ly
 Uasg==
X-Gm-Message-State: AOAM530vZjhEAz9Gk8oiGGR545AIfPQWYJB52VaPNp27ESBHyM0nwiId
 jgciuBJkOzGC5Bjj9OaW8N5SSbRDn1F4uA==
X-Google-Smtp-Source: ABdhPJy9IQaf7RBKA4otamEV2vMEmsWoS/MLe53v3M781cCgG1X7UrlvPeqiB8KvfxrNGKFYuZfDgA==
X-Received: by 2002:a17:902:a40b:b029:d2:1e66:9c with SMTP id
 p11-20020a170902a40bb02900d21e66009cmr3271308plq.52.1600929552026; 
 Wed, 23 Sep 2020 23:39:12 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.39.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:39:11 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 18/18] powerpc/powermac: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:19 +1000
Message-Id: <20200924063819.262830-18-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924063819.262830-1-oohall@gmail.com>
References: <20200924063819.262830-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
compile tested with pmac32_defconfig and g5_defconfig
---
 arch/powerpc/platforms/powermac/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index f002b0fa69b8..0f8669139a21 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -298,9 +298,6 @@ static void __init pmac_setup_arch(void)
 		of_node_put(ic);
 	}
 
-	/* Lookup PCI hosts */
-	pmac_pci_init();
-
 #ifdef CONFIG_PPC32
 	ohare_init();
 	l2cr_init();
@@ -600,6 +597,7 @@ define_machine(powermac) {
 	.name			= "PowerMac",
 	.probe			= pmac_probe,
 	.setup_arch		= pmac_setup_arch,
+	.discover_phbs		= pmac_pci_init,
 	.show_cpuinfo		= pmac_show_cpuinfo,
 	.init_IRQ		= pmac_pic_init,
 	.get_irq		= NULL,	/* changed later */
-- 
2.26.2

