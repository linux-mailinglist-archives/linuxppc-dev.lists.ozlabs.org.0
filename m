Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3473E54500A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 17:00:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJnMM0nzrz3cC4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 01:00:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ayUCVdul;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJnLp1mkgz2xTc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 00:59:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ayUCVdul;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LJnLn5Dd2z4xD2;
	Fri, 10 Jun 2022 00:59:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1654786786;
	bh=N9NnYp3GcVuyR2yBzP9kXGZYH5tjTQycICPNf8wRK0E=;
	h=From:To:Cc:Subject:Date:From;
	b=ayUCVdulsnb8alDqSNWslgtCmQ3NuK4Q5IAhoRnjtLXhugwvcfOj81qJr1CpEzcs6
	 A+H0TiA7W1JFaNXgG9ph6Ymz1T8qJ3zcdoJnZ03qT73+CibG28F3H1oSphJjGBxbZM
	 JzsnBUDSvYkQs93RZLzCXLSN08efakPyaZXdGAUa3nBftWl/O4Oo/bBj/JwBtxdOaG
	 pxtaWj4NRnZ8ZpLOQtagatOJqC3pTL2JkQeoNDiJUoub0INWBTzlc+Hk2f8pT72qeb
	 BD+xaG3wUzTpa/LTDSEWPnfV/LIMamYppy9m2nA/+gBcvBqTR3hZIB5iXFDL1Xh3RA
	 ugoMqD84b0Z8Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-5.19-2 tag
Date: Fri, 10 Jun 2022 00:59:45 +1000
Message-ID: <87k09pdgri.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ariel.miculas@belden.com, masahiroy@kernel.org, linux-kernel@vger.kernel.org, oss@buserror.net, vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, heying24@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi Linus,

Please pull powerpc fixes for 5.19:

The following changes since commit 6112bd00e84e5dbffebc3c1e908cbe914ca772ee:

  Merge tag 'powerpc-5.19-1' of git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux (2022-05-28 11:27:17 -0700)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-5.19-2

for you to fetch changes up to 8e1278444446fc97778a5e5c99bca1ce0bbc5ec9:

  powerpc/32: Fix overread/overwrite of thread_struct via ptrace (2022-06-09 23:32:56 +1000)

- ------------------------------------------------------------------
powerpc fixes for 5.19 #2

 - On 32-bit fix overread/overwrite of thread_struct via ptrace PEEK/POKE.

 - Fix softirqs not switching to the softirq stack since we moved irq_exit().

 - Force thread size increase when KASAN is enabled to avoid stack overflows.

 - On Book3s 64 mark more code as not to be instrumented by KASAN to avoid crashes.

 - Exempt __get_wchan() from KASAN checking, as it's inherently racy.

 - Fix a recently introduced crash in the papr_scm driver in some configurations.

 - Remove include of <generated/compile.h> which is forbidden.

Thanks to: Ariel Miculas, Chen Jingwen, Christophe Leroy, Erhard Furtner, He Ying, Kees
Cook, Masahiro Yamada, Nageswara R Sastry, Paul Mackerras, Sachin Sant, Vaibhav Jain,
Wanming Hu.

- ------------------------------------------------------------------
He Ying (1):
      powerpc/kasan: Silence KASAN warnings in __get_wchan()

Masahiro Yamada (1):
      powerpc/book3e: get rid of #include <generated/compile.h>

Michael Ellerman (3):
      powerpc: Don't select HAVE_IRQ_EXIT_ON_IRQ_STACK
      powerpc/kasan: Force thread size increase with KASAN
      powerpc/32: Fix overread/overwrite of thread_struct via ptrace

Paul Mackerras (1):
      powerpc/kasan: Mark more real-mode code as not to be instrumented

Vaibhav Jain (1):
      powerpc/papr_scm: don't requests stats with '0' sized stats buffer


 arch/powerpc/Kconfig                      |  2 --
 arch/powerpc/include/asm/thread_info.h    | 10 ++++++++--
 arch/powerpc/kernel/Makefile              |  2 ++
 arch/powerpc/kernel/process.c             |  4 ++--
 arch/powerpc/kernel/ptrace/ptrace-fpu.c   | 20 ++++++++++++++------
 arch/powerpc/kernel/ptrace/ptrace.c       |  3 +++
 arch/powerpc/kernel/rtas.c                |  4 ++--
 arch/powerpc/kexec/crash.c                |  2 +-
 arch/powerpc/mm/nohash/kaslr_booke.c      |  8 ++------
 arch/powerpc/platforms/powernv/Makefile   |  1 +
 arch/powerpc/platforms/pseries/papr_scm.c |  3 +++
 11 files changed, 38 insertions(+), 21 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJFGtCPCthwEv2Y/bUevqPMjhpYAFAmKiClMACgkQUevqPMjh
pYBl2w//cMfBNA1wR3b+r9+Ro9SlFMzfCtk0ue+A44QLo0Va71H9eZLmZ7qM6LK4
B37Am/bNZPnI0DM1pjTXKq0aEt7KRC9VyEiS9Gl4w0mf5bRjZy8Q8A+YA/CDoKrr
Ctd1iAZzk1mAbegdSeS66DlmGVGvDwzLK8jkJDPjOhaaXZMLZLRx+j4USeLuTCMS
Ub7LXpLcewa7E7xOXshoFIFd6wCSEpsiayCEAlCd4yICKeDfNdWc/9GBd3e6z+1e
7cSr7E59TY1cJ5WZ00p1UPigImNroYBEPmZj+F3vSt/MQwb/VXZYQuFojytk126z
sl69pzyghp4oCdvNvVVxHTHjDYZhnoPEKSoPpgD+CegrrdgKBeXweGE8T8JHKr4i
1FSFrX+zwXoTRRpwyDVEtDu1ld/AMHMQO8NiFFDSuYDdgrgYCyqk1Rg3Yb6aYpLQ
+b8uwX9b1lUZyrJz/Whf4PpTW0TmU9eyNPyFScpyojX1HMcu+VDBtowuaS1FkzIb
2ft6XsQUV0f4EIrJTsgWWyIw32kE9TiCPKwOX3wMQfdx5j6YuQJ7N2ALZVoQnQbu
aUvpGu6Fv/tasSaboThHWpAsRZLMGjFD94WwvX1Kn0NtvWpoeocA6barup0Nosey
3avApSIyPG5Q9RA3m1SjM0dLJdpyUmt2hDuvuFitRmeqePOoVxc=
=s319
-----END PGP SIGNATURE-----
