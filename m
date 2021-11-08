Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 871054477CF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 01:52:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnXd83Pvgz308G
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 11:52:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=MSIokg9f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::236;
 helo=mail-lj1-x236.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=MSIokg9f; dkim-atps=neutral
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnXXK5LXmz2xvs
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 11:48:01 +1100 (AEDT)
Received: by mail-lj1-x236.google.com with SMTP id 13so8240407ljj.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Nov 2021 16:48:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
 b=MSIokg9fBl5wCKU+YCh/ZsTnRbPxtyYkn0IXkmz1QgysWSCzedTHzXunmbe5h3S6bm
 UnVL+wV6mqmFlzA/9Cm1DjvGCGyG1UlF0UpjGzAyekOseWLiiFHuU/rzzoJCNBaI+Ut+
 tXv3jqiyClz8c/yGI+0sql8rliP5FMVBt2m13PFdeI0ncEKECxTJKTD2uIvZxfhnpZtc
 pTtiL6yFqIiWFaztPJXKxizN2sS1pJLHyx55ZI+6yNFLo/Lx5fkTcHCO0Wef47K1i5ee
 hCd51zpj+5nuMAdYUzdECYDopq77neBqCsiLrTGv9/feFU5+CZJd4t4x88wQvcjrAxlc
 1+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=idp+KUM0Lads56hMjVdKoUEucrYOLC8M0llXkHYfiR0=;
 b=b+1PVYfTbPbQaw0M1KvivhJ+FFpZjDyIkjsQ/Q/60D1Vgm6Vyzv/4x4BHr/Uc5+4mq
 GJ6U3jHxD1l2jqZJFeUgs6dkrP6RNsIqcY2rdUmVUlwDrFjpKf3P68H4sbNCMeFzCYmV
 XIqp5yrZPNthUa53jgpf00rFtJFHkCdm3dc0U0AdmA6pTZluZ1yFBTZDa6+ANyG29Dpf
 j+8v4pcdVnrK7+3AW69jd3o/1Sro8GuLaOcHEsxP2ibtpkS/XWqSO6/yeIV30FVrT8Dl
 oUn23vWs9J/I5RK+pb8wHx+RLz1py/PIHZSLFgSAka810co/hZRWmgug8L5A+99bIH2+
 iZ5Q==
X-Gm-Message-State: AOAM532fQOpM0HYvBXPhKD9WWV3Sw7rs0CaJn9xCzbdthBmyJyvZiWNP
 kJeHvew0M7Uqtu2hKbs+imY=
X-Google-Smtp-Source: ABdhPJxSy/O3ZKQtb6VfZ0yaPaYZOmyzwu5OdP3V3ve+XGbVnBVt+toWzoBqdj+8FoRHXqlPFKwvJw==
X-Received: by 2002:a2e:b88f:: with SMTP id r15mr57944203ljp.309.1636332477998; 
 Sun, 07 Nov 2021 16:47:57 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:47:57 -0800 (PST)
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
Subject: [PATCH v3 06/25] reboot: Warn if unregister_restart_handler() fails
Date: Mon,  8 Nov 2021 03:45:05 +0300
Message-Id: <20211108004524.29465-7-digetx@gmail.com>
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

Emit warning if unregister_restart_handler() fails since it never should
fail. This will ease further API development by catching mistakes early.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 kernel/reboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/reboot.c b/kernel/reboot.c
index e6659ae329f1..f0e7b9c13f6b 100644
--- a/kernel/reboot.c
+++ b/kernel/reboot.c
@@ -210,7 +210,7 @@ EXPORT_SYMBOL(register_restart_handler);
  */
 int unregister_restart_handler(struct notifier_block *nb)
 {
-	return atomic_notifier_chain_unregister(&restart_handler_list, nb);
+	return WARN_ON(atomic_notifier_chain_unregister(&restart_handler_list, nb));
 }
 EXPORT_SYMBOL(unregister_restart_handler);
 
-- 
2.33.1

