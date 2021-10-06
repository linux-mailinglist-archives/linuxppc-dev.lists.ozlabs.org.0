Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74886424350
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:48:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgPp2vzVz3dv1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:48:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.170;
 helo=mail-oi1-f170.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
 [209.85.167.170])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJY2GgSz2ypf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:43:57 +1100 (AEDT)
Received: by mail-oi1-f170.google.com with SMTP id t4so3023448oie.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J13zoIHrX4tLH3WneJUTeWV7jFKNgk6/LfnJOFSAv7E=;
 b=fTAf0c5ybMhqst7tFvK7IQqLV101x9Fhy7szvZYlSt6Yu3e6hNXM24ZCY0/59d7hRF
 IcKU/e9XTb0iwmsKOiIlqEmbij9e5Tj4uI36UAi9QdgQwf0+eIwu280Jdv8Z1kwJYbdB
 BDddGphJtFlmmUb+SlIwOoJj458EmXucyPOB46+Rk18KBzQderu8hBJFwiXH5C3Yu0eq
 zCVWIw3cYR9JNOQFpRTnIj5+7aZo6wMZkGXzNLn7HUCrr8ZCN3P/F0ajWS0Ge49AYkHD
 5159vLK85Qom+nmqO3aSNpd76Y3aNxsC2Zh/ecd3gm4jC660uiITCTQJfG5YccucezMA
 2gmw==
X-Gm-Message-State: AOAM531d/WNUG+Dhjy3jHB15DY2eh0ta6/b/6Au8ydYI2G3iGyybV9pn
 uWG+11+lhX6mY0mttd2bxg==
X-Google-Smtp-Source: ABdhPJzsmLqvAc8ULa8uzHfFQAR3YkQa63E6ZsBRL9k77fBu+BE8j4mODwWxFxPISSskaMe8DkKEfw==
X-Received: by 2002:aca:c288:: with SMTP id s130mr7509039oif.138.1633538634953; 
 Wed, 06 Oct 2021 09:43:54 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:54 -0700 (PDT)
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
Subject: [PATCH 10/12] x86: dt: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:30 -0500
Message-Id: <20211006164332.1981454-11-robh@kernel.org>
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

Replace open coded parsing of CPU nodes' 'reg' property with
of_get_cpu_hwid().

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/x86/kernel/devicetree.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kernel/devicetree.c b/arch/x86/kernel/devicetree.c
index 6a4cb71c2498..3aa1e99df2a9 100644
--- a/arch/x86/kernel/devicetree.c
+++ b/arch/x86/kernel/devicetree.c
@@ -139,12 +139,11 @@ static void __init dtb_cpu_setup(void)
 {
 	struct device_node *dn;
 	u32 apic_id, version;
-	int ret;
 
 	version = GET_APIC_VERSION(apic_read(APIC_LVR));
 	for_each_of_cpu_node(dn) {
-		ret = of_property_read_u32(dn, "reg", &apic_id);
-		if (ret < 0) {
+		apic_id = of_get_cpu_hwid(dn, 0);
+		if (apic_id == ~0U) {
 			pr_warn("%pOF: missing local APIC ID\n", dn);
 			continue;
 		}
-- 
2.30.2

