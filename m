Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5595AF67A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 23:01:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMd8h2YWTz3bZP
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 07:01:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tknsP3y+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tknsP3y+;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMd8256sgz2ywc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 07:00:34 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 571EBB81A40;
	Tue,  6 Sep 2022 21:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96ED9C433C1;
	Tue,  6 Sep 2022 21:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662498028;
	bh=6jiDuEDM/DuHShVmn4JR5O+eKIaTC5qdFUs8LODwAic=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tknsP3y+l/R7r7df6sIuCvScSUtRXfDmjyZzfZL9Hmklk+Add40INqVIH8S8imiNe
	 zem6W7Blvtoe7C02HJAslhHhlwSfWCxtJotgmmTijEhNSwXscSwgLfdgf3VShPgwC9
	 o1rxXeiG7k01pPk0tDmYp6MQuAS66tWerqkAXb2IzrswetymlLP83aw9D+xmY1Qh6V
	 Gv8vqaqHjBOKomd+WlTZhGKxjZNFA0PSkCH4fpQxpCA/jDF35qR87W+dPB4/IfVWp6
	 4r1SDwVbN1WdbPdl55VwhQ2P/ayUWLGtZdRuiQ0cHDUPQd/7yV2Hn8vYnrH84ADdiG
	 tkeiv7g9QLfCQ==
Date: Tue, 6 Sep 2022 14:00:25 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Nayna Jain <nayna@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/pseries: define driver for Platform
 KeyStore
Message-ID: <Yxe06fbq18Wv9y3W@dev-arch.thelio-3990X>
References: <20220723113048.521744-1-nayna@linux.ibm.com>
 <20220723113048.521744-2-nayna@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220723113048.521744-2-nayna@linux.ibm.com>
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
Cc: bjking1@us.ibm.com, gjoyce@linux.vnet.ibm.com, erichte@linux.ibm.com, npiggin@gmail.com, muriloo@linux.ibm.com, George Wilson <gcwilson@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

On Sat, Jul 23, 2022 at 07:30:46AM -0400, Nayna Jain wrote:
> PowerVM provides an isolated Platform Keystore(PKS) storage allocation
> for each LPAR with individually managed access controls to store
> sensitive information securely. It provides a new set of hypervisor
> calls for Linux kernel to access PKS storage.
> 
> Define POWER LPAR Platform KeyStore(PLPKS) driver using H_CALL interface
> to access PKS storage.
> 
> Signed-off-by: Nayna Jain <nayna@linux.ibm.com>

