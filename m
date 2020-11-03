Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C59152A3B71
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 05:37:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQH7n3NZZzDqRh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 15:37:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mOn5Qtwn; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH5q1fKyzDqRg
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:35:40 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id c20so13099933pfr.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:35:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AqH91wod4zhrH4JP+K+qkPgKJrzcevKNxf/fTHSp6M4=;
 b=mOn5Qtwn7PbKBhB16A5c3h6EI5yAQsE7iZyJXGSsBRTgHKE6WKcIc/ExNFbF4TnbfU
 GeHOyr43SWIYaxYDOTNrWUIuA0AgVBk2rWFlNmDxsN5ugpXxCm62vEX68bCty7xoAt/u
 g8Hdw7fl/PinNc8pJRmOFZ4ORrZug3cby5d1FsSyZ9SmyhnDUC08tKvyxX7pussFu54B
 GP67pFRwSAChK10woWkK2ndMr3UuuZ44SLDd0bRX3XQar1b3WoOi0bdYW7ukwFdATrPz
 nW/3MH4M/JBb2pGndpg73ivAhLpjSxxfjyqk7i0oHoxEmJafC3CDYIeI+2xPwy410IKE
 zioA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AqH91wod4zhrH4JP+K+qkPgKJrzcevKNxf/fTHSp6M4=;
 b=n3fPn2mtADa/f5KDUnv93xJC4HbvEwVEQGk4h5bMq9/NjlhMJMrCBZPEUn6sNSjAtO
 /HBzu3gnvyYgHYoBruZ2BtZurwzjse0cR5N+i7FBPSyfReaP0SedRSW3e1B5W/Qf8OMP
 YQDHAIcywUJIOrsJ22Y24iCXyIieP/w6QWaFeE3mhlrNoW7gaaqWGnTDattfHYGZq3b0
 2uko3B2ySvDq/P/QrAWXT+6mdPKqM43XzV7yumQpEaFibMBFnTt0mCUzDsRPvcPTXbCe
 QZzvQbPZKZP4YbY+tYLNbnVc7R4Snrhe2DVd+TJ9OcfB3xA2BV31IzENuwpNUycpIh0B
 TOfg==
X-Gm-Message-State: AOAM5305wivhYG9fWvjl7EaA6Jq1937t4seH0iYKRiUS7spPwDjzyhx1
 grbSnBe/2lgu4bgw0N8HnCT0yRQpA44=
X-Google-Smtp-Source: ABdhPJx4khg67NY2pkMd8E5bMkHFnYSQB3B9AMGhFlfdun0djEV+IUsho1BbPOXWwIOiufgWQj8d6A==
X-Received: by 2002:a17:90a:cb91:: with SMTP id
 a17mr1725729pju.220.1604378136343; 
 Mon, 02 Nov 2020 20:35:36 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:35:35 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 01/18] powerpc/pci: Add ppc_md.discover_phbs()
Date: Tue,  3 Nov 2020 15:35:06 +1100
Message-Id: <20201103043523.916109-1-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
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
Cc: Paul Mackerras <paulus@samba.org>, Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On many powerpc platforms the discovery and initalisation of
pci_controllers (PHBs) happens inside of setup_arch(). This is very early
in boot (pre-initcalls) and means that we're initialising the PHB long
before many basic kernel services (slab allocator, debugfs, a real ioremap)
are available.

On PowerNV this causes an additional problem since we map the PHB registers
with ioremap(). As of commit d538aadc2718 ("powerpc/ioremap: warn on early
use of ioremap()") a warning is printed because we're using the "incorrect"
API to setup and MMIO mapping in searly boot. The kernel does provide
early_ioremap(), but that is not intended to create long-lived MMIO
mappings and a seperate warning is printed by generic code if
early_ioremap() mappings are "leaked."

This is all fixable with dumb hacks like using early_ioremap() to setup
the initial mapping then replacing it with a real ioremap later on in
boot, but it does raise the question: Why the hell are we setting up the
PHB's this early in boot?

The old and wise claim it's due to "hysterical rasins." Aside from amused
grapes there doesn't appear to be any real reason to maintain the current
behaviour. Already most of the newer embedded platforms perform PHB
discovery in an arch_initcall and between the end of setup_arch() and the
start of initcalls none of the generic kernel code does anything PCI
related. On powerpc scanning PHBs occurs in a subsys_initcall so it should
be possible to move the PHB discovery to a core, postcore or arch initcall.

This patch adds the ppc_md.discover_phbs hook and a core_initcall stub that
calls it. The core_initcalls are the earliest to be called so this will
any possibly issues with dependency between initcalls. This isn't just an
academic issue either since on pseries and PowerNV EEH init occurs in an
arch_initcall and depends on the pci_controllers being available, similarly
the creation of pci_dns occurs at core_initcall_sync (i.e. between core and
postcore initcalls). These problems need to be addressed seperately.

Cc: Paul Mackerras <paulus@samba.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
 arch/powerpc/include/asm/machdep.h |  3 +++
 arch/powerpc/kernel/pci-common.c   | 10 ++++++++++
 2 files changed, 13 insertions(+)

diff --git a/arch/powerpc/include/asm/machdep.h b/arch/powerpc/include/asm/machdep.h
index 475687f24f4a..d319160d790c 100644
--- a/arch/powerpc/include/asm/machdep.h
+++ b/arch/powerpc/include/asm/machdep.h
@@ -59,6 +59,9 @@ struct machdep_calls {
 	int		(*pcibios_root_bridge_prepare)(struct pci_host_bridge
 				*bridge);
 
+	/* finds all the pci_controllers present at boot */
+	void 		(*discover_phbs)(void);
+
 	/* To setup PHBs when using automatic OF platform driver for PCI */
 	int		(*pci_setup_phb)(struct pci_controller *host);
 
diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index be108616a721..6265e7d1c697 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -1625,3 +1625,13 @@ static void fixup_hide_host_resource_fsl(struct pci_dev *dev)
 }
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_MOTOROLA, PCI_ANY_ID, fixup_hide_host_resource_fsl);
 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_FREESCALE, PCI_ANY_ID, fixup_hide_host_resource_fsl);
+
+
+int __init discover_phbs(void)
+{
+	if (ppc_md.discover_phbs)
+		ppc_md.discover_phbs();
+
+	return 0;
+}
+core_initcall(discover_phbs);
-- 
2.26.2

