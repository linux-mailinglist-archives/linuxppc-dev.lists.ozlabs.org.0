Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B06276CEE23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Mar 2023 17:57:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pmrm147bKz3fjN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 02:57:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.47; helo=mail-oo1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PmrgB3GdGz3f5g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 02:53:10 +1100 (AEDT)
Received: by mail-oo1-f47.google.com with SMTP id m6-20020a4ae846000000b0053b9059edd5so2497190oom.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Mar 2023 08:53:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680105188;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/qOq2NGpUAbxXp1g8F5WR4fkX2S7bH0m0xxnMP60FJ8=;
        b=2kCao1YLkYuOdEqaHb1m6FpPvuwpAJ53ROk6Rh9jL6EZHUM1/Xzr56ZZ5mzUOVzF6R
         nCVubjFwGbrdletmFcziI9dSJXNXAna/unYXnA4+/ZAzIJoQYj5c+lU3WAFlhrF/9zWl
         EJfLuZ6ohd2Mmltw0YnFAaA1quYvERF1wA9URVKaGYxkL79kYkUhLHMXJHW4hS2eObXE
         VvsF/BzbZU29+BlwTRj2Z85AS7YDbeTQHEjqRwizdz1c53VdJHd7K1jprhvrMzB9iIiV
         nZUQcGsaNtgrsZl4sSop+IOeNw30VUfLRbuwu4Ku9u9DNpGhaclwB6xxQ9Am17lNKe/v
         vWjQ==
X-Gm-Message-State: AO0yUKVtIsSzCeawJr0t9zEAOtO2ktQUY+Bq6EcydLkLJHfH74M/W5Vg
	bZChLR7AAyfknIU6LrcK7A==
X-Google-Smtp-Source: AK7set+oji6+6UZVdlF32jW97Cd5wKPzdK3BfB/MTFUCEZ/Z55TdZpfcLorcJt7g+5txg06Aa2xkVA==
X-Received: by 2002:a4a:3797:0:b0:538:1e63:1725 with SMTP id r145-20020a4a3797000000b005381e631725mr10070334oor.4.1680105187664;
        Wed, 29 Mar 2023 08:53:07 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id s9-20020a4a9689000000b005255e556399sm13966954ooi.43.2023.03.29.08.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 08:53:07 -0700 (PDT)
Received: (nullmailer pid 3198063 invoked by uid 1000);
	Wed, 29 Mar 2023 15:52:45 -0000
From: Rob Herring <robh@kernel.org>
Date: Wed, 29 Mar 2023 10:51:58 -0500
Subject: [PATCH 01/19] of: Make devtree_lock declaration private
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230329-dt-cpu-header-cleanups-v1-1-581e2605fe47@kernel.org>
References: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
In-Reply-To: <20230329-dt-cpu-header-cleanups-v1-0-581e2605fe47@kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, 
	Frank Rowand <frowand.list@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Amit Daniel Kachhap <amit.kachhap@gmail.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Lukasz Luba <lukasz.luba@arm.com>, Amit Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
	Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Anup Patel <anup@brainfault.org>, 
	Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Marc Zyngier <maz@kernel.org>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>
X-Mailer: b4 0.13-dev
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
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-tegra@vger.kernel.org, linux-mediatek@lists.infradead.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sparc is the only place devtree_lock is used outside of drivers/of/.
Move the devtree_lock declaration into of_private.h and Sparc's prom.h
so pulling in spinlock.h to of.h can be avoided for everything besides
Sparc.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 arch/sparc/include/asm/prom.h | 3 +++
 drivers/of/of_private.h       | 1 +
 include/linux/of.h            | 2 --
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/sparc/include/asm/prom.h b/arch/sparc/include/asm/prom.h
index 587edb8b5a65..8184575b1336 100644
--- a/arch/sparc/include/asm/prom.h
+++ b/arch/sparc/include/asm/prom.h
@@ -19,11 +19,14 @@
 #include <linux/mutex.h>
 #include <linux/atomic.h>
 #include <linux/irqdomain.h>
+#include <linux/spinlock.h>
 
 #define of_compat_cmp(s1, s2, l)	strncmp((s1), (s2), (l))
 #define of_prop_cmp(s1, s2)		strcasecmp((s1), (s2))
 #define of_node_cmp(s1, s2)		strcmp((s1), (s2))
 
+extern raw_spinlock_t devtree_lock;
+
 struct of_irq_controller {
 	unsigned int	(*irq_build)(struct device_node *, unsigned int, void *);
 	void		*data;
diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
index fb6792d381a6..b57f1014e419 100644
--- a/drivers/of/of_private.h
+++ b/drivers/of/of_private.h
@@ -38,6 +38,7 @@ struct alias_prop {
 #define OF_ROOT_NODE_SIZE_CELLS_DEFAULT 1
 
 extern struct mutex of_mutex;
+extern raw_spinlock_t devtree_lock;
 extern struct list_head aliases_lookup;
 extern struct kset *of_kset;
 
diff --git a/include/linux/of.h b/include/linux/of.h
index 0af611307db2..36cf94596eba 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -16,7 +16,6 @@
 #include <linux/errno.h>
 #include <linux/kobject.h>
 #include <linux/mod_devicetable.h>
-#include <linux/spinlock.h>
 #include <linux/topology.h>
 #include <linux/notifier.h>
 #include <linux/property.h>
@@ -145,7 +144,6 @@ extern struct device_node *of_root;
 extern struct device_node *of_chosen;
 extern struct device_node *of_aliases;
 extern struct device_node *of_stdout;
-extern raw_spinlock_t devtree_lock;
 
 /*
  * struct device_node flag descriptions

-- 
2.39.2

