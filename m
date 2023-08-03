Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0B776EB57
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 15:58:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RGr6k3B2Kz3cNl
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Aug 2023 23:58:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RGr4w3ykvz3cKh
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Aug 2023 23:57:20 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RGr4j2Llbz9t3X;
	Thu,  3 Aug 2023 15:57:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id beVGL-Nghc2H; Thu,  3 Aug 2023 15:57:09 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RGr4d4ktdz9t3r;
	Thu,  3 Aug 2023 15:57:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DFD58B773;
	Thu,  3 Aug 2023 15:57:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id lUIReUQR1OXM; Thu,  3 Aug 2023 15:57:05 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D52448B763;
	Thu,  3 Aug 2023 15:57:03 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 373Duvd4494154
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 3 Aug 2023 15:56:57 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 373DuupZ494121;
	Thu, 3 Aug 2023 15:56:56 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, Timur Tabi <timur@kernel.org>
Subject: [PATCH v1 00/12] serial: cpm_uart: Cleanup and refactoring
Date: Thu,  3 Aug 2023 15:56:41 +0200
Message-ID: <cover.1691068700.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691071000; l=2546; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=NoHIes4UmbMh0Oj+iKdKyDPU6aye+Gd+j7FfhzwC+rk=; b=FtnkdgyOm6dJ9NlFSzUc3f1zMzVhr+5VxwoZ/EnqjmBY6ncNnyG+0RepY+yLb9QQEuJ1mHBBS tEe2dXaVxGLBUd4lNrfdfDUklUD/x/QFbRA1Pq0TyiE7UNeN8MjMuZO
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series is a dust removal and cleanup of cpm_uart serial driver.

After cleaning up things we see that CPM1 and CPM2 have so much in
common that it is not worth keeping separate code.

Once refactoring is done, there is only one .c and one .h in cpm_uart/
subdirectory so its worth getting rid of cpm_uart/ subdir.

The last part leads to the complete removal of include/linux/fs_uart_pd.h

Christophe Leroy (12):
  serial: cpm_uart: Avoid suspicious locking
  serial: cpm_uart: Remove stale prototypes and table and macros
  serial: cpm_uart: Stop using fs_uart_id enum
  serial: cpm_uart: Use get_baudrate() instead of uart_baudrate()
  serial: cpm_uart: Deduplicate cpm_set_{brg/smc_fcr/scc_fcr}()
  serial: cpm_uart: Deduplicate cpm_line_cr_cmd()
  serial: cpm_uart: Refactor cpm_uart_allocbuf()/cpm_uart_freebuf()
  serial: cpm_uart: Refactor cpm_uart_[un]map_pram()
  serial: cpm_uart: Remove cpm_uart/ subdirectory
  serial: cpm_uart: Remove stale prototype in powerpc/fsl_soc.c
  serial: cpm_uart: Don't include fs_uart_pd.h when not needed
  serial: cpm_uart: Remove linux/fs_uart_pd.h

 arch/powerpc/include/asm/fs_pd.h              |  10 --
 arch/powerpc/platforms/8xx/mpc885ads_setup.c  |   1 -
 arch/powerpc/platforms/8xx/tqm8xx_setup.c     |   1 -
 arch/powerpc/sysdev/fsl_soc.c                 |   2 -
 drivers/tty/serial/Makefile                   |   2 +-
 .../{cpm_uart/cpm_uart_core.c => cpm_uart.c}  | 157 ++++++++++++++++--
 drivers/tty/serial/{cpm_uart => }/cpm_uart.h  |  38 +----
 drivers/tty/serial/cpm_uart/Makefile          |  12 --
 drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c   | 122 --------------
 drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h   |  33 ----
 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c   | 156 -----------------
 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.h   |  33 ----
 drivers/tty/serial/ucc_uart.c                 |   1 -
 include/linux/fs_uart_pd.h                    |  71 --------
 14 files changed, 145 insertions(+), 494 deletions(-)
 rename drivers/tty/serial/{cpm_uart/cpm_uart_core.c => cpm_uart.c} (90%)
 rename drivers/tty/serial/{cpm_uart => }/cpm_uart.h (64%)
 delete mode 100644 drivers/tty/serial/cpm_uart/Makefile
 delete mode 100644 drivers/tty/serial/cpm_uart/cpm_uart_cpm1.c
 delete mode 100644 drivers/tty/serial/cpm_uart/cpm_uart_cpm1.h
 delete mode 100644 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.c
 delete mode 100644 drivers/tty/serial/cpm_uart/cpm_uart_cpm2.h
 delete mode 100644 include/linux/fs_uart_pd.h

-- 
2.41.0

