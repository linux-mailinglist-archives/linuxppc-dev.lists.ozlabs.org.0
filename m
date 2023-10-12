Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7357C6474
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 07:16:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=pdCxuH0g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5dCH4PY7z3d26
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 16:16:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=pdCxuH0g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5dBM3d1lz3bYc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 16:15:22 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c9b70b9656so4364155ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 22:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697087719; x=1697692519; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xYp5d01yjoieOqk/RkEsuV4xU8mIT2wOo0WVBK9XVOw=;
        b=pdCxuH0gjO/6aX7JlSMtWrUot8WNKQbooOP0t/+41CMGfAm8yzfF6nRld6i+moZcce
         56IJExCxeZsTDzD7EPhT8ZMVl7X42ctX+HPvErQuavH4ib8rLooe5J9jRM3lDOlcU6ln
         OihuvxduoaVBTp9xpPZbe+sVrS8/z8H+wJSrmEJSZRRjd9zAKAvQg9FVEWcFV+zqjybx
         j1/zYTP1++QsUeBdDvCrLDvrbsWch+54Bf26iAIDNCHHP6swD972kScdalFz0uqvKhi0
         JCmwvSEjKQ4Gn8woM5EkVx6sBGEHe/X0jRfgORyftSQdwG5ZW5E6PWZNfGLh9QLBVVTS
         zW9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697087719; x=1697692519;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xYp5d01yjoieOqk/RkEsuV4xU8mIT2wOo0WVBK9XVOw=;
        b=IGSO2gWOdGcnx9yvHsA1CSW3FYk5TpRUeZEXE9v2o8MCpa2EX0C5CgC1NA6sDhX9/x
         oHIdfOkTRIn5DU3UhmhnlN6/zyjLY1SVvDNnhi2M/d9Zzv7PVlHBBI8XIebv2ckwj+Da
         zA9GcY6CRWEgAhV6VX6PfgnnkA240k/TDp6QEzRYALy/B65emdajhkpgWIkaeM6vslf1
         HEZpHikjODoEZs2cB0c0Vg8dmuGsTdE//qUB+nfqZEqxteQpyLL7Tr6Y47wPOjZ5El/P
         9CuZKrIdsZHZVG1W4W+iqzPhlilelrw4cUu+jWQUbYJdDqYfehY2n+gaxOim3Qh6Fet8
         jBvw==
X-Gm-Message-State: AOJu0YwI03G27LDoQMGnUHub3FZvQ5K79cxE+dIsIIz49DnYjAwFy49J
	SfJVg4fBmt86/BChdgD+r7Ntjg==
X-Google-Smtp-Source: AGHT+IHEPFFUqt3pliIbieg/aaMtAbi3pZkt/8nzFWa9PAcsbNguDQ6TUJOXLaRnVEd017jWXQ44gg==
X-Received: by 2002:a17:902:e888:b0:1c7:37e2:13fe with SMTP id w8-20020a170902e88800b001c737e213femr22891127plg.2.1697087719126;
        Wed, 11 Oct 2023 22:15:19 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([106.51.83.242])
        by smtp.gmail.com with ESMTPSA id s18-20020a17090330d200b001b9d95945afsm851309plc.155.2023.10.11.22.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 22:15:18 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v2 0/8] RISC-V SBI debug console extension support
Date: Thu, 12 Oct 2023 10:45:01 +0530
Message-Id: <20231012051509.738750-1-apatel@ventanamicro.com>
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

These patches can also be found in the riscv_sbi_dbcn_v2 branch at:
https://github.com/avpatel/linux.git

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

Anup Patel (7):
  RISC-V: Add defines for SBI debug console extension
  RISC-V: KVM: Change the SBI specification version to v2.0
  RISC-V: KVM: Allow some SBI extensions to be disabled by default
  RISC-V: KVM: Forward SBI DBCN extension to user-space
  RISC-V: Add inline version of sbi_console_putchar/getchar() functions
  tty/serial: Add RISC-V SBI debug console based earlycon
  RISC-V: Enable SBI based earlycon support

Atish Patra (1):
  tty: Add SBI debug console support to HVC SBI driver

 arch/riscv/configs/defconfig            |  1 +
 arch/riscv/configs/rv32_defconfig       |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h   |  7 ++-
 arch/riscv/include/asm/sbi.h            | 12 ++++
 arch/riscv/include/uapi/asm/kvm.h       |  1 +
 arch/riscv/kvm/vcpu.c                   |  6 ++
 arch/riscv/kvm/vcpu_sbi.c               | 49 +++++++++-------
 arch/riscv/kvm/vcpu_sbi_replace.c       | 32 +++++++++++
 drivers/tty/hvc/Kconfig                 |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c         | 76 ++++++++++++++++++++++---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 32 +++++++++--
 12 files changed, 188 insertions(+), 33 deletions(-)

-- 
2.34.1

