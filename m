Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2A1788F5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 21:49:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WIpN7Gtd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RXVsG5D85z3cPd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Aug 2023 05:49:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WIpN7Gtd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=keescook@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RXVqP4jvMz2yWD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Aug 2023 05:48:00 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c0d5b16aacso8552075ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 12:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692992877; x=1693597677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xZtqAYJ4ppqkEN+R4O4ZtZ6kXdu127sDzYMe57mYMk=;
        b=WIpN7GtdgHHNI0jihxfZnFkHTqyYPytDEev+YO0axMIdHoBhkE1ZDIkcj3lER6x3h9
         KT8EWVYPXZcgNUHkhAwwW8oNZPclTfJXn2fnRWqaH5Bnqap3KcP43UnZa5Tc6iX8ajh4
         CRTUkdbYtcf7LA+IUTZb6rdlaEE+hydrVbqZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692992877; x=1693597677;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8xZtqAYJ4ppqkEN+R4O4ZtZ6kXdu127sDzYMe57mYMk=;
        b=a/d+iQ3J4v4qVJvaL8Z78Vdu4MGDuUTvpJyXRVmq9bKuk7YOM836KTimD+nEkD0T+1
         il7GWYbl6QRgcfsiok4FEIN+Fg1BvncdsQf39mastrsL75sPNkIUYgg+RZhdnxyaleuh
         tD8D12JsulQkM95Zd4hNMII+/C/QzkNHum0qMpVnm2Owy/zE4MY8XgXumbmcvdULtSW1
         XUbX/3uM2EW88Y4Jg1Kn5ZY6Is0Gi8SNpw+GeFnF7ym/zsZ0xn9Apzj5D7eu95aJbb9u
         iKmg0CVGLxcYaIwM4EyxixBOTTZufBuEpZC7ZJEkGBAIOXCSApUU9VqYYlBpDbOvgLKp
         LOxw==
X-Gm-Message-State: AOJu0Yy2QtQ9Oa1fAiCo+6/+VHBwbPUVXzFEVvTvt5Rz/A9JobqiabaB
	5XibOW11XloFuYjw/d+kdJHuag==
X-Google-Smtp-Source: AGHT+IHuBqstIn4ctyvzySbdgODWKiqVd1wOM1Y6JdUA0qrieisv+4o4HOc7+l9KIlYqLxu0+IkDXQ==
X-Received: by 2002:a17:902:ab54:b0:1bc:2bd:8523 with SMTP id ij20-20020a170902ab5400b001bc02bd8523mr14780581plb.24.1692992877639;
        Fri, 25 Aug 2023 12:47:57 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s14-20020a170902ea0e00b001bde65894c8sm2106232plg.268.2023.08.25.12.47.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 12:47:56 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 1/2] kbuild: Show Kconfig fragments in "help"
Date: Fri, 25 Aug 2023 12:47:52 -0700
Message-Id: <20230825194755.854823-1-keescook@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230825194329.gonna.911-kees@kernel.org>
References: <20230825194329.gonna.911-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=20034; i=keescook@chromium.org;
 h=from:subject; bh=+bDOlEuFP5uWeaAGz0r58QC6P/RlX/+ID207h4KJeUo=;
 b=owEBbQKS/ZANAwAKAYly9N/cbcAmAcsmYgBk6QVp8uv80cQHcvwJrhW9WQSZ4uwuVsK01VLMw
 E9R4xVIenaJAjMEAAEKAB0WIQSlw/aPIp3WD3I+bhOJcvTf3G3AJgUCZOkFaQAKCRCJcvTf3G3A
 JrQHD/9KY4xXHfEuygyhfTeYriSrEWdIcaj2bUtRILQBSc5/NAKxFt7Ru1cmYShiZVQX6APZjsH
 VrJDheOusA2DBl+4nXZ5cmSlTRW6Xva7/sXe/L7Oa2uiTQuKn/3IqsQT1sv2ZAVnMgnK4S4O9vT
 n847L5gA2MZsHVn+IZrLqor066mgduNIrL1tgjWxwY6Fj5QaGJysRiNkO/qU4mZContCMqTBQD0
 6/u1AclItrtttPSPK2Yx4hycMF6bZlNsyZ0I4Em8DUjcTVM7Ze66cA4IbP6UlXFObutuZe144X2
 86kHnqakesmcHsQDyyhFcohhmk9ekJpNSzmxkD3RmVKDfDEmt7fPtbqDvJdSh2EjG8bryZuEbyi
 U16AO+YoToeyDiyuLZezpalCkroGNoCDTQk7OUKpo1po7oxPkqeB5uumBrPP7dWXbK167wD8c0n
 zjzrx4YnmltWTt1IODa0hEg/8XK9+QUstemHLCHRwusAvmTJqq01dbXc6q/mppe6TbAGZ3z2lI3
 ubp5lfWNd6tYsEl+K4ErhQKHU2tGWS1eSw8T6C2MCyf3g5V42DonMjEwrKZoVDAD9VOl+pWJ+u3
 mW2KVGUsXemFrCdXmTqNdRCcQM/u2Z9kBSSft+/Bgkh7OZnSKGHSI/KtfPZd4eqDU204maVTVfN hrxtWNj0vtIqq+w==
