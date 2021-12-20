Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAB547B18E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 17:45:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHlnG20SXz3fRs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 03:45:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::61e;
 helo=fra01-mr2-obe.outbound.protection.outlook.com;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from FRA01-MR2-obe.outbound.protection.outlook.com
 (mail-mr2fra01on061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e19::61e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHlf736TBz307W
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 03:38:55 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VdmWSkfQDpqa4xHZcRYCPHUKh9x79lc8CAjdI8++mykZoX+1GDZL1FA5ORa+uIWdtScyR82S+NuCkCPRxJwDVMn5eNrNpdJola3eNPBbsxdWeyL2yQc7vZPztv/NToXbSAj/2/VQPjDKojcbeaxXw/9w5y6KGLMffW4IeGlbAO8tO+SGj2ta6RtqEQQSnITDFRCzWK4mvrjQ7mdaxegn/274A2o6yOqV1llFebZMTJhRsTJLFfSaFQu+qEV9CPNtzyMRTVSP+2Pe/TRF/ygS3jM88OSCWKwWVt2pv1hWfjLkQl0i2tnzXOo8tNmbHOnJuBatgU5U8mBaeiViKhOc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkUBCfV/KAr2BLtbcPd8674cB+6q5dalBBqW+OZMYXE=;
 b=XiEN7fMM8mn7SzFDlq+UmigLSW4vrF2ytSq0Qv9/4wkIpA+NMrXFCEao7oB4SCCPDvH8fa8YOxnhRBV99lsjMjUcN+XDkiG2bVcO6On2pegkoh0jpB+Zsx04/D8B6gYnLv6S1/meYJcUgLopWEII/p0bgT2rxJD99F2kqxJx+Tz0Ot/GozfbVSyyFZqnqrUePoIApT1kC/1SLKIux2M8W6x47TE7jRRKP6j44DvqGbGU1J701KAJI/eeVKse9lcKt9oMFjfFdISB2ZNJ6dswepvls/GwPfEIqPTn7xOKt80N+t36G9d0nVXBatWxdywEG3gq8mHK2tVmQQTzqN+4Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1a::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Mon, 20 Dec
 2021 16:38:44 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::f0ef:856d:b0de:e85d%5]) with mapi id 15.20.4801.020; Mon, 20 Dec 2021
 16:38:44 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>,
 Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar
 <mingo@redhat.com>, "Naveen N . Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: [PATCH v2 13/13] powerpc/ftrace: Remove ftrace_32.S
