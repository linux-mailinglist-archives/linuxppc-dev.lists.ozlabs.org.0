Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E03A9316FA0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 20:07:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbTlw3rc2zDwk6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 06:07:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12c;
 helo=mail-lf1-x12c.google.com; envelope-from=anders.roxell@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=tdvdvopN; dkim-atps=neutral
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbTjW3qjQzDwj5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 06:05:15 +1100 (AEDT)
Received: by mail-lf1-x12c.google.com with SMTP id v24so4464589lfr.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 11:05:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AUZZJPcdsZ4nXWPrdOtnVl3JVvpEylf0g26f/cJWrEs=;
 b=tdvdvopNJa/CNXblKmh3zsQ94QYlwXgnTc3W2rw3GKaWji6T1d806HNk5jlGGQsE0d
 Z3BzOj8nXe/DC40o+NAgzKZEhnAAmT+MybnSvLG2UiVRby+UfPnUmHXxsNbU7/THaivB
 IJok8KZuYBmdglvY9AXbeqg2N79bWTTZAvbuVrJ/jApGhi9wm0hMJLi3kDsrycTWwkH+
 KeQqcA/kzuUA1N4LUQGmsMhnfPeZKVkijrSX1wnSYD7t5hFI06+M7TAv4qerUeyHPFAm
 84uVebInrFDi44XE03vgB3Mbxtn8cTyAwnIJLm2UKF/hTrvWBymtDXcbDo+kC+Za5e0s
 IaxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AUZZJPcdsZ4nXWPrdOtnVl3JVvpEylf0g26f/cJWrEs=;
 b=TvR/inVAk+6acJ8cud9Z1GTvLgL6Ihzhg9vUqVYP8j00IOMRK5UcueWObuE5Hw9ggc
 E//czF0yAC+tfE/Na0nByVRCMrbYTuWLpOvGULIh0GDGFuNGYGlhtU9Dyng8RlWc7S5h
 PzTuBtOVoA7+ZPBzxUKbug7IsQ6JRl9P7OXJojSriu/IHJeZr1R5hp7M/Bct0IP19oDU
 MqTUf0CXZaz9AAVc/UZU0EqnnLDiVlUyN5Juu/NoY+nzYi57wb/d3R/2JVpDLMhEUrth
 Yi9c68cNl+u/DKyaJISbxgYEo4hRAMsdUxLloOiw4rBZTZVzhz1MdpapsJav/N7+WAQ5
 ctCw==
X-Gm-Message-State: AOAM532eKL1jEnikGa6+EZtY4/p/KhzhRrzj430itbsy6nezjUIlyHcn
 K418JuFwdP337ztQ4mhyA1PJ9Q==
X-Google-Smtp-Source: ABdhPJx+dGCB5Wuq+4IRhfx1FPsG7SMl/CyZGsYTUvPGsDbtVXH2raDj8I9KusXJvxhAT7I/ejZXMg==
X-Received: by 2002:a19:4843:: with SMTP id v64mr2309414lfa.178.1612983910472; 
 Wed, 10 Feb 2021 11:05:10 -0800 (PST)
Received: from localhost (c-9b28e555.07-21-73746f28.bbcust.telenor.se.
 [85.229.40.155])
 by smtp.gmail.com with ESMTPSA id s16sm390025ljc.121.2021.02.10.11.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Feb 2021 11:05:09 -0800 (PST)
From: Anders Roxell <anders.roxell@linaro.org>
To: soc@kernel.org
Subject: [PATCH] arm64: defconfig: enable modern virtio pci device
Date: Wed, 10 Feb 2021 20:05:06 +0100
Message-Id: <20210210190506.1923684-1-anders.roxell@linaro.org>
X-Mailer: git-send-email 2.30.0
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
Cc: chris@zankel.net, tsbogend@alpha.franken.de,
 Anders Roxell <anders.roxell@linaro.org>, mst@redhat.com, arnd@arndb.de,
 linuxppc-dev@lists.ozlabs.org, catalin.marinas@arm.com,
 linux-xtensa@linux-xtensa.org, paul.walmsley@sifive.com,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 linux@armlinux.org.uk, jcmvbkbc@gmail.com, aou@eecs.berkeley.edu,
 palmer@dabbelt.com, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, will@kernel.org, jasowang@redhat.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since patch ("virtio-pci: introduce modern device module") got added it
