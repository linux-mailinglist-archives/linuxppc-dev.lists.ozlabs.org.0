Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B292EFD97
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 04:45:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DCQps0ZjvzDr81
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Jan 2021 14:45:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=131.153.2.42;
 helo=h1.fbrelay.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DCQbm6SlfzDqyH
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jan 2021 14:35:47 +1100 (AEDT)
Received: from MTA-07-4.privateemail.com (mta-07.privateemail.com
 [198.54.127.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id E2EB1800D8
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 22:26:15 -0500 (EST)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id DA997600C7
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Jan 2021 22:26:04 -0500 (EST)
Received: from oc8246131445.ibm.com (unknown [10.20.151.217])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id A9CF46009B
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Jan 2021 03:26:04 +0000 (UTC)
From: "Christopher M. Riedl" <cmr@codefail.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 0/8] Improve signal performance on PPC64 with KUAP
Date: Fri,  8 Jan 2021 21:25:49 -0600
Message-Id: <20210109032557.13831-1-cmr@codefail.de>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP
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

As reported by Anton, there is a large penalty to signal handling
performance on radix systems using KUAP. The signal handling code
performs many user access operations, each of which needs to switch the
KUAP permissions bit to open and then close user access. This involves a
costly 'mtspr' operation [0].

There is existing work done on x86 and by Christopher Leroy for PPC32 to
instead open up user access in "blocks" using user_*_access_{begin,end}.
We can do the same in PPC64 to bring performance back up on KUAP-enabled
radix and now also hash MMU systems [1].

Hash MMU KUAP support along with uaccess flush has landed in linuxppc/next
since the last revision. This series also provides a large benefit on hash
with KUAP. However, in the hash implementation of KUAP the user AMR is
always restored during system_call_exception() which cannot be avoided.
Fewer user access switches naturally also result in less uaccess flushing.

The first two patches add some needed 'unsafe' versions of copy-from
functions. While these do not make use of asm-goto they still allow for
avoiding the repeated uaccess switches.

The third patch moves functions called by setup_sigcontext() into a new
prepare_setup_sigcontext() to simplify converting setup_sigcontext()
into an 'unsafe' version which assumes an open uaccess window later.

The fourth patch cleans-up some of the Transactional Memory ifdef stuff
to simplify using uaccess blocks later.

The next two patches rewrite some of the signal64 helper functions to
be 'unsafe'. Finally, the last two patches update the main signal
handling functions to make use of the new 'unsafe' helpers and eliminate
some additional uaccess switching.

I used the will-it-scale signal1 benchmark to measure and compare
performance [2]. The below results are from running a minimal
kernel+initramfs QEMU/KVM guest on a POWER9 Blackbird:

	signal1_threads -t1 -s10

	|                             | hash   | radix  |
	| --------------------------- | ------ | ------ |
	| linuxppc/next               | 118693 | 133296 |
	| linuxppc/next w/o KUAP+KUEP | 228911 | 228654 |
	| unsafe-signal64             | 200480 | 234067 |

There were questions previously about the unsafe_copy_from_user() and
unsafe_copy_{vsx,fpr}_from_user() implementations in the first two
patches of this series [3][4]. The two results below show the performance
degradations when using the proposed alternate implementations:

	| unsafe-signal64-regs        | 178688 | 201128 |
	| unsafe-signal64-copy        | 147443 | 165759 |

Full trees with the two alternate implementations are available [5][6].

[0]: https://github.com/linuxppc/issues/issues/277
[1]: https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=196278
[2]: https://github.com/antonblanchard/will-it-scale/blob/master/tests/signal1.c
[3]: https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-October/219355.html
[4]: https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-October/219351.html
[5]: https://git.sr.ht/~cmr/linux/tree/unsafe-signal64-v3-regs
[6]: https://git.sr.ht/~cmr/linux/tree/unsafe-signal64-v3-copy

v3:	* Rebase on latest linuxppc/next
	* Reword confusing commit messages
	* Add missing comma in macro in signal.h which broke compiles without
	  CONFIG_ALTIVEC
	* Validate hash KUAP signal performance improvements

v2:	* Rebase on latest linuxppc/next + Christophe Leroy's PPC32
	  signal series
	* Simplify/remove TM ifdefery similar to PPC32 series and clean
	  up the uaccess begin/end calls
	* Isolate non-inline functions so they are not called when
	  uaccess window is open


Christopher M. Riedl (6):
  powerpc/uaccess: Add unsafe_copy_from_user
  powerpc/signal: Add unsafe_copy_{vsx,fpr}_from_user()
  powerpc/signal64: Move non-inline functions out of setup_sigcontext()
  powerpc/signal64: Remove TM ifdefery in middle of if/else block
  powerpc/signal64: Replace setup_sigcontext() w/
    unsafe_setup_sigcontext()
  powerpc/signal64: Replace restore_sigcontext() w/
    unsafe_restore_sigcontext()

Daniel Axtens (2):
  powerpc/signal64: Rewrite handle_rt_signal64() to minimise uaccess
    switches
  powerpc/signal64: Rewrite rt_sigreturn() to minimise uaccess switches

 arch/powerpc/include/asm/uaccess.h |  28 ++--
 arch/powerpc/kernel/signal.h       |  33 ++++
 arch/powerpc/kernel/signal_64.c    | 237 ++++++++++++++++++-----------
 3 files changed, 198 insertions(+), 100 deletions(-)

-- 
2.26.1

