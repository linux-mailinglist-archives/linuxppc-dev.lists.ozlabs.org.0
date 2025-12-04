Return-Path: <linuxppc-dev+bounces-14598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A83BCA371A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 12:29:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMXNF49lkz2xGg;
	Thu, 04 Dec 2025 22:29:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764847773;
	cv=none; b=WQnBKOGOZuOAiSmILdtAlpnV/3uIZBeUAREb87Lsiuyp2ecnuWaUnaA8L2eiRJZ4IXJQGZZ9CqyFqPWKG/2BUR6t3MkCt+vQCeK0W1o6c0KcoxQVUNhw5Wp0nzrD5zb+g9PzCwQwp2qdyYk+PlL1uwEi11McRSezSMKWsHZ53bY9+3ottU4QVfZ3GplrIfLClJU9NmR3xTuGTN7Gg3/13RyOk1lnjznmbjVyBqQysh2lk9BueXXI73ddheQXfxfeQEJvQ6kwTHPfats5gUZJAjhCMnyDhNVO/LvARbU3O/9IvUWz6XjQPZtdDHesnlLfNEnqmhVoZUby6fmzRftZtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764847773; c=relaxed/relaxed;
	bh=BOJ2nToN5nwrvCIpKqMpgf+rQGvxSlKpTBjNYB71jv4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gb5WQQibBgc+azxwF6FUhrOAmrlB3iEbGSpDCqui6sDqNYW1/dHgp8enK5/tNPXyN9A9zHfrMFTtUENno4uxb6HQo0KZpD9CTDI50x/hu/NGITJZ21vcqEXXh+2UAgdEWKCtlCr+9a2Ftkd5O423DYGXTT1jMKzNJI84RxOFW4BlvegvC4bd3k5j+eOJLeyLfEA427bwuRdnFXkI69YU442YDrrno/33MQHjgYeXePIfm/k7Yl6lkl22qVreLmr299tAiis7rl69DrolNqz2hYBPmM6G84OMrV4P+dR7KWc4Qnj3LqqRg5h8oI0Aizhv/hN2AdYEH24kJ18DV+qnlg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BMdeM0dp; dkim-atps=neutral; spf=pass (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org) smtp.mailfrom=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BMdeM0dp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ellerman.id.au (client-ip=150.107.74.76; helo=mail.ozlabs.org; envelope-from=mpe@ellerman.id.au; receiver=lists.ozlabs.org)
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bit raw public key) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMXND3bdWz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 22:29:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1764847770;
	bh=BOJ2nToN5nwrvCIpKqMpgf+rQGvxSlKpTBjNYB71jv4=;
	h=From:To:Cc:Subject:Date:From;
	b=BMdeM0dpW/f87vz1QkbyOFBF13HPkei8zAoTfc2ErXvzXR4hmtglgq76ZtCkUbUhj
	 3rjoVrIasNX+ORvwI8dnbTVDoek8DNyHGRzipNjfW74xIsCJwAb7uMPbCG8ObZJ8nP
	 fi4X8HNeK6ptzY3RI1g0ONSjIAFYVEGxJO4XKe03a4rITYvvoJLDNJrm+owDNClBXq
	 tPVnJZbFFZodg5cZYdu9RtkM3Nado6bLC9MSSTlMDbOfQNYGzQVB3P2lIOK8qTN/cx
	 KjVRkqpZ3poG4AE2eMnRiwcUIc0kNXcqCI3bcsOsFG/0j4DaQsKq2ePRfxJOezwZlq
	 4ugsp7di9/nyg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4dMXN764Nkz4w0Q;
	Thu, 04 Dec 2025 22:29:27 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, antonio.feijoo@suse.com,
 bcollins@kernel.org, chentao@kylinos.cn, dave@vasilevsky.ca,
 donettom@linux.ibm.com, j.ne@posteo.net, leo.lilong@huawei.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 maddy@linux.ibm.com, nathan@kernel.org, ritesh.list@gmail.com,
 sourabhjain@linux.ibm.com, srikar@linux.ibm.com, tzimmermann@suse.de,
 unixbhaskar@gmail.com
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.19-1 tag
Date: Thu, 04 Dec 2025 22:29:24 +1100
Message-ID: <87zf7y1o4r.fsf@mpe.ellerman.id.au>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull powerpc updates for 6.19.

I'm sending this on Maddy's behalf while he's on vacation, but all the actu=
al
work of reviewing and testing patches was done by him, Christophe and other
folks.

