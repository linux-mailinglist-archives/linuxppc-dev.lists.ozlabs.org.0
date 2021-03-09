Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C260332006
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 08:47:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DvnP41g4Yz3cJv
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Mar 2021 18:47:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DvnNj3dqKz30JZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Mar 2021 18:47:14 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DvnNZ0vXgz9txlJ;
 Tue,  9 Mar 2021 08:47:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5l0ah_5c435U; Tue,  9 Mar 2021 08:47:10 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DvnNY6kQjz9txlH;
 Tue,  9 Mar 2021 08:47:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01CBC8B7CE;
 Tue,  9 Mar 2021 08:47:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8toqZCyn8RX2; Tue,  9 Mar 2021 08:47:10 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 13B6C8B773;
 Tue,  9 Mar 2021 08:47:10 +0100 (CET)
Subject: Re: [PATCH v2 3/7] powerpc: convert config files to generic cmdline
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 xe-linux-external@cisco.com
References: <20210309000247.2989531-4-danielwa@cisco.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5f865584-09c9-d21f-ffb7-23cf07cf058e@csgroup.eu>
Date: Tue, 9 Mar 2021 08:47:09 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210309000247.2989531-4-danielwa@cisco.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Paul Mackerras <paulus@samba.org>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/03/2021 à 01:02, Daniel Walker a écrit :
> This is a scripted mass convert of the config files to use
> the new generic cmdline. There is a bit of a trim effect here.
> It would seems that some of the config haven't been trimmed in
> a while.

If you do that in a separate patch, you loose bisectability.

I think it would have been better to do things in a different way, more or less like I did in my series:
1/ Provide GENERIC cmdline at the same functionnality level as what is spread in the different 
architectures
2/ Convert architectures to the generic with least churn.
3/ Add new features to the generic

> 
> The bash script used to convert is as follows,
> 
> if [[ -z "$1" || -z "$2" ]]; then
>          echo "Two arguments are needed."
>          exit 1
> fi
> mkdir $1
> cp $2 $1/.config
> sed -i 's/CONFIG_CMDLINE=/CONFIG_CMDLINE_BOOL=y\nCONFIG_CMDLINE_PREPEND=/g' $1/.config

This is not correct.

By default, on powerpc the provided command line is used only if the bootloader doesn't provide one.

Otherwise:
- the builtin command line is appended to the one provided by the bootloader if 
CONFIG_CMDLINE_EXTEND is selected
- the builtin command line replaces to the one provided by the bootloader if CONFIG_CMDLINE_FORCE is 
selected


