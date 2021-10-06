Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E178B424333
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 18:44:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPgKG5zpHz3cB5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 03:44:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.52; helo=mail-oo1-f52.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com
 [209.85.161.52])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPgJL74MTz2yg4
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 03:43:45 +1100 (AEDT)
Received: by mail-oo1-f52.google.com with SMTP id
 z11-20020a4ad1ab000000b0029f085f5f64so1022475oor.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 09:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SdvZjQ/BWS45GZwLPJ4dVbNMr/Wj7uXKHO/Bl7X5Es4=;
 b=w1W3gYmOC7v2Prpcf2LOdGl8/yzBcCmX3GX3ISGBdSk9onxqMVg4cYKkhThpNNT7/3
 RVor7EN6RsdIl+Y+qwOIno4MFnzDy+AxICDEyrJkMMKWATn5+b6UYjfk5SYfdhXKWMvH
 VvG1HBVH4BTa9qUMjqStC1wW9pB3W+G7LeCUUE0wxTuT38SIuYoJgZSJTYNz8/6Iu8DC
 rwlM+G8DJH+wwuEDGH5KPmoNfUoFTOf2E2emipmdTgG3I9Y4KQBEzW/10cIBNoEFvGF3
 GmSZAzVbVk9xarTFFpflN+vJfycTNyiNgPRZD430MWfRqmADmk1ToP3EysAmkxyCXw5+
 dsjw==
X-Gm-Message-State: AOAM530eZSz+Ridal/hSUK+gXijmyussLQEfw1lkrfAB+VUG1oFEIHfv
 SYp96jeMEij8W6/CwDDikg==
X-Google-Smtp-Source: ABdhPJy1h3H+xIThEc/Bx5W+PW+QqHTa7nGnBvK2axsTz6MHYy0vHuhJmmz3xzrXGNxNysUcAEgxdA==
X-Received: by 2002:a4a:4c46:: with SMTP id a67mr18657206oob.72.1633538621020; 
 Wed, 06 Oct 2021 09:43:41 -0700 (PDT)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id s29sm4236628otg.60.2021.10.06.09.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 09:43:40 -0700 (PDT)
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
Subject: [PATCH 03/12] ARM: broadcom: Use of_get_cpu_hwid()
Date: Wed,  6 Oct 2021 11:43:23 -0500
Message-Id: <20211006164332.1981454-4-robh@kernel.org>
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

Replace open coded parsing of CPU nodes 'reg' property with
of_get_cpu_hwid().

Cc: Florian Fainelli <f.fainelli@gmail.com>
Cc: Ray Jui <rjui@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/arm/mach-bcm/bcm63xx_pmb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-bcm/bcm63xx_pmb.c b/arch/arm/mach-bcm/bcm63xx_pmb.c
index 0e5a05bac3ea..003f1472ab45 100644
--- a/arch/arm/mach-bcm/bcm63xx_pmb.c
+++ b/arch/arm/mach-bcm/bcm63xx_pmb.c
@@ -91,10 +91,10 @@ static int bcm63xx_pmb_get_resources(struct device_node *dn,
 	struct of_phandle_args args;
 	int ret;
 
-	ret = of_property_read_u32(dn, "reg", cpu);
-	if (ret) {
+	*cpu = of_get_cpu_hwid(dn, 0);
+	if (*cpu == ~0U) {
 		pr_err("CPU is missing a reg node\n");
-		return ret;
+		return -ENODEV;
 	}
 
 	ret = of_parse_phandle_with_args(dn, "resets", "#reset-cells",
-- 
2.30.2