Thread-Topic: [PATCH v2 13/13] powerpc/ftrace: Remove ftrace_32.S
Thread-Index: AQHX9cANkLxWh8GLFUiAdIcoDGxScg==
Date: Mon, 20 Dec 2021 16:38:44 +0000
Message-ID: <5e837fc190504c4ef834272e70d60ae33f175d49.1640017960.git.christophe.leroy@csgroup.eu>
References: <cover.1640017960.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1640017960.git.christophe.leroy@csgroup.eu>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1db79beb-01c7-43b5-c908-08d9c3d7303d
x-ms-traffictypediagnostic: MRZP264MB2924:EE_
x-microsoft-antispam-prvs: <MRZP264MB29249BCA6A4CA4D4E3D2B4E3ED7B9@MRZP264MB2924.FRAP264.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: OMw/fd3QZ8nrX3+3rMe+TEoMVMC0IRXOjeI6v0qmPqlKE2Lm/LKYbWdKGufCXjIINZrjQIeTE+ksTF++948GcH1QDoQ3k8j8239mnXJfh7EGtOxCT3foRtj1N66JeXCPgcGs03Xz9ipy+/t97T32Z9pxrIPFA29rWfAA36o2Vka6xWpHJqb3Vy01GIVO+lV8MNNJF7zXF5nHU+HhoZ44/pODwgW1ux7UhQFqNUX3UYOr5OkVTtEofQDKKo7MnMGtS2nLWm3s8uBwrnd0O6I2to7ZbBGuyChk54B6R6VKuJ/kebDf3K5IHzwPQ50kGLs/AMybCN14Egv6X2mxu5kHek5kRAahWQrxwPAhnghS1YUgLfVXo6jBCbbwGO1B3zVsdlUWut4YUCxRgWZeP9O43eIDPAs8noYLhABWshe/voX5R5IXg+nZ21++hFige17NPIqxWjRexpFKTV1vSCl2yQfEywpOsCeyHf2bkzK3txpNX/wgA6S18/0pE5gyqIoT/yvi661DDGQ2JAdc8OgJlekN/Qpt3jnug5n4KMwfOx5AnOhZFzVyvLWlwwTTJvXk2Kl0jp3W3zymoJAyS6x8sSI+ePtAE1zBTDzPqJpek5N4AhJ30hzI/Sa9Qky4SBmfhnBK57sWKl8QY494yHe5vUM61yCDFHGjXaJEcoZPpYpzWrGRCTj0TnWBoaSCDPa9NvlggYbiGyLrvrtewWn5Gg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(54906003)(508600001)(4326008)(86362001)(76116006)(6506007)(91956017)(316002)(36756003)(38070700005)(110136005)(71200400001)(83380400001)(7416002)(2906002)(44832011)(2616005)(5660300002)(6512007)(66476007)(8676002)(8936002)(64756008)(38100700002)(66446008)(122000001)(66946007)(6486002)(66556008)(186003)(26005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?7nhsr6vL0WjA9JH+sRa9lIo/3qpnLajBbfHlOIPVbfKd5AhEoutGOkEGg2?=
 =?iso-8859-1?Q?WL7vFwVobl+/TZrMjKF6RkOLOB2Agili/miQIjRSO5/m/jU7PMHvFUMrDk?=
 =?iso-8859-1?Q?+fVc0NqWz9YRQTeKULh0SZEgCrftfahVlZDUsVsj4uIj+ZdoEldn4Bryge?=
 =?iso-8859-1?Q?u2BOHDwXcj+w/W1B7WsR6FXIE8PdZtLbriXauaEtXXCDbRpj7yWKaFmAPE?=
 =?iso-8859-1?Q?JsaTvdcLaWvxheaQZ9CVzzy5+tmV4clGkaHn26VxdzrJ4jW4gxprLf3wRG?=
 =?iso-8859-1?Q?/X8jgagtS+t4c8aed2sSjJdQL2NWEoYMe2ihW6s5MJsfheQ2DJD4jVjh6l?=
 =?iso-8859-1?Q?yTe/jHENF8KJcXtmYrWh/tXrHVCH+9j6XvELCxkfVdUrJChcTXr3Uy2dac?=
 =?iso-8859-1?Q?lKQsN/TEX0J1n8Aq6uDnVwpZ0CAJDy7jR8+bNZ0OBN15/j0HIZIHHh6fRt?=
 =?iso-8859-1?Q?e3xt/YtDu86/GV7JPSQdVViP3whVAYwwEt96hourU78djRve2QSVZs7H1C?=
 =?iso-8859-1?Q?QxgHVjH2w/5+D0ZZFBo2ZQGQ+Pjs5mXlqlJljG+7sVz+rMxYieDaDfGiZR?=
 =?iso-8859-1?Q?AGiVZf5UshRbsvPzUCEm4fZhCGZW1Rtb8BqPRIjHLfthCrPXdnhju5wOZT?=
 =?iso-8859-1?Q?GqTIzzySD6+cu2Ah36KfnIMwDjxZaKboikTKU86V2gMHKwqIIOQ3+mD/Ii?=
 =?iso-8859-1?Q?ovElVtrN3bZtLHHZZTBvnQB39nXSxuPK9U1xtsz6ZkSX302BOWTl5W8zEr?=
 =?iso-8859-1?Q?d6OlDR+8hKvJMA710DqL5BzgsZy0Tguk+m7i5RApRzRqfsMuJ3n6P9bH0R?=
 =?iso-8859-1?Q?O0g64apecQo3dQ7b/tQa+vuJSqtjefqsPcXIsusaKHkM/ujVUwDOty++6/?=
 =?iso-8859-1?Q?XAxOuOdKu5afOsNaXn6Spfci90NRcInRIVQ1DHWyc2hy8aG17eiVmZFJEw?=
 =?iso-8859-1?Q?+chLKJXcCSAkG/Wzvw4nIEVtzfM1J6ElUFk6Ok3w5pLVgyJM1EB0JtgvNT?=
 =?iso-8859-1?Q?fsGFJaaJvYYTseqobz1l3QxLJXhmtnj5tbAltrCwSJ/WPXAzFqyPZEQIC2?=
 =?iso-8859-1?Q?LaocfqVwL0SjxejaDcLRyAwogL3K6zv3YYFsp26R3sSjYppRmD0N3hSOVe?=
 =?iso-8859-1?Q?XUPLOZ5qpWwx28j1Ks/uClD3fTs9lF2P57Svp4zi9/70NPA6MYqZuoQI7F?=
 =?iso-8859-1?Q?wRpWxlZRUYVo7ft83/A7ei5m3CYv98mm4vgdgXlbBRc0oCskj3g9doV1Y/?=
 =?iso-8859-1?Q?MelUCdTZryTGV0rUAQfkQW6syZgfpC/+cJXZWlzXhs/LzMmkpfmjV4Px2T?=
 =?iso-8859-1?Q?YHqlikt41tWZYGC/rEvnWhSj5U2+v4UxsBG1vWDcF92U9agGTeNhdFpg7X?=
 =?iso-8859-1?Q?RtmeCnzyk0rMaalb9Cl0v2BwswL4alC25D9PJm7Uj25fiBsgSuAvxR5G79?=
 =?iso-8859-1?Q?oRZFJ2uNouxkAelRNBtOyf0rvwhfoSJMUrzXndOfnf9eYnh+qzTwE3UBj7?=
 =?iso-8859-1?Q?QFgP1oJl+9tYeHW9viBGClNnNx/uOvb+VQsihJDQYqUZ+Z3q4D1S0TUfiC?=
 =?iso-8859-1?Q?o9axsB1ZBfFOM9AH/Q3WeXd6Vb17jkZo5uxH8kXOZCf+O4FJv83Q72sknw?=
 =?iso-8859-1?Q?aXmCfct8xAdt+5zF1QAaHZbfkMZi1O2AxBmx94M9vq1YfAPCdaq+Z8pGuo?=
 =?iso-8859-1?Q?IQm0eFMtGjlH7JXKFcZNGncuF6cZiHF0722lGlt7b5SYQJmvNK/ZS7iLN1?=
 =?iso-8859-1?Q?0RbTCFr/sWM4SzOwF4eVrbCQY=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 1db79beb-01c7-43b5-c908-08d9c3d7303d
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Dec 2021 16:38:44.3595 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G3iu0kc0+Fypb3KD+oLz9Viam0kqfFpFqdfIZuMMzwYcdgrbBJVRpX8kabraFSngL3qjIJw43A2bzU7pJB4XgYJt730PZ1G58VwyIV6Oh3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB2924
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
Cc: "live-patching@vger.kernel.org" <live-patching@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Functions in ftrace_32.S are common with PPC64.

Reuse the ones defined for PPC64 with slight modification
when required.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/kernel/trace/Makefile            |   7 +-
 arch/powerpc/kernel/trace/ftrace_32.S         | 152 ------------------
 .../trace/{ftrace_64.S =3D> ftrace_low.S}       |  14 ++
 ...ftrace_64_mprofile.S =3D> ftrace_mprofile.S} |   0
 4 files changed, 17 insertions(+), 156 deletions(-)
 delete mode 100644 arch/powerpc/kernel/trace/ftrace_32.S
 rename arch/powerpc/kernel/trace/{ftrace_64.S =3D> ftrace_low.S} (85%)
 rename arch/powerpc/kernel/trace/{ftrace_64_mprofile.S =3D> ftrace_mprofil=
e.S} (100%)

