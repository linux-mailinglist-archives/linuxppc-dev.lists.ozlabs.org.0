Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B22EA2769FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 09:04:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmHR08jLzDqgf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 17:04:03 +1000 (AEST)
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
 header.s=20161025 header.b=JchFOeU0; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bxlkj4gRrzDqZG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:39:09 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id s19so1156199plp.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:39:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GX8TB1JQMQXMDXdTDV+dtMxz0fEHDVFigA2RzLzUcxQ=;
 b=JchFOeU09GsLc2VCiYZsmIIiOL8kZZjK/r36Vgfe4DF1g590PZS1adzu+pkAF2yy97
 uKNOoXGlrafnfQS0nKekdQYMYVQgd3VD70M+vcR2jGJOFC9j9tshfj77gR6qMkuBqBum
 0nLeNv9+yzmsUN/JoAK5jBaeI9S82gX1n4FHPH867MMPm64nCCiOqIj4+O/O4jupJqv+
 Zj935kHB+XXBk0+AzDfv3y0OHDWzsZUD6xPNbi1krwcxCdByERuiqvK9wOJmZ7P37p00
 fX1W21yd+E7chJpewAEbCOYITLs/p+/gRWdtvjDIODqoNvf+hJLGmD/6RijiWERpcjLY
 Tn2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GX8TB1JQMQXMDXdTDV+dtMxz0fEHDVFigA2RzLzUcxQ=;
 b=qTJcgP4957Zcy0xIXMA0MN2yk1uHoqN4DI5pTDZd71r9gqP6kXcrbsn9f0ip5b7f8u
 M2yuI9/kbDEYwrnLpR3NIwltM55xzmxyY/eGJltpPDdkAJH8IpONegTawPDmRYWglyrz
 9gThzisgH7c5q8/PVttVHjnkTTm8B4YRzeMH8Rq1MADe+YBLk+f9GJov2ASZumpdroS4
 erJbxCDrs293u3fDme0lgTDjR9+6r+T3WwJXCllxlZ53ZaOU3XmKD7egD8tRMzpFBsFw
 vDFBLY0doep1NrB4WebdWJsPCjLOPujyufM0iARDljy0fS7K0pS1cY1pzRhUGi428ZyY
 C82Q==
X-Gm-Message-State: AOAM530S0CVLJIIsz5G3AnGFGW4JnrGPbCU7nceV9FsvZYK4pato9sAU
 VnL/5OMVBKaVk1XisMyKNZNRkszWffx4FQ==
X-Google-Smtp-Source: ABdhPJzXjskAsznSwT96h46kOqWGL02Is22NYPiA3kEF+STkPS/mCUPBWltie7EnhCPA0Yvcg3LU2A==
X-Received: by 2002:a17:902:7c90:b029:d2:2503:f72e with SMTP id
 y16-20020a1709027c90b02900d22503f72emr3308726pll.55.1600929543276; 
 Wed, 23 Sep 2020 23:39:03 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:39:02 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 14/18] powerpc/embedded6xx/linkstation: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:15 +1000
Message-Id: <20200924063819.262830-14-oohall@gmail.com>
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

