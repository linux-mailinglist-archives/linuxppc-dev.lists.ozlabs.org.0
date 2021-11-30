Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3314636B4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 15:31:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3PmF1jlqz302D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 01:31:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3Plp3JkKz301K
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 01:31:01 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J3Plk6XJQz9sSj;
 Tue, 30 Nov 2021 15:30:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vU463tmi0809; Tue, 30 Nov 2021 15:30:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J3Plk5km0z9sSh;
 Tue, 30 Nov 2021 15:30:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B40778B779;
 Tue, 30 Nov 2021 15:30:58 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id aCNCFI98Zzae; Tue, 30 Nov 2021 15:30:58 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.232.93])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F76D8B763;
 Tue, 30 Nov 2021 15:30:58 +0100 (CET)
Received: from PO20335.IDSI0.si.c-s.fr (localhost [127.0.0.1])
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.16.1) with ESMTPS id 1AUEUix0256050
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 15:30:44 +0100
Received: (from chleroy@localhost)
 by PO20335.IDSI0.si.c-s.fr (8.17.1/8.17.1/Submit) id 1AUEUgdI256048;
 Tue, 30 Nov 2021 15:30:42 +0100
X-Authentication-Warning: PO20335.IDSI0.si.c-s.fr: chleroy set sender to
 christophe.leroy@csgroup.eu using -f
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v2] powerpc/powermac: Add missing lockdep_register_key()
Date: Tue, 30 Nov 2021 15:30:42 +0100
Message-Id: <34b423d68d170676fc3367594d17d1ca5c3844a4.1638282630.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1638282641; l=2966; s=20211009;
 h=from:subject:message-id; bh=jMUA6/CdNEAwxuuseeJkPI/0xYNf89rYf+05Sg3f9cM=;
 b=RdVnPmEhY+dz+Fq1Kvdj0A+gXpK2+pfhR3eqjMo73J6P90G23cLnmJLv97RbMWmJcVhm3j4kBYHa
 4hJS/m1/BAtnMFTiZawt9bB/EYC54R7WbYVFrs0UezUzWywcLcMY
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KeyWest i2c @0xf8001003 irq 42 /uni-n@f8000000/i2c@f8001000
BUG: key c2d00cbc has not been registered!
------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(1)
WARNING: CPU: 0 PID: 1 at kernel/locking/lockdep.c:4801 lockdep_init_map_type+0x4c0/0xb4c
Modules linked in:
CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.15.5-gentoo-PowerMacG4 #9
NIP:  c01a9428 LR: c01a9428 CTR: 00000000
REGS: e1033cf0 TRAP: 0700   Not tainted  (5.15.5-gentoo-PowerMacG4)
MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 24002002  XER: 00000000

GPR00: c01a9428 e1033db0 c2d1cf20 00000016 00000004 00000001 c01c0630 e1033a73
GPR08: 00000000 00000000 00000000 e1033db0 24002004 00000000 f8729377 00000003
GPR16: c1829a9c 00000000 18305357 c1416fc0 c1416f80 c006ac60 c2d00ca8 c1416f00
GPR24: 00000000 c21586f0 c2160000 00000000 c2d00cbc c2170000 c216e1a0 c2160000
NIP [c01a9428] lockdep_init_map_type+0x4c0/0xb4c
LR [c01a9428] lockdep_init_map_type+0x4c0/0xb4c
Call Trace:
[e1033db0] [c01a9428] lockdep_init_map_type+0x4c0/0xb4c (unreliable)
[e1033df0] [c1c177b8] kw_i2c_add+0x334/0x424
[e1033e20] [c1c18294] pmac_i2c_init+0x9ec/0xa9c
[e1033e80] [c1c1a790] smp_core99_probe+0xbc/0x35c
[e1033eb0] [c1c03cb0] kernel_init_freeable+0x190/0x5a4
[e1033f10] [c000946c] kernel_init+0x28/0x154
[e1033f30] [c0035148] ret_from_kernel_thread+0x14/0x1c

Add missing lockdep_register_key()

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Link: https://bugzilla.kernel.org/show_bug.cgi?id=200055
Fixes: 9e607f72748d ("i2c_powermac: shut up lockdep warning")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
v2: Added lockdep_register_key() at two other places.
---
 arch/powerpc/platforms/powermac/low_i2c.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index f77a59b5c2e1..df89d916236d 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -582,6 +582,7 @@ static void __init kw_i2c_add(struct pmac_i2c_host_kw *host,
 	bus->close = kw_i2c_close;
 	bus->xfer = kw_i2c_xfer;
 	mutex_init(&bus->mutex);
+	lockdep_register_key(&bus->lock_key);
 	lockdep_set_class(&bus->mutex, &bus->lock_key);
 	if (controller == busnode)
 		bus->flags = pmac_i2c_multibus;
@@ -810,6 +811,7 @@ static void __init pmu_i2c_probe(void)
 		bus->hostdata = bus + 1;
 		bus->xfer = pmu_i2c_xfer;
 		mutex_init(&bus->mutex);
+		lockdep_register_key(&bus->lock_key);
 		lockdep_set_class(&bus->mutex, &bus->lock_key);
 		bus->flags = pmac_i2c_multibus;
 		list_add(&bus->link, &pmac_i2c_busses);
@@ -933,6 +935,7 @@ static void __init smu_i2c_probe(void)
 		bus->hostdata = bus + 1;
 		bus->xfer = smu_i2c_xfer;
 		mutex_init(&bus->mutex);
+		lockdep_register_key(&bus->lock_key);
 		lockdep_set_class(&bus->mutex, &bus->lock_key);
 		bus->flags = 0;
 		list_add(&bus->link, &pmac_i2c_busses);
-- 
2.33.1