diff --git a/arch/powerpc/kernel/trace/Makefile b/arch/powerpc/kernel/trace=
/Makefile
index 858503775c58..ac7d42a4e8d0 100644
--- a/arch/powerpc/kernel/trace/Makefile
+++ b/arch/powerpc/kernel/trace/Makefile
@@ -8,15 +8,14 @@ ifdef CONFIG_FUNCTION_TRACER
 CFLAGS_REMOVE_ftrace.o =3D $(CC_FLAGS_FTRACE)
 endif
=20
-obj32-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_32.o
-obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_64.o
+obj32-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_mprofile.o
 ifdef CONFIG_MPROFILE_KERNEL
-obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_64_mprofile.o
+obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_mprofile.o
 else
 obj64-$(CONFIG_FUNCTION_TRACER)		+=3D ftrace_64_pg.o
 endif
 obj-$(CONFIG_DYNAMIC_FTRACE)		+=3D ftrace.o
-obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+=3D ftrace.o
+obj-$(CONFIG_FUNCTION_GRAPH_TRACER)	+=3D ftrace.o ftrace_low.o
 obj-$(CONFIG_FTRACE_SYSCALLS)		+=3D ftrace.o
 obj-$(CONFIG_TRACING)			+=3D trace_clock.o
=20
diff --git a/arch/powerpc/kernel/trace/ftrace_32.S b/arch/powerpc/kernel/tr=
ace/ftrace_32.S
deleted file mode 100644
index 2b425da97a6b..000000000000
--- a/arch/powerpc/kernel/trace/ftrace_32.S
+++ /dev/null
@@ -1,152 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- * Split from entry_32.S
- */
-
-#include <linux/magic.h>
-#include <asm/reg.h>
-#include <asm/ppc_asm.h>
-#include <asm/asm-offsets.h>
-#include <asm/ftrace.h>
-#include <asm/export.h>
-#include <asm/ptrace.h>
-
-_GLOBAL(mcount)
-_GLOBAL(_mcount)
-	/*
-	 * It is required that _mcount on PPC32 must preserve the
-	 * link register. But we have r12 to play with. We use r12
-	 * to push the return address back to the caller of mcount
-	 * into the ctr register, restore the link register and
-	 * then jump back using the ctr register.
-	 */
-	mflr	r12
-	mtctr	r12
-	mtlr	r0
-	bctr
-EXPORT_SYMBOL(_mcount)
-
-_GLOBAL(ftrace_caller)
-	stwu	r1, -INT_FRAME_SIZE(r1)
-
-	SAVE_GPRS(3, 10, r1)
-
-	addi	r8, r1, INT_FRAME_SIZE
-	stw	r8, GPR1(r1)
-
-	mflr	r3
-	stw	r3, _NIP(r1)
-	subi	r3, r3, MCOUNT_INSN_SIZE
-
-	stw	r0, _LINK(r1)
-	mr	r4, r0
-
-	lis	r5,function_trace_op@ha
-	lwz	r5,function_trace_op@l(r5)
-
-	addi	r6, r1, STACK_FRAME_OVERHEAD
-.globl ftrace_call
-ftrace_call:
-	bl	ftrace_stub
-	nop
-
-	lwz	r3, _NIP(r1)
-	mtctr	r3
-
-	REST_GPRS(3, 10, r1)
-
-	lwz	r0, _LINK(r1)
-	mtlr	r0
-
-	addi	r1, r1, INT_FRAME_SIZE
-	/* old link register ends up in ctr reg */
-	bctr
-
-
-_GLOBAL(ftrace_stub)
-	blr
-
-_GLOBAL(ftrace_regs_caller)
-	/* Create our stack frame + pt_regs */
-	stwu	r1,-INT_FRAME_SIZE(r1)
-
-	/* Save all gprs to pt_regs */
-	stw	r0, GPR0(r1)
-	stmw	r2, GPR2(r1)
-
-	/* Save previous stack pointer (r1) */
-	addi	r8, r1, INT_FRAME_SIZE
-	stw	r8, GPR1(r1)
-
-	/* Load special regs for save below */
-	mfmsr   r8
-	mfctr   r9
-	mfxer   r10
-	mfcr	r11
-
-	/* Get the _mcount() call site out of LR */
-	mflr	r7
-	/* Save it as pt_regs->nip */
-	stw     r7, _NIP(r1)
-	/* Save the read LR in pt_regs->link */
-	stw     r0, _LINK(r1)
-
-	lis	r3,function_trace_op@ha
-	lwz	r5,function_trace_op@l(r3)
-
-	/* Calculate ip from nip-4 into r3 for call below */
-	subi    r3, r7, MCOUNT_INSN_SIZE
-
-	/* Put the original return address in r4 as parent_ip */
-	mr	r4, r0
-
-	/* Save special regs */
-	stw     r8, _MSR(r1)
-	stw     r9, _CTR(r1)
-	stw     r10, _XER(r1)
-	stw     r11, _CCR(r1)
-
-	/* Load &pt_regs in r6 for call below */
-	addi    r6, r1, STACK_FRAME_OVERHEAD
-
-	/* ftrace_call(r3, r4, r5, r6) */
-.globl ftrace_regs_call
-ftrace_regs_call:
-	bl	ftrace_stub
-	nop
-
-	/* Load ctr with the possibly modified NIP */
-	lwz	r3, _NIP(r1)
-	mtctr	r3
-
-	/* Restore gprs */
-	lmw	r2, GPR2(r1)
-
-	/* Restore possibly modified LR */
-	lwz	r0, _LINK(r1)
-	mtlr	r0
-
-	/* Pop our stack frame */
-	addi r1, r1, INT_FRAME_SIZE
-	/* old link register ends up in ctr reg */
-	bctr
-
-#ifdef CONFIG_FUNCTION_GRAPH_TRACER
-_GLOBAL(return_to_handler)
-	/* need to save return values */
-	stwu	r1, -16(r1)
-	stw	r3, 8(r1)
-	stw	r4, 12(r1)
-
-	bl	ftrace_return_to_handler
-
-	/* return value has real return address */
-	mtlr	r3
-
-	lwz	r3, 8(r1)
-	lwz	r4, 12(r1)
-	addi	r1, r1, 16
-
-	/* Jump back to real return address */
-	blr
-#endif /* CONFIG_FUNCTION_GRAPH_TRACER */
diff --git a/arch/powerpc/kernel/trace/ftrace_64.S b/arch/powerpc/kernel/tr=
ace/ftrace_low.S
similarity index 85%
rename from arch/powerpc/kernel/trace/ftrace_64.S
rename to arch/powerpc/kernel/trace/ftrace_low.S
index 25e5b9e47c06..0bddf1fa6636 100644
--- a/arch/powerpc/kernel/trace/ftrace_64.S
+++ b/arch/powerpc/kernel/trace/ftrace_low.S
@@ -10,6 +10,7 @@
 #include <asm/ppc-opcode.h>
 #include <asm/export.h>