This commit is now in mainline as commit 2454a7af0f2a ("powerpc/pseries:
define driver for Platform KeyStore") and I just bisected a crash while
boot testing Fedora's configuration [1] in QEMU to it. I initially
noticed this in ClangBuiltLinux's CI but this doesn't appear to be clang
specific since I can reproduce with GCC 12.2.1 from Fedora. I can
reproduce with just powernv_defconfig + CONFIG_PPC_PSERIES=y +
CONFIG_PSERIES_PLPKS=y. Our firmware and rootfs are available in our
boot-utils repository [2].

$ qemu-system-ppc64 \
-device ipmi-bmc-sim,id=bmc0 \
-device isa-ipmi-bt,bmc=bmc0,irq=10 \
-L .../boot-utils/images/ppc64le \
-bios skiboot.lid \
-machine powernv8 \
-kernel arch/powerpc/boot/zImage.epapr \
-display none \
-initrd .../boot-utils/images/ppc64le/rootfs.cpio \
-m 2G \
-nodefaults \
-no-reboot \
-serial mon:stdio
...
[    0.000000][    T0] Linux version 5.19.0-rc2-00179-g2454a7af0f2a (tuxmake@tuxmake) (powerpc64le-linux-gnu-gcc (GCC) 12.2.1 20220819 (Red Hat Cross 12.2.1-1), GNU ld version 2.38-4.fc37) #1 SMP @1658989333
...
[    0.144318][    T1] EEH: PowerNV platform initialized
[    0.145204][    T1] ------------[ cut here ]------------
[    0.145400][    T1] kernel BUG at arch/powerpc/kernel/interrupt.c:96!
[    0.145674][    T1] Oops: Exception in kernel mode, sig: 5 [#1]
[    0.147691][    T1] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA PowerNV
[    0.148177][    T1] Modules linked in:
[    0.148619][    T1] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.19.0-rc2-00179-g2454a7af0f2a #1
[    0.149328][    T1] NIP:  c00000000002ea2c LR: c00000000000c63c CTR: c00000000000c540
[    0.149851][    T1] REGS: c000000002a03b10 TRAP: 0700   Not tainted  (5.19.0-rc2-00179-g2454a7af0f2a)
[    0.150478][    T1] MSR:  9000000000029033 <SF,HV,EE,ME,IR,DR,RI,LE>  CR: 24000282  XER: 20000000
[    0.151240][    T1] CFAR: c00000000000c638 IRQMASK: 3
[    0.151240][    T1] GPR00: c00000000000c63c c000000002a03db0 c00000000240ba00 000000000000041c
[    0.151240][    T1] GPR04: 0000000002a03b98 0000000000000020 000000007dcf0000 0000000000000000
[    0.151240][    T1] GPR08: 0000000000000000 0000000000000000 0000000000000001 0000000000000003
[    0.151240][    T1] GPR12: ffffffffffffffff c0000000025c0000 c0000000000125f8 0000000000000000
[    0.151240][    T1] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.151240][    T1] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.151240][    T1] GPR24: 0000000000000000 0000000000000000 000000007dcf0000 0000000000000020
[    0.151240][    T1] GPR28: 0000000002a03b98 000000000000041c 0000000024000282 c000000002a03e80
[    0.156459][    T1] NIP [c00000000002ea2c] system_call_exception+0x7c/0x370
[    0.157366][    T1] LR [c00000000000c63c] system_call_common+0xec/0x250
[    0.157991][    T1] Call Trace:
[    0.158255][    T1] [c000000002a03db0] [c000000000012620] kernel_init+0x30/0x1a0 (unreliable)
[    0.158936][    T1] [c000000002a03e10] [c00000000000c63c] system_call_common+0xec/0x250
[    0.159514][    T1] --- interrupt: c00 at plpar_hcall+0x38/0x60
[    0.159956][    T1] NIP:  c0000000000d4bc0 LR: c000000002021664 CTR: 0000000000000000
[    0.160469][    T1] REGS: c000000002a03e80 TRAP: 0c00   Not tainted  (5.19.0-rc2-00179-g2454a7af0f2a)
[    0.161068][    T1] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR: 24000282  XER: 00000000
[    0.161792][    T1] IRQMASK: 0
[    0.161792][    T1] GPR00: 0000000024000282 c000000002a03b30 c00000000240ba00 000000000000041c
[    0.161792][    T1] GPR04: 0000000002a03b98 0000000000000020 000000007dcf0000 0000000000000000
[    0.161792][    T1] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.161792][    T1] GPR12: 0000000000000000 c0000000025c0000 c0000000000125f8 0000000000000000
[    0.161792][    T1] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.161792][    T1] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
[    0.161792][    T1] GPR24: 0000000000000000 c00000000200015c cccccccccccccccd c000000002071048
[    0.161792][    T1] GPR28: 0000000000000000 c000000002071088 0000000000000003 c0000000020215f0
[    0.166796][    T1] NIP [c0000000000d4bc0] plpar_hcall+0x38/0x60
[    0.167215][    T1] LR [c000000002021664] pseries_plpks_init+0x74/0x268
[    0.167705][    T1] --- interrupt: c00
[    0.167959][    T1] [c000000002a03b30] [000000007dcf0000] 0x7dcf0000 (unreliable)
[    0.168763][    T1] Instruction dump:
[    0.169099][    T1] f8010010 f821ffa1 60000000 fbbf0110 39200000 0b090000 e95f0108 69490002
[    0.169741][    T1] 7929ffe2 0b090000 694a4000 794a97e2 <0b0a0000> e93f0138 792907e0 0b090000
[    0.170731][    T1] ---[ end trace 0000000000000000 ]---
...

