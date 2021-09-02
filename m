Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A62503FF411
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 21:21:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H0rQT3fckz2yxT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 05:21:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.232;
 helo=out02.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Received: from out02.mta.xmission.com (out02.mta.xmission.com [166.70.13.232])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H0rPy6slpz2yHf
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 05:21:26 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52]:59228)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mLrbs-00AOHQ-FC; Thu, 02 Sep 2021 12:38:48 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:33754
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mLrbr-00BVCf-8A; Thu, 02 Sep 2021 12:38:48 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <fd7938d94008711d441551c06b25a033669a0618.1629732940.git.christophe.leroy@csgroup.eu>
 <7d391d915d2bd1c0f601f55f61f8dd4c70066229.1629732940.git.christophe.leroy@csgroup.eu>
Date: Thu, 02 Sep 2021 13:38:40 -0500
In-Reply-To: <7d391d915d2bd1c0f601f55f61f8dd4c70066229.1629732940.git.christophe.leroy@csgroup.eu>
 (Christophe Leroy's message of "Mon, 23 Aug 2021 15:35:55 +0000
 (UTC)")
Message-ID: <87y28ex1ov.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1mLrbr-00BVCf-8A; ; ; mid=<87y28ex1ov.fsf@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/JbCUfWpO6Fsqk7Caq1QaH7v2nM7V7vug=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa08.xmission.com
X-Spam-Level: ****
X-Spam-Status: No, score=4.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,T_TooManySym_03,XMGappySubj_01,XMGappySubj_02,
 XMSubLong,XM_B_SpammyTLD,XM_B_SpammyWords,XM_Body_Dirty_Words
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.5 XMGappySubj_01 Very gappy subject
 *  0.7 XMSubLong Long Subject
 *  1.0 XMGappySubj_02 Gappier still
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa08 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  1.0 XM_Body_Dirty_Words Contains a dirty word
 *  1.0 XM_B_SpammyTLD Contains uncommon/spammy TLD
X-Spam-DCC: XMission; sa08 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ****;Christophe Leroy <christophe.leroy@csgroup.eu>
X-Spam-Relay-Country: 
X-Spam-Timing: total 664 ms - load_scoreonly_sql: 0.06 (0.0%),
 signal_user_changed: 13 (2.0%), b_tie_ro: 11 (1.6%), parse: 1.11
 (0.2%), extract_message_metadata: 18 (2.7%), get_uri_detail_list: 1.96
 (0.3%), tests_pri_-1000: 16 (2.4%), tests_pri_-950: 1.57 (0.2%),
 tests_pri_-900: 1.36 (0.2%), tests_pri_-90: 106 (16.0%), check_bayes:
 103 (15.6%), b_tokenize: 7 (1.1%), b_tok_get_all: 8 (1.2%),
 b_comp_prob: 2.3 (0.3%), b_tok_touch_all: 80 (12.1%), b_finish: 1.48
 (0.2%), tests_pri_0: 339 (51.0%), check_dkim_signature: 0.61 (0.1%),
 check_dkim_adsp: 3.6 (0.5%), poll_dns_idle: 138 (20.7%), tests_pri_10:
 2.1 (0.3%), tests_pri_500: 163 (24.5%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH v2 5/5] powerpc/signal: Use unsafe_copy_siginfo_to_user()
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in02.mta.xmission.com)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Use unsafe_copy_siginfo_to_user() in order to do the copy
> within the user access block.
>
> On an mpc 8321 (book3s/32) the improvment is about 5% on a process
> sending a signal to itself.

Nacked-by: "Eric W. Biederman" <ebiederm@xmission.com>

copy_siginfo_to_user is not the same as copy_siginfo_to_user32.

As in this patch breaks 32bit userspace on powerpc.


> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/signal_32.c | 13 ++++++-------
>  arch/powerpc/kernel/signal_64.c |  5 +----
>  2 files changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> index ff101e2b3bab..f9e16d108bc8 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -710,12 +710,6 @@ static long restore_tm_user_regs(struct pt_regs *regs, struct mcontext __user *s
>  }
>  #endif
>  
> -#ifdef CONFIG_PPC64
> -
> -#define copy_siginfo_to_user	copy_siginfo_to_user32
> -
> -#endif /* CONFIG_PPC64 */
> -
>  /*
>   * Set up a signal frame for a "real-time" signal handler
>   * (one which gets siginfo).
> @@ -779,14 +773,19 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>  		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
>  	}
>  	unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
> +#ifndef CONFIG_COMPAT
> +	unsafe_copy_siginfo_to_user(&frame->info, &ksig->info, failed);
> +#endif
>  
>  	/* create a stack frame for the caller of the handler */
>  	unsafe_put_user(regs->gpr[1], newsp, failed);
>  
>  	user_access_end();
>  
> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
> +#ifdef CONFIG_COMPAT
> +	if (copy_siginfo_to_user32(&frame->info, &ksig->info))
>  		goto badframe;
> +#endif
>  
>  	regs->link = tramp;
>  
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index 2cca6c8febe1..82b73fbd937d 100644
> --- a/arch/powerpc/kernel/signal_64.c
> +++ b/arch/powerpc/kernel/signal_64.c
> @@ -901,15 +901,12 @@ int handle_rt_signal64(struct ksignal *ksig, sigset_t *set,
>  	}
>  
>  	unsafe_copy_to_user(&frame->uc.uc_sigmask, set, sizeof(*set), badframe_block);
> +	unsafe_copy_siginfo_to_user(&frame->info, &ksig->info, badframe_block);
>  	/* Allocate a dummy caller frame for the signal handler. */
>  	unsafe_put_user(regs->gpr[1], newsp, badframe_block);
>  
>  	user_write_access_end();
>  
> -	/* Save the siginfo outside of the unsafe block. */
> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
> -		goto badframe;
> -
>  	/* Make sure signal handler doesn't get spurious FP exceptions */
>  	tsk->thread.fp_state.fpscr = 0;