is not possible to boot a defconfig kernel in qemu with a virtio pci
device.  Add CONFIG_VIRTIO_PCI_MODERN=y fragment makes the kernel able
to boot.

Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 arch/arm/configs/multi_v7_defconfig         | 1 +
 arch/arm64/configs/defconfig                | 1 +
 arch/mips/configs/loongson3_defconfig       | 1 +
 arch/mips/configs/malta_kvm_guest_defconfig | 1 +
 arch/powerpc/configs/guest.config           | 1 +
 arch/riscv/configs/defconfig                | 1 +
 arch/riscv/configs/rv32_defconfig           | 1 +
 arch/xtensa/configs/virt_defconfig          | 1 +
 kernel/configs/kvm_guest.config             | 1 +
 9 files changed, 9 insertions(+)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 3823da605430..02297ed49b20 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -972,6 +972,7 @@ CONFIG_DW_DMAC=y
 CONFIG_RCAR_DMAC=y
 CONFIG_RENESAS_USB_DMAC=m
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_STAGING=y
 CONFIG_MFD_NVEC=y
diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 83c28da85834..8334e9cb4608 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -910,6 +910,7 @@ CONFIG_TI_K3_UDMA_GLUE_LAYER=y
 CONFIG_VFIO=y
 CONFIG_VFIO_PCI=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_XEN_GNTDEV=y
diff --git a/arch/mips/configs/loongson3_defconfig b/arch/mips/configs/loongson3_defconfig
index 0e79f81217bc..ac5f2dcbffb1 100644
--- a/arch/mips/configs/loongson3_defconfig
+++ b/arch/mips/configs/loongson3_defconfig
@@ -324,6 +324,7 @@ CONFIG_RTC_DRV_CMOS=y
 CONFIG_RTC_DRV_GOLDFISH=y
 CONFIG_DMADEVICES=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=m
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
diff --git a/arch/mips/configs/malta_kvm_guest_defconfig b/arch/mips/configs/malta_kvm_guest_defconfig
index 9185e0a0aa45..043633cdb406 100644
--- a/arch/mips/configs/malta_kvm_guest_defconfig
+++ b/arch/mips/configs/malta_kvm_guest_defconfig
@@ -332,6 +332,7 @@ CONFIG_RTC_DRV_CMOS=y
 CONFIG_UIO=m
 CONFIG_UIO_CIF=m
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_MMIO=y
 CONFIG_EXT2_FS=y
diff --git a/arch/powerpc/configs/guest.config b/arch/powerpc/configs/guest.config
index 209f58515d88..fbff632c8633 100644
--- a/arch/powerpc/configs/guest.config
+++ b/arch/powerpc/configs/guest.config
@@ -5,6 +5,7 @@ CONFIG_NET_FAILOVER=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_VIRTIO=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_KVM_GUEST=y
 CONFIG_EPAPR_PARAVIRT=y
 CONFIG_VIRTIO_BALLOON=y
diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 8c3d1e451703..b7fa7a1a0c6d 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -85,6 +85,7 @@ CONFIG_MMC=y
 CONFIG_MMC_SPI=y
 CONFIG_RTC_CLASS=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
diff --git a/arch/riscv/configs/rv32_defconfig b/arch/riscv/configs/rv32_defconfig
index 2c2cda6cc1c5..68296101fa06 100644
--- a/arch/riscv/configs/rv32_defconfig
+++ b/arch/riscv/configs/rv32_defconfig
@@ -84,6 +84,7 @@ CONFIG_MMC=y
 CONFIG_MMC_SPI=y
 CONFIG_RTC_CLASS=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
diff --git a/arch/xtensa/configs/virt_defconfig b/arch/xtensa/configs/virt_defconfig
index 6d1387dfa96f..7fad1c2454fd 100644
--- a/arch/xtensa/configs/virt_defconfig
+++ b/arch/xtensa/configs/virt_defconfig
@@ -74,6 +74,7 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
 CONFIG_LOGO=y
 # CONFIG_USB_SUPPORT is not set
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_INPUT=y
 # CONFIG_IOMMU_SUPPORT is not set
 CONFIG_EXT3_FS=y
diff --git a/kernel/configs/kvm_guest.config b/kernel/configs/kvm_guest.config
index 208481d91090..8dea6df20006 100644
--- a/kernel/configs/kvm_guest.config
+++ b/kernel/configs/kvm_guest.config
@@ -22,6 +22,7 @@ CONFIG_S390_GUEST=y
 CONFIG_VIRTIO=y
 CONFIG_VIRTIO_MENU=y
 CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_PCI_MODERN=y
 CONFIG_VIRTIO_BLK=y
 CONFIG_VIRTIO_CONSOLE=y
 CONFIG_VIRTIO_NET=y
-- 
2.30.0

