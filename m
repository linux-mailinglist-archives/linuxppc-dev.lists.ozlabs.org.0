Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 236894B6C8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 13:45:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jygmh4ZBjz3f8t
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 23:45:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jyghh32j8z3cQp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 23:42:12 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Jyggy1NNJz9sSj;
 Tue, 15 Feb 2022 13:41:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aAFigYi3mPjJ; Tue, 15 Feb 2022 13:41:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Jyggn54j6z9sSq;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A34A58B778;
 Tue, 15 Feb 2022 13:41:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8BMkLkapqY1B; Tue, 15 Feb 2022 13:41:25 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.6.174])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 864958B780;
 Tue, 15 Feb 2022 13:41:24 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 21FCfF0a080604
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 15 Feb 2022 13:41:15 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 21FCfCsi080602;
 Tue, 15 Feb 2022 13:41:12 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Arnd Bergmann <arnd@arndb.de>,
 Kees Cook <keescook@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 00/13] Fix LKDTM for PPC64/IA64/PARISC v4
Date: Tue, 15 Feb 2022 13:40:55 +0100
Message-Id: <cover.1644928018.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1644928860; l=3486; s=20211009;
 h=from:subject:message-id; bh=m/DTx99DZSafIIAwqkPz//VBU0dyGp+Z1HSmYNYxr4k=;
 b=cA7HXYxl5bBjs2eDNDE7zc7AazTXQFugH4g9S2nHM9kGtuT4amV6deKgKTSjs1MSmqM/lI026rsd
 Qqw7wMTrAUUX5rW7aGfQEz1o7/o1rvZAnijGSKkg2maBIdk3DYCk
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PPC64/IA64/PARISC have function descriptors. LKDTM doesn't work
on those three architectures because LKDTM messes up function
descriptors with functions.

This series does some cleanup in the three architectures and
refactors function descriptors so that it can then easily use it
in a generic way in LKDTM.

Changes in v4:
- Added patch 1 which Fixes 'sparse' for powerpc64le after wrong report on previous series, refer https://github.com/ruscur/linux-ci/actions/runs/1351427671
- Exported dereference_function_descriptor() to modules
- Addressed other received comments
- Rebased on latest powerpc/next (5a72345e6a78120368fcc841b570331b6c5a50da)

Changes in v3:
- Addressed received comments
- Swapped some of the powerpc patches to keep func_descr_t renamed as struct func_desc and remove 'struct ppc64_opd_entry'
- Changed HAVE_FUNCTION_DESCRIPTORS macro to a config item CONFIG_HAVE_FUNCTION_DESCRIPTORS
- Dropped patch 11 ("Fix lkdtm_EXEC_RODATA()")

Changes in v2:
- Addressed received comments
- Moved dereference_[kernel]_function_descriptor() out of line
- Added patches to remove func_descr_t and func_desc_t in powerpc
- Using func_desc_t instead of funct_descr_t
- Renamed HAVE_DEREFERENCE_FUNCTION_DESCRIPTOR to HAVE_FUNCTION_DESCRIPTORS
- Added a new lkdtm test to check protection of function descriptors

Christophe Leroy (13):
  powerpc: Fix 'sparse' checking on PPC64le
  powerpc: Move and rename func_descr_t
  powerpc: Use 'struct func_desc' instead of 'struct ppc64_opd_entry'
  powerpc: Remove 'struct ppc64_opd_entry'
  powerpc: Prepare func_desc_t for refactorisation
  ia64: Rename 'ip' to 'addr' in 'struct fdesc'
  asm-generic: Define CONFIG_HAVE_FUNCTION_DESCRIPTORS
  asm-generic: Define 'func_desc_t' to commonly describe function
    descriptors
  asm-generic: Refactor dereference_[kernel]_function_descriptor()
  lkdtm: Force do_nothing() out of line
  lkdtm: Really write into kernel text in WRITE_KERN
  lkdtm: Fix execute_[user]_location()
  lkdtm: Add a test for function descriptors protection

 arch/Kconfig                             |  3 +
 arch/ia64/Kconfig                        |  1 +
 arch/ia64/include/asm/elf.h              |  2 +-
 arch/ia64/include/asm/sections.h         | 24 +-------
 arch/ia64/kernel/module.c                |  6 +-
 arch/parisc/Kconfig                      |  1 +
 arch/parisc/include/asm/sections.h       | 16 ++----
 arch/parisc/kernel/process.c             | 21 -------
 arch/powerpc/Kconfig                     |  1 +
 arch/powerpc/Makefile                    |  2 +-
 arch/powerpc/include/asm/code-patching.h |  2 +-
 arch/powerpc/include/asm/elf.h           |  6 ++
 arch/powerpc/include/asm/sections.h      | 29 ++--------
 arch/powerpc/include/asm/types.h         |  6 --
 arch/powerpc/include/uapi/asm/elf.h      |  8 ---
 arch/powerpc/kernel/module_64.c          | 42 ++++++--------
 arch/powerpc/kernel/ptrace/ptrace.c      |  6 ++
 arch/powerpc/kernel/signal_64.c          |  8 +--
 drivers/misc/lkdtm/core.c                |  1 +
 drivers/misc/lkdtm/lkdtm.h               |  1 +
 drivers/misc/lkdtm/perms.c               | 71 +++++++++++++++++++-----
 include/asm-generic/sections.h           | 15 ++++-
 include/linux/kallsyms.h                 |  2 +-
 kernel/extable.c                         | 24 +++++++-
 tools/testing/selftests/lkdtm/tests.txt  |  1 +
 25 files changed, 155 insertions(+), 144 deletions(-)

-- 
2.34.1

