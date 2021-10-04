Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E65EB421220
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 16:57:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNP2d5BtLz2yxL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 01:57:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jFnGsN8i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jFnGsN8i; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNP1x3RG3z2yJM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 01:56:52 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id x4so63624pln.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 07:56:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pch0zK4AHU3xH4Mk35PbyrpN8VfowtHNTw14PoZ9njs=;
 b=jFnGsN8itWvTnbaPdbmpU3QdlJSh4di/9yduXg8J6tez9qDVgh4pcyIZCodLfqzGBW
 lqgbAc9LgsbBhh1M1b/zQFI/KZ37mBO033joIZon6IKen5aFiPqn+Pu+92yZPqSXDbit
 R1zpqQNm+cQ80bAhe9qwAOMb38x3vq5+rIAFjVXHy2jLHJmoy3l2aMQLB4g+IozFm782
 1Z1E8Rc7v8TzX3A2CQ/wpQEhyxCjBoimxscEdKR5b0KcSbDCKQmsLu+bmBUB2He5mDbQ
 Af5uqati9NmdQ/5s69RuzwHvmrycovEOjg4GZ5epX3eDZqTXe3RaSpzRQTaOdP1scGoc
 lkiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pch0zK4AHU3xH4Mk35PbyrpN8VfowtHNTw14PoZ9njs=;
 b=3H2aeK0d+DLnPJviMwB0fUp4nn3zyXPnKGeb1S/HtOA7vjLS6l1L2RFaPxud06wi0v
 EfBgED/hsH7iDfZEg+8HoP3rD0ocrsOEkrLJVy77l9ZoxbN5mJJL0zGAGozxC4KxpjSN
 R+5sI3Oj3eehZHxwSb9V9OfhVdP/QTzeRjjQf019v7CUnvjyxR/DA23UWE/G0l8pQ8WM
 IemDZxDmdowXjpZ43+8mgir6h3DJ1iucgNVKnLf/TxRCib4mxJj2d+SsTs5X371glTq0
 8CYk5NAUxYOlw/HVD1PgQZuDygQf4q2k/3FCuP9CKjTeZ52EwjGrJlRen5gOAutRvWeF
 vxtg==
X-Gm-Message-State: AOAM532nlrUQd4kAw2oIeU35wXx3dHk25pz9+9H3zlshbI+RcYVNfVT1
 jMl1zBT+KwSsSJNT4XJrb5rAAjMtocw=
X-Google-Smtp-Source: ABdhPJxyUfTz6fVm3Ixo82OpICO124P/Tnwxo93nEMpUNQzPjV6K/nOrDCgWMrBNQmNjGNsZygKvvQ==
X-Received: by 2002:a17:90b:1e47:: with SMTP id
 pi7mr37672901pjb.135.1633359410137; 
 Mon, 04 Oct 2021 07:56:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id f16sm13194903pjj.56.2021.10.04.07.56.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 07:56:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] powerpc/64s: fix program check interrupt emergency stack
 path
Date: Tue,  5 Oct 2021 00:56:38 +1000
Message-Id: <20211004145642.1331214-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004145642.1331214-1-npiggin@gmail.com>
References: <20211004145642.1331214-1-npiggin@gmail.com>
MIME-Version: 1.0
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Emergency stack path was jumping into a 3: label inside the
__GEN_COMMON_BODY macro for the normal path after it had finished,
rather than jumping over it. By a small miracle this is the correct
place to build up a new interrupt frame with the existing stack
pointer, so things basically worked okay with an added weird looking
700 trap frame on top (which had the wrong ->nip so it didn't decode
bug messages either).

Fix this by avoiding using numeric labels when jumping over non-trivial
macros.

Before:

 LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
 Modules linked in:
 CPU: 0 PID: 88 Comm: sh Not tainted 5.15.0-rc2-00034-ge057cdade6e5 #2637
 NIP:  7265677368657265 LR: c00000000006c0c8 CTR: c0000000000097f0
 REGS: c0000000fffb3a50 TRAP: 0700   Not tainted
 MSR:  9000000000021031 <SF,HV,ME,IR,DR,LE>  CR: 00000700  XER: 20040000
 CFAR: c0000000000098b0 IRQMASK: 0
 GPR00: c00000000006c964 c0000000fffb3cf0 c000000001513800 0000000000000000
 GPR04: 0000000048ab0778 0000000042000000 0000000000000000 0000000000001299
 GPR08: 000001e447c718ec 0000000022424282 0000000000002710 c00000000006bee8
 GPR12: 9000000000009033 c0000000016b0000 00000000000000b0 0000000000000001
 GPR16: 0000000000000000 0000000000000002 0000000000000000 0000000000000ff8
 GPR20: 0000000000001fff 0000000000000007 0000000000000080 00007fff89d90158
 GPR24: 0000000002000000 0000000002000000 0000000000000255 0000000000000300
 GPR28: c000000001270000 0000000042000000 0000000048ab0778 c000000080647e80
 NIP [7265677368657265] 0x7265677368657265
 LR [c00000000006c0c8] ___do_page_fault+0x3f8/0xb10
 Call Trace:
 [c0000000fffb3cf0] [c00000000000bdac] soft_nmi_common+0x13c/0x1d0 (unreliable)
 --- interrupt: 700 at decrementer_common_virt+0xb8/0x230
 NIP:  c0000000000098b8 LR: c00000000006c0c8 CTR: c0000000000097f0
 REGS: c0000000fffb3d60 TRAP: 0700   Not tainted
 MSR:  9000000000021031 <SF,HV,ME,IR,DR,LE>  CR: 22424282  XER: 20040000
 CFAR: c0000000000098b0 IRQMASK: 0
 GPR00: c00000000006c964 0000000000002400 c000000001513800 0000000000000000
 GPR04: 0000000048ab0778 0000000042000000 0000000000000000 0000000000001299
 GPR08: 000001e447c718ec 0000000022424282 0000000000002710 c00000000006bee8
 GPR12: 9000000000009033 c0000000016b0000 00000000000000b0 0000000000000001
 GPR16: 0000000000000000 0000000000000002 0000000000000000 0000000000000ff8
 GPR20: 0000000000001fff 0000000000000007 0000000000000080 00007fff89d90158
 GPR24: 0000000002000000 0000000002000000 0000000000000255 0000000000000300
 GPR28: c000000001270000 0000000042000000 0000000048ab0778 c000000080647e80
 NIP [c0000000000098b8] decrementer_common_virt+0xb8/0x230
 LR [c00000000006c0c8] ___do_page_fault+0x3f8/0xb10
 --- interrupt: 700
 Instruction dump:
 XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
 XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
 ---[ end trace 6d28218e0cc3c949 ]---

