Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 849EB532C67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 16:42:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6xjz3JtTz3cD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 00:42:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=sntech.de
 (client-ip=185.11.138.130; helo=gloria.sntech.de;
 envelope-from=heiko@sntech.de; receiver=<UNKNOWN>)
Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6xjV24J9z3bk0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 00:41:47 +1000 (AEST)
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1ntVj5-0000Re-B6; Tue, 24 May 2022 16:41:35 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH V9 20/20] riscv: compat: Add COMPAT Kbuild skeletal support
Date: Tue, 24 May 2022 16:41:34 +0200
Message-ID: <14633832.tv2OnDr8pf@diego>
In-Reply-To: <20220523230039.GA238308@roeck-us.net>
References: <20220322144003.2357128-1-guoren@kernel.org>
 <44686961.fMDQidcC6G@diego> <20220523230039.GA238308@roeck-us.net>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Guo Ren <guoren@linux.alibaba.com>,
 Parisc List <linux-parisc@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-csky@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, sparclinux <sparclinux@vger.kernel.org>,
 Guo Ren <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Am Dienstag, 24. Mai 2022, 01:00:39 CEST schrieb Guenter Roeck:
> On Tue, May 24, 2022 at 12:40:06AM +0200, Heiko St=FCbner wrote:
> > Hi Guenter,
> >=20
> > Am Montag, 23. Mai 2022, 18:18:47 CEST schrieb Guenter Roeck:
> > > On 5/23/22 08:18, Guo Ren wrote:
> > > > I tested Palmer's branch, it's okay:
> > > > 8810d7feee5a (HEAD -> for-next, palmer/for-next) riscv: Don't outpu=
t a
> > > > bogus mmu-type on a no MMU kernel
> > > >=20
> > > > I also tested linux-next, it's okay:
> > > >=20
> > > > rv64_rootfs:
> > > > # uname -a
> > > > Linux buildroot 5.18.0-next-20220523 #7 SMP Mon May 23 11:15:17 EDT
> > > > 2022 riscv64 GNU/Linux
> > > > #
> > >=20
> > > That is is ok with one setup doesn't mean it is ok with
> > > all setups. It is not ok with my root file system (from
> > > https://github.com/groeck/linux-build-test/tree/master/rootfs/riscv64=
),
> > > with qemu v6.2.
> >=20
> > That is very true that it shouldn't fail on any existing (qemu-)platfor=
m,
> > but as I remember also testing Guo's series on both riscv32 and riscv64
> > qemu platforms in the past, I guess it would be really helpful to get m=
ore
> > information about the failing platform you're experiencing so that we c=
an
> > find the source of the issue.
> >=20
> > As it looks like you both tested the same kernel source, I guess the on=
ly
> > differences could be in the qemu-version, kernel config and rootfs.
> > Is your rootfs something you can share or that can be rebuilt easily?
> >=20
> I provided a link to my root file system above. The link points to two
> root file systems, for initrd (cpio archive) and for ext2.
> I also mentioned above that I used qemu v6.2. And below I said
>=20
> > My root file system uses musl.
>=20
> I attached the buildroot configuration below. The buildroot version,
> if I remember correctly, was 2021.02.
>=20
> Kernel configuration is basically defconfig. However, I do see one
> detail that is possibly special in my configuration.
>=20
>     # The latest kernel assumes SBI version 0.3, but that doesn't match q=
emu
>     # at least up to version 6.2 and results in hangup/crashes during reb=
oot
>     # with sifive_u emulations.
>     enable_config "${defconfig}" CONFIG_RISCV_SBI_V01
>=20
> Hope that helps,

Actually it doesn't seem rootfs-specific at all.

Merged was this v9, but the version I last tested was one of the earlier
ones, so it looks like something really broke meanwhile.

I tested both linux-next-20220524 and palmer's for-next on a very recent
qemu - master from april if I remember correctly together with a
Debian-based rootfs mounted as nfsroot inside qemu.

