Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E5527BB3C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 05:01:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0kgH1lmBzDqRm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 13:01:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=131.153.2.42;
 helo=h1.fbrelay.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
X-Greylist: delayed 640 seconds by postgrey-1.36 at bilbo;
 Tue, 29 Sep 2020 12:59:47 AEST
Received: from h1.fbrelay.privateemail.com (h1.fbrelay.privateemail.com
 [131.153.2.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0kdH4txYzDqLY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 12:59:47 +1000 (AEST)
Received: from MTA-09-3.privateemail.com (mta-09.privateemail.com
 [198.54.127.58])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 4AEA380CA7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Sep 2020 22:49:04 -0400 (EDT)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 584A160045;
 Mon, 28 Sep 2020 22:48:57 -0400 (EDT)
Received: from localhost (unknown [10.20.151.217])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id CE3C060034;
 Tue, 29 Sep 2020 02:48:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v2 23/25] powerpc/signal: Create 'unsafe' versions of
 copy_[ck][fpr/vsx]_to_user()
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, "Paul Mackerras"
 <paulus@samba.org>, "Michael Ellerman" <mpe@ellerman.id.au>
Date: Mon, 28 Sep 2020 21:04:37 -0500
Message-Id: <C5ZHGD1JVX0H.1UI1PWMZN73UX@geist>
In-Reply-To: <29f6c4b8e7a5bbc61e6a8801b78bbf493f9f819e.1597770847.git.christophe.leroy@csgroup.eu>
X-Virus-Scanned: ClamAV using ClamSMTP
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

On Tue Aug 18, 2020 at 12:19 PM CDT, Christophe Leroy wrote:
> For the non VSX version, that's trivial. Just use unsafe_copy_to_user()
> instead of __copy_to_user().
>
> For the VSX version, remove the intermediate step through a buffer and
> use unsafe_put_user() directly. This generates a far smaller code which
> is acceptable to inline, see below:
>
> Standard VSX version:
>
> 0000000000000000 <.copy_fpr_to_user>:
> 0: 7c 08 02 a6 mflr r0
> 4: fb e1 ff f8 std r31,-8(r1)
> 8: 39 00 00 20 li r8,32
> c: 39 24 0b 80 addi r9,r4,2944
> 10: 7d 09 03 a6 mtctr r8
> 14: f8 01 00 10 std r0,16(r1)
> 18: f8 21 fe 71 stdu r1,-400(r1)
> 1c: 39 41 00 68 addi r10,r1,104
> 20: e9 09 00 00 ld r8,0(r9)
> 24: 39 4a 00 08 addi r10,r10,8
> 28: 39 29 00 10 addi r9,r9,16
> 2c: f9 0a 00 00 std r8,0(r10)
> 30: 42 00 ff f0 bdnz 20 <.copy_fpr_to_user+0x20>
> 34: e9 24 0d 80 ld r9,3456(r4)
> 38: 3d 42 00 00 addis r10,r2,0
> 3a: R_PPC64_TOC16_HA .toc
> 3c: eb ea 00 00 ld r31,0(r10)
> 3e: R_PPC64_TOC16_LO_DS .toc
> 40: f9 21 01 70 std r9,368(r1)
> 44: e9 3f 00 00 ld r9,0(r31)
> 48: 81 29 00 20 lwz r9,32(r9)
> 4c: 2f 89 00 00 cmpwi cr7,r9,0
> 50: 40 9c 00 18 bge cr7,68 <.copy_fpr_to_user+0x68>
> 54: 4c 00 01 2c isync
> 58: 3d 20 40 00 lis r9,16384
> 5c: 79 29 07 c6 rldicr r9,r9,32,31
> 60: 7d 3d 03 a6 mtspr 29,r9
> 64: 4c 00 01 2c isync
> 68: 38 a0 01 08 li r5,264
> 6c: 38 81 00 70 addi r4,r1,112
> 70: 48 00 00 01 bl 70 <.copy_fpr_to_user+0x70>
> 70: R_PPC64_REL24 .__copy_tofrom_user
> 74: 60 00 00 00 nop
> 78: e9 3f 00 00 ld r9,0(r31)
> 7c: 81 29 00 20 lwz r9,32(r9)
> 80: 2f 89 00 00 cmpwi cr7,r9,0
> 84: 40 9c 00 18 bge cr7,9c <.copy_fpr_to_user+0x9c>
> 88: 4c 00 01 2c isync
> 8c: 39 20 ff ff li r9,-1
> 90: 79 29 00 44 rldicr r9,r9,0,1
> 94: 7d 3d 03 a6 mtspr 29,r9
> 98: 4c 00 01 2c isync
> 9c: 38 21 01 90 addi r1,r1,400
> a0: e8 01 00 10 ld r0,16(r1)
> a4: eb e1 ff f8 ld r31,-8(r1)
> a8: 7c 08 03 a6 mtlr r0
> ac: 4e 80 00 20 blr
>
> 'unsafe' simulated VSX version (The ... are only nops) using
> unsafe_copy_fpr_to_user() macro:
>
> unsigned long copy_fpr_to_user(void __user *to,
> struct task_struct *task)
> {
> unsafe_copy_fpr_to_user(to, task, failed);
> return 0;
> failed:
> return 1;
> }
>
> 0000000000000000 <.copy_fpr_to_user>:
> 0: 39 00 00 20 li r8,32
> 4: 39 44 0b 80 addi r10,r4,2944
> 8: 7d 09 03 a6 mtctr r8
> c: 7c 69 1b 78 mr r9,r3
> ...
> 20: e9 0a 00 00 ld r8,0(r10)
> 24: f9 09 00 00 std r8,0(r9)
> 28: 39 4a 00 10 addi r10,r10,16
> 2c: 39 29 00 08 addi r9,r9,8
> 30: 42 00 ff f0 bdnz 20 <.copy_fpr_to_user+0x20>
> 34: e9 24 0d 80 ld r9,3456(r4)
> 38: f9 23 01 00 std r9,256(r3)
> 3c: 38 60 00 00 li r3,0
> 40: 4e 80 00 20 blr
> ...
> 50: 38 60 00 01 li r3,1
> 54: 4e 80 00 20 blr
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> arch/powerpc/kernel/signal.h | 53 ++++++++++++++++++++++++++++++++++++
> 1 file changed, 53 insertions(+)
>
> diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
> index f610cfafa478..2559a681536e 100644
> --- a/arch/powerpc/kernel/signal.h
> +++ b/arch/powerpc/kernel/signal.h
> @@ -32,7 +32,54 @@ unsigned long copy_fpr_to_user(void __user *to,
> struct task_struct *task);
> unsigned long copy_ckfpr_to_user(void __user *to, struct task_struct
> *task);
> unsigned long copy_fpr_from_user(struct task_struct *task, void __user
> *from);
> unsigned long copy_ckfpr_from_user(struct task_struct *task, void __user
> *from);
> +
> +#define unsafe_copy_fpr_to_user(to, task, label) do { \
> + struct task_struct *__t =3D task; \
> + u64 __user *buf =3D (u64 __user *)to; \
> + int i; \
> + \
> + for (i =3D 0; i < ELF_NFPREG - 1 ; i++) \
> + unsafe_put_user(__t->thread.TS_FPR(i), &buf[i], label); \
> + unsafe_put_user(__t->thread.fp_state.fpscr, &buf[i], label); \
> +} while (0)
> +

