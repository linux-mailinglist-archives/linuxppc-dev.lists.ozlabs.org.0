Return-Path: <linuxppc-dev+bounces-2167-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F7D99B911
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 12:30:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRGpL5qYNz2yDt;
	Sun, 13 Oct 2024 21:30:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728815418;
	cv=none; b=n8XdSPACbjOEPQuRJmi0WOKo72WFCM3Uim2WubRc45UAliYHU6vWXYKFoALP7KP1yrgwA3PGLGVC619BNYYz3WmdH83T4Xp5bH8L3NhNn6GCHycDhvUEW8L/o9BCnot/NPJqlQj5jV5GwVr5yIDMVNGBVvTu5xWEsKSgnJUqBYbDe4R/TYY//kIgcTeNQUdTkLYaI83QRaFFbYhleTmVYg0TZ0FAbxyC2vlSnQEkOxYqow8sAVR+tOJutqWuyp+zccNnwQZ2AQC0CGzKhl2wHI5LSmDsPtDoBysic3SrMVV8odUPsWW+A4ztoUur3LFqgZaZd9iCOqPAw40bCp9duA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728815418; c=relaxed/relaxed;
	bh=u6uFyaKRv3BmnZZDPlHYo524qgFP2hSlqqCx46gFfRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DFFydiLaY9Qoi+4Q+M/8QdNmuWdGJwECF0t8f4bTP+tkhiEN9Wl0t7QI1bZL5VJmF/AeKX+zsti19AUE4fYRQ2ySIoJVW2S/n+5ubf29hCRB3O4MATbYJbD2+ka8VaN0gdp9mKc3N0nzTrxtu3mE+IwxzKWh00tVVfrjBpwP3yrHoWo5uRypbf4ASnmmegOglf+6y1ibb6WgJqiHZ65Cj9Dq/FzPzAGq+fGDc/0cGH3E3jREbHA6/Y70FSgEJgE68Kf+rw0XVR3hhQoKZ8veyROFk7YZN4hLinlUlQJnfePNMU9tI0myjm7tj1CJkjmVgGqoVSIAUnJusfV3sscbEA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HRIjcfXe; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=HRIjcfXe;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRGpJ2n8Dz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Oct 2024 21:30:16 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1728815409;
	bh=u6uFyaKRv3BmnZZDPlHYo524qgFP2hSlqqCx46gFfRU=;
	h=From:To:Cc:Subject:Date:From;
	b=HRIjcfXeiP4J2GxUlv1IYwWafHcFBZGwJ9OQXsrICFFcz4mp83nfNokNqciS7Lbk2
	 g0GWvsokhW9l4SHswd4Zfv+Of7EiQgukcenZUW4BT+XuIow/C/9yY0Lk7xIBfTUhiR
	 LcgUY4YHyjd9iXIfnJ8mfF3+99Rv6Xo+B7eBFE6NQ8+Q5pA/QYOs5jUJdHEsFspwZp
	 qzfRypIUs85+gyX3aHjr/KZ54nfwqdA1Vccr66+YQPO1wxQHQi2FR+rXmgap6Rv/V1
	 65IkuFzhkoYnVm18CWbm6jTZrTBD7UthOIf2iXL9tqiLfK5D5y5/nVmYq+MqNkluF2
	 RUe7nciyXhleg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XRGp95v57z4x9D;
	Sun, 13 Oct 2024 21:30:09 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Cc: <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] powerpc/64: Remove maple platform
Date: Sun, 13 Oct 2024 21:29:57 +1100
Message-ID: <20241013102957.548291-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.46.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The maple platform was added in 2004 [1], to support the "Maple" 970FX
evaluation board.

It was later used for IBM JS20/JS21 machines, as well as the Bimini
machine, aka "Yellow Dog Powerstation".

Sadly all those machines have passed into memory, and there's been no
evidence for years that anyone is still using any of them.

Remove the platform and related code. It can always be reinstated if
there's interest.

Note that this has no impact on support for 970FX based Power Macs.

[1]: https://git.kernel.org/pub/scm/linux/kernel/git/mpe/linux-fullhistory.git/commit/?id=f0d068d65c5e555ffcfbc189de32598f6f00770c

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 Documentation/arch/powerpc/booting.rst |   4 +-
 arch/powerpc/Kconfig.debug             |   6 -
 arch/powerpc/boot/.gitignore           |   1 -
 arch/powerpc/boot/Makefile             |   3 +-
 arch/powerpc/boot/wrapper              |   7 +-
 arch/powerpc/configs/maple_defconfig   | 111 ----
 arch/powerpc/configs/ppc64_defconfig   |   1 -
 arch/powerpc/include/asm/udbg.h        |   1 -
 arch/powerpc/kernel/misc_64.S          |   8 +-
 arch/powerpc/kernel/prom_init.c        |  86 ----
 arch/powerpc/kernel/udbg.c             |   3 -
 arch/powerpc/kernel/udbg_16550.c       |  23 -
 arch/powerpc/platforms/Kconfig         |   1 -
 arch/powerpc/platforms/Makefile        |   1 -
 arch/powerpc/platforms/maple/Kconfig   |  19 -
 arch/powerpc/platforms/maple/Makefile  |   2 -
 arch/powerpc/platforms/maple/maple.h   |  14 -
 arch/powerpc/platforms/maple/pci.c     | 672 -------------------------
 arch/powerpc/platforms/maple/setup.c   | 363 -------------
 arch/powerpc/platforms/maple/time.c    | 170 -------
 20 files changed, 8 insertions(+), 1488 deletions(-)
 delete mode 100644 arch/powerpc/configs/maple_defconfig
 delete mode 100644 arch/powerpc/platforms/maple/Kconfig
 delete mode 100644 arch/powerpc/platforms/maple/Makefile
 delete mode 100644 arch/powerpc/platforms/maple/maple.h
 delete mode 100644 arch/powerpc/platforms/maple/pci.c
 delete mode 100644 arch/powerpc/platforms/maple/setup.c
 delete mode 100644 arch/powerpc/platforms/maple/time.c

v2: Rebase onto v6.12-rc2.

diff --git a/Documentation/arch/powerpc/booting.rst b/Documentation/arch/powerpc/booting.rst
index 11aa440f98cc..472e97891aef 100644
--- a/Documentation/arch/powerpc/booting.rst
+++ b/Documentation/arch/powerpc/booting.rst
@@ -93,8 +93,8 @@ given platform based on the content of the device-tree. Thus, you
 should:
 
         a) add your platform support as a _boolean_ option in
-        arch/powerpc/Kconfig, following the example of PPC_PSERIES,
-        PPC_PMAC and PPC_MAPLE. The latter is probably a good
+        arch/powerpc/Kconfig, following the example of PPC_PSERIES
+        and PPC_PMAC. The latter is probably a good
         example of a board support to start from.
 
         b) create your main platform file as
diff --git a/arch/powerpc/Kconfig.debug b/arch/powerpc/Kconfig.debug
index 0bbec4afc0d5..20d05605fa83 100644
--- a/arch/powerpc/Kconfig.debug
+++ b/arch/powerpc/Kconfig.debug
@@ -223,12 +223,6 @@ config PPC_EARLY_DEBUG_RTAS_CONSOLE
 	help
 	  Select this to enable early debugging via the RTAS console.
 
-config PPC_EARLY_DEBUG_MAPLE
-	bool "Maple real mode"
-	depends on PPC_MAPLE
-	help
-	  Select this to enable early debugging for Maple.
-
 config PPC_EARLY_DEBUG_PAS_REALMODE
 	bool "PA Semi real mode"
 	depends on PPC_PASEMI
diff --git a/arch/powerpc/boot/.gitignore b/arch/powerpc/boot/.gitignore
index a4716d138cfc..5a867f23fe7f 100644
--- a/arch/powerpc/boot/.gitignore
+++ b/arch/powerpc/boot/.gitignore
@@ -30,7 +30,6 @@ zImage.coff
 zImage.epapr
 zImage.holly
 zImage.*lds
-zImage.maple
 zImage.miboot
 zImage.pmac
 zImage.pseries
diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
index fa8518067d38..1ff6ad4f6cd2 100644
--- a/arch/powerpc/boot/Makefile
+++ b/arch/powerpc/boot/Makefile
@@ -276,7 +276,6 @@ quiet_cmd_wrap	= WRAP    $@
 
 image-$(CONFIG_PPC_PSERIES)		+= zImage.pseries
 image-$(CONFIG_PPC_POWERNV)		+= zImage.pseries
