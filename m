Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4695D3156C2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 20:31:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZtKm4kXczDsgv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 06:31:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZtJ11H5CzDsdK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 06:29:32 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZtHq1pzDz9v022;
 Tue,  9 Feb 2021 20:29:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BSGrLhm21DSi; Tue,  9 Feb 2021 20:29:27 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZtHq0tBCz9v021;
 Tue,  9 Feb 2021 20:29:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 10A358B7EA;
 Tue,  9 Feb 2021 20:29:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id SfL1QxCWtiXO; Tue,  9 Feb 2021 20:29:27 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D386D8B764;
 Tue,  9 Feb 2021 20:29:26 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 91BAC67382; Tue,  9 Feb 2021 19:29:26 +0000 (UTC)
Message-Id: <cover.1612898425.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v6 0/2] powerpc/32: Implement C syscall entry/exit (complement)
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, 
 npiggin@gmail.com, msuchanek@suse.de
Date: Tue,  9 Feb 2021 19:29:26 +0000 (UTC)
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

This series implements C syscall entry/exit for PPC32. It reuses
the work already done for PPC64.

This series is based on today's next-test (f538b53fd47a) where main patchs from v5 are merged in.

The first patch is important for performance.

v6:
- Forced scv param to 0 on syscall_exit_prepare(), and added is_not_scv bool.
- Reworked the last patch to avoid code duplication.

Christophe Leroy (2):
  powerpc/syscall: Do not check unsupported scv vector on PPC32
  powerpc/32: Handle bookE debugging in C in syscall entry/exit

 arch/powerpc/include/asm/interrupt.h | 12 +++++++
 arch/powerpc/include/asm/ptrace.h    |  5 +++
 arch/powerpc/include/asm/reg_booke.h |  3 ++
 arch/powerpc/kernel/entry_32.S       |  7 ----
 arch/powerpc/kernel/head_32.h        | 15 ---------
 arch/powerpc/kernel/head_booke.h     | 19 -----------
 arch/powerpc/kernel/interrupt.c      | 50 ++++++++++++++++++----------
 7 files changed, 52 insertions(+), 59 deletions(-)

-- 
2.25.0

