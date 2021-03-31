Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F63D3502B1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 16:50:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9TkT4jbBz3dq4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 01:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9Tk65kQmz2xg5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 01:49:49 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F9Tk10S5Sz9tyTX;
 Wed, 31 Mar 2021 16:49:45 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KpGHWw4eXnlN; Wed, 31 Mar 2021 16:49:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F9Tk05Jtjz9tyTT;
 Wed, 31 Mar 2021 16:49:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C97D28B829;
 Wed, 31 Mar 2021 16:49:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6yodf-RsKUjk; Wed, 31 Mar 2021 16:49:45 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86D828B828;
 Wed, 31 Mar 2021 16:49:45 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4A9A667647; Wed, 31 Mar 2021 14:49:45 +0000 (UTC)
Message-Id: <cover.1617202094.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v1 0/4] powerpc/vdso: Add support for time namespaces
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 31 Mar 2021 14:49:45 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series adds support for time namespaces on powerpc.

All timens selftests are successfull.

Christophe Leroy (3):
  lib/vdso: Mark do_hres_timens() and do_coarse_timens()
    __always_inline()
  lib/vdso: Add vdso_data pointer as input to
    __arch_get_timens_vdso_data()
  powerpc/vdso: Add support for time namespaces

Dmitry Safonov (1):
  powerpc/vdso: Separate vvar vma from vdso

 .../include/asm/vdso/compat_gettimeofday.h    |   3 +-
 arch/arm64/include/asm/vdso/gettimeofday.h    |   2 +-
 arch/powerpc/Kconfig                          |   3 +-
 arch/powerpc/include/asm/mmu_context.h        |   2 +-
 arch/powerpc/include/asm/vdso/gettimeofday.h  |  10 ++
 arch/powerpc/include/asm/vdso_datapage.h      |   2 -
 arch/powerpc/kernel/vdso.c                    | 138 ++++++++++++++++--
 arch/powerpc/kernel/vdso32/vdso32.lds.S       |   2 +-
 arch/powerpc/kernel/vdso64/vdso64.lds.S       |   2 +-
 arch/s390/include/asm/vdso/gettimeofday.h     |   3 +-
 arch/x86/include/asm/vdso/gettimeofday.h      |   3 +-
 lib/vdso/gettimeofday.c                       |  31 ++--
 12 files changed, 162 insertions(+), 39 deletions(-)

-- 
2.25.0

