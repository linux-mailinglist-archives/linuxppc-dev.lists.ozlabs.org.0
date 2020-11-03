Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DACC2A3B93
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:58:39 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHcD44THzDqZ9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:58:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=piXszWmn; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH6C0mh8zDqRk
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:36:03 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id w4so2466675pgg.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WePGWSemMFXgajsFMe7cKUHtaA9xMjkK6ByOLy1nU4Q=;
 b=piXszWmnDDcGPCO2nMg0XU6XAhLivk/q3ArALCTlem1E/ln77RJn8PwV9Mdh6/EqY3
 suXLJswTCY+onbS/6HnsiuWSUomatNLCteZhesutDCGcnp3ysVku6gybGCG5TAqC/kWz
 8vqjk4m4cWdjHcUTR0mYggUckKQfzR3Wj0JNIE7J0xoVggPknXGVjVoZXyWZYf399wPe
 zadriVO14wl/7UTZe3Uu68+ZtBxwpztbdx3BAVP84iL0jHaQr2KS1EXwCVV0oZBKTP9p
 DWkP8z6ri5BX6QL49Kstb2Lpt5/sIHepynXCFWi7KuVuiSwZty4EfebUnNktOhonPFpT
 X6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WePGWSemMFXgajsFMe7cKUHtaA9xMjkK6ByOLy1nU4Q=;
 b=YBEpMWuC/t3A+QOP/hPyBjEkSRafOWgL/zVvvMOsVG4OPU6oxdCQs4QxPRcJDwUGXa
 JIaTZVvZwypOFgVy9ugSfF/Mj71lbQclNO4eDkDgzwJh7jJukMZb6H/ox9kk3BfYCoGk
 U2BQw/JvsVcqQOUPjAKX5T93Fq5ce0fuWCx/2KSuBWBeCC1rFzskPqU83zxtkrAYMj1W
 msV0XWJ8dOXBbBR1AFzfSb1dSiHVU7f0hMNckQOkbz05xnTOV77TpmjKa7/UhpJd9SBj
 xwHQZwDZN1zvRu9U51hTUbZTg7xG937qbK+9h/ATw5rzecay5oB5eMn8JTJDj0fga+Rl
 4Vew==
X-Gm-Message-State: AOAM532x6C6UzFEeNAG6HU+fWuFj/CfKYJN5diIxaGgF0DOL8hw1VsSx
 m9TwEyaxQI7oN15FE9Ylgn4fq4cdNdg=
X-Google-Smtp-Source: ABdhPJzd7kXnqVZCfuTtN4xRpSGqNncztIVPw1tlbd5bkiqE2K6MQctQh7vESk2t0NFa2OAmy1FwaA==
X-Received: by 2002:a63:a74b:: with SMTP id w11mr15893629pgo.425.1604378160559; 
 Mon, 02 Nov 2020 20:36:00 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:36:00 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 13/18] powerpc/embedded6xx/holly: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:18 +1100
Message-Id: <20201103043523.916109-13-oohall@gmail.com>
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
compile tested with holly_defconfig
---
 arch/powerpc/platforms/embedded6xx/holly.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index d8f2e2c737bb..53065d564161 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -108,15 +108,13 @@ static void holly_remap_bridge(void)
 	tsi108_write_reg(TSI108_PCI_P2O_BAR2, 0x0);
 }
 
-static void __init holly_setup_arch(void)
+static void __init holly_init_pci(void)
 {
 	struct device_node *np;
 
 	if (ppc_md.progress)
 		ppc_md.progress("holly_setup_arch():set_bridge", 0);
 
-	tsi108_csr_vir_base = get_vir_csrbase();
-
 	/* setup PCI host bridge */
 	holly_remap_bridge();
 
@@ -127,6 +125,11 @@ static void __init holly_setup_arch(void)
 	ppc_md.pci_exclude_device = holly_exclude_device;
 	if (ppc_md.progress)
 		ppc_md.progress("tsi108: resources set", 0x100);
+}
+
+static void __init holly_setup_arch(void)
+{
+	tsi108_csr_vir_base = get_vir_csrbase();
 
 	printk(KERN_INFO "PPC750GX/CL Platform\n");
 }
@@ -259,6 +262,7 @@ define_machine(holly){
 	.name                   	= "PPC750 GX/CL TSI",
 	.probe                  	= holly_probe,
 	.setup_arch             	= holly_setup_arch,
+	.discover_phbs			= holly_init_pci,
 	.init_IRQ               	= holly_init_IRQ,
 	.show_cpuinfo           	= holly_show_cpuinfo,
 	.get_irq                	= mpic_get_irq,
-- 
2.26.2