X-Developer-Key: i=keescook@chromium.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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
Cc: linux-s390@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>, Kees Cook <keescook@chromium.org>, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, Nicolas Schier <nicolas@fjasle.eu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Doing a "make help" would show only hard-coded Kconfig targets and
depended on the archhelp target to include ".config" targets. There was
nothing showing global kernel/configs/ targets. Solve this by walking
the wildcard list and include them in the output, using the first comment
line as the help text. Additionally avoid showing duplicate targets when
they exist in both general and arch-specific locations.

Update all Kconfig fragments to include help text and adjust archhelp
targets to avoid redundancy.

Adds the following section to "help" target output:

Configuration fragment targets (for enabling various Kconfig items):
  debug.config         - Debugging for CI systems and finding regressions
  kvm_guest.config     - Bootable as a KVM guest
  nopm.config          - Disable Power Management
  rust.config          - Enable Rust
  tiny-base.config     - Minimal options for tiny systems
  tiny.config          - Size-optimized kernel image
  x86_debug.config     - Debugging options for tip tree testing
  xen.config           - Bootable as a Xen guest
  tiny.config          - x86-specific options for a small kernel image
  xen.config           - x86-specific options for a Xen virtualization guest

Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: x86@kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile                                   |  1 -
 arch/arm/configs/dram_0x00000000.config    |  1 +
 arch/arm/configs/dram_0xc0000000.config    |  1 +
 arch/arm/configs/dram_0xd0000000.config    |  1 +
 arch/arm/configs/lpae.config               |  1 +
 arch/arm64/configs/virt.config             |  1 +
 arch/powerpc/configs/32-bit.config         |  1 +
 arch/powerpc/configs/64-bit.config         |  1 +
 arch/powerpc/configs/85xx-32bit.config     |  1 +
 arch/powerpc/configs/85xx-64bit.config     |  1 +
 arch/powerpc/configs/85xx-hw.config        |  1 +
 arch/powerpc/configs/85xx-smp.config       |  1 +
 arch/powerpc/configs/86xx-hw.config        |  1 +
 arch/powerpc/configs/86xx-smp.config       |  1 +
 arch/powerpc/configs/altivec.config        |  1 +
 arch/powerpc/configs/be.config             |  1 +
 arch/powerpc/configs/book3s_32.config      |  1 +
 arch/powerpc/configs/corenet_base.config   |  1 +
 arch/powerpc/configs/debug.config          |  1 +
 arch/powerpc/configs/disable-werror.config |  1 +
 arch/powerpc/configs/dpaa.config           |  1 +
 arch/powerpc/configs/fsl-emb-nonhw.config  |  1 +
 arch/powerpc/configs/guest.config          |  1 +
 arch/powerpc/configs/le.config             |  1 +
 arch/powerpc/configs/mpc85xx_base.config   |  1 +
 arch/powerpc/configs/mpc86xx_base.config   |  1 +
 arch/powerpc/configs/ppc64le.config        |  1 +
 arch/powerpc/configs/security.config       |  4 +++-
 arch/riscv/configs/32-bit.config           |  1 +
 arch/riscv/configs/64-bit.config           |  1 +
 arch/s390/configs/btf.config               |  1 +
 arch/s390/configs/kasan.config             |  1 +
 arch/x86/Makefile                          |  4 ----
 arch/x86/configs/tiny.config               |  2 ++
 arch/x86/configs/xen.config                |  2 ++
 kernel/configs/debug.config                |  2 ++
 kernel/configs/kvm_guest.config            |  1 +
 kernel/configs/nopm.config                 |  2 ++
 kernel/configs/rust.config                 |  1 +
 kernel/configs/tiny-base.config            |  1 +
 kernel/configs/tiny.config                 |  2 ++
 kernel/configs/x86_debug.config            |  1 +
 kernel/configs/xen.config                  |  2 ++
 scripts/kconfig/Makefile                   | 14 +++++++++++---
 44 files changed, 60 insertions(+), 9 deletions(-)

