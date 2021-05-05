Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B743C3733A2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 03:40:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZfYJ65fzz30Cw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 11:40:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au header.a=rsa-sha256 header.s=201702 header.b=CVxSpwfp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canb.auug.org.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=sfr@canb.auug.org.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=canb.auug.org.au header.i=@canb.auug.org.au
 header.a=rsa-sha256 header.s=201702 header.b=CVxSpwfp; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZfXl4yvBz2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 11:40:06 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4FZfXf1YScz9sT6;
 Wed,  5 May 2021 11:40:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1620178803;
 bh=gUSh3LSMd3wpKS0RGRX5FWNUp0KUTQowKKxok5YAWo0=;
 h=Date:From:To:Cc:Subject:From;
 b=CVxSpwfpH8W0E+PI8RIRghItEmCa8x4Qaht3XBqMLSsorUKMfcwiAbE4Oz+qoIx9E
 85sviWp3YBeCd9yHI29tlIgAoFFa09bKbsjJEDisNze1CUs2Khn7vaSsMC5zxPLbiR
 YGeddby5SAOmkJwlAvCANASHHKZnemRKKdIKmsUhXQEZS6eWKdZiCrcTZv8TO1l7+r
 sG4/0lzjCgL394GVDeay0x5ZbUSrtHz/nBhurATalPFzyBA1EYN5F34TFt3wSeqvkx
 kH5SfaiY/95n+5ekBD9mb9AjS88akn3m+S5lTHkBSnoqEUxpNNzwGg7VPX2NfnAqzG
 6UxcBWE37pz6g==
Date: Wed, 5 May 2021 11:39:59 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Andrew Morton <akpm@linux-foundation.org>, Michael Ellerman
 <mpe@ellerman.id.au>, PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: linux-next: manual merge of the akpm-current tree with the powerpc
 tree
Message-ID: <20210505113959.43340f19@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/.W9zcxspq/EztUcH6lziHSj";
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--Sig_/.W9zcxspq/EztUcH6lziHSj
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

Today's linux-next merge of the akpm-current tree got a conflict in:

  arch/powerpc/Kconfig

