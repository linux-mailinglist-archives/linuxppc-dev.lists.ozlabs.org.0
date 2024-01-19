Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95EE18328DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 12:35:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=hcmaDlys;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGcxm3sZVz3cSV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 22:35:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=hcmaDlys;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGcwt6pv2z2xdh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 22:35:08 +1100 (AEDT)
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7ba903342c2so23771739f.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 03:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705664102; x=1706268902; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xp7UR5FVgwMPuq2WVimakycKIljY+vuuiyqjnbxZrlU=;
        b=hcmaDlys1tqCIWS05QqzU3LvKGX9XSeDrKnQE/wvulRGqV+mPPR02CC85kVOkx/p63
         unL8WVKQlTDKM/EumO13XlFuyPv824y0mtEhfJ7Is4yHHLWUGt37uhulyDTkpNTYMAvd
         pPpP3BT0C/VsCVE2GiZ5jAIZael5mLpcx6dGMIUmoznxcukBi8av7tNTkXtvKaARkjWp
         48md0aEMe/NaFBW9Jh/gz6D0J0xy5Q7EsW6NagGUbKW0EtO/Awt3vr+NM2y0RcjynuEa
         uYg0CuOFirxFhzoWB+N2vuerh+LV8vH8KHXY+nXPksto2QTDj8XJhzbimvJWssvVre8z
         BZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664102; x=1706268902;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xp7UR5FVgwMPuq2WVimakycKIljY+vuuiyqjnbxZrlU=;
        b=kLtL0LHiDknsUYnusNuIwTpGI3LC+t8ZIMghY90v49XKNXfDlCZkTH921JzOPWIqT7
         QHfhzdIljb3T7JRCmSh1KGI7oNaDWrtpG1rRXG3a9gmhRxjksVVaKBfTHFiTbt1cDCKR
         V5uLnXM9dnvz695IV45zCmpCya2vyCtctTdVkGsiHnfI3HYnymoRHybaVh1RYG50bPxT
         ZmWpU41rmD8vnUAwezHt2s4fXqJHCJ8PMuzR0BFcN7wCviaAo9ULP0OXEvf4Xn4ceTCc
         CfyeRkUbo3ZFbfBTDnmCvOYmtUKvinhZfxWnbbGJTxRb0TxykXk1jyXBA73XeLCUkreE
         hejg==
X-Gm-Message-State: AOJu0YxHTrAwbtmtQMNUsWyXYBchueUI3jhinLLkrliqiTufMm7Tn6/z
	LhvgriHeSDAmO+W5EvsA69U2bYqGV/qtVDqlIgjYBr45wBZvTQSUTCfytcLsP3o=
X-Google-Smtp-Source: AGHT+IHhZC2U/hjG0mise1koTMiVKhIOk+6bnofKSdYFddaeNjsDxTHYd5Kh49hCXzNRa8H1IDwPPQ==
X-Received: by 2002:a92:2907:0:b0:361:9315:5356 with SMTP id l7-20020a922907000000b0036193155356mr2449028ilg.10.1705664101928;
        Fri, 19 Jan 2024 03:35:01 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a5-20020a92a305000000b0036062f40c51sm5347302ili.71.2024.01.19.03.34.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:35:01 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v6 0/5] RISC-V SBI debug console extension support
Date: Fri, 19 Jan 2024 17:04:44 +0530
Message-Id: <20240119113449.492152-1-apatel@ventanamicro.com>
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

This series adds support for SBI debug console (DBCN) extension in
Linux RISC-V.

To try these patches with KVM RISC-V, use KVMTOOL from the
riscv_zbx_zicntr_smstateen_condops_v1 branch at:
https://github.com/avpatel/kvmtool.git

These patches can also be found in the riscv_sbi_dbcn_v6 branch at:
https://github.com/avpatel/linux.git

Changes since v5:
 - Rebased on commit 9d1694dc91ce7b80bc96d6d8eaf1a1eca668d847
   ("Merge tag 'for-6.8/block-2024-01-18' of git://git.kernel.dk/linux")
 - Added Acked-by from GregKH in PATCH3 and PATCH4

Changes since v4:
 - Rebased on Linux-6.7-rc2
 - Addressed Drew's comments in PATCH2
 - Improved sbi_debug_console_write/read() to directly take virtual
   address of data so that virtual address to physical address
   conversion can be shared between tty/serial/earlycon-riscv-sbi.c
   and tty/hvc/hvc_riscv_sbi.c
 - Addressed Samuel's comments in PATCH3 and PATCH4

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
 arch/riscv/include/asm/sbi.h            | 10 ++++
 arch/riscv/kernel/sbi.c                 | 66 +++++++++++++++++++++++++
 drivers/tty/hvc/Kconfig                 |  2 +-
 drivers/tty/hvc/hvc_riscv_sbi.c         | 37 +++++++++++---
 drivers/tty/serial/Kconfig              |  2 +-
 drivers/tty/serial/earlycon-riscv-sbi.c | 27 ++++++++--
 7 files changed, 133 insertions(+), 12 deletions(-)

-- 
2.34.1