If there is any more information I can provide or patches I can test, I
am more than happy to do so (although I may be slower to respond through
Plumbers).

[1]: https://src.fedoraproject.org/rpms/kernel/raw/rawhide/f/kernel-ppc64le-fedora.config
[2]: https://github.com/ClangBuiltLinux/boot-utils

Cheers,
Nathan

# bad: [568035b01cfb107af8d2e4bd2fb9aea22cf5b868] Linux 6.0-rc1
# good: [3d7cb6b04c3f3115719235cc6866b10326de34cd] Linux 5.19
git bisect start 'v6.0-rc1' 'v5.19'
# good: [b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1] Merge tag 'drm-next-2022-08-03' of git://anongit.freedesktop.org/drm/drm
git bisect good b44f2fd87919b5ae6e1756d4c7ba2cbba22238e1
# good: [6614a3c3164a5df2b54abb0b3559f51041cf705b] Merge tag 'mm-stable-2022-08-03' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect good 6614a3c3164a5df2b54abb0b3559f51041cf705b
# bad: [eb5699ba31558bdb2cee6ebde3d0a68091e47dce] Merge tag 'mm-nonmm-stable-2022-08-06-2' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
git bisect bad eb5699ba31558bdb2cee6ebde3d0a68091e47dce
# good: [24df5428ef9d1ca1edd54eca7eb667110f2dfae3] ALSA: hda/realtek: Add quirk for HP Spectre x360 15-eb0xxx
git bisect good 24df5428ef9d1ca1edd54eca7eb667110f2dfae3
# good: [c993e07be023acdeec8e84e2e0743c52adb5fc94] Merge tag 'dma-mapping-5.20-2022-08-06' of git://git.infradead.org/users/hch/dma-mapping
git bisect good c993e07be023acdeec8e84e2e0743c52adb5fc94
# bad: [4cfa6ff24a9744ba484521c38bea613134fbfcb3] powerpc/64e: Fix kexec build error
git bisect bad 4cfa6ff24a9744ba484521c38bea613134fbfcb3
# good: [78988b273d592ce74c8aecdd5d748906c38a9e9d] powerpc/perf: Give generic PMU a nice name
git bisect good 78988b273d592ce74c8aecdd5d748906c38a9e9d
# good: [de40303b54bc458d7df0d4b4ee1d296df7fe98c7] powerpc/ppc-opcode: Define and use PPC_RAW_SETB()
git bisect good de40303b54bc458d7df0d4b4ee1d296df7fe98c7
# bad: [738f9dca0df3bb630e6f06a19573ab4e31bd443a] powerpc/sysdev: Fix comment typo
git bisect bad 738f9dca0df3bb630e6f06a19573ab4e31bd443a
# good: [4d5c5bad51935482437528f7fa4dffdcb3330d8b] powerpc: Remove asm/prom.h from asm/mpc52xx.h and asm/pci.h
git bisect good 4d5c5bad51935482437528f7fa4dffdcb3330d8b
# good: [d80f6de9d601c30b53c17f00cb7cfe3169f2ddad] powerpc/iommu: Fix iommu_table_in_use for a small default DMA window case
git bisect good d80f6de9d601c30b53c17f00cb7cfe3169f2ddad
# bad: [0fe1e96fef0a5c53b4c0d1500d356f3906000f81] powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias
git bisect bad 0fe1e96fef0a5c53b4c0d1500d356f3906000f81
# bad: [d20c96deb3e2c1cedc47d2be9fc110ffed81b1af] powerpc/85xx: Fix description of MPC85xx and P1/P2 boards options
git bisect bad d20c96deb3e2c1cedc47d2be9fc110ffed81b1af
# bad: [2454a7af0f2a42918aa972147a0bec38e6656cd8] powerpc/pseries: define driver for Platform KeyStore
git bisect bad 2454a7af0f2a42918aa972147a0bec38e6656cd8
# first bad commit: [2454a7af0f2a42918aa972147a0bec38e6656cd8] powerpc/pseries: define driver for Platform KeyStore
