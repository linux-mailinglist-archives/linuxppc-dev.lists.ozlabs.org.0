Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FDE33D78CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Jul 2021 16:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GZ07c3WTlz3bhv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jul 2021 00:49:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Jm0Ghr4D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Jm0Ghr4D; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GZ0764c96z2xZR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Jul 2021 00:49:22 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3559861AFD;
 Tue, 27 Jul 2021 14:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627397359;
 bh=Tjiwf4/hYWXFn9aUgPpl3D0HHZbelU5u+FTy8tvX/BA=;
 h=From:To:Cc:Subject:Date:From;
 b=Jm0Ghr4DY8S8DbJUMOgzNYNZ9TpUDawl2m4udsOCvZu6uErY0ceZK1ugOzDu5GYfU
 FcpYwKuxA6AjAy3zyCgVACtAq/UWFPG3mNHsh8tFDA5zWzInxHIu8o0jJfWh5vuzLj
 ++JkgaoWIL8JM41Ld9ZSmOyhjlGS5DRNjCGi0qceKIOC/UT+DuY98htxeqdY7x3FKV
 40uaxkb5SA6kv5iFRlvbFCA5wazm8JgMVhL91/E5GnpKc2GEeZREYLyo0ppxHTqLHX
 HXWc8AwqP3FWNXks7HkSQo4WKwHmUdrLF/lKZgKuXzZvtIgXac3yNPJy/etARITDNG
 3IhheeU5vs0Kw==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 0/6] compat: remove compat_alloc_user_space
Date: Tue, 27 Jul 2021 16:48:53 +0200
Message-Id: <20210727144859.4150043-1-arnd@kernel.org>
X-Mailer: git-send-email 2.29.2
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
Cc: Feng Tang <feng.tang@intel.com>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Helge Deller <deller@gmx.de>, x86@kernel.org,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Al Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Eric W. Biederman" <ebiederm@xmission.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

Going through compat_alloc_user_space() to convert indirect system call
arguments tends to add complexity compared to handling the native and
compat logic in the same code.

Out of the other remaining callers, the linux-media series went into
v5.14, and the network ioctl handling is now fixed in net-next, so
these are the last remaining users, and I now include the final
patch to remove the definitions as well.

Since these patches are now all that remains, it would be nice to
merge it all through Andrew's Linux-mm tree, which is already based
on top of linux-next.

       Arnd
---

Changes in v4:

- Rebase on top of net-next
- Split up and improve the kexec patch based on Christoph's suggestions
- Include final patch to remove compat_alloc_user_space
- Cc compat architecture maintainers

Link: https://lore.kernel.org/lkml/20210720150950.3669610-1-arnd@kernel.org/

Changes in v3:

- fix whitespace as pointed out by Christoph Hellwig
- minor build fixes
- rebase to v5.13-rc1

Link: https://lore.kernel.org/lkml/20210517203343.3941777-1-arnd@kernel.org/

Changes in v2:

- address review comments from Christoph Hellwig
- split syscall removal into a separate patch
- replace __X32_COND_SYSCALL() with individual macros for x32

Link: https://lore.kernel.org/lkml/20201208150614.GA15765@infradead.org/

Arnd Bergmann (6):
  kexec: move locking into do_kexec_load
  kexec: avoid compat_alloc_user_space
  mm: simplify compat_sys_move_pages
  mm: simplify compat numa syscalls
  compat: remove some compat entry points
  arch: remove compat_alloc_user_space

 arch/arm64/include/asm/compat.h           |   5 -
 arch/arm64/include/asm/uaccess.h          |  11 --
 arch/arm64/include/asm/unistd32.h         |  10 +-
 arch/arm64/lib/Makefile                   |   2 +-
 arch/arm64/lib/copy_in_user.S             |  77 ---------
 arch/mips/cavium-octeon/octeon-memcpy.S   |   2 -
 arch/mips/include/asm/compat.h            |   8 -
 arch/mips/include/asm/uaccess.h           |  26 ---
 arch/mips/kernel/syscalls/syscall_n32.tbl |  10 +-
 arch/mips/kernel/syscalls/syscall_o32.tbl |  10 +-
 arch/mips/lib/memcpy.S                    |  11 --
 arch/parisc/include/asm/compat.h          |   6 -
 arch/parisc/include/asm/uaccess.h         |   2 -
 arch/parisc/kernel/syscalls/syscall.tbl   |   8 +-
 arch/parisc/lib/memcpy.c                  |   9 -
 arch/powerpc/include/asm/compat.h         |  16 --
 arch/powerpc/kernel/syscalls/syscall.tbl  |  10 +-
 arch/s390/include/asm/compat.h            |  10 --
 arch/s390/include/asm/uaccess.h           |   3 -
 arch/s390/kernel/syscalls/syscall.tbl     |  10 +-
 arch/s390/lib/uaccess.c                   |  63 -------
 arch/sparc/include/asm/compat.h           |  19 ---
 arch/sparc/kernel/process_64.c            |   2 +-
 arch/sparc/kernel/signal32.c              |  12 +-
 arch/sparc/kernel/signal_64.c             |   8 +-
 arch/sparc/kernel/syscalls/syscall.tbl    |  10 +-
 arch/x86/entry/syscalls/syscall_32.tbl    |   4 +-
 arch/x86/entry/syscalls/syscall_64.tbl    |   2 +-
 arch/x86/include/asm/compat.h             |  13 --
 arch/x86/include/asm/uaccess_64.h         |   7 -
 include/linux/compat.h                    |  39 +----
 include/linux/uaccess.h                   |  10 --
 include/uapi/asm-generic/unistd.h         |  10 +-
 kernel/compat.c                           |  21 ---
 kernel/kexec.c                            | 103 +++++-------
 kernel/sys_ni.c                           |   5 -
 mm/mempolicy.c                            | 196 +++++-----------------
 mm/migrate.c                              |  50 +++---
 38 files changed, 175 insertions(+), 645 deletions(-)
 delete mode 100644 arch/arm64/lib/copy_in_user.S

-- 
2.29.2

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>
Cc: Helge Deller <deller@gmx.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: x86@kernel.org
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Eric W. Biederman" <ebiederm@xmission.com>
Cc: Christoph Hellwig <hch@infradead.org>
Cc: Feng Tang <feng.tang@intel.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mips@vger.kernel.org
Cc: linux-parisc@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-s390@vger.kernel.org
Cc: sparclinux@vger.kernel.org
Cc: linux-arch@vger.kernel.org
Cc: linux-api@vger.kernel.org
Cc: linux-mm@kvack.org
