Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5601C548322
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 11:39:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LM63n2081z3cg0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jun 2022 19:39:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e3qFRT1k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LM6376QQxz3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jun 2022 19:39:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e3qFRT1k;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LM6372Nh3z4xYN;
	Mon, 13 Jun 2022 19:39:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1655113155;
	bh=ICS2RNd2sGo14OZ1Po2nehj+mfTrdt05hlZ0FIoqKxs=;
	h=From:To:Cc:Subject:Date:From;
	b=e3qFRT1kkDGSZigL7PNxr30ApHAfSONQtKJ5KmQWFzdYNyBDVkI8ywDa7RrpZaG6c
	 EvkaO5auv6JoTFynIX2sVwe4qGFo7KyuNKXrjAhQtWWEk1fUvWKMK8eHL3H34Rrw0+
	 v1UwOz4UAvYVA14jEgciiZsvOGRAjYqlysvmgFTJYSBdXvhKwn2Im1OXcSTBp3zkKd
	 JzLuEZWhikhQQQmx8pzv5HFfCTWKOg+tuedB96tMe2a3OuBB1mzr0jIIWo76jMi09a
	 pappDYEFJHPyIEkbu9M8t4bWBkUIdBu1pGFe4ZCHt7k4NF5egBgw0Jda2p2vmfuBOb
	 vlHTc67j6ixAQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <stable@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Subject: [PATCH v4.14] powerpc/32: Fix overread/overwrite of thread_struct via ptrace
Date: Mon, 13 Jun 2022 19:39:07 +1000
Message-Id: <20220613093907.1283021-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Cc: sashal@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

commit 8e1278444446fc97778a5e5c99bca1ce0bbc5ec9 upstream.

The ptrace PEEKUSR/POKEUSR (aka PEEKUSER/POKEUSER) API allows a process
to read/write registers of another process.

To get/set a register, the API takes an index into an imaginary address
space called the "USER area", where the registers of the process are
laid out in some fashion.

The kernel then maps that index to a particular register in its own data
structures and gets/sets the value.

The API only allows a single machine-word to be read/written at a time.
So 4 bytes on 32-bit kernels and 8 bytes on 64-bit kernels.

The way floating point registers (FPRs) are addressed is somewhat
complicated, because double precision float values are 64-bit even on
32-bit CPUs. That means on 32-bit kernels each FPR occupies two
word-sized locations in the USER area. On 64-bit kernels each FPR
occupies one word-sized location in the USER area.

Internally the kernel stores the FPRs in an array of u64s, or if VSX is
enabled, an array of pairs of u64s where one half of each pair stores
the FPR. Which half of the pair stores the FPR depends on the kernel's
endianness.

To handle the different layouts of the FPRs depending on VSX/no-VSX and
big/little endian, the TS_FPR() macro was introduced.

Unfortunately the TS_FPR() macro does not take into account the fact
that the addressing of each FPR differs between 32-bit and 64-bit
kernels. It just takes the index into the "USER area" passed from
userspace and indexes into the fp_state.fpr array.

On 32-bit there are 64 indexes that address FPRs, but only 32 entries in
the fp_state.fpr array, meaning the user can read/write 256 bytes past
the end of the array. Because the fp_state sits in the middle of the
thread_struct there are various fields than can be overwritten,
including some pointers. As such it may be exploitable.

It has also been observed to cause systems to hang or otherwise
misbehave when using gdbserver, and is probably the root cause of this
report which could not be easily reproduced:
  https://lore.kernel.org/linuxppc-dev/dc38afe9-6b78-f3f5-666b-986939e40fc6@keymile.com/

Rather than trying to make the TS_FPR() macro even more complicated to
fix the bug, or add more macros, instead add a special-case for 32-bit
kernels. This is more obvious and hopefully avoids a similar bug
happening again in future.

Note that because 32-bit kernels never have VSX enabled the code doesn't
need to consider TS_FPRWIDTH/OFFSET at all.

Fixes: 87fec0514f61 ("powerpc: PTRACE_PEEKUSR/PTRACE_POKEUSER of FPR registers in little endian builds")
Cc: stable@vger.kernel.org # v3.13+
Reported-by: Ariel Miculas <ariel.miculas@belden.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/20220609133245.573565-1-mpe@ellerman.id.au
---
 arch/powerpc/kernel/ptrace.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace.c b/arch/powerpc/kernel/ptrace.c
index bfc5f59d9f1b..ef5875f83692 100644
--- a/arch/powerpc/kernel/ptrace.c
+++ b/arch/powerpc/kernel/ptrace.c
@@ -2920,8 +2920,13 @@ long arch_ptrace(struct task_struct *child, long request,
 
 			flush_fp_to_thread(child);
 			if (fpidx < (PT_FPSCR - PT_FPR0))
-				memcpy(&tmp, &child->thread.TS_FPR(fpidx),
-				       sizeof(long));
+				if (IS_ENABLED(CONFIG_PPC32)) {
+					// On 32-bit the index we are passed refers to 32-bit words
+					tmp = ((u32 *)child->thread.fp_state.fpr)[fpidx];
+				} else {
+					memcpy(&tmp, &child->thread.TS_FPR(fpidx),
+					       sizeof(long));
+				}
 			else
 				tmp = child->thread.fp_state.fpscr;
 		}
@@ -2953,8 +2958,13 @@ long arch_ptrace(struct task_struct *child, long request,
 
 			flush_fp_to_thread(child);
 			if (fpidx < (PT_FPSCR - PT_FPR0))
-				memcpy(&child->thread.TS_FPR(fpidx), &data,
-				       sizeof(long));
+				if (IS_ENABLED(CONFIG_PPC32)) {
+					// On 32-bit the index we are passed refers to 32-bit words
+					((u32 *)child->thread.fp_state.fpr)[fpidx] = data;
+				} else {
+					memcpy(&child->thread.TS_FPR(fpidx), &data,
+					       sizeof(long));
+				}
 			else
 				child->thread.fp_state.fpscr = data;
 			ret = 0;
-- 
2.35.3