diff --git a/Makefile b/Makefile
index 4739c21a63e2..91c90ce8e0e3 100644
--- a/Makefile
+++ b/Makefile
@@ -1674,7 +1674,6 @@ help:
 	@echo  '  mrproper	  - Remove all generated files + config + various backup files'
 	@echo  '  distclean	  - mrproper + remove editor backup and patch files'
 	@echo  ''
-	@echo  'Configuration targets:'
 	@$(MAKE) -f $(srctree)/scripts/kconfig/Makefile help
 	@echo  ''
 	@echo  'Other generic targets:'
diff --git a/arch/arm/configs/dram_0x00000000.config b/arch/arm/configs/dram_0x00000000.config
index db96dcb420ce..4de3fde0de9a 100644
--- a/arch/arm/configs/dram_0x00000000.config
+++ b/arch/arm/configs/dram_0x00000000.config
@@ -1 +1,2 @@
+# DRAM base at 0x00000000
 CONFIG_DRAM_BASE=0x00000000
diff --git a/arch/arm/configs/dram_0xc0000000.config b/arch/arm/configs/dram_0xc0000000.config
index 343d5333d973..fdd4c7b1461e 100644
--- a/arch/arm/configs/dram_0xc0000000.config
+++ b/arch/arm/configs/dram_0xc0000000.config
@@ -1 +1,2 @@
+# DRAM base at 0xc0000000
 CONFIG_DRAM_BASE=0xc0000000
diff --git a/arch/arm/configs/dram_0xd0000000.config b/arch/arm/configs/dram_0xd0000000.config
index 61ba7045f8a1..54defdc8d24c 100644
--- a/arch/arm/configs/dram_0xd0000000.config
+++ b/arch/arm/configs/dram_0xd0000000.config
@@ -1 +1,2 @@
+# DRAM base at 0xd0000000
 CONFIG_DRAM_BASE=0xd0000000
diff --git a/arch/arm/configs/lpae.config b/arch/arm/configs/lpae.config
index a6d6f7ab3c01..e8d3cd8f1e4b 100644
--- a/arch/arm/configs/lpae.config
+++ b/arch/arm/configs/lpae.config
@@ -1,2 +1,3 @@
+# Enable Large Physical Address Extension mode
 CONFIG_ARM_LPAE=y
 CONFIG_VMSPLIT_2G=y
diff --git a/arch/arm64/configs/virt.config b/arch/arm64/configs/virt.config
index 6865d54e68f8..83333a9aa1a5 100644
--- a/arch/arm64/configs/virt.config
+++ b/arch/arm64/configs/virt.config
@@ -1,3 +1,4 @@
+# Virtualization guest
 #
 # Base options for platforms
 #
diff --git a/arch/powerpc/configs/32-bit.config b/arch/powerpc/configs/32-bit.config
index ad6546850c68..1a4c93a17007 100644
--- a/arch/powerpc/configs/32-bit.config
+++ b/arch/powerpc/configs/32-bit.config
@@ -1 +1,2 @@
+# Build a 32-bit image
 # CONFIG_PPC64 is not set
diff --git a/arch/powerpc/configs/64-bit.config b/arch/powerpc/configs/64-bit.config
index 0fe6406929e2..cc371309bb0c 100644
--- a/arch/powerpc/configs/64-bit.config
+++ b/arch/powerpc/configs/64-bit.config
@@ -1 +1,2 @@
+# Build a 64-bit image
 CONFIG_PPC64=y
diff --git a/arch/powerpc/configs/85xx-32bit.config b/arch/powerpc/configs/85xx-32bit.config
index 6b8894d727a2..866e77e22762 100644
--- a/arch/powerpc/configs/85xx-32bit.config
+++ b/arch/powerpc/configs/85xx-32bit.config
@@ -1,3 +1,4 @@
+# Build a 32-bit 85xx image
 CONFIG_HIGHMEM=y
 CONFIG_KEXEC=y
 CONFIG_PPC_85xx=y
