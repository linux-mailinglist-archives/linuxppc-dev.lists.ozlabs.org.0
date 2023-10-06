Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C28E07BAFFB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 03:12:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=es674kO+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S1r4R4mPmz3vYt
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 12:12:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=es674kO+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::535; helo=mail-pg1-x535.google.com; envelope-from=bagasdotme@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S1r3W3vjBz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Oct 2023 12:11:18 +1100 (AEDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-517ab9a4a13so1158928a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Oct 2023 18:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696554675; x=1697159475; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SnMIZQ1itOmcDHvskxmE8+4KsR3yjh22yfXupSgvUf8=;
        b=es674kO+E9C2RuPVyy5PAq/nZh+u5byaLdY/RIT/pwjLSu6+imjwMrnbd+Ep04OPMd
         E+s0Tdm1fFxV2By8YWI/LXD8CQSZpnnE6tkT8VSfR3aLF0RZtxDfdX3QO4GM4ShRw67U
         3TqiNtgYxPeMs2fySoAoLKeE9BoOmGJ/lyKaOkyoWGerpaZPtHPTrxk5VRNrAJhK68B/
         W2TekIta/q+rxUz1Y2lPVTZbTxJJOkHFkTStTNNmwgezwh8WUWCSnw3hZf1rDAP+p0em
         fBZKm88juuGS5Lk9qJo6b846S/7qsZhRUhLnQXqKNozcp7YuyyNRkNjkujVCzTcLvE4w
         ynug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696554675; x=1697159475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SnMIZQ1itOmcDHvskxmE8+4KsR3yjh22yfXupSgvUf8=;
        b=o1qDYdCik3Al7evT9nR14hbWz8AAg/oLShfOFiBvU4eV7JNudRoSvFPIg7tk4KaKqM
         iHSke6skZcIlD0dEqGUEYlfXLSCF6djEsaPG1CLKn0YNeJ6+Hu3pN3iX9HcECQK7M4eI
         7f7txTm8rOstM2kSm6eUml+WKvYdQAgrZS9gmQZwAbmo7TXfbKvlr1BCHqXFF6Pi6Z8g
         1mAlJ0cgWdd3jjAU1oW1Zq/FLOSUq2pyZ1jFZA6cVq3QJU/tKvmOkXAeD/neZdDHTqXH
         jmUy9a9pAWuwNjilZvWHK1Stn6VZfvYBh/fVZIdF+o/1fm2GZLraGt6cbbjDqw3ANXtK
         4W1Q==
X-Gm-Message-State: AOJu0YwYw/Ufr0hCb4Ikb6m5tKCWfaDrttEv1qwoN2opDV2wW3B0rRlK
	q34YXaakZNHCqE86W2FNOaw=
X-Google-Smtp-Source: AGHT+IGAx1Lm/RUNQQ+9sW6I2ski4xP3nLI1Kx5SFKlCCkyX1kqAVSqEi8dZKwe6tcK2oBNe/Fh6BQ==
X-Received: by 2002:a17:903:22ce:b0:1c7:733b:27c7 with SMTP id y14-20020a17090322ce00b001c7733b27c7mr8569944plg.56.1696554675358;
        Thu, 05 Oct 2023 18:11:15 -0700 (PDT)
Received: from debian.me ([103.131.18.64])
        by smtp.gmail.com with ESMTPSA id s20-20020a170902989400b001c5b8087fe5sm2421494plp.94.2023.10.05.18.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Oct 2023 18:11:14 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id AF3D48209CB9; Fri,  6 Oct 2023 08:11:12 +0700 (WIB)
Date: Fri, 6 Oct 2023 08:11:12 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Erhard Furtner <erhard_f@mailbox.org>,
	Linux PowerPC <linuxppc-dev@lists.ozlabs.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Regressions <regressions@lists.linux.dev>
Subject: Re: [Bisected] PowerMac G5 fails booting kernel 6.6-rc3 (BUG: Unable
 to handle kernel data access at 0xfeffbb62ffec65fe)
Message-ID: <ZR9esG8H17LY2KOX@debian.me>
References: <20230929132750.3cd98452@yea>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Xlus9BP6q0VwNtKi"
Content-Disposition: inline
In-Reply-To: <20230929132750.3cd98452@yea>
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
Cc: Andrew Morton <akpm@linux-foundation.org>, "Mike Rapoport \(IBM\)" <rppt@kernel.org>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Xlus9BP6q0VwNtKi
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 01:27:50PM +0200, Erhard Furtner wrote:
> Greetings!
>=20
> Kernel 6.5.5 boots fine on my PowerMac G5 11,2 but kernel 6.6-rc3 fails t=
o boot with following dmesg shown on the OpenFirmware console (transcribed =
screenshot):
>=20
> [...]
> SLUB: HWalign=3D128, Order=3D0-3, MinObjects=3D0, CPUs=3D2, Nodes=3D1
> rcu: Hierarchical RCU implementation.
>  Tracing variant of Tasks RCU enabled.
> rcu: RCU calculated value of scheduler-enlistment delay is 30 jiffies.
> NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
> mpic: Setting up MPIC " MPIC 1   " version 1.2 at f8040000, max 2 CPUs
> mpic: ISU size: 124, shift: 7, mask: 7f
> mpic: Initializing for 124 sources
> mpic: Setting up HT PICs workarounds for U3/U4
> BUG: Unable to handle kernel data access at 0xfeffbb62ffec65fe
> Faulting instruction address: 0xc00000000005dc40
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=3D4K MMU=3DHash SMP NR_CPUS=3D2 PowerMac
> Modules linked in:
> CPU: 0 PID: 0 Comm: swapper/0 Tainted: G                T  6.6.0-rc3-PMac=
GS #1
> Hardware name: PowerMac11,2 PPC970MP 0x440101 PowerMac
> NIP:  c00000000005dc40 LR: c000000000066660 CTR: c000000000007730
> REGS: c0000000022bf510 TRAP: 0380   Tainted: G                T (6.6.0-rc=
3-PMacGS)
> MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 44004242  XER: 00000000
> IRQMASK: 3
> GPR00: 0000000000000000 c0000000022bf7b0 c0000000010c0b00 00000000000001ac
> GPR04: 0000000003c80000 0000000000000300 c0000000f20001ae 0000000000000300
> GPR08: 0000000000000006 feffbb62ffec65ff 0000000000000001 0000000000000000
> GPR12: 9000000000001032 c000000002362000 c000000000f76b80 000000000349ecd8
> GPR16: 0000000002367ba8 0000000002367f08 0000000000000006 0000000000000000
> GPR20: 00000000000001ac c000000000f6f920 c0000000022cd985 000000000000000c
> GPR24: 0000000000000300 00000003b0a3691d c0003e008030000e 0000000000000000
> GPR28: c00000000000000c c0000000f20001ee feffbb62ffec65fe 00000000000001ac
> NIP [c00000000005dc40] hash_page_do_lazy_icache+0x50/0x100
> LR [c000000000066660] __hash_page_4K+0x420/0x590
> Call Trace:
> [c0000000022bf7e0] [ffffffffffffffff] 0xffffffffffffffff
> [c0000000022bf8c0] [c00000000005e164] hash_page_mm+0x364/0x6f0
> [c0000000022bf990] [c00000000005e684] do_hash_fault+0x114/0x2b0
> [c0000000022bf9c0] [c0000000000078e8] data_access_common_virt+0x198/0x1f0
> --- interrupt: 300 at mpic_init+0x4bc/0x10c4
> NIP:  c000000002020a5c LR: c000000002020a04 CTR: 0000000000000000
> REGS: c0000000022bf9f0 TRAP: 0300   Tainted: G                T (6.6.0-rc=
3-PMacGS)
> MSR:  9000000000001032 <SF,HV,ME,IR,DR,RI>  CR: 24004248  XER: 00000000
> DAR: c0003e008030000e DSISR: 40000000 IRQMASK: 1
> GPR00: 0000000000000000 c0000000022bfc90 c0000000010c0b00 c0003e0080300000
> GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> GPR08: 0000000000000000 221b80894c06df2f 0000000000000000 0000000000000000
> GPR12: 0000000000000000 c000000002362000 c000000000f76b80 000000000349ecd8
> GPR16: 0000000002367ba8 0000000002367f08 0000000002367c70 0000000000000000
> GPR20: 567ce25e8c9202b7 c000000000f6f920 0000000000000001 c0003e0080300000
> GPR24: c00000000226f348 0000000000000004 c00000000404c640 0000000000000000
> GPR28: c0003e0080300000 c00000000404c000 45886d8559cb69b4 c0000000022bfc90
> NIP [c00000000005dc40] mpic_init+0x4bc/0x10c4
> LR [c000000000066660] mpic_init+0x464/0x10c4
> ~~~ interrupt: 300
> [c0000000022bfd90] [c000000002022ae4] pmac_setup_one_mpic+0x258/0x2dc
> [c0000000022bf2e0] [c000000002022df4] pmac_pic_init+0x28c/0x3d8
> [c0000000022bfef0] [c00000000200b750] init_IRQ+0x90/0x140
> [c0000000022bff30] [c0000000020053c0] start_kernel+0x57c/0x78c
> [c0000000022bffe0] [c00000000000cb48] start_here_common+0x1c/0x20
> Code: 09290000 7c292040 4081007c fbc10020 3d220127 78843664 3929d700 ebc9=
0000 7fde2214 e93e0000 712a0001 40820064 <e93e0000> 71232000 40820048 e93e0=
000
> ---[ end trace 0000000000000000 ]---
>=20
> Kernel panic - not syncing: Fatal exception
> Rebooting in 40 seconds..
>=20
>=20
> I bisected the issue and got 9fee28baa601f4dbf869b1373183b312d2d5ef3d as =
1st bad commit:
>=20
>  # git bisect good
> 9fee28baa601f4dbf869b1373183b312d2d5ef3d is the first bad commit
> commit 9fee28baa601f4dbf869b1373183b312d2d5ef3d
> Author: Matthew Wilcox (Oracle) <willy@infradead.org>
> Date:   Wed Aug 2 16:13:49 2023 +0100
>=20
>     powerpc: implement the new page table range API
>    =20
>     Add set_ptes(), update_mmu_cache_range() and flush_dcache_folio().  C=
hange
>     the PG_arch_1 (aka PG_dcache_dirty) flag from being per-page to per-f=
olio.
>    =20
>     [willy@infradead.org: re-export flush_dcache_icache_folio()]
>       Link: https://lkml.kernel.org/r/ZMx1daYwvD9EM7Cv@casper.infradead.o=
rg
>     Link: https://lkml.kernel.org/r/20230802151406.3735276-22-willy@infra=
dead.org
>     Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
>     Acked-by: Mike Rapoport (IBM) <rppt@kernel.org>
>     Cc: Michael Ellerman <mpe@ellerman.id.au>
>     Cc: Nicholas Piggin <npiggin@gmail.com>
>     Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>     Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>=20
>  arch/powerpc/include/asm/book3s/32/pgtable.h |  5 ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h |  6 +---
>  arch/powerpc/include/asm/book3s/pgtable.h    | 11 ++----
>  arch/powerpc/include/asm/cacheflush.h        | 14 +++++---
>  arch/powerpc/include/asm/kvm_ppc.h           | 10 +++---
>  arch/powerpc/include/asm/nohash/pgtable.h    | 16 +++------
>  arch/powerpc/include/asm/pgtable.h           | 12 +++++++
>  arch/powerpc/mm/book3s64/hash_utils.c        | 11 +++---
>  arch/powerpc/mm/cacheflush.c                 | 41 ++++++++-------------
>  arch/powerpc/mm/nohash/e500_hugetlbpage.c    |  3 +-
>  arch/powerpc/mm/pgtable.c                    | 53 ++++++++++++++++------=
------
>  11 files changed, 89 insertions(+), 93 deletions(-)
>=20
>=20
> And indeed when I revert commit 9fee28baa601f4dbf869b1373183b312d2d5ef3d =
I get a booting kernel again. I reverted the commit on top of 864609c6a0b5f=
0464f6ec7869cb2a45a529c35d7 (HEAD) as I get build issues when I revert it o=
n top of 6.6-rc3.
>=20

Matthew Wilcox, did you miss this regression report? You should look into it
since it is (apparently) cause by a commit of yours.

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--Xlus9BP6q0VwNtKi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZR9esAAKCRD2uYlJVVFO
o+TGAQCdrCrLD0HMpTA2w8CpBJAhudhKSVy2zSJ3jHgytqqHMgD+MVl2fKY2FZB6
6pLZlCRFuswIcZ6OhAerNePRnnzSyQ4=
=/NDm
-----END PGP SIGNATURE-----

--Xlus9BP6q0VwNtKi--