No conflicts or other issues that I'm aware of.

cheers

The following changes since commit ac9c34d1e45a4c25174ced4fc0cfc33ff3ed08c7:

  Merge tag 'for-linus' of git://git.kernel.org/pub/scm/linux/kernel/git/rd=
ma/rdma (2025-02-25 13:43:03 -0800)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/po=
werpc-6.19-1

for you to fetch changes up to 9b36c7fc5aa5f2c6e6eeb9f312fdfe61b4291c9f:

  macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h> (2025-=
12-02 21:55:07 +1100)

- ------------------------------------------------------------------
powerpc updates for 6.19

 - Restore clearing of MSR[RI] at interrupt/syscall exit on 32-bit.

 - Fix unpaired stwcx on interrupt exit on 32-bit.

 - Fix race condition leading to double list-add in mac_hid_toggle_emumouse=
().

 - Fix mprotect on book3s 32-bit.

 - Fix SLB multihit issue during SLB preload with 64-bit hash MMU.

 - Add support for crashkernel CMA reservation.

 - Add die_id and die_cpumask for Power10 & later to expose chip hemisphere=
s.

 - A series of minor fixes and improvements to the hash SLB code.

Thanks to: Antonio Alvarez Feijoo, Ben Collins, Bhaskar Chowdhury, Christop=
he
Leroy, Daniel Thompson, Dave Vasilevsky, Donet Tom, J. Neusch=C3=A4fer, Kun=
wu Chan,
Long Li, Naresh Kamboju, Nathan Chancellor, Ritesh Harjani (IBM), Shirisha =
G,
Shrikanth Hegde, Sourabh Jain, Srikar Dronamraju, Stephen Rothwell, Thomas
Zimmermann, Venkat Rao Bagalkote, Vishal Chourasia.

- ------------------------------------------------------------------
Antonio Alvarez Feijoo (1):
      powerpc/boot: Add missing compression methods to usage

Ben Collins (2):
      powerpc/addnote: Fix overflow on 32-bit builds
      kexec: Include kernel-end even without crashkernel

Bhaskar Chowdhury (1):
      arch:powerpc:tools This file was missing shebang line, so added it

Christophe Leroy (3):
      powerpc/8xx: Remove specific code from fast_exception_return
      powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit
      powerpc/32: Fix unpaired stwcx. on interrupt exit

Dave Vasilevsky (1):
      powerpc, mm: Fix mprotect on book3s 32-bit

Donet Tom (1):
      powerpc/64s/slb: Fix SLB multihit issue during SLB preload

J. Neusch=C3=A4fer (4):
      powerpc: 512x: Rename wdt@ node to watchdog@
      powerpc: 83xx: Rename wdt@ nodes to watchdog@
      powerpc: 86xx: Rename wdt@ nodes to watchdog@
      powerpc: p2020: Rename wdt@ nodes to watchdog@

Kunwu Chan (1):
      powerpc/83xx: Add a null pointer check to mcu_gpiochip_add

Long Li (1):
      macintosh/mac_hid: fix race condition in mac_hid_toggle_emumouse

Nathan Chancellor (1):
      powerpc/vmlinux.lds: Drop .interp description

Ritesh Harjani (IBM) (10):
      powerpc/64s/hash: Restrict stress_hpt_struct memblock region to withi=
n RMA limit
      powerpc/64s/ptdump: Fix kernel_hash_pagetable dump for ISA v3.00 HPTE=
 format
      powerpc/64s/hash: Fix phys_addr_t printf format in htab_initialize()
      powerpc/64s/hash: Improve hash mmu printk messages
      powerpc/64s/hash: Hash hpt_order should be only available with Hash M=
MU
      powerpc/64s/hash: Update directMap page counters for Hash
      powerpc/64s/pgtable: Enable directMap counters in meminfo for Hash
      powerpc/ptdump: Dump PXX level info for kernel_page_tables
      powerpc/64s/slb: Make preload_add return type as void
      powerpc/64s/slb: Add no_slb_preload early cmdline param

Sourabh Jain (2):
      powerpc/kdump: Add support for crashkernel CMA reservation
      powerpc/kdump: Fix size calculation for hot-removed memory ranges

Srikar Dronamraju (2):
      pseries/lparcfg: Add resource group monitoring
      powerpc/smp: Expose die_id and die_cpumask

