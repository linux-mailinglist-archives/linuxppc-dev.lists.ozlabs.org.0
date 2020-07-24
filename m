Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4655722C6FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:47:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCr9D3DfZzF0tN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 23:47:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqW71LPmzF0gv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:17:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hS+aPqzM; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4BCqW61gLwz9sSt; Fri, 24 Jul 2020 23:17:38 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqW56Z5Zz9sSy; Fri, 24 Jul 2020 23:17:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1595596657;
 bh=V+Hb5jJ3u/L1uAj8N0TN29DZ6AxnAYf8MFtLs4fPoXg=;
 h=From:To:Subject:Date:From;
 b=hS+aPqzMAZbLjfVIhrk0MOzdLfOEsj1IPYbCb/nxUjOuV9KV+RBlUfEdYgj95ksK+
 I/EGi7iN9lnz8xVEAd+fBUJIuJmjcJVcgVSSGfDeO6egYiYJTsAcJihxLN8mDjrgfW
 UZ7pHAszI2b/TB4u9NY+tYG9chp/rTekR1nKpwAIGogFjqrIFsHK1PEHdt0y4k2Es5
 5ebHveQU1mkKydfElnkvZvytfFcqPkUxXHb2QgwYn33Je/Tormt/JJOC23+yJWTs/h
 uiZGq3eWsDdVId/OHs6RpTjFOPcCXnESEA2ZOhYFWZjI+CWMn01i2eUkKgH7p+IIDx
 O2fQlo248RnvQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 1/9] powerpc/configs: Drop old symbols from ppc6xx_defconfig
Date: Fri, 24 Jul 2020 23:17:20 +1000
Message-Id: <20200724131728.1643966-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

ppc6xx_defconfig refers to quite a few symbols that no longer exist,
as reported by scripts/checkkconfigsymbols.py, remove them.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/ppc6xx_defconfig | 39 ---------------------------
 1 file changed, 39 deletions(-)

diff --git a/arch/powerpc/configs/ppc6xx_defconfig b/arch/powerpc/configs/ppc6xx_defconfig
index feb5d47d8d1e..5e6f92ba3210 100644
--- a/arch/powerpc/configs/ppc6xx_defconfig
+++ b/arch/powerpc/configs/ppc6xx_defconfig
@@ -53,7 +53,6 @@ CONFIG_MPC836x_MDS=y
 CONFIG_MPC836x_RDK=y
 CONFIG_MPC837x_MDS=y
 CONFIG_MPC837x_RDB=y
-CONFIG_SBC834x=y
 CONFIG_ASP834x=y
 CONFIG_PPC_86xx=y
 CONFIG_MPC8641_HPCN=y
@@ -187,7 +186,6 @@ CONFIG_NETFILTER_XT_MATCH_STRING=m
 CONFIG_NETFILTER_XT_MATCH_TCPMSS=m
 CONFIG_NETFILTER_XT_MATCH_TIME=m
 CONFIG_NETFILTER_XT_MATCH_U32=m
-CONFIG_NF_CONNTRACK_IPV4=m
 CONFIG_IP_NF_IPTABLES=m
 CONFIG_IP_NF_MATCH_AH=m
 CONFIG_IP_NF_MATCH_ECN=m
@@ -203,7 +201,6 @@ CONFIG_IP_NF_SECURITY=m
 CONFIG_IP_NF_ARPTABLES=m
 CONFIG_IP_NF_ARPFILTER=m
 CONFIG_IP_NF_ARP_MANGLE=m
-CONFIG_NF_CONNTRACK_IPV6=m
 CONFIG_IP6_NF_IPTABLES=m
 CONFIG_IP6_NF_MATCH_AH=m
 CONFIG_IP6_NF_MATCH_EUI64=m
@@ -241,7 +238,6 @@ CONFIG_BRIDGE_EBT_SNAT=m
 CONFIG_BRIDGE_EBT_LOG=m
 CONFIG_BRIDGE_EBT_NFLOG=m
 CONFIG_IP_DCCP=m
-CONFIG_NET_DCCPPROBE=m
 CONFIG_TIPC=m
 CONFIG_ATM=m
 CONFIG_ATM_CLIP=m
@@ -251,7 +247,6 @@ CONFIG_BRIDGE=m
 CONFIG_VLAN_8021Q=m
 CONFIG_DECNET=m
 CONFIG_DECNET_ROUTER=y
-CONFIG_IPX=m
 CONFIG_ATALK=m
 CONFIG_DEV_APPLETALK=m
 CONFIG_IPDDP=m
