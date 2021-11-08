Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 749EC447715
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 01:49:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnXYV2qtwz3bbx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 11:49:02 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aCN9ngxN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::129;
 helo=mail-lf1-x129.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=aCN9ngxN; dkim-atps=neutral
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnXXC1fjFz2xB0
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 11:47:53 +1100 (AEDT)
Received: by mail-lf1-x129.google.com with SMTP id p16so32493701lfa.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Nov 2021 16:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTvK5kO0FUcGnxCyVmK+GKrZNfPhZFNt57h0QWat/qo=;
 b=aCN9ngxNlSuTINh4RCPQ4NiaJQfaWgqOf+aRAmJkkpUuhaTskk16d6mLEB53d+EwRg
 2s7t+J4Bd+TYq/EXsMdm4K86cRKj3NZi6nWiQF6aQbgCPpCuvbwpFq4sXJn2XPr4GSG2
 Th3D5kSFp+oiICqSjiRaQ6JEqqHbq6GvlbMsD1k+WxWsk9ox4vhFrqiSSZariEfpk3/K
 NKYoWyNV67g+VntDwz5qg08D9ob5s1g4zeH1HG0CZIBJriUNPt7qdO5WhWhekDmPVGMJ
 IDvotTuyzH4cPVwERohWZwkZ/fa6HSeGhOA4LV/VuKel+YQjioIfxOgQanwFcDxsyY3E
 OrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTvK5kO0FUcGnxCyVmK+GKrZNfPhZFNt57h0QWat/qo=;
 b=b8f6K+ne2ayMz7wuEUKX418fZ+v1ucsuy6ANuI/uZqHbgUSXibQVx7A8DXb434AK6v
 d3+zxvTtTuFW3OKxrb1+fkfYmMDsBaAIzwa4DIB3CdhtgaXgj6RhE4m/ENL4ZKRIeA7P
 /0yqZeS3b5b8qQhx9Flg4g2bO4bepFm77wPMwR0MMcpIkFI6HBxRJ3uUFGPtFRe9bmWt
 TP8PLxcNdzn+Cmf/hqdC5KlKoWpdKK1WxbZSl5I9uS+qHv8pyqzoxHMz3b7nuZ0v+whS
 cwS6hJnKh84tb0dIQ+bZvC2lzlmeRfXHeVovPMgwyUG90qWBaqlKFlWd+zK5d2nezUIz
 wR8g==
X-Gm-Message-State: AOAM533ZEHvNGmusGIS475poUdkWZhlO5CrI2PfMliSxAuiWuTZfT4aH
 dW42We64UUEheeorHnASTeY=
X-Google-Smtp-Source: ABdhPJzV8tM9jJ+YM8h9UIDCNNzE6Z7H4gJwzI4RlG1cQ6QRWjIBy7LL+ION1D+Mvhxd950s2BQwnw==
X-Received: by 2002:ac2:424e:: with SMTP id m14mr51529749lfl.176.1636332469060; 
 Sun, 07 Nov 2021 16:47:49 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:47:48 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Nick Hu <nickhu@andestech.com>, Greentime Hu <green.hu@gmail.com>,
 Vincent Chen <deanbo422@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Juergen Gross <jgross@suse.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Santosh Shilimkar <ssantosh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee.jones@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 01/25] notifier: Remove extern annotation from function
 prototypes
Date: Mon,  8 Nov 2021 03:45:00 +0300
Message-Id: <20211108004524.29465-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108004524.29465-1-digetx@gmail.com>
References: <20211108004524.29465-1-digetx@gmail.com>
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
Cc: linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, linux-riscv@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no need to annotate function prototypes with 'extern', it makes
code less readable. Remove unnecessary annotations from <notifier.h>.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/notifier.h | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/include/linux/notifier.h b/include/linux/notifier.h
index 87069b8459af..4b80a815b666 100644
--- a/include/linux/notifier.h
+++ b/include/linux/notifier.h
@@ -90,7 +90,7 @@ struct srcu_notifier_head {
 	} while (0)
 
 /* srcu_notifier_heads must be cleaned up dynamically */
-extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
+void srcu_init_notifier_head(struct srcu_notifier_head *nh);
 #define srcu_cleanup_notifier_head(name)	\
 		cleanup_srcu_struct(&(name)->srcu);
 
@@ -141,36 +141,36 @@ extern void srcu_init_notifier_head(struct srcu_notifier_head *nh);
 
 #ifdef __KERNEL__
 
-extern int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
+int atomic_notifier_chain_register(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
-extern int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
+int blocking_notifier_chain_register(struct blocking_notifier_head *nh,
 		struct notifier_block *nb);
-extern int raw_notifier_chain_register(struct raw_notifier_head *nh,
+int raw_notifier_chain_register(struct raw_notifier_head *nh,
 		struct notifier_block *nb);
-extern int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
+int srcu_notifier_chain_register(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
-extern int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
+int atomic_notifier_chain_unregister(struct atomic_notifier_head *nh,
 		struct notifier_block *nb);
-extern int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
+int blocking_notifier_chain_unregister(struct blocking_notifier_head *nh,
 		struct notifier_block *nb);
-extern int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
+int raw_notifier_chain_unregister(struct raw_notifier_head *nh,
 		struct notifier_block *nb);
-extern int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
+int srcu_notifier_chain_unregister(struct srcu_notifier_head *nh,
 		struct notifier_block *nb);
 
-extern int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
+int atomic_notifier_call_chain(struct atomic_notifier_head *nh,
 		unsigned long val, void *v);
-extern int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
+int blocking_notifier_call_chain(struct blocking_notifier_head *nh,
 		unsigned long val, void *v);
-extern int raw_notifier_call_chain(struct raw_notifier_head *nh,
+int raw_notifier_call_chain(struct raw_notifier_head *nh,
 		unsigned long val, void *v);
-extern int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
+int srcu_notifier_call_chain(struct srcu_notifier_head *nh,
 		unsigned long val, void *v);
 
-extern int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
+int blocking_notifier_call_chain_robust(struct blocking_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
-extern int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
+int raw_notifier_call_chain_robust(struct raw_notifier_head *nh,
 		unsigned long val_up, unsigned long val_down, void *v);
 
 #define NOTIFY_DONE		0x0000		/* Don't care */
-- 
2.33.1