=20
+#ifdef CONFIG_PPC64
 .pushsection ".tramp.ftrace.text","aw",@progbits;
 .globl ftrace_tramp_text
 ftrace_tramp_text:
@@ -21,6 +22,7 @@ ftrace_tramp_text:
 ftrace_tramp_init:
 	.space 64
 .popsection
+#endif
=20
 _GLOBAL(mcount)
 _GLOBAL(_mcount)
@@ -33,6 +35,7 @@ EXPORT_SYMBOL(_mcount)
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 _GLOBAL(return_to_handler)
 	/* need to save return values */
+#ifdef CONFIG_PPC64
 	std	r4,  -32(r1)
 	std	r3,  -24(r1)
 	/* save TOC */
@@ -46,6 +49,11 @@ _GLOBAL(return_to_handler)
 	 * Switch to our TOC to run inside the core kernel.
 	 */
 	ld	r2, PACATOC(r13)
+#else
+	stwu	r1, -16(r1)
+	stw	r3, 8(r1)
+	stw	r4, 12(r1)
+#endif
=20
 	bl	ftrace_return_to_handler
 	nop
@@ -53,11 +61,17 @@ _GLOBAL(return_to_handler)
 	/* return value has real return address */
 	mtlr	r3
=20
+#ifdef CONFIG_PPC64
 	ld	r1, 0(r1)
 	ld	r4,  -32(r1)
 	ld	r3,  -24(r1)
 	ld	r2,  -16(r1)
 	ld	r31, -8(r1)
+#else
+	lwz	r3, 8(r1)
+	lwz	r4, 12(r1)
+	addi	r1, r1, 16
+#endif
=20
 	/* Jump back to real return address */
 	blr
diff --git a/arch/powerpc/kernel/trace/ftrace_64_mprofile.S b/arch/powerpc/=
kernel/trace/ftrace_mprofile.S
similarity index 100%
rename from arch/powerpc/kernel/trace/ftrace_64_mprofile.S
rename to arch/powerpc/kernel/trace/ftrace_mprofile.S
--=20
2.33.1
