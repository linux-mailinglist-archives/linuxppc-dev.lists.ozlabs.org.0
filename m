Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32A6E24B4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:50:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PydBP10CYz3fsb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:50:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LSAKrRu2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pycd23DPfz3fR7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:25:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=LSAKrRu2;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pycd11td3z4xFp;
	Fri, 14 Apr 2023 23:25:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681478709;
	bh=jor0a0KWhYqVsbg+TNw5Wvj0geZRadaKhGXQdRHf0ZU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LSAKrRu2OVgbDs0eVMBRg6u7Pjj5WA17GqCfoKyqA2HQaT74MO7v+WTDE5URph+Sg
	 8oGwaXZUcIVYXuXy1wGTL0iTv+LSD72nhCkBUXCBHavQ7yVzOkrZ60ad0U1z01beJN
	 qXKrmdqZ9KNxvjy9mW0of0Wj3iYsuucT9D0b7mtTLAkLjjgdHvCNmu1cQfUPGq/DVA
	 XUbBv5Yi75MPfl9Uo9Q4mm2Qk+dSMv4tx9gGdeTjj+uwnBpJnLFDGJiTreO5/7St4z
	 p4Oth7ysj5Eh4pvJ8dSqhHoNA7BIBY/hiS3yJcYEpxZ0dWmjjnmgA7HKbhztdoZNyK
	 urAIj1SaGecTQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 32/32] powerpc/configs: Make pseries_defconfig an alias for ppc64le_guest
Date: Fri, 14 Apr 2023 23:24:15 +1000
Message-Id: <20230414132415.821564-32-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230414132415.821564-1-mpe@ellerman.id.au>
References: <20230414132415.821564-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rather than trying to keep multiple configs up to date, make
pseries_defconfig an alias for ppc64le_guest_defconfig.

NOTE, pseries_defconfig was a big endian config, but this commit
switches it to little endian.

Almost all distros are ppc64le these days, so little endian is much more
likely to be what a user wants when they build for "pseries".

For an actual big endian guest, use ppc64_guest_defconfig.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/Makefile                  |   3 +
 arch/powerpc/configs/pseries_defconfig | 323 -------------------------
 2 files changed, 3 insertions(+), 323 deletions(-)
 delete mode 100644 arch/powerpc/configs/pseries_defconfig

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 5b332d222ede..b7c44ebbf923 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -263,6 +263,9 @@ generated_configs += ppc64_guest_defconfig
 generated_configs += pseries_le_defconfig
 pseries_le_defconfig: ppc64le_guest_defconfig
 
+generated_configs += pseries_defconfig
+pseries_defconfig: ppc64le_guest_defconfig
+
 generated_configs += powernv_be_defconfig
 powernv_be_defconfig:
 	$(call merge_into_defconfig,powernv_defconfig,be)
