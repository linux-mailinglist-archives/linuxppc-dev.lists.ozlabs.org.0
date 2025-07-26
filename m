Return-Path: <linuxppc-dev+bounces-10411-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64FB12CB1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jul 2025 23:39:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bqJ6P6YWbz2xWc;
	Sun, 27 Jul 2025 07:39:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753565965;
	cv=none; b=OcN8sBDFzY3FGMlltLVKEMDlbKB7HDIRA6bp9cCEXZO5/ajwkPi31+tP8v1qTeizjKjanDDjdiVrDcH4ZHOipf9PtT4NVg1Q/k/yyTQhF7IcDarXuaN4V42Dvkg3lYGJG5G2+wETTKCQzh2LvhuJy/sTTWWlWMlrb4SjwHZPHBdA9K2AaL9yOuTC2IzB51r+t5wJLx0GKLiWxxLuWsJSeJTj4N5yWRX5UzZt/CTGGk1N4Zu89B5qInJ5BM5qNVI3lIvaYha8xYikymyiUA9Q8qGlWQ7f4q2mm9TruQ5/3KYWJq02Ha7K5v/N0sSYA8sxv8XwxUI98OWcLcE2AKapFw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753565965; c=relaxed/relaxed;
	bh=3Xsf8BwNfX+9WQapyUmLR6LbHjEJWolG21G8mCBRHLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QY5mGj5tNxj8ElRSE6si1op71HxtqsOsAnB+vcT74VWd7B22UemBt5ru74D3OZ1gK9j00FZmGcXRUMttV8cQO59xcjwLmE4/Ki9LhaTPnwfbj3mo1g0or7OfOheN8e3K+WoMIqyIVTogplMZi95qY2jOS4LgBh84CgDwcV2SAfqRmYJAetlc9GrdKOUu96e7T2Sz53Ev4QVKgzMedVTnBVzTYEPPlzIVZPEIlAppRnCktsGt/FXR2rkMOLdRg+hUkEkIETjM1yeJj0CbavvWkYMrbBRK5m/W3RXYz7Mmagjf/zuTGKEp6TJ4BlPYk8MtzIp2I+t1C9B1Rr7g/BV8EQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XHrb3axi; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XHrb3axi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bqJ6N41lsz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Jul 2025 07:39:24 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DDE2A5C136A;
	Sat, 26 Jul 2025 21:39:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D8BEC4CEED;
	Sat, 26 Jul 2025 21:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753565960;
	bh=bE8gOgUvTZi4vI0lg9qUYLnf/GEXOkxooNHihx3vuJw=;
	h=Date:From:To:Cc:Subject:From;
	b=XHrb3axiSsGzIoF2z2Ix7pQjSMf1Hy42ar894fKLOABDtiMSiJhU7EOw7iJrgd6tB
	 IbaRdb5qeWEpZin3fRvADFhKWu6rwXZK251hn0vmJbDMaGw9ALbzwGt5jlO4g1Ev/5
	 38kyT5jk9ILeJA/C732uod/apU+rxyQj7EYgW1D/FfLwRv3xciKcU+EEYDtA1K1HQw
	 89qGLSJb5I1UF5EVZNysHbVA4poyaagUpDWiSn+7w1Wkxrul3aS8xbgWpQmDVmq97o
	 1XX7DFiDUydJ2ZJduymhDp4XdKL9MxP2XYT1rwFJYEc0IFFTjUHBVSjh8qB39SdIcg
	 FmVRs5hgMDysg==