diff --git a/arch/powerpc/configs/85xx-64bit.config b/arch/powerpc/configs/85xx-64bit.config
index 4aba81222885..cca4151ee889 100644
--- a/arch/powerpc/configs/85xx-64bit.config
+++ b/arch/powerpc/configs/85xx-64bit.config
@@ -1,3 +1,4 @@
+# Build a 64-bit 85xx image
 CONFIG_MATH_EMULATION=y
 CONFIG_MATH_EMULATION_HW_UNIMPLEMENTED=y
 CONFIG_PPC64=y
diff --git a/arch/powerpc/configs/85xx-hw.config b/arch/powerpc/configs/85xx-hw.config
index 524db76f47b7..8a253831ac33 100644
--- a/arch/powerpc/configs/85xx-hw.config
+++ b/arch/powerpc/configs/85xx-hw.config
@@ -1,3 +1,4 @@
+# Base hardware support for 85xx
 CONFIG_AQUANTIA_PHY=y
 CONFIG_AT803X_PHY=y
 CONFIG_ATA=y
diff --git a/arch/powerpc/configs/85xx-smp.config b/arch/powerpc/configs/85xx-smp.config
index 3b4d1e54636d..d3525e71cb2f 100644
--- a/arch/powerpc/configs/85xx-smp.config
+++ b/arch/powerpc/configs/85xx-smp.config
@@ -1,2 +1,3 @@
+# Enable SMP on 85xx
 CONFIG_NR_CPUS=24
 CONFIG_SMP=y
diff --git a/arch/powerpc/configs/86xx-hw.config b/arch/powerpc/configs/86xx-hw.config
index 0cb24b33c88e..7b8d9f9c3c01 100644
--- a/arch/powerpc/configs/86xx-hw.config
+++ b/arch/powerpc/configs/86xx-hw.config
@@ -1,3 +1,4 @@
+# Base hardware support for 86xx
 CONFIG_ATA=y
 CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
diff --git a/arch/powerpc/configs/86xx-smp.config b/arch/powerpc/configs/86xx-smp.config
index 40ac38d3038c..e6cd06a35624 100644
--- a/arch/powerpc/configs/86xx-smp.config
+++ b/arch/powerpc/configs/86xx-smp.config
@@ -1,2 +1,3 @@
+# Enable SMP on 86xx
 CONFIG_NR_CPUS=2
 CONFIG_SMP=y
diff --git a/arch/powerpc/configs/altivec.config b/arch/powerpc/configs/altivec.config
index 58a697cb5a62..1c8eb9b23a7f 100644
--- a/arch/powerpc/configs/altivec.config
+++ b/arch/powerpc/configs/altivec.config
@@ -1 +1,2 @@
+# Enable Altivec support
 CONFIG_ALTIVEC=y
diff --git a/arch/powerpc/configs/be.config b/arch/powerpc/configs/be.config
index c5cdc99a6530..568bba8ea109 100644
--- a/arch/powerpc/configs/be.config
+++ b/arch/powerpc/configs/be.config
@@ -1 +1,2 @@
+# Enable Big Endian mode
 CONFIG_CPU_BIG_ENDIAN=y
diff --git a/arch/powerpc/configs/book3s_32.config b/arch/powerpc/configs/book3s_32.config
index 8721eb7b1294..a2c4ea622141 100644
--- a/arch/powerpc/configs/book3s_32.config
+++ b/arch/powerpc/configs/book3s_32.config
@@ -1,2 +1,3 @@
+# Base support for 32 bits Book3s
 CONFIG_PPC64=n
 CONFIG_PPC_BOOK3S_32=y
diff --git a/arch/powerpc/configs/corenet_base.config b/arch/powerpc/configs/corenet_base.config
index 1c40de1e764b..47bb6e25c90b 100644
--- a/arch/powerpc/configs/corenet_base.config
+++ b/arch/powerpc/configs/corenet_base.config
@@ -1,2 +1,3 @@
+# Base support for corenet
 CONFIG_CORENET_GENERIC=y
 CONFIG_PPC_QEMU_E500=y
