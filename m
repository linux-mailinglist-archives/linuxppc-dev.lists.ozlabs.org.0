Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF15243425
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 08:48:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRxwn01pbzDqcT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Aug 2020 16:48:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRxv54KxNzDqDL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Aug 2020 16:46:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=canb.auug.org.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=O5fll75C; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BRxv43MBsz9sTH;
 Thu, 13 Aug 2020 16:46:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1597301217;
 bh=HtgJ1t1rqLeW9In5EvrkzFZ0cdaEeChP6vEYzct7nw8=;
 h=Date:From:To:Cc:Subject:From;
 b=O5fll75Ct0fL71RbDgY5wy2RLZvT0fAnVuaPnuEjEUtppDi4QUI5ejJ0AshEvjdgA
 MCalQuOuV3KbtdcRsPHGhVCgvYYXpIVWOP3QSDA4ucD86R97ikArdpa0lzSlLfRzvX
 8HPeC0BH8/bjYUBEETc7WwEg9XCAO/VbHLXr05re2+QCuPxTLNorPeMC09uawQ7rAU
 UdK+ZN2KBOo8pbTthFt01UxfQ1QNrg7vqPOtYKKOeF2Kb5LScCFPI9N8TFAIXPUzyL
 GagtQrEbfVZmX88sECtQdTYDNoAivTQQGFC9K36Q4wy+NMiK6WsFS5sgQiNZzGZcsY
 XVnjwr51OiFmg==
Date: Thu, 13 Aug 2020 16:46:54 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Roman Gushchin <guro@fb.com>, Andrew Morton <akpm@linux-foundation.org>
Subject: linux-next: runtime warning in Linus' tree
Message-ID: <20200813164654.061dbbd3@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/eDCBOtPvZTwfaOIIDj=Yg_u";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Linux PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/eDCBOtPvZTwfaOIIDj=Yg_u
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Testing Linus' tree today, my qemu runs (PowerPC
powerpc_pseries_le_defconfig) produce the following WARNING:

[    0.021401][    T0] Mount-cache hash table entries: 8192 (order: 0, 6553=
6 bytes, linear)
[    0.021529][    T0] Mountpoint-cache hash table entries: 8192 (order: 0,=
 65536 bytes, linear)
[    0.053969][    T0] ------------[ cut here ]------------
[    0.055220][    T0] WARNING: CPU: 0 PID: 0 at mm/memcontrol.c:5220 mem_c=
group_css_alloc+0x350/0x904
[    0.055355][    T0] Modules linked in:
[    0.055812][    T0] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.8.0 #5
[    0.055976][    T0] NIP:  c000000000410010 LR: c00000000040fd68 CTR: 000=
0000000000000
[    0.056097][    T0] REGS: c0000000011e7ab0 TRAP: 0700   Not tainted  (5.=
8.0)
[    0.056162][    T0] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 24000888  XER: 00000000
[    0.056449][    T0] CFAR: c00000000040fd80 IRQMASK: 0=20
[    0.056449][    T0] GPR00: c00000000040fd68 c0000000011e7d40 c0000000011=
e8300 0000000000000001=20
[    0.056449][    T0] GPR04: 0000000000000228 0000000000000000 00000000000=
00001 ffffffffffffffff=20
[    0.056449][    T0] GPR08: c00000007d003208 0000000000000000 00000000000=
00000 c00000007d002fe8=20
[    0.056449][    T0] GPR12: 0000000000000001 c0000000013d0000 00000000000=
00000 00000000011dd528=20
[    0.056449][    T0] GPR16: 00000000011dd840 00000000011dd690 00000000000=
00018 0000000000000003=20
[    0.056449][    T0] GPR20: 0000000000000001 c0000000010cbcf8 00000000000=
00003 c0000000010cd540=20
[    0.056449][    T0] GPR24: c0000000010e8778 c0000000010e9080 c0000000010=
cbcd8 0000000000000000=20
[    0.056449][    T0] GPR28: 0000000000000000 c00000007e2a1000 c0000000010=
cbcc8 c00000000118ea00=20
[    0.057109][    T0] NIP [c000000000410010] mem_cgroup_css_alloc+0x350/0x=
904
[    0.057177][    T0] LR [c00000000040fd68] mem_cgroup_css_alloc+0xa8/0x904
[    0.057394][    T0] Call Trace:
[    0.057534][    T0] [c0000000011e7d40] [c00000000040fd68] mem_cgroup_css=
_alloc+0xa8/0x904 (unreliable)
[    0.057814][    T0] [c0000000011e7dc0] [c000000000f5b13c] cgroup_init_su=
bsys+0xbc/0x210
[    0.057903][    T0] [c0000000011e7e10] [c000000000f5b690] cgroup_init+0x=
220/0x598
[    0.057973][    T0] [c0000000011e7ee0] [c000000000f34354] start_kernel+0=
x67c/0x6ec
[    0.058047][    T0] [c0000000011e7f90] [c00000000000cb88] start_here_com=
mon+0x1c/0x614
[    0.058241][    T0] Instruction dump:
[    0.058420][    T0] eac10030 eae10038 eb410050 eb610058 4bffff60 6000000=
0 60000000 60000000=20
[    0.058550][    T0] 3be00100 4bfffdfc 60000000 60000000 <0fe00000> 4bfff=
d70 60000000 60000000=20
[    0.059381][    T0] ---[ end trace cb2d79b4994ef1fe ]---
[    0.059810][    T0] ------------[ cut here ]------------
[    0.059872][    T0] WARNING: CPU: 0 PID: 0 at mm/memcontrol.c:5135 mem_c=
group_css_alloc+0x750/0x904
[    0.059930][    T0] Modules linked in:
[    0.060053][    T0] CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W   =
      5.8.0 #5
