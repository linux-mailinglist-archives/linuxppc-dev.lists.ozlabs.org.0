Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC767EFD8D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 04:44:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=HrG4flpy;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXKQT3pBPz3vn4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 14:44:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=HrG4flpy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXKK42mq2z3d9t
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 14:39:52 +1100 (AEDT)
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-357ccaf982eso9334585ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Nov 2023 19:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700278789; x=1700883589; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwuJDohRQ3aqDyqXIkqqX8SciM39GRJg3jYARQ14u9s=;
        b=HrG4flpyc0CtAM8ZGjTYesUDGowXkZsOn4r4I0yYDqU9s5FVbmEp810XP1qNPvlEMu
         Vww9T4IjKNELt99p3k33zZ861RqhVsphmgrxHQS7IncM5aFqrlKwCrX9LMx42cMKKps4
         DQDfVR0gXBNTxnRz9B4NpWomPfxEVfqrEcQg+hI01fmMVjW07LhM3pC3HPlpNeN8jm0O
         Iv/suCbVsHGr2d6FJvEcq1U0kY4qpL9kQ3qgo6YLQ955O5vPcjZVwv4beCMXPDn0zsur
         52jZ9jUrTqqOktKyNXvOoQmiY9i0F1yB/2G/UxZMKqB0kVSSTNSzm+bYggt91ff7sDca
         NH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700278789; x=1700883589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwuJDohRQ3aqDyqXIkqqX8SciM39GRJg3jYARQ14u9s=;
        b=WzP1h3k1p1blfLBvYKUQiCij32De0T45+oTTAFTtrLq2w4n9qs4lZ5mZBIWo7v9QWN
         UwNdSquhIpyxA+ufFM79/YQIeJqk9QirOsoSRCORD/hr+CMcZ01mG89BE+SGlDwVGjTl
         epTUQ+nR5KVhd+moEA0vLm7672VSTHMlR2Xj2p7XE8dqkH1pYLUYMXd28OrRmw9vK+E0
         nnUHtThi6nVVxXxk1SSJqyv+Dx8Fx3iwroVbnTmuURcJLdf4aIjTyUwcViA9CYETVOzA
         lvlfccbjdlBmnmT977IPk/IiBKFYfj2XmN0Nk2nIFZ0rvMoRPiUaURdOTinzGcnaK0FE
         nWpQ==
X-Gm-Message-State: AOJu0YyP67SlsoDj22kLxCW7OHsk2f+zg/10eEDUCGvlGwVSxU2zRckv
	tFDIAfkflHxHZmwCiNW4eL0I9w==
X-Google-Smtp-Source: AGHT+IHOlKnIVZ4ksof0LCT4ATUyA4aQHrNLe3GwQ2oPH5iU/GU5vmFy/egl6dy1iF7ul/LCCaVvEg==
X-Received: by 2002:a05:6e02:58f:b0:357:4a63:2ad2 with SMTP id c15-20020a056e02058f00b003574a632ad2mr1554139ils.21.1700278788781;
        Fri, 17 Nov 2023 19:39:48 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.80.108])
        by smtp.gmail.com with ESMTPSA id cz8-20020a17090ad44800b00280fcbbe774sm2053823pjb.10.2023.11.17.19.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Nov 2023 19:39:48 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v4 5/5] RISC-V: Enable SBI based earlycon support
Date: Sat, 18 Nov 2023 09:08:59 +0530
Message-Id: <20231118033859.726692-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118033859.726692-1-apatel@ventanamicro.com>
References: <20231118033859.726692-1-apatel@ventanamicro.com>
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

Let us enable SBI based earlycon support in defconfigs for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 905881282a7c..eaf34e871e30 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -149,6 +149,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_8250_DW=y
 CONFIG_SERIAL_OF_PLATFORM=y
 CONFIG_SERIAL_SH_SCI=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 89b601e253a6..5721af39afd1 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -66,6 +66,7 @@ CONFIG_INPUT_MOUSEDEV=y
 CONFIG_SERIAL_8250=y
 CONFIG_SERIAL_8250_CONSOLE=y
 CONFIG_SERIAL_OF_PLATFORM=y
+CONFIG_SERIAL_EARLYCON_RISCV_SBI=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_HW_RANDOM=y
 CONFIG_HW_RANDOM_VIRTIO=y
-- 
2.34.1