-image-$(CONFIG_PPC_MAPLE)		+= zImage.maple
 image-$(CONFIG_PPC_IBM_CELL_BLADE)	+= zImage.pseries
 image-$(CONFIG_PPC_PS3)			+= dtbImage.ps3
 image-$(CONFIG_PPC_CHRP)		+= zImage.chrp
@@ -444,7 +443,7 @@ $(obj)/zImage.initrd:	$(addprefix $(obj)/, $(initrd-y))
 clean-files += $(image-) $(initrd-) cuImage.* dtbImage.* treeImage.* \
 	zImage zImage.initrd zImage.chrp zImage.coff zImage.holly \
 	zImage.miboot zImage.pmac zImage.pseries \
-	zImage.maple simpleImage.* otheros.bld
+	simpleImage.* otheros.bld
 
 # clean up files cached by wrapper
 clean-kernel-base := vmlinux.strip vmlinux.bin
diff --git a/arch/powerpc/boot/wrapper b/arch/powerpc/boot/wrapper
index b1f5549a3c9c..1db60fe13802 100755
--- a/arch/powerpc/boot/wrapper
+++ b/arch/powerpc/boot/wrapper
@@ -271,11 +271,6 @@ pseries)
     fi
     make_space=n
     ;;
-maple)
-    platformo="$object/of.o $object/epapr.o"
-    link_address='0x400000'
-    make_space=n
-    ;;
 pmac|chrp)
     platformo="$object/of.o $object/epapr.o"
     make_space=n
@@ -517,7 +512,7 @@ fi
 
 # post-processing needed for some platforms
 case "$platform" in
-pseries|chrp|maple)
+pseries|chrp)
     $objbin/addnote "$ofile"
     ;;
 coff)
diff --git a/arch/powerpc/configs/maple_defconfig b/arch/powerpc/configs/maple_defconfig
deleted file mode 100644
index c821a97f4a89..000000000000
--- a/arch/powerpc/configs/maple_defconfig
+++ /dev/null
@@ -1,111 +0,0 @@
-CONFIG_PPC64=y
-CONFIG_SMP=y
-CONFIG_NR_CPUS=4
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_PROFILING=y
-CONFIG_KPROBES=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_MODULE_SRCVERSION_ALL=y
-# CONFIG_BLK_DEV_BSG is not set
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_MAC_PARTITION=y
-# CONFIG_PPC_POWERNV is not set
-# CONFIG_PPC_PSERIES is not set
-# CONFIG_PPC_PMAC is not set
-CONFIG_PPC_MAPLE=y
-CONFIG_UDBG_RTAS_CONSOLE=y
-CONFIG_GEN_RTC=y
-CONFIG_KEXEC=y
-CONFIG_IRQ_ALL_CPUS=y
-CONFIG_PPC_4K_PAGES=y
-CONFIG_PCI_MSI=y
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_IP_PNP=y
-CONFIG_IP_PNP_DHCP=y
-# CONFIG_IPV6 is not set
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=8192
-# CONFIG_SCSI_PROC_FS is not set
-CONFIG_BLK_DEV_SD=y
-CONFIG_BLK_DEV_SR=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_IPR=y
-CONFIG_ATA=y
-CONFIG_PATA_AMD=y
-CONFIG_ATA_GENERIC=y
-CONFIG_NETDEVICES=y
-CONFIG_AMD8111_ETH=y
-CONFIG_TIGON3=y
-CONFIG_E1000=y
-CONFIG_USB_PEGASUS=y
-# CONFIG_INPUT_KEYBOARD is not set
-# CONFIG_INPUT_MOUSE is not set
-# CONFIG_SERIO is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_HVC_RTAS=y
-# CONFIG_HW_RANDOM is not set
-CONFIG_I2C=y
-CONFIG_I2C_CHARDEV=y
-CONFIG_I2C_AMD8111=y
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_HID_GYRATION=y
-CONFIG_HID_PANTHERLORD=y
-CONFIG_HID_PETALYNX=y
-CONFIG_HID_SAMSUNG=y
-CONFIG_HID_SUNPLUS=y
-CONFIG_USB=y
-CONFIG_USB_MON=y
-CONFIG_USB_EHCI_HCD=y
-CONFIG_USB_EHCI_ROOT_HUB_TT=y
-# CONFIG_USB_EHCI_HCD_PPC_OF is not set
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_UHCI_HCD=y
-CONFIG_USB_SERIAL=y
-CONFIG_USB_SERIAL_GENERIC=y
-CONFIG_USB_SERIAL_CYPRESS_M8=m
-CONFIG_USB_SERIAL_GARMIN=m
-CONFIG_USB_SERIAL_IPW=m
-CONFIG_USB_SERIAL_KEYSPAN=y
-CONFIG_USB_SERIAL_TI=m
-CONFIG_EXT2_FS=y
-CONFIG_EXT4_FS=y
-CONFIG_FS_DAX=y
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=y
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_HUGETLBFS=y
-CONFIG_CRAMFS=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3_ACL=y
-CONFIG_NFS_V4=y
-CONFIG_ROOT_NFS=y
-CONFIG_NLS_DEFAULT="utf-8"
-CONFIG_NLS_UTF8=y
-CONFIG_CRC_CCITT=y
-CONFIG_CRC_T10DIF=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_STACK_USAGE=y
-CONFIG_DEBUG_STACKOVERFLOW=y
-CONFIG_XMON=y
-CONFIG_XMON_DEFAULT=y
-CONFIG_BOOTX_TEXT=y
-CONFIG_CRYPTO_ECB=m
-CONFIG_CRYPTO_PCBC=m
-# CONFIG_CRYPTO_HW is not set
-CONFIG_PRINTK_TIME=y
diff --git a/arch/powerpc/configs/ppc64_defconfig b/arch/powerpc/configs/ppc64_defconfig
index a5e3e7f97f4d..f39c0d000c43 100644
--- a/arch/powerpc/configs/ppc64_defconfig
+++ b/arch/powerpc/configs/ppc64_defconfig
@@ -44,7 +44,6 @@ CONFIG_PPC_SMLPAR=y
 CONFIG_IBMEBUS=y
 CONFIG_PAPR_SCM=m
 CONFIG_PPC_SVM=y
-CONFIG_PPC_MAPLE=y
 CONFIG_PPC_PASEMI=y
 CONFIG_PPC_PASEMI_IOMMU=y
 CONFIG_PPC_PS3=y
diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/asm/udbg.h
index 289023f7a656..a8681b12864f 100644
--- a/arch/powerpc/include/asm/udbg.h
+++ b/arch/powerpc/include/asm/udbg.h
@@ -38,7 +38,6 @@ void __init udbg_early_init(void);
 void __init udbg_init_debug_lpar(void);
 void __init udbg_init_debug_lpar_hvsi(void);
 void __init udbg_init_pmac_realmode(void);
-void __init udbg_init_maple_realmode(void);
 void __init udbg_init_pas_realmode(void);
 void __init udbg_init_rtas_panel(void);
 void __init udbg_init_rtas_console(void);
diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
index 91123e102db4..a997c7f43dc0 100644
--- a/arch/powerpc/kernel/misc_64.S
+++ b/arch/powerpc/kernel/misc_64.S
@@ -74,7 +74,7 @@ _GLOBAL(rmci_off)
 	blr
 #endif /* CONFIG_PPC_EARLY_DEBUG_BOOTX */
 
-#if defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_MAPLE)
+#ifdef CONFIG_PPC_PMAC
 
 /*
  * Do an IO access in real mode
@@ -137,7 +137,7 @@ _GLOBAL(real_writeb)
 	sync
 	isync
 	blr
-#endif /* defined(CONFIG_PPC_PMAC) || defined(CONFIG_PPC_MAPLE) */
+#endif // CONFIG_PPC_PMAC
 
 #ifdef CONFIG_PPC_PASEMI
 
@@ -174,7 +174,7 @@ _GLOBAL(real_205_writeb)
 #endif /* CONFIG_PPC_PASEMI */
 
 
-#if defined(CONFIG_CPU_FREQ_PMAC64) || defined(CONFIG_CPU_FREQ_MAPLE)
+#ifdef CONFIG_CPU_FREQ_PMAC64
 /*
  * SCOM access functions for 970 (FX only for now)
  *
@@ -243,7 +243,7 @@ _GLOBAL(scom970_write)
 	/* restore interrupts */
 	mtmsrd	r5,1
 	blr
