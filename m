Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA9243D6F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 00:52:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfkVN0btWz3cW6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 09:52:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZqOcoukr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12e;
 helo=mail-lf1-x12e.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ZqOcoukr; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfhP60JC0z2xXR;
 Thu, 28 Oct 2021 08:18:01 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id u11so9038053lfs.1;
 Wed, 27 Oct 2021 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wTvK5kO0FUcGnxCyVmK+GKrZNfPhZFNt57h0QWat/qo=;
 b=ZqOcoukrajwjG0ttfhDDamRtFbZgEiaFrpLAXOR7yQBANjFcnFFXOdYomTLQXBItFZ
 6fsN0Gio8AJkokF0BnxXjlaJgq1CP0FdapZULDkVLC880wSvbduG3ij7wOgm65yyZHfb
 /MEYtYvu3WnHHl8p/60KRwD6dDnaqpWEGWZELHlL42ECg0BG3xSUbLaFXBGJ8l5anvCb
 nmVZ+GAgVHAauuOzz3lnhLFItX2Cbpx7VOJRMQdOkh5vDNRTVY6CLlgAa8SfZ45DmHqN
 vHhGZ7nhCEzJCcCT39f5nwGqOjoorbJierMaHF5OrWAM3eykGjghB0x8WQgbnqhmKJ6c
 aKlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wTvK5kO0FUcGnxCyVmK+GKrZNfPhZFNt57h0QWat/qo=;
 b=QajtAma6LLPKX/06rA51qTu9811zcRwz/RX2pS2LuhhHfsbYCeM6BCoWYLDGkrCh9R
 tqaqCp4uDYcpZskzdAiE+6Wgf6Vds6tZrj0c36Goa0hSG7YUCMw4XEbNAaYYF21XD+eB
 3v7W5yOMLl6j6fh+YeF4duxIBHAjKcmDqLDvMfSdLSgUzDG+hlFzz+ulkuqsDvhZ5bT1
 fhzu57vO6lsn8HAa7wgvT3dKQQWtcfzQAU4KixqI8CWZ5OlkzVwvPP1+zCU1J5z1ujfL
 hEpMhdPSbmvocCgyVXBGPb7ljVoV/McwbLxzVXiSB2k62Q+7wLdjuhCmk1lKaP5vyhnb
 m7Tw==
X-Gm-Message-State: AOAM533ZXnWLshrvZDw4z9pDbekHrPoXAJ6BaBbhLluwQga++Bkaohvo
 jiQZ0zMMCz7JTyQgbOx0NBg=
X-Google-Smtp-Source: ABdhPJwuKOrqeex0uVzCe5G2iTS4vzkdpHKtiR+d5t3erf2uXeC/mCcisVEMxQQhKVgKCWNS6EmCsw==
X-Received: by 2002:a05:6512:38d0:: with SMTP id
 p16mr80629lft.483.1635369474451; 
 Wed, 27 Oct 2021 14:17:54 -0700 (PDT)
Received: from localhost.localdomain (46-138-41-28.dynamic.spd-mgts.ru.
 [46.138.41.28])
 by smtp.gmail.com with ESMTPSA id d7sm104336ljl.18.2021.10.27.14.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 14:17:54 -0700 (PDT)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Lee Jones <lee.jones@linaro.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Guenter Roeck <linux@roeck-us.net>, Russell King <linux@armlinux.org.uk>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v2 01/45] notifier: Remove extern annotation from function
 prototypes
Date: Thu, 28 Oct 2021 00:16:31 +0300
Message-Id: <20211027211715.12671-2-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211027211715.12671-1-digetx@gmail.com>
References: <20211027211715.12671-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Oct 2021 09:51:48 +1100
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org,
 Tomer Maimon <tmaimon77@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 linux-sh@vger.kernel.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-acpi@vger.kernel.org,
 Tali Perry <tali.perry1@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Vincent Chen <deanbo422@gmail.com>, Will Deacon <will@kernel.org>,
 Greg Ungerer <gerg@linux-m68k.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Benjamin Fair <benjaminfair@google.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, linux-csky@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, Chen-Yu Tsai <wens@csie.org>,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Catalin Marinas <catalin.marinas@arm.com>, xen-devel@lists.xenproject.org,
 linux-mips@vger.kernel.org, Len Brown <lenb@kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>, linux-pm@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org,
 Borislav Petkov <bp@alien8.de>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-omap@vger.kernel.org,
 Nancy Yuen <yuenn@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 Nick Hu <nickhu@andestech.com>, Avi Fishman <avifishman70@gmail.com>,
 Patrick Venture <venture@google.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Guo Ren <guoren@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, openbmc@lists.ozlabs.org,
 Joshua Thompson <funaho@jurai.org>
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

