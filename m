Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DC088D557D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:38:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FQifG8B4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1P03KVHz3fyD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:38:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FQifG8B4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com; envelope-from=coelacanthushex@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqkLj6VZ2z2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 21:20:13 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id ca18e2360f4ac-7e97d38584fso28030239f.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068007; x=1717672807; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yMLg5P8GKaZTkgjzD8R/QqO0sSQDVLJa6m0BArXde/g=;
        b=FQifG8B4EQaihKnu6AhnzRmwnX/W93XsLNC8RK8amFA5rg2vwve0NuAU6FBQeVfNj8
         YUUlTyC7t701+t7uJ+KgOHyfTtmTDTn9kqmvQLNr430RNeTsr1xCIJDbMo7nvAACMQWv
         EjsT4lywC4tNZrtjw9tvdP/pdDURgi61h5WLM2kNDvIuCZ+L8dn/7rsme8Vvue4Czo0j
         D28V1FK+gQ+uEPoisMbcRtrCkUSkdJZLUZX7NCQxZxNY2qr81oVkcBHjHwzwyprAD7+F
         4+nj36/T6BUnXCZElGXLrFtFppCOxy7Rvk3Go6b7tYqIwkZeopwC3WgJbjjZWdcKv/aJ
         PU9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068007; x=1717672807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yMLg5P8GKaZTkgjzD8R/QqO0sSQDVLJa6m0BArXde/g=;
        b=LZvsAwnGNEm6IepZzehbulZmsu6BkeXJk9WMZ0ir32N1iPSrNd8xFCqrvMn7qwHkzR
         Q+Uv5jy1QwUkyOhjnwaoS+FHsbCARReWbYdGewbOp/hpd1KieSxGiw1QtrR1R+CRxJyR
         P3zhZTndhwQjMqxDDPbAcgPmpwhAAKKg5eajzM5RSzwQVGZdsLPxbVcE+1sghSPeOkRr
         RRMiLho+F2/JhyXpFL/slC14QXC4j0cqd18OMWNeJdxq7dlwWAKsvAKs6Siv9iZk+rQQ
         o8+zSNFmEWVGtuBSNyMRzLIRiyqyAHASRcnqPYS4iEpFYBLBTuBTZTOLNxrgr4V8lQQ2
         zT6w==
X-Forwarded-Encrypted: i=1; AJvYcCVyN5y76yACJV4yRvrY22cr/gciOoDPc0xni7jre8R+PRRNeodCb0SWm5WoLmwXMqqM4uPSOnwvAvZjMJJUA5AQ5ABwjHC0fwG6fhHG7Q==
X-Gm-Message-State: AOJu0YxE5QglbxBtgjFKvNR2++7GQyiIan4BjOeoTOhxqYse7bcwoDXq
	I4d7eoH+xSvgzmf1K+7KRlfSkFkZ/pYaDi7GUCUNi/L064Il6him
X-Google-Smtp-Source: AGHT+IFxgfGuk4WvYoxrChp+N4lQDR0Si7/7Vlzjuk7wpmJrGZ30ttsy31urG1IDYNTmVV6Zs/i1hQ==
X-Received: by 2002:a05:6e02:b27:b0:374:6472:d923 with SMTP id e9e14a558f8ab-3747deba9demr23632145ab.0.1717068007160;
        Thu, 30 May 2024 04:20:07 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6822198a7e3sm10550697a12.34.2024.05.30.04.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:06 -0700 (PDT)
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
Subject: [PATCH 1/6] riscv: defconfig: drop RT_GROUP_SCHED=y
Date: Thu, 30 May 2024 19:19:49 +0800
Message-ID: <20240530111947.549474-9-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=CoelacanthusHex@gmail.com; h=from:subject; bh=FEk4ZichD7CqTRAppezRH+4H9dhTF4GYT9EUDpibpAE=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJ16rP/zv78xijc+SbFuluq7KoDVxfdGb3ntmwV 4b5b/rJ87kdpSwMYlwMsmKKLGI7n75eVvrowzJekxkwc1iZQIYwcHEKwERiuRj+FyWbH5kg7nGC bXudX8b5SVrfDn7ffNohZmU9l4bwcat4U4b/tfNS9VctvP7+NI+h5NrpGpcrHCr9as+x9XPYVM9 LOc3JBwDwgkw9
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

Commit ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
introduced it because of Docker, but Docker has removed this requirement
since [1] (2023-04-19).

For cgroup v1, if turned on, and there's any cgroup in the "cpu" hierarchy it
needs an RT budget assigned, otherwise the processes in it will not be able to
get RT at all. The problem with RT group scheduling is that it requires the
budget assigned but there's no way we could assign a default budget, since the
values to assign are both upper and lower time limits, are absolute, and need to
be sum up to < 1 for each individal cgroup. That means we cannot really come up
with values that would work by default in the general case.[2]

For cgroup v2, it's almost unusable as well. If it turned on, the cpu controller
can only be enabled when all RT processes are in the root cgroup. But it will
lose the benefits of cgroup v2 if all RT process were placed in the same cgroup.

Red Hat, Gentoo, Arch Linux and Debian all disable it. systemd also doesn't
support it.[3]

[1]: https://github.com/moby/moby/commit/005150ed69c540fb0b5323e0f2208608c1204536
[2]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[3]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Fixes: ba6cfef057e1 ("riscv: enable Docker requirements in defconfig")
Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/riscv/configs/defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 12dc8c73a8ac..de85c3ab261e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -9,7 +9,6 @@ CONFIG_CGROUPS=y
 CONFIG_MEMCG=y
 CONFIG_CGROUP_SCHED=y
 CONFIG_CFS_BANDWIDTH=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_PIDS=y
 CONFIG_CGROUP_FREEZER=y
 CONFIG_CGROUP_HUGETLB=y
-- 
2.45.1

