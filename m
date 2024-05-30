Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 917B18D5591
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:40:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U6Sk9+Nq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1RZ66QJz3fp6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:40:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=U6Sk9+Nq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com; envelope-from=coelacanthushex@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqkLq0bg9z2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 21:20:19 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1f44b59f8daso4801635ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068018; x=1717672818; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FGiqpKa0bHIEpa15rly2elByLBlsz+mavCGVuSQB03U=;
        b=U6Sk9+NqsJck9hjTkNKe91iaUxoaZP697w/6ch95cVb8Q9EzIsU7n7UnRQ9Hy72KTD
         k93HBeuAXf6mluZR6wyVPjlq4kOuKqyg6ZuRS6dFlzBzztuIF8vr8+JKXC5nUMxMJnms
         9bvNxSB7hT2UJt4yNnRBcirvfg3CxSrI45luk7o+OHs2Sz10jkSndUurzcdoMFeuVNcE
         72Aj0fTDV4l35i2l3Y+SExV2ZImvBFXkpjULloH1VeePye+8fTTwNj/0WLw9LQ5oKPms
         k36bxwhZvJKcTAmg93nwylq1CpGsqZv1ilop910Sxi5awaoFSU6PbkT0YLmuRfPJiz2I
         W2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068018; x=1717672818;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FGiqpKa0bHIEpa15rly2elByLBlsz+mavCGVuSQB03U=;
        b=Zp7QCOIApiML7XkY0QoRP1XNFOojgwuEblLDe8qx02li4H4v843vFxmCYPUJJgMaHT
         LdIgIpozutDzqD5osZ1pPCzK4cMHuo9PxI2FGL2TLERauEqyuJALWJzqiGMVbev3Qqj+
         G/QweAwvPL1n8SJFqBVdwgctBcjXTa1bCEMyaIsIq1abt2p/cEC+ysU1tidRZl60U6sb
         pz4J7DahOMLdWZDXSrpoghbSJ5iUYE3CFUhRgKP5o4CMFMw40bkj/mDuAMs22j7wX4MK
         hOkj4mXUKJF5x8F3l/OkcIxLVfg5x1Lh7ICkgCnRL2Ou6bQTAGlUAZyJ3UCVBtI70Uc1
         dlBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwS91l4ZkiODKNuD6CC5pBFKBxwl3SMCsoEtsVcCsmEcu40L9f8/e37RiIjuJByB2407hM3+xyHjOrH5gmJLaTWwI/H0DQiRQ/hj8YLA==
X-Gm-Message-State: AOJu0YyBM0FQq9oLrFuiflUzmUkgz0B4ixXmj6NyxL5Eet24ehMsbLn5
	8nXGKX+dhjBHxthc9+e142MrQ2KmXBFLQAqr5l52vgNw7wL3/Ct5
X-Google-Smtp-Source: AGHT+IH8SBUM4HFPal7PP4GlEtGKEuppsnSX92o9KNQGYi+syJrrgm3CpsZ+Cwm0ovcoR5ODsoOSkQ==
X-Received: by 2002:a17:902:f1cb:b0:1f4:f1c1:646b with SMTP id d9443c01a7336-1f619610e86mr13465395ad.33.1717068017750;
        Thu, 30 May 2024 04:20:17 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f62218d9e6sm9517475ad.117.2024.05.30.04.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:17 -0700 (PDT)
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
Subject: [PATCH 5/6] sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
Date: Thu, 30 May 2024 19:19:53 +0800
Message-ID: <20240530111947.549474-13-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2029; i=CoelacanthusHex@gmail.com; h=from:subject; bh=kOqrnzdbmJCW+4DZmJVchuzFR6LT5fL9WaReqTWmC8g=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJNwub0yXLjr83sFl6+r9m9kR/++RbfTfmNMpv7 my3dmlavLujlIVBjItBVkyRRWzn09fLSh99WMZrMgNmDisTyBAGLk4BmAiHHSPDiWeRLf+fbOwM 1WVrORm/XDDz8bQ1DJ+etga9dN23//qBHoY/HAcKm/+7fhPVYMsRuzTfViI8IXPz8oWr86eHXVw Sp9rHBgChF03a
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
 arch/sh/configs/sdk7786_defconfig | 1 -
 arch/sh/configs/urquell_defconfig | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/sh/configs/sdk7786_defconfig b/arch/sh/configs/sdk7786_defconfig
index 7b427c17fbfe..3599b1683593 100644
--- a/arch/sh/configs/sdk7786_defconfig
+++ b/arch/sh/configs/sdk7786_defconfig
@@ -17,7 +17,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_CGROUP=y
 CONFIG_RELAY=y
 CONFIG_NAMESPACES=y
diff --git a/arch/sh/configs/urquell_defconfig b/arch/sh/configs/urquell_defconfig
index 00ef62133b04..9cf4a719001e 100644
--- a/arch/sh/configs/urquell_defconfig
+++ b/arch/sh/configs/urquell_defconfig
@@ -15,7 +15,6 @@ CONFIG_CPUSETS=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_CGROUP_MEMCG=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_BLK_DEV_INITRD=y
 CONFIG_PROFILING=y
 CONFIG_MODULES=y
-- 
2.45.1

