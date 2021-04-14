Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E503735F035
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 10:58:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKxGl6n5Vz3bw6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 18:58:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=Synaptics.onmicrosoft.com header.i=@Synaptics.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-Synaptics-onmicrosoft-com header.b=Vw5JlE3L;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=synaptics.com (client-ip=40.107.93.63;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=jisheng.zhang@synaptics.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=Synaptics.onmicrosoft.com
 header.i=@Synaptics.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-Synaptics-onmicrosoft-com header.b=Vw5JlE3L; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2063.outbound.protection.outlook.com [40.107.93.63])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKxGG1FCFz2yhf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 18:58:28 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aFZ4fduwkKuEKsaIEawDGjylvNl+A6eqRZZaK1+acS9Oj68pRag6FHveY1KuznN5Ngu1Q+7gDet4chvKUutS96LwCOia5/vcpQ9FyodQ8HjOE8wg50Hm4r+yWDPeW0sq60oIVinusymRQAJJYUhz62gvZ+nf4MM1GCIoH1MJmipjQnUgtWz83W3b6lru/g2YvrSUiWlP4Y+YUmt7iC2iatOE7E6w9hAfqH4VJJ8/ZlhaZ8IUZLOfLnUebqTes7ljuifKrNClUTp3GekXA24alPIMqNvcRP2D3MZCOchtYNL3V/WCP8QuRmZtdJjhjtK/IaxFa9qUg6/pvfRnSJM0Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08voTLsZcDJChYQ5jgeNzzEpKc8++MtNWQh8s3eoYvU=;
 b=kEzcTqxJ8VSQOq+LOZJISWXVgktC1YAmtxb5HbthzlBp7ySiOtUv+VyQirKR5K9t1D4kiekTlJprIkdOz5xJC5vH+bGSBd6mMxRjbDDYKLbKIuppRHI9YFvYOC7mfCyUM3lBbS4OsUe8BWsM7AGTgVjOV67nbmT04pBcHSICohkqjHeTE8R3o7YQNPSWuFjFBGHHrO7NDq/cuQQgK7GlMuUR+M1ZZ+M6gFjCweK2T1Tc7PtbW9FzN5ChSX7pip3fThe6mphYfDYOp68cy2IoR2B3UXSWx4ddNlWu/crlmN4MXfSCfHQUFuLSkkUdSP+anVX2LBOKGcDKzmW1o3DhhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synaptics.com; dmarc=pass action=none
 header.from=synaptics.com; dkim=pass header.d=synaptics.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Synaptics.onmicrosoft.com; s=selector2-Synaptics-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08voTLsZcDJChYQ5jgeNzzEpKc8++MtNWQh8s3eoYvU=;
 b=Vw5JlE3LAAEucBaNse013pBy2dqiuPE0YpK2oVLfOdq7y6Bo0fWn1/vfcVjeGrS558kbEYs60EnJZw3zOSIcVLweOF7BQxbLz2avVqenu93DmEuQSF0aflRBRtDIybBYvid7UlyFY3nz08xfv3hbR7u2VbL7SrPcajsIS3RQhqI=
Authentication-Results: synopsys.com; dkim=none (message not signed)
 header.d=none; synopsys.com; dmarc=none action=none header.from=synaptics.com; 
Received: from BY5PR03MB5345.namprd03.prod.outlook.com (2603:10b6:a03:219::16)
 by BY5PR03MB5078.namprd03.prod.outlook.com (2603:10b6:a03:1e5::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.16; Wed, 14 Apr
 2021 08:58:22 +0000
Received: from BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72]) by BY5PR03MB5345.namprd03.prod.outlook.com
 ([fe80::8569:341f:4bc6:5b72%8]) with mapi id 15.20.4020.022; Wed, 14 Apr 2021
 08:58:22 +0000
Date: Wed, 14 Apr 2021 16:58:08 +0800
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
 Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: [PATCH] init: consolidate trap_init()
