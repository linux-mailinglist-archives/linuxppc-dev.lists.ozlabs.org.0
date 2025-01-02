Return-Path: <linuxppc-dev+bounces-4583-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F35C19FFE6C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2025 19:34:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPFgS0dw0z2yN3;
	Fri,  3 Jan 2025 05:32:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735842756;
	cv=none; b=Uw9PRK6DMhmggXLLnznhGamdjr8quaoBDXjCN0/i9Ep4+exj7u4TTLjcf/vFERc8ez2Rv8sPe4Y4mJPqiE5TexjCXhNPBo9cXZzKMqu9NZKaJhGuAoxb6u/ooqyjbWdEBeqc8Jal2ALu3PC2EzMAA75juNabOG08BgGKFnYlp+gKGEIQ64oRlWdZCPdvNuRR1tSE+EB1NQW80HTe/t/Ff5plOGkI0zzM55g5rIh2q67ZZthsPH3Oxfo8Dr5GytOdqYqfRLui88OqBCqx6X0cO/lJzfw2UDujUXd9bz/6GTVwYh0TCqvHdRkzCftngPPyW4x5L01FGATjiVsJCKW6gA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735842756; c=relaxed/relaxed;
	bh=zEgPd5vK1ktieceQDR6Wp9d5CFDGNozrd8aYHZ9NCHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Zdmw0nAldKegHhzh84zos6WLY5ZimvyuKLqKwPsl3aZUlVWH5VDUJ0j52sn+LogYMrmzMEeEiboEopIq/0kFGgPRrfYy8PrHLGrJLZADKgsQqrLhyi6KK6OTlsBMxJkCeVlL9DqrixF3Wr63HLL7SIsTxL8G8uJLxH8DYETYEcVZYEzdlELaxrZX0dPhouTecg4OrrDDb59hh7pEtzRd01wZBlNhj4ejp0hzjojZVbCXCnF8tO9ctE7Kf9At3RipTu7ax2ES9NIgOB3Sd/Cd12lgazqnky3+FEFFJhkw+0miNdYOW6XW8Y84Li4VEn/d6+Eghspj2pg+uwPCauWAnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gaKoDQH1; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gaKoDQH1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPFgL32sXz306d
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 05:32:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7E90D5C5DC9;
	Thu,  2 Jan 2025 18:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B950C4CEF0;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735842742;
	bh=U8NBq+45lYclznlQ/hxQVS/dtqBtJm90/lN2DnIlpvQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gaKoDQH1+oHCuzOPxBHvqm4377EhIJwiYMiYqwtTt3q94cT/ZP9KXg/TCt2Q25uVO
	 o7tOXXKI/+xm8rOxchl7SF5rIz0WqCVuvMIg4YW3FgRL5wZxMkZyEisQruEmy1ATYB
	 rCTRLdSUOdD5IHVBf7nYN62jsUC6QSLs24Mjy7puiDSbdXapOt+jjco7Rt6z//VbjN
	 DhCJSN4YOdB3ffrNqjgtmGe0jCKbtnB78KA7Ss27K7aH6E+J+PNcW5ktlxL+zDyvTm
	 zkQBdXIdNkxJMwwqBwoaFOqw63h+lrVVn/VyYdlP/c+DysoaFpiZ9OO4cfOaz8B0dp
	 qejfbK4mnahvg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13E56E77188;
	Thu,  2 Jan 2025 18:32:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Thu, 02 Jan 2025 19:31:49 +0100
Subject: [PATCH 08/19] powerpc: boot: Enable FIT image generation
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250102-mpc83xx-v1-8-86f78ba2a7af@posteo.net>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
In-Reply-To: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735842735; l=2597;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=gwgToc0kzqB+BXy5IXnLTTOxYYECLTdDBZaVu6gPiyM=;
 b=Zf345/Cls673vfLPBl8FI50FAUmAxpsp1Fvxct7loBav9XCC+T9a69RO9whzma99z7p8gIrp/
 E1AIylSmAzrBvcSfhIjrrIb6Bww/v+hPd4kyWILMBuuSU4x7NQybIIk
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-3.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,PDS_OTHER_BAD_TLD,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

The Flat Image Tree (FIT) format combines a kernel, a set of
devicetrees, and optionally additional resources into a single file that
can be loaded by a bootloader such as U-Boot. Generating a FIT image as
part of the kernel build reduces the need for additional build scripts,
and produces a single boot image without falling back to one of the
many legacy methods implemented in arch/powerpc/boot/Makefile, which
would require additional changes for arch/powerpc/boot for each board.

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---

Checkpatch warns:

  arch/powerpc/boot/Makefile:364: WARNING: Possible repeated word: 'Image'

for this line:

  image-y += Image image.fit

This is bogus and can be ignored.
---
 arch/powerpc/Makefile      |  3 ++-
 arch/powerpc/boot/Makefile | 11 +++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f3804103c56ccfdb16289468397ccaea71bf721e..693c82c06072fb0529288736efee460e375b2476 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -225,7 +225,7 @@ KBUILD_CFLAGS += $(cflags-y)
 all: zImage
 
 # With make 3.82 we cannot mix normal and wildcard targets
-BOOT_TARGETS1 := zImage zImage.initrd uImage
+BOOT_TARGETS1 := zImage zImage.initrd uImage image.fit
 BOOT_TARGETS2 := zImage% dtbImage% treeImage.% cuImage.% simpleImage.% uImage.%
 
 PHONY += $(BOOT_TARGETS1) $(BOOT_TARGETS2)
@@ -237,6 +237,7 @@ $(BOOT_TARGETS1): vmlinux
 $(BOOT_TARGETS2): vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $(patsubst %,$(boot)/%,$@)
 
+image.fit: dtbs
 
 PHONY += bootwrapper_install
 bootwrapper_install:
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index 1ff6ad4f6cd27755ea7bfe5b02af4a47ca33cea7..e0c62ab1cc5af99e43f6639be11bf1c64d352db8 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -360,6 +360,9 @@ ifdef CONFIG_PPC32
 image-$(CONFIG_PPC_PMAC)	+= zImage.coff zImage.miboot
 endif
 
+# FIT support (generic)
+image-y += Image image.fit
+
 # Allow extra targets to be added to the defconfig
 image-y	+= $(CONFIG_EXTRA_TARGETS)
 
@@ -398,6 +401,14 @@ $(obj)/dtbImage.%: vmlinux $(wrapperbits) $(obj)/dts/%.dtb FORCE
 $(obj)/vmlinux.strip: vmlinux
 	$(STRIP) -s -R .comment $< -o $@
 
+OBJCOPYFLAGS += -O binary
+
+$(obj)/Image: vmlinux FORCE
+	$(call if_changed,objcopy)
+
+$(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
+	$(call if_changed,fit)
+
 $(obj)/uImage: vmlinux $(wrapperbits) FORCE
 	$(call if_changed,wrap,uboot)
 

-- 
2.45.2