diff --git a/arch/powerpc/configs/debug.config b/arch/powerpc/configs/debug.config
index a14ae1f20d60..223b8a2ee8ec 100644
--- a/arch/powerpc/configs/debug.config
+++ b/arch/powerpc/configs/debug.config
@@ -1 +1,2 @@
+# Enable PowerPC specific debug options
 CONFIG_SCOM_DEBUGFS=y
diff --git a/arch/powerpc/configs/disable-werror.config b/arch/powerpc/configs/disable-werror.config
index 6ea12a12432c..76a7847f39ce 100644
--- a/arch/powerpc/configs/disable-werror.config
+++ b/arch/powerpc/configs/disable-werror.config
@@ -1 +1,2 @@
+# Disable -Werror
 CONFIG_PPC_DISABLE_WERROR=y
diff --git a/arch/powerpc/configs/dpaa.config b/arch/powerpc/configs/dpaa.config
index 4ffacafe4036..39e00062978e 100644
--- a/arch/powerpc/configs/dpaa.config
+++ b/arch/powerpc/configs/dpaa.config
@@ -1,3 +1,4 @@
+# Base support for DPPA
 CONFIG_FSL_DPAA=y
 CONFIG_FSL_PAMU=y
 CONFIG_FSL_FMAN=y
diff --git a/arch/powerpc/configs/fsl-emb-nonhw.config b/arch/powerpc/configs/fsl-emb-nonhw.config
index 3009b0efaf34..d1249996cf45 100644
--- a/arch/powerpc/configs/fsl-emb-nonhw.config
+++ b/arch/powerpc/configs/fsl-emb-nonhw.config
@@ -1,3 +1,4 @@
+# Non-hardware options common to 85xx and corenet
 CONFIG_ADFS_FS=m
 CONFIG_AFFS_FS=m
 CONFIG_AUDIT=y
diff --git a/arch/powerpc/configs/guest.config b/arch/powerpc/configs/guest.config
index fece83487215..f04ababbb35a 100644
--- a/arch/powerpc/configs/guest.config
+++ b/arch/powerpc/configs/guest.config
@@ -1,3 +1,4 @@
+# PowerPC specific virtualization guest options
 CONFIG_VIRTIO_BLK=y
 CONFIG_SCSI_VIRTIO=y
 CONFIG_VIRTIO_NET=y
diff --git a/arch/powerpc/configs/le.config b/arch/powerpc/configs/le.config
index ee43fdb3b8f4..bcf657e1d21f 100644
--- a/arch/powerpc/configs/le.config
+++ b/arch/powerpc/configs/le.config
@@ -1 +1,2 @@
+# Enable Little Endian mode
 CONFIG_CPU_LITTLE_ENDIAN=y
diff --git a/arch/powerpc/configs/mpc85xx_base.config b/arch/powerpc/configs/mpc85xx_base.config
index a1e4d72ed39d..8c0ead988283 100644
--- a/arch/powerpc/configs/mpc85xx_base.config
+++ b/arch/powerpc/configs/mpc85xx_base.config
@@ -1,3 +1,4 @@
+# Base mpc85xx support
 CONFIG_MATH_EMULATION=y
 CONFIG_MPC8536_DS=y
 CONFIG_MPC85xx_DS=y
diff --git a/arch/powerpc/configs/mpc86xx_base.config b/arch/powerpc/configs/mpc86xx_base.config
index 632c014b122d..e591967f33d5 100644
--- a/arch/powerpc/configs/mpc86xx_base.config
+++ b/arch/powerpc/configs/mpc86xx_base.config
@@ -1,3 +1,4 @@
+# Base mpc86xx support
 CONFIG_PPC_86xx=y
 CONFIG_GEF_PPC9A=y
 CONFIG_GEF_SBC310=y
diff --git a/arch/powerpc/configs/ppc64le.config b/arch/powerpc/configs/ppc64le.config
index 14dca1062c1b..ac3614cd7926 100644
--- a/arch/powerpc/configs/ppc64le.config
+++ b/arch/powerpc/configs/ppc64le.config
@@ -1,2 +1,3 @@
+# Enable ppc64le mode
 CONFIG_PPC64=y
 CONFIG_CPU_LITTLE_ENDIAN=y
diff --git a/arch/powerpc/configs/security.config b/arch/powerpc/configs/security.config
index 1c91a35c6a73..f47034955d12 100644
--- a/arch/powerpc/configs/security.config
+++ b/arch/powerpc/configs/security.config
@@ -1,3 +1,5 @@
+# Common security options for PowerPC builds
+
 # This is the equivalent of booting with lockdown=integrity
 CONFIG_SECURITY=y
 CONFIG_SECURITYFS=y
