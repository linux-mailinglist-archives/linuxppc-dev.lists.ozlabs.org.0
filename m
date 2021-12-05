Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F530468C89
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 19:10:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J6ZN9102fz2yHX
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Dec 2021 05:10:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=srs.iliad.fr (client-ip=212.27.33.1; helo=ns.iliad.fr;
 envelope-from=srs0=os5f8w=qw=freebox.fr=mbizon@srs.iliad.fr;
 receiver=<UNKNOWN>)
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J6ZMl6LmVz2xSH
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Dec 2021 05:09:36 +1100 (AEDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id 5DEE3200F0
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Dec 2021 19:09:32 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ns.iliad.fr (Postfix) with ESMTPS id 5099C200E3
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  5 Dec 2021 19:09:32 +0100 (CET)
Date: Sun, 5 Dec 2021 19:09:31 +0100
From: Maxime Bizon <mbizon@freebox.fr>
To: linuxppc-dev@lists.ozlabs.org
Subject: fbx_5.15 WARN_ON() at boot with CONFIG_DEBUG_VM
Message-ID: <20211205180931.GB29658@sakura>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Sun Dec  5 19:09:32 2021 +0100 (CET)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Hello,

With CONFIG_DEBUG_VM=y, early_iounmap() triggers this:

	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));

[    0.292811] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/pgtable.c:194 set_pte_at+0x8c/0x21c
[    0.301053] CPU: 0 PID: 1 Comm: swapper Tainted: G        W         5.15.0+ #402
[    0.308473] NIP:  8001d96c LR: 8001d960 CTR: 00000000
[    0.313520] REGS: 810fbc10 TRAP: 0700   Tainted: G        W          (5.15.0+)
[    0.320749] MSR:  00029032 <EE,ME,IR,DR,RI>  CR: 48008804  XER: 00000000
[    0.327705] 
[    0.327705] GPR00: 8001d960 810fbcc0 810c8020 80ce4004 8001d8e0 80ce4004 00000000 810fbcd0 
[    0.327705] GPR08: 00000007 00000001 00000000 80950ed4 28000804 00000000 8000673c 00000000 
[    0.327705] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
[    0.327705] GPR24: 80d01ef8 80b8dca0 00000000 80d01000 ef801000 00000000 f021f79a 80ce4004 
[    0.363822] NIP [8001d96c] set_pte_at+0x8c/0x21c
[    0.368462] LR [8001d960] set_pte_at+0x80/0x21c
[    0.373009] Call Trace:
[    0.375443] [810fbcc0] [8001d960] set_pte_at+0x80/0x21c (unreliable)
[    0.381891] [810fbd30] [8001e8cc] map_kernel_page+0x120/0x1a4
[    0.387707] [810fbda0] [80179a18] __set_fixmap+0x38/0x4c
[    0.393096] [810fbdb0] [809a772c] early_iounmap+0x184/0x218
[    0.398733] [810fbdf0] [80995db0] ioremap_legacy_serial_console+0x108/0x150
[    0.405803] [810fbe20] [8099144c] do_one_initcall+0xe8/0x228
[    0.411541] [810fbed0] [809916ec] kernel_init_freeable+0xdc/0x378
[    0.417718] [810fbf20] [80006764] kernel_init+0x28/0x118
[    0.423107] [810fbf40] [80016148] ret_from_kernel_thread+0x14/0x1c
[    0.429380] Instruction dump:
[    0.432349] 913e0004 7cbf2b78 915e0000 38610030 90c10030 4815a605 7fe3fb78 83a10030 
[    0.440363] 4815a5f9 813f0000 71290001 41820010 <0fe00000> 9361005c 93810060 93810060 
[    0.448553] ---[ end trace 523b05d3a0288818 ]---

-- 
Maxime
