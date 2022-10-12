Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FEB15FC96A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 18:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MndnT56lJz3ds3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 03:45:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P9dIqtNR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=groeck7@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=P9dIqtNR;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MndmW1x9bz3bjr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 03:44:57 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id h10so16772488plb.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 09:44:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ey/MykJEk63i05VPUc+DFNtZLXhqKF7E/oBAEq8JTxo=;
        b=P9dIqtNRDK9c1bKXVTL8xukXKyDL6ihlkzKGW9sSMo5A3P4bZUxNZiE9jIirV3kHk1
         p8Mn3GJQlW+LVi5sy+b0HEsb5rK4Df8fuN/i2ta6RICXEcuo+HvLS6JA4fBMiZvVEm9k
         JwVeaOx2uI5FxnVfGtT0kYGv1yypeJWe2DcY5TBcnm4AdgRT5aIImnbHDk41phLlPkJo
         o7ExhV9jCJzuekQWPF9MdmPslcexznpf4Ok/MeWs6XwiQPnSsjOJJJ3rKkdee1vIFf+K
         0qTy/ghkIBPsmMIuKasYgSDXXab63oLV/UTASEtDnX/98YcMnagrL+F8frY1ZPhh7D/e
         Su4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ey/MykJEk63i05VPUc+DFNtZLXhqKF7E/oBAEq8JTxo=;
        b=g8xhfp8dsNhpUY7oBA2gf4w67XT4Ajea84Vvgt+j/bCNpYTOQSNC+fVV55cE3MwL7C
         zTdu10uST/g+TBhU8v6VPcHZwYtv+l8JFeI3vw/J3yeWpFyWDvssTvQcIv+pvUoHyLKF
         dSangcXu1N7wKO3CLgVrd1APsqIT8DVJ1KqCpH5N5trSVFkBo6Q7ApNyuttarClR2vXF
         n1FJ5FEdLdn3lMlJDf6BpS+AJcDEgeC+CGhELAithdIxxgq+vylQRcFmPuTlNKaGcfj1
         ItDJZRoxIeDoSf9b57XCW+fy2uvECnLfSZHCW78nMAZV6d/HAIGkP8XLuCh2KZ/hgPGp
         3XbQ==
X-Gm-Message-State: ACrzQf3+MPwH8/ZOtIwz28/8RAT8SqW0MH4+ivUJ2/ro19/JEIraC43W
	cajG3VxzUkI8T7CEGViufyA=
X-Google-Smtp-Source: AMsMyM5r1yfpIgIXaso2ljlPUm6NilPvRIPblum+H5yor6q+S6vLwhm/cPy1xPOW0eTuEztSge2iew==
X-Received: by 2002:a17:903:2342:b0:17c:ae18:1c86 with SMTP id c2-20020a170903234200b0017cae181c86mr29785526plh.5.1665593094199;
        Wed, 12 Oct 2022 09:44:54 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g18-20020a17090ae59200b0020ae09e9724sm1668824pjz.53.2022.10.12.09.44.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 09:44:53 -0700 (PDT)
Date: Wed, 12 Oct 2022 09:44:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
Message-ID: <20221012164452.GA2990467@roeck-us.net>
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net>
 <Y0biBtCUtc2mowbQ@zx2c4.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <Y0biBtCUtc2mowbQ@zx2c4.com>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, npiggin@gmail.com, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 12, 2022 at 09:49:26AM -0600, Jason A. Donenfeld wrote:
> On Wed, Oct 12, 2022 at 07:18:27AM -0700, Guenter Roeck wrote:
> > NIP [c000000000031630] .replay_soft_interrupts+0x60/0x300
> > LR [c000000000031964] .arch_local_irq_restore+0x94/0x1c0
> > Call Trace:
> > [c000000007df3870] [c000000000031964] .arch_local_irq_restore+0x94/0x1c0 (unreliable)
> > [c000000007df38f0] [c000000000f8a444] .__schedule+0x664/0xa50
> > [c000000007df39d0] [c000000000f8a8b0] .schedule+0x80/0x140
> > [c000000007df3a50] [c00000000092f0dc] .try_to_generate_entropy+0x118/0x174
> > [c000000007df3b40] [c00000000092e2e4] .urandom_read_iter+0x74/0x140
> > [c000000007df3bc0] [c0000000003b0044] .vfs_read+0x284/0x2d0
> > [c000000007df3cd0] [c0000000003b0d2c] .ksys_read+0xdc/0x130
> > [c000000007df3d80] [c00000000002a88c] .system_call_exception+0x19c/0x330
> > [c000000007df3e10] [c00000000000c1d4] system_call_common+0xf4/0x258
> 
> Obviously the first couple lines of this concern me a bit. But I think
> actually this might just be a catalyst for another bug. You could view
> that function as basically just:
> 
>     while (something)
>     	schedule();
> 
> And I guess in the process of calling the scheduler a lot, which toggles
> interrupts a lot, something got wedged.
> 
> Curious, though, I did try to reproduce this, to no avail. My .config is
> https://xn--4db.cc/rBvHWfDZ . What's yours?
> 

