Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3D07D098B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 09:30:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=cp0mFSbq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBbpF50pMz3vkl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 18:30:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=cp0mFSbq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2001:4860:4864:20::2d; helo=mail-oa1-x2d.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com [IPv6:2001:4860:4864:20::2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBbdP4Fq7z3dWS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 18:22:33 +1100 (AEDT)
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1e9d3cc6e7aso383256fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 00:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697786551; x=1698391351; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DQOTSMVYEAXB96lPNmfxUETXmF1nmywj/hDtdToDI6M=;
        b=cp0mFSbqjnpEDo7U+yXLSfzdSUQn98Hb/xf1Kph18/WaDLlwZEMdyFF08CGfUW45lw
         Ttrmhsd5itcq3ON1DTwSLgijt6tK1/ejZi1jiOPNao6xSOMi629iK/V7joBEXjKv/K6u
         5AnMvUsVjg0Rr3LBWGgNYEX8tzHT8gX3m6b/xgOFvWgGH9ryac1JqT+I6x5uXM0JOdAs
         dibmqisApeL6yju/TsIhmLGa3GVlqCl1O79PCaFVwuE+tRaFFw00+68BVwItoGPuylEN
         T6lq2O0nKqarRoUyicC9NnJt99vh9qaOgcSKH7xciUIwcDeLyObhYK522Z+CCEyjDjWr
         +qqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697786551; x=1698391351;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DQOTSMVYEAXB96lPNmfxUETXmF1nmywj/hDtdToDI6M=;
        b=PCabXfydW+QpHE55ZeQ+OABhZrTX7HCMy8saMixUfYLLbydozKbuM865elY37tmY/L
         sNDFdw6GPiwitFJhLhAyHzA8ciWD2RmV7lCdBkXYXnJ8SJUnf5rtqdz1ZzxwA1nII20D
         L8LICRiBzS+N62x3MCle7YrnmoDPtKnQIRyesFuPlXxYkR9QQtCyi1AjSxY37aNJK0/R
         +J15eUIxfywVPcY3+JDkqhjTimYMgModGhVvB7qJed88XNHL5QgNZwVGsUDg34obbTdL
         il3vgx4WL3I77Hsa/GGcxIMiA7l+zF8tzUGb40H0x95SfL1kIIOULmw0A6PzLcHeCgYo
         kw6w==
X-Gm-Message-State: AOJu0YxiO0N5AYyYAsQUvifNUa4IuIJYhQBerrPLwt3AqqDBdLPmBSEb
	SFtV/bpnTDEGazcKvYoGFxO3qA==
X-Google-Smtp-Source: AGHT+IHVpVTtGUUCbE9QtkhDvgB6PWIuexjVRbTOQpUxtFm1xcTHF7ruZ9rqINTCV8Ep/hVGmPBCuA==
X-Received: by 2002:a05:6871:3316:b0:1e9:9215:3987 with SMTP id nf22-20020a056871331600b001e992153987mr1427367oac.16.1697786550612;
        Fri, 20 Oct 2023 00:22:30 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([171.76.83.81])
        by smtp.gmail.com with ESMTPSA id v12-20020a63f20c000000b005b32d6b4f2fsm828204pgh.81.2023.10.20.00.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 00:22:30 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v3 9/9] RISC-V: Enable SBI based earlycon support
Date: Fri, 20 Oct 2023 12:51:40 +0530
Message-Id: <20231020072140.900967-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231020072140.900967-1-apatel@ventanamicro.com>
References: <20231020072140.900967-1-apatel@ventanamicro.com>
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

Let us enable SBI based earlycon support in defconfigs for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig      | 1 +
 arch/riscv/configs/rv32_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index ab86ec3b9eab..f82700da0056 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -132,6 +132,7 @@ CONFIG_SERIAL_8250_CONSOLE=y
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

