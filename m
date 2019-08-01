Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 168CE7D4D0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 07:18:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zdq71myCzDqsb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 15:18:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=jms.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MR4N1J9O"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zdnQ5g1CzDqdV
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 15:16:42 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id i18so33415669pgl.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 22:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L9F4SrJcA0C7y2i0rEAEHBRrb9Mcz1aRaYMG6U3G0vA=;
 b=MR4N1J9OJmdfRkhgTfymxK2dzo9W33vnXXw3ZI9fsN90GnAP3KgBTSxrXJkuROuTSU
 rftJqgUAwyHdugrk5SgcoO/ajFE3XTa4MsZR5ROWYl8oe6KPTH8tyGxAK+mfzMzt/GtF
 pKDDaczu20mKRLvMPVmeR4R4aER7O9uR5ap22CY1MoVoAycQRodurZCy2cL1GGuOsFwq
 0G/oUKbBCda5w5OBdPnujalciCbquraMKvUhwaA/26Iwf+2jG+5LfkqoafAjMWVGczb3
 PzkVFAeN2+UF3fnuOqeT8UW98oAMSZdA3mBeaqvN4C2CJHRhSxFG/ZwwM77wZoizWUcr
 0ThQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=L9F4SrJcA0C7y2i0rEAEHBRrb9Mcz1aRaYMG6U3G0vA=;
 b=DH1gZMCRWmZQqOX+UPKHnoErnskc1Hqz9BOQa5TnyspvvoIeOC1iNtLRTX7p9gADGd
 y0YYdgiAFCKRdgrMkvV96dUkDgQ2QRsjDfCbF8JavpIlL/GbhdLvlM8CklEvMrB/2Cpn
 KylP7U7SoCLOAwqFy5xy5+FwQfTXJpxYVOZ9UMEYHHZvLbXW5S7Eufgx6H3rtVciLZ/P
 7QsxbwBJCOT8c9NfFwrtWXP1aP9jxdu6/puLPXL3xPkNf7wu7rDi5cADMtLDEb92KzTV
 YUsMm9QkXsR4E7GGewkp8PK3chvkUt+b+798zxSaWH5xXKedYnndKnJRwKtKx0jd+b16
 ObIQ==
X-Gm-Message-State: APjAAAUwDbWFsXZypqnKRb0PfhZuHYSGzHMs+drjRY3gIzf5iyQ3PTL6
 gcijguwA4lRDlsFbe5vxL9SPbEGX
X-Google-Smtp-Source: APXvYqx0XLp/KOnnb/t1acn0y1d5NvWWOSscC2IrwITlCLORfrtfMjrudZiwlcZNt6Z//spySw1RVg==
X-Received: by 2002:a63:4823:: with SMTP id v35mr89778666pga.138.1564636598552; 
 Wed, 31 Jul 2019 22:16:38 -0700 (PDT)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id g18sm115288407pgm.9.2019.07.31.22.16.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 22:16:37 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/powernv: Print helpful message when cores guarded
Date: Thu,  1 Aug 2019 14:46:30 +0930
Message-Id: <20190801051630.5804-1-joel@jms.id.au>
X-Mailer: git-send-email 2.20.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Often the firmware will guard out cores after a crash. This often
undesirable, and is not immediately noticeable.

This adds an informative message when a CPU device tree nodes are marked
bad in the device tree.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Tested on qemu 4.1 with this patch applied:

 https://ozlabs.org/~joel/uta2019/0001-TESTING-mark-every-second-core-as-guarded.patch

This will show no cores guarded:

 qemu-system-ppc64 -M powernv8 -nographic -smp 1,cores=1,threads=1 -kernel zImage.epapr

This will show three:

 qemu-system-ppc64 -M powernv8 -nographic -smp 7,cores=7,threads=1 -kernel zImage.epapr

 arch/powerpc/platforms/powernv/setup.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index a5e52f9eed3c..7107583d0c6b 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -129,6 +129,28 @@ static void pnv_setup_rfi_flush(void)
 	setup_count_cache_flush();
 }
 
+static void __init pnv_check_guarded_cores(void)
+{
+	struct device_node *dn;
+	int bad_count = 0;
+
+	for_each_node_by_type(dn, "cpu") {
+		if (of_property_match_string(dn, "status", "bad") >= 0)
+			bad_count++;
+	};
+
+	if (bad_count) {
+		pr_cont("  __                           \n");
+		pr_cont(" /  \\        _______________    \n");
+		pr_cont(" |  |       /               \\  \n");
+		pr_cont(" @  @       |    WARNING!   |  \n");
+		pr_cont(" || ||      | It looks like |  \n");
+		pr_cont(" || ||   <--|  you have %*d |  \n", 3, bad_count);
+		pr_cont(" |\\_/|      | guarded cores |  \n");
+		pr_cont(" \\___/      \\_______________/  \n\n");
+	}
+}
+
 static void __init pnv_setup_arch(void)
 {
 	set_arch_panic_timeout(10, ARCH_PANIC_TIMEOUT);
@@ -149,6 +171,8 @@ static void __init pnv_setup_arch(void)
 	/* Enable NAP mode */
 	powersave_nap = 1;
 
+	pnv_check_guarded_cores();
+
 	/* XXX PMCS */
 }
 
-- 
2.20.1