diff --git a/arch/powerpc/configs/pseries_defconfig b/arch/powerpc/configs/pseries_defconfig
deleted file mode 100644
index 7497e17ea657..000000000000
--- a/arch/powerpc/configs/pseries_defconfig
+++ /dev/null
@@ -1,323 +0,0 @@
-CONFIG_PPC64=y
-CONFIG_NR_CPUS=2048
-CONFIG_SYSVIPC=y
-CONFIG_POSIX_MQUEUE=y
-CONFIG_AUDIT=y
-# CONFIG_CONTEXT_TRACKING_USER_FORCE is not set
-CONFIG_NO_HZ=y
-CONFIG_HIGH_RES_TIMERS=y
-CONFIG_VIRT_CPU_ACCOUNTING_GEN=y
-CONFIG_TASKSTATS=y
-CONFIG_TASK_DELAY_ACCT=y
-CONFIG_TASK_XACCT=y
-CONFIG_TASK_IO_ACCOUNTING=y
-CONFIG_IKCONFIG=y
-CONFIG_IKCONFIG_PROC=y
-CONFIG_LOG_BUF_SHIFT=18
-CONFIG_LOG_CPU_MAX_BUF_SHIFT=13
-CONFIG_NUMA_BALANCING=y
-CONFIG_CGROUPS=y
-CONFIG_MEMCG=y
-CONFIG_CGROUP_SCHED=y
-CONFIG_CGROUP_FREEZER=y
-CONFIG_CPUSETS=y
-CONFIG_CGROUP_DEVICE=y
-CONFIG_CGROUP_CPUACCT=y
-CONFIG_CGROUP_PERF=y
-CONFIG_CGROUP_BPF=y
-CONFIG_USER_NS=y
-CONFIG_BLK_DEV_INITRD=y
-CONFIG_BPF_SYSCALL=y
-# CONFIG_COMPAT_BRK is not set
-CONFIG_PROFILING=y
-CONFIG_KPROBES=y
-CONFIG_JUMP_LABEL=y
-CONFIG_MODULES=y
-CONFIG_MODULE_UNLOAD=y
-CONFIG_MODVERSIONS=y
-CONFIG_MODULE_SRCVERSION_ALL=y
-CONFIG_PARTITION_ADVANCED=y
-CONFIG_PPC_SPLPAR=y
-CONFIG_DTL=y
-CONFIG_PPC_SMLPAR=y
-CONFIG_IBMEBUS=y
-CONFIG_LIBNVDIMM=m
-CONFIG_PAPR_SCM=m
-CONFIG_PPC_SVM=y
-# CONFIG_PPC_PMAC is not set
-CONFIG_RTAS_FLASH=m
-CONFIG_CPU_FREQ_DEFAULT_GOV_ONDEMAND=y
-CONFIG_HZ_100=y
-CONFIG_BINFMT_MISC=m
-CONFIG_PPC_TRANSACTIONAL_MEM=y
-CONFIG_KEXEC=y
-CONFIG_KEXEC_FILE=y
-CONFIG_IRQ_ALL_CPUS=y
-CONFIG_MEMORY_HOTPLUG=y
-CONFIG_MEMORY_HOTREMOVE=y
-CONFIG_KSM=y
-CONFIG_TRANSPARENT_HUGEPAGE=y
-CONFIG_SCHED_SMT=y
-CONFIG_HOTPLUG_PCI=y
-CONFIG_HOTPLUG_PCI_RPA=m
-CONFIG_HOTPLUG_PCI_RPA_DLPAR=m
-CONFIG_NET=y
-CONFIG_PACKET=y
-CONFIG_UNIX=y
-CONFIG_XFRM_USER=m
-CONFIG_NET_KEY=m
-CONFIG_INET=y
-CONFIG_IP_MULTICAST=y
-CONFIG_NET_IPIP=y
-CONFIG_SYN_COOKIES=y
-CONFIG_INET_AH=m
-CONFIG_INET_ESP=m
-CONFIG_INET_IPCOMP=m
-# CONFIG_IPV6 is not set
-CONFIG_NETFILTER=y
-# CONFIG_NETFILTER_ADVANCED is not set
-CONFIG_BRIDGE=m
-CONFIG_VLAN_8021Q=m
-CONFIG_NET_SCHED=y
-CONFIG_NET_CLS_BPF=m
-CONFIG_NET_CLS_ACT=y
-CONFIG_NET_ACT_BPF=m
-CONFIG_BPF_JIT=y
-CONFIG_DEVTMPFS=y
-CONFIG_DEVTMPFS_MOUNT=y
-CONFIG_PARPORT=m
-CONFIG_PARPORT_PC=m
-CONFIG_BLK_DEV_FD=m
-CONFIG_BLK_DEV_LOOP=y
-CONFIG_BLK_DEV_NBD=m
-CONFIG_BLK_DEV_RAM=y
-CONFIG_BLK_DEV_RAM_SIZE=65536
-CONFIG_VIRTIO_BLK=m
-CONFIG_BLK_DEV_NVME=y
-CONFIG_BLK_DEV_SD=y
-CONFIG_CHR_DEV_ST=m
-CONFIG_BLK_DEV_SR=y
-CONFIG_CHR_DEV_SG=y
-CONFIG_SCSI_CONSTANTS=y
-CONFIG_SCSI_FC_ATTRS=y
-CONFIG_SCSI_CXGB3_ISCSI=m
-CONFIG_SCSI_CXGB4_ISCSI=m
-CONFIG_SCSI_BNX2_ISCSI=m
-CONFIG_BE2ISCSI=m
-CONFIG_SCSI_MPT2SAS=m
-CONFIG_SCSI_IBMVSCSI=y
-CONFIG_SCSI_IBMVFC=m
-CONFIG_SCSI_SYM53C8XX_2=m
-CONFIG_SCSI_SYM53C8XX_DMA_ADDRESSING_MODE=0
-CONFIG_SCSI_IPR=y
-CONFIG_SCSI_QLA_FC=m
-CONFIG_SCSI_QLA_ISCSI=m
-CONFIG_SCSI_LPFC=m
-CONFIG_SCSI_VIRTIO=m
-CONFIG_SCSI_DH=y
-CONFIG_SCSI_DH_RDAC=m
-CONFIG_SCSI_DH_ALUA=m
-CONFIG_ATA=y
-CONFIG_SATA_AHCI=y
-CONFIG_PATA_AMD=y
-CONFIG_ATA_GENERIC=y
-CONFIG_MD=y
-CONFIG_BLK_DEV_MD=y
-CONFIG_MD_LINEAR=y
-CONFIG_MD_RAID0=y
-CONFIG_MD_RAID1=y
-CONFIG_MD_RAID10=m
-CONFIG_MD_RAID456=m
-CONFIG_MD_MULTIPATH=m
-CONFIG_MD_FAULTY=m
-CONFIG_BLK_DEV_DM=y
-CONFIG_DM_CRYPT=m
-CONFIG_DM_SNAPSHOT=m
-CONFIG_DM_THIN_PROVISIONING=m
-CONFIG_DM_MIRROR=m
-CONFIG_DM_ZERO=m
-CONFIG_DM_MULTIPATH=m
-CONFIG_DM_MULTIPATH_QL=m
-CONFIG_DM_MULTIPATH_ST=m
-CONFIG_DM_UEVENT=y
-CONFIG_BONDING=m
-CONFIG_DUMMY=m
-CONFIG_MACVLAN=m
-CONFIG_MACVTAP=m
-CONFIG_VXLAN=m
-CONFIG_NETCONSOLE=y
-CONFIG_TUN=m
-CONFIG_VETH=m
-CONFIG_VIRTIO_NET=m
-CONFIG_VORTEX=m
-CONFIG_ACENIC=m
-CONFIG_ACENIC_OMIT_TIGON_I=y
-CONFIG_PCNET32=m
-CONFIG_TIGON3=y
-CONFIG_BNX2X=m
-CONFIG_CHELSIO_T1=m
-CONFIG_BE2NET=m
-CONFIG_S2IO=m
-CONFIG_IBMVETH=y
-CONFIG_EHEA=y
-CONFIG_IBMVNIC=y
-CONFIG_E100=y
-CONFIG_E1000=y
-CONFIG_E1000E=y
-CONFIG_IXGB=m
-CONFIG_IXGBE=m
-CONFIG_I40E=m
-CONFIG_MLX4_EN=m
-CONFIG_MYRI10GE=m
-CONFIG_NETXEN_NIC=m
-CONFIG_PPP=m
-CONFIG_PPP_BSDCOMP=m
-CONFIG_PPP_DEFLATE=m
-CONFIG_PPPOE=m
-CONFIG_PPP_ASYNC=m
-CONFIG_PPP_SYNC_TTY=m
-CONFIG_INPUT_EVDEV=m
-CONFIG_INPUT_MISC=y
-CONFIG_INPUT_PCSPKR=m
-# CONFIG_SERIO_SERPORT is not set
-CONFIG_SERIAL_8250=y
-CONFIG_SERIAL_8250_CONSOLE=y
-CONFIG_SERIAL_ICOM=m
-CONFIG_SERIAL_JSM=m
-CONFIG_HVC_CONSOLE=y
-CONFIG_HVC_RTAS=y
-CONFIG_HVCS=m
-CONFIG_VIRTIO_CONSOLE=m
-CONFIG_IBM_BSR=m
-CONFIG_I2C_CHARDEV=y
-CONFIG_FB=y
-CONFIG_FIRMWARE_EDID=y
-CONFIG_FB_OF=y
-CONFIG_FB_MATROX=y
-CONFIG_FB_MATROX_MILLENIUM=y
-CONFIG_FB_MATROX_MYSTIQUE=y
-CONFIG_FB_MATROX_G=y
-CONFIG_FB_RADEON=y
-CONFIG_FB_IBM_GXT4500=y
-CONFIG_LCD_PLATFORM=m
-# CONFIG_VGA_CONSOLE is not set
-CONFIG_FRAMEBUFFER_CONSOLE=y
-CONFIG_LOGO=y
-CONFIG_HID_GYRATION=y
-CONFIG_HID_PANTHERLORD=y
-CONFIG_HID_PETALYNX=y
-CONFIG_HID_SAMSUNG=y
-CONFIG_HID_SUNPLUS=y
-CONFIG_USB_HIDDEV=y
-CONFIG_USB=y
-CONFIG_USB_MON=m
-CONFIG_USB_EHCI_HCD=y
-# CONFIG_USB_EHCI_HCD_PPC_OF is not set
-CONFIG_USB_OHCI_HCD=y
-CONFIG_USB_XHCI_HCD=y
-CONFIG_USB_STORAGE=m
-CONFIG_NEW_LEDS=y
-CONFIG_LEDS_CLASS=m
-CONFIG_LEDS_POWERNV=m
-CONFIG_INFINIBAND=m
-CONFIG_INFINIBAND_USER_MAD=m
-CONFIG_INFINIBAND_USER_ACCESS=m
-CONFIG_INFINIBAND_MTHCA=m
-CONFIG_INFINIBAND_CXGB4=m
-CONFIG_MLX4_INFINIBAND=m
-CONFIG_INFINIBAND_IPOIB=m
-CONFIG_INFINIBAND_IPOIB_CM=y
-CONFIG_INFINIBAND_SRP=m
-CONFIG_INFINIBAND_ISER=m
-CONFIG_RTC_CLASS=y
-CONFIG_RTC_DRV_GENERIC=y
-CONFIG_VIRTIO_PCI=m
-CONFIG_VIRTIO_BALLOON=m
-CONFIG_EXT2_FS=y
-CONFIG_EXT2_FS_XATTR=y
-CONFIG_EXT2_FS_POSIX_ACL=y
-CONFIG_EXT2_FS_SECURITY=y
-CONFIG_EXT4_FS=y
-CONFIG_EXT4_FS_POSIX_ACL=y
-CONFIG_EXT4_FS_SECURITY=y
-CONFIG_JFS_FS=m
-CONFIG_JFS_POSIX_ACL=y
-CONFIG_JFS_SECURITY=y
-CONFIG_XFS_FS=m
-CONFIG_XFS_POSIX_ACL=y
-CONFIG_BTRFS_FS=m
-CONFIG_BTRFS_FS_POSIX_ACL=y
-CONFIG_NILFS2_FS=m
-CONFIG_FS_DAX=y
-CONFIG_AUTOFS4_FS=m
-CONFIG_FUSE_FS=m
-CONFIG_OVERLAY_FS=m
-CONFIG_ISO9660_FS=y
-CONFIG_UDF_FS=m
-CONFIG_MSDOS_FS=y
-CONFIG_VFAT_FS=m
-CONFIG_PROC_KCORE=y
-CONFIG_TMPFS=y
-CONFIG_TMPFS_POSIX_ACL=y
-CONFIG_HUGETLBFS=y
-CONFIG_CRAMFS=m
-CONFIG_SQUASHFS=m
-CONFIG_SQUASHFS_XATTR=y
-CONFIG_SQUASHFS_LZO=y
-CONFIG_SQUASHFS_XZ=y
-CONFIG_PSTORE=y
-CONFIG_NFS_FS=y
-CONFIG_NFS_V3_ACL=y
-CONFIG_NFS_V4=y
-CONFIG_NFSD=m
-CONFIG_NFSD_V3_ACL=y
-CONFIG_NFSD_V4=y
-CONFIG_CIFS=m
-CONFIG_CIFS_XATTR=y
-CONFIG_CIFS_POSIX=y
-CONFIG_NLS_DEFAULT="utf8"
-CONFIG_NLS_CODEPAGE_437=y
-CONFIG_NLS_ASCII=y
-CONFIG_NLS_ISO8859_1=y
-CONFIG_NLS_UTF8=y
-CONFIG_MAGIC_SYSRQ=y
-CONFIG_DEBUG_KERNEL=y
-CONFIG_DEBUG_STACK_USAGE=y
-CONFIG_DEBUG_STACKOVERFLOW=y
-CONFIG_SOFTLOCKUP_DETECTOR=y
-CONFIG_HARDLOCKUP_DETECTOR=y
-CONFIG_FUNCTION_TRACER=y
-CONFIG_FTRACE_SYSCALLS=y
-CONFIG_SCHED_TRACER=y
-CONFIG_STACK_TRACER=y
-CONFIG_BLK_DEV_IO_TRACE=y
-CONFIG_CODE_PATCHING_SELFTEST=y
-CONFIG_FTR_FIXUP_SELFTEST=y
-CONFIG_MSI_BITMAP_SELFTEST=y
-CONFIG_XMON=y
-CONFIG_CRYPTO_TEST=m
-CONFIG_CRYPTO_PCBC=m
-CONFIG_CRYPTO_HMAC=y
-CONFIG_CRYPTO_CRC32C_VPMSUM=m
-CONFIG_CRYPTO_MD5_PPC=m
-CONFIG_CRYPTO_MICHAEL_MIC=m
-CONFIG_CRYPTO_SHA1_PPC=m
-CONFIG_CRYPTO_SHA256=y
-CONFIG_CRYPTO_WP512=m
-CONFIG_CRYPTO_ANUBIS=m
-CONFIG_CRYPTO_BLOWFISH=m
-CONFIG_CRYPTO_CAST6=m
-CONFIG_CRYPTO_KHAZAD=m
-CONFIG_CRYPTO_SERPENT=m
-CONFIG_CRYPTO_TEA=m
-CONFIG_CRYPTO_TWOFISH=m
-CONFIG_CRYPTO_LZO=m
-CONFIG_CRYPTO_DEV_NX=y
-CONFIG_CRYPTO_DEV_NX_ENCRYPT=m
-CONFIG_CRYPTO_DEV_VMX=y
-CONFIG_VIRTUALIZATION=y
-CONFIG_KVM_BOOK3S_64=m
-CONFIG_KVM_BOOK3S_64_HV=m
-CONFIG_VHOST_NET=m
-CONFIG_PRINTK_TIME=y
-CONFIG_PRINTK_CALLER=y
-- 
2.39.2