> make ARCH=$1 O=$1 olddefconfig
> make ARCH=$1 O=$1 savedefconfig
> cp $1/defconfig $2
> rm -Rf $1
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>   arch/powerpc/configs/44x/fsp2_defconfig       | 33 +++++++++----------
>   arch/powerpc/configs/44x/iss476-smp_defconfig | 25 +++++++-------
>   arch/powerpc/configs/44x/warp_defconfig       | 17 +++++-----
>   arch/powerpc/configs/holly_defconfig          | 13 ++++----
>   arch/powerpc/configs/mvme5100_defconfig       | 23 ++++++-------
>   arch/powerpc/configs/skiroot_defconfig        | 12 +++----
>   arch/powerpc/configs/storcenter_defconfig     | 18 ++++------
>   7 files changed, 66 insertions(+), 75 deletions(-)
> 
> diff --git a/arch/powerpc/configs/44x/fsp2_defconfig b/arch/powerpc/configs/44x/fsp2_defconfig
> index 30845ce0885a..4993db054589 100644
> --- a/arch/powerpc/configs/44x/fsp2_defconfig
> +++ b/arch/powerpc/configs/44x/fsp2_defconfig
> @@ -1,8 +1,6 @@
> -CONFIG_44x=y
>   # CONFIG_SWAP is not set
>   CONFIG_SYSVIPC=y
>   # CONFIG_CROSS_MEMORY_ATTACH is not set
> -# CONFIG_FHANDLE is not set
>   CONFIG_NO_HZ=y
>   CONFIG_HIGH_RES_TIMERS=y
>   CONFIG_IKCONFIG=y
> @@ -13,24 +11,25 @@ CONFIG_BLK_DEV_INITRD=y
>   # CONFIG_RD_XZ is not set
>   # CONFIG_RD_LZO is not set
>   # CONFIG_RD_LZ4 is not set
> +# CONFIG_FHANDLE is not set
>   CONFIG_KALLSYMS_ALL=y
>   CONFIG_BPF_SYSCALL=y
>   CONFIG_EMBEDDED=y
>   CONFIG_PROFILING=y
> -CONFIG_OPROFILE=y
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE_PREPEND="ip=on rw"
> +CONFIG_44x=y
>   CONFIG_PPC_47x=y
>   # CONFIG_EBONY is not set
>   CONFIG_FSP2=y
>   CONFIG_476FPE_ERR46=y
> -CONFIG_SWIOTLB=y
>   CONFIG_KEXEC=y
>   CONFIG_CRASH_DUMP=y
> -CONFIG_CMDLINE="ip=on rw"
>   # CONFIG_SUSPEND is not set
> -# CONFIG_PCI is not set
> +CONFIG_OPROFILE=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_BLK_DEV_BSG is not set
>   CONFIG_NET=y
>   CONFIG_PACKET=y
>   CONFIG_UNIX=y
> @@ -47,14 +46,12 @@ CONFIG_MTD=y
>   CONFIG_MTD_BLOCK=y
>   CONFIG_MTD_JEDECPROBE=y
>   CONFIG_MTD_CFI_AMDSTD=y
> -CONFIG_MTD_PHYSMAP_OF=y
>   CONFIG_BLK_DEV_RAM=y
>   CONFIG_BLK_DEV_RAM_SIZE=35000
>   # CONFIG_SCSI_PROC_FS is not set
>   CONFIG_BLK_DEV_SD=y
>   # CONFIG_SCSI_LOWLEVEL is not set
>   CONFIG_ATA=y
> -# CONFIG_SATA_PMP is not set
>   # CONFIG_ATA_SFF is not set
>   CONFIG_NETDEVICES=y
>   CONFIG_BONDING=m
> @@ -63,7 +60,6 @@ CONFIG_IBM_EMAC=m
>   # CONFIG_SERIO is not set
>   # CONFIG_VT is not set
>   # CONFIG_LEGACY_PTYS is not set
> -# CONFIG_DEVMEM is not set
>   CONFIG_SERIAL_8250=y
>   CONFIG_SERIAL_8250_CONSOLE=y
>   CONFIG_SERIAL_8250_NR_UARTS=32
> @@ -72,6 +68,7 @@ CONFIG_SERIAL_8250_EXTENDED=y
>   CONFIG_SERIAL_8250_SHARE_IRQ=y
>   CONFIG_SERIAL_OF_PLATFORM=y
>   # CONFIG_HW_RANDOM is not set
> +# CONFIG_DEVMEM is not set
>   CONFIG_I2C=y
>   CONFIG_I2C_IBM_IIC=y
>   CONFIG_PTP_1588_CLOCK=y
> @@ -107,6 +104,12 @@ CONFIG_NFS_V3_ACL=y
>   CONFIG_NFS_V4=y
>   CONFIG_ROOT_NFS=y
>   CONFIG_NLS_DEFAULT="n"
> +CONFIG_CRYPTO_CBC=y
> +CONFIG_CRYPTO_ECB=y
> +CONFIG_CRYPTO_PCBC=y
> +CONFIG_CRYPTO_MD5=y
> +CONFIG_CRYPTO_DES=y
> +# CONFIG_CRYPTO_HW is not set
>   CONFIG_XZ_DEC=y
>   CONFIG_PRINTK_TIME=y
>   CONFIG_MESSAGE_LOGLEVEL_DEFAULT=3
> @@ -114,9 +117,3 @@ CONFIG_DYNAMIC_DEBUG=y
>   CONFIG_DEBUG_INFO=y
>   CONFIG_MAGIC_SYSRQ=y
>   CONFIG_DETECT_HUNG_TASK=y
> -CONFIG_CRYPTO_CBC=y
> -CONFIG_CRYPTO_ECB=y
> -CONFIG_CRYPTO_PCBC=y
> -CONFIG_CRYPTO_MD5=y
> -CONFIG_CRYPTO_DES=y
> -# CONFIG_CRYPTO_HW is not set
> diff --git a/arch/powerpc/configs/44x/iss476-smp_defconfig b/arch/powerpc/configs/44x/iss476-smp_defconfig
> index 2c3834eebca3..b8d97061517a 100644
> --- a/arch/powerpc/configs/44x/iss476-smp_defconfig
> +++ b/arch/powerpc/configs/44x/iss476-smp_defconfig
> @@ -1,5 +1,3 @@
> -CONFIG_44x=y
> -CONFIG_SMP=y
>   CONFIG_SYSVIPC=y
>   CONFIG_POSIX_MQUEUE=y
>   CONFIG_LOG_BUF_SHIFT=14
> @@ -7,20 +5,22 @@ CONFIG_BLK_DEV_INITRD=y
>   CONFIG_EXPERT=y
>   CONFIG_KALLSYMS_ALL=y
>   CONFIG_PROFILING=y
> -CONFIG_OPROFILE=y
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE_PREPEND="root=/dev/issblk0"
> +CONFIG_44x=y
> +CONFIG_SMP=y
>   CONFIG_PPC_47x=y
>   # CONFIG_EBONY is not set
>   CONFIG_ISS4xx=y
>   CONFIG_HZ_100=y
>   CONFIG_MATH_EMULATION=y
>   CONFIG_IRQ_ALL_CPUS=y
> -CONFIG_CMDLINE="root=/dev/issblk0"
> -# CONFIG_PCI is not set
>   CONFIG_ADVANCED_OPTIONS=y
>   CONFIG_DYNAMIC_MEMSTART=y
> +CONFIG_OPROFILE=y
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_BLK_DEV_BSG is not set
>   CONFIG_NET=y
>   CONFIG_PACKET=y
>   CONFIG_UNIX=y
> @@ -34,7 +34,6 @@ CONFIG_MTD=y
>   CONFIG_MTD_BLOCK=y
>   CONFIG_MTD_JEDECPROBE=y
>   CONFIG_MTD_CFI_AMDSTD=y
> -CONFIG_MTD_PHYSMAP_OF=y
>   CONFIG_BLK_DEV_RAM=y
>   CONFIG_BLK_DEV_RAM_SIZE=35000
>   # CONFIG_INPUT is not set
> @@ -57,13 +56,13 @@ CONFIG_PROC_KCORE=y
>   CONFIG_TMPFS=y
>   CONFIG_CRAMFS=y
>   # CONFIG_NETWORK_FILESYSTEMS is not set
> -CONFIG_DEBUG_INFO=y
> -CONFIG_MAGIC_SYSRQ=y
> -CONFIG_DETECT_HUNG_TASK=y
> -CONFIG_PPC_EARLY_DEBUG=y
>   CONFIG_CRYPTO_CBC=y
>   CONFIG_CRYPTO_ECB=y
>   CONFIG_CRYPTO_PCBC=y
>   CONFIG_CRYPTO_MD5=y
>   CONFIG_CRYPTO_DES=y
>   # CONFIG_CRYPTO_HW is not set
> +CONFIG_DEBUG_INFO=y
> +CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_PPC_EARLY_DEBUG=y
> diff --git a/arch/powerpc/configs/44x/warp_defconfig b/arch/powerpc/configs/44x/warp_defconfig
> index 47252c2d7669..d2e4bbe1492c 100644
> --- a/arch/powerpc/configs/44x/warp_defconfig
> +++ b/arch/powerpc/configs/44x/warp_defconfig
> @@ -1,4 +1,3 @@
> -CONFIG_44x=y
>   CONFIG_LOCALVERSION="-pika"
>   # CONFIG_LOCALVERSION_AUTO is not set
>   CONFIG_SYSVIPC=y
> @@ -7,15 +6,16 @@ CONFIG_IKCONFIG_PROC=y
>   CONFIG_LOG_BUF_SHIFT=14
>   CONFIG_BLK_DEV_INITRD=y
>   CONFIG_EXPERT=y
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE_PREPEND="ip=on"
> +CONFIG_44x=y
>   # CONFIG_EBONY is not set
>   CONFIG_WARP=y
>   CONFIG_PPC4xx_GPIO=y
>   CONFIG_HZ_1000=y
> -CONFIG_CMDLINE="ip=on"
> -# CONFIG_PCI is not set
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_BLK_DEV_BSG is not set
>   CONFIG_NET=y
>   CONFIG_PACKET=y
>   CONFIG_UNIX=y
> @@ -31,7 +31,6 @@ CONFIG_MTD_CMDLINE_PARTS=y
>   CONFIG_MTD_BLOCK=y
>   CONFIG_MTD_CFI=y
>   CONFIG_MTD_CFI_AMDSTD=y
> -CONFIG_MTD_PHYSMAP_OF=y
>   CONFIG_MTD_RAW_NAND=y
>   CONFIG_MTD_NAND_NDFC=y
>   CONFIG_MTD_UBI=y
> @@ -88,9 +87,9 @@ CONFIG_NLS_UTF8=y
>   CONFIG_CRC_CCITT=y
>   CONFIG_CRC_T10DIF=y
>   CONFIG_PRINTK_TIME=y
> +# CONFIG_DEBUG_BUGVERBOSE is not set
>   CONFIG_DEBUG_INFO=y
> -CONFIG_DEBUG_FS=y
>   CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DEBUG_FS=y
>   CONFIG_DETECT_HUNG_TASK=y
>   # CONFIG_SCHED_DEBUG is not set
> -# CONFIG_DEBUG_BUGVERBOSE is not set
> diff --git a/arch/powerpc/configs/holly_defconfig b/arch/powerpc/configs/holly_defconfig
> index 271daff47d1d..98c0644e80b4 100644
> --- a/arch/powerpc/configs/holly_defconfig
> +++ b/arch/powerpc/configs/holly_defconfig
> @@ -4,17 +4,18 @@ CONFIG_HIGH_RES_TIMERS=y
>   CONFIG_LOG_BUF_SHIFT=14
>   CONFIG_BLK_DEV_INITRD=y
>   CONFIG_EXPERT=y
> -CONFIG_MODULES=y
> -# CONFIG_BLK_DEV_BSG is not set
> -CONFIG_PARTITION_ADVANCED=y
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE_PREPEND="console=ttyS0,115200"
>   # CONFIG_PPC_CHRP is not set
>   # CONFIG_PPC_PMAC is not set
>   CONFIG_EMBEDDED6xx=y
>   CONFIG_PPC_HOLLY=y
>   CONFIG_GEN_RTC=y
> -CONFIG_BINFMT_MISC=y
> -CONFIG_CMDLINE="console=ttyS0,115200"
>   # CONFIG_SECCOMP is not set
> +CONFIG_MODULES=y
> +# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_BINFMT_MISC=y
>   CONFIG_NET=y
>   CONFIG_PACKET=y
>   CONFIG_UNIX=y
> @@ -53,8 +54,8 @@ CONFIG_PROC_KCORE=y
>   CONFIG_TMPFS=y
>   CONFIG_NFS_FS=y
>   CONFIG_ROOT_NFS=y
> +# CONFIG_DEBUG_BUGVERBOSE is not set
>   CONFIG_MAGIC_SYSRQ=y
>   # CONFIG_SCHED_DEBUG is not set
> -# CONFIG_DEBUG_BUGVERBOSE is not set
>   CONFIG_XMON=y
>   CONFIG_XMON_DEFAULT=y
> diff --git a/arch/powerpc/configs/mvme5100_defconfig b/arch/powerpc/configs/mvme5100_defconfig
> index 1fed6be95d53..884a3e0defde 100644
> --- a/arch/powerpc/configs/mvme5100_defconfig
> +++ b/arch/powerpc/configs/mvme5100_defconfig
> @@ -11,16 +11,17 @@ CONFIG_LOG_BUF_SHIFT=14
>   # CONFIG_NET_NS is not set
>   CONFIG_CC_OPTIMIZE_FOR_SIZE=y
>   # CONFIG_COMPAT_BRK is not set
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE_PREPEND="console=ttyS0,9600 ip=dhcp root=/dev/nfs"
>   # CONFIG_PPC_CHRP is not set
>   # CONFIG_PPC_PMAC is not set
>   CONFIG_EMBEDDED6xx=y
>   CONFIG_MVME5100=y
>   CONFIG_KVM_GUEST=y
>   CONFIG_HZ_100=y
> -CONFIG_CMDLINE="console=ttyS0,9600 ip=dhcp root=/dev/nfs"
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_BLK_DEV_BSG is not set
>   # CONFIG_CORE_DUMP_DEFAULT_ELF_HEADERS is not set
>   # CONFIG_COMPACTION is not set
>   CONFIG_NET=y
> @@ -108,13 +109,6 @@ CONFIG_NLS_CODEPAGE_437=m
>   CONFIG_NLS_CODEPAGE_932=m
>   CONFIG_NLS_ISO8859_1=m
>   CONFIG_NLS_UTF8=m
> -CONFIG_CRC_CCITT=m
> -CONFIG_CRC_T10DIF=y
> -CONFIG_XZ_DEC=y
> -CONFIG_MAGIC_SYSRQ=y
> -CONFIG_DEBUG_KERNEL=y
> -CONFIG_DETECT_HUNG_TASK=y
> -CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=20
>   CONFIG_CRYPTO_CBC=y
>   CONFIG_CRYPTO_PCBC=m
>   CONFIG_CRYPTO_MD5=y
> @@ -125,3 +119,10 @@ CONFIG_CRYPTO_DES=y
>   CONFIG_CRYPTO_SERPENT=m
>   CONFIG_CRYPTO_TWOFISH=m
>   CONFIG_CRYPTO_DEFLATE=m
> +CONFIG_CRC_CCITT=m
> +CONFIG_CRC_T10DIF=y
> +CONFIG_XZ_DEC=y
> +CONFIG_MAGIC_SYSRQ=y
> +CONFIG_DEBUG_KERNEL=y
> +CONFIG_DETECT_HUNG_TASK=y
> +CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=20
> diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
> index b806a5d3a695..5e11995508d7 100644
> --- a/arch/powerpc/configs/skiroot_defconfig
> +++ b/arch/powerpc/configs/skiroot_defconfig
> @@ -26,6 +26,8 @@ CONFIG_PERF_EVENTS=y
>   # CONFIG_SLAB_MERGE_DEFAULT is not set
>   CONFIG_SLAB_FREELIST_RANDOM=y
>   CONFIG_SLAB_FREELIST_HARDENED=y
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE_PREPEND="console=tty0 console=hvc0 ipr.fast_reboot=1 quiet"
>   CONFIG_PPC64=y
>   CONFIG_ALTIVEC=y
>   CONFIG_VSX=y
> @@ -42,14 +44,11 @@ CONFIG_KEXEC=y
>   CONFIG_KEXEC_FILE=y
>   CONFIG_PRESERVE_FA_DUMP=y
>   CONFIG_IRQ_ALL_CPUS=y
> -CONFIG_NUMA=y
>   CONFIG_PPC_64K_PAGES=y
>   CONFIG_SCHED_SMT=y
> -CONFIG_CMDLINE="console=tty0 console=hvc0 ipr.fast_reboot=1 quiet"
> -# CONFIG_SECCOMP is not set
>   # CONFIG_PPC_MEM_KEYS is not set
>   CONFIG_JUMP_LABEL=y
> -CONFIG_STRICT_KERNEL_RWX=y
> +# CONFIG_SECCOMP is not set
>   CONFIG_MODULES=y
>   CONFIG_MODULE_UNLOAD=y
>   CONFIG_MODULE_SIG_FORCE=y
> @@ -80,7 +79,6 @@ CONFIG_BLK_DEV_NVME=m
>   CONFIG_NVME_MULTIPATH=y
>   CONFIG_EEPROM_AT24=m
>   # CONFIG_CXL is not set
> -# CONFIG_OCXL is not set
>   CONFIG_BLK_DEV_SD=m
>   CONFIG_BLK_DEV_SR=m
>   CONFIG_CHR_DEV_SG=m
> @@ -199,7 +197,6 @@ CONFIG_PHYLIB=y
>   CONFIG_INPUT_EVDEV=y
>   CONFIG_INPUT_MISC=y
>   # CONFIG_SERIO_SERPORT is not set
> -# CONFIG_DEVMEM is not set
>   CONFIG_SERIAL_8250=y
>   CONFIG_SERIAL_8250_CONSOLE=y
>   CONFIG_IPMI_HANDLER=y
> @@ -207,9 +204,10 @@ CONFIG_IPMI_DEVICE_INTERFACE=y
>   CONFIG_IPMI_POWERNV=y
>   CONFIG_IPMI_WATCHDOG=y
>   CONFIG_HW_RANDOM=y
> +# CONFIG_DEVMEM is not set
> +# CONFIG_DEVPORT is not set
>   CONFIG_TCG_TPM=y
>   CONFIG_TCG_TIS_I2C_NUVOTON=y
> -# CONFIG_DEVPORT is not set
>   CONFIG_I2C=y
>   # CONFIG_I2C_COMPAT is not set
>   CONFIG_I2C_CHARDEV=y
> diff --git a/arch/powerpc/configs/storcenter_defconfig b/arch/powerpc/configs/storcenter_defconfig
> index 47dcfaddc1ac..17a17b8ae160 100644
> --- a/arch/powerpc/configs/storcenter_defconfig
> +++ b/arch/powerpc/configs/storcenter_defconfig
> @@ -2,18 +2,19 @@ CONFIG_SYSVIPC=y
>   CONFIG_LOG_BUF_SHIFT=14
>   CONFIG_EXPERT=y
>   # CONFIG_KALLSYMS is not set
> -CONFIG_MODULES=y
> -CONFIG_MODULE_UNLOAD=y
> -# CONFIG_BLK_DEV_BSG is not set
> -CONFIG_PARTITION_ADVANCED=y
> +CONFIG_CMDLINE_BOOL=y
> +CONFIG_CMDLINE_PREPEND="console=ttyS0,115200"
>   # CONFIG_PPC_CHRP is not set
>   # CONFIG_PPC_PMAC is not set
>   CONFIG_EMBEDDED6xx=y
>   CONFIG_STORCENTER=y
>   CONFIG_HZ_100=y
> -CONFIG_BINFMT_MISC=y
> -CONFIG_CMDLINE="console=ttyS0,115200"
>   # CONFIG_SECCOMP is not set
> +CONFIG_MODULES=y
> +CONFIG_MODULE_UNLOAD=y
> +# CONFIG_BLK_DEV_BSG is not set
> +CONFIG_PARTITION_ADVANCED=y
> +CONFIG_BINFMT_MISC=y
>   CONFIG_NET=y
>   CONFIG_PACKET=m
>   CONFIG_UNIX=y
> @@ -35,7 +36,6 @@ CONFIG_BLK_DEV_SD=y
>   CONFIG_BLK_DEV_SR=y
>   CONFIG_SCSI_SPI_ATTRS=y
>   CONFIG_ATA=y
> -CONFIG_PATA_VIA=y
>   CONFIG_MD=y
>   CONFIG_BLK_DEV_MD=y
>   CONFIG_MD_LINEAR=y
> @@ -44,16 +44,13 @@ CONFIG_MD_RAID1=y
>   CONFIG_MD_RAID456=y
>   CONFIG_NETDEVICES=y
>   CONFIG_DUMMY=m
> -CONFIG_R8169=y
>   # CONFIG_INPUT is not set
>   # CONFIG_SERIO is not set
>   # CONFIG_VT is not set
>   CONFIG_SERIAL_8250=y
>   CONFIG_SERIAL_8250_CONSOLE=y
> -# CONFIG_SERIAL_8250_PCI is not set
>   CONFIG_SERIAL_8250_NR_UARTS=2
>   CONFIG_SERIAL_8250_RUNTIME_UARTS=2
> -CONFIG_NVRAM=y
>   CONFIG_I2C=y
>   CONFIG_I2C_CHARDEV=y
>   CONFIG_I2C_MPC=y
> @@ -76,4 +73,3 @@ CONFIG_NLS_CODEPAGE_437=y
>   CONFIG_NLS_ISO8859_1=y
>   CONFIG_NLS_UTF8=y
>   CONFIG_CRC_T10DIF=y
> -# CONFIG_ENABLE_MUST_CHECK is not set
> 
