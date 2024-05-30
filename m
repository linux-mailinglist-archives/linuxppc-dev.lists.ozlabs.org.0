Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E748D557B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:36:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mjr29FQk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1MK1mTTz3fqx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:36:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mjr29FQk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com; envelope-from=coelacanthushex@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqkLj6Swvz2xps
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 21:20:12 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id d9443c01a7336-1f44b42d1caso6301435ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068005; x=1717672805; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=z8dJKE69s5+86iqiKT1v7IFgnofzj53z+mkIUUuty68=;
        b=mjr29FQklpg8/DNt4DpRYY5uuMrfdp4bFP89Fo97MY+uu5epPPUDTP0tvaHxms9dEU
         R5KZLNXTSfF2VjCNyHWK4Ek+/q/WMdTOz0DM2Nl+N501xKMoJlh+aIMtCmvoCRYtboW8
         YYLTHsHYtqbjr7lX/yl3GuA14CujtYC9sFIm3aRqOf4skz1ck1H2oVNCi7oVxVlpxALY
         9gvNoJK/9pdDJ3d1q+QeU6LyszzlYzFrC+9s2ukJiVOjVHZzxugaWK5QMu3Wu6M1jjBP
         /QzwNpxwneMA7Ofigf3mVbCLAVl7lX1asLzzhRdcLNrkfB6+IiNuPNsxbk23xVUWRnoT
         tVig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068005; x=1717672805;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8dJKE69s5+86iqiKT1v7IFgnofzj53z+mkIUUuty68=;
        b=lsrqofdHIKt22Nz5QRnUB5nIpqzrorSZZ4QKRoNz6WKjtDz9DIzZuTJDXiP/QmWk+x
         Hk2bjmwcx0Qjy+1kUo4tVmy2HEGD+7z4KJIDF+1fTuG+RusoHiv+s2x9KoM2v2WAOCmE
         2jUoeLUddJ4wYjWxZAc+bkE2dos2EzeU4+qlYUqK/OF3cLHK1sX58nx9XSiEUJ8n7czl
         FVVft/SfqQkTSp1a4xWyRU54pZmI3miGdrRczxelQV9RFHy+kgYyNVO5iVpPGNR3c4Qz
         4iYzu87D3LrrQa/LKf8iiqPnO4bMCkhqdaGYTTFaRiyaVbo+Dz8By3g3G284T/ej4X3L
         w62w==
X-Forwarded-Encrypted: i=1; AJvYcCV8SJpBeZFlXga0MXVl6hJl4GACtEE/saLDKMwLdr7TPBOC+vk0Lazo/QcYGenYmGtoQojs9Nql6NV52jNmJCHD7X7LG2ZLBQoxmWqwFg==
X-Gm-Message-State: AOJu0YxVFidzPTvNFY5DvCNrBPe2+Sx2QyrV53U24JlXdDf6n0y9xo7K
	haZ1HwEBwEqM9AQ1Lv40Su0fO+x7+uqd6BrYU4+o9gtufBxXPR70
X-Google-Smtp-Source: AGHT+IHnnxtV+JRyOSR711uh0rY3WubRdOsfI4Q80RTI+mV/CYp9f7gUkptu0Yhyjwe8jY0JUuOaAA==
X-Received: by 2002:a17:903:22cb:b0:1f3:50e7:36db with SMTP id d9443c01a7336-1f6199310f7mr20627105ad.48.1717068004916;
        Thu, 30 May 2024 04:20:04 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c754d20sm116341765ad.32.2024.05.30.04.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:04 -0700 (PDT)
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
Subject: [PATCH 0/6] defconfig: drop RT_GROUP_SCHED=y
Date: Thu, 30 May 2024 19:19:48 +0800
Message-ID: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2134; i=CoelacanthusHex@gmail.com; h=from:subject; bh=YDOl/Eq4EU32U8REOXA1aLCIyDHNFvkWJvOdwbcP7JA=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJlycx/Wu4/Y1tQ+K7zVu27px3o+2Lk2ztb/Ozp zgqUpTP2XztKGVhEONikBVTZBHb+fT1stJHH5bxmsyAmcPKBDKEgYtTACbycj7DP527VsIyk9XS 03fzz7u7fEfWj2MbLsg93Phzuu9s68m3tf0Y/jtvNfKVfy57aprVB27vy3ZWNnJqNsYHao9/4hZ SOJ4dzggA3yZObA==
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

I leave tools/testing/selftests/bpf/config.{s390x,aarch64} untouched because
I don't whether bpf testing requires it.

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383


Celeste Liu (6):
  riscv: defconfig: drop RT_GROUP_SCHED=y
  loongarch: defconfig: drop RT_GROUP_SCHED=y
  mips: defconfig: drop RT_GROUP_SCHED=y from generic/db1xxx/eyeq5
  powerpc: defconfig: drop RT_GROUP_SCHED=y from ppc6xx_defconfig
  sh: defconfig: drop RT_GROUP_SCHED=y from sdk7786/urquell
  arm: defconfig: drop RT_GROUP_SCHED=y from bcm2855/tegra/omap2plus

 arch/arm/configs/bcm2835_defconfig         | 1 -
 arch/arm/configs/omap2plus_defconfig       | 1 -
 arch/arm/configs/tegra_defconfig           | 1 -
 arch/loongarch/configs/loongson3_defconfig | 1 -
 arch/mips/configs/db1xxx_defconfig         | 1 -
 arch/mips/configs/eyeq5_defconfig          | 1 -
 arch/mips/configs/generic_defconfig        | 1 -
 arch/powerpc/configs/ppc6xx_defconfig      | 1 -
 arch/riscv/configs/defconfig               | 1 -
 arch/sh/configs/sdk7786_defconfig          | 1 -
 arch/sh/configs/urquell_defconfig          | 1 -
 11 files changed, 11 deletions(-)

-- 
2.45.1