With CONFIG_COMPAT=3Dy (aka using defconfig directly) I get:
[   12.957612] VFS: Mounted root (nfs filesystem) on device 0:15.
[   12.967260] devtmpfs: mounted
[   13.101186] Freeing unused kernel image (initmem) memory: 2168K
[   13.110914] Run /sbin/init as init process
[   13.343810] Unable to handle kernel paging request at virtual address ff=
60007265776f78
[   13.347271] Oops [#1]
[   13.347749] Modules linked in:
[   13.348689] CPU: 0 PID: 1 Comm: init Not tainted 5.18.0-next-20220524 #1
[   13.349864] Hardware name: riscv-virtio,qemu (DT)
[   13.350706] epc : special_mapping_fault+0x4c/0x8e
[   13.351639]  ra : __do_fault+0x28/0x11c
[   13.352311] epc : ffffffff801210e6 ra : ffffffff8011712a sp : ff20000000=
60bd10
[   13.353276]  gp : ffffffff810df030 tp : ff600000012a8000 t0 : ffffffff80=
008acc
[   13.354063]  t1 : ffffffff80c001d8 t2 : ffffffff80c00258 s0 : ff20000000=
60bd20
[   13.354886]  s1 : ff2000000060bd68 a0 : ff600000013165f0 a1 : ff60000001=
ec2450
[   13.355675]  a2 : ff2000000060bd68 a3 : 0000000000000000 a4 : ff6000003f=
0337c8
[   13.356822]  a5 : ff60007265776f70 a6 : ff60000001ec2450 a7 : 0000000000=
000007
[   13.357689]  s2 : ff60000001ec2450 s3 : ff60000001ec2450 s4 : ff20000000=
60bd68
[   13.358487]  s5 : ff60000001ec2450 s6 : 0000000000000254 s7 : 0000000000=
00000c
[   13.359305]  s8 : 000000000000000f s9 : 000000000000000d s10: ff60000001=
e4c080
[   13.360102]  s11: 000000000000000d t3 : 00ffffffbbeab000 t4 : 000000006f=
fffdff
[   13.361557]  t5 : 000000006ffffe35 t6 : 000000000000000a
[   13.362229] status: 0000000200000120 badaddr: ff60007265776f78 cause: 00=
0000000000000d
[   13.363504] [<ffffffff8011712a>] __do_fault+0x28/0x11c
[   13.364464] [<ffffffff8011b346>] __handle_mm_fault+0x71c/0x9ea
[   13.365577] [<ffffffff8011b696>] handle_mm_fault+0x82/0x136
[   13.366275] [<ffffffff80008bec>] do_page_fault+0x120/0x31c
[   13.366906] [<ffffffff800032f4>] ret_from_exception+0x0/0xc
[   13.368763] ---[ end trace 0000000000000000 ]---
[   13.368763] ---[ end trace 0000000000000000 ]---
[   13.369598] Kernel panic - not syncing: Attempted to kill init! exitcode=
=3D0x0000000b
[   13.369933] SMP: stopping secondary CPUs


Turning CONFIG_COMPAT off, results in the system booting normally again.


Heiko


> ---
> BR2_riscv=3Dy
> BR2_TOOLCHAIN_BUILDROOT_MUSL=3Dy
> BR2_KERNEL_HEADERS_4_19=3Dy
> BR2_BINUTILS_VERSION_2_32_X=3Dy
> BR2_TARGET_RUN_TESTSCRIPT=3Dy
> BR2_SHUTDOWN_COMMAND_POWEROFF=3Dy
> BR2_SYSTEM_DHCP=3D"eth0"
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS=3Dy
> BR2_PACKAGE_STRACE=3Dy
> BR2_PACKAGE_I2C_TOOLS=3Dy
> BR2_PACKAGE_PCIUTILS=3Dy
> BR2_PACKAGE_DTC=3Dy
> BR2_PACKAGE_DTC_PROGRAMS=3Dy
> BR2_PACKAGE_IPROUTE2=3Dy
> BR2_TARGET_ROOTFS_BTRFS=3Dy
> BR2_TARGET_ROOTFS_CPIO=3Dy
> BR2_TARGET_ROOTFS_CPIO_GZIP=3Dy
> BR2_TARGET_ROOTFS_EXT2=3Dy
> BR2_TARGET_ROOTFS_EXT2_SIZE=3D"16M"
> BR2_TARGET_ROOTFS_EXT2_GZIP=3Dy
> BR2_TARGET_ROOTFS_ISO_GZIP=3Dy
> BR2_TARGET_ROOTFS_SQUASHFS=3Dy
> # BR2_TARGET_ROOTFS_TAR is not set
>=20
>=20




