Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D6E78241E8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 13:38:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=F7QIjgQr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T5R2m6b1kz3cZ1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jan 2024 23:38:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ventanamicro.com header.i=@ventanamicro.com header.a=rsa-sha256 header.s=google header.b=F7QIjgQr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ventanamicro.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=ajones@ventanamicro.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T5R1t0xlqz3bpk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jan 2024 23:37:36 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a28aa47bd15so54755766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Jan 2024 04:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704371848; x=1704976648; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=b0YjTQ6DAdt/2c3mL0l6eIgN8OTkE75G1dsO8pPOomQ=;
        b=F7QIjgQrWZMl7M//BSoJlXvjFneAXjL8yxtGh3Kq+xg22cVAe53xDs6p38/q2SdJe5
         8gIWkr8U+KB3a6xviXjtPKimNUbTBk2kHru0U2+RmYARgApTEvnpUM0clNfTuN/VLuGY
         RgIbmJry53eHNyrhoVOpXmliYwVm/GICR+jozXBh2+KMG1aHixbmNd12nxSzpUG19klc
         te8WW49zjvj8pchYv1vdejTxvs6dAwUGrbvLgYQemh8YbeqPExqsmJok/WrAyr/9CEi2
         VlXE4kMnsrcArdWyWkfoSG4bQeoKSIS+AmqYpvFEbhkHuAF1yJem4VzeQ3Mt27t1UdMp
         tQ7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704371848; x=1704976648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=b0YjTQ6DAdt/2c3mL0l6eIgN8OTkE75G1dsO8pPOomQ=;
        b=Y4Ph5VBrOP619+Ug1OnPSgRQ199Du/HHDXVxy+2AVeK+6JdfxodFo4l1m8ggqpuz/t
         1tZHMzTqoGOti6uWZTRIiZTPO+11Q6/Tg6yThQ3GqRMkn5jof3y1kIxQhKVWjNOYVzRY
         BnrhsA8WSVuGQ+phOYVPbg4GvFDoZZRc/HC3R0D4lpUl0WgYvUa0rHHarL1fyWsGIWVZ
         Z4q95RxUHf3R0CGcbCuZ38bidto2InUnrpClXFbafgq/a6idPqQVZexX5UnvBMdT3PY+
         Px2nsRzrmhgMwOAxNBS+r/Pybg+zJO8XMFhYqUhLTUgESjZUjIjpn/+h/UkF4rjicsbF
         YETA==
X-Gm-Message-State: AOJu0YzjrjiM1AtIjbP3lKJnyVPqgxC0e3oF9HOwJ3NSY0kg89YzUEP8
	xVZPA/8KARQZLijhG6O6zVwXDQECpzN5Xg==
X-Google-Smtp-Source: AGHT+IGuKrfQ1OvlUk+ZEceVcHij9CYGgADtdAxpjxUb2xwkyYhUHJZIQ7mR+ZBuQE0/8F7kowQcIw==
X-Received: by 2002:a17:906:fa90:b0:a26:b71e:f75 with SMTP id lt16-20020a170906fa9000b00a26b71e0f75mr299486ejb.5.1704371848691;
        Thu, 04 Jan 2024 04:37:28 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id gh33-20020a1709073c2100b00a26b3f29f3dsm12649478ejc.43.2024.01.04.04.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jan 2024 04:37:28 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH -fixes v2] RISC-V: KVM: Require HAVE_KVM
Date: Thu,  4 Jan 2024 13:37:28 +0100
Message-ID: <20240104123727.76987-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-type: text/plain
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
Cc: sfr@canb.auug.org.au, aou@eecs.berkeley.edu, alex@ghiti.fr, anup@brainfault.org, rdunlap@infradead.org, npiggin@gmail.com, palmer@dabbelt.com, paul.walmsley@sifive.com, atishp@atishpatra.org, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM requires EVENTFD, which is selected by HAVE_KVM. Other KVM
supporting architectures select HAVE_KVM and then their KVM
Kconfigs ensure its there with a depends on HAVE_KVM. Make RISCV
consistent with that approach which fixes configs which have KVM
but not EVENTFD, as was discovered with a randconfig test.

Fixes: 99cdc6c18c2d ("RISC-V: Add initial skeletal KVM support")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Closes: https://lore.kernel.org/all/44907c6b-c5bd-4e4a-a921-e4d3825539d8@infradead.org/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---

v2:
 - Added Fixes tag and -fixes prefix [Alexandre/Anup]

 arch/riscv/Kconfig     | 1 +
 arch/riscv/kvm/Kconfig | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a935a5f736b9..daba06a3b76f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -128,6 +128,7 @@ config RISCV
 	select HAVE_KPROBES if !XIP_KERNEL
 	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
 	select HAVE_KRETPROBES if !XIP_KERNEL
+	select HAVE_KVM
 	# https://github.com/ClangBuiltLinux/linux/issues/1881
 	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
 	select HAVE_MOVE_PMD
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index 1fd76aee3b71..36fa8ec9e5ba 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -19,7 +19,7 @@ if VIRTUALIZATION
 
 config KVM
 	tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
-	depends on RISCV_SBI && MMU
+	depends on HAVE_KVM && RISCV_SBI && MMU
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_IRQ_ROUTING
 	select HAVE_KVM_MSI
-- 
2.43.0

