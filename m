Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82B298328F9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 12:40:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=kbPuz4fn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGd2R33x6z3dRJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 22:39:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=kbPuz4fn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2607:f8b0:4864:20::12a; helo=mail-il1-x12a.google.com; envelope-from=apatel@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com [IPv6:2607:f8b0:4864:20::12a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGcxJ6Zbyz30g6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 22:35:32 +1100 (AEDT)
Received: by mail-il1-x12a.google.com with SMTP id e9e14a558f8ab-3608bd50cbeso3161505ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 03:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1705664129; x=1706268929; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9bsP20n9g/LbbgzyTFqfc2H9X3ZVkLkHm6HS5kmWZpw=;
        b=kbPuz4fnp5KNk/ICSzsu2DPWZTRTNLxDYXMfchYUaCz+NbGG9P2JiZ7RV8e4Y1WfCP
         ilLhhCmlherWuidhkqxjKtgj/s3MVV4cdaC3GQ5jmz1Pm9pkzKouuBHZ4AEkv4ppcXXS
         JvrEsZUeEh6T8clIeMJP02qCng9GdTY1nAncSw1VfvRUkt9dR3gFs9oiP52cOiQDEp4p
         0qN7fSV2LjT3VTV9BYAfr7LKngkRSnjFqUdonPwOGXVlcel8uGbs+3Y+mTPGnIoLh0QZ
         5jH3p4vHUbALSdNmiRk4EYraYuSR+ICPRBCIgZFJlko2jU+kaNUhJzrmzG3rDS+qujT5
         jufA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705664129; x=1706268929;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9bsP20n9g/LbbgzyTFqfc2H9X3ZVkLkHm6HS5kmWZpw=;
        b=fs4y0bFGajXSoyiEJUr9Gl1RRXfzIyH03wkRd28GEN/5UfDHUjLllWiNAAb3VqDbVX
         8btVZtj8D0pjV6F72AJI3KsjVYvwel0sgka8ljwg2T/0B5VhmrRXTqmJAngNDk8YEL0K
         lKdksARSNbyyQW6MYU+XsW2LJ/I9UdvFOXWmJle7DXwaW8V/EM2qNqIwkhnWliJWsSjp
         GIq7JhJpfmTKuYu2E/dRu6usqb2apSuE2ZerDyqAsdf5WZ5wEGexdCOTHJUKaroeCfLD
         LBlIYd8i5dA1IPMBSyueM+igwD0BKkQhCdxl/cXlWxPlCPJNuL+Zxe+Jy9tC4T1YwxIi
         6xeA==
X-Gm-Message-State: AOJu0YwisS3lu+CMJu67Eq/Gfrt9MpIEHrH/nkUAY67G5B/2LKKrKimC
	Os6VQtRDK7AMvt05+I+5nb46Xcx21tzfULG05K87h7H8m5pvybIdHDXoiPFeFaCbZmFIXMB55Fg
	J
X-Google-Smtp-Source: AGHT+IGm7KnfG4/vcA0JrRBkZfX6RoyXH3aaqdl/Wta7fnqjAcw1zMCsGIqUf/hTovepwm0OqOzh9A==
X-Received: by 2002:a92:7310:0:b0:360:973b:844b with SMTP id o16-20020a927310000000b00360973b844bmr2368211ilc.11.1705664129602;
        Fri, 19 Jan 2024 03:35:29 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id a5-20020a92a305000000b0036062f40c51sm5347302ili.71.2024.01.19.03.35.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 03:35:29 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH v6 5/5] RISC-V: Enable SBI based earlycon support
Date: Fri, 19 Jan 2024 17:04:49 +0530
Message-Id: <20240119113449.492152-6-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119113449.492152-1-apatel@ventanamicro.com>
References: <20240119113449.492152-1-apatel@ventanamicro.com>
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

Let us enable SBI based earlycon support in defconfig for both RV32
and RV64 so that "earlycon=sbi" can be used again.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

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
-- 
2.34.1