After:

 ------------[ cut here ]------------
 kernel BUG at arch/powerpc/kernel/exceptions-64s.S:491!
 Oops: Exception in kernel mode, sig: 5 [#1]
 LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA PowerNV
 Modules linked in:
 CPU: 0 PID: 88 Comm: login Not tainted 5.15.0-rc2-00034-ge057cdade6e5-dirty #2638
 NIP:  c0000000000098b8 LR: c00000000006bf04 CTR: c0000000000097f0
 REGS: c0000000fffb3d60 TRAP: 0700   Not tainted
 MSR:  9000000000021031 <SF,HV,ME,IR,DR,LE>  CR: 24482227  XER: 00040000
 CFAR: c0000000000098b0 IRQMASK: 0
 GPR00: c00000000006bf04 0000000000002400 c000000001513800 c000000001271868
 GPR04: 00000000100f0d29 0000000042000000 0000000000000007 0000000000000009
 GPR08: 00000000100f0d29 0000000024482227 0000000000002710 c000000000181b3c
 GPR12: 9000000000009033 c0000000016b0000 00000000100f0d29 c000000005b22f00
 GPR16: 00000000ffff0000 0000000000000001 0000000000000009 00000000100eed90
 GPR20: 00000000100eed90 0000000010000000 000000001000a49c 00000000100f1430
 GPR24: c000000001271868 0000000002000000 0000000000000215 0000000000000300
 GPR28: c000000001271800 0000000042000000 00000000100f0d29 c000000080647860
 NIP [c0000000000098b8] decrementer_common_virt+0xb8/0x230
 LR [c00000000006bf04] ___do_page_fault+0x234/0xb10
 Call Trace:
 Instruction dump:
 4182000c 39400001 48000008 894d0932 714a0001 39400008 408225fc 718a4000
 7c2a0b78 3821fcf0 41c20008 e82d0910 <0981fcf0> f92101a0 f9610170 f9810178
 ---[ end trace a5dbd1f5ea4ccc51 ]---

Fixes: 0a882e28468f4 ("powerpc/64s/exception: remove bad stack branch")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 37859e62a8dc..024d9231f88c 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -1665,27 +1665,30 @@ EXC_COMMON_BEGIN(program_check_common)
 	 */
 
 	andi.	r10,r12,MSR_PR
-	bne	2f			/* If userspace, go normal path */
+	bne	.Lnormal_stack		/* If userspace, go normal path */
 
 	andis.	r10,r12,(SRR1_PROGTM)@h
-	bne	1f			/* If TM, emergency		*/
+	bne	.Lemergency_stack	/* If TM, emergency		*/
 
 	cmpdi	r1,-INT_FRAME_SIZE	/* check if r1 is in userspace	*/
-	blt	2f			/* normal path if not		*/
+	blt	.Lnormal_stack		/* normal path if not		*/
 
 	/* Use the emergency stack					*/
-1:	andi.	r10,r12,MSR_PR		/* Set CR0 correctly for label	*/
+.Lemergency_stack:
+	andi.	r10,r12,MSR_PR		/* Set CR0 correctly for label	*/
 					/* 3 in EXCEPTION_PROLOG_COMMON	*/
 	mr	r10,r1			/* Save r1			*/
 	ld	r1,PACAEMERGSP(r13)	/* Use emergency stack		*/
 	subi	r1,r1,INT_FRAME_SIZE	/* alloc stack frame		*/
 	__ISTACK(program_check)=0
 	__GEN_COMMON_BODY program_check
-	b 3f
-2:
+	b .Ldo_program_check
+
+.Lnormal_stack:
 	__ISTACK(program_check)=1
 	__GEN_COMMON_BODY program_check
-3:
+
+.Ldo_program_check:
 	addi	r3,r1,STACK_FRAME_OVERHEAD
 	bl	program_check_exception
 	REST_NVGPRS(r1) /* instruction emulation may change GPRs */
-- 
2.23.0