between commit:

  c6b05f4e233c ("powerpc/kconfig: Restore alphabetic order of the selects u=
nder CONFIG_PPC")

from the powerpc tree and commits:

  fd7d5c273c43 ("mm: generalize HUGETLB_PAGE_SIZE_VARIABLE")
  301ba77ae03c ("mm: generalize ARCH_ENABLE_MEMORY_[HOTPLUG|HOTREMOVE]")

from the akpm-current tree.

I fixed it up (see below) and can carry the fix as necessary. This
is now fixed as far as linux-next is concerned, but any non trivial
conflicts should be mentioned to your upstream maintainer when your tree
is submitted for merging.  You may also want to consider cooperating
with the maintainer of the conflicting tree to minimise any particularly
complex conflicts.

--=20
Cheers,
Stephen Rothwell

diff --cc arch/powerpc/Kconfig
index ab17a56c3d10,d4333049b813..000000000000
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@@ -118,11 -118,10 +118,13 @@@ config PP
  	# Please keep this list sorted alphabetically.
  	#
  	select ARCH_32BIT_OFF_T if PPC32
+ 	select ARCH_ENABLE_MEMORY_HOTPLUG
+ 	select ARCH_ENABLE_MEMORY_HOTREMOVE
 +	select ARCH_HAS_COPY_MC			if PPC64
  	select ARCH_HAS_DEBUG_VIRTUAL
 +	select ARCH_HAS_DEBUG_VM_PGTABLE
  	select ARCH_HAS_DEVMEM_IS_ALLOWED
 +	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC_PSERIES
  	select ARCH_HAS_ELF_RANDOMIZE
  	select ARCH_HAS_FORTIFY_SOURCE
  	select ARCH_HAS_GCOV_PROFILE_ALL
@@@ -163,8 -162,9 +165,8 @@@
  	select BUILDTIME_TABLE_SORT
  	select CLONE_BACKWARDS
  	select DCACHE_WORD_ACCESS		if PPC64 && CPU_LITTLE_ENDIAN
- 	select DMA_OPS_BYPASS			if PPC64
  	select DMA_OPS				if PPC64
+ 	select DMA_OPS_BYPASS			if PPC64
 -	select ARCH_HAS_DMA_MAP_DIRECT 		if PPC64 && PPC_PSERIES
  	select DYNAMIC_FTRACE			if FUNCTION_TRACER
  	select EDAC_ATOMIC_SCRUB
  	select EDAC_SUPPORT
@@@ -182,15 -181,12 +184,15 @@@
  	select GENERIC_STRNCPY_FROM_USER
  	select GENERIC_STRNLEN_USER
  	select GENERIC_TIME_VSYSCALL
 -	select GENERIC_GETTIMEOFDAY
 +	select GENERIC_VDSO_TIME_NS
  	select HAVE_ARCH_AUDITSYSCALL
- 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
 +	select HAVE_ARCH_HUGE_VMALLOC		if HAVE_ARCH_HUGE_VMAP
+ 	select HAVE_ARCH_HUGE_VMAP		if PPC_BOOK3S_64 && PPC_RADIX_MMU
  	select HAVE_ARCH_JUMP_LABEL
 +	select HAVE_ARCH_JUMP_LABEL_RELATIVE
  	select HAVE_ARCH_KASAN			if PPC32 && PPC_PAGE_SHIFT <=3D 14
  	select HAVE_ARCH_KASAN_VMALLOC		if PPC32 && PPC_PAGE_SHIFT <=3D 14
 +	select HAVE_ARCH_KFENCE			if PPC32
  	select HAVE_ARCH_KGDB
  	select HAVE_ARCH_MMAP_RND_BITS
  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS	if COMPAT
@@@ -231,19 -227,23 +233,20 @@@
  	select HAVE_LIVEPATCH			if HAVE_DYNAMIC_FTRACE_WITH_REGS
  	select HAVE_MOD_ARCH_SPECIFIC
  	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 -	select HAVE_HARDLOCKUP_DETECTOR_ARCH	if (PPC64 && PPC_BOOK3S)
 -	select HAVE_OPTPROBES			if PPC64
 +	select HAVE_OPTPROBES
  	select HAVE_PERF_EVENTS
  	select HAVE_PERF_EVENTS_NMI		if PPC64
 -	select HAVE_HARDLOCKUP_DETECTOR_PERF	if PERF_EVENTS && HAVE_PERF_EVENTS_=
NMI && !HAVE_HARDLOCKUP_DETECTOR_ARCH
  	select HAVE_PERF_REGS
  	select HAVE_PERF_USER_STACK_DUMP
 -	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
 -	select MMU_GATHER_RCU_TABLE_FREE
 -	select MMU_GATHER_PAGE_SIZE
  	select HAVE_REGS_AND_STACK_ACCESS_API
 -	select HAVE_RELIABLE_STACKTRACE		if PPC_BOOK3S_64 && CPU_LITTLE_ENDIAN
 +	select HAVE_RELIABLE_STACKTRACE
 +	select HAVE_RSEQ
  	select HAVE_SOFTIRQ_ON_OWN_STACK
 +	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-gu=
ard=3Dtls -mstack-protector-guard-reg=3Dr2)
 +	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-gu=
ard=3Dtls -mstack-protector-guard-reg=3Dr13)
  	select HAVE_SYSCALL_TRACEPOINTS
  	select HAVE_VIRT_CPU_ACCOUNTING
 -	select HAVE_IRQ_TIME_ACCOUNTING
 -	select HAVE_RSEQ
++	select HUGETLB_PAGE_SIZE_VARIABLE	if PPC_BOOK3S_64 && HUGETLB_PAGE
  	select IOMMU_HELPER			if PPC64
  	select IRQ_DOMAIN
  	select IRQ_FORCED_THREADING

--Sig_/.W9zcxspq/EztUcH6lziHSj
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmCR928ACgkQAVBC80lX
0Gw4EAf/Yi8XHzVXWZpxR9XTs6RyVOU5rQM+bdB8yJi4LV8257+m4yj3eLJx04tG
oYL+Rg/foCGPP/FAF0/ZA0oLuj/NNIAWZqktED8OdoSyikvkHwoTFisAcOapRNwF
8DYmt82SAByq9crkbBqRIcct5OnXV6IwTR9tzCKVJhJGBFE74390u453BkC4Fx2F
xcFyICV+/Fug1Z8NjAPUFZ7XOPFRailSw//TvVzbfKZomwaSMlXMEfMG5/AHOBqL
QAvsOpuJmJg1bWD3mC1ouCs0MmfJARBlo/kKelzyD/L5gEb9OegsWzVw/IQIwwqB
mVn4aXgzMkKnGo+dOvTANjm77WyUnA==
=Uuqv
-----END PGP SIGNATURE-----

--Sig_/.W9zcxspq/EztUcH6lziHSj--
