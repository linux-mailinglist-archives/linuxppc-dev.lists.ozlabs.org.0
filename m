Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D548CEBF22
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 09:19:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 474FTy5GYSzF6cc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Nov 2019 19:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=socionext.com (client-ip=210.131.2.79;
 helo=conuserg-12.nifty.com; envelope-from=yamada.masahiro@socionext.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.b="ULfIUbNv"; 
 dkim-atps=neutral
Received: from conuserg-12.nifty.com (conuserg-12.nifty.com [210.131.2.79])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 474FLs0Tm2zF6Nr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Nov 2019 19:13:24 +1100 (AEDT)
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp
 [153.142.97.92]) (authenticated)
 by conuserg-12.nifty.com with ESMTP id xA18BsBN023869;
 Fri, 1 Nov 2019 17:11:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-12.nifty.com xA18BsBN023869
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1572595915;
 bh=s5TW0F5kiM6Ii1qhgS3EYy+jvOIj8HD4h2NhZklMb0E=;
 h=From:To:Cc:Subject:Date:From;
 b=ULfIUbNvYDv8iOxNWNrQODXFHJ4+Xh0h93HMEG2YAkA9aQIpqyPE+lSmIfcmFP1gV
 LQcduXM9YsFhX3YMdpvz5RNrPHvsT9GB+qC+DuB7saSq7w2Nkzqy5Yqfb6liAIpNdd
 Q+taUATi98kBcFlhNMQnMGl2oN3kv//phjwjNZqdGTZlh3s/sUOa4tdRyQm6ecdIli
 b7ObC94Ixlnk3jvUbbQ4Cqht33jsI4gO7zg7PjCM4pzZ2IJLBQTv4nkiGyeu7kKxmT
 0MQE8G9t5XcoMxfxIwHGHtmDov2eOBM2HSb1qtRe/HGlfcLXv87vRuF288Y1eMgS7J
 8DBgfkRs9abIw==
X-Nifty-SrcIP: [153.142.97.92]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>
Subject: [PATCH v2 0/3] libfdt: prepare for (U)INT32_MAX addition
Date: Fri,  1 Nov 2019 17:11:45 +0900
Message-Id: <20191101081148.23274-1-yamada.masahiro@socionext.com>
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


Changes in v2:
 - Fix ppc libfdt_env.h

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

