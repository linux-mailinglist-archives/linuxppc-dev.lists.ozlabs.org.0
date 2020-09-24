Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D5D276A1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 09:11:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmRs65KPzDqMH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 17:11:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vM4oPkmI; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxlkm12NKzDqZk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:39:11 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id c3so1148172plz.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MSskaiTZtrQLAA4HeLAU5RtvuPrJ/Mg3BppavGPHrS8=;
 b=vM4oPkmIwRmpMqmf9JnDDFwhnTyqsk26aZbS00JQQrHsj22WM4KKKUiz4ffINzllkd
 FMXGRjS4YbJyZSYLSg/gbgGzkQgMc8cngCdNjpB7cmEAw93Chl9msqEBTevn5ETwTW6W
 KBs9ICzK4V0Seq7AtMkECTWlelaBbXVpahDlnaAddYpjXIrcoc3J00G+vL/Z1Vv3beRt
 cMpmqi0dPyUzksVEBEzPw+9SAVJseNiSzUPdpeX/UnfH43DSRGVDJpZbAFrRvNpcUDue
 t8/FCYfhUhfZFAVcKTJcYS85+l9p4MlNZqfqFoAs5hx8nJKewrEczPxFI5RwBrxU4875
 FmwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=MSskaiTZtrQLAA4HeLAU5RtvuPrJ/Mg3BppavGPHrS8=;
 b=BhEFDO9K9lH/9LnoXRY1LTrVn4pEhM0i+K1yQ0rNWym9Irnkpyx8tdVeS5Ur3m4cU5
 19LnvexHh6IFOM0PmWLNlVbr6n6bIdtNZs3VCPu1k8YGwH4gSRc+v+b6h9lXNwJjXLJp
 6Ao8J2I3iqmDyGbY4Dva3u/J8NhaTaTuUKRrY/2g+D18G35MlYUFnZ5uNsa2RK6XvLbS
 lyQ1LzaHc9oJEZAZIad3vWvlKBlB2Q5Lsxf4WXSQ+vpn8XwjeZ7NSyjL6YRvxGbUmi/W
 XwuCsYZHGzD2NPDmkwabD8/Ua+QFYI/P+ibzy0tnzrE3pi/BsZlYK7AjLwOrWen/UnG8
 eiig==
X-Gm-Message-State: AOAM531RJn7hnViwV+VJz5/M8T38rvTLrw8bAA6gZhFqe/kltP6z0fkb
 kW3pZBay/MQnnvh9va6IVQsorFUyN95loQ==
X-Google-Smtp-Source: ABdhPJx+X17gK0mGkRjoCCt2VIc4hViBwWTHW5zXKqe0jmzS/ZfzvtJY+xZt7ujCvOw8h2dV4L5WCw==
X-Received: by 2002:a17:902:b60a:b029:d1:f2ad:439c with SMTP id
 b10-20020a170902b60ab02900d1f2ad439cmr3210395pls.82.1600929549742; 
 Wed, 23 Sep 2020 23:39:09 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:39:09 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 17/18] powerpc/pasemi: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:18 +1000
Message-Id: <20200924063819.262830-17-oohall@gmail.com>
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
compile tested with pasemi_defconfig
---
 arch/powerpc/platforms/pasemi/setup.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pasemi/setup.c b/arch/powerpc/platforms/pasemi/setup.c
index b612474f8f8e..376797eb7894 100644
--- a/arch/powerpc/platforms/pasemi/setup.c
+++ b/arch/powerpc/platforms/pasemi/setup.c
@@ -144,8 +144,6 @@ static void __init pas_setup_arch(void)
 	/* Setup SMP callback */
 	smp_ops = &pas_smp_ops;
 #endif
-	/* Lookup PCI hosts */
-	pas_pci_init();
 
 	/* Remap SDC register for doing reset */
 	/* XXXOJN This should maybe come out of the device tree */
@@ -446,6 +444,7 @@ define_machine(pasemi) {
 	.name			= "PA Semi PWRficient",
 	.probe			= pas_probe,
 	.setup_arch		= pas_setup_arch,
+	.discover_phbs		= pas_pci_init,
 	.init_IRQ		= pas_init_IRQ,
 	.get_irq		= mpic_get_irq,
 	.restart		= pas_restart,
-- 
2.26.2

