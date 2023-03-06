Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E16196ABAC3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 11:06:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVZ3y57CWz3chx
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 21:06:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=JEqgx1Cl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rivosinc.com (client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com; envelope-from=alexghiti@rivosinc.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rivosinc-com.20210112.gappssmtp.com header.i=@rivosinc-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=JEqgx1Cl;
	dkim-atps=neutral
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVZ330Kqlz3c5D
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 21:05:50 +1100 (AEDT)
Received: by mail-wm1-x32f.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso4805104wmp.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Mar 2023 02:05:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1678097144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OJlcjxfKw8jXMW5N6Ul3wEtOotHt+pEdQ/DGM7xaX10=;
        b=JEqgx1ClmnhOe6ebVyq1YqTIUhSXqSCUzyVnszcOp7awHNdT/xsM+7rlI1qdGO+YiE
         slQ76DmA72N+jgwPU2NK3rXaHYk02KROwM+j5UoVlE6/S84CO+vB/F3BWaDO7xRB2RIG
         of8yuUcFzP4Tre4cToIWTCOQJWBuRErMO44gEIuUiHYSd2Cn7gaTQDsMMDbVeLzUpjB4
         mzd55rdVRoXyW887zexXWxI8zSMxD3E76H/lTdsw61lekuH6TU9lFSZs1SwhjoOVi1uJ
         k2ny/foI2AfuKjMCphWC6FEhY+VrVHZTIxhlexwMTUthb5QjBCQqbA/uzSZiUyHHThiI
         YNPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678097144;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OJlcjxfKw8jXMW5N6Ul3wEtOotHt+pEdQ/DGM7xaX10=;
        b=a+XKSasMTCI23HeK/cJekkUK6bKM3p7FrOY9iF5Y1r0S0+Yvb+2loixDnuyaHc4iao
         Qs2LyK8LnZmRQDHf5LZNorCqW3Sj8nVs2ke29QwafEJD5OYHBcu+eaxHmYcBAnhj3WuU
         Mj6t1MidE9CrdJySPz06ogT+gxeRndhUx6tX2t0VV/WqyqXs3NGFbuflMxkPtaQvJ65Q
         VP2+GN+GqKFeTYJGActWigbuzTg3ubD4MEaB1g3yGaBq8+1eB6kLjIAkHZWCao8S9zo9
         WJu3W1imV1gb0wq0FmSCJfun8dpnTRpsNkxmLTwMqPCuiKf4heBOJvFHdMc0VwPf2riR
         ODCg==
X-Gm-Message-State: AO0yUKXwWBRr8uQEEMQbVDvJvVxh50FI7MLcfcGRpNxX29ZPBs3tB6Wk
	j9VH0dck4O0L9f4FNy8usJzOTg==
X-Google-Smtp-Source: AK7set99ZkofQ6d3rgbVc8vHPZA3jk10S3lFiRC/cDNeG2Kooe0Xt+AMGkkoqceiwIcjL4YA9m24iQ==
X-Received: by 2002:a05:600c:45c8:b0:3ea:ed4d:38fc with SMTP id s8-20020a05600c45c800b003eaed4d38fcmr9291657wmo.31.1678097144359;
        Mon, 06 Mar 2023 02:05:44 -0800 (PST)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id p8-20020a05600c2e8800b003e2066a6339sm9863700wmn.5.2023.03.06.02.05.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 02:05:43 -0800 (PST)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Greg KH <gregkh@linuxfoundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	"David S . Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H . Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v5 00/26] Remove COMMAND_LINE_SIZE from uapi
Date: Mon,  6 Mar 2023 11:04:42 +0100
Message-Id: <20230306100508.1171812-1-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This all came up in the context of increasing COMMAND_LINE_SIZE in the
RISC-V port.  In theory that's a UABI break, as COMMAND_LINE_SIZE is the
maximum length of /proc/cmdline and userspace could staticly rely on
that to be correct.

Usually I wouldn't mess around with changing this sort of thing, but
PowerPC increased it with a5980d064fe2 ("powerpc: Bump COMMAND_LINE_SIZE
to 2048").  There are also a handful of examples of COMMAND_LINE_SIZE
increasing, but they're from before the UAPI split so I'm not quite sure
what that means: e5a6a1c90948 ("powerpc: derive COMMAND_LINE_SIZE from
asm-generic"), 684d2fd48e71 ("[S390] kernel: Append scpdata to kernel
boot command line"), 22242681cff5 ("MIPS: Extend COMMAND_LINE_SIZE"),
and 2b74b85693c7 ("sh: Derive COMMAND_LINE_SIZE from
asm-generic/setup.h.").

It seems to me like COMMAND_LINE_SIZE really just shouldn't have been
part of the uapi to begin with, and userspace should be able to handle
/proc/cmdline of whatever length it turns out to be.  I don't see any
references to COMMAND_LINE_SIZE anywhere but Linux via a quick Google
search, but that's not really enough to consider it unused on my end.

This issue was already considered in s390 and they reached the same
conclusion in commit 622021cd6c56 ("s390: make command line
configurable").

The feedback on the v1 seemed to indicate that COMMAND_LINE_SIZE really
shouldn't be part of uapi, so this now touches all the ports.  I've
tried to split this all out and leave it bisectable, but I haven't
tested it all that aggressively.

Changes since v4 <https://lore.kernel.org/all/20230302093539.372962-1-alexghiti@rivosinc.com/>:
* Add my own SoB as suggested by Geert
* Add riscv patches as suggested by Björn
* Remove "WITH Linux-syscall-note" from new setup.h not in uapi/, as
  suggested by Greg KH, his quoted answer below:

"The "syscall note" makes no sense at all for any files not in the uapi/
directory, so you can remove it just fine as that WITH doesn't mean
anything _UNLESS_ the file is in the uapi directory."

Changes since v3 <https://lore.kernel.org/all/20230214074925.228106-1-alexghiti@rivosinc.com/>:
* Added RB/AB
* Added a mention to commit 622021cd6c56 ("s390: make command line
  configurable") in the cover letter

Changes since v2 <https://lore.kernel.org/all/20221211061358.28035-1-palmer@rivosinc.com/>:
* Fix sh, csky and ia64 builds, as reported by kernel test robot

Changes since v1 <https://lore.kernel.org/all/20210423025545.313965-1-palmer@dabbelt.com/>:
* Touches every arch.

base-commit-tag: next-20230207

Alexandre Ghiti (2):
  riscv: Remove COMMAND_LINE_SIZE from uapi
  riscv: Remove empty <uapi/asm/setup.h>

Palmer Dabbelt (24):
  alpha: Remove COMMAND_LINE_SIZE from uapi
  arm64: Remove COMMAND_LINE_SIZE from uapi
  arm: Remove COMMAND_LINE_SIZE from uapi
  ia64: Remove COMMAND_LINE_SIZE from uapi
  m68k: Remove COMMAND_LINE_SIZE from uapi
  microblaze: Remove COMMAND_LINE_SIZE from uapi
  mips: Remove COMMAND_LINE_SIZE from uapi
  parisc: Remove COMMAND_LINE_SIZE from uapi
  powerpc: Remove COMMAND_LINE_SIZE from uapi
  sparc: Remove COMMAND_LINE_SIZE from uapi
  xtensa: Remove COMMAND_LINE_SIZE from uapi
  asm-generic: Remove COMMAND_LINE_SIZE from uapi
  alpha: Remove empty <uapi/asm/setup.h>
  arc: Remove empty <uapi/asm/setup.h>
  m68k: Remove empty <uapi/asm/setup.h>
  arm64: Remove empty <uapi/asm/setup.h>
  microblaze: Remove empty <uapi/asm/setup.h>
  sparc: Remove empty <uapi/asm/setup.h>
  parisc: Remove empty <uapi/asm/setup.h>
  x86: Remove empty <uapi/asm/setup.h>
  xtensa: Remove empty <uapi/asm/setup.h>
  powerpc: Remove empty <uapi/asm/setup.h>
  mips: Remove empty <uapi/asm/setup.h>
  s390: Remove empty <uapi/asm/setup.h>

 .../admin-guide/kernel-parameters.rst         |  2 +-
 arch/alpha/include/asm/setup.h                |  4 +--
 arch/alpha/include/uapi/asm/setup.h           |  7 -----
 arch/arc/include/asm/setup.h                  |  1 -
 arch/arc/include/uapi/asm/setup.h             |  6 -----
 arch/arm/include/asm/setup.h                  |  1 +
 arch/arm/include/uapi/asm/setup.h             |  2 --
 arch/arm64/include/asm/setup.h                |  3 ++-
 arch/arm64/include/uapi/asm/setup.h           | 27 -------------------
 arch/ia64/include/asm/setup.h                 | 10 +++++++
 arch/ia64/include/uapi/asm/setup.h            |  6 ++---
 arch/loongarch/include/asm/setup.h            |  2 +-
 arch/m68k/include/asm/setup.h                 |  3 +--
 arch/m68k/include/uapi/asm/setup.h            | 17 ------------
 arch/microblaze/include/asm/setup.h           |  2 +-
 arch/microblaze/include/uapi/asm/setup.h      | 20 --------------
 arch/mips/include/asm/setup.h                 |  3 ++-
 arch/mips/include/uapi/asm/setup.h            |  8 ------
 arch/parisc/include/{uapi => }/asm/setup.h    |  2 +-
 arch/powerpc/include/asm/setup.h              |  2 +-
 arch/powerpc/include/uapi/asm/setup.h         |  7 -----
 arch/riscv/include/asm/setup.h                |  7 +++++
 arch/riscv/include/uapi/asm/setup.h           |  8 ------
 arch/s390/include/asm/setup.h                 |  1 -
 arch/s390/include/uapi/asm/setup.h            |  1 -
 arch/sh/include/asm/setup.h                   |  2 +-
 arch/sparc/include/asm/setup.h                |  6 ++++-
 arch/sparc/include/uapi/asm/setup.h           | 16 -----------
 arch/x86/include/asm/setup.h                  |  2 --
 arch/x86/include/uapi/asm/setup.h             |  1 -
 arch/xtensa/include/{uapi => }/asm/setup.h    |  2 +-
 include/asm-generic/Kbuild                    |  1 +
 include/{uapi => }/asm-generic/setup.h        |  0
 include/uapi/asm-generic/Kbuild               |  1 -
 34 files changed, 40 insertions(+), 143 deletions(-)
 delete mode 100644 arch/alpha/include/uapi/asm/setup.h
 delete mode 100644 arch/arc/include/uapi/asm/setup.h
 delete mode 100644 arch/arm64/include/uapi/asm/setup.h
 create mode 100644 arch/ia64/include/asm/setup.h
 delete mode 100644 arch/m68k/include/uapi/asm/setup.h
 delete mode 100644 arch/microblaze/include/uapi/asm/setup.h
 delete mode 100644 arch/mips/include/uapi/asm/setup.h
 rename arch/parisc/include/{uapi => }/asm/setup.h (63%)
 delete mode 100644 arch/powerpc/include/uapi/asm/setup.h
 create mode 100644 arch/riscv/include/asm/setup.h
 delete mode 100644 arch/riscv/include/uapi/asm/setup.h
 delete mode 100644 arch/s390/include/uapi/asm/setup.h
 delete mode 100644 arch/sparc/include/uapi/asm/setup.h
 delete mode 100644 arch/x86/include/uapi/asm/setup.h
 rename arch/xtensa/include/{uapi => }/asm/setup.h (84%)
 rename include/{uapi => }/asm-generic/setup.h (100%)

-- 
2.37.2

