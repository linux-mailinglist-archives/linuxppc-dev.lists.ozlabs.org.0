Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA7BE45EB9F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 11:30:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0rcP54zgz3cTg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 21:30:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0rc063mgz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Nov 2021 21:30:22 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J0rbw0WYFz9sSK;
 Fri, 26 Nov 2021 11:30:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4OKSvaBjIrZ7; Fri, 26 Nov 2021 11:30:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J0rbq6HHBz9sSM;
 Fri, 26 Nov 2021 11:30:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C7E8B8B77D;
 Fri, 26 Nov 2021 11:30:15 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nAkmsh7gvHE0; Fri, 26 Nov 2021 11:30:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 847A28B763;
 Fri, 26 Nov 2021 11:30:15 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AQAU57D504683
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 26 Nov 2021 11:30:06 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AQAU3WF504682;
 Fri, 26 Nov 2021 11:30:03 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc/ptdump: Fix display a BAT's size unit
Date: Fri, 26 Nov 2021 11:30:03 +0100
Message-Id: <f16c30f5c9185a63335322cf1a8b22f189d335ef.1637922595.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1637922602; l=1821; s=20211009;
 h=from:subject:message-id; bh=X4Z/h5lCmSkaoSNNKudG03g/q0IKuhd3sChnOkiRvec=;
 b=umXbLRtps+H9lC6tI8eTrQqgPDTfHdeI3cAeUw7UZZMnxCO9O06orwtmnPqNCDPo752UT9Xsuxdw
 ybYNX0tPCvPeqLqQd31L031Km4rSmpwpnOvOmCBvselWlv4jOh7k
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519;
 pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We have wrong units on BAT's sizes (G instead of M, M instead of ...)

	---[ Instruction Block Address Translation ]---
	0: 0xc0000000-0xc03fffff 0x00000000         4G Kernel   x     m
	1: 0xc0400000-0xc05fffff 0x00400000         2G Kernel   x     m
	2: 0xc0600000-0xc06fffff 0x00600000         1G Kernel   x     m
	3: 0xc0700000-0xc077ffff 0x00700000       512M Kernel   x     m
	4: 0xc0780000-0xc079ffff 0x00780000       128M Kernel   x     m
	5: 0xc07a0000-0xc07bffff 0x007a0000       128M Kernel   x     m
	6:         -
	7:         -

This is because pt_dump_size() expects a size in Kbytes but
bat_show_603() gives the size in bytes.

To avoid risk of confusion, change pt_dump_size() to take bytes.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/mm/ptdump/ptdump.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index bf251191e78d..031956d0ee84 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -123,7 +123,7 @@ static struct ptdump_range ptdump_range[] __ro_after_init = {
 
 void pt_dump_size(struct seq_file *m, unsigned long size)
 {
-	static const char units[] = "KMGTPE";
+	static const char units[] = " KMGTPE";
 	const char *unit = units;
 
 	/* Work out what appropriate unit to use */
@@ -176,7 +176,7 @@ static void dump_addr(struct pg_state *st, unsigned long addr)
 
 	pt_dump_seq_printf(st->seq, REG "-" REG " ", st->start_address, addr - 1);
 	pt_dump_seq_printf(st->seq, " " REG " ", st->start_pa);
-	pt_dump_size(st->seq, (addr - st->start_address) >> 10);
+	pt_dump_size(st->seq, addr - st->start_address);
 }
 
 static void note_prot_wx(struct pg_state *st, unsigned long addr)
-- 
2.33.1

