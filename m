Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D998D5584
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:39:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TBEfYXY/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1Qj1xNtz3fmT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TBEfYXY/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com; envelope-from=coelacanthushex@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqkLn74B6z2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 21:20:17 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-1f48b825d8cso6851585ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 04:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717068015; x=1717672815; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dH4BG/CKSo6jMt/U3mBL2fbfMm4MpAzh5hyuRszV+t4=;
        b=TBEfYXY/J475NucUNli9hhn/di+WmgAgBPR8t+dZ5U/9JtCW0/NXmGvRtcoPp3ar5Q
         H9yt+bxK6ct2FImgKfEmyXsi60+OuFR9u5PnYclaaAqvOkDWjqkwA4gEvpB5dBaGIA68
         8naN8hBs+h0X6rOdmQ8QAdiBr60VHyo1uffI4XHeZWbG1yNWRvdvJilhwCKaWt9eu9Ux
         SiZEkZIt5/iZQgKZFi0FWGY2MIzcv/gNtNSSNRFPye4BSAaSVl8lkuD6V3EfmOK9KCFi
         sY8Hw1eNAnABEEG0NJ4NacHV5cihM0FZV7NVDS68uoVxhf8+XzGSTVjTplhr9YMkyO9y
         JxGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717068015; x=1717672815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dH4BG/CKSo6jMt/U3mBL2fbfMm4MpAzh5hyuRszV+t4=;
        b=mwKHbMoKj388ofUJBlvs4sq+4Sq9a7HQcWVvOc8wYKph2zYNUJyFF2cgRp1opSx1UG
         nW3oNqn9psG6VuLKAvvjhE5sukvgUZ9sPiQkUb+mMkXs6iZwVPsU+URQ7iusM55G21ai
         IULvltYQyzkprAL55ZnMa0+BO0FeVbQrDA3WfHJUVSaKD1R4AP+Z+6AELtln8gRETXTj
         j2WmCg9ZhzdX9nHY4pvdYVYHj/uBXBCbcZsLEUVm6bqLvLmI8G5Zc04JE4fleT3GK1K/
         BWvucZZArgGHsMY4nznlNbORjipg79eNzbgX7R9HB+bZ0yLuL+/zPXX643gja/kxPZ8/
         yTCg==
X-Forwarded-Encrypted: i=1; AJvYcCV0uqteNvTB76PJBOCxaGO2Tbr4fAmR8gHhUo2B6YnJrr8enXGsP9NCrz/hjjvealo3NV0klsvJlTe8gCS4EZ5ibViCiOyJUuDoRvQNjg==
X-Gm-Message-State: AOJu0YyexsB2iV1eGTGAGQ705E9u37F8iybETyAt3/35DLAqFa1xEWFM
	kU5pk/MRWQ0P4x5IJZYKKSnmdbIXWAWcL87jAR9kADjInzOMgxst
X-Google-Smtp-Source: AGHT+IG8jHeaxjvonyo+8k1nlUsHHhRggP/hzSY+HPghj9Yo3s6jnJryohh0teWJzBXwbeSfn/+xNg==
X-Received: by 2002:a17:902:ef45:b0:1f6:1a91:e744 with SMTP id d9443c01a7336-1f61a91e96fmr18511035ad.21.1717068015407;
        Thu, 30 May 2024 04:20:15 -0700 (PDT)
Received: from localhost ([212.107.28.52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f48bbbcaf0sm81594105ad.48.2024.05.30.04.20.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 04:20:15 -0700 (PDT)
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
Subject: [PATCH 4/6] powerpc: defconfig: drop RT_GROUP_SCHED=y from ppc6xx_defconfig
Date: Thu, 30 May 2024 19:19:52 +0800
Message-ID: <20240530111947.549474-12-CoelacanthusHex@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
References: <20240530111947.549474-8-CoelacanthusHex@gmail.com>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1725; i=CoelacanthusHex@gmail.com; h=from:subject; bh=Y154zJjweZqXiEFejTlLKuxlmlIxiSlX1+quATRaPS0=; b=owJ4nJvAy8zAJfY4pvNJRPo6U8bTakkMaREJNwz83B+K5vRMSbg2N3g2v23ulidmG/9Zikz5N r1Q2vnFpk0dpSwMYlwMsmKKLGI7n75eVvrowzJekxkwc1iZQIYwcHEKwES4nzD89/SoEmo8dO8G n0eO7Aw1cZt90Zb+dnteRPD1pkVFLBEsZmT4umrj9jtvzS78ub1pD3/1w7Mzvl6+8T9jVc6dBXm cuVf72AEUHU7d
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

Commit 6e5f1537833a ("powerpc: Add a 6xx defconfig") said it was copied
from fedore's ppc32 defconfig, but at least since 2015-06-10, Fedora has
dropped this option.[1]

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

systemd also doesn't support it.[2]

[1]: https://bugzilla.redhat.com/show_bug.cgi?id=1229700
[2]: https://github.com/systemd/systemd/issues/13781#issuecomment-549164383

Signed-off-by: Celeste Liu <CoelacanthusHex@gmail.com>
---
 arch/powerpc/configs/ppc6xx_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index 66c7b28d7450..c06344db0eb3 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -12,7 +12,6 @@ CONFIG_TASK_XACCT=y
 CONFIG_TASK_IO_ACCOUNTING=y
 CONFIG_CGROUPS=y
 CONFIG_CGROUP_SCHED=y
-CONFIG_RT_GROUP_SCHED=y
 CONFIG_CGROUP_DEVICE=y
 CONFIG_CGROUP_CPUACCT=y
 CONFIG_USER_NS=y
-- 
2.45.1

