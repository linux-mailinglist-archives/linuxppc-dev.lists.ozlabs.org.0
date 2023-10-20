Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CDC37D0958
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 09:22:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=cu51dN24;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBbdW46jJz3dK7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 18:22:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=cu51dN24;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::32b; helo=mail-ot1-x32b.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBbcf6hwZz3bfK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 18:21:52 +1100 (AEDT)
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6ce37d0f1a9so158995a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 00:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786510; x=1698391310; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vbaUx5tgc13C+fDPGJz++EpIqc5R/EjgaTQRdQ/gzH0=;
        b=cu51dN24MMzrDvU9cp3jbA5L5A+Qgm8G9VRiLPmzHmQedUt8IBdiBge4xNF2VjGy+w
         JZCkjT1ZVjZIsMvjTr+oczCOyx/VXGIOsV65CNEy12Tbx+RJEdbsI9hf71VYmLC9KRpt
         4yeh1WjrkRQYhfz8uJUi39qQMnhT4lMbTmdE8XZgctSi8pm0+lxNEX8KtqE8ClkFtAK9
         HwZIloQbZ2xBm3QobaqZAF86GLtSSaLUO5P4iLkJGY5+GgUge9plk4+wxH4gacMv9BrD
         TtKcBHarTY+q0SIQz9fCCrSd9Zw8NmS2bacmUBlsxkwgpQpY5kurhEXSKNwxRx1VMqWu
         GB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786510; x=1698391310;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbaUx5tgc13C+fDPGJz++EpIqc5R/EjgaTQRdQ/gzH0=;
        b=CnmeWpm0dlu49O6CrdcPb3Ps8k52IFDnR2rkxCSGvwRJgvMbX4E2pZxViVJdyTBmjt
         i44jKPRHwn/+eVvBv1cfAa2B2O6bnLovQD8muvPMDUCFd/IsM7fALbraddYr1/fldMFh
         DAjSs6bSjqsUVONR7zzMWGNqbeapeb+INmqPxzvTd+GHlfnmnp0ZZgKBcF+JI68F4tAM
         JVcWQUSnUellLlsbABVPm7y9MO84wKeQO6rPNe8Vw+yeL7nWt33yWHt5hlfyFIWw3cJf
         wN3Xtf7yxjKd+dn2APUWr10iKzojrydYvPzNBugFGPQVd5veptTP/b9Sr4+oyrUoX7k+
         79Uw==
X-Gm-Message-State: AOJu0Yx5KxO7MaNUbMjOqCKGwZzKR+IXUzbFBTPDqI/CIBEL2wXje0pw
	Eqd9Ry3a7VU0phX7Ynn2QUlLdg==
X-Google-Smtp-Source: AGHT+IGd8XOYNX5Cl6NNnHjukDwjUbSrOdVya8xac9O1HehPftFC2/Zt55vtSezxHy+OiVL/3DWrYQ==
X-Received: by 2002:a05:6358:5927:b0:168:a3b2:945a with SMTP id g39-20020a056358592700b00168a3b2945amr1087904rwf.0.1697786509722;
        Fri, 20 Oct 2023 00:21:49 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:21:49 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 0/9] RISC-V SBI debug console extension support
Date: Fri, 20 Oct 2023 12:51:31 +0530
Message-Id: <20231020072140.900967-1-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-serial@vger.kernel.org, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The SBI v2.0 specification is now frozen. The SBI v2.0 specification defines
SBI debug console (DBCN) extension which replaces the legacy SBI v0.1
functions sbi_console_putchar() and sbi_console_getchar().
(Refer v2.0-rc5 at https://github.com/riscv-non-isa/riscv-sbi-doc/releases)

This series adds support for SBI debug console (DBCN) extension in KVM RISC-V
and Linux RISC-V.

To try these patches with KVM RISC-V, use KVMTOOL from riscv_sbi_dbcn_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_sbi_dbcn_v3 branch at:
https://github.com/avpatel/linux.git

Changes since v2:
 - Rebased on Linux-6.6-rc5
 - Handled page-crossing in PATCH7 of v2 series
 - Addressed Drew's comment in PATCH3 of v2 series
 - Added new PATCH5 to make get-reg-list test aware of SBI DBCN extension

Changes since v1:
 - Remove use of #ifdef from PATCH4 and PATCH5 of the v1 series
 - Improved commit description of PATCH3 in v1 series
 - Introduced new PATCH3 in this series to allow some SBI extensions
   (such as SBI DBCN) do to disabled by default so that older KVM user space
   work fine and newer KVM user space have to explicitly opt-in for emulating
   SBI DBCN.
 - Introduced new PATCH5 in this series which adds inline version of
   sbi_console_getchar() and sbi_console_putchar() for the case where
   CONFIG_RISCV_SBI_V01 is disabled.

Anup Patel (8):
  RISC-V: Add defines for SBI debug console extension
  RISC-V: KVM: Change the SBI specification version to v2.0
  RISC-V: KVM: Allow some SBI extensions to be disabled by default
  RISC-V: KVM: Forward SBI DBCN extension to user-space
  KVM: riscv: selftests: Add SBI DBCN extension to get-reg-list test
  RISC-V: Add stubs for sbi_console_putchar/getchar()
  tty/serial: Add RISC-V SBI debug console based earlycon
  RISC-V: Enable SBI based earlycon support

Atish Patra (1):
  tty: Add SBI debug console support to HVC SBI driver

 arch/riscv/configs/defconfig                  |  1 +
 arch/riscv/configs/rv32_defconfig             |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h         |  7 +-
 arch/riscv/include/asm/sbi.h                  | 12 +++
 arch/riscv/include/uapi/asm/kvm.h             |  1 +
 arch/riscv/kvm/vcpu.c                         |  6 ++
 arch/riscv/kvm/vcpu_sbi.c                     | 61 +++++++-------
 arch/riscv/kvm/vcpu_sbi_replace.c             | 32 ++++++++
 drivers/tty/hvc/Kconfig                       |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c               | 82 +++++++++++++++++--
 drivers/tty/serial/Kconfig                    |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c       | 32 +++++++-
 .../selftests/kvm/riscv/get-reg-list.c        |  2 +
 13 files changed, 198 insertions(+), 43 deletions(-)

-- 
2.34.1