Thomas Zimmermann (2):
      powerpc/powermac: backlight: Include <linux/of.h>
      macintosh/via-pmu-backlight: Include <linux/fb.h> and <linux/of.h>


 Documentation/admin-guide/kernel-parameters.txt |   5 +-
 arch/powerpc/boot/addnote.c                     |   7 +-
 arch/powerpc/boot/dts/asp834x-redboot.dts       |   2 +-
 arch/powerpc/boot/dts/fsl/ge_imp3a.dts          |   4 +-
 arch/powerpc/boot/dts/fsl/gef_ppc9a.dts         |   4 +-
 arch/powerpc/boot/dts/fsl/gef_sbc310.dts        |   4 +-
 arch/powerpc/boot/dts/fsl/gef_sbc610.dts        |   4 +-
 arch/powerpc/boot/dts/mpc5121.dtsi              |   2 +-
 arch/powerpc/boot/dts/mpc8313erdb.dts           |   2 +-
 arch/powerpc/boot/dts/mpc8315erdb.dts           |   2 +-
 arch/powerpc/boot/dts/mpc832x_rdb.dts           |   2 +-
 arch/powerpc/boot/dts/mpc8349emitx.dts          |   2 +-
 arch/powerpc/boot/dts/mpc8349emitxgp.dts        |   2 +-
 arch/powerpc/boot/dts/mpc836x_rdk.dts           |   2 +-
 arch/powerpc/boot/dts/mpc8377_rdb.dts           |   2 +-
 arch/powerpc/boot/dts/mpc8377_wlan.dts          |   2 +-
 arch/powerpc/boot/dts/mpc8378_rdb.dts           |   2 +-
 arch/powerpc/boot/dts/mpc8379_rdb.dts           |   2 +-
 arch/powerpc/boot/wrapper                       |   4 +-
 arch/powerpc/include/asm/book3s/32/tlbflush.h   |   5 +-
 arch/powerpc/include/asm/book3s/64/mmu-hash.h   |   1 -
 arch/powerpc/include/asm/kexec.h                |   2 +
 arch/powerpc/include/asm/topology.h             |  11 +-
 arch/powerpc/kernel/entry_32.S                  |  33 ++++--
 arch/powerpc/kernel/interrupt.c                 |   2 +-
 arch/powerpc/kernel/process.c                   |   5 -
 arch/powerpc/kernel/setup-common.c              |   4 +-
 arch/powerpc/kernel/smp.c                       |  23 +++++
 arch/powerpc/kernel/vmlinux.lds.S               |   1 -
 arch/powerpc/kexec/core.c                       |  37 ++++---
 arch/powerpc/kexec/ranges.c                     |  45 +++++---
 arch/powerpc/mm/book3s32/tlb.c                  |   9 ++
 arch/powerpc/mm/book3s64/hash_utils.c           |  41 ++++++--
 arch/powerpc/mm/book3s64/internal.h             |   9 +-
 arch/powerpc/mm/book3s64/mmu_context.c          |   2 -
 arch/powerpc/mm/book3s64/pgtable.c              |  23 +++--
 arch/powerpc/mm/book3s64/slb.c                  | 109 +++-----------------
 arch/powerpc/mm/ptdump/8xx.c                    |   5 +
 arch/powerpc/mm/ptdump/book3s64.c               |   5 +
 arch/powerpc/mm/ptdump/hashpagetable.c          |   6 ++
 arch/powerpc/mm/ptdump/ptdump.c                 |   1 +
 arch/powerpc/mm/ptdump/ptdump.h                 |   1 +
 arch/powerpc/mm/ptdump/shared.c                 |   5 +
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c  |   2 +
 arch/powerpc/platforms/powermac/backlight.c     |   1 +
 arch/powerpc/platforms/pseries/lparcfg.c        |  17 ++-
 arch/powerpc/tools/head_check.sh                |   1 +
 drivers/macintosh/mac_hid.c                     |   3 +-
 drivers/macintosh/via-pmu-backlight.c           |   2 +
 49 files changed, 270 insertions(+), 197 deletions(-)
-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRjvi15rv0TSTaE+SIF0oADX8seIQUCaTFupwAKCRAF0oADX8se
IRUdAQD+DtQAeeDgcln2rBAJFxtML+GAqiTmBw81j/Gph6u33gD/Txxsus5/TCra
QZA+mVKUzeca7Ml4PpWpetoRgPw6MQw=3D
=3Dg+c1
-----END PGP SIGNATURE-----

