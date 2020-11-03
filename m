Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 970492A3BA2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:04:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHlN4ln8zDqTR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e;
 helo=mail-pf1-x42e.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B4kPaKXv; dkim-atps=neutral
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQH6K457VzDqRf
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:36:09 +1100 (AEDT)
Received: by mail-pf1-x42e.google.com with SMTP id j18so13128017pfa.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:36:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VJRwJhgz7kC41nm/IuWt5UkVk7ZlL7bpbyZUIHtDKAw=;
 b=B4kPaKXvXNmf1qAd04mRneAlPHgQrp6JrG8FPHARg0PA2i54KyKe83RcB4fzeuNkny
 tkowMIHs33ZH9uuXnafDeXQQg+OlCGFd9rX7CWDflu+5xBUr9fMZIzNKhoRpSbXByrMX
 kwSn/xmx/RuVzLEy7UuXuxU7cNV9CWEP4LbiP1cvfmmX/5MeNnPdnr8oxQ4MvKhmi7F0
 DNn8hZUOkDWDGHYhAMdDU+h3CFKiemwNF0pEFO6u/FGvrBxtdLVClWlzF9IehY23OiwJ
 weY0ArOYHkOdJwZ0Le0e4H5XPS2diEw2ECJ/4CbVQMsmBPRYHpktr4FWX3MWWz3mgXdb
 6NdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VJRwJhgz7kC41nm/IuWt5UkVk7ZlL7bpbyZUIHtDKAw=;
 b=Hzet+E4NSOHeqQJvFhD8qN+ggh5GmHR19XJ6UtYwthnyuWzGxc6dL1AUd7T5c2vz1r
 DWr5Y7EpxBzKqTTLNyv1r7/VQTGim9DjoQ5ejqZlzMwxUohR0LVr7Ze+pItoTorYQBTk
 WqbW6DRSZSCWkPIzKZ7ZXm3Fh2mynSjgnWVjZWhbG4OR8KsCNWFmjtWjJjF1JT92f9MH
 8QfdC96wso4ZKZumkdH9f+7xWxTBHFBkfMrt5xGFQhkk+lCsXfYHXeKuCWMQihQ6CPSD
 C3hsGhwHDYE/vahaSQ8PeFDrkXh+M8n2J3GBJK51UUq6B4Z9KUld1mex/9o+ebmVTsuV
 izlg==
X-Gm-Message-State: AOAM532AVvKRZ+Vsqy0BkWFuXpPPUvIuGwiUg9zX241g3HKqtjkcKk6c
 KD6QCO9aXKyR9T6w68wREDUk57zad6E=
X-Google-Smtp-Source: ABdhPJyNeQf4QvgOtL4D5pQhYRuqNJ9TyuPqgLz1f7Y+D9JVVZhs5nM5RfIO05RlgXR3PA3jdHHPBQ==
X-Received: by 2002:a62:aa0f:0:b029:162:ecc2:4d44 with SMTP id
 e15-20020a62aa0f0000b0290162ecc24d44mr24724831pff.52.1604378166834; 
 Mon, 02 Nov 2020 20:36:06 -0800 (PST)
Received: from wafer.ozlabs.ibm.com.ozlabs.ibm.com
 (110-175-254-242.static.tpgi.com.au. [110.175.254.242])
 by smtp.gmail.com with ESMTPSA id o16sm2579116pgn.66.2020.11.02.20.36.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 20:36:06 -0800 (PST)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 16/18] powerpc/embedded6xx/mve5100: Move PHB discovery
Date: Tue,  3 Nov 2020 15:35:21 +1100
Message-Id: <20201103043523.916109-16-oohall@gmail.com>
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
compile tested with mvme5100_defconfig
---
 arch/powerpc/platforms/embedded6xx/mvme5100.c   | 13 ++++++++-----
 arch/powerpc/platforms/embedded6xx/storcenter.c |  8 ++++++--
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/platforms/embedded6xx/mvme5100.c b/arch/powerpc/platforms/embedded6xx/mvme5100.c
index 1cd488daa0bf..c06a0490d157 100644
--- a/arch/powerpc/platforms/embedded6xx/mvme5100.c
+++ b/arch/powerpc/platforms/embedded6xx/mvme5100.c
@@ -154,17 +154,19 @@ static const struct of_device_id mvme5100_of_bus_ids[] __initconst = {
  */
 static void __init mvme5100_setup_arch(void)
 {
-	struct device_node *np;
-
 	if (ppc_md.progress)
 		ppc_md.progress("mvme5100_setup_arch()", 0);
 
-	for_each_compatible_node(np, "pci", "hawk-pci")
-		mvme5100_add_bridge(np);
-
 	restart = ioremap(BOARD_MODRST_REG, 4);
 }
 
+static void __init mvme5100_setup_pci(void)
+{
+	struct device_node *np;
+
+	for_each_compatible_node(np, "pci", "hawk-pci")
+		mvme5100_add_bridge(np);
+}
 
 static void mvme5100_show_cpuinfo(struct seq_file *m)
 {
@@ -205,6 +207,7 @@ define_machine(mvme5100) {
 	.name			= "MVME5100",
 	.probe			= mvme5100_probe,
 	.setup_arch		= mvme5100_setup_arch,
+	.discover_phbs		= mvme5100_setup_pci,
 	.init_IRQ		= mvme5100_pic_init,
 	.show_cpuinfo		= mvme5100_show_cpuinfo,
 	.get_irq		= mpic_get_irq,
diff --git a/arch/powerpc/platforms/embedded6xx/storcenter.c b/arch/powerpc/platforms/embedded6xx/storcenter.c
index e346ddcef45e..e188b90f7016 100644
--- a/arch/powerpc/platforms/embedded6xx/storcenter.c
+++ b/arch/powerpc/platforms/embedded6xx/storcenter.c
@@ -65,14 +65,17 @@ static int __init storcenter_add_bridge(struct device_node *dev)
 }
 
 static void __init storcenter_setup_arch(void)
+{
+	printk(KERN_INFO "IOMEGA StorCenter\n");
+}
+
+static void __init storcenter_setup_pci(void)
 {
 	struct device_node *np;
 
 	/* Lookup PCI host bridges */
 	for_each_compatible_node(np, "pci", "mpc10x-pci")
 		storcenter_add_bridge(np);
-
-	printk(KERN_INFO "IOMEGA StorCenter\n");
 }
 
 /*
@@ -117,6 +120,7 @@ define_machine(storcenter){
 	.name 			= "IOMEGA StorCenter",
 	.probe 			= storcenter_probe,
 	.setup_arch 		= storcenter_setup_arch,
+	.discover_phbs 		= storcenter_setup_pci,
 	.init_IRQ 		= storcenter_init_IRQ,
 	.get_irq 		= mpic_get_irq,
 	.restart 		= storcenter_restart,
-- 
2.26.2

