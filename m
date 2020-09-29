Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6A827BB35
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 04:59:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0kcZ3bKvzDqQj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 12:59:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=informatik.wtf (client-ip=68.65.122.19;
 helo=mta-09-3.privateemail.com; envelope-from=cmr@informatik.wtf;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=informatik.wtf
X-Greylist: delayed 531 seconds by postgrey-1.36 at bilbo;
 Tue, 29 Sep 2020 12:57:51 AEST
Received: from MTA-09-3.privateemail.com (mta-09-3.privateemail.com
 [68.65.122.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0kb32nGjzDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 12:57:51 +1000 (AEST)
Received: from MTA-09.privateemail.com (localhost [127.0.0.1])
 by MTA-09.privateemail.com (Postfix) with ESMTP id 5F00460043;
 Mon, 28 Sep 2020 22:57:49 -0400 (EDT)
Received: from localhost (unknown [10.20.151.246])
 by MTA-09.privateemail.com (Postfix) with ESMTPA id CD21E6003F;
 Tue, 29 Sep 2020 02:57:48 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH v2 25/25] powerpc/signal32: Transform save_user_regs()
 and save_tm_user_regs() in 'unsafe' version
From: "Christopher M. Riedl" <cmr@informatik.wtf>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Benjamin
 Herrenschmidt" <benh@kernel.crashing.org>, "Paul Mackerras"
 <paulus@samba.org>, "Michael Ellerman" <mpe@ellerman.id.au>
Date: Mon, 28 Sep 2020 21:55:17 -0500
Message-Id: <C5ZIJ5D6XYSA.191D18GH311GD@geist>
In-Reply-To: <c7b37b385ccf9666066452e58f018a86573f83e8.1597770847.git.christophe.leroy@csgroup.eu>
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
> Change those two functions to be used within a user access block.
>
> For that, change save_general_regs() to and unsafe_save_general_regs(),
> then replace all user accesses by unsafe_ versions.
>
> This series leads to a reduction from 2.55s to 1.73s of
> the system CPU time with the following microbench app
> on an mpc832x with KUAP (approx 32%)
>
> Without KUAP, the difference is in the noise.
>
> void sigusr1(int sig) { }
>
> int main(int argc, char **argv)
> {
> int i =3D 100000;
>
> signal(SIGUSR1, sigusr1);
> for (;i--;)
> raise(SIGUSR1);
> exit(0);
> }
>
> An additional 0.10s reduction is achieved by removing
> CONFIG_PPC_FPU, as the mpc832x has no FPU.
>
> A bit less spectacular on an 8xx as KUAP is less heavy, prior to
> the series (with KUAP) it ran in 8.10 ms. Once applies the removal
> of FPU regs handling, we get 7.05s. With the full series, we get 6.9s.
> If artificially re-activating FPU regs handling with the full series,
> we get 7.6s.
>
> So for the 8xx, the removal of the FPU regs copy is what makes the
> difference, but the rework of handle_signal also have a benefit.
>
> Same as above, without KUAP the difference is in the noise.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> arch/powerpc/kernel/signal_32.c | 224 ++++++++++++++++----------------
> 1 file changed, 111 insertions(+), 113 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_32.c
> b/arch/powerpc/kernel/signal_32.c
> index 86539a4e0514..f795fe0240a1 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -93,8 +93,8 @@ static inline int get_sigset_t(sigset_t *set,
> #define to_user_ptr(p) ptr_to_compat(p)
> #define from_user_ptr(p) compat_ptr(p)
> =20
> -static inline int save_general_regs(struct pt_regs *regs,
> - struct mcontext __user *frame)
> +static __always_inline int
> +save_general_regs_unsafe(struct pt_regs *regs, struct mcontext __user
> *frame)
> {
> elf_greg_t64 *gregs =3D (elf_greg_t64 *)regs;
> int val, i;
> @@ -108,10 +108,12 @@ static inline int save_general_regs(struct pt_regs
> *regs,
> else
> val =3D gregs[i];
> =20
> - if (__put_user(val, &frame->mc_gregs[i]))
> - return -EFAULT;
> + unsafe_put_user(val, &frame->mc_gregs[i], failed);
> }
> return 0;
> +
> +failed:
> + return 1;
> }
> =20
> static inline int restore_general_regs(struct pt_regs *regs,
> @@ -148,11 +150,15 @@ static inline int get_sigset_t(sigset_t *set,
> const sigset_t __user *uset)
> #define to_user_ptr(p) ((unsigned long)(p))
> #define from_user_ptr(p) ((void __user *)(p))
> =20
> -static inline int save_general_regs(struct pt_regs *regs,
> - struct mcontext __user *frame)
> +static __always_inline int
> +save_general_regs_unsafe(struct pt_regs *regs, struct mcontext __user
> *frame)
> {
> WARN_ON(!FULL_REGS(regs));
> - return __copy_to_user(&frame->mc_gregs, regs, GP_REGS_SIZE);
> + unsafe_copy_to_user(&frame->mc_gregs, regs, GP_REGS_SIZE, failed);
> + return 0;
> +
> +failed:
> + return 1;
> }
> =20
> static inline int restore_general_regs(struct pt_regs *regs,
> @@ -170,6 +176,11 @@ static inline int restore_general_regs(struct
> pt_regs *regs,
> }
> #endif
> =20
> +#define unsafe_save_general_regs(regs, frame, label) do { \
> + if (save_general_regs_unsafe(regs, frame)) \

Minor nitpick (sorry); this naming seems a bit strange to me, in x86 it
is "__unsafe_" as a prefix instead of "_unsafe" as a suffix. That sounds
a bit better to me, what do you think? Unless there is some convention I
am not aware of here apart from "unsafe_" using a goto label for errors.

> + goto label; \
> +} while (0)
> +
> /*
> * When we have signals to deliver, we set up on the
> * user stack, going down from the original stack pointer:
> @@ -249,21 +260,19 @@ static void prepare_save_user_regs(int
> ctx_has_vsx_region)
> #endif
> }
> =20
> -static int save_user_regs(struct pt_regs *regs, struct mcontext __user
> *frame,
> - struct mcontext __user *tm_frame, int ctx_has_vsx_region)
> +static int save_user_regs_unsafe(struct pt_regs *regs, struct mcontext
> __user *frame,
> + struct mcontext __user *tm_frame, int ctx_has_vsx_region)
> {
> unsigned long msr =3D regs->msr;
> =20
> /* save general registers */
> - if (save_general_regs(regs, frame))
> - return 1;
> + unsafe_save_general_regs(regs, frame, failed);
> =20
> #ifdef CONFIG_ALTIVEC
> /* save altivec registers */
> if (current->thread.used_vr) {
> - if (__copy_to_user(&frame->mc_vregs, &current->thread.vr_state,
> - ELF_NVRREG * sizeof(vector128)))
> - return 1;
> + unsafe_copy_to_user(&frame->mc_vregs, &current->thread.vr_state,
> + ELF_NVRREG * sizeof(vector128), failed);
> /* set MSR_VEC in the saved MSR value to indicate that
> frame->mc_vregs contains valid data */
> msr |=3D MSR_VEC;
> @@ -276,11 +285,10 @@ static int save_user_regs(struct pt_regs *regs,
> struct mcontext __user *frame,
> * most significant bits of that same vector. --BenH
> * Note that the current VRSAVE value is in the SPR at this point.
> */
> - if (__put_user(current->thread.vrsave, (u32 __user
> *)&frame->mc_vregs[32]))
> - return 1;
> + unsafe_put_user(current->thread.vrsave, (u32 __user
> *)&frame->mc_vregs[32],
> + failed);
> #endif /* CONFIG_ALTIVEC */
> - if (copy_fpr_to_user(&frame->mc_fregs, current))
> - return 1;
> + unsafe_copy_fpr_to_user(&frame->mc_fregs, current, failed);
> =20
> /*
> * Clear the MSR VSX bit to indicate there is no valid state attached
> @@ -295,17 +303,15 @@ static int save_user_regs(struct pt_regs *regs,
> struct mcontext __user *frame,
> * contains valid data
> */
> if (current->thread.used_vsr && ctx_has_vsx_region) {
> - if (copy_vsx_to_user(&frame->mc_vsregs, current))
> - return 1;
> + unsafe_copy_vsx_to_user(&frame->mc_vsregs, current, failed);
> msr |=3D MSR_VSX;
> }
> #endif /* CONFIG_VSX */
> #ifdef CONFIG_SPE
> /* save spe registers */
> if (current->thread.used_spe) {
> - if (__copy_to_user(&frame->mc_vregs, current->thread.evr,
> - ELF_NEVRREG * sizeof(u32)))
> - return 1;
> + unsafe_copy_to_user(&frame->mc_vregs, current->thread.evr,
> + ELF_NEVRREG * sizeof(u32)), failed);
> /* set MSR_SPE in the saved MSR value to indicate that
> frame->mc_vregs contains valid data */
> msr |=3D MSR_SPE;
> @@ -313,21 +319,29 @@ static int save_user_regs(struct pt_regs *regs,
> struct mcontext __user *frame,
> /* else assert((regs->msr & MSR_SPE) =3D=3D 0) */
> =20
> /* We always copy to/from spefscr */
> - if (__put_user(current->thread.spefscr, (u32 __user *)&frame->mc_vregs
> + ELF_NEVRREG))
> - return 1;
> + unsafe_put_user(current->thread.spefscr,
> + (u32 __user *)&frame->mc_vregs + ELF_NEVRREG, failed);
> #endif /* CONFIG_SPE */
> =20
> - if (__put_user(msr, &frame->mc_gregs[PT_MSR]))
> - return 1;
> + unsafe_put_user(msr, &frame->mc_gregs[PT_MSR], failed);
> +
> /* We need to write 0 the MSR top 32 bits in the tm frame so that we
> * can check it on the restore to see if TM is active
> */
> - if (tm_frame && __put_user(0, &tm_frame->mc_gregs[PT_MSR]))
> - return 1;
> + if (tm_frame)
> + unsafe_put_user(0, &tm_frame->mc_gregs[PT_MSR], failed);
> =20
> return 0;
> +
> +failed:
> + return 1;
> }
> =20
> +#define unsafe_save_user_regs(regs, frame, tm_frame, has_vsx, label) do
> { \
> + if (save_user_regs_unsafe(regs, frame, tm_frame, has_vsx)) \
> + goto label; \
> +} while (0)
> +
> #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> /*
> * Save the current user registers on the user stack.
> @@ -336,7 +350,7 @@ static int save_user_regs(struct pt_regs *regs,
> struct mcontext __user *frame,
> * We also save the transactional registers to a second ucontext in the
> * frame.
> *
> - * See save_user_regs() and signal_64.c:setup_tm_sigcontexts().
> + * See save_user_regs_unsafe() and signal_64.c:setup_tm_sigcontexts().
> */
> static void prepare_save_tm_user_regs(void)
> {
> @@ -352,13 +366,12 @@ static void prepare_save_tm_user_regs(void)
> #endif
> }
> =20
> -static int save_tm_user_regs(struct pt_regs *regs, struct mcontext
> __user *frame,
> - struct mcontext __user *tm_frame, unsigned long msr)
> +static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct
> mcontext __user *frame,
> + struct mcontext __user *tm_frame, unsigned long msr)
> {
> /* Save both sets of general registers */
> - if (save_general_regs(&current->thread.ckpt_regs, frame)
> - || save_general_regs(regs, tm_frame))
> - return 1;
> + unsafe_save_general_regs(&current->thread.ckpt_regs, frame, failed);
> + unsafe_save_general_regs(regs, tm_frame, failed);
> =20
> /* Stash the top half of the 64bit MSR into the 32bit MSR word
> * of the transactional mcontext. This way we have a backward-compatible
> @@ -366,26 +379,21 @@ static int save_tm_user_regs(struct pt_regs *regs,
> struct mcontext __user *frame
> * also look at what type of transaction (T or S) was active at the
> * time of the signal.
> */
> - if (__put_user((msr >> 32), &tm_frame->mc_gregs[PT_MSR]))
> - return 1;
> + unsafe_put_user((msr >> 32), &tm_frame->mc_gregs[PT_MSR], failed);
> =20
> #ifdef CONFIG_ALTIVEC
> /* save altivec registers */
> if (current->thread.used_vr) {
> - if (__copy_to_user(&frame->mc_vregs, &current->thread.ckvr_state,
> - ELF_NVRREG * sizeof(vector128)))
> - return 1;
> - if (msr & MSR_VEC) {
> - if (__copy_to_user(&tm_frame->mc_vregs,
> - &current->thread.vr_state,
> - ELF_NVRREG * sizeof(vector128)))
> - return 1;
> - } else {
> - if (__copy_to_user(&tm_frame->mc_vregs,
> - &current->thread.ckvr_state,
> - ELF_NVRREG * sizeof(vector128)))
> - return 1;
> - }
> + unsafe_copy_to_user(&frame->mc_vregs, &current->thread.ckvr_state,
> + ELF_NVRREG * sizeof(vector128), failed);
> + if (msr & MSR_VEC)
> + unsafe_copy_to_user(&tm_frame->mc_vregs,
> + &current->thread.vr_state,
> + ELF_NVRREG * sizeof(vector128), failed);
> + else
> + unsafe_copy_to_user(&tm_frame->mc_vregs,
> + &current->thread.ckvr_state,
> + ELF_NVRREG * sizeof(vector128), failed);
> =20
> /* set MSR_VEC in the saved MSR value to indicate that
> * frame->mc_vregs contains valid data
> @@ -398,29 +406,21 @@ static int save_tm_user_regs(struct pt_regs *regs,
> struct mcontext __user *frame
> * significant bits of a vector, we "cheat" and stuff VRSAVE in the
> * most significant bits of that same vector. --BenH
> */
> - if (__put_user(current->thread.ckvrsave,
> - (u32 __user *)&frame->mc_vregs[32]))
> - return 1;
> - if (msr & MSR_VEC) {
> - if (__put_user(current->thread.vrsave,
> - (u32 __user *)&tm_frame->mc_vregs[32]))
> - return 1;
> - } else {
> - if (__put_user(current->thread.ckvrsave,
> - (u32 __user *)&tm_frame->mc_vregs[32]))
> - return 1;
> - }
> + unsafe_put_user(current->thread.ckvrsave,
> + (u32 __user *)&frame->mc_vregs[32], failed);
> + if (msr & MSR_VEC)
> + unsafe_put_user(current->thread.vrsave,
> + (u32 __user *)&tm_frame->mc_vregs[32], failed);
> + else
> + unsafe_put_user(current->thread.ckvrsave,
> + (u32 __user *)&tm_frame->mc_vregs[32], failed);
> #endif /* CONFIG_ALTIVEC */
> =20
> - if (copy_ckfpr_to_user(&frame->mc_fregs, current))
> - return 1;
> - if (msr & MSR_FP) {
> - if (copy_fpr_to_user(&tm_frame->mc_fregs, current))
> - return 1;
> - } else {
> - if (copy_ckfpr_to_user(&tm_frame->mc_fregs, current))
> - return 1;
> - }
> + unsafe_copy_ckfpr_to_user(&frame->mc_fregs, current, failed);
> + if (msr & MSR_FP)
> + unsafe_copy_fpr_to_user(&tm_frame->mc_fregs, current, failed);
> + else
> + unsafe_copy_ckfpr_to_user(&tm_frame->mc_fregs, current, failed);
> =20
> #ifdef CONFIG_VSX
> /*
> @@ -430,53 +430,54 @@ static int save_tm_user_regs(struct pt_regs *regs,
> struct mcontext __user *frame
> * contains valid data
> */
> if (current->thread.used_vsr) {
> - if (copy_ckvsx_to_user(&frame->mc_vsregs, current))
> - return 1;
> - if (msr & MSR_VSX) {
> - if (copy_vsx_to_user(&tm_frame->mc_vsregs,
> - current))
> - return 1;
> - } else {
> - if (copy_ckvsx_to_user(&tm_frame->mc_vsregs, current))
> - return 1;
> - }
> + unsafe_copy_ckvsx_to_user(&frame->mc_vsregs, current, failed);
> + if (msr & MSR_VSX)
> + unsafe_copy_vsx_to_user(&tm_frame->mc_vsregs, current, failed);
> + else
> + unsafe_copy_ckvsx_to_user(&tm_frame->mc_vsregs, current, failed);
> =20
> msr |=3D MSR_VSX;
> }
> #endif /* CONFIG_VSX */
> #ifdef CONFIG_SPE
> /* SPE regs are not checkpointed with TM, so this section is
> - * simply the same as in save_user_regs().
> + * simply the same as in save_user_regs_unsafe().
> */
> if (current->thread.used_spe) {
> - if (__copy_to_user(&frame->mc_vregs, current->thread.evr,
> - ELF_NEVRREG * sizeof(u32)))
> - return 1;
> + unsafe_copy_to_user(&frame->mc_vregs, current->thread.evr,
> + ELF_NEVRREG * sizeof(u32), failed);
> /* set MSR_SPE in the saved MSR value to indicate that
> * frame->mc_vregs contains valid data */
> msr |=3D MSR_SPE;
> }
> =20
> /* We always copy to/from spefscr */
> - if (__put_user(current->thread.spefscr, (u32 __user *)&frame->mc_vregs
> + ELF_NEVRREG))
> - return 1;
> + unsafe_put_user(current->thread.spefscr,
> + (u32 __user *)&frame->mc_vregs + ELF_NEVRREG, failed);
> #endif /* CONFIG_SPE */
> =20
> - if (__put_user(msr, &frame->mc_gregs[PT_MSR]))
> - return 1;
> + unsafe_put_user(msr, &frame->mc_gregs[PT_MSR], failed);
> =20
> return 0;
> +
> +failed:
> + return 1;
> }
> #else
> static void prepare_save_tm_user_regs(void) { }
> =20
> -static int save_tm_user_regs(struct pt_regs *regs, struct mcontext
> __user *frame,
> - struct mcontext __user *tm_frame, unsigned long msr)
> +static int save_tm_user_regs_unsafe(struct pt_regs *regs, struct
> mcontext __user *frame,
> + struct mcontext __user *tm_frame, unsigned long msr)
> {
> return 0;
> }
> #endif
> =20
> +#define unsafe_save_tm_user_regs(regs, frame, tm_frame, msr, label) do
> { \
> + if (save_tm_user_regs_unsafe(regs, frame, tm_frame, msr)) \
> + goto label; \
> +} while (0)
> +
> /*
> * Restore the current user register values from the user stack,
> * (except for MSR).
> @@ -769,6 +770,11 @@ int handle_rt_signal32(struct ksignal *ksig,
> sigset_t *oldset,
> #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> tm_mctx =3D &frame->uc_transact.uc_mcontext;
> #endif
> + if (MSR_TM_ACTIVE(msr))
> + prepare_save_tm_user_regs();
> + else
> + prepare_save_user_regs(1);
> +
> if (!user_write_access_begin(frame, sizeof(*frame)))
> goto badframe;
> =20
> @@ -788,8 +794,10 @@ int handle_rt_signal32(struct ksignal *ksig,
> sigset_t *oldset,
> unsafe_put_user((unsigned long)tm_mctx,
> &frame->uc_transact.uc_regs, failed);
> #endif
> + unsafe_save_tm_user_regs(regs, mctx, tm_mctx, msr, failed);
> } else {
> unsafe_put_user(0, &frame->uc.uc_link, failed);
> + unsafe_save_user_regs(regs, mctx, tm_mctx, 1, failed);
> }
> =20
> /* Save user registers on the stack */
> @@ -812,15 +820,6 @@ int handle_rt_signal32(struct ksignal *ksig,
> sigset_t *oldset,
> if (tramp =3D=3D (unsigned long)mctx->mc_pad)
> flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
> =20
> - if (MSR_TM_ACTIVE(msr)) {
> - prepare_save_tm_user_regs();
> - if (save_tm_user_regs(regs, mctx, tm_mctx, msr))
> - goto badframe;
> - } else {
> - prepare_save_user_regs(1);
> - if (save_user_regs(regs, mctx, tm_mctx, 1))
> - goto badframe;
> - }
> regs->link =3D tramp;
> =20
> #ifdef CONFIG_PPC_FPU_REGS
> @@ -875,6 +874,11 @@ int handle_signal32(struct ksignal *ksig, sigset_t
> *oldset,
> #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> tm_mctx =3D &frame->mctx_transact;
> #endif
> + if (MSR_TM_ACTIVE(msr))
> + prepare_save_tm_user_regs();
> + else
> + prepare_save_user_regs(1);
> +
> if (!user_write_access_begin(frame, sizeof(*frame)))
> goto badframe;
> sc =3D (struct sigcontext __user *) &frame->sctx;
> @@ -892,6 +896,11 @@ int handle_signal32(struct ksignal *ksig, sigset_t
> *oldset,
> unsafe_put_user(to_user_ptr(mctx), &sc->regs, failed);
> unsafe_put_user(ksig->sig, &sc->signal, failed);
> =20
> + if (MSR_TM_ACTIVE(msr))
> + unsafe_save_tm_user_regs(regs, mctx, tm_mctx, msr, failed);
> + else
> + unsafe_save_user_regs(regs, mctx, tm_mctx, 1, failed);
> +
> if (vdso32_sigtramp && tsk->mm->context.vdso_base) {
> tramp =3D tsk->mm->context.vdso_base + vdso32_sigtramp;
> } else {
> @@ -905,16 +914,6 @@ int handle_signal32(struct ksignal *ksig, sigset_t
> *oldset,
> if (tramp =3D=3D (unsigned long)mctx->mc_pad)
> flush_icache_range(tramp, tramp + 2 * sizeof(unsigned long));
> =20
> - if (MSR_TM_ACTIVE(msr)) {
> - prepare_save_tm_user_regs();
> - if (save_tm_user_regs(regs, mctx, tm_mctx, msr))
> - goto badframe;
> - } else {
> - prepare_save_user_regs(1);
> - if (save_user_regs(regs, mctx, tm_mctx, 1))
> - goto badframe;
> - }
> -
> regs->link =3D tramp;
> =20
> #ifdef CONFIG_PPC_FPU_REGS
> @@ -1066,10 +1065,9 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext
> __user *, old_ctx,
> mctx =3D (struct mcontext __user *)
> ((unsigned long) &old_ctx->uc_mcontext & ~0xfUL);
> prepare_save_user_regs(ctx_has_vsx_region);
> - if (save_user_regs(regs, mctx, NULL, ctx_has_vsx_region))
> - return -EFAULT;
> if (!user_write_access_begin(old_ctx, ctx_size))
> return -EFAULT;
> + unsafe_save_user_regs(regs, mctx, NULL, ctx_has_vsx_region, failed);
> unsafe_put_sigset_t(&old_ctx->uc_sigmask, &current->blocked, failed);
> unsafe_put_user(to_user_ptr(mctx), &old_ctx->uc_regs, failed);
> user_write_access_end();
> --
> 2.25.0

