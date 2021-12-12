Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B6A471E96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 00:06:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0dQ3Gzjz3fKV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 10:06:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qyaqAU+H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22a;
 helo=mail-lj1-x22a.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qyaqAU+H; dkim-atps=neutral
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBxvM57wHz2xZm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 08:03:43 +1100 (AEDT)
Received: by mail-lj1-x22a.google.com with SMTP id k23so21155564lje.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SiVmxmlmX7gD18KWJKuTaPa7pNX7A6+5Wut7BQEWlWA=;
 b=qyaqAU+HSKD+HsUBKg5AB4Grj9JsCbr9g/kNEIZtJUYDPkR5w7X3oEBoqbhkveHPA0
 i7WuMCFDqVmy4v4uwmxmKqJQgyKWbZxAuezUxU7vJ7Js6Vv9mGU7AXWM79sgkKDLmhWK
 jFp8UPoUTDTrVPMbjiOZPw0kaHhZEow7vk98bEAvorv4PN2Ae1WrpFauYpbNmt6sURPu
 EHsFzc94IQPacNeM0GpGjXTCkggEJqqfF6pqgsflI/TGqDXRSOm8kaL/erYImjVTvQQe
 TKd1cdir2wKhwb/5hDwmkKqbCAzORiU/FXU4xaDIEAT35buQchr71urUuURu0JjCKmA+
 4E2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SiVmxmlmX7gD18KWJKuTaPa7pNX7A6+5Wut7BQEWlWA=;
 b=dO+e+6Bp2a9zg4y9BF2Y7ha6Pf8Voxr+JlD4UrdQPUFhK8zL+axeRdo0ycQ15sMVf/
 TM0fsX0K2ZV+h02zpgZ821BXYjXvzND/+bbCjvFwC3P7GXhUHQ37ClBfYO+HqGdPOorq
 oK6zyl+z2Yo9G0Okax1mUMDJykMGDp2U/3HyiLeujdDmzgptKUNfi+G8pLY8wUJEkgLu
 MXrRnnaE1z625KB0y/OsMgJCrHNPgKsIwmN+0NIfPZtkoQUUN7tzK1HDB6221cLOZltY
 5YoUDV3klxYhYN/vxNlbwx00RnhYmDhY4LR269DjPaUzrZ4jECeCmi9WOY8wmKQsNikw
 x/eg==
X-Gm-Message-State: AOAM533cf4QmKBMaQn05f2/AZrhbvXnmy6ZVQ7a2mE+sKE4yU9hmE335
 MZY0eexmCXbI7wt/S8+JgnA=
X-Google-Smtp-Source: ABdhPJzPB5bwYAfFOn1aDytHDcrWq16AdXdyLAU7ztJCQFx3xpkh7jhCINcDSwIbtlftQmSbgta8Pw==
X-Received: by 2002:a2e:9903:: with SMTP id v3mr25528327lji.143.1639343020440; 
 Sun, 12 Dec 2021 13:03:40 -0800 (PST)
Received: from localhost.localdomain (94-29-46-111.dynamic.spd-mgts.ru.
 [94.29.46.111])
 by smtp.gmail.com with ESMTPSA id y4sm1197172ljp.16.2021.12.12.13.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 13:03:40 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Guo Ren <guoren@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Greg Ungerer <gerg@linux-m68k.org>, Joshua Thompson <funaho@jurai.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Sebastian Reichel <sre@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Greentime Hu <green.hu@gmail.com>,
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
 Ulf Hansson <ulf.hansson@linaro.org>, alankao@andestech.com,
 "K . C . Kuen-Chern Lin" <kclin@andestech.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v5 03/21] reboot: Print error message if restart handler has
 duplicated priority
Date: Mon, 13 Dec 2021 00:02:51 +0300
Message-Id: <20211212210309.9851-4-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211212210309.9851-1-digetx@gmail.com>
References: <20211212210309.9851-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add sanity check which ensures that there are no two restart handlers
registered using the same priority. This requirement will become mandatory
once all drivers will be converted to the new API and such errors will be
fixed.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index 6bcc5d6a6572..35f0cde641c1 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -182,6 +182,21 @@ static ATOMIC_NOTIFIER_HEAD(restart_handler_list);
  */
 int register_restart_handler(struct notifier_block *nb)
 {
+	int ret;
+
+	ret = atomic_notifier_chain_register_unique_prio(&restart_handler_list, nb);
+	if (ret != -EBUSY)
+		return ret;
+
+	/*
+	 * Handler must have unique priority. Otherwise call order is
+	 * determined by registration order, which is unreliable.
+	 *
+	 * This requirement will become mandatory once all drivers
+	 * will be converted to use new sys-off API.
+	 */
+	pr_err("failed to register restart handler using unique priority\n");
+
 	return atomic_notifier_chain_register(&restart_handler_list, nb);
 }
 EXPORT_SYMBOL(register_restart_handler);
-- 
2.33.1