Attached. My qemu command line is

qemu-system-ppc64 -M mac99 -cpu ppc64 \
     -m 1G -kernel vmlinux -snapshot -device e1000,netdev=net0 \
     -netdev user,id=net0 -device sdhci-pci -device sd-card,drive=d0 \
     -drive file=/var/cache/buildbot/ppc64/rootfs.ext2,format=raw,if=none,id=d0 \
     -nographic -vga none -monitor null -no-reboot \
     --append "root=/dev/mmcblk0 rootwait console=tty console=ttyS0"

Qemu version is 7.0. The root file system is from
https://github.com/groeck/linux-build-test/tree/master/rootfs/ppc64

I used to have self tests enabled, but with that (specifically, with
CONFIG_STRING_SELFTEST=y) I now get a different hang, so I disabled that
for the time being.

Guenter

--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename=defconfig

CONFIG_SYSVIPC=y
CONFIG_POSIX_MQUEUE=y
CONFIG_HIGH_RES_TIMERS=y
CONFIG_PREEMPT=y
CONFIG_VIRT_CPU_ACCOUNTING_NATIVE=y
CONFIG_BSD_PROCESS_ACCT=y
CONFIG_BSD_PROCESS_ACCT_V3=y
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_CGROUPS=y
CONFIG_MEMCG=y
CONFIG_BLK_CGROUP=y
CONFIG_CGROUP_SCHED=y
CONFIG_RT_GROUP_SCHED=y
CONFIG_CGROUP_FREEZER=y
CONFIG_CPUSETS=y
CONFIG_CGROUP_DEVICE=y
CONFIG_CGROUP_CPUACCT=y
CONFIG_CGROUP_DEBUG=y
CONFIG_NAMESPACES=y
CONFIG_BLK_DEV_INITRD=y
CONFIG_EMBEDDED=y
CONFIG_PROFILING=y
CONFIG_PPC64=y
# CONFIG_PPC_POWERNV is not set
CONFIG_DTL=y
# CONFIG_CPU_IDLE is not set
CONFIG_MODULES=y
CONFIG_MODULE_UNLOAD=y
CONFIG_BINFMT_MISC=m
CONFIG_NET=y
CONFIG_PACKET=y
CONFIG_UNIX=y
CONFIG_XFRM_USER=m
CONFIG_XFRM_SUB_POLICY=y
CONFIG_NET_KEY=m
CONFIG_NET_KEY_MIGRATE=y
CONFIG_INET=y
CONFIG_IP_MULTICAST=y
CONFIG_IP_ADVANCED_ROUTER=y
CONFIG_IP_MULTIPLE_TABLES=y
CONFIG_IP_ROUTE_MULTIPATH=y
CONFIG_IP_ROUTE_VERBOSE=y
CONFIG_IP_PNP=y
CONFIG_IP_PNP_BOOTP=y
CONFIG_IP_PNP_RARP=y
CONFIG_NET_IPIP=m
CONFIG_IP_MROUTE=y
CONFIG_IP_PIMSM_V1=y
CONFIG_IP_PIMSM_V2=y
CONFIG_SYN_COOKIES=y
CONFIG_INET_AH=m
CONFIG_INET_ESP=m
CONFIG_INET_IPCOMP=m
CONFIG_IPV6_ROUTER_PREF=y
CONFIG_INET6_AH=y
CONFIG_INET6_ESP=y
CONFIG_INET6_IPCOMP=m
CONFIG_IPV6_TUNNEL=m
CONFIG_NETFILTER=y
CONFIG_NF_CONNTRACK=m
CONFIG_NF_CONNTRACK_AMANDA=m
CONFIG_NF_CONNTRACK_FTP=m
CONFIG_NF_CONNTRACK_H323=m
CONFIG_NF_CONNTRACK_IRC=m
CONFIG_NF_CONNTRACK_NETBIOS_NS=m
CONFIG_NF_CONNTRACK_PPTP=m
CONFIG_NF_CONNTRACK_SANE=m
CONFIG_NF_CONNTRACK_SIP=m
CONFIG_NF_CONNTRACK_TFTP=m
CONFIG_NF_CT_NETLINK=m
CONFIG_NETFILTER_XT_TARGET_CLASSIFY=m
CONFIG_NETFILTER_XT_TARGET_CONNMARK=m
CONFIG_NETFILTER_XT_TARGET_DSCP=m
CONFIG_NETFILTER_XT_TARGET_MARK=m
CONFIG_NETFILTER_XT_TARGET_NFLOG=m
CONFIG_NETFILTER_XT_TARGET_NFQUEUE=m
CONFIG_NETFILTER_XT_TARGET_NOTRACK=m
CONFIG_NETFILTER_XT_TARGET_TRACE=m
CONFIG_NETFILTER_XT_TARGET_TCPMSS=m
CONFIG_NETFILTER_XT_MATCH_COMMENT=m
CONFIG_NETFILTER_XT_MATCH_CONNBYTES=m
CONFIG_NETFILTER_XT_MATCH_CONNLIMIT=m
CONFIG_NETFILTER_XT_MATCH_CONNMARK=m
CONFIG_NETFILTER_XT_MATCH_CONNTRACK=m
CONFIG_NETFILTER_XT_MATCH_DCCP=m
CONFIG_NETFILTER_XT_MATCH_DSCP=m
CONFIG_NETFILTER_XT_MATCH_ESP=m
CONFIG_NETFILTER_XT_MATCH_HASHLIMIT=m
CONFIG_NETFILTER_XT_MATCH_HELPER=m
CONFIG_NETFILTER_XT_MATCH_LENGTH=m
CONFIG_NETFILTER_XT_MATCH_LIMIT=m
CONFIG_NETFILTER_XT_MATCH_MAC=m
CONFIG_NETFILTER_XT_MATCH_MARK=m
CONFIG_NETFILTER_XT_MATCH_MULTIPORT=m
CONFIG_NETFILTER_XT_MATCH_POLICY=m
CONFIG_NETFILTER_XT_MATCH_PKTTYPE=m
CONFIG_NETFILTER_XT_MATCH_QUOTA=m
CONFIG_NETFILTER_XT_MATCH_REALM=m
CONFIG_NETFILTER_XT_MATCH_STATE=m
CONFIG_NETFILTER_XT_MATCH_STATISTIC=m
CONFIG_NETFILTER_XT_MATCH_STRING=m
CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
CONFIG_NETFILTER_XT_MATCH_U32=m
CONFIG_IP_NF_IPTABLES=m
CONFIG_IP_NF_MATCH_AH=m
CONFIG_IP_NF_MATCH_ECN=m
CONFIG_IP_NF_MATCH_TTL=m
CONFIG_IP_NF_FILTER=m
CONFIG_IP_NF_TARGET_REJECT=m
CONFIG_IP_NF_MANGLE=m
CONFIG_IP_NF_TARGET_CLUSTERIP=m
CONFIG_IP_NF_TARGET_ECN=m
CONFIG_IP_NF_TARGET_TTL=m
CONFIG_IP_NF_RAW=m
CONFIG_IP_NF_ARPTABLES=m
CONFIG_IP_NF_ARPFILTER=m
CONFIG_IP_NF_ARP_MANGLE=m
CONFIG_IP6_NF_IPTABLES=m
CONFIG_IP6_NF_MATCH_EUI64=m
CONFIG_IP6_NF_MATCH_FRAG=m
CONFIG_IP6_NF_MATCH_OPTS=m
CONFIG_IP6_NF_MATCH_HL=m
CONFIG_IP6_NF_MATCH_IPV6HEADER=m
CONFIG_IP6_NF_MATCH_RT=m
CONFIG_IP6_NF_FILTER=m
CONFIG_IP6_NF_MANGLE=m
CONFIG_IP6_NF_RAW=m
CONFIG_IP_SCTP=m
CONFIG_TIPC=m
CONFIG_BRIDGE=m
CONFIG_VLAN_8021Q=m
CONFIG_NET_SCHED=y
CONFIG_NET_SCH_CBQ=m
CONFIG_NET_SCH_HTB=m
CONFIG_NET_SCH_HFSC=m
CONFIG_NET_SCH_PRIO=m
CONFIG_NET_SCH_RED=m
CONFIG_NET_SCH_SFQ=m
CONFIG_NET_SCH_TEQL=m
CONFIG_NET_SCH_TBF=m
CONFIG_NET_SCH_GRED=m
CONFIG_NET_SCH_DSMARK=m
CONFIG_NET_SCH_NETEM=m
CONFIG_NET_SCH_CODEL=m
CONFIG_NET_SCH_INGRESS=m
CONFIG_NET_CLS_BASIC=y
CONFIG_NET_CLS_U32=y
CONFIG_NET_CLS_CGROUP=y
CONFIG_NET_CLS_ACT=y
CONFIG_NET_ACT_MIRRED=m
CONFIG_NET_PKTGEN=m
CONFIG_DEVTMPFS=y
CONFIG_DEVTMPFS_MOUNT=y
# CONFIG_FW_LOADER is not set
CONFIG_BLK_DEV_LOOP=m
CONFIG_BLK_DEV_NBD=m
CONFIG_BLK_DEV_RAM=y
CONFIG_VIRTIO_BLK=y
CONFIG_BLK_DEV_NVME=y
CONFIG_BLK_DEV_SD=y
CONFIG_BLK_DEV_SR=y
CONFIG_MEGARAID_SAS=y
CONFIG_SCSI_SYM53C8XX_2=y
CONFIG_SCSI_DC395x=y
CONFIG_SCSI_AM53C974=y
CONFIG_SCSI_VIRTIO=y
CONFIG_ATA=y
CONFIG_SATA_SIL=y
CONFIG_PATA_MACIO=y
CONFIG_MD=y
CONFIG_BLK_DEV_MD=y
CONFIG_MD_LINEAR=y
CONFIG_MD_RAID0=y
CONFIG_MD_RAID1=y
CONFIG_MD_RAID10=y
CONFIG_MD_MULTIPATH=y
CONFIG_MD_FAULTY=y
CONFIG_BLK_DEV_DM=y
CONFIG_DM_CRYPT=y
CONFIG_DM_SNAPSHOT=y
CONFIG_DM_MIRROR=y
CONFIG_DM_ZERO=y
CONFIG_FUSION=y
CONFIG_FUSION_SAS=y
CONFIG_NETDEVICES=y
CONFIG_BONDING=m
CONFIG_DUMMY=m
CONFIG_NETCONSOLE=y
CONFIG_TUN=m
CONFIG_VIRTIO_NET=y
CONFIG_PCNET32=y
CONFIG_NET_TULIP=y
CONFIG_TULIP=y
CONFIG_E100=y
CONFIG_E1000=y
CONFIG_E1000E=y
CONFIG_NE2K_PCI=y
CONFIG_8139CP=y
CONFIG_PPP=m
CONFIG_PPP_BSDCOMP=m
CONFIG_PPP_DEFLATE=m
CONFIG_PPP_FILTER=y
CONFIG_PPP_MULTILINK=y
CONFIG_PPPOE=m
CONFIG_PPP_ASYNC=m
CONFIG_PPP_SYNC_TTY=m
CONFIG_SLIP=m
CONFIG_SLIP_COMPRESSED=y
CONFIG_SLIP_SMART=y
CONFIG_SLIP_MODE_SLIP6=y
CONFIG_USB_USBNET=y
CONFIG_INPUT_EVDEV=y
CONFIG_INPUT_TABLET=y
CONFIG_INPUT_MISC=y
# CONFIG_SERIO_SERPORT is not set
CONFIG_SERIAL_PMACZILOG=y
CONFIG_SERIAL_PMACZILOG_TTYS=y
CONFIG_SERIAL_PMACZILOG_CONSOLE=y
CONFIG_POWER_SUPPLY=y
CONFIG_WATCHDOG=y
CONFIG_SOFT_WATCHDOG=m
# CONFIG_DRM_DEBUG_MODESET_LOCK is not set
CONFIG_FB=y
CONFIG_FB_OF=y
CONFIG_FRAMEBUFFER_CONSOLE=y
CONFIG_USB=y
CONFIG_USB_MON=y
CONFIG_USB_XHCI_HCD=y
CONFIG_USB_EHCI_HCD=y
CONFIG_USB_OHCI_HCD=y
CONFIG_USB_STORAGE=y
CONFIG_USB_UAS=y
CONFIG_MMC=y
CONFIG_MMC_SDHCI=y
CONFIG_MMC_SDHCI_PCI=y
CONFIG_NEW_LEDS=y
CONFIG_LEDS_CLASS=y
CONFIG_VIRTIO_PCI=y
CONFIG_VIRTIO_BALLOON=y
CONFIG_VIRTIO_MMIO=y
CONFIG_EXT2_FS=y
CONFIG_EXT2_FS_XATTR=y
CONFIG_EXT2_FS_POSIX_ACL=y
CONFIG_EXT3_FS=y
CONFIG_EXT3_FS_POSIX_ACL=y
CONFIG_EXT3_FS_SECURITY=y
CONFIG_REISERFS_FS=m
CONFIG_REISERFS_FS_XATTR=y
CONFIG_REISERFS_FS_POSIX_ACL=y
CONFIG_BTRFS_FS=y
CONFIG_BTRFS_FS_POSIX_ACL=y
CONFIG_AUTOFS4_FS=y
CONFIG_FUSE_FS=m
CONFIG_CUSE=m
CONFIG_ISO9660_FS=y
CONFIG_PROC_KCORE=y
CONFIG_TMPFS=y
CONFIG_CONFIGFS_FS=m
CONFIG_SQUASHFS=y
CONFIG_SQUASHFS_XATTR=y
CONFIG_SQUASHFS_4K_DEVBLK_SIZE=y
CONFIG_MINIX_FS=m
CONFIG_ROMFS_FS=m
CONFIG_NFS_FS=y
CONFIG_NFS_V4=y
CONFIG_ROOT_NFS=y
CONFIG_NFSD=m
CONFIG_NFSD_V4=y
CONFIG_CIFS=m
CONFIG_CIFS_XATTR=y
CONFIG_CIFS_POSIX=y
CONFIG_NLS_CODEPAGE_437=m
CONFIG_NLS_CODEPAGE_737=m
CONFIG_NLS_CODEPAGE_775=m
CONFIG_NLS_CODEPAGE_850=m
CONFIG_NLS_CODEPAGE_852=m
CONFIG_NLS_CODEPAGE_855=m
CONFIG_NLS_CODEPAGE_857=m
CONFIG_NLS_CODEPAGE_860=m
CONFIG_NLS_CODEPAGE_861=m
CONFIG_NLS_CODEPAGE_862=m
CONFIG_NLS_CODEPAGE_863=m
CONFIG_NLS_CODEPAGE_864=m
CONFIG_NLS_CODEPAGE_865=m
CONFIG_NLS_CODEPAGE_866=m
CONFIG_NLS_CODEPAGE_869=m
CONFIG_NLS_CODEPAGE_936=m
CONFIG_NLS_CODEPAGE_950=m
CONFIG_NLS_CODEPAGE_932=m
CONFIG_NLS_CODEPAGE_949=m
CONFIG_NLS_CODEPAGE_874=m
CONFIG_NLS_ISO8859_8=m
CONFIG_NLS_CODEPAGE_1250=m
CONFIG_NLS_CODEPAGE_1251=m
CONFIG_NLS_ASCII=m
CONFIG_NLS_ISO8859_1=m
CONFIG_NLS_ISO8859_2=m
CONFIG_NLS_ISO8859_3=m
CONFIG_NLS_ISO8859_4=m
CONFIG_NLS_ISO8859_5=m
CONFIG_NLS_ISO8859_6=m
CONFIG_NLS_ISO8859_7=m
CONFIG_NLS_ISO8859_9=m
CONFIG_NLS_ISO8859_13=m
CONFIG_NLS_ISO8859_14=m
CONFIG_NLS_ISO8859_15=m
CONFIG_NLS_KOI8_R=m
CONFIG_NLS_KOI8_U=m
CONFIG_NLS_UTF8=m
CONFIG_SECURITY=y
CONFIG_CRYPTO_TEST=m
CONFIG_CRYPTO_BLOWFISH=m
CONFIG_CRYPTO_CAMELLIA=m
CONFIG_CRYPTO_CAST5=m
CONFIG_CRYPTO_CAST6=m
CONFIG_CRYPTO_SERPENT=m
CONFIG_CRYPTO_TWOFISH=m
CONFIG_CRYPTO_MICHAEL_MIC=m
CONFIG_CRYPTO_WP512=m
CONFIG_CRYPTO_XCBC=m
CONFIG_DEBUG_INFO_DWARF5=y
CONFIG_KGDB=y
CONFIG_KGDB_KDB=y
CONFIG_PANIC_ON_OOPS=y
CONFIG_SOFTLOCKUP_DETECTOR=y
CONFIG_BOOTPARAM_SOFTLOCKUP_PANIC=y
CONFIG_DEFAULT_HUNG_TASK_TIMEOUT=30
CONFIG_BOOTPARAM_HUNG_TASK_PANIC=y
CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y
CONFIG_DEBUG_LOCKDEP=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_LIST=y
CONFIG_LATENCYTOP=y
CONFIG_FUNCTION_TRACER=y
CONFIG_FTRACE_SYSCALLS=y
CONFIG_BLK_DEV_IO_TRACE=y

--ikeVEW9yuYc//A+q--
