Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1596A8356D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 17:37:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 462zKL3tQrzDqfD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 01:37:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linaro.org
 (client-ip=2607:f8b0:4864:20::b44; helo=mail-yb1-xb44.google.com;
 envelope-from=leo.yan@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.b="llzpCKvf"; 
 dkim-atps=neutral
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 462qs81tFdzDr27
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2019 20:00:56 +1000 (AEST)
Received: by mail-yb1-xb44.google.com with SMTP id q5so18281487ybp.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2019 03:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=ss7tfuNN9gph1p4XOsDIlLKrMAe3sezcu2lcCyG5PrA=;
 b=llzpCKvfTJg9zx4WGbK3W8ELlbZszVisTWmKs2WgL7/QVGUzVblcBslqpxo6sHvB/2
 XTxuH6yt7Pqho2/Dk3XQRm5ssQG4b0J5+VL1WLv3DvEuC4iWmLQBmcnIeEYbnhvQAS3d
 OaDIu3c8mjZ3MaC87uEx1ICI53UwFJn//mcEAXmhA1PI1HBLTuGVvr28BI74d7+vKFK8
 g8I+2D4tta/rMVSZZQJJDzvZToRr0JlJ0xd4r32m0Z7Y3QGdloZvUkRz4PwUMa4SBbTJ
 ReTDwAvbKrd4coRI8s0r8TqxVgUjPfsoTdlSM5oAL4w7ndmTwVVuizbrsn36eLs160LV
 Gc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=ss7tfuNN9gph1p4XOsDIlLKrMAe3sezcu2lcCyG5PrA=;
 b=PR11Shup7oOWy/h2c7oQRUSG6c+2iP9GQ/qq7VLb7y5rQ4CRyMXL1D8whCscycto39
 aLVZA3OhaH06am2Jwf7tDYwDW9cvxp6nfOA+BUBLh8Gl4zp0zF4Q0sMqQnr3HSL3aB0f
 GVOTWpwYkbFyG/5P39zbEmudpAZ/TQYzdWjLTQgorjN0/zMTGZWc7+laB/ot8BK/LqAH
 KXEHgxDFlbv79uDMjNtxi3Kr5MJdb6Qm2tQY5pkrFRIot2cN+cvDkxKhb8Z2TtmdBADP
 MoTcSEfVic/OmXnfjA2iWKgETHgh0aX1K7XFTquy1ImE2i+Cn0Mpo3/sZb3G2daVm4DU
 qTSg==
X-Gm-Message-State: APjAAAVLvWyllYx65uliB+G815+vNojEq2s8sy1FHCtbN5tZ/fQprITB
 b+FnJiQjYX/HYzWb4F6UooodOw==
X-Google-Smtp-Source: APXvYqzW3wsw6yhTMacboTuQrkHBN1nGm4i1ke3WRJqGdu22UVLlanKhTbvJJsUeyrKaTw/x/WIwAA==
X-Received: by 2002:a25:2005:: with SMTP id g5mr1786698ybg.410.1565085653130; 
 Tue, 06 Aug 2019 03:00:53 -0700 (PDT)
Received: from localhost.localdomain (li1322-146.members.linode.com.
 [45.79.223.146])
 by smtp.gmail.com with ESMTPSA id h12sm18316685ywm.91.2019.08.06.03.00.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 03:00:51 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: Russell King <linux@armlinux.org.uk>, Oleg Nesterov <oleg@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <kafai@fb.com>,
 Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arch@vger.kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org,
 clang-built-linux@googlegroups.com, Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH v2 0/3] arm/arm64: Add support for function error injection
Date: Tue,  6 Aug 2019 18:00:12 +0800
Message-Id: <20190806100015.11256-1-leo.yan@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Wed, 07 Aug 2019 01:35:31 +1000
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
Cc: Leo Yan <leo.yan@linaro.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This small patch set is to add support for function error injection;
this can be used to eanble more advanced debugging feature, e.g.
CONFIG_BPF_KPROBE_OVERRIDE.

The patch 01/03 is to consolidate the function definition which can be
suared cross architectures, patches 02,03/03 are used for enabling
function error injection on arm64 and arm architecture respectively.

I tested on arm64 platform Juno-r2 and one of my laptop with x86
architecture with below steps; I don't test for Arm architecture so
only pass compilation.

- Enable kernel configuration:
  CONFIG_BPF_KPROBE_OVERRIDE
  CONFIG_BTRFS_FS
  CONFIG_BPF_EVENTS=y
  CONFIG_KPROBES=y
  CONFIG_KPROBE_EVENTS=y
  CONFIG_BPF_KPROBE_OVERRIDE=y

- Build samples/bpf on with Debian rootFS:
  # cd $kernel
  # make headers_install
  # make samples/bpf/ LLC=llc-7 CLANG=clang-7

- Run the sample tracex7:
  # dd if=/dev/zero of=testfile.img bs=1M seek=1000 count=1
  # DEVICE=$(losetup --show -f testfile.img)
  # mkfs.btrfs -f $DEVICE
  # ./tracex7 testfile.img
  [ 1975.211781] BTRFS error (device (efault)): open_ctree failed
  mount: /mnt/linux-kernel/linux-cs-dev/samples/bpf/tmpmnt: mount(2) system call failed: Cannot allocate memory.

Changes from v1:
* Consolidated the function definition into asm-generic header (Will);
* Used APIs to access pt_regs elements (Will);
* Fixed typos in the comments (Will).


Leo Yan (3):
  error-injection: Consolidate override function definition
  arm64: Add support for function error injection
  arm: Add support for function error injection

 arch/arm/Kconfig                           |  1 +
 arch/arm/include/asm/ptrace.h              |  5 +++++
 arch/arm/lib/Makefile                      |  2 ++
 arch/arm/lib/error-inject.c                | 19 +++++++++++++++++++
 arch/arm64/Kconfig                         |  1 +
 arch/arm64/include/asm/ptrace.h            |  5 +++++
 arch/arm64/lib/Makefile                    |  2 ++
 arch/arm64/lib/error-inject.c              | 18 ++++++++++++++++++
 arch/powerpc/include/asm/error-injection.h | 13 -------------
 arch/x86/include/asm/error-injection.h     | 13 -------------
 include/asm-generic/error-injection.h      |  6 ++++++
 include/linux/error-injection.h            |  6 +++---
 12 files changed, 62 insertions(+), 29 deletions(-)
 create mode 100644 arch/arm/lib/error-inject.c
 create mode 100644 arch/arm64/lib/error-inject.c
 delete mode 100644 arch/powerpc/include/asm/error-injection.h
 delete mode 100644 arch/x86/include/asm/error-injection.h

-- 
2.17.1