I've been working on the PPC64 side of this "unsafe" rework using this
series as a basis. One question here - I don't really understand what
the benefit of re-implementing this logic in macros (similarly for the
other copy_* functions below) is?

I am considering  a "__unsafe_copy_*" implementation in signal.c for
each (just the original implementation w/ using the "unsafe_" variants
of the uaccess stuff) which gets called by the "safe" functions w/ the
appropriate "user_*_access_begin/user_*_access_end". Something like
(pseudo-ish code):

	/* signal.c */
	unsigned long __unsafe_copy_fpr_to_user(...)
	{
		...
		unsafe_copy_to_user(..., bad);
		return 0;
	bad:
		return 1; /* -EFAULT? */
	}

	unsigned long copy_fpr_to_user(...)
	{
		unsigned long err;
		if (!user_write_access_begin(...))
			return 1; /* -EFAULT? */

		err =3D __unsafe_copy_fpr_to_user(...);

		user_write_access_end();
		return err;
	}

	/* signal.h */
	unsigned long __unsafe_copy_fpr_to_user(...);
	#define unsafe_copy_fpr_to_user(..., label) \
		unsafe_op_wrap(__unsafe_copy_fpr_to_user(...), label)

This way there is a single implementation for each copy routine "body".
The "unsafe" wrappers then just exist as simple macros similar to what
x86 does: "unsafe_" macro wraps "__unsafe" functions for the goto label.

