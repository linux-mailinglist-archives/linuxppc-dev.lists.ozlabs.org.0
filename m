Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BBD37EFD83
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 04:40:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=noT+bkZz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXKKh09Glz3dK9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 14:40:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=noT+bkZz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXKJm5c69z30gn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 14:39:34 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-27ddc1b1652so2200846a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 19:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278771; x=1700883571; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Xk65QbdRKZdLNSQh19GKuOPbc61/SWIMytvbu8dUYc=;
        b=noT+bkZz9Uv/BqedNmezY/XMscGklvxNDs+ZvEeahGgbbWmuxA56i/gQvbWBTUeI+y
         IgYsHyjvfoJkwHtb/BJ86YqRH3SxJqPf+4auyXEuqxFZPmy75KIZ4CHi7Rz7I9QIB0IM
         8vtWHqJgMRGq39kv6kRkmpXua3Cysc8+MsrLqtB6At2xiQ/lStTeNs5LdQ23lazdnj4O
         TeMNg/2LiLQ33NUYQjG/ublrXhl0Fa52o17CiKK5Py/NHyT5JZMSEQLX82Mi2N0bHo2n
         bOlFoHavMHd//4hN8NG674aJvlUUYeuSnP2evQQNpL9syEqsPKFfjxSId8GxqxwQh+03
         /ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278771; x=1700883571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Xk65QbdRKZdLNSQh19GKuOPbc61/SWIMytvbu8dUYc=;
        b=hoSiEgq1DmNcHB1Kk+kH2mXTGseYYOJXwYQw+UJeAnlkeuxLH+gplinrFQS4MeiuVU
         y+tW0qV32/s2YPAr3seLocjrSwSn2xQnmWdDzMMjiINUxgI3cla/DxjSa0YMRB3TClj+
         6SZSynlfyakG+H+3/FtaqOSKhosba7dZzSQBW/LQbfxj2JZ0RYCBqOLt3H4fBA0HKmkm
         +CoGkUyQNPVgL/j/1bXhmou+4vSOn6g8kD6mu7FtPWKLfl5vdpdYMy3JIXr0cp5eoERx
         DmuffnebJvZ8OcVRNKcxhHUm53qi66tXJxuiifna6+UxOP5DiSw+lLW1w8oK45mcRQCR
         09PA==
X-Gm-Message-State: AOJu0YwKBksIvBwDVw2+sH6RDMkzA/mZ2eZOv3MLZkTkMCQVVRjgYrH5
	Y3zgItaoYUejJhYBck4mrgNlMw==
X-Google-Smtp-Source: AGHT+IEdivzV5yM9VLUbAmX/fPwvXT56J4szG18kUoyADgqsU5ZolAzZbNQxZHHnYCkaszm6OKc0Yw==
X-Received: by 2002:a17:90b:4a49:b0:280:4ec6:97e9 with SMTP id lb9-20020a17090b4a4900b002804ec697e9mr1593141pjb.30.1700278770582;
        Fri, 17 Nov 2023 19:39:30 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:29 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v4 0/5] RISC-V SBI debug console extension support
Date: Sat, 18 Nov 2023 09:08:54 +0530
Message-Id: <20231118033859.726692-1-apatel@ventanamicro.com>
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Andrew Jones <ajones@ventanamicro.com>
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

These patches can also be found in the riscv_sbi_dbcn_v4 branch at:
https://github.com/avpatel/linux.git

Changes since v3:
 - Rebased on Linux-6.7-rc1
 - Dropped PATCH1 to PATCH5 of v3 series since these were merged through
   KVM RISC-V tree for Linux-6.7
 - Used proper error code in PATCH1
 - Added new PATCH2 which add common SBI debug console helper functions
 - Updated PATCH3 and PATCH4 to use SBI debug console helper functions

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

Anup Patel (4):
  RISC-V: Add stubs for sbi_console_putchar/getchar()
  RISC-V: Add SBI debug console helper routines
  tty/serial: Add RISC-V SBI debug console based earlycon
  RISC-V: Enable SBI based earlycon support

Atish Patra (1):
  tty: Add SBI debug console support to HVC SBI driver

 arch/riscv/configs/defconfig            |  1 +
 arch/riscv/configs/rv32_defconfig       |  1 +
 arch/riscv/include/asm/sbi.h            | 10 +++++
 arch/riscv/kernel/sbi.c                 | 43 ++++++++++++++++++
 drivers/tty/hvc/Kconfig                 |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c         | 59 ++++++++++++++++++++++---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 24 ++++++++--
 8 files changed, 129 insertions(+), 13 deletions(-)

-- 
2.34.1

