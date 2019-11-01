Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A83BEBDC8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 07:23:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474BwM4QyrzF67y
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 17:23:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=socionext.com (client-ip=210.131.2.76;
 helo=conuserg-09.nifty.com; envelope-from=yamada.masahiro@socionext.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="2LEyL1aA"; 
 dkim-atps=neutral
Received: from conuserg-09.nifty.com (conuserg-09.nifty.com [210.131.2.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474BlZ5lbszDqt0
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 17:16:10 +1100 (AEDT)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-09.nifty.com with ESMTP id xA16ELBc016348;
 Fri, 1 Nov 2019 15:14:22 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com xA16ELBc016348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1572588862;
 bh=pGYwt8aksICDvlfvWj0tCkyuHYQwW0lnnIiz1OylTcI=;
 h=From:To:Cc:Subject:Date:From;
 b=2LEyL1aAf04dKzfo3G9K86up2BmcPt/JstqCUtoJLk02MXaqrTW2WCd7ZztvVKMci
 6ppe5upzfBLZZiHGY1Dqe0D/K+HksAM7zA/EpQouymBiw10cn2BioTABxASWR60hqj
 HHMOi9eEjk5rFEvUxS2H6fFJ+nSD5tw/6A73Ct+7tpkrTXEw6P+l/qLzNsCXW9+a6W
 SN06S6NH39f52zTMVPcCrqrMNTijLq14u+I6NZ+cinTJeciVQV8nzBtxISTvaTKpU4
 A/3DTOPAyvWAC5IXMGxN88SERT9Fj1HDyF9cNHz+MUUnLGgHhpIqCkwmXDiYAVRhif
 FyeF756FCdaeg==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH 0/3] libfdt: prepare for (U)INT32_MAX addition
Date: Fri,  1 Nov 2019 15:14:08 +0900
Message-Id: <20191101061411.16988-1-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


As you may know, libfdt in the upstream DTC project
added referenced to (U)INT32_MAX.

The kernel code has three files to adjust:

include/linux/libfdt_env.h
arch/powerpc/boot/libfdt_env.h
arch/arm/boot/compressed/libfdt_env.h

Instead of fixing arch/arm/boot/compressed/libfdt_env.h,
it is pretty easy to refactor the ARM decompressor
to reuse <linux/lbifdt_env.h>
So, 2/3 simplifies the Makefile and deletes its own
libfdt_env.h

On the other hand, the PPC boot-wrapper is a can of worms.
I give up refactoring it.
Let's keep it closed, and just update arch/powerpc/boot/libfdt_env.h



Masahiro Yamada (3):
  libfdt: add SPDX-License-Identifier to libfdt wrappers
  ARM: decompressor: simplify libfdt builds
  libfdt: define INT32_MAX and UINT32_MAX in libfdt_env.h

 arch/arm/boot/compressed/.gitignore     |  9 -------
 arch/arm/boot/compressed/Makefile       | 33 +++++++------------------
 arch/arm/boot/compressed/atags_to_fdt.c |  1 +
 arch/arm/boot/compressed/fdt.c          |  2 ++
 arch/arm/boot/compressed/fdt_ro.c       |  2 ++
 arch/arm/boot/compressed/fdt_rw.c       |  2 ++
 arch/arm/boot/compressed/fdt_wip.c      |  2 ++
 arch/arm/boot/compressed/libfdt_env.h   | 22 -----------------
 arch/powerpc/boot/libfdt_env.h          |  2 ++
 include/linux/libfdt_env.h              |  3 +++
 lib/fdt.c                               |  1 +
 lib/fdt_empty_tree.c                    |  1 +
 lib/fdt_ro.c                            |  1 +
 lib/fdt_rw.c                            |  1 +
 lib/fdt_strerror.c                      |  1 +
 lib/fdt_sw.c                            |  1 +
 lib/fdt_wip.c                           |  1 +
 17 files changed, 30 insertions(+), 55 deletions(-)
 create mode 100644 arch/arm/boot/compressed/fdt.c
 create mode 100644 arch/arm/boot/compressed/fdt_ro.c
 create mode 100644 arch/arm/boot/compressed/fdt_rw.c
 create mode 100644 arch/arm/boot/compressed/fdt_wip.c
 delete mode 100644 arch/arm/boot/compressed/libfdt_env.h

-- 
2.17.1

