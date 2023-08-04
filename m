Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E2B770193
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 15:31:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHRSP11BZz3cVN
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 23:31:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHRRp2hbtz30Jy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Aug 2023 23:30:43 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4RHRRh3ljyz9tG3;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zK77aMXGU9lj; Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4RHRRh2ywKz9tG1;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5F86E8B778;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id CmQq5yIrOg0V; Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.144])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1623F8B763;
	Fri,  4 Aug 2023 15:30:40 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 374DUWjS693287
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 4 Aug 2023 15:30:32 +0200
Received: (from chleroy@localhost)
	by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 374DURcu693276;
	Fri, 4 Aug 2023 15:30:27 +0200
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
        Pantelis Antoniou <pantelis.antoniou@gmail.com>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, robh@kernel.org
Subject: [PATCH net-next v2 00/10] net: fs_enet: Driver cleanup
Date: Fri,  4 Aug 2023 15:30:10 +0200
Message-ID: <cover.1691155346.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691155809; l=1935; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ERiVOYi/hcC3N9RhqhqL5vBOu5ySuRFBAgWoxBGT7XA=; b=qwBZpnRniiyPqhAr7qozkF6azp5RYmtMfCw1aItBfkeTlPH+znV55YtB54Qqd7/NG7FJHNG19 rdMFKByDTH9AZR+2mzRaCIZx/OQ8XdH/S7+cfk5TrfjVWScTwADopiC
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Over the years, platform and driver initialisation have evolved into
more generic ways, and driver or platform specific stuff has gone
away, leaving stale objects behind.

This series aims at cleaning all that up for fs_enet ethernet driver.

Changes in v2:
- Remove a trailing whitespace in the old struct moved in patch 7.
- Include powerpc people and list that I forgot when sending v1
(and Rob as expected by Patchwork for patch 6, not sure why)

Christophe Leroy (10):
  net: fs_enet: Remove set but not used variable
  net: fs_enet: Fix address space and base types mismatches
  net: fs_enet: Remove fs_get_id()
  net: fs_enet: Remove unused fields in fs_platform_info struct
  net: fs_enet: Remove has_phy field in fs_platform_info struct
  net: fs_enet: Remove stale prototypes from fsl_soc.c
  net: fs_enet: Move struct fs_platform_info into fs_enet.h
  net: fs_enet: Don't include fs_enet_pd.h when not needed
  net: fs_enet: Remove linux/fs_enet_pd.h
  net: fs_enet: Use cpm_muram_xxx() functions instead of cpm_dpxxx()
    macros

 MAINTAINERS                                   |   1 -
 arch/powerpc/platforms/8xx/adder875.c         |   1 -
 arch/powerpc/platforms/8xx/mpc885ads_setup.c  |   1 -
 arch/powerpc/platforms/8xx/tqm8xx_setup.c     |   1 -
 arch/powerpc/sysdev/fsl_soc.c                 |   3 -
 .../ethernet/freescale/fs_enet/fs_enet-main.c |   2 -
 .../net/ethernet/freescale/fs_enet/fs_enet.h  |  19 +-
 .../net/ethernet/freescale/fs_enet/mac-fcc.c  |   4 +-
 .../net/ethernet/freescale/fs_enet/mac-fec.c  |  14 --
 .../net/ethernet/freescale/fs_enet/mac-scc.c  |   8 +-
 .../ethernet/freescale/fs_enet/mii-bitbang.c  |   4 +-
 .../net/ethernet/freescale/fs_enet/mii-fec.c  |   1 +
 include/linux/fs_enet_pd.h                    | 165 ------------------
 13 files changed, 27 insertions(+), 197 deletions(-)
 delete mode 100644 include/linux/fs_enet_pd.h

-- 
2.41.0

