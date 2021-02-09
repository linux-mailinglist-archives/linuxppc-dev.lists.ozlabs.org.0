Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF8B3158D6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 22:44:55 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZxJ50QwmzDvZl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 08:44:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZxGG3K34zDvXv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 08:43:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZxFz4tx6z9v2d2;
 Tue,  9 Feb 2021 22:43:03 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jvLQhF-fKwFf; Tue,  9 Feb 2021 22:43:03 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZxFz3qdCz9v2d1;
 Tue,  9 Feb 2021 22:43:03 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id AE17910F; Tue,  9 Feb 2021 22:45:56 +0100 (CET)
Received: from 37.171.200.58 ([37.171.200.58]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Tue, 09 Feb 2021 22:45:56 +0100
Date: Tue, 09 Feb 2021 22:45:56 +0100
Message-ID: <20210209224556.Horde.RYCA-pbjVpbTsRo_x8_Msg8@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Christopher M. Riedl" <cmr@codefail.de>
Subject: Re: [PATCH v5 10/10] powerpc/signal64: Use __get_user() to copy
 sigset_t
References: <20210203184323.20792-1-cmr@codefail.de>
 <20210203184323.20792-11-cmr@codefail.de>
In-Reply-To: <20210203184323.20792-11-cmr@codefail.de>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Christopher M. Riedl" <cmr@codefail.de> a =C3=A9crit=C2=A0:

> Usually sigset_t is exactly 8B which is a "trivial" size and does not
> warrant using __copy_from_user(). Use __get_user() directly in
> anticipation of future work to remove the trivial size optimizations
> from __copy_from_user(). Calling __get_user() also results in a small
> boost to signal handling throughput here.
>
> Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> ---
>  arch/powerpc/kernel/signal_64.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_64.c=20=20
>=20b/arch/powerpc/kernel/signal_64.c
> index 817b64e1e409..42fdc4a7ff72 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -97,6 +97,14 @@ static void prepare_setup_sigcontext(struct=20=20
>=20task_struct *tsk, int ctx_has_vsx_re
>  #endif /* CONFIG_VSX */
>  }
>
> +static inline int get_user_sigset(sigset_t *dst, const sigset_t *src)

Should be called __get_user_sigset() as it is a helper for __get_user()

> +{
> +	if (sizeof(sigset_t) <=3D 8)

We should always use __get_user(), see below.

> +		return __get_user(dst->sig[0], &src->sig[0]);

I think the above will not work on ppc32, it will only copy 4 bytes.
You must cast the source to u64*

> +	else
> +		return __copy_from_user(dst, src, sizeof(sigset_t));

I see no point in keeping this alternative. Today sigset_ t is fixed.
If you fear one day someone might change it to something different=20=20
than=20a u64, just add a BUILD_BUG_ON(sizeof(sigset_t) !=3D sizeof(u64));

> +}
> +
>  /*
>   * Set up the sigcontext for the signal frame.
>   */
> @@ -701,8 +709,9 @@ SYSCALL_DEFINE3(swapcontext, struct ucontext=20=20
>=20__user *, old_ctx,
>  	 * We kill the task with a SIGSEGV in this situation.
>  	 */
>
> -	if (__copy_from_user(&set, &new_ctx->uc_sigmask, sizeof(set)))
> +	if (get_user_sigset(&set, &new_ctx->uc_sigmask))
>  		do_exit(SIGSEGV);
> +

This white space is not part of the change, keep patches to the=20=20
minimum,=20avoid cosmetic

>  	set_current_blocked(&set);
>
>  	if (!user_read_access_begin(new_ctx, ctx_size))
> @@ -740,8 +749,9 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  	if (!access_ok(uc, sizeof(*uc)))
>  		goto badframe;
>
> -	if (__copy_from_user(&set, &uc->uc_sigmask, sizeof(set)))
> +	if (get_user_sigset(&set, &uc->uc_sigmask))
>  		goto badframe;
> +

Same

>  	set_current_blocked(&set);
>
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> --
> 2.26.1


