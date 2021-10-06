Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1240942433A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:46:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgM86lbwz3ckn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:46:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.48; helo=mail-oo1-f48.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com
 [209.85.161.48])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJM06Mrz2ygF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:43:45 +1100 (AEDT)
Received: by mail-oo1-f48.google.com with SMTP id
 y16-20020a4ade10000000b002b5dd6f4c8dso1017093oot.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lH5lm9ZJrN75WHjiktQyDKNUxUp68MdS3scEafa+VH8=;
 b=dZ4qKNercAX5POS3IPnUWnxd6Ha9a7+lyxq0u0+tvEk8QokNNo9Kh9KRgTC6CZF4mQ
 Ykk4hzTXSyDITcdtWlYCH6vj/zUk93rC2392a9f/Ccx2qk84Vuojedbd6L2PVGsBItaf
 TP7651EURSxfeT2nT0/Bf04w4dBTQHyFCtzM+ldoqmsahu4Q/jMUNzzGB86Xdy60WWcG
 iOBgGFuBhU+Mgj/1Gd3/edfjSajURURMVJ/7pb7iGMmCWfjZuxf33y3Pxt1pxNlUscJa
 vHy5INbjADN4VUnquPb6aeKHbkfzS6XCztCx6LkOXdRJlUhKDHvDAWwaMT2aaPA0hO8n
 gEsw==
X-Gm-Message-State: AOAM532myJCzqM7RxEo1LukKxZnElrCg140ugcv8Ngmt2EtffGibH4nZ
 QWPoqmPfo8wh7jghLdMl8A==
X-Google-Smtp-Source: ABdhPJwDQxYuha7mztXncei2FBwje0uHQ2qAvAT0rAc8M1CEq47s46mQjlS2vX0JBLAJhljiutK9EA==
X-Received: by 2002:a4a:d108:: with SMTP id k8mr19009146oor.47.1633538619135; 
 Wed, 06 Oct 2021 09:43:39 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:38 -0700 (PDT)
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
Subject: [PATCH 02/12] ARM: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:22 -0500
Message-Id: <20211006164332.1981454-3-robh@kernel.org>
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

Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/kernel/devtree.c | 22 ++--------------------
 1 file changed, 2 insertions(+), 20 deletions(-)

diff --git a/arch/arm/kernel/devtree.c b/arch/arm/kernel/devtree.c
index 28311dd0fee6..02839d8b6202 100644
--- a/arch/arm/kernel/devtree.c
+++ b/arch/arm/kernel/devtree.c
@@ -84,33 +84,15 @@ void __init arm_dt_init_cpu_maps(void)
 		return;
 
 	for_each_of_cpu_node(cpu) {
-		const __be32 *cell;
-		int prop_bytes;
-		u32 hwid;
+		u32 hwid = of_get_cpu_hwid(cpu, 0);
 
 		pr_debug(" * %pOF...\n", cpu);
-		/*
-		 * A device tree containing CPU nodes with missing "reg"
-		 * properties is considered invalid to build the
-		 * cpu_logical_map.
-		 */
-		cell = of_get_property(cpu, "reg", &prop_bytes);
-		if (!cell || prop_bytes < sizeof(*cell)) {
-			pr_debug(" * %pOF missing reg property\n", cpu);
-			of_node_put(cpu);
-			return;
-		}
 
 		/*
 		 * Bits n:24 must be set to 0 in the DT since the reg property
 		 * defines the MPIDR[23:0].
 		 */
-		do {
-			hwid = be32_to_cpu(*cell++);
-			prop_bytes -= sizeof(*cell);
-		} while (!hwid && prop_bytes > 0);
-
-		if (prop_bytes || (hwid & ~MPIDR_HWID_BITMASK)) {
+		if (hwid & ~MPIDR_HWID_BITMASK) {
 			of_node_put(cpu);
 			return;
 		}
-- 
2.30.2