-#endif /* CONFIG_CPU_FREQ_PMAC64 || CONFIG_CPU_FREQ_MAPLE */
+#endif // CONFIG_CPU_FREQ_PMAC64
 
 /* kexec_wait(phys_cpu)
  *
diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
index fbb68fc28ed3..73210e5bcfa7 100644
--- a/arch/powerpc/kernel/prom_init.c
+++ b/arch/powerpc/kernel/prom_init.c
@@ -2792,90 +2792,6 @@ static void __init flatten_device_tree(void)
 		    dt_struct_start, dt_struct_end);
 }
 
-#ifdef CONFIG_PPC_MAPLE
-/* PIBS Version 1.05.0000 04/26/2005 has an incorrect /ht/isa/ranges property.
- * The values are bad, and it doesn't even have the right number of cells. */
-static void __init fixup_device_tree_maple(void)
-{
-	phandle isa;
-	u32 rloc = 0x01002000; /* IO space; PCI device = 4 */
-	u32 isa_ranges[6];
-	char *name;
-
-	name = "/ht@0/isa@4";
-	isa = call_prom("finddevice", 1, 1, ADDR(name));
-	if (!PHANDLE_VALID(isa)) {
-		name = "/ht@0/isa@6";
-		isa = call_prom("finddevice", 1, 1, ADDR(name));
-		rloc = 0x01003000; /* IO space; PCI device = 6 */
-	}
-	if (!PHANDLE_VALID(isa))
-		return;
-
-	if (prom_getproplen(isa, "ranges") != 12)
-		return;
-	if (prom_getprop(isa, "ranges", isa_ranges, sizeof(isa_ranges))
-		== PROM_ERROR)
-		return;
-
-	if (isa_ranges[0] != 0x1 ||
-		isa_ranges[1] != 0xf4000000 ||
-		isa_ranges[2] != 0x00010000)
-		return;
-
-	prom_printf("Fixing up bogus ISA range on Maple/Apache...\n");
-
-	isa_ranges[0] = 0x1;
-	isa_ranges[1] = 0x0;
-	isa_ranges[2] = rloc;
-	isa_ranges[3] = 0x0;
-	isa_ranges[4] = 0x0;
-	isa_ranges[5] = 0x00010000;
-	prom_setprop(isa, name, "ranges",
-			isa_ranges, sizeof(isa_ranges));
-}
-
-#define CPC925_MC_START		0xf8000000
-#define CPC925_MC_LENGTH	0x1000000
-/* The values for memory-controller don't have right number of cells */
-static void __init fixup_device_tree_maple_memory_controller(void)
-{
-	phandle mc;
-	u32 mc_reg[4];
-	char *name = "/hostbridge@f8000000";
-	u32 ac, sc;
-
-	mc = call_prom("finddevice", 1, 1, ADDR(name));
-	if (!PHANDLE_VALID(mc))
-		return;
-
-	if (prom_getproplen(mc, "reg") != 8)
-		return;
-
-	prom_getprop(prom.root, "#address-cells", &ac, sizeof(ac));
-	prom_getprop(prom.root, "#size-cells", &sc, sizeof(sc));
-	if ((ac != 2) || (sc != 2))
-		return;
-
-	if (prom_getprop(mc, "reg", mc_reg, sizeof(mc_reg)) == PROM_ERROR)
-		return;
-
-	if (mc_reg[0] != CPC925_MC_START || mc_reg[1] != CPC925_MC_LENGTH)
-		return;
-
-	prom_printf("Fixing up bogus hostbridge on Maple...\n");
-
-	mc_reg[0] = 0x0;
-	mc_reg[1] = CPC925_MC_START;
-	mc_reg[2] = 0x0;
-	mc_reg[3] = CPC925_MC_LENGTH;
-	prom_setprop(mc, name, "reg", mc_reg, sizeof(mc_reg));
-}
-#else
-#define fixup_device_tree_maple()
-#define fixup_device_tree_maple_memory_controller()
-#endif
-
 #ifdef CONFIG_PPC_CHRP
 /*
  * Pegasos and BriQ lacks the "ranges" property in the isa node
@@ -3193,8 +3109,6 @@ static inline void fixup_device_tree_pasemi(void) { }
 
 static void __init fixup_device_tree(void)
 {
-	fixup_device_tree_maple();
-	fixup_device_tree_maple_memory_controller();
 	fixup_device_tree_chrp();
 	fixup_device_tree_pmac();
 	fixup_device_tree_efika();
diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
index 4b99208f5adc..0a72a537f879 100644
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -39,9 +39,6 @@ void __init udbg_early_init(void)
 #elif defined(CONFIG_PPC_EARLY_DEBUG_RTAS_CONSOLE)
 	/* RTAS console debug */
 	udbg_init_rtas_console();
-#elif defined(CONFIG_PPC_EARLY_DEBUG_MAPLE)
-	/* Maple real mode debug */
-	udbg_init_maple_realmode();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_PAS_REALMODE)
 	udbg_init_pas_realmode();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_BOOTX)
diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
index 313802aff571..dfe8ed2192e8 100644
--- a/arch/powerpc/kernel/udbg_16550.c
+++ b/arch/powerpc/kernel/udbg_16550.c
@@ -205,29 +205,6 @@ void __init udbg_uart_init_mmio(void __iomem *addr, unsigned int stride)
 	udbg_use_uart();
 }
 
-#ifdef CONFIG_PPC_MAPLE
-
-#define UDBG_UART_MAPLE_ADDR	((void __iomem *)0xf40003f8)
-
-static u8 udbg_uart_in_maple(unsigned int reg)
-{
-	return real_readb(UDBG_UART_MAPLE_ADDR + reg);
-}
-
-static void udbg_uart_out_maple(unsigned int reg, u8 val)
-{
-	real_writeb(val, UDBG_UART_MAPLE_ADDR + reg);
-}
-
-void __init udbg_init_maple_realmode(void)
-{
-	udbg_uart_in = udbg_uart_in_maple;
-	udbg_uart_out = udbg_uart_out_maple;
-	udbg_use_uart();
-}
-
-#endif /* CONFIG_PPC_MAPLE */
-
 #ifdef CONFIG_PPC_PASEMI
 
 #define UDBG_UART_PAS_ADDR	((void __iomem *)0xfcff03f8UL)
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 1112a5831619..a454149ae02f 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -7,7 +7,6 @@ source "arch/powerpc/platforms/chrp/Kconfig"
 source "arch/powerpc/platforms/512x/Kconfig"
 source "arch/powerpc/platforms/52xx/Kconfig"
 source "arch/powerpc/platforms/powermac/Kconfig"
-source "arch/powerpc/platforms/maple/Kconfig"
 source "arch/powerpc/platforms/pasemi/Kconfig"
 source "arch/powerpc/platforms/ps3/Kconfig"
 source "arch/powerpc/platforms/cell/Kconfig"
diff --git a/arch/powerpc/platforms/Makefile b/arch/powerpc/platforms/Makefile
index 786d374bff31..3cee4a842736 100644
--- a/arch/powerpc/platforms/Makefile
+++ b/arch/powerpc/platforms/Makefile
@@ -14,7 +14,6 @@ obj-$(CONFIG_FSL_SOC_BOOKE)	+= 85xx/
 obj-$(CONFIG_PPC_86xx)		+= 86xx/
 obj-$(CONFIG_PPC_POWERNV)	+= powernv/
 obj-$(CONFIG_PPC_PSERIES)	+= pseries/
-obj-$(CONFIG_PPC_MAPLE)		+= maple/
 obj-$(CONFIG_PPC_PASEMI)	+= pasemi/
 obj-$(CONFIG_PPC_CELL)		+= cell/
 obj-$(CONFIG_PPC_PS3)		+= ps3/