@@ -12,4 +14,4 @@ CONFIG_INIT_ON_ALLOC_DEFAULT_ON=y
 
 # UBSAN bounds checking is very cheap and good for hardening
 CONFIG_UBSAN=y
-# CONFIG_UBSAN_MISC is not set
\ No newline at end of file
+# CONFIG_UBSAN_MISC is not set
diff --git a/arch/riscv/configs/32-bit.config b/arch/riscv/configs/32-bit.config
index f6af0f708df4..60dfa2809b19 100644
--- a/arch/riscv/configs/32-bit.config
+++ b/arch/riscv/configs/32-bit.config
@@ -1,3 +1,4 @@
+# Build a 32-bit image
 CONFIG_ARCH_RV32I=y
 CONFIG_32BIT=y
 # CONFIG_PORTABLE is not set
diff --git a/arch/riscv/configs/64-bit.config b/arch/riscv/configs/64-bit.config
index 313edc554d84..31a1ad138944 100644
--- a/arch/riscv/configs/64-bit.config
+++ b/arch/riscv/configs/64-bit.config
@@ -1,2 +1,3 @@
+# Build a 64-bit image
 CONFIG_ARCH_RV64I=y
 CONFIG_64BIT=y
diff --git a/arch/s390/configs/btf.config b/arch/s390/configs/btf.config
index 39227b4511af..c69b1a370990 100644
--- a/arch/s390/configs/btf.config
+++ b/arch/s390/configs/btf.config
@@ -1 +1,2 @@
+# Enable BTF debug info
 CONFIG_DEBUG_INFO_BTF=y
diff --git a/arch/s390/configs/kasan.config b/arch/s390/configs/kasan.config
index 700a8b25c3ff..da2e1f28c13c 100644
--- a/arch/s390/configs/kasan.config
+++ b/arch/s390/configs/kasan.config
@@ -1,3 +1,4 @@
+# Enable KASan for debugging
 CONFIG_KASAN=y
 CONFIG_KASAN_INLINE=y
 CONFIG_KASAN_VMALLOC=y
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index fdc2e3abd615..c4b2a8a19fc8 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -335,9 +335,5 @@ define archhelp
   echo  '			  bzdisk/fdimage*/hdimage/isoimage also accept:'
   echo  '			  FDARGS="..."  arguments for the booted kernel'
   echo  '			  FDINITRD=file initrd for the booted kernel'
-  echo  ''
-  echo  '  kvm_guest.config	- Enable Kconfig items for running this kernel as a KVM guest'
-  echo  '  xen.config		- Enable Kconfig items for running this kernel as a Xen guest'
-  echo  '  x86_debug.config	- Enable tip tree debugging options for testing'
 
 endef
diff --git a/arch/x86/configs/tiny.config b/arch/x86/configs/tiny.config
index 66c9e2aab16c..4b75a11369e3 100644
--- a/arch/x86/configs/tiny.config
+++ b/arch/x86/configs/tiny.config
@@ -1,3 +1,5 @@
+# x86-specific options for a small kernel image
+#
 CONFIG_NOHIGHMEM=y
 # CONFIG_HIGHMEM4G is not set
 # CONFIG_HIGHMEM64G is not set
diff --git a/arch/x86/configs/xen.config b/arch/x86/configs/xen.config
index 581296255b39..46653ec602e0 100644
--- a/arch/x86/configs/xen.config
+++ b/arch/x86/configs/xen.config
@@ -1,3 +1,5 @@
+# x86-specific options for a Xen virtualization guest
+#
 # global x86 required specific stuff
 # On 32-bit HIGHMEM4G is not allowed
 CONFIG_HIGHMEM64G=y
diff --git a/kernel/configs/debug.config b/kernel/configs/debug.config
index e8db8d938661..874afe2cd7c0 100644
--- a/kernel/configs/debug.config
+++ b/kernel/configs/debug.config
@@ -1,3 +1,5 @@
+# Debugging for CI systems and finding regressions
+#
 # The config is based on running daily CI for enterprise Linux distros to
 # seek regressions on linux-next builds on different bare-metal and virtual
 # platforms. It can be used for example,
