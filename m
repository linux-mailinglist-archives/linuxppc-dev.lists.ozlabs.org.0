Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 501253F80E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 05:22:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw7SS20qKz2ywK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 13:22:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=eOyho0rn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=eOyho0rn; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw7Rn28Fpz2xrt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 13:21:40 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gw7Rm2DYdz9sXM;
 Thu, 26 Aug 2021 13:21:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1629948100;
 bh=QCKuYO49EzpviKloBW7OjMG6hSH9NX8bM9ziXOwpQIk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=eOyho0rnj5IPA0GAK55qXt7yqS4gYpDMS58B6UTJ2Q7QDD3RGLnc/h4wcWdG0DVkJ
 +L4sUDf8SkXjx9QBiqaooAxy9Mcp+o0zJmfp6Rz5G0vcjrbQp15DktsWHhc/A5DUtZ
 Zet0vaUc8i9D+GVMDS8b5bL7LtDgAqLb2sPV2hlGwTPaR5SqRrlD/WpS0dm3s2BuLL
 IpbNtJ1XFERXf7yZo7BmAcTV0CIZW4qtZkkPkzzSAoD3A4XsSNxe2PqEDCw8lUosVF
 jwFpuUndCwMe3rilAiP2nmb03aC3VFSHBRYYO9j1gyDnEXiyL3Zn05gkk6AN3XZ0wQ
 NMGF8e4DPHCWQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 2/2] powerpc/bug: Provide better flexibility to
 WARN_ON/__WARN_FLAGS() with asm goto
In-Reply-To: <YSa1O4fcX1nNKqN/@Ryzen-9-3900X.localdomain>
References: <b286e07fb771a664b631cd07a40b09c06f26e64b.1618331881.git.christophe.leroy@csgroup.eu>
 <389962b1b702e3c78d169e59bcfac56282889173.1618331882.git.christophe.leroy@csgroup.eu>
 <YSa1O4fcX1nNKqN/@Ryzen-9-3900X.localdomain>
Date: Thu, 26 Aug 2021 13:21:39 +1000
Message-ID: <87h7fcc2m4.fsf@mpe.ellerman.id.au>
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
Cc: llvm@lists.linux.dev, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Chancellor <nathan@kernel.org> writes:
> On Tue, Apr 13, 2021 at 04:38:10PM +0000, Christophe Leroy wrote:
>> Using asm goto in __WARN_FLAGS() and WARN_ON() allows more
>> flexibility to GCC.
...
>
> This patch as commit 1e688dd2a3d6 ("powerpc/bug: Provide better
> flexibility to WARN_ON/__WARN_FLAGS() with asm goto") cause a WARN_ON in
> klist_add_tail to trigger over and over on boot when compiling with
> clang:
>
> [    2.177416][    T1] WARNING: CPU: 0 PID: 1 at lib/klist.c:62 .klist_add_tail+0x3c/0x110
> [    2.177456][    T1] Modules linked in:
> [    2.177481][    T1] CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.14.0-rc7-next-20210825 #1
> [    2.177520][    T1] NIP:  c0000000007ff81c LR: c00000000090a038 CTR: 0000000000000000
> [    2.177557][    T1] REGS: c0000000073c32a0 TRAP: 0700   Tainted: G        W          (5.14.0-rc7-next-20210825)
> [    2.177593][    T1] MSR:  8000000002029032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 22000a40  XER: 00000000
> [    2.177667][    T1] CFAR: c00000000090a034 IRQMASK: 0
> [    2.177667][    T1] GPR00: c00000000090a038 c0000000073c3540 c000000001be3200 0000000000000001
> [    2.177667][    T1] GPR04: c0000000072d65c0 0000000000000000 c0000000091ba798 c0000000091bb0a0
> [    2.177667][    T1] GPR08: 0000000000000001 0000000000000000 c000000008581918 fffffffffffffc00
> [    2.177667][    T1] GPR12: 0000000044000240 c000000001dd0000 c000000000012300 0000000000000000
> [    2.177667][    T1] GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    2.177667][    T1] GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
> [    2.177667][    T1] GPR24: 0000000000000000 c0000000017e3200 0000000000000000 c000000001a0e778
> [    2.177667][    T1] GPR28: c0000000072d65b0 c0000000072d65a8 c000000007de72c8 c0000000073c35d0
> [    2.178019][    T1] NIP [c0000000007ff81c] .klist_add_tail+0x3c/0x110
> [    2.178058][    T1] LR [c00000000090a038] .bus_add_driver+0x148/0x290
> [    2.178088][    T1] Call Trace:
> [    2.178105][    T1] [c0000000073c3540] [c0000000073c35d0] 0xc0000000073c35d0 (unreliable)
> [    2.178150][    T1] [c0000000073c35d0] [c00000000090a038] .bus_add_driver+0x148/0x290
> [    2.178190][    T1] [c0000000073c3670] [c00000000090fae8] .driver_register+0xb8/0x190
> [    2.178234][    T1] [c0000000073c3700] [c000000000be55c0] .__hid_register_driver+0x70/0xd0
> [    2.178275][    T1] [c0000000073c37a0] [c00000000116955c] .redragon_driver_init+0x34/0x58
> [    2.178314][    T1] [c0000000073c3820] [c000000000011ae0] .do_one_initcall+0x130/0x3b0
> [    2.178357][    T1] [c0000000073c3bb0] [c0000000011065e0] .do_initcall_level+0xd8/0x188
> [    2.178403][    T1] [c0000000073c3c50] [c0000000011064a8] .do_initcalls+0x7c/0xdc
> [    2.178445][    T1] [c0000000073c3ce0] [c000000001106238] .kernel_init_freeable+0x178/0x21c
> [    2.178491][    T1] [c0000000073c3d90] [c000000000012334] .kernel_init+0x34/0x220
> [    2.178530][    T1] [c0000000073c3e10] [c00000000000cf50] .ret_from_kernel_thread+0x58/0x60
> [    2.178569][    T1] Instruction dump:
> [    2.178592][    T1] fba10078 7c7d1b78 38600001 fb810070 3b9d0008 fbc10080 7c9e2378 389d0018
> [    2.178662][    T1] fb9d0008 fb9d0010 90640000 fbdd0000 <0b1e0000> e87e0018 28230000 41820024
> [    2.178728][    T1] ---[ end trace 52ed3431f58f1847 ]---
>
> Is this a bug with clang or is there something wrong with the patch? The
> vmlinux image is available at [1] if you want to inspect it and our QEMU
> command and the warning at boot can be viewed at [2]. If there is any
> other information I can provide, please let me know.
>
> [1] https://builds.tuxbuild.com/1xDcmp3Tvno0TTGxDVPedRKIKM2/
> [2] https://github.com/ClangBuiltLinux/continuous-integration2/commit/cee159b66a58eb57fa2359e7888074b9da24126c/checks/3422232736/logs