diff --git a/arch/powerpc/platforms/maple/Kconfig b/arch/powerpc/platforms/maple/Kconfig
deleted file mode 100644
index 4c058cc57c90..000000000000
--- a/arch/powerpc/platforms/maple/Kconfig
+++ /dev/null
@@ -1,19 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-config PPC_MAPLE
-	depends on PPC64 && PPC_BOOK3S && CPU_BIG_ENDIAN
-	bool "Maple 970FX Evaluation Board"
-	select FORCE_PCI
-	select MPIC
-	select U3_DART
-	select MPIC_U3_HT_IRQS
-	select GENERIC_TBSYNC
-	select PPC_UDBG_16550
-	select PPC_970_NAP
-	select PPC_64S_HASH_MMU
-	select PPC_HASH_MMU_NATIVE
-	select PPC_RTAS
-	select MMIO_NVRAM
-	select ATA_NONSTANDARD if ATA
-	help
-	  This option enables support for the Maple 970FX Evaluation Board.
-	  For more information, refer to <http://www.970eval.com>
diff --git a/arch/powerpc/platforms/maple/Makefile b/arch/powerpc/platforms/maple/Makefile
deleted file mode 100644
index 19f35ab828a7..000000000000
--- a/arch/powerpc/platforms/maple/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-obj-y	+= setup.o pci.o time.o
diff --git a/arch/powerpc/platforms/maple/maple.h b/arch/powerpc/platforms/maple/maple.h
deleted file mode 100644
index 8ddbaa4ebd0b..000000000000
--- a/arch/powerpc/platforms/maple/maple.h
+++ /dev/null
@@ -1,14 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Declarations for maple-specific code.
- *
- * Maple is the name of a PPC970 evaluation board.
- */
-extern int maple_set_rtc_time(struct rtc_time *tm);
-extern void maple_get_rtc_time(struct rtc_time *tm);
-extern time64_t maple_get_boot_time(void);
-extern void maple_pci_init(void);
-extern void maple_pci_irq_fixup(struct pci_dev *dev);
-extern int maple_pci_get_legacy_ide_irq(struct pci_dev *dev, int channel);
-
-extern struct pci_controller_ops maple_pci_controller_ops;
diff --git a/arch/powerpc/platforms/maple/pci.c b/arch/powerpc/platforms/maple/pci.c
deleted file mode 100644
index b9ff37c7f6f0..000000000000
--- a/arch/powerpc/platforms/maple/pci.c
+++ /dev/null
@@ -1,672 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Copyright (C) 2004 Benjamin Herrenschmuidt (benh@kernel.crashing.org),
- *		      IBM Corp.
- */
-
-#undef DEBUG
-
-#include <linux/kernel.h>
-#include <linux/pci.h>
-#include <linux/delay.h>
-#include <linux/string.h>
-#include <linux/init.h>
-#include <linux/irq.h>
-#include <linux/of_irq.h>
-
-#include <asm/sections.h>
-#include <asm/io.h>
-#include <asm/pci-bridge.h>
-#include <asm/machdep.h>
-#include <asm/iommu.h>
-#include <asm/ppc-pci.h>
-#include <asm/isa-bridge.h>
-
-#include "maple.h"
-
-#ifdef DEBUG
-#define DBG(x...) printk(x)
-#else
-#define DBG(x...)
-#endif
-
-static struct pci_controller *u3_agp, *u3_ht, *u4_pcie;
-
-static int __init fixup_one_level_bus_range(struct device_node *node, int higher)
-{
-	for (; node; node = node->sibling) {
-		const int *bus_range;
-		const unsigned int *class_code;
-		int len;
-
-		/* For PCI<->PCI bridges or CardBus bridges, we go down */
-		class_code = of_get_property(node, "class-code", NULL);
-		if (!class_code || ((*class_code >> 8) != PCI_CLASS_BRIDGE_PCI &&
-			(*class_code >> 8) != PCI_CLASS_BRIDGE_CARDBUS))
-			continue;
-		bus_range = of_get_property(node, "bus-range", &len);
-		if (bus_range != NULL && len > 2 * sizeof(int)) {
-			if (bus_range[1] > higher)
-				higher = bus_range[1];
-		}
-		higher = fixup_one_level_bus_range(node->child, higher);
-	}
-	return higher;
-}
-
-/* This routine fixes the "bus-range" property of all bridges in the
- * system since they tend to have their "last" member wrong on macs
- *
- * Note that the bus numbers manipulated here are OF bus numbers, they
- * are not Linux bus numbers.
- */
-static void __init fixup_bus_range(struct device_node *bridge)
-{
-	int *bus_range;
-	struct property *prop;
-	int len;
-
-	/* Lookup the "bus-range" property for the hose */
-	prop = of_find_property(bridge, "bus-range", &len);
-	if (prop == NULL  || prop->value == NULL || len < 2 * sizeof(int)) {
-		printk(KERN_WARNING "Can't get bus-range for %pOF\n",
-			       bridge);
-		return;
-	}
-	bus_range = prop->value;
-	bus_range[1] = fixup_one_level_bus_range(bridge->child, bus_range[1]);
-}
-
-
-static unsigned long u3_agp_cfa0(u8 devfn, u8 off)
-{
-	return (1 << (unsigned long)PCI_SLOT(devfn)) |
-		((unsigned long)PCI_FUNC(devfn) << 8) |
-		((unsigned long)off & 0xFCUL);
-}
-
-static unsigned long u3_agp_cfa1(u8 bus, u8 devfn, u8 off)
-{
-	return ((unsigned long)bus << 16) |
-		((unsigned long)devfn << 8) |
-		((unsigned long)off & 0xFCUL) |
-		1UL;
-}
-
-static volatile void __iomem *u3_agp_cfg_access(struct pci_controller* hose,
-				       u8 bus, u8 dev_fn, u8 offset)
-{
-	unsigned int caddr;
-
-	if (bus == hose->first_busno) {
-		if (dev_fn < (11 << 3))
-			return NULL;
-		caddr = u3_agp_cfa0(dev_fn, offset);
-	} else
-		caddr = u3_agp_cfa1(bus, dev_fn, offset);
-
-	/* Uninorth will return garbage if we don't read back the value ! */
-	do {
-		out_le32(hose->cfg_addr, caddr);
-	} while (in_le32(hose->cfg_addr) != caddr);
-
-	offset &= 0x07;
-	return hose->cfg_data + offset;
-}
-
-static int u3_agp_read_config(struct pci_bus *bus, unsigned int devfn,
-			      int offset, int len, u32 *val)
-{
-	struct pci_controller *hose;
-	volatile void __iomem *addr;
-
-	hose = pci_bus_to_host(bus);
-	if (hose == NULL)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	addr = u3_agp_cfg_access(hose, bus->number, devfn, offset);
-	if (!addr)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	/*
-	 * Note: the caller has already checked that offset is
-	 * suitably aligned and that len is 1, 2 or 4.
-	 */
-	switch (len) {
-	case 1:
-		*val = in_8(addr);
-		break;
-	case 2:
-		*val = in_le16(addr);
-		break;
-	default:
-		*val = in_le32(addr);
-		break;
-	}
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int u3_agp_write_config(struct pci_bus *bus, unsigned int devfn,
-			       int offset, int len, u32 val)
-{
-	struct pci_controller *hose;
-	volatile void __iomem *addr;
-
-	hose = pci_bus_to_host(bus);
-	if (hose == NULL)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	addr = u3_agp_cfg_access(hose, bus->number, devfn, offset);
-	if (!addr)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	/*
-	 * Note: the caller has already checked that offset is
-	 * suitably aligned and that len is 1, 2 or 4.
-	 */
-	switch (len) {
-	case 1:
-		out_8(addr, val);
-		break;
-	case 2:
-		out_le16(addr, val);
-		break;
-	default:
-		out_le32(addr, val);
-		break;
-	}
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static struct pci_ops u3_agp_pci_ops =
-{
-	.read = u3_agp_read_config,
-	.write = u3_agp_write_config,
-};
-
-static unsigned long u3_ht_cfa0(u8 devfn, u8 off)
-{
-	return (devfn << 8) | off;
-}
-
-static unsigned long u3_ht_cfa1(u8 bus, u8 devfn, u8 off)
-{
-	return u3_ht_cfa0(devfn, off) + (bus << 16) + 0x01000000UL;
-}
-
-static volatile void __iomem *u3_ht_cfg_access(struct pci_controller* hose,
-				      u8 bus, u8 devfn, u8 offset)
-{
-	if (bus == hose->first_busno) {
-		if (PCI_SLOT(devfn) == 0)
-			return NULL;
-		return hose->cfg_data + u3_ht_cfa0(devfn, offset);
-	} else
-		return hose->cfg_data + u3_ht_cfa1(bus, devfn, offset);
-}
-
-static int u3_ht_root_read_config(struct pci_controller *hose, u8 offset,
-				  int len, u32 *val)
-{
-	volatile void __iomem *addr;
-
-	addr = hose->cfg_addr;
-	addr += ((offset & ~3) << 2) + (4 - len - (offset & 3));
-
-	switch (len) {
-	case 1:
-		*val = in_8(addr);
-		break;
-	case 2:
-		*val = in_be16(addr);
-		break;
-	default:
-		*val = in_be32(addr);
-		break;
-	}
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int u3_ht_root_write_config(struct pci_controller *hose, u8 offset,
-				  int len, u32 val)
-{
-	volatile void __iomem *addr;
-
-	addr = hose->cfg_addr + ((offset & ~3) << 2) + (4 - len - (offset & 3));
-
-	if (offset >= PCI_BASE_ADDRESS_0 && offset < PCI_CAPABILITY_LIST)
-		return PCIBIOS_SUCCESSFUL;
-
-	switch (len) {
-	case 1:
-		out_8(addr, val);
-		break;
-	case 2:
-		out_be16(addr, val);
-		break;
-	default:
-		out_be32(addr, val);
-		break;
-	}
-
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int u3_ht_read_config(struct pci_bus *bus, unsigned int devfn,
-			     int offset, int len, u32 *val)
-{
-	struct pci_controller *hose;
-	volatile void __iomem *addr;
-
-	hose = pci_bus_to_host(bus);
-	if (hose == NULL)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	if (bus->number == hose->first_busno && devfn == PCI_DEVFN(0, 0))
-		return u3_ht_root_read_config(hose, offset, len, val);
-
-	if (offset > 0xff)
-		return PCIBIOS_BAD_REGISTER_NUMBER;
-
-	addr = u3_ht_cfg_access(hose, bus->number, devfn, offset);
-	if (!addr)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	/*
-	 * Note: the caller has already checked that offset is
-	 * suitably aligned and that len is 1, 2 or 4.
-	 */
-	switch (len) {
-	case 1:
-		*val = in_8(addr);
-		break;
-	case 2:
-		*val = in_le16(addr);
-		break;
-	default:
-		*val = in_le32(addr);
-		break;
-	}
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static int u3_ht_write_config(struct pci_bus *bus, unsigned int devfn,
-			      int offset, int len, u32 val)
-{
-	struct pci_controller *hose;
-	volatile void __iomem *addr;
-
-	hose = pci_bus_to_host(bus);
-	if (hose == NULL)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-
-	if (bus->number == hose->first_busno && devfn == PCI_DEVFN(0, 0))
-		return u3_ht_root_write_config(hose, offset, len, val);
-
-	if (offset > 0xff)
-		return PCIBIOS_BAD_REGISTER_NUMBER;
-
-	addr = u3_ht_cfg_access(hose, bus->number, devfn, offset);
-	if (!addr)
-		return PCIBIOS_DEVICE_NOT_FOUND;
-	/*
-	 * Note: the caller has already checked that offset is
-	 * suitably aligned and that len is 1, 2 or 4.
-	 */
-	switch (len) {
-	case 1:
-		out_8(addr, val);
-		break;
-	case 2:
-		out_le16(addr, val);
-		break;
-	default:
-		out_le32(addr, val);
-		break;
-	}
-	return PCIBIOS_SUCCESSFUL;
-}
-
-static struct pci_ops u3_ht_pci_ops =
-{
-	.read = u3_ht_read_config,
-	.write = u3_ht_write_config,
-};
-
-static unsigned int u4_pcie_cfa0(unsigned int devfn, unsigned int off)
-{
-	return (1 << PCI_SLOT(devfn))	|
-	       (PCI_FUNC(devfn) << 8)	|
-	       ((off >> 8) << 28) 	|
-	       (off & 0xfcu);
-}
-
-static unsigned int u4_pcie_cfa1(unsigned int bus, unsigned int devfn,
-				 unsigned int off)
-{
-        return (bus << 16)		|
-	       (devfn << 8)		|
-	       ((off >> 8) << 28)	|
-	       (off & 0xfcu)		| 1u;
-}
-
-static volatile void __iomem *u4_pcie_cfg_access(struct pci_controller* hose,
-                                        u8 bus, u8 dev_fn, int offset)
-{
-        unsigned int caddr;
-
-        if (bus == hose->first_busno)
-                caddr = u4_pcie_cfa0(dev_fn, offset);
-        else
-                caddr = u4_pcie_cfa1(bus, dev_fn, offset);
-
-        /* Uninorth will return garbage if we don't read back the value ! */
-        do {
-                out_le32(hose->cfg_addr, caddr);
-        } while (in_le32(hose->cfg_addr) != caddr);
-
-        offset &= 0x03;
-        return hose->cfg_data + offset;
-}
-
-static int u4_pcie_read_config(struct pci_bus *bus, unsigned int devfn,
-                               int offset, int len, u32 *val)
-{
-        struct pci_controller *hose;
-        volatile void __iomem *addr;
-
-        hose = pci_bus_to_host(bus);
-        if (hose == NULL)
-                return PCIBIOS_DEVICE_NOT_FOUND;
-        if (offset >= 0x1000)
-                return  PCIBIOS_BAD_REGISTER_NUMBER;
-        addr = u4_pcie_cfg_access(hose, bus->number, devfn, offset);
-        if (!addr)
-                return PCIBIOS_DEVICE_NOT_FOUND;
-        /*
-         * Note: the caller has already checked that offset is
-         * suitably aligned and that len is 1, 2 or 4.
-         */
-        switch (len) {
-        case 1:
-                *val = in_8(addr);
-                break;
-        case 2:
-                *val = in_le16(addr);
-                break;
-        default:
-                *val = in_le32(addr);
-                break;
-        }
-        return PCIBIOS_SUCCESSFUL;
-}
-static int u4_pcie_write_config(struct pci_bus *bus, unsigned int devfn,
-                                int offset, int len, u32 val)
-{
-        struct pci_controller *hose;
-        volatile void __iomem *addr;
-
-        hose = pci_bus_to_host(bus);
-        if (hose == NULL)
-                return PCIBIOS_DEVICE_NOT_FOUND;
-        if (offset >= 0x1000)
-                return  PCIBIOS_BAD_REGISTER_NUMBER;
-        addr = u4_pcie_cfg_access(hose, bus->number, devfn, offset);
-        if (!addr)
-                return PCIBIOS_DEVICE_NOT_FOUND;
-        /*
-         * Note: the caller has already checked that offset is
-         * suitably aligned and that len is 1, 2 or 4.
-         */
-        switch (len) {
-        case 1:
-                out_8(addr, val);
-                break;
-        case 2:
-                out_le16(addr, val);
-                break;
-        default:
-                out_le32(addr, val);
-                break;
-        }
-        return PCIBIOS_SUCCESSFUL;
-}
-
-static struct pci_ops u4_pcie_pci_ops =
-{
-	.read = u4_pcie_read_config,
-	.write = u4_pcie_write_config,
-};
-
-static void __init setup_u3_agp(struct pci_controller* hose)
-{
-	/* On G5, we move AGP up to high bus number so we don't need
-	 * to reassign bus numbers for HT. If we ever have P2P bridges
-	 * on AGP, we'll have to move pci_assign_all_buses to the
-	 * pci_controller structure so we enable it for AGP and not for
-	 * HT childs.
-	 * We hard code the address because of the different size of
-	 * the reg address cell, we shall fix that by killing struct
-	 * reg_property and using some accessor functions instead
-	 */
-	hose->first_busno = 0xf0;
-	hose->last_busno = 0xff;
-	hose->ops = &u3_agp_pci_ops;
-	hose->cfg_addr = ioremap(0xf0000000 + 0x800000, 0x1000);
-	hose->cfg_data = ioremap(0xf0000000 + 0xc00000, 0x1000);
-
-	u3_agp = hose;
-}
-
-static void __init setup_u4_pcie(struct pci_controller* hose)
-{
-        /* We currently only implement the "non-atomic" config space, to
-         * be optimised later.
-         */
-        hose->ops = &u4_pcie_pci_ops;
-        hose->cfg_addr = ioremap(0xf0000000 + 0x800000, 0x1000);
-        hose->cfg_data = ioremap(0xf0000000 + 0xc00000, 0x1000);
-
-        u4_pcie = hose;
-}
-
-static void __init setup_u3_ht(struct pci_controller* hose)
-{
-	hose->ops = &u3_ht_pci_ops;
-
-	/* We hard code the address because of the different size of
-	 * the reg address cell, we shall fix that by killing struct
-	 * reg_property and using some accessor functions instead
-	 */
-	hose->cfg_data = ioremap(0xf2000000, 0x02000000);
-	hose->cfg_addr = ioremap(0xf8070000, 0x1000);
-
-	hose->first_busno = 0;
-	hose->last_busno = 0xef;
-
-	u3_ht = hose;
-}
-
-static int __init maple_add_bridge(struct device_node *dev)
-{
-	int len;
-	struct pci_controller *hose;
-	char* disp_name;
-	const int *bus_range;
-	int primary = 1;
-
-	DBG("Adding PCI host bridge %pOF\n", dev);
-
-	bus_range = of_get_property(dev, "bus-range", &len);
-	if (bus_range == NULL || len < 2 * sizeof(int)) {
-		printk(KERN_WARNING "Can't get bus-range for %pOF, assume bus 0\n",
-		dev);
-	}
-
-	hose = pcibios_alloc_controller(dev);
-	if (hose == NULL)
-		return -ENOMEM;
-	hose->first_busno = bus_range ? bus_range[0] : 0;
-	hose->last_busno = bus_range ? bus_range[1] : 0xff;
-	hose->controller_ops = maple_pci_controller_ops;
-
-	disp_name = NULL;
-	if (of_device_is_compatible(dev, "u3-agp")) {
-		setup_u3_agp(hose);
-		disp_name = "U3-AGP";
-		primary = 0;
-	} else if (of_device_is_compatible(dev, "u3-ht")) {
-		setup_u3_ht(hose);
-		disp_name = "U3-HT";
-		primary = 1;
-        } else if (of_device_is_compatible(dev, "u4-pcie")) {
-                setup_u4_pcie(hose);
-                disp_name = "U4-PCIE";
-                primary = 0;
-	}
-	printk(KERN_INFO "Found %s PCI host bridge. Firmware bus number: %d->%d\n",
-		disp_name, hose->first_busno, hose->last_busno);
-
-	/* Interpret the "ranges" property */
-	/* This also maps the I/O region and sets isa_io/mem_base */
-	pci_process_bridge_OF_ranges(hose, dev, primary);
-
-	/* Fixup "bus-range" OF property */
-	fixup_bus_range(dev);
-
-	/* Check for legacy IOs */
-	isa_bridge_find_early(hose);
-
-	/* create pci_dn's for DT nodes under this PHB */
-	pci_devs_phb_init_dynamic(hose);
-
-	return 0;
-}
-
-
-void maple_pci_irq_fixup(struct pci_dev *dev)
-{
-	DBG(" -> maple_pci_irq_fixup\n");
-
-	/* Fixup IRQ for PCIe host */
-	if (u4_pcie != NULL && dev->bus->number == 0 &&
-	    pci_bus_to_host(dev->bus) == u4_pcie) {
-		printk(KERN_DEBUG "Fixup U4 PCIe IRQ\n");
-		dev->irq = irq_create_mapping(NULL, 1);
-		if (dev->irq)
-			irq_set_irq_type(dev->irq, IRQ_TYPE_LEVEL_LOW);
-	}
-
-	/* Hide AMD8111 IDE interrupt when in legacy mode so
-	 * the driver calls pci_get_legacy_ide_irq()
-	 */
-	if (dev->vendor == PCI_VENDOR_ID_AMD &&
-	    dev->device == PCI_DEVICE_ID_AMD_8111_IDE &&
-	    (dev->class & 5) != 5) {
-		dev->irq = 0;
-	}
-
-	DBG(" <- maple_pci_irq_fixup\n");
-}
-
-static int maple_pci_root_bridge_prepare(struct pci_host_bridge *bridge)
-{
-	struct pci_controller *hose = pci_bus_to_host(bridge->bus);
-	struct device_node *np, *child;
-
-	if (hose != u3_agp)
-		return 0;
-
-	/* Fixup the PCI<->OF mapping for U3 AGP due to bus renumbering. We
-	 * assume there is no P2P bridge on the AGP bus, which should be a
-	 * safe assumptions hopefully.
-	 */
-	np = hose->dn;
-	PCI_DN(np)->busno = 0xf0;
-	for_each_child_of_node(np, child)
-		PCI_DN(child)->busno = 0xf0;
-
-	return 0;
-}
-
-void __init maple_pci_init(void)
-{
-	struct device_node *np, *root;
-	struct device_node *ht = NULL;
-
-	/* Probe root PCI hosts, that is on U3 the AGP host and the
-	 * HyperTransport host. That one is actually "kept" around
-	 * and actually added last as its resource management relies
-	 * on the AGP resources to have been setup first
-	 */
-	root = of_find_node_by_path("/");
-	if (root == NULL) {
-		printk(KERN_CRIT "maple_find_bridges: can't find root of device tree\n");
-		return;
-	}
-	for_each_child_of_node(root, np) {
-		if (!of_node_is_type(np, "pci") && !of_node_is_type(np, "ht"))
-			continue;
-		if ((of_device_is_compatible(np, "u4-pcie") ||
-		     of_device_is_compatible(np, "u3-agp")) &&
-		    maple_add_bridge(np) == 0)
-			of_node_get(np);
-
-		if (of_device_is_compatible(np, "u3-ht")) {
-			of_node_get(np);
-			ht = np;
-		}
-	}
-	of_node_put(root);
-
-	/* Now setup the HyperTransport host if we found any
-	 */
-	if (ht && maple_add_bridge(ht) != 0)
-		of_node_put(ht);
-
-	ppc_md.pcibios_root_bridge_prepare = maple_pci_root_bridge_prepare;
-
-	/* Tell pci.c to not change any resource allocations.  */
-	pci_add_flags(PCI_PROBE_ONLY);
-}
-
-int maple_pci_get_legacy_ide_irq(struct pci_dev *pdev, int channel)
-{
-	struct device_node *np;
-	unsigned int defirq = channel ? 15 : 14;
-	unsigned int irq;
-
-	if (pdev->vendor != PCI_VENDOR_ID_AMD ||
-	    pdev->device != PCI_DEVICE_ID_AMD_8111_IDE)
-		return defirq;
-
-	np = pci_device_to_OF_node(pdev);
-	if (np == NULL) {
-		printk("Failed to locate OF node for IDE %s\n",
-		       pci_name(pdev));
-		return defirq;
-	}
-	irq = irq_of_parse_and_map(np, channel & 0x1);
-	if (!irq) {
-		printk("Failed to map onboard IDE interrupt for channel %d\n",
-		       channel);
-		return defirq;
-	}
-	return irq;
-}
-
-static void quirk_ipr_msi(struct pci_dev *dev)
-{
-	/* Something prevents MSIs from the IPR from working on Bimini,
-	 * and the driver has no smarts to recover. So disable MSI
-	 * on it for now. */
-
-	if (machine_is(maple)) {
-		dev->no_msi = 1;
-		dev_info(&dev->dev, "Quirk disabled MSI\n");
-	}
-}
-DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_IBM, PCI_DEVICE_ID_IBM_OBSIDIAN,
-			quirk_ipr_msi);
-
-struct pci_controller_ops maple_pci_controller_ops = {
-};
diff --git a/arch/powerpc/platforms/maple/setup.c b/arch/powerpc/platforms/maple/setup.c
deleted file mode 100644
index f329a03edf4a..000000000000
--- a/arch/powerpc/platforms/maple/setup.c
+++ /dev/null
@@ -1,363 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  Maple (970 eval board) setup code
- *
- *  (c) Copyright 2004 Benjamin Herrenschmidt (benh@kernel.crashing.org),
- *                     IBM Corp. 
- */
-
-#undef DEBUG
-
-#include <linux/init.h>
-#include <linux/errno.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/export.h>
-#include <linux/mm.h>
-#include <linux/stddef.h>
-#include <linux/unistd.h>
-#include <linux/ptrace.h>
-#include <linux/user.h>
-#include <linux/tty.h>
-#include <linux/string.h>
-#include <linux/delay.h>
-#include <linux/ioport.h>
-#include <linux/major.h>
-#include <linux/initrd.h>
-#include <linux/vt_kern.h>
-#include <linux/console.h>
-#include <linux/pci.h>
-#include <linux/adb.h>
-#include <linux/cuda.h>
-#include <linux/pmu.h>
-#include <linux/irq.h>
-#include <linux/seq_file.h>
-#include <linux/root_dev.h>
-#include <linux/serial.h>
-#include <linux/smp.h>
-#include <linux/bitops.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/platform_device.h>
-#include <linux/memblock.h>
-
-#include <asm/processor.h>
-#include <asm/sections.h>
-#include <asm/io.h>
-#include <asm/pci-bridge.h>
-#include <asm/iommu.h>
-#include <asm/machdep.h>
-#include <asm/dma.h>
-#include <asm/cputable.h>
-#include <asm/time.h>
-#include <asm/mpic.h>
-#include <asm/rtas.h>
-#include <asm/udbg.h>
-#include <asm/nvram.h>
-
-#include "maple.h"
-
-#ifdef DEBUG
-#define DBG(fmt...) udbg_printf(fmt)
-#else
-#define DBG(fmt...)
-#endif
-
-static unsigned long maple_find_nvram_base(void)
-{
-	struct device_node *rtcs;
-	unsigned long result = 0;
-
-	/* find NVRAM device */
-	rtcs = of_find_compatible_node(NULL, "nvram", "AMD8111");
-	if (rtcs) {
-		struct resource r;
-		if (of_address_to_resource(rtcs, 0, &r)) {
-			printk(KERN_EMERG "Maple: Unable to translate NVRAM"
-			       " address\n");
-			goto bail;
-		}
-		if (!(r.flags & IORESOURCE_IO)) {
-			printk(KERN_EMERG "Maple: NVRAM address isn't PIO!\n");
-			goto bail;
-		}
-		result = r.start;
-	} else
-		printk(KERN_EMERG "Maple: Unable to find NVRAM\n");
- bail:
-	of_node_put(rtcs);
-	return result;
-}
-
-static void __noreturn maple_restart(char *cmd)
-{
-	unsigned int maple_nvram_base;
-	const unsigned int *maple_nvram_offset, *maple_nvram_command;
-	struct device_node *sp;
-
-	maple_nvram_base = maple_find_nvram_base();
-	if (maple_nvram_base == 0)
-		goto fail;
-
-	/* find service processor device */
-	sp = of_find_node_by_name(NULL, "service-processor");
-	if (!sp) {
-		printk(KERN_EMERG "Maple: Unable to find Service Processor\n");
-		goto fail;
-	}
-	maple_nvram_offset = of_get_property(sp, "restart-addr", NULL);
-	maple_nvram_command = of_get_property(sp, "restart-value", NULL);
-	of_node_put(sp);
-
-	/* send command */
-	outb_p(*maple_nvram_command, maple_nvram_base + *maple_nvram_offset);
-	for (;;) ;
- fail:
-	printk(KERN_EMERG "Maple: Manual Restart Required\n");
-	for (;;) ;
-}
-
-static void __noreturn maple_power_off(void)
-{
-	unsigned int maple_nvram_base;
-	const unsigned int *maple_nvram_offset, *maple_nvram_command;
-	struct device_node *sp;
-
-	maple_nvram_base = maple_find_nvram_base();
-	if (maple_nvram_base == 0)
-		goto fail;
-
-	/* find service processor device */
-	sp = of_find_node_by_name(NULL, "service-processor");
-	if (!sp) {
-		printk(KERN_EMERG "Maple: Unable to find Service Processor\n");
-		goto fail;
-	}
-	maple_nvram_offset = of_get_property(sp, "power-off-addr", NULL);
-	maple_nvram_command = of_get_property(sp, "power-off-value", NULL);
-	of_node_put(sp);
-
-	/* send command */
-	outb_p(*maple_nvram_command, maple_nvram_base + *maple_nvram_offset);
-	for (;;) ;
- fail:
-	printk(KERN_EMERG "Maple: Manual Power-Down Required\n");
-	for (;;) ;
-}
-
-static void __noreturn maple_halt(void)
-{
-	maple_power_off();
-}
-
-#ifdef CONFIG_SMP
-static struct smp_ops_t maple_smp_ops = {
-	.probe		= smp_mpic_probe,
-	.message_pass	= smp_mpic_message_pass,
-	.kick_cpu	= smp_generic_kick_cpu,
-	.setup_cpu	= smp_mpic_setup_cpu,
-	.give_timebase	= smp_generic_give_timebase,
-	.take_timebase	= smp_generic_take_timebase,
-};
-#endif /* CONFIG_SMP */
-
-static void __init maple_use_rtas_reboot_and_halt_if_present(void)
-{
-	if (rtas_function_implemented(RTAS_FN_SYSTEM_REBOOT) &&
-	    rtas_function_implemented(RTAS_FN_POWER_OFF)) {
-		ppc_md.restart = rtas_restart;
-		pm_power_off = rtas_power_off;
-		ppc_md.halt = rtas_halt;
-	}
-}
-
-static void __init maple_setup_arch(void)
-{
-	/* init to some ~sane value until calibrate_delay() runs */
-	loops_per_jiffy = 50000000;
-
-	/* Setup SMP callback */
-#ifdef CONFIG_SMP
-	smp_ops = &maple_smp_ops;
-#endif
-	maple_use_rtas_reboot_and_halt_if_present();
-
-	printk(KERN_DEBUG "Using native/NAP idle loop\n");
-
-	mmio_nvram_init();
-}
-
-/*
- * This is almost identical to pSeries and CHRP. We need to make that
- * code generic at one point, with appropriate bits in the device-tree to
- * identify the presence of an HT APIC
- */
-static void __init maple_init_IRQ(void)
-{
-	struct device_node *root, *np, *mpic_node = NULL;
-	const unsigned int *opprop;
-	unsigned long openpic_addr = 0;
-	int naddr, n, i, opplen, has_isus = 0;
-	struct mpic *mpic;
-	unsigned int flags = 0;
-
-	/* Locate MPIC in the device-tree. Note that there is a bug
-	 * in Maple device-tree where the type of the controller is
-	 * open-pic and not interrupt-controller
-	 */
-
-	for_each_node_by_type(np, "interrupt-controller")
-		if (of_device_is_compatible(np, "open-pic")) {
-			mpic_node = np;
-			break;
-		}
-	if (mpic_node == NULL)
-		for_each_node_by_type(np, "open-pic") {
-			mpic_node = np;
-			break;
-		}
-	if (mpic_node == NULL) {
-		printk(KERN_ERR
-		       "Failed to locate the MPIC interrupt controller\n");
-		return;
-	}
-
-	/* Find address list in /platform-open-pic */
-	root = of_find_node_by_path("/");
-	naddr = of_n_addr_cells(root);
-	opprop = of_get_property(root, "platform-open-pic", &opplen);
-	if (opprop) {
-		openpic_addr = of_read_number(opprop, naddr);
-		has_isus = (opplen > naddr);
-		printk(KERN_DEBUG "OpenPIC addr: %lx, has ISUs: %d\n",
-		       openpic_addr, has_isus);
-	}
-
-	BUG_ON(openpic_addr == 0);
-
-	/* Check for a big endian MPIC */
-	if (of_property_read_bool(np, "big-endian"))
-		flags |= MPIC_BIG_ENDIAN;
-
-	/* XXX Maple specific bits */
-	flags |= MPIC_U3_HT_IRQS;
-	/* All U3/U4 are big-endian, older SLOF firmware doesn't encode this */
-	flags |= MPIC_BIG_ENDIAN;
-
-	/* Setup the openpic driver. More device-tree junks, we hard code no
-	 * ISUs for now. I'll have to revisit some stuffs with the folks doing
-	 * the firmware for those
-	 */
-	mpic = mpic_alloc(mpic_node, openpic_addr, flags,
-			  /*has_isus ? 16 :*/ 0, 0, " MPIC     ");
-	BUG_ON(mpic == NULL);
-
-	/* Add ISUs */
-	opplen /= sizeof(u32);
-	for (n = 0, i = naddr; i < opplen; i += naddr, n++) {
-		unsigned long isuaddr = of_read_number(opprop + i, naddr);
-		mpic_assign_isu(mpic, n, isuaddr);
-	}
-
-	/* All ISUs are setup, complete initialization */
-	mpic_init(mpic);
-	ppc_md.get_irq = mpic_get_irq;
-	of_node_put(mpic_node);
-	of_node_put(root);
-}
-
-static void __init maple_progress(char *s, unsigned short hex)
-{
-	printk("*** %04x : %s\n", hex, s ? s : "");
-}
-
-
-/*
- * Called very early, MMU is off, device-tree isn't unflattened
- */
-static int __init maple_probe(void)
-{
-	if (!of_machine_is_compatible("Momentum,Maple") &&
-	    !of_machine_is_compatible("Momentum,Apache"))
-		return 0;
-
-	pm_power_off = maple_power_off;
-
-	iommu_init_early_dart(&maple_pci_controller_ops);
-
-	return 1;
-}
-
-#ifdef CONFIG_EDAC
-/*
- * Register a platform device for CPC925 memory controller on
- * all boards with U3H (CPC925) bridge.
- */
-static int __init maple_cpc925_edac_setup(void)
-{
-	struct platform_device *pdev;
-	struct device_node *np = NULL;
-	struct resource r;
-	int ret;
-	volatile void __iomem *mem;
-	u32 rev;
-
-	np = of_find_node_by_type(NULL, "memory-controller");
-	if (!np) {
-		printk(KERN_ERR "%s: Unable to find memory-controller node\n",
-			__func__);
-		return -ENODEV;
-	}
-
-	ret = of_address_to_resource(np, 0, &r);
-	of_node_put(np);
-
-	if (ret < 0) {
-		printk(KERN_ERR "%s: Unable to get memory-controller reg\n",
-			__func__);
-		return -ENODEV;
-	}
-
-	mem = ioremap(r.start, resource_size(&r));
-	if (!mem) {
-		printk(KERN_ERR "%s: Unable to map memory-controller memory\n",
-				__func__);
-		return -ENOMEM;
-	}
-
-	rev = __raw_readl(mem);
-	iounmap(mem);
-
-	if (rev < 0x34 || rev > 0x3f) { /* U3H */
-		printk(KERN_ERR "%s: Non-CPC925(U3H) bridge revision: %02x\n",
-			__func__, rev);
-		return 0;
-	}
-
-	pdev = platform_device_register_simple("cpc925_edac", 0, &r, 1);
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	printk(KERN_INFO "%s: CPC925 platform device created\n", __func__);
-
-	return 0;
-}
-machine_device_initcall(maple, maple_cpc925_edac_setup);
-#endif
-
-define_machine(maple) {
-	.name			= "Maple",
-	.probe			= maple_probe,
-	.setup_arch		= maple_setup_arch,
-	.discover_phbs		= maple_pci_init,
-	.init_IRQ		= maple_init_IRQ,
-	.pci_irq_fixup		= maple_pci_irq_fixup,
-	.pci_get_legacy_ide_irq	= maple_pci_get_legacy_ide_irq,
-	.restart		= maple_restart,
-	.halt			= maple_halt,
-	.get_boot_time		= maple_get_boot_time,
-	.set_rtc_time		= maple_set_rtc_time,
-	.get_rtc_time		= maple_get_rtc_time,
-	.progress		= maple_progress,
-	.power_save		= power4_idle,
-};
diff --git a/arch/powerpc/platforms/maple/time.c b/arch/powerpc/platforms/maple/time.c
deleted file mode 100644
index 91606411d2e0..000000000000
--- a/arch/powerpc/platforms/maple/time.c
+++ /dev/null
@@ -1,170 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- *  (c) Copyright 2004 Benjamin Herrenschmidt (benh@kernel.crashing.org),
- *                     IBM Corp. 
- */
-
-#undef DEBUG
-
-#include <linux/errno.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/param.h>
-#include <linux/string.h>
-#include <linux/mm.h>
-#include <linux/init.h>
-#include <linux/time.h>
-#include <linux/adb.h>
-#include <linux/pmu.h>
-#include <linux/interrupt.h>
-#include <linux/mc146818rtc.h>
-#include <linux/bcd.h>
-#include <linux/of_address.h>
-
-#include <asm/sections.h>
-#include <asm/io.h>
-#include <asm/machdep.h>
-#include <asm/time.h>
-
-#include "maple.h"
-
-#ifdef DEBUG
-#define DBG(x...) printk(x)
-#else
-#define DBG(x...)
-#endif
-
-static int maple_rtc_addr;
-
-static int maple_clock_read(int addr)
-{
-	outb_p(addr, maple_rtc_addr);
-	return inb_p(maple_rtc_addr+1);
-}
-
-static void maple_clock_write(unsigned long val, int addr)
-{
-	outb_p(addr, maple_rtc_addr);
-	outb_p(val, maple_rtc_addr+1);
-}
-
-void maple_get_rtc_time(struct rtc_time *tm)
-{
-	do {
-		tm->tm_sec = maple_clock_read(RTC_SECONDS);
-		tm->tm_min = maple_clock_read(RTC_MINUTES);
-		tm->tm_hour = maple_clock_read(RTC_HOURS);
-		tm->tm_mday = maple_clock_read(RTC_DAY_OF_MONTH);
-		tm->tm_mon = maple_clock_read(RTC_MONTH);
-		tm->tm_year = maple_clock_read(RTC_YEAR);
-	} while (tm->tm_sec != maple_clock_read(RTC_SECONDS));
-
-	if (!(maple_clock_read(RTC_CONTROL) & RTC_DM_BINARY)
-	    || RTC_ALWAYS_BCD) {
-		tm->tm_sec = bcd2bin(tm->tm_sec);
-		tm->tm_min = bcd2bin(tm->tm_min);
-		tm->tm_hour = bcd2bin(tm->tm_hour);
-		tm->tm_mday = bcd2bin(tm->tm_mday);
-		tm->tm_mon = bcd2bin(tm->tm_mon);
-		tm->tm_year = bcd2bin(tm->tm_year);
-	  }
-	if ((tm->tm_year + 1900) < 1970)
-		tm->tm_year += 100;
-
-	tm->tm_wday = -1;
-}
-
-int maple_set_rtc_time(struct rtc_time *tm)
-{
-	unsigned char save_control, save_freq_select;
-	int sec, min, hour, mon, mday, year;
-
-	spin_lock(&rtc_lock);
-
-	save_control = maple_clock_read(RTC_CONTROL); /* tell the clock it's being set */
-
-	maple_clock_write((save_control|RTC_SET), RTC_CONTROL);
-
-	save_freq_select = maple_clock_read(RTC_FREQ_SELECT); /* stop and reset prescaler */
-
-	maple_clock_write((save_freq_select|RTC_DIV_RESET2), RTC_FREQ_SELECT);
-
-	sec = tm->tm_sec;
-	min = tm->tm_min;
-	hour = tm->tm_hour;
-	mon = tm->tm_mon;
-	mday = tm->tm_mday;
-	year = tm->tm_year;
-
-	if (!(save_control & RTC_DM_BINARY) || RTC_ALWAYS_BCD) {
-		sec = bin2bcd(sec);
-		min = bin2bcd(min);
-		hour = bin2bcd(hour);
-		mon = bin2bcd(mon);
-		mday = bin2bcd(mday);
-		year = bin2bcd(year);
-	}
-	maple_clock_write(sec, RTC_SECONDS);
-	maple_clock_write(min, RTC_MINUTES);
-	maple_clock_write(hour, RTC_HOURS);
-	maple_clock_write(mon, RTC_MONTH);
-	maple_clock_write(mday, RTC_DAY_OF_MONTH);
-	maple_clock_write(year, RTC_YEAR);
-
-	/* The following flags have to be released exactly in this order,
-	 * otherwise the DS12887 (popular MC146818A clone with integrated
-	 * battery and quartz) will not reset the oscillator and will not
-	 * update precisely 500 ms later. You won't find this mentioned in
-	 * the Dallas Semiconductor data sheets, but who believes data
-	 * sheets anyway ...                           -- Markus Kuhn
-	 */
-	maple_clock_write(save_control, RTC_CONTROL);
-	maple_clock_write(save_freq_select, RTC_FREQ_SELECT);
-
-	spin_unlock(&rtc_lock);
-
-	return 0;
-}
-
-static struct resource rtc_iores = {
-	.name = "rtc",
-	.flags = IORESOURCE_IO | IORESOURCE_BUSY,
-};
-
-time64_t __init maple_get_boot_time(void)
-{
-	struct rtc_time tm;
-	struct device_node *rtcs;
-
-	rtcs = of_find_compatible_node(NULL, "rtc", "pnpPNP,b00");
-	if (rtcs) {
-		struct resource r;
-		if (of_address_to_resource(rtcs, 0, &r)) {
-			printk(KERN_EMERG "Maple: Unable to translate RTC"
-			       " address\n");
-			goto bail;
-		}
-		if (!(r.flags & IORESOURCE_IO)) {
-			printk(KERN_EMERG "Maple: RTC address isn't PIO!\n");
-			goto bail;
-		}
-		maple_rtc_addr = r.start;
-		printk(KERN_INFO "Maple: Found RTC at IO 0x%x\n",
-		       maple_rtc_addr);
-	}
- bail:
-	of_node_put(rtcs);
-	if (maple_rtc_addr == 0) {
-		maple_rtc_addr = RTC_PORT(0); /* legacy address */
-		printk(KERN_INFO "Maple: No device node for RTC, assuming "
-		       "legacy address (0x%x)\n", maple_rtc_addr);
-	}
-
-	rtc_iores.start = maple_rtc_addr;
-	rtc_iores.end = maple_rtc_addr + 7;
-	request_resource(&ioport_resource, &rtc_iores);
-
-	maple_get_rtc_time(&tm);
-	return rtc_tm_to_time64(&tm);
-}
-
-- 
2.46.2


