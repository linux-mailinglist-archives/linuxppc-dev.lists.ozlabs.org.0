Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF19424339
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:45:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgLh2RB4z3cZK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:45:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.50; helo=mail-ot1-f50.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com
 [209.85.210.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJM07CCz2yhd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:43:45 +1100 (AEDT)
Received: by mail-ot1-f50.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so3843845otq.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nz2VNzL+ydy4chpa3d7bE/r1R6JeAbCb1Q1l6nn9BO4=;
 b=iF1JqYUr45OwqobUtRzLNMyNmX39J5ar1E/4wcQUcT7otfJggDjEP4jrrrqZ97EtQe
 kCDs8U3S+2TpAcxpubIfBpqNN0jEH+ZqD6vj5kohHtynG+pPj6/s9EVF0rIFsvbUcmo3
 X+PR/kiUar2EoPkEzciWZD8zDv6l0EfCdwev5BM++DCKWHwtUmy+VCOLZn34QmZPcZ6A
 1aDVtsQXTWhcnP6RiNL1diQ8UyouYmR+RpcwIJLwsPwsPXq3S57yrCid6I/mzTn77z7/
 Hhc0RRHYZ+NyOc6KVwJG5dhZzMTuvocZDZFULMxmuV4Jql0tUPSHqw5DtZaS7VuEN2Wx
 Peeg==
X-Gm-Message-State: AOAM5315JtgHlIwu7P6LlRYuOxshZHnus3Bvxe9yLdc23fwA8C3JjVHF
 L52CdlJ34wnPztSX7u8EhQ==
X-Google-Smtp-Source: ABdhPJzkVUe2NQ95hrntc6XfGtsZUf11mFfAeFqW0+ilFUDkOjdRegXB0ef4DYKZYBjYmsjM+kfXAg==
X-Received: by 2002:a9d:6ac7:: with SMTP id m7mr20566678otq.49.1633538622946; 
 Wed, 06 Oct 2021 09:43:42 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:42 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: Russell King <linux@armlinux.org.uk>, James Morse <james.morse@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 x86@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 04/12] arm64: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:24 -0500
Message-Id: <20211006164332.1981454-5-robh@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006164332.1981454-1-robh@kernel.org>
References: <20211006164332.1981454-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-sh@vger.kernel.org, Ray Jui <rjui@broadcom.com>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Borislav Petkov <bp@alien8.de>,
 bcm-kernel-feedback-list@broadcom.com, Thomas Gleixner <tglx@linutronix.de>,
 Frank Rowand <frowand.list@gmail.com>, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace the open coded parsing of CPU nodes' 'reg' property with
of_get_cpu_hwid().

This change drops an error message for missing 'reg' property, but that
should not be necessary as the DT tools will ensure 'reg' is present.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm64/kernel/smp.c | 31 ++-----------------------------
 1 file changed, 2 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 6f6ff072acbd..c5cebc406d24 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -466,33 +466,6 @@ void __init smp_prepare_boot_cpu(void)
 	kasan_init_hw_tags();
 }
 
-static u64 __init of_get_cpu_mpidr(struct device_node *dn)
-{
-	const __be32 *cell;
-	u64 hwid;
-
-	/*
-	 * A cpu node with missing "reg" property is
-	 * considered invalid to build a cpu_logical_map
-	 * entry.
-	 */
-	cell = of_get_property(dn, "reg", NULL);
-	if (!cell) {
-		pr_err("%pOF: missing reg property\n", dn);
-		return INVALID_HWID;
-	}
-
-	hwid = of_read_number(cell, of_n_addr_cells(dn));
-	/*
-	 * Non affinity bits must be set to 0 in the DT
-	 */
-	if (hwid & ~MPIDR_HWID_BITMASK) {
-		pr_err("%pOF: invalid reg property\n", dn);
-		return INVALID_HWID;
-	}
-	return hwid;
-}
-
 /*
  * Duplicate MPIDRs are a recipe for disaster. Scan all initialized
  * entries and check for duplicates. If any is found just ignore the
@@ -656,9 +629,9 @@ static void __init of_parse_and_init_cpus(void)
 	struct device_node *dn;
 
 	for_each_of_cpu_node(dn) {
-		u64 hwid = of_get_cpu_mpidr(dn);
+		u64 hwid = of_get_cpu_hwid(dn, 0);
 
-		if (hwid == INVALID_HWID)
+		if (hwid & ~MPIDR_HWID_BITMASK)
 			goto next;
 
 		if (is_mpidr_duplicate(cpu_count, hwid)) {
-- 
2.30.2