diff --git a/kernel/configs/kvm_guest.config b/kernel/configs/kvm_guest.config
index 208481d91090..3cc2810147da 100644
--- a/kernel/configs/kvm_guest.config
+++ b/kernel/configs/kvm_guest.config
@@ -1,3 +1,4 @@
+# Bootable as a KVM guest
 CONFIG_NET=y
 CONFIG_NET_CORE=y
 CONFIG_NETDEVICES=y
diff --git a/kernel/configs/nopm.config b/kernel/configs/nopm.config
index 81ff07863576..a377c5914218 100644
--- a/kernel/configs/nopm.config
+++ b/kernel/configs/nopm.config
@@ -1,3 +1,5 @@
+# Disable Power Management
+
 CONFIG_PM=n
 CONFIG_SUSPEND=n
 CONFIG_HIBERNATION=n
diff --git a/kernel/configs/rust.config b/kernel/configs/rust.config
index 38a7c5362c9c..941c69c161ad 100644
--- a/kernel/configs/rust.config
+++ b/kernel/configs/rust.config
@@ -1 +1,2 @@
+# Enable Rust
 CONFIG_RUST=y
diff --git a/kernel/configs/tiny-base.config b/kernel/configs/tiny-base.config
index 2f0e6bf6db2c..ac4d254abc3f 100644
--- a/kernel/configs/tiny-base.config
+++ b/kernel/configs/tiny-base.config
@@ -1 +1,2 @@
+# Minimal options for tiny systems
 CONFIG_EMBEDDED=y
diff --git a/kernel/configs/tiny.config b/kernel/configs/tiny.config
index 00009f7d0835..b27289cdc9c7 100644
--- a/kernel/configs/tiny.config
+++ b/kernel/configs/tiny.config
@@ -1,3 +1,5 @@
+# Size-optimized kernel image
+#
 # CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE is not set
 CONFIG_CC_OPTIMIZE_FOR_SIZE=y
 # CONFIG_KERNEL_GZIP is not set
diff --git a/kernel/configs/x86_debug.config b/kernel/configs/x86_debug.config
index 6fac5b405334..8a1129a1d59a 100644
--- a/kernel/configs/x86_debug.config
+++ b/kernel/configs/x86_debug.config
@@ -1,3 +1,4 @@
+# Debugging options for tip tree testing
 CONFIG_X86_DEBUG_FPU=y
 CONFIG_LOCK_STAT=y
 CONFIG_DEBUG_VM=y
diff --git a/kernel/configs/xen.config b/kernel/configs/xen.config
index 436f806aa1ed..d14880177fd2 100644
--- a/kernel/configs/xen.config
+++ b/kernel/configs/xen.config
@@ -1,3 +1,5 @@
+# Bootable as a Xen guest
+#
 # global stuff - these enable us to allow some
 # of the not so generic stuff below for xen
 CONFIG_PARAVIRT=y
diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index af1c96198f49..370ff6bba78d 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -93,11 +93,11 @@ endif
 %_defconfig: $(obj)/conf
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
 
-configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
+configfiles=$(wildcard $(srctree)/kernel/configs/$(1) $(srctree)/arch/$(SRCARCH)/configs/$(1))
 
 %.config: $(obj)/conf
-	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
-	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
+	$(if $(call configfiles,$@),, $(error No configuration exists for this target on this architecture))
+	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(call configfiles,$@)
 	$(Q)$(MAKE) -f $(srctree)/Makefile olddefconfig
 
 PHONY += tinyconfig
@@ -115,6 +115,7 @@ clean-files += tests/.cache
 
 # Help text used by make help
 help:
+	@echo  'Configuration targets:'
 	@echo  '  config	  - Update current config utilising a line-oriented program'
 	@echo  '  nconfig         - Update current config utilising a ncurses menu based program'
 	@echo  '  menuconfig	  - Update current config utilising a menu based program'
@@ -141,6 +142,13 @@ help:
 	@echo  '                    default value without prompting'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
+	@echo  ''
+	@echo  'Configuration topic targets:'
+	@$(foreach c, $(sort $(notdir $(call configfiles,*.config))), \
+		printf "  %-25s - %s\\n" \
+			$(c) \
+			"$(subst # ,,$(shell grep -m1 '^# ' \
+					$(firstword $(call configfiles,$c))))";)
 
 # ===========================================================================
 # object files used by all kconfig flavours
-- 
2.34.1

