Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D794E10E69A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 09:00:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47RHbV0gVWzDqSP
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Dec 2019 19:00:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Wgcjl/mH"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47RHXG52syzDqSD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Dec 2019 18:57:31 +1100 (AEDT)
Received: from localhost (mailhub1-ext [192.168.12.233])
 by localhost (Postfix) with ESMTP id 47RHX23YRzz9txst;
 Mon,  2 Dec 2019 08:57:22 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Wgcjl/mH; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wbr5-YSii243; Mon,  2 Dec 2019 08:57:22 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 47RHX22Vzvz9txsp;
 Mon,  2 Dec 2019 08:57:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1575273442; bh=1VTYpgup2uhvlpjcEO1SnVZguqXhZuS72WEv23JiwbA=;
 h=From:Subject:To:Cc:Date:From;
 b=Wgcjl/mHdna71Mhb57OFol7QJB+1+UdR+t2AhxHSQvq8vBpA2A5Glo2m5qr2uPelT
 e4RAhzLNwNo79qCFf0Lu9wE0ahv+/Ce9uV9RKPEykg2l4kp08ZutxOjb4HoEXXl4D/
 KMLb+VR8TSiz7fZIl9MZ4Qh0Jepwyx/Dk+Uy3wsE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EDB7B8B79B;
 Mon,  2 Dec 2019 08:57:26 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id S44Rn1Yq615f; Mon,  2 Dec 2019 08:57:26 +0100 (CET)
Received: from po16098vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C7EEA8B79A;
 Mon,  2 Dec 2019 08:57:26 +0100 (CET)
Received: by po16098vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9857363600; Mon,  2 Dec 2019 07:57:26 +0000 (UTC)
Message-Id: <cover.1575273217.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v4 0/8] powerpc/vdso32 enhancement and optimisation
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  2 Dec 2019 07:57:26 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series:
- adds getcpu() on non SMP ppc32
- adds coarse clocks in clock_gettime
- fixes and adds all clocks in clock_getres
- optimises the retrieval of the datapage address
- optimises the cache functions

v4:
- Rebased on top of ceb307474506 ("Merge tag 'y2038-cleanups-5.5' of git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground")
- Fixed build failure with old binutils reported by mpe (patch 4)

v3:
- Dropped the 'fast syscall' hack for getcpu() on SMP.
- Moved get_datapage macro into asm/vdso_datapage.h so that it can be used on PPC64 as well.

v2:
- Used named labels in patch 2
- Added patch from Vincenzo to fix clock_getres() (patch 3)
- Removed unnecessary label in patch 4 as suggested by Segher
- Added patches 5 to 8

Christophe Leroy (8):
  powerpc/32: Add VDSO version of getcpu on non SMP
  powerpc/vdso32: Add support for CLOCK_{REALTIME/MONOTONIC}_COARSE
  powerpc: Fix vDSO clock_getres()
  powerpc/vdso32: inline __get_datapage()
  powerpc/vdso32: Don't read cache line size from the datapage on PPC32.
  powerpc/vdso32: use LOAD_REG_IMMEDIATE()
  powerpc/vdso32: implement clock_getres entirely
  powerpc/vdso32: miscellaneous optimisations

 arch/powerpc/include/asm/vdso_datapage.h  |  16 +++-
 arch/powerpc/kernel/asm-offsets.c         |   7 +-
 arch/powerpc/kernel/time.c                |   1 +
 arch/powerpc/kernel/vdso.c                |   5 --
 arch/powerpc/kernel/vdso32/Makefile       |   4 +-
 arch/powerpc/kernel/vdso32/cacheflush.S   |  32 ++++++--
 arch/powerpc/kernel/vdso32/datapage.S     |  31 +-------
 arch/powerpc/kernel/vdso32/getcpu.S       |  23 +++++-
 arch/powerpc/kernel/vdso32/gettimeofday.S | 124 +++++++++++++++++++++---------
 arch/powerpc/kernel/vdso32/vdso32.lds.S   |   2 +-
 arch/powerpc/kernel/vdso64/gettimeofday.S |   7 +-
 11 files changed, 164 insertions(+), 88 deletions(-)

-- 
2.13.3

