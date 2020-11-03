Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9432A3B78
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:41:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHDR1XtWzDqRk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:41:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AFnpNcb9; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH5s0xP7zDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:44 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id 62so5407797pgg.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cMf1RE1FgJIEOpVzKnxoKyobML/s2DJ3qBS6LP8HEaA=;
 b=AFnpNcb9N8lHLyS4RZHJr8p6RPlB+D9p+h1MUuAUBvCB3/L0iVkOSOuHXGMsLy5TD3
 J08blaiKiYf3VnkJElNmIOccHlNHkqSk/LhWaaxcc1NmRgeYYw5N3v3UZw0mrYThha8e
 M+Yy6/MOGwvHqtPwoYj4jsODgCvhAMvN54CLwX8SFKCeyGapfhXh1wgRl6oyF4xyx5Fy
 ncmSbkqy0QuZ4dZ33Q1avDAxvap1eTt/DgniN6OxkfV7qXyBQmfeEvgaanUt6AStzWj2
 +OdsOIDFyxwN/SDmOjb10RH5b6iyP/hAo+v8lQOx2FAu1wFoqknZ/At5UAx8Tk7p5syK
 DUaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cMf1RE1FgJIEOpVzKnxoKyobML/s2DJ3qBS6LP8HEaA=;
 b=NHwhYPaAjAg7/oOm/4+AFxngzk+0lpN068lGTw1M291MKJa48bQAlsk7wYunafBJMW
 rWcy6h/R8qfgKWvuGmJ6NDK5gFqNx/SEQ3JmnjGsYie88NzvQOwyGZN6A1nDKrG7WiBk
 OBmuSbFQAhVdGMDFwijOqK7qnWRCEXC7LW3cBFeFP36sB9fRr4/PaWo92k7IxOnNO67C
 7iomKu/QWNkKBHjteyaOLFdkVLRY4iwxya7LMnncKkvBbGXG6IoaW29CSTERcwncN0YV
 DccccR4s2xfsltqxfEM/Wo4d/W8lKmM/yybtDCo/H72dJ0W83fjOYfxRtOqlK8BLBX8C
 Y1fA==
X-Gm-Message-State: AOAM533LzhjIO5tFUn43knKX8ZkWf5dguPpkxm3SZih+eAUrMXjAuzic
 3vKw5FFLlYv+XJ40/NNknlpYpTxtg8M=
X-Google-Smtp-Source: ABdhPJxcPybkCLeEKI1uDWb3+J8QAC8JBXSHWrPrsFPFsbA+SeppiMv/OsAIRE88H3a8Nbl4iih69w==
X-Received: by 2002:a17:90b:1106:: with SMTP id
 gi6mr1927245pjb.70.1604378140517; 
 Mon, 02 Nov 2020 20:35:40 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:39 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 03/18] powerpc/maple: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:08 +1100
Message-Id: <20201103043523.916109-3-oohall@gmail.com>
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
 arch/powerpc/platforms/maple/setup.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
index f7e66a2005b4..4e9ad5bf3efb 100644
--- a/arch/powerpc/platforms/maple/setup.c
+++ b/arch/powerpc/platforms/maple/setup.c
@@ -179,9 +179,6 @@ static void __init maple_setup_arch(void)
 #ifdef CONFIG_SMP
 	smp_ops = &maple_smp_ops;
 #endif
-	/* Lookup PCI hosts */
-       	maple_pci_init();
-
 	maple_use_rtas_reboot_and_halt_if_present();
 
 	printk(KERN_DEBUG "Using native/NAP idle loop\n");
@@ -351,6 +348,7 @@ define_machine(maple) {
 	.name			= "Maple",
 	.probe			= maple_probe,
 	.setup_arch		= maple_setup_arch,
+	.discover_phbs		= maple_pci_init,
 	.init_IRQ		= maple_init_IRQ,
 	.pci_irq_fixup		= maple_pci_irq_fixup,
 	.pci_get_legacy_ide_irq	= maple_pci_get_legacy_ide_irq,
-- 
2.26.2