@@ -297,26 +292,6 @@ CONFIG_NET_ACT_NAT=m
 CONFIG_NET_ACT_PEDIT=m
 CONFIG_NET_ACT_SIMP=m
 CONFIG_NET_ACT_SKBEDIT=m
-CONFIG_IRDA=m
-CONFIG_IRLAN=m
-CONFIG_IRNET=m
-CONFIG_IRCOMM=m
-CONFIG_IRDA_CACHE_LAST_LSAP=y
-CONFIG_IRDA_FAST_RR=y
-CONFIG_IRTTY_SIR=m
-CONFIG_KINGSUN_DONGLE=m
-CONFIG_KSDAZZLE_DONGLE=m
-CONFIG_KS959_DONGLE=m
-CONFIG_USB_IRDA=m
-CONFIG_SIGMATEL_FIR=m
-CONFIG_NSC_FIR=m
-CONFIG_WINBOND_FIR=m
-CONFIG_TOSHIBA_FIR=m
-CONFIG_SMC_IRCC_FIR=m
-CONFIG_ALI_FIR=m
-CONFIG_VLSI_FIR=m
-CONFIG_VIA_FIR=m
-CONFIG_MCS_FIR=m
 CONFIG_BT=m
 CONFIG_BT_RFCOMM=m
 CONFIG_BT_RFCOMM_TTY=y
@@ -332,7 +307,6 @@ CONFIG_BT_HCIBFUSB=m
 CONFIG_BT_HCIDTL1=m
 CONFIG_BT_HCIBT3C=m
 CONFIG_BT_HCIBLUECARD=m
-CONFIG_BT_HCIBTUART=m
 CONFIG_BT_HCIVHCI=m
 CONFIG_CFG80211=m
 CONFIG_MAC80211=m
@@ -366,7 +340,6 @@ CONFIG_EEPROM_93CX6=m
 CONFIG_RAID_ATTRS=m
 CONFIG_BLK_DEV_SD=y
 CONFIG_CHR_DEV_ST=m
-CONFIG_CHR_DEV_OSST=m
 CONFIG_BLK_DEV_SR=m
 CONFIG_CHR_DEV_SG=y
 CONFIG_CHR_DEV_SCH=m
@@ -663,7 +636,6 @@ CONFIG_I2C_MPC=m
 CONFIG_I2C_PCA_PLATFORM=m
 CONFIG_I2C_SIMTEC=m
 CONFIG_I2C_PARPORT=m
-CONFIG_I2C_PARPORT_LIGHT=m
 CONFIG_I2C_TINY_USB=m
 CONFIG_I2C_PCA_ISA=m
 CONFIG_I2C_STUB=m
@@ -676,7 +648,6 @@ CONFIG_W1_SLAVE_THERM=m
 CONFIG_W1_SLAVE_SMEM=m
 CONFIG_W1_SLAVE_DS2433=m
 CONFIG_W1_SLAVE_DS2433_CRC=y
-CONFIG_W1_SLAVE_DS2760=m
 CONFIG_APM_POWER=m
 CONFIG_BATTERY_PMU=m
 CONFIG_HWMON=m
@@ -1065,15 +1036,6 @@ CONFIG_CIFS_UPCALL=y
 CONFIG_CIFS_XATTR=y
 CONFIG_CIFS_POSIX=y
 CONFIG_CIFS_DFS_UPCALL=y
-CONFIG_NCP_FS=m
-CONFIG_NCPFS_PACKET_SIGNING=y
-CONFIG_NCPFS_IOCTL_LOCKING=y
-CONFIG_NCPFS_STRONG=y
-CONFIG_NCPFS_NFS_NS=y
-CONFIG_NCPFS_OS2_NS=y
-CONFIG_NCPFS_SMALLDOS=y
-CONFIG_NCPFS_NLS=y
-CONFIG_NCPFS_EXTRAS=y
 CONFIG_CODA_FS=m
 CONFIG_9P_FS=m
 CONFIG_NLS_DEFAULT="utf8"
@@ -1117,7 +1079,6 @@ CONFIG_NLS_KOI8_U=m
 CONFIG_DEBUG_INFO=y
 CONFIG_UNUSED_SYMBOLS=y
 CONFIG_HEADERS_INSTALL=y
-CONFIG_HEADERS_CHECK=y
 CONFIG_MAGIC_SYSRQ=y
 CONFIG_DEBUG_KERNEL=y
 CONFIG_DEBUG_OBJECTS=y
-- 
2.25.1