Message-ID: <20210414165808.458a3d11@xhacker.debian>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Originating-IP: [192.147.44.204]
X-ClientProxiedBy: SJ0PR03CA0126.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::11) To BY5PR03MB5345.namprd03.prod.outlook.com
 (2603:10b6:a03:219::16)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from xhacker.debian (192.147.44.204) by
 SJ0PR03CA0126.namprd03.prod.outlook.com (2603:10b6:a03:33c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4020.17 via Frontend
 Transport; Wed, 14 Apr 2021 08:58:13 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7241407c-569c-4a0a-dbeb-08d8ff23748b
X-MS-TrafficTypeDiagnostic: BY5PR03MB5078:
X-Microsoft-Antispam-PRVS: <BY5PR03MB507877BF88DECBED662A331CED4E9@BY5PR03MB5078.namprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Crn+fGVoq2cFN5JsT5rO0n2SsaHWm3Ut8MH/MkRVC3a9qKL2t5tE1ctlC/CGF/bawhG5BgLQ2vfB+zsJz/6c/gzjuusAGP+OrGvKHHLd32vOkRWFZKpIw6JTlfCJrM1THdSj7fE/N/xQHpFk5KKQ64qcJA8skAURoQRhF42jx7t0ZwpY9t0ykX0v+DXVIHhSMBefbzr76ntASr5IMG2y6hIXj5n6lGxRFQNnkiAvk98k894H4J3yDFVLESJAdmb2TPSsVzwwVIntTe1U1U4lh3IehBtsLFAqN9A0fvu2RtoghMXdCM+ftkxR4gA5L3XO71oClniv0MTq8c6J4PxZ4HyNsj4svHhKJBJDtUhHX8qAMowfq97tBxEyZgS+3VEK4mVHpp33nM6U4IEJEvC/BpXSsSKVSEAv9rKOuqdnha9NfcdtJ1DPJ2zybEB+DIXyUoHGMYAE8nniBysB8NtBE0P18DgXfJAD//sJFuT7YlnzjH3R+zV9pVEj/OoK+8/gMPE4UYnRsegZUPWPYErVX5/LKbHhJDcwvl5VDcKOoFEkwxXc/8iuS5Om4+jwtfsliw23D34iH2h9W4XkoSc2s76CuNEkIpx28IevWlry3CG3LKx8lSC5ytbkIG9q1UwDSHY3xe0E2wTUoHJalAFkh3sebbOQGxGqx4POpkcRcnlOLaC5gynphBILeJFwQEGD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR03MB5345.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(376002)(136003)(346002)(396003)(39850400004)(956004)(55016002)(8676002)(8936002)(66476007)(9686003)(66556008)(66946007)(6666004)(7416002)(7406005)(921005)(110136005)(86362001)(2906002)(1076003)(316002)(38350700002)(7696005)(52116002)(186003)(83380400001)(26005)(16526019)(6506007)(5660300002)(478600001)(4326008)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?cN76SSrX8CSB9pwmcNgZn7oaug3fu8oia1gOEDie+RQu2LDC5HMVflXF5Oei?=
 =?us-ascii?Q?F3D7GWDS/GFTuG/xnCQ2W8YH6bxDMatQ1bawNa9XixIDzSI+dzjzCcwAPCcY?=
 =?us-ascii?Q?qLUWxbxJ+tsU/BZAM3I71+qgtPIa23g4shUk031TJqdJtTxpI3uKwUtzRBDL?=
 =?us-ascii?Q?QDdI9er3L18Z4CufL++In7dhSGbyQxzjELtGg3xBRqwvUhC6a2PdFVvWiYXq?=
 =?us-ascii?Q?x6kXaUB/TUqo+sPxkMXPahbF+BKaz954iJkKw0Ff4hkJydKMtlw+JKvq8GwK?=
 =?us-ascii?Q?mpihLgfdpDQRlFSxnLzDTa8NuWx+PguPle2l5lKGH9W2EgJyJWV4RDI8gMH/?=
 =?us-ascii?Q?CrZHhosQb8oT7aqqSTpF2zsDjfeaMlHdpT/9kRDJS4oq98Zirm2l7aBLVNuc?=
 =?us-ascii?Q?gJ6ZVIvQunw9erThGIzysLWpaoKzh1hbgfz5J1F/Qv+qoh6ZqvKhVGBp2r6f?=
 =?us-ascii?Q?SGj/M6uE1+RJVziPTfK1CWahTVzqhIJD+U7CrWYqpUDwbM6KbJgv9FUOgJDl?=
 =?us-ascii?Q?OTbsQP4H4exDbF8in0e/+CNu7wvNfqMJVQ+Lo9V0dnK3ZUlNPf/kbAPdGkJL?=
 =?us-ascii?Q?R+EB52YdQU/Llg4kB+Cgzo/ARQzx1WChB7PZD8OY+pXkDMq3x31n8IWzRe6+?=
 =?us-ascii?Q?YiPs+TMu/UBuxG2HYsz6R8xfmMQhO/A/ovqkQl2vra9TJ1zfuvq4XEm9Y3gB?=
 =?us-ascii?Q?ZKYbdQPgvW462jyCKChfGhwmuKQGE0v8Mv3DoY91cjkuyvLcJdjdB1nXwy2H?=
 =?us-ascii?Q?48vBrG3cUrN/b9fX38dqe7gAebyV3ZFkfaXMO8SfIoArhwBnvl490hxthE2i?=
 =?us-ascii?Q?Bjm55kckQhi3EyAQluaIBRtNe1EuUgyd3kx5tfgW7cKBv4/fRgVOQDjtuYo4?=
 =?us-ascii?Q?iSLLKrE/3ywFsGEDWRcTGVbi6872Xb1zuUktlBnQuI0KzUktHlvCY5Y9Rf05?=
 =?us-ascii?Q?nvlDj/oaztJKh8+Wa/A2QsR5Q3H7wilKp3dVkpTTr2hkRjYsKNi8AVMmBFtM?=
 =?us-ascii?Q?JfxdwB89v06vjzBX5WG+s7B4E3Adp9xgj6iaHDX5ZEV0LGddW0wu2cytNAGd?=
 =?us-ascii?Q?DbG8zYGgytjnNsScaONPCQfa0FCJ2l1Q9OOEpBzoIcOeRB2UsJSof2j7Z+n2?=
 =?us-ascii?Q?eNnpgegXeuNPC6EyXt/gIihLZuaJhaGLudadOVL7nj9SruscDQQp6WkipPAi?=
 =?us-ascii?Q?fXpo5VY1oWKbdufEnc3QDXOOQnD5f8ExGeX1guIlXoGAzbWp4LtKg+oclJeO?=
 =?us-ascii?Q?7KMfxo+E6GFkH7xoGrbV2O5s/IjArIb8BGXjf3vlslL08y5RsDK2qPe028v6?=
 =?us-ascii?Q?TZqo/HdUZosKUVq0998wxLyf?=
X-OriginatorOrg: synaptics.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7241407c-569c-4a0a-dbeb-08d8ff23748b
X-MS-Exchange-CrossTenant-AuthSource: BY5PR03MB5345.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2021 08:58:21.9376 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335d1fbc-2124-4173-9863-17e7051a2a0e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u3+IU7wqdlqvMVyVUza0UfQx5B/Ur9neZBnGGkRnm1Re505DQ2rdBkTR44Ir43r3kASpvgf2r7o74iIJ2MmnIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB5078
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
 linux-hexagon@vger.kernel.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, openrisc@lists.librecores.org,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Many architectures implement the trap_init() as NOP, since there is
no such default for trap_init(), this empty stub is duplicated among
these architectures. Provide a generic but weak NOP implementation
to drop the empty stubs of trap_init() in these architectures.

Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
---
 arch/arc/kernel/traps.c      |  5 -----
 arch/arm/kernel/traps.c      |  5 -----
 arch/h8300/kernel/traps.c    | 13 -------------
 arch/hexagon/kernel/traps.c  |  4 ----
 arch/nds32/kernel/traps.c    |  5 -----
 arch/nios2/kernel/traps.c    |  5 -----
 arch/openrisc/kernel/traps.c |  5 -----
 arch/parisc/kernel/traps.c   |  4 ----
 arch/powerpc/kernel/traps.c  |  5 -----
 arch/riscv/kernel/traps.c    |  5 -----
 arch/um/kernel/trap.c        |  4 ----
 init/main.c                  |  2 ++
 12 files changed, 2 insertions(+), 60 deletions(-)

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
index 53b278845b88..4bdbe2928530 100644
--- a/init/main.c
+++ b/init/main.c
@@ -790,6 +790,8 @@ static inline void initcall_debug_enable(void)
 }
 #endif
 
+void __init __weak trap_init(void) { }
+
 /* Report memory auto-initialization states for this boot. */
 static void __init report_meminit(void)
 {
-- 
2.31.0

