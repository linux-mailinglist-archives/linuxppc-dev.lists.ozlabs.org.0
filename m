Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5377D522D66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 09:31:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KymmM11N3z2xnN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 May 2022 17:30:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=ITr1zbzN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kymjn2fRMz3byZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 May 2022 17:28:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=ITr1zbzN; dkim-atps=neutral
Received: by gandalf.ozlabs.org (Postfix)
 id 4Kymjn0DT7z4xPw; Wed, 11 May 2022 17:28:45 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
 id 4Kymjn07HBz4xR7; Wed, 11 May 2022 17:28:45 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
 s=201707; t=1652254125;
 bh=eWiuyts+pYf0TO/X7GIhcScTIXY/b7n3uI6V/LGlqw4=;
 h=Date:From:To:Subject:From;
 b=ITr1zbzNA+nt7AlZQHsjT6S52z75uLtn483B75/ShQB59K3C2xUn1X9QtmMwK641D
 dZj27y6eUc0f1QT+RmCLkkAZdte/g5nDJVyFJL6td/a6SKo7ZbuY+YoVLDUxEPXWFR
 czQbB/kUPINjHUV7a43RCJzf6Yrk6jcv4etvLSAbcO0EWxd3ysXkXDCHBCao+USb0d
 OQ3C7itYlFhJ50bs0IweSlcHZpX/nAlNNQEJxFdsaNFai73EnoL9+0fhWdSGAZEUZf
 Lh/Q11Uq7nLOsRiH3DXUK0KMKoFisCu9CBuLoPvCuqz1PshdEgSFxnIiJy5NeVVyj0
 dlR+stnP6kOBw==
Date: Wed, 11 May 2022 17:25:34 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH 0/3] KASAN support for 64-bit Book 3S powerpc
Message-ID: <Yntk7oERGce44+Sd@cleo>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

This patch series implements KASAN on 64-bit POWER with radix MMU,
such as POWER9 or POWER10.  Daniel Axtens posted previous versions of
these patches, but is no longer working on KASAN, and I have been
asked to get them ready for inclusion.

Because of various technical difficulties, mostly around the need to
allow for code that runs in real mode, we only support "outline" mode
(as opposed to "inline" mode), where the compiler adds a call to
a checking procedure before every store to memory.

The main patch is still marked [RFC] because of known deficiencies,
specifically that the kernel will crash on boot on a HPT system, and
that out-of-bounds accesses to module global data are not caught
(which leads to one of the KASAN tests failing).

Comments welcome.  I may not have addressed all the comments about
previous versions of these patches; if so, then please just repeat
your comments.

Paul.

 Documentation/dev-tools/kasan.rst                  |   7 +-
 Documentation/powerpc/kasan.txt                    |  58 ++++++++++++
 arch/powerpc/Kconfig                               |   5 +-
 arch/powerpc/Kconfig.debug                         |   3 +-
 arch/powerpc/include/asm/book3s/64/hash.h          |   4 +
 arch/powerpc/include/asm/book3s/64/pgtable.h       |   3 +
 arch/powerpc/include/asm/book3s/64/radix.h         |  13 ++-
 arch/powerpc/include/asm/interrupt.h               |  52 ++++++++---
 arch/powerpc/include/asm/kasan.h                   |  22 +++++
 arch/powerpc/include/asm/ptrace.h                  |   6 --
 arch/powerpc/kernel/Makefile                       |  11 +++
 arch/powerpc/kernel/process.c                      |  16 ++--
 arch/powerpc/kernel/smp.c                          |  22 ++---
 arch/powerpc/kernel/traps.c                        |   6 +-
 arch/powerpc/kexec/Makefile                        |   2 +
 arch/powerpc/kvm/Makefile                          |   5 +
 arch/powerpc/lib/Makefile                          |   3 +
 arch/powerpc/mm/book3s64/Makefile                  |   9 ++
 arch/powerpc/mm/kasan/Makefile                     |   3 +-
 .../mm/kasan/{kasan_init_32.c => init_32.c}        |   0
 arch/powerpc/mm/kasan/init_book3s_64.c             | 103 +++++++++++++++++++++
 arch/powerpc/mm/ptdump/ptdump.c                    |   3 +-
 arch/powerpc/platforms/Kconfig.cputype             |   1 +
 arch/powerpc/platforms/powernv/Makefile            |   8 ++
 arch/powerpc/platforms/powernv/smp.c               |   2 +-
 arch/powerpc/platforms/pseries/Makefile            |   6 ++
 arch/powerpc/sysdev/xics/xics-common.c             |   4 +-
 arch/powerpc/sysdev/xive/common.c                  |   4 +-
 28 files changed, 330 insertions(+), 51 deletions(-)