Granted this does pollute "signal.h" w/ the "__unsafe_copy_*"
prototypes...

> +#define unsafe_copy_vsx_to_user(to, task, label) do { \
> + struct task_struct *__t =3D task; \
> + u64 __user *buf =3D (u64 __user *)to; \
> + int i; \
> + \
> + for (i =3D 0; i < ELF_NVSRHALFREG ; i++) \
> + unsafe_put_user(__t->thread.fp_state.fpr[i][TS_VSRLOWOFFSET], \
> + &buf[i], label);\
> +} while (0)
> +
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +#define unsafe_copy_ckfpr_to_user(to, task, label) do { \
> + struct task_struct *__t =3D task; \
> + u64 __user *buf =3D (u64 __user *)to; \
> + int i; \
> + \
> + for (i =3D 0; i < ELF_NFPREG - 1 ; i++) \
> + unsafe_put_user(__t->thread.TS_CKFPR(i), &buf[i], label);\
> + unsafe_put_user(__t->thread.ckfp_state.fpscr, &buf[i], label); \
> +} while (0)
> +
> +#define unsafe_copy_ckvsx_to_user(to, task, label) do { \
> + struct task_struct *__t =3D task; \
> + u64 __user *buf =3D (u64 __user *)to; \
> + int i; \
> + \
> + for (i =3D 0; i < ELF_NVSRHALFREG ; i++) \
> + unsafe_put_user(__t->thread.ckfp_state.fpr[i][TS_VSRLOWOFFSET], \
> + &buf[i], label);\
> +} while (0)
> +#endif
> #elif defined(CONFIG_PPC_FPU_REGS)
> +
> +#define unsafe_copy_fpr_to_user(to, task, label) \
> + unsafe_copy_to_user(to, (task)->thread.fp_state.fpr, \
> + ELF_NFPREG * sizeof(double), label)
> +
> static inline unsigned long
> copy_fpr_to_user(void __user *to, struct task_struct *task)
> {
> @@ -48,6 +95,10 @@ copy_fpr_from_user(struct task_struct *task, void
> __user *from)
> }
> =20
> #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +#define unsafe_copy_ckfpr_to_user(to, task, label) \
> + unsafe_copy_to_user(to, (task)->thread.ckfp_state.fpr, \
> + ELF_NFPREG * sizeof(double), label)
> +
> inline unsigned long copy_ckfpr_to_user(void __user *to, struct
> task_struct *task)
> {
> return __copy_to_user(to, task->thread.ckfp_state.fpr,
> @@ -62,6 +113,8 @@ copy_ckfpr_from_user(struct task_struct *task, void
> __user *from)
> }
> #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> #else
> +#define unsafe_copy_fpr_to_user(to, task, label) do { } while (0)
> +
> static inline unsigned long
> copy_fpr_to_user(void __user *to, struct task_struct *task)
> {
> --
> 2.25.0

