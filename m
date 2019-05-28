Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D41F2C599
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 13:42:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CsPy4lk1zDqLj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 21:41:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CsNQ4ZX4zDqL9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 21:40:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45CsNQ1V3qz9s5c;
 Tue, 28 May 2019 21:40:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Mathieu Malaterre <malat@debian.org>
Subject: Re: [PATCH v2] powerpc/32: sstep: Move variable `rc` within
 CONFIG_PPC64 sentinels
In-Reply-To: <20190312212318.17822-1-malat@debian.org>
References: <20190312202008.29681-1-malat@debian.org>
 <20190312212318.17822-1-malat@debian.org>
Date: Tue, 28 May 2019 21:40:34 +1000
Message-ID: <87d0k2q025.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mathieu Malaterre <malat@debian.org>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Mathieu Malaterre <malat@debian.org> writes:

> Fix warnings treated as errors with W=1:
>
>   arch/powerpc/lib/sstep.c:1172:31: error: variable 'rc' set but not used [-Werror=unused-but-set-variable]
>
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Signed-off-by: Mathieu Malaterre <malat@debian.org>
> ---
> v2: as suggested prefer CONFIG_PPC64 sentinel instead of unused keyword

I'd rather avoid adding more ifdefs if we can.

I think this works?

cheers

diff --git a/arch/powerpc/lib/sstep.c b/arch/powerpc/lib/sstep.c
index 3d33fb509ef4..600b036ddfda 100644
--- a/arch/powerpc/lib/sstep.c
+++ b/arch/powerpc/lib/sstep.c
@@ -1169,7 +1169,7 @@ static nokprobe_inline int trap_compare(long v1, long v2)
 int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		  unsigned int instr)
 {
-	unsigned int opcode, ra, rb, rc, rd, spr, u;
+	unsigned int opcode, ra, rb, rd, spr, u;
 	unsigned long int imm;
 	unsigned long int val, val2;
 	unsigned int mb, me, sh;
@@ -1292,7 +1292,6 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 	rd = (instr >> 21) & 0x1f;
 	ra = (instr >> 16) & 0x1f;
 	rb = (instr >> 11) & 0x1f;
-	rc = (instr >> 6) & 0x1f;
 
 	switch (opcode) {
 #ifdef __powerpc64__
@@ -1307,10 +1306,14 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		return 1;
 
 #ifdef __powerpc64__
-	case 4:
+	case 4: {
+		unsigned int rc;
+
 		if (!cpu_has_feature(CPU_FTR_ARCH_300))
 			return -1;
 
+		rc = (instr >> 6) & 0x1f;
+
 		switch (instr & 0x3f) {
 		case 48:	/* maddhd */
 			asm volatile(PPC_MADDHD(%0, %1, %2, %3) :
@@ -1336,6 +1339,7 @@ int analyse_instr(struct instruction_op *op, const struct pt_regs *regs,
 		 * primary opcode which do not have emulation support yet.
 		 */
 		return -1;
+	}
 #endif
 
 	case 7:		/* mulli */
