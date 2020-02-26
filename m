Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4E316FE94
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 13:02:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SDv82QQMzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 23:02:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=PN+tIYgh; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SDjH6PJDzDqbw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 22:53:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48SDj96Prnz9txV7;
 Wed, 26 Feb 2020 12:53:49 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=PN+tIYgh; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Dn2Kw7Dwbv3M; Wed, 26 Feb 2020 12:53:49 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48SDj95LDxz9txV6;
 Wed, 26 Feb 2020 12:53:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582718029; bh=2s3YW0KML+/xUiP0hXm8pjV+lTatUYv8hk+kjqlee7c=;
 h=From:Subject:To:Cc:Date:From;
 b=PN+tIYgh2EfrPUsyBeEK92x6rU91LrsbrJSJDduw11YlAFrrwnk3mZFWwHtAsj8PL
 +vs1iYPR47BnnfuZHXmKzGOf0Sj/OpvlW+/HuEMaTJclqpOFG+LJeeQmGmlP/+cESQ
 CfJstVi+jTqWBmAQuVh5OU/n2aUoosMBXtEGxdZk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E0F398B846;
 Wed, 26 Feb 2020 12:53:50 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SMJGUkULozTv; Wed, 26 Feb 2020 12:53:50 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A1E778B776;
 Wed, 26 Feb 2020 12:53:50 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 708A265400; Wed, 26 Feb 2020 11:53:50 +0000 (UTC)
Message-Id: <cover.1582717645.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v3 00/13] Reduce ifdef mess in ptrace
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 mikey@neuling.org
Date: Wed, 26 Feb 2020 11:53:50 +0000 (UTC)
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

The purpose of this series is to reduce the amount of #ifdefs
in ptrace.c

Link: https://github.com/linuxppc/issues/issues/128

Tentatively build checked on kisskb allthough kisskb seems overloaded and failing to complete the tests.
See http://kisskb.ellerman.id.au/kisskb/branch/chleroy/head/ff12a199b21e80584096a72665023d212499accd/

v3:
- Droped part of #ifdef removals iaw mpe's comments
- Removed unneccesary includes

v2:
- Fixed several build failures. Now builts cleanly on kisskb, see http://kisskb.ellerman.id.au/kisskb/head/840e53cf913d6096dd60181a085f102c85d6e526/
- Droped last patch which is not related to ptrace and can be applies independently.

Christophe Leroy (13):
  powerpc: move ptrace into a subdirectory.
  powerpc/ptrace: remove unused header includes
  powerpc/ptrace: drop unnecessary #ifdefs CONFIG_PPC64
  powerpc/ptrace: drop PARAMETER_SAVE_AREA_OFFSET
  powerpc/ptrace: split out VSX related functions.
  powerpc/ptrace: split out ALTIVEC related functions.
  powerpc/ptrace: split out SPE related functions.
  powerpc/ptrace: split out TRANSACTIONAL_MEM related functions.
  powerpc/ptrace: move register viewing functions out of ptrace.c
  powerpc/ptrace: split out ADV_DEBUG_REGS related functions.
  powerpc/ptrace: create ptrace_get_debugreg()
  powerpc/ptrace: create ppc_gethwdinfo()
  powerpc/ptrace: move ptrace_triggered() into hw_breakpoint.c

 arch/powerpc/include/asm/ptrace.h           |    2 +
 arch/powerpc/kernel/Makefile                |    7 +-
 arch/powerpc/kernel/hw_breakpoint.c         |   16 +
 arch/powerpc/kernel/ptrace.c                | 3468 -------------------
 arch/powerpc/kernel/ptrace/Makefile         |   20 +
 arch/powerpc/kernel/ptrace/ptrace-adv.c     |  492 +++
 arch/powerpc/kernel/ptrace/ptrace-altivec.c |  126 +
 arch/powerpc/kernel/ptrace/ptrace-decl.h    |  184 +
 arch/powerpc/kernel/ptrace/ptrace-noadv.c   |  269 ++
 arch/powerpc/kernel/ptrace/ptrace-novsx.c   |   57 +
 arch/powerpc/kernel/ptrace/ptrace-spe.c     |   66 +
 arch/powerpc/kernel/ptrace/ptrace-tm.c      |  851 +++++
 arch/powerpc/kernel/ptrace/ptrace-view.c    |  904 +++++
 arch/powerpc/kernel/ptrace/ptrace-vsx.c     |  151 +
 arch/powerpc/kernel/ptrace/ptrace.c         |  480 +++
 arch/powerpc/kernel/{ => ptrace}/ptrace32.c |   11 -
 16 files changed, 3621 insertions(+), 3483 deletions(-)
 delete mode 100644 arch/powerpc/kernel/ptrace.c
 create mode 100644 arch/powerpc/kernel/ptrace/Makefile
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-adv.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-altivec.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-decl.h
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-noadv.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-novsx.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-spe.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-tm.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-view.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace-vsx.c
 create mode 100644 arch/powerpc/kernel/ptrace/ptrace.c
 rename arch/powerpc/kernel/{ => ptrace}/ptrace32.c (96%)

-- 
2.25.0

