Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E0D224477C2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 01:50:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HnXbg64ygz3cfn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 11:50:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qGyzuk9b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22f;
 helo=mail-lj1-x22f.google.com; envelope-from=digetx@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qGyzuk9b; dkim-atps=neutral
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnXXG0tZJz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 11:47:57 +1100 (AEDT)
Received: by mail-lj1-x22f.google.com with SMTP id h11so26237721ljk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Nov 2021 16:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
 b=qGyzuk9bzwP/18mgZA5opqkVY0uVUy+tVPfW2WYN1KphXlcW2Q+w2WAU/6WZNf57LM
 qJ4eYesG/AVtiYQbx6XiDRV7T5AuMxyGQ216v1qPIOzs89Hff+bf4lZf1jt+ER21rBOl
 HONymPsCAtxnkmv4pkJQTsQypH0+0XmtAGzllxDhcASTyvxis2fFkz6lytuE8myfCgCw
 m9JFB37KExTbVRxVqh3r/x0jYz92VN4nsKWVD0nWCm1XktHXgkzuksbVdAjBiuLFaKZ/
 AY7V9wqwv7IWe10elmoqy019vMjtrGfbjo+zM6o4NTXkbvdPF08pHM+GsNheZd6RkSJl
 Fhsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TugVlbRXpFiQ9yttEJ2CYhwYKdBA8PSz6pBjqNjtqe8=;
 b=wosPmw8Vc/1NpgmNlJyFwCjzis/GMcHaOwv+8cCJNmH5WvuEVImX17YqlPSbiroVP8
 Y0jHOmjVh6vu8H4Op8bJE0hXfCPNbX/BS24DLQVYk7gJDCZmkbHYNXR40RapOXzd9lLY
 /kCkr2aVdnFBDtoyKnEs+Uvqiz8mh0rN+OQ8hIjNVI4jnTWK/K5eao2/dNyHgf69v0uI
 nJkd2Jaj37QF925i65NDcPrJhIKFnnXRgWnFbJt2vHQm7I5SCnfyl2j88Efp+D29MdSh
 hBSzWIBti4plhA77VeCmZl3u4HTbot8hbij6EoRlNEINcrE5xDD6T9NhkeAJ4JotwgYS
 UjjQ==
X-Gm-Message-State: AOAM53175UW7xI23V30GsHtDXKkzoUsL+Janse6KR9R8RdvSEdus/xVi
 Zll18X6BtSVmrgJQAp5rLQo=
X-Google-Smtp-Source: ABdhPJzFYVx5IFgfdDhOR9e83sgbkaPAeNsCANjmWUXHuabW0BVJv1Mhw8sAAFHy3OCvobmKncQgJA==
X-Received: by 2002:a05:651c:907:: with SMTP id
 e7mr81850646ljq.300.1636332474410; 
 Sun, 07 Nov 2021 16:47:54 -0800 (PST)
Received: from localhost.localdomain (79-139-188-96.dynamic.spd-mgts.ru.
 [79.139.188.96])
 by smtp.gmail.com with ESMTPSA id p17sm1625266lfu.209.2021.11.07.16.47.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 16:47:54 -0800 (PST)
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
Subject: [PATCH v3 04/25] reboot: Correct typo in a comment
Date: Mon,  8 Nov 2021 03:45:03 +0300
Message-Id: <20211108004524.29465-5-digetx@gmail.com>
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

Correct s/implemenations/implementations/ in <reboot.h>.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/reboot.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/reboot.h b/include/linux/reboot.h
index af907a3d68d1..7c288013a3ca 100644
--- a/include/linux/reboot.h
+++ b/include/linux/reboot.h
@@ -63,7 +63,7 @@ struct pt_regs;
 extern void machine_crash_shutdown(struct pt_regs *);
 
 /*
- * Architecture independent implemenations of sys_reboot commands.
+ * Architecture independent implementations of sys_reboot commands.
  */
 
 extern void kernel_restart_prepare(char *cmd);
-- 
2.33.1