Thanks.

This is the generated assembly:

c0000000007ff600 <.klist_add_tail>:
c0000000007ff600:       7c 08 02 a6     mflr    r0
c0000000007ff604:       f8 01 00 10     std     r0,16(r1)
c0000000007ff608:       f8 21 ff 71     stdu    r1,-144(r1)	^ prolog
c0000000007ff60c:       fb a1 00 78     std     r29,120(r1)	save r29 to stack
c0000000007ff610:       7c 7d 1b 78     mr      r29,r3		r29 = struct klist_node *n
c0000000007ff614:       38 60 00 01     li      r3,1		r3 = 1
c0000000007ff618:       fb 81 00 70     std     r28,112(r1)	save r28 to stack
c0000000007ff61c:       3b 9d 00 08     addi    r28,r29,8	r28 = &n->n_node
c0000000007ff620:       fb c1 00 80     std     r30,128(r1)	save r30 to stack
c0000000007ff624:       7c 9e 23 78     mr      r30,r4		r30 = struct klist *k
c0000000007ff628:       38 9d 00 18     addi    r4,r29,24	r4 = &n->n_ref
c0000000007ff62c:       fb 9d 00 08     std     r28,8(r29)	n->n_node.next = &n->n_node	INIT_LIST_HEAD
c0000000007ff630:       fb 9d 00 10     std     r28,16(r29)	n->n_node.prev = &n->n_node
c0000000007ff634:       90 64 00 00     stw     r3,0(r4)	kref_init(&n->n_ref)
c0000000007ff638:       fb dd 00 00     std     r30,0(r29)	n->n_klist = k
c0000000007ff63c:       0b 1e 00 00     tdnei   r30,0		trap if r30 (k) is not zero


From:

static void knode_set_klist(struct klist_node *knode, struct klist *klist)
{
	knode->n_klist = klist;
	/* no knode deserves to start its life dead */
	WARN_ON(knode_dead(knode));
                ^^^^^^^^^^^^^^^^^
}

Which expands to:

