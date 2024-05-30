Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 760368D5582
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:39:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NltOoTaK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1Ps5GjCz3fqs
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:38:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NltOoTaK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com; envelope-from=coelacanthushex@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqkLm3G7hz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 21:20:16 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-70109d34a16so670170b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068013; x=1717672813; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iS6/3rMP5XMaNOKzvqnjBVlN/YxRA0hOsUbIiKByQ6o=;
        b=NltOoTaKkZLGpcToNm0f5byiiYyiA+pl/TVrdM9CBCh9fhbPCIKbmziYyNQeTtrq4P
         9nLnTk5nLvujZhgIarQIFOUT3ctn5C0CYxp4r+qDQ8v+2pZKUlfy1j+XBV0q2i0Xav54
         /KiGqT++HMa4W2+rlWy2f8TKp0VOI1hmnkrCqFHxTZuAdteOJN/IXxLRps41u/JVDieX
         Wk0q3kdOH8dzDDXLyl7j30q3QfxlcNihqXMqjlsKgvNUhiVpEmKoCxSInd2hBspD8m05
         k5kSf1CXMUAcA5yyvsrJ4j0CIQGfX7xJjO4/4zDpNOCv4Rv6T67azzpr4m6rI9nIDe3N
         zhKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068013; x=1717672813;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iS6/3rMP5XMaNOKzvqnjBVlN/YxRA0hOsUbIiKByQ6o=;
        b=r6nfh4NiRmEPp0aec6iu2c/ulFJVRmcy6EREQn8vrrkILSiP/JqxLp13giT9wpPN8S
         SV8pjGLVtZ7hV52/Yx21j1V/jXEjN1csGy4urZbOouw/Jva+49yfusJOvpiCrPRTZ5n2
         Zaa6BGMIdmARKeWpnVY82OQfT0Jp3eRTGO7O4mYWVaHOvFYXcu6ddEZBqxzMmwYGZ5FI
         r+8t7e2H3ukW69A5q/WOdcyDnFGeGkjKoOtsydzPHMFejI8AeNEkqmN94BLpQlRLr7er
         5X8iQJ00292dPXal1LP29RLPoGtRKn2jN/nm0oovKQK1e1fPJ0zJD/sTJr5+z0dBdqf1
         inRg==
X-Forwarded-Encrypted: i=1; AJvYcCXIIi0tBr0aP1H0+xvxNnhlWZUOerb6eLNI+cQ5+lUHzbI8cdNcBmukF60Eep3diNYu4FfMh7pvWFHAFAimc+jq5Nec9nGjJQvtRNISUg==
X-Gm-Message-State: AOJu0YzVcL7wdXbkPAzdzMbuvxQjLwDizfmW0mR7tU9YSHZxdnXS+xGb
	aktMUYCvFkmeBQK2WObUwjVF4lAcU1gB44Jeeqpk4u3tbgz0dtJr
X-Google-Smtp-Source: AGHT+IEz4if+6nQ+0nx1w/27JH/n7YuyuluXY8+GolxtiPn58HNH1t1JZeRF1Dn7No9YQVVS74OoWg==
X-Received: by 2002:a05:6a21:9982:b0:1b0:111f:2b7f with SMTP id adf61e73a8af0-1b264645684mr2023903637.39.1717068013130;
        Thu, 30 May 2024 04:20:13 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7021feb0b7dsm2116952b3a.25.2024.05.30.04.20.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:12 -0700 (PDT)
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
Subject: [PATCH 3/6] mips: defconfig: drop RT_GROUP_SCHED=y from generic/db1xxx/eyeq5
Date: Thu, 30 May 2024 19:19:51 +0800
Message-ID: <20240530111947.549474-11-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2501; i=CoelacanthusHex@gmail.com; h=from:subject; bh=iuzxupRQlKvaCQIBiZ4xlf2r612WVp0v0y+1iZrYbx8=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJN5aHbSvetGXDI9/Lgg/2RZ0Pr9tZ2Zeh8l34s JFf/NkbX3s7SlkYxLgYZMUUWcR2Pn29rPTRh2W8JjNg5rAygQxh4OIUgIkc2cnw3+dB99H+ecua Oiy0mLQjDFasNi7dvfTwkdv38ytDfrqaLGRkOOx28cCrP0VHmn/UfmB7LhiTWCzOvmna5ka3YIu yCes1WADtNVCT
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
 arch/mips/configs/db1xxx_defconfig  | 1 -
 arch/mips/configs/eyeq5_defconfig   | 1 -
 arch/mips/configs/generic_defconfig | 1 -
 3 files changed, 3 deletions(-)

diff --git a/arch/mips/configs/db1xxx_defconfig b/arch/mips/configs/db1xxx_defconfig
index b2d9253ff786..6eff21ff15d5 100644
--- a/arch/mips/configs/db1xxx_defconfig
+++ b/arch/mips/configs/db1xxx_defconfig
@@ -12,7 +12,6 @@ CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
diff --git a/arch/mips/configs/eyeq5_defconfig b/arch/mips/configs/eyeq5_defconfig
index c35c29a4d479..3794707c9522 100644
--- a/arch/mips/configs/eyeq5_defconfig
+++ b/arch/mips/configs/eyeq5_defconfig
@@ -8,7 +8,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
diff --git a/arch/mips/configs/generic_defconfig b/arch/mips/configs/generic_defconfig
index 071e2205c7ed..fa916407bdd4 100644
--- a/arch/mips/configs/generic_defconfig
+++ b/arch/mips/configs/generic_defconfig
@@ -5,7 +5,6 @@ CONFIG_IKCONFIG_PROC=y
 CONFIG_MEMCG=y
 CONFIG_BLK_CGROUP=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CPUSETS=y
-- 
2.45.1

