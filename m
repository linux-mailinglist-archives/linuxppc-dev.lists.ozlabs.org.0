Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 283B835F127
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 12:01:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKygB48Ycz30Mf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 20:01:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-Synaptics-onmicrosoft-com header.b=Ybs2Fhty;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synaptics.com (client-ip=40.107.223.54;
 helo=nam11-dm6-obe.outbound.protection.outlook.com;
 envelope-from=jisheng.zhang@synaptics.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Synaptics.onmicrosoft.com
 header.i=@Synaptics.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-Synaptics-onmicrosoft-com header.b=Ybs2Fhty; 
 dkim-atps=neutral
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKyfg2XHkz2yRS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 20:01:13 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=itOR5BQzQCd5wCExo3CMwerzqR8do8CLe3NCrScnV89n7e2z5I6j1YQWah5IascB64XkJRTeKhEUMSOoJzfzCCW1x68k58owGIRYRv6Vz0YBuupT31YCP13h1LIkgzDyvlgcNgtxUS3bn6Jl1BvIP1BRt/p1op+DCdCKSXqFfF7duxpfGn6ulsp8ue5Kx0hljhSusx/32HFMYiAKHM/eCPbha9+8RQAU8Ks+oU+EDKURo+a5dF/RsIVdB1F+zU4jjVCkiv2h4o2xPoUsG5pFGwAzMMQdbgzCGG0qPVBdtzRuq0IRQTusF+xhhEsdz3t9OBG+ZKCnJ6G7yCQxxVzKTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hvDUWvMagmminxIZOyXXdM8fx95M0chBySaBi10y1U=;
 b=c7jC6bdHSnvKJZ5RqOaPFZMeYmkja8K5FLl0v9++Q/byBHYWf3+R0++stALj3/mD4BWgzZR1G3zjItd/FLNlE2pIORgeknquWHBTaijkKlaDAorAG2cv82rDaC030CWpHl7I8P6cPOuUqsZFsXWyZNjJetjUhQp7ve07NoL2aEGJ2Cc9GJ6XX7FU1xopC0GoD9UfmkvmwJz1ccvcoCmrZDAr4FiFIJWvcts2pwzybg5FblJPDMKwE/8SLST37neWXPvS+0QgXkFywYjhRBIAV0yUHzrBqEOythFL/Ej6NVbLgOvo5uLFpzyRDk++xH9Kzeu64d7dZDUD14yE4XdKxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9hvDUWvMagmminxIZOyXXdM8fx95M0chBySaBi10y1U=;
 b=Ybs2FhtyotlfYbal4E4pkpDMJCLbZr8o7ngFHPNeiHSAIHtaGSgpZBADETou8GuLOx1WUm1PHx/SFhXof1Hlb7wYU5dgO0IijPD5a+RXww5kkc+rv+lY4UAcEueP3IFJLJHdV5DBIBZODJuyRQtM8hFmDjSExmmFwRwSFvbxwCA=
Authentication-Results: synopsys.com; dkim=none (message not signed)
 header.d=none; synopsys.com; dmarc=none action=none header.from=synaptics.com; 
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by SJ0PR03MB5758.namprd03.prod.outlook.com (2603:10b6:a03:2d0::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.20; Wed, 14 Apr
 2021 10:01:01 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 10:01:00 +0000
Date: Wed, 14 Apr 2021 18:00:45 +0800
From: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
To: Vineet Gupta <vgupta@synopsys.com>, Russell King
 <linux@armlinux.org.uk>, Yoshinori Sato <ysato@users.sourceforge.jp>, Brian
 Cain <bcain@codeaurora.org>, Nick Hu <nickhu@andestech.com>, Greentime Hu
 <green.hu@gmail.com>, Vincent Chen <deanbo422@gmail.com>, Ley Foon Tan
 <ley.foon.tan@intel.com>, Jonas Bonn <jonas@southpole.se>, Stefan
 Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne
 <shorne@gmail.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jeff Dike <jdike@addtoit.com>, Richard
 Weinberger <richard@nod.at>, Anton Ivanov
 <anton.ivanov@cambridgegreys.com>, Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Matt Turner
 <mattst88@gmail.com>, Michal Simek <monstr@monstr.eu>, "David S. Miller"
 <davem@davemloft.net>, Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2] init: consolidate trap_init()
Message-ID: <20210414180037.14602dab@xhacker.debian>
In-Reply-To: <20210414165808.458a3d11@xhacker.debian>
References: <20210414165808.458a3d11@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR03CA0102.namprd03.prod.outlook.com
 (2603:10b6:a03:333::17) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 SJ0PR03CA0102.namprd03.prod.outlook.com (2603:10b6:a03:333::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 10:00:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3a1bde23-9e92-41ca-d79a-08d8ff2c34fa
X-MS-TrafficTypeDiagnostic: SJ0PR03MB5758:
X-Microsoft-Antispam-PRVS: <SJ0PR03MB57580D6B8A4B8BFC5DADBEB6ED4E9@SJ0PR03MB5758.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Chu6EIXN05IUUFI9WpdzgdUM6qZ+Jplr0cj2Z29kKuHfn4haBFSfHeQx6AUDK2tp2Q6EBAHWmdLHodJROW/sCDcSAsJ5PEFm/ZXA50tMZqzRgEQYhEdUHbU/gf4jM0Z39gum+wGhCaGC/158nMIIYwj+Qi6ZV1n4RLDUFY6oRT/T2UJ06qVAAqlbQW74VVCwXcU7lB70Tqjf5NqWEi0Y4BoUyyBfPkeWeRIhPOuFJv8ug3zzD22V3QnKOHOmD3zJX+aj9+9By8zstLmyQfUa3B9VtK7T6hU/vyhKl3kB1yGJcxhHGWzm1DtotkkBoEhVpbjgMgoM59QtJhpJp5ZnR9WWbmO+y1OvUEGDm4nWofHB1fo/T3G1OQZKZTSVJMqSdB8PZCWcZGdReT6PsWgTTLWTgGBUpnE0rdKKYBguRTgSy92mUHRKAy40nA78LJTrY2QVABeOpDfTzU2pApSoVJEOwUVHXB4lopvHrtz0oPr632QT/SyzIXHVgkVkp45AzROT7sKUvGt4i5n5mpEBQqlLRNpsa/VkHTmILo3FIqLMbsEPavFOOB6DCdRkONe9WtNnZbCNGeBXTIsdVUnqdJ1jq00OdMy6pvHTkL4s5kC6k3cPbvAdNPW1QWQX47qklnNKRLftWZK45Yob8Gvv7FwLI3vMrBz4ae/DI99mKWqjix5hMTVE2o9kI7YV81B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(376002)(39850400004)(346002)(396003)(16526019)(186003)(1076003)(26005)(52116002)(2906002)(7406005)(66476007)(956004)(55016002)(86362001)(316002)(6506007)(9686003)(66946007)(38100700002)(83380400001)(66556008)(8936002)(6666004)(5660300002)(110136005)(38350700002)(921005)(7696005)(8676002)(478600001)(7416002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?fzApouNs4z8cJkTblmEW+XqzmheOhAKoKiJEbmDEP3Jh3MFu4a1Q+tmkDNbN?=
 =?us-ascii?Q?2SrEN2Re4EQMpjNIcjydaYa9Slk31okMLZTr8ZwppxtOzSKAGKpCA4NhwJZ4?=
 =?us-ascii?Q?nt/5ExY/txTyOzmOqzpJGN1f82N+S5SsmueRO/TFMYjfEy224PDvqzAyeF5k?=
 =?us-ascii?Q?v2SBEGAUv4siXEwFDmWQ3EeNfPwpL+wghr3l3/BHvYUiP6HVfKfmG+SxzpTw?=
 =?us-ascii?Q?GHtAobC9X2ZDy1GByPSGxULHD0d3/m0UNvAnvalGdsJVJteXmMPVvoCyVgv/?=
 =?us-ascii?Q?WMf8I5T41vrZFewwJuCH80ExQ5/0mVXmKlyggnRHlF3bo2pMF8OTsvNCbKwa?=
 =?us-ascii?Q?DeKXs8gUMBJOQjg1ZnzqRU334bqapIaYJbY+/KeYPRu1o3We1RLVAGeOdxLI?=
 =?us-ascii?Q?uUIVLetGuMgvRcy1EUgzPu2KBtNQtIj1CmdfdUsM3isK7C4U5ItyD8vh86nZ?=
 =?us-ascii?Q?bQRQhyqt475u/U4f3mR6vbVv2dPyDT3mxGXayC1LqWOKn2aFEgVTNjfKHw7e?=
 =?us-ascii?Q?X32KyAmtr5Wy9YEqynxgrHsbP7F1+gCzcxoB0oUt4XhcrBjnIoFBcdeC1fOd?=
 =?us-ascii?Q?wHcyFg2S8p0i0Vngbbf3ZpBR1DLEmtqkLsSIs00WvBOtvCpMwiLCeMLHeXii?=
 =?us-ascii?Q?L7QIB4agT/+1dfH41jwwWC7h9dXhJAWt4uV148QRD0bep6gQMEJZp/NvVOtl?=
 =?us-ascii?Q?86U7I7EZhaBuKvtFTYUgL8Qrztbpqbbf/iKIS4iLJKiXkAxUEQWwbG/kuMGu?=
 =?us-ascii?Q?b9csup4qFHxvE9PfQWewv2eG5OIiROfK0iBaJoskZMlrOMCODdyQvqgIjSIV?=
 =?us-ascii?Q?vBRhCrTlQNl/w6NGvk89TxJr8hLtJdKu9CY5a9B0Ys44zu+To+20i3f49DMk?=
 =?us-ascii?Q?2uHSLTeRbM6e4kxyMFVS/NcBtYmwK1+k0i/yYHNQ/PqSn6T+tfm45VTY9cZv?=
 =?us-ascii?Q?xMTn+9S40+CbycEwgeOdpADuWKJirIwq7pteJ4wiKfI5D+R6iQt3MZi3pRUA?=
 =?us-ascii?Q?Rub4o9XqKE+07NAiHoAywpPDF0ZzJ/+HgYnk7YuEgBBZ8MXaKMzQrnavaOxh?=
 =?us-ascii?Q?gjBRSKGM6g0V8PA4WX+fkiKw/LLcAqT4ccC9npKHccmh7yfRbpYzGzcyR0ax?=
 =?us-ascii?Q?nrqLtRUfJZOou7N09B8tUDVnFxhkVE+cCX6pxOPtD9HzXFK/Vbgf47S0uuJR?=
 =?us-ascii?Q?o3riGu4qsx6db8dieXiLbTqs+3DBH1ItE0feNDbGX/rwmPTOA1v3JJP0o1kD?=
 =?us-ascii?Q?N/Jy8XboWR+eqtESe3mR5fe7yyi+WERU9V9d6Mg/MakWL+fLmjdADhfb/Wr8?=
 =?us-ascii?Q?tWWDJQQbeYTno7xlGnIVtl5a?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1bde23-9e92-41ca-d79a-08d8ff2c34fa
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 10:01:00.8290 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DHpGWjssfLS/bjJ9P1ygEd62tbVtqx3XW1KowpbjwdSZPN4HhUXwjFnVNTAdT+hakbrF8o3SANvWG6WSC9ZM1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB5758
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
Cc: uclinux-h8-devel@lists.sourceforge.jp, linux-parisc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Anup Patel <anup@brainfault.org>,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Many architectures implement the trap_init() as NOP, since there is
no such default for trap_init(), this empty stub is duplicated among
these architectures. Provide a generic but weak NOP implementation
to drop the empty stubs of trap_init() in these architectures.

The alpha, microblaze and sparc32 have real trap_init() implementation
but the __init marker is missing, so add it to these three platforms.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
Since v1:
 - add __init marker to trap_init() for alpha, microblaze and sparc32
 - adjust the generic weak NOP trap_init() location to make it sits with
   other NOP implementations together

 arch/alpha/kernel/traps.c      |  2 +-
 arch/arc/kernel/traps.c        |  5 -----
 arch/arm/kernel/traps.c        |  5 -----
 arch/h8300/kernel/traps.c      | 13 -------------
 arch/hexagon/kernel/traps.c    |  4 ----
 arch/microblaze/kernel/traps.c |  2 +-
 arch/nds32/kernel/traps.c      |  5 -----
 arch/nios2/kernel/traps.c      |  5 -----
 arch/openrisc/kernel/traps.c   |  5 -----
 arch/parisc/kernel/traps.c     |  4 ----
 arch/powerpc/kernel/traps.c    |  5 -----
 arch/riscv/kernel/traps.c      |  5 -----
 arch/sparc/kernel/traps_32.c   |  2 +-
 arch/um/kernel/trap.c          |  4 ----
 init/main.c                    |  2 ++
 15 files changed, 5 insertions(+), 63 deletions(-)

diff --git a/arch/alpha/kernel/traps.c b/arch/alpha/kernel/traps.c
index 921d4b6e4d95..96b203199c6c 100644
--- a/arch/alpha/kernel/traps.c
+++ b/arch/alpha/kernel/traps.c
@@ -973,7 +973,7 @@ do_entUnaUser(void __user * va, unsigned long opcode,
 	return;
 }
 
-void
+void __init
 trap_init(void)
 {
 	/* Tell PAL-code what global pointer we want in the kernel.  */
diff --git a/arch/arc/kernel/traps.c b/arch/arc/kernel/traps.c
index 57235e5c0cea..6b83e3f2b41c 100644
--- a/arch/arc/kernel/traps.c
+++ b/arch/arc/kernel/traps.c
@@ -20,11 +20,6 @@
 #include <asm/unaligned.h>
 #include <asm/kprobes.h>
 
-void __init trap_init(void)
-{
-	return;
-}
-
 void die(const char *str, struct pt_regs *regs, unsigned long address)
 {
 	show_kernel_fault_diag(str, regs, address);
diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index 17d5a785df28..9baccef20392 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -780,11 +780,6 @@ void abort(void)
 	panic("Oops failed to kill thread");
 }
 
-void __init trap_init(void)
-{
-	return;
-}
-
 #ifdef CONFIG_KUSER_HELPERS
 static void __init kuser_init(void *vectors)
 {
diff --git a/arch/h8300/kernel/traps.c b/arch/h8300/kernel/traps.c
index 5d8b969cd8f3..c3a3ebf77fbb 100644
--- a/arch/h8300/kernel/traps.c
+++ b/arch/h8300/kernel/traps.c
@@ -30,19 +30,6 @@
 
 static DEFINE_SPINLOCK(die_lock);
 
-/*
- * this must be called very early as the kernel might
- * use some instruction that are emulated on the 060
- */
-
-void __init base_trap_init(void)
-{
-}
-
-void __init trap_init(void)
-{
-}
-
 asmlinkage void set_esp0(unsigned long ssp)
 {
 	current->thread.esp0 = ssp;
diff --git a/arch/hexagon/kernel/traps.c b/arch/hexagon/kernel/traps.c
index 904134b37232..edfc35dafeb1 100644
--- a/arch/hexagon/kernel/traps.c
+++ b/arch/hexagon/kernel/traps.c
@@ -28,10 +28,6 @@
 #define TRAP_SYSCALL	1
 #define TRAP_DEBUG	0xdb
 
-void __init trap_init(void)
-{
-}
-
 #ifdef CONFIG_GENERIC_BUG
 /* Maybe should resemble arch/sh/kernel/traps.c ?? */
 int is_valid_bugaddr(unsigned long addr)
diff --git a/arch/microblaze/kernel/traps.c b/arch/microblaze/kernel/traps.c
index 94b6fe93147d..7c15704fe56e 100644
--- a/arch/microblaze/kernel/traps.c
+++ b/arch/microblaze/kernel/traps.c
@@ -18,7 +18,7 @@
 #include <asm/exceptions.h>
 #include <asm/unwind.h>
 
-void trap_init(void)
+void __init trap_init(void)
 {
 	__enable_hw_exceptions();
 }
diff --git a/arch/nds32/kernel/traps.c b/arch/nds32/kernel/traps.c
index ee0d9ae192a5..f06421c645af 100644
--- a/arch/nds32/kernel/traps.c
+++ b/arch/nds32/kernel/traps.c
@@ -183,11 +183,6 @@ void __pgd_error(const char *file, int line, unsigned long val)
 }
 
 extern char *exception_vector, *exception_vector_end;
-void __init trap_init(void)
-{
-	return;
-}
-
 void __init early_trap_init(void)
 {
 	unsigned long ivb = 0;
diff --git a/arch/nios2/kernel/traps.c b/arch/nios2/kernel/traps.c
index b172da4eb1a9..596986a74a26 100644
--- a/arch/nios2/kernel/traps.c
+++ b/arch/nios2/kernel/traps.c
@@ -105,11 +105,6 @@ void show_stack(struct task_struct *task, unsigned long *stack,
 	printk("%s\n", loglvl);
 }
 
-void __init trap_init(void)
-{
-	/* Nothing to do here */
-}
-
 /* Breakpoint handler */
 asmlinkage void breakpoint_c(struct pt_regs *fp)
 {
diff --git a/arch/openrisc/kernel/traps.c b/arch/openrisc/kernel/traps.c
index 4d61333c2623..aa1e709405ac 100644
--- a/arch/openrisc/kernel/traps.c
+++ b/arch/openrisc/kernel/traps.c
@@ -231,11 +231,6 @@ void unhandled_exception(struct pt_regs *regs, int ea, int vector)
 	die("Oops", regs, 9);
 }
 
-void __init trap_init(void)
-{
-	/* Nothing needs to be done */
-}
-
 asmlinkage void do_trap(struct pt_regs *regs, unsigned long address)
 {
 	force_sig_fault(SIGTRAP, TRAP_BRKPT, (void __user *)regs->pc);
diff --git a/arch/parisc/kernel/traps.c b/arch/parisc/kernel/traps.c
index 8d8441d4562a..747c328fb886 100644
--- a/arch/parisc/kernel/traps.c
+++ b/arch/parisc/kernel/traps.c
@@ -859,7 +859,3 @@ void  __init early_trap_init(void)
 
 	initialize_ivt(&fault_vector_20);
 }
-
-void __init trap_init(void)
-{
-}
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index a44a30b0688c..e952bee89684 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2207,11 +2207,6 @@ DEFINE_INTERRUPT_HANDLER(kernel_bad_stack)
 	die("Bad kernel stack pointer", regs, SIGABRT);
 }
 
-void __init trap_init(void)
-{
-}
-
-
 #ifdef CONFIG_PPC_EMULATED_STATS
 
 #define WARN_EMULATED_SETUP(type)	.type = { .name = #type }
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 0879b5df11b9..b3f3d84de779 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -194,8 +194,3 @@ int is_valid_bugaddr(unsigned long pc)
 		return ((insn & __COMPRESSED_INSN_MASK) == __BUG_INSN_16);
 }
 #endif /* CONFIG_GENERIC_BUG */
-
-/* stvec & scratch is already set from head.S */
-void trap_init(void)
-{
-}
diff --git a/arch/sparc/kernel/traps_32.c b/arch/sparc/kernel/traps_32.c
index 247a0d9683b2..c4df20ec01e2 100644
--- a/arch/sparc/kernel/traps_32.c
+++ b/arch/sparc/kernel/traps_32.c
@@ -365,7 +365,7 @@ EXPORT_SYMBOL(do_BUG);
  * up here so that timer interrupts work during initialization.
  */
 
-void trap_init(void)
+void __init trap_init(void)
 {
 	extern void thread_info_offsets_are_bolixed_pete(void);
 
diff --git a/arch/um/kernel/trap.c b/arch/um/kernel/trap.c
index ad12f78bda7e..3198c4767387 100644
--- a/arch/um/kernel/trap.c
+++ b/arch/um/kernel/trap.c
@@ -311,7 +311,3 @@ void winch(int sig, struct siginfo *unused_si, struct uml_pt_regs *regs)
 {
 	do_IRQ(WINCH_IRQ, regs);
 }
-
-void trap_init(void)
-{
-}
diff --git a/init/main.c b/init/main.c
index 53b278845b88..8d14674c4e00 100644
--- a/init/main.c
+++ b/init/main.c
@@ -779,6 +779,8 @@ void __init __weak poking_init(void) { }
 
 void __init __weak pgtable_cache_init(void) { }
 
+void __init __weak trap_init(void) { }
+
 bool initcall_debug;
 core_param(initcall_debug, initcall_debug, bool, 0644);
 
-- 
2.31.0