[    0.060113][    T0] NIP:  c000000000410410 LR: c00000000040ff2c CTR: 000=
0000000000000
[    0.060171][    T0] REGS: c0000000011e7ab0 TRAP: 0700   Tainted: G      =
  W          (5.8.0)
[    0.060229][    T0] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  C=
R: 24000880  XER: 00000000
[    0.060332][    T0] CFAR: c00000000040fe48 IRQMASK: 0=20
[    0.060332][    T0] GPR00: c00000000040ff2c c0000000011e7d40 c0000000011=
e8300 c00000007e234c00=20
[    0.060332][    T0] GPR04: 0000000000000000 0000000000000000 c00000007e2=
35000 0000000000000013=20
[    0.060332][    T0] GPR08: 000000007ec00000 0000000000000000 00000000000=
00000 0000000000000001=20
[    0.060332][    T0] GPR12: 0000000000000000 c0000000013d0000 00000000000=
00000 00000000011dd528=20
[    0.060332][    T0] GPR16: 00000000011dd840 00000000011dd690 00000000000=
00018 0000000000000003=20
[    0.060332][    T0] GPR20: c000000001223300 c000000000e95900 c0000000011=
8ea00 c0000000012232c0=20
[    0.060332][    T0] GPR24: c0000000010e8778 c0000000010e9080 00000000004=
00cc0 0000000000000000=20
[    0.060332][    T0] GPR28: 0000000000000000 c00000007e2a1000 c00000007e2=
34c00 0000000000000000=20
[    0.060855][    T0] NIP [c000000000410410] mem_cgroup_css_alloc+0x750/0x=
904
[    0.060911][    T0] LR [c00000000040ff2c] mem_cgroup_css_alloc+0x26c/0x9=
04
[    0.060958][    T0] Call Trace:
[    0.061003][    T0] [c0000000011e7d40] [c00000000040ff2c] mem_cgroup_css=
_alloc+0x26c/0x904 (unreliable)
[    0.061081][    T0] [c0000000011e7dc0] [c000000000f5b13c] cgroup_init_su=
bsys+0xbc/0x210
[    0.061165][    T0] [c0000000011e7e10] [c000000000f5b690] cgroup_init+0x=
220/0x598
[    0.061233][    T0] [c0000000011e7ee0] [c000000000f34354] start_kernel+0=
x67c/0x6ec
[    0.061303][    T0] [c0000000011e7f90] [c00000000000cb88] start_here_com=
mon+0x1c/0x614
[    0.061364][    T0] Instruction dump:
[    0.061408][    T0] ebe1fff8 7c0803a6 4e800020 60000000 60000000 3d22000=
4 e929d230 7c3c4800=20
[    0.061508][    T0] 41820190 e93c03d2 4bfffc80 60000000 <0fe00000> 4bfff=
a38 60000000 60000000=20
[    0.061630][    T0] ---[ end trace cb2d79b4994ef1ff ]---
[    0.096387][    T1] EEH: pSeries platform initialized
[    0.097232][    T1] POWER8 performance monitor hardware support register=
ed

[The line numbers in the final linux next are 5226 and 5141 due to
later patches.]

Introduced (or exposed) by commit

  3e38e0aaca9e ("mm: memcg: charge memcg percpu memory to the parent cgroup=
")

This commit actually adds the WARN_ON, so it either adds the bug that
sets it off, or the bug already existed.

Unfotunately, the version of this patch in linux-next up tuntil today
is different.  :-(

I have left this as I have no idea how to fix it :-)

--=20
Cheers,
Stephen Rothwell

--Sig_/eDCBOtPvZTwfaOIIDj=Yg_u
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl804d4ACgkQAVBC80lX
0GxBwwgAjYJd1+rhj+ieQ5IOxjMycF9KJIZwMYz91Qgtejm6V+CAmCSJXiwStSIM
1sR/fr8oJB5/cY+XsInVF6fRfGzsc+fMc9z571Q7nf9JwZAevf7+kdK6rckR5Qcm
bDe+juyu06kCdhpHm8cswmYlBoD//gtzfpaeVdo4wpJGkdDXvR8kLasrZd7IDX2n
s/pjBrL8nX3GauKtd0c0JmlXSSVYhvbbie0zBdn6TB+q5R7QL7M6p6i2ANmqfzTU
e/yGTp+Zk3H/t2v2/YPmL9Y4wZfC/egSyoh5bw28tq/Ma9TZBI0DsU2cIeEnoYfT
aZRpNYH5kl6J5JqbGVxegz5NLf0r7g==
=aHEW
-----END PGP SIGNATURE-----

--Sig_/eDCBOtPvZTwfaOIIDj=Yg_u--
