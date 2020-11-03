Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7D12A3B97
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:00:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHf90S3BzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:00:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pnrqMXsI; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH6D6JzdzDqSc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:36:04 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id y14so13085907pfp.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GX8TB1JQMQXMDXdTDV+dtMxz0fEHDVFigA2RzLzUcxQ=;
 b=pnrqMXsIlEQ9xRoPi4ycIonxteiXDmHmH7DMyS02WD0V/Cy4GfXMiMT5T/4FfRgOLj
 EmpDL9779vWTtbh2KcwVKoqBgcPb9iXAmBI2YPddrPQZV0uM4kToVMZ/7j2ezTGUFquk
 vEnRrE+mtlp8crhS0dnki+jyviaf3Xwm5O+dMiccnmHGO5/EqqRZgpWQEzgcv5Q6N4h1
 ct23RDKBJV0gsqVzRZVW887ZHfdTatN5NAZZJM020I31dzJFl35VURBoeTDSEMse1mF4
 QfiVp9UkwCzS02Di4gNp916wgBO468FtdZaR6Xso6XgJfBIjItfa4veQP0QCidGWH9MF
 gLsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GX8TB1JQMQXMDXdTDV+dtMxz0fEHDVFigA2RzLzUcxQ=;
 b=d8z0uU5aFEjpP9lLiYVhj3i3ZZqcJg6o9QpkK7raKUHrqzuQKr2TxNb2Sp00rzCCRg
 5mfhrtYxzQn+tsaG4UIEBqemc5id8CBMFwe3jYhGWu7PyvI+qaRGCXqpXtZAig+3mOTO
 n677q8q+3KR6NshYWQOX0LKXUDTBLWm1S4hgZqUg1NxefOV4CRrX58uNOsRMdwAfFv/Z
 cNJftmIgZSKOZ5TuOo1Q2NGhBiTRDLTTOy9sJQ4Ljku4AQkesHF6heFC4m28eUKFVdjR
 Fn0ND7uMTu2KoCwyMHJWbLJImZ2uRR8pDETh4Ph3iJSyZBQuxLteq/Wcq2xlJYZVdsRm
 0dkA==
X-Gm-Message-State: AOAM531LZQimQ3DWwnjUzsMY8V3/hOIdM8altY6qAaDR7gcL9vjHsopY
 YR/TdQgBhUaJdjDicf57giEW7GjdXmk=
X-Google-Smtp-Source: ABdhPJyjQWeckvqPVxW4TZw6af9+HssMbGAM9bIWVkXJ8Dg2jmCIk4wXaHj+3k5lpbqijf6nfGkZcQ==
X-Received: by 2002:a62:84d2:0:b029:18a:f574:fded with SMTP id
 k201-20020a6284d20000b029018af574fdedmr7843412pfd.31.1604378162573; 
 Mon, 02 Nov 2020 20:36:02 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:36:02 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 14/18] powerpc/embedded6xx/linkstation: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:19 +1100
Message-Id: <20201103043523.916109-14-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201103043523.916109-1-oohall@gmail.com>
References: <20201103043523.916109-1-oohall@gmail.com>
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
compile tested with linkstation_defconfig
---
 arch/powerpc/platforms/embedded6xx/linkstation.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/linkstation.c b/arch/powerpc/platforms/embedded6xx/linkstation.c
index f514d5d28cd4..eb8342e7f84e 100644
--- a/arch/powerpc/platforms/embedded6xx/linkstation.c
+++ b/arch/powerpc/platforms/embedded6xx/linkstation.c
@@ -63,15 +63,18 @@ static int __init linkstation_add_bridge(struct device_node *dev)
 }
 
 static void __init linkstation_setup_arch(void)
+{
+	printk(KERN_INFO "BUFFALO Network Attached Storage Series\n");
+	printk(KERN_INFO "(C) 2002-2005 BUFFALO INC.\n");
+}
+
+static void __init linkstation_setup_pci(void)
 {
 	struct device_node *np;
 
 	/* Lookup PCI host bridges */
 	for_each_compatible_node(np, "pci", "mpc10x-pci")
 		linkstation_add_bridge(np);
-
-	printk(KERN_INFO "BUFFALO Network Attached Storage Series\n");
-	printk(KERN_INFO "(C) 2002-2005 BUFFALO INC.\n");
 }
 
 /*
@@ -153,6 +156,7 @@ define_machine(linkstation){
 	.name 			= "Buffalo Linkstation",
 	.probe 			= linkstation_probe,
 	.setup_arch 		= linkstation_setup_arch,
+	.discover_phbs		= linkstation_setup_pci,
 	.init_IRQ 		= linkstation_init_IRQ,
 	.show_cpuinfo 		= linkstation_show_cpuinfo,
 	.get_irq 		= mpic_get_irq,
-- 
2.26.2

