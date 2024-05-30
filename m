Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5A628D557C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:37:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ePqfRUmf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1N900nFz3fvV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:37:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ePqfRUmf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com; envelope-from=coelacanthushex@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqkLj6dNKz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 21:20:12 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1f082d92864so6320505ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068010; x=1717672810; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UKDbsptHUOf10z9ycdwLPkvcPnlZIVKylvaMWlEqffg=;
        b=ePqfRUmfXowbGfZMiOGaaXZ56eTFOU5jsb//T2l/9+Y/+zeckSHNwdZj8Nn0eGhLEV
         w0YN2CBl3cca6eg1hD02jt10VawD/dW5098KAfEfGd+LDfZFVZMP6qohSXNbuVaoql23
         KzVtJkc9U1SicHOpypwNP40nOmGgKwUm4t6ObC7R5vcJ/NtFYR1Ju8vcQ2+O2Gbd6uJU
         VgyrlJZGze9jlfZDaK6Zi4CMrmi+fQICy0nncCig30nAfZbQUoIYbcqXdIyDpM6KZkpt
         jpGk7erua/++tvxtoARb7KyWpf5wHXWFS1EmhjJOQ1Ohc4A56a3+yUwtDYfZ+7Ruy6JZ
         PE5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068010; x=1717672810;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UKDbsptHUOf10z9ycdwLPkvcPnlZIVKylvaMWlEqffg=;
        b=gh1xfQL7peoCreqi3BPNpahRzxANx3PHKQxspkwUlnnsuILJpAZALpsgljerjkci7w
         sfdOJPIVfHZYfhWHpUjsFuVIp2uPQY+fo+7HIPjop23sVIW71xy2SMrQmle3ZAuFVL/R
         D+rdNzF8Uhq9W9lKakRe8JsUEdRfR9Dw+WjjwCtMgc6Aololea1XaWVefpIzeuhRsvG6
         sV8hrkkomOteE0XaaJIU9R6pZ7RqliToI9XGQ/zSy/hSVo0S2QTdqDlu0jvWVJFRDnSv
         JYvjGN6DearklA8b7WQPkfZHNK3kNjBYFrR7LZJKYBDgD3FVx1ZGFX7Z1DHO+FsPw/qC
         lpig==
X-Forwarded-Encrypted: i=1; AJvYcCX1j7+5dg1Aj7O/CpF0dkRpMy8woU9rI0U+plGRs1aB2nFbUQm6JtmmyZtaW2Qlr9VKbX17C1FhBYg5kJQJW1SkikdNgxS9DXLSzAHhZw==
X-Gm-Message-State: AOJu0Yx0fB4HNIu5cahR1n1/3DIkisGwhSYT+rlrczFNNpsTj6yidldw
	9p2Oe19UqS5NMiS/QfPYNvc+rNYFLQfNoPOTIm/DlbfdcGuNHI9X
X-Google-Smtp-Source: AGHT+IG8jDyJ8as1gn+77mY1eHAg+/C0hnh88tNUqGm5hMTpX2IBrtY6RK5OpQr2kS5B3uzx1FXS4g==
X-Received: by 2002:a17:90a:b005:b0:2bd:f3dc:62d0 with SMTP id 98e67ed59e1d1-2c1abc41427mr1745172a91.37.1717068010054;
        Thu, 30 May 2024 04:20:10 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c1a777a976sm1534201a91.20.2024.05.30.04.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:09 -0700 (PDT)
From: Celeste Liu <coelacanthushex@gmail.com>
X-Google-Original-From: Celeste Liu <CoelacanthusHex@gmail.com>
To: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Anup Patel <anup@brainfault.org>,
	Guo Ren <guoren@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?UTF-8?q?Th=C3=A9o=20Lebrun?= <theo.lebrun@bootlin.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Naveen N . Rao" <naveen.n.rao@linux.ibm.com>,
	Sven Joachim <svenjoac@gmx.de>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Tony Lindgren <tony@atomide.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Mykola Lysenko <mykolal@fb.com>,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org
Subject: [PATCH 2/6] loongarch: defconfig: drop RT_GROUP_SCHED=y
Date: Thu, 30 May 2024 19:19:50 +0800
Message-ID: <20240530111947.549474-10-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1629; i=CoelacanthusHex@gmail.com; h=from:subject; bh=h4glHeoHIj1lCrO/9cfcaGCSQbc7rI3O4B300cL/OlA=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJ1/n69Xxaeu7NP36NP963pkB213cGx83nk+e+3 76w6tID+4kdpSwMYlwMsmKKLGI7n75eVvrowzJekxkwc1iZQIYwcHEKwESKNRn+WU/3fra1weNu krm/TiCjVtvfa8brLyYvXBxW9+bE9hjTBwx/hWUiri0SdmdLcHzGfvl11UovoVVOsWVy29fF/F/ 2874CBwCfBE2n
X-Developer-Key: i=CoelacanthusHex@gmail.com; a=openpgp; fpr=892EBC7DC392DFF9C9C03F1D15F4180E73787863
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, Celeste Liu <CoelacanthusHex@gmail.com>, Lennart Poettering <lennart@poettering.net>, bpf@vger.kernel.org, Icenowy Zheng <uwu@icenowy.me>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[1]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/loongarch/configs/loongson3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/loongarch/configs/loongson3_defconfig b/arch/loongarch/configs/loongson3_defconfig
index b4252c357c8e..4d93adb3f1a2 100644
--- a/arch/loongarch/configs/loongson3_defconfig
+++ b/arch/loongarch/configs/loongson3_defconfig
@@ -23,7 +23,6 @@ CONFIG_NUMA_BALANCING=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_RDMA=y
 CONFIG_CGROUP_FREEZER=y
-- 
2.45.1