static void knode_set_klist(struct klist_node *knode, struct klist *klist)
{
	knode->n_klist = klist;

	({
		bool __ret_warn_on = false;
		do {
                ...
			} else {
				__label__ __label_warn_on;
				do {
					asm goto(
						"1:   "
						"tdnei"
						"
						" " % 4,
						0 " "\n " ".section __ex_table,\"a\";"
										" "
										".balign 4;"
										" "
										".long (1b) - . ;"
										" "
										".long (%l[__label_warn_on]) - . ;"
										" "
										".previous"
										" "
										".section __bug_table,\"aw\"\n"
										"2:\t.4byte 1b - 2b, %0 - 2b\n"
										"\t.short %1, %2\n"
										".org 2b+%3\n"
										".previous\n"
						:
						: "i"("lib/klist.c"), "i"(62),
						  "i"((1 << 0) | ((9) << 8)),
						  "i"(sizeof(struct bug_entry)),
						  "r"(knode_dead(knode))
                                                  ^^^^^^^^^^^^^^^^^^^^^

						:
						: __label_warn_on);
					asm("");
				} while (0);
				break;
			__label_warn_on:
				__ret_warn_on = true;
			}
		} while (0);
		__builtin_expect(!!(__ret_warn_on), 0);
	});
}

And knode_dead is:

#define KNODE_DEAD		1LU

static bool knode_dead(struct klist_node *knode)
{
	return (unsigned long)knode->n_klist & KNODE_DEAD;
}


So it's meant to warn if (n_klist & KNODE_DEAD) is not equal to zero.

But in the asm:

c0000000007ff600 <.klist_add_tail>:
...
c0000000007ff624:       7c 9e 23 78     mr      r30,r4		r30 = struct klist *k
...
c0000000007ff638:       fb dd 00 00     std     r30,0(r29)	n->n_klist = k
c0000000007ff63c:       0b 1e 00 00     tdnei   r30,0		trap if r30 (k) is not zero


It's just warning if n_klist is not equal to zero. ie. we lost the "& KNODE_DEAD".

In the GCC output you can see it:

c0000000008c8a30 <.klist_node_init>:
c0000000008c8a30:       39 24 00 08     addi    r9,r4,8
c0000000008c8a34:       39 40 00 01     li      r10,1
c0000000008c8a38:       f9 24 00 08     std     r9,8(r4)
c0000000008c8a3c:       f9 24 00 10     std     r9,16(r4)
c0000000008c8a40:       91 44 00 18     stw     r10,24(r4)
c0000000008c8a44:       f8 64 00 00     std     r3,0(r4)
c0000000008c8a48:       54 69 07 fe     clrlwi  r9,r3,31
c0000000008c8a4c:       0b 09 00 00     tdnei   r9,0

ie. the clrlwi is "clear left (word) immediate", and zeroes everything
except bit 0, which is equivalent to "& KNODE_DEAD".


So there seems to be some misunderstanding with clang, it doesn't like
us passing an expression to the inline asm.

AFAIK it is legal to pass expressions as inputs to inline asm, ie. it
doesn't have to just be a variable name.

This patch seems to fix it. Not sure if that's just papering over it though.

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 1ee0f22313ee..75fcb4370d96 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -119,7 +119,7 @@ __label_warn_on:						\
 								\
 			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
 				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
-				   __label_warn_on, "r" (x));	\
+				   __label_warn_on, "r" (!!(x))); \
 			break;					\
 __label_warn_on:						\
 			__ret_warn_on = true;			\


Generates:

c0000000008e2ac0 <.klist_add_tail>:
c0000000008e2ac0:       7c 08 02 a6     mflr    r0
c0000000008e2ac4:       f8 01 00 10     std     r0,16(r1)
c0000000008e2ac8:       f8 21 ff 71     stdu    r1,-144(r1)
c0000000008e2acc:       fb a1 00 78     std     r29,120(r1)
c0000000008e2ad0:       7c 7d 1b 78     mr      r29,r3
c0000000008e2ad4:       38 60 00 01     li      r3,1
c0000000008e2ad8:       fb c1 00 80     std     r30,128(r1)
c0000000008e2adc:       7c 9e 23 78     mr      r30,r4
c0000000008e2ae0:       38 9d 00 18     addi    r4,r29,24
c0000000008e2ae4:       57 c5 07 fe     clrlwi  r5,r30,31	<-
c0000000008e2ae8:       fb 81 00 70     std     r28,112(r1)
c0000000008e2aec:       3b 9d 00 08     addi    r28,r29,8
c0000000008e2af0:       fb 9d 00 08     std     r28,8(r29)
c0000000008e2af4:       fb 9d 00 10     std     r28,16(r29)
c0000000008e2af8:       90 64 00 00     stw     r3,0(r4)
c0000000008e2afc:       fb dd 00 00     std     r30,0(r29)
c0000000008e2b00:       0b 05 00 00     tdnei   r5,0		<-


cheers
