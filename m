Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D62F7C022F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 19:06:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=GPDwhoEB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S4j3Q1GCFz3cB0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Oct 2023 04:06:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=GPDwhoEB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S4j2S6KpDz30NN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Oct 2023 04:05:18 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1c9c5a1b87bso2814915ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 10:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1696957514; x=1697562314; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WPT4Fkg+ojgLC0XZKWvgq9PlzRbEr2TYZf8y6H1Pt5Y=;
        b=GPDwhoEBvr84WpDQ77NJaGzvMqoXO9qYnMSy3fAsnHu9AE7ca8W6pRYpTO0DfxYXMg
         TP0ORMQvBF3CkDzVx0yQ5GYyCKH9F11RJ+2mHaaMHPlEhGBvo99IVLYOjzaQZo5zDny2
         ivnGD9PyVeWBAHfjxdDW+QLw8/JRgr/LlhzHErbT8iYNnPujOz6RMaMBuydfB60e8z1G
         UhTNS4cAHs4t3dYYIBq14K+bkirlRtnj1+wjXT1KCGlK/obZC/EaVri0E2b42kIPJdm0
         V0WhuCurkI8tJQLJvmkJYl1w77LjsSSYjdim/bjg59MGBhogA87fxYVNBJss+9TyEiLw
         XJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696957514; x=1697562314;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WPT4Fkg+ojgLC0XZKWvgq9PlzRbEr2TYZf8y6H1Pt5Y=;
        b=KaMpPVW+tDAi98v7mjveQ7XNfHKHMkc7IWmblfjARK20tBCIh5xxmQnzsqsqIZt3If
         DxyCRJ3oIkmDG7qVqTc3plK4lqTEJkFT637lvEdpV6M3EYgZ1Qpxwq9+QSlo8NyfINMM
         +SGC2vUkz7MBUJ1YGeDXEHNU4nLVgTQGlcNN9WpSS07IeOkspeNkUtmqLXu/TRZAKVLx
         ERbUjL6zIzu5oxADV4+k6fhdlnlfidLf/on/HcKslTG9d760dsVBl90veNa1KNibAoIm
         J8HGNMcrL/0vntodq6I8qBhG9SyLneA01IISNBF73M3XKtbi8Tv6MCBvXM18CxxRTRcQ
         wZaA==
X-Gm-Message-State: AOJu0YyN9gRrrdYsnrKa5xsuUE6d1/uoC80FaS0DEofeVJAQaePL+SBY
	WOu7uDt+9ZhQeVpM3SQ8K74/fw==
X-Google-Smtp-Source: AGHT+IFym/OscZjdiaKnZudFAiUw/7t8pHDcgobeGgruKdPyihzD8VGIHQ5tw7zHoHGLJR6WzQgjAQ==
X-Received: by 2002:a17:902:eb46:b0:1c9:c5a6:1d00 with SMTP id i6-20020a170902eb4600b001c9c5a61d00mr895380pli.1.1696957513651;
        Tue, 10 Oct 2023 10:05:13 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w19-20020a1709027b9300b001b89536974bsm11979868pll.202.2023.10.10.10.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 10:05:12 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 0/6] RISC-V SBI debug console extension support
Date: Tue, 10 Oct 2023 22:34:57 +0530
Message-Id: <20231010170503.657189-1-apatel@ventanamicro.com>
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

This series adds support for SBI debug console extension in KVM RISC-V
and Linux RISC-V.

To try these patches with KVM RISC-V, use KVMTOOL from riscv_sbi_dbcn_v1
branch at: https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_sbi_dbcn_v1 branch at:
https://github.com/avpatel/linux.git

Anup Patel (5):
  RISC-V: Add defines for SBI debug console extension
  RISC-V: KVM: Change the SBI specification version to v2.0
  RISC-V: KVM: Forward SBI DBCN extension to user-space
  tty/serial: Add RISC-V SBI debug console based earlycon
  RISC-V: Enable SBI based earlycon support

Atish Patra (1):
  tty: Add SBI debug console support to HVC SBI driver

 arch/riscv/configs/defconfig            |  1 +
 arch/riscv/configs/rv32_defconfig       |  1 +
 arch/riscv/include/asm/kvm_vcpu_sbi.h   |  3 +-
 arch/riscv/include/asm/sbi.h            |  7 +++
 arch/riscv/include/uapi/asm/kvm.h       |  1 +
 arch/riscv/kvm/vcpu_sbi.c               |  4 ++
 arch/riscv/kvm/vcpu_sbi_replace.c       | 31 ++++++++++
 drivers/tty/hvc/Kconfig                 |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c         | 80 ++++++++++++++++++++++---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 35 +++++++++--
 11 files changed, 153 insertions(+), 14 deletions(-)

-- 
2.34.1