Date: Sat, 26 Jul 2025 14:39:20 -0700
From: Kees Cook <kees@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Akihiko Odaki <akihiko.odaki@daynix.com>,
	Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Larsson <andreas@gaisler.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Chris Zankel <chris@zankel.net>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dave Martin <Dave.Martin@arm.com>,
	David Hildenbrand <david@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Dishank Jogi <dishank.jogi@siqol.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, "H. Peter Anvin" <hpa@zytor.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>, Kees Cook <kees@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-um@lists.infradead.org, loongarch@lists.linux.dev,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Richard Weinberger <richard@nod.at>, Rich Felker <dalias@libc.org>,
	Russell King <linux@armlinux.org.uk>, sparclinux@vger.kernel.org,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
	x86@kernel.org, Yin Fengwei <fengwei_yin@linux.alibaba.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>
Subject: [GIT PULL] execve updates for v6.17
Message-ID: <202507261437.F2079B3B7@keescook>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Linus,

Please pull these execve updates for v6.17. Note that while the REGSET
macro changes touch all the architectures, they are fairly mechanical
and have been in linux-next for almost the entire development window.

Thanks!

-Kees

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/execve-v6.17

for you to fetch changes up to 7f71195c15dcf5f34c4c7f056603659374e3a525:

  fork: reorder function qualifiers for copy_clone_args_from_user (2025-07-17 16:37:05 -0700)

----------------------------------------------------------------
execve updates for v6.17

- Introduce regular REGSET note macros arch-wide (Dave Martin)

- Remove arbitrary 4K limitation of program header size (Yin Fengwei)

- Reorder function qualifiers for copy_clone_args_from_user() (Dishank Jogi)

----------------------------------------------------------------
Dave Martin (23):
      regset: Fix kerneldoc for struct regset_get() in user_regset
      regset: Add explicit core note name in struct user_regset
      binfmt_elf: Dump non-arch notes with strictly matching name and type
      ARC: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      ARM: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      arm64: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      csky: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      hexagon: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      LoongArch: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      m68k: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      MIPS: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      nios2: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      openrisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      parisc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      powerpc/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      riscv: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      s390/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      sh: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      sparc: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      x86/ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      um: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      xtensa: ptrace: Use USER_REGSET_NOTE_TYPE() to specify regset note names
      binfmt_elf: Warn on missing or suspicious regset note names

Dishank Jogi (1):
      fork: reorder function qualifiers for copy_clone_args_from_user

Yin Fengwei (1):
      binfmt_elf: remove the 4k limitation of program header size

 include/linux/regset.h                   | 12 +++++-
 arch/arc/kernel/ptrace.c                 |  4 +-
 arch/arm/kernel/ptrace.c                 |  6 +--
 arch/arm64/kernel/ptrace.c               | 52 +++++++++++-----------
 arch/csky/kernel/ptrace.c                |  4 +-
 arch/hexagon/kernel/ptrace.c             |  2 +-
 arch/loongarch/kernel/ptrace.c           | 16 +++----
 arch/m68k/kernel/ptrace.c                |  4 +-
 arch/mips/kernel/ptrace.c                | 20 ++++-----
 arch/nios2/kernel/ptrace.c               |  2 +-
 arch/openrisc/kernel/ptrace.c            |  4 +-
 arch/parisc/kernel/ptrace.c              |  8 ++--
 arch/powerpc/kernel/ptrace/ptrace-view.c | 74 ++++++++++++++++----------------
 arch/riscv/kernel/ptrace.c               | 12 +++---
 arch/s390/kernel/ptrace.c                | 42 +++++++++---------
 arch/sh/kernel/ptrace_32.c               |  4 +-
 arch/sparc/kernel/ptrace_32.c            |  4 +-
 arch/sparc/kernel/ptrace_64.c            |  8 ++--
 arch/x86/kernel/ptrace.c                 | 22 +++++-----
 arch/x86/um/ptrace.c                     | 10 ++---
 arch/xtensa/kernel/ptrace.c              |  4 +-
 fs/binfmt_elf.c                          | 38 ++++++++++------
 fs/binfmt_elf_fdpic.c                    | 17 ++++----
 kernel/fork.c                            |  2 +-
 24 files changed, 196 insertions(+), 175 deletions(-)

-- 
Kees Cook

