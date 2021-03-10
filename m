Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BCC334575
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Mar 2021 18:47:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dwffc30nzz3dS5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Mar 2021 04:47:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dwfdy1syvz30Nx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Mar 2021 04:46:44 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Dwfdp2X5sz9tytH;
 Wed, 10 Mar 2021 18:46:38 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jCoCKD2VRWAy; Wed, 10 Mar 2021 18:46:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Dwfdp1YXPz9tytT;
 Wed, 10 Mar 2021 18:46:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D9BD78B77E;
 Wed, 10 Mar 2021 18:46:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id f2ZYYWhrh9KP; Wed, 10 Mar 2021 18:46:39 +0100 (CET)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A42BA8B790;
 Wed, 10 Mar 2021 18:46:39 +0100 (CET)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 606B067568; Wed, 10 Mar 2021 17:46:39 +0000 (UTC)
Message-Id: <cover.1615398265.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 00/15] powerpc: Cleanup of uaccess.h and adding asm goto
 for get_user()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 10 Mar 2021 17:46:39 +0000 (UTC)
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

This series cleans up uaccess.h and adds asm goto for get_user()

v2:
- Further clean ups
- asm goto for get_user()
- Move a few patches unrelated to put_user/get_user into another misc series.

Christophe Leroy (15):
  powerpc/uaccess: Remove __get_user_allowed() and unsafe_op_wrap()
  powerpc/uaccess: Define ___get_user_instr() for ppc32
  powerpc/align: Convert emulate_spe() to user_access_begin
  powerpc/uaccess: Remove __get/put_user_inatomic()
  powerpc/uaccess: Move get_user_instr helpers in asm/inst.h
  powerpc/align: Don't use __get_user_instr() on kernel addresses
  powerpc/uaccess: Call might_fault() inconditionaly
  powerpc/uaccess: Remove __unsafe_put_user_goto()
  powerpc/uaccess: Remove __chk_user_ptr() in __get/put_user
  powerpc/uaccess: Remove calls to __get_user_bad() and __put_user_bad()
  powerpc/uaccess: Split out __get_user_nocheck()
  powerpc/uaccess: Rename __get/put_user_check/nocheck
  powerpc/uaccess: Refactor get/put_user() and __get/put_user()
  powerpc/uaccess: Introduce __get_user_size_goto()
  powerpc/uaccess: Use asm goto for get_user when compiler supports it

 arch/powerpc/include/asm/inst.h               |  34 ++
 arch/powerpc/include/asm/uaccess.h            | 293 +++++++-----------
 arch/powerpc/kernel/align.c                   |  67 ++--
 .../kernel/hw_breakpoint_constraints.c        |   2 +-
 arch/powerpc/kernel/traps.c                   |   2 +-
 5 files changed, 187 insertions(+), 211 deletions(-)

-- 
2.25.0

