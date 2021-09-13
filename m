Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A48FB409825
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 17:58:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7WNK4ZY3z2yJ2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 01:58:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=xmission.com (client-ip=166.70.13.231;
 helo=out01.mta.xmission.com; envelope-from=ebiederm@xmission.com;
 receiver=<UNKNOWN>)
Received: from out01.mta.xmission.com (out01.mta.xmission.com [166.70.13.231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7WMt5ssHz2xg3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 01:57:46 +1000 (AEST)
Received: from in02.mta.xmission.com ([166.70.13.52]:51648)
 by out01.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mPoL1-00EMON-OJ; Mon, 13 Sep 2021 09:57:43 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:45876
 helo=email.xmission.com)
 by in02.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mPoL0-00GBua-QW; Mon, 13 Sep 2021 09:57:43 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <1718f38859d5366f82d5bef531f255cedf537b5d.1631537060.git.christophe.leroy@csgroup.eu>
 <2b179deba4fd4ec0868cdc48a0230dfa3aa5a22f.1631537060.git.christophe.leroy@csgroup.eu>
Date: Mon, 13 Sep 2021 10:57:37 -0500
In-Reply-To: <2b179deba4fd4ec0868cdc48a0230dfa3aa5a22f.1631537060.git.christophe.leroy@csgroup.eu>
 (Christophe Leroy's message of "Mon, 13 Sep 2021 17:19:10 +0200")
Message-ID: <87h7eopixa.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1mPoL0-00GBua-QW; ; ; mid=<87h7eopixa.fsf@disp2133>; ; ;
 hst=in02.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1+2aLQKonoyRKYyT9Bl2KfaiJM7slM3fTo=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa06.xmission.com
X-Spam-Level: ****
X-Spam-Status: No, score=4.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,T_TooManySym_03,XMGappySubj_01,XMGappySubj_02,
 XMSubLong,XM_B_SpammyTLD,XM_B_SpammyWords,XM_Body_Dirty_Words
 autolearn=disabled version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.5000] *  0.5 XMGappySubj_01 Very gappy subject
 *  1.0 XMGappySubj_02 Gappier still
 *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa06 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  1.0 XM_Body_Dirty_Words Contains a dirty word
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  1.0 XM_B_SpammyTLD Contains uncommon/spammy TLD
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
X-Spam-DCC: XMission; sa06 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ****;Christophe Leroy <christophe.leroy@csgroup.eu>
X-Spam-Relay-Country: 
X-Spam-Timing: total 379 ms - load_scoreonly_sql: 0.04 (0.0%),
 signal_user_changed: 11 (2.9%), b_tie_ro: 9 (2.5%), parse: 0.90 (0.2%),
 extract_message_metadata: 12 (3.1%), get_uri_detail_list: 1.61 (0.4%),
 tests_pri_-1000: 11 (2.9%), tests_pri_-950: 1.26 (0.3%),
 tests_pri_-900: 1.05 (0.3%), tests_pri_-90: 60 (15.9%), check_bayes:
 59 (15.5%), b_tokenize: 8 (2.0%), b_tok_get_all: 7 (1.7%),
 b_comp_prob: 3.8 (1.0%), b_tok_touch_all: 37 (9.7%), b_finish: 0.95
 (0.3%), tests_pri_0: 267 (70.5%), check_dkim_signature: 0.55 (0.1%),
 check_dkim_adsp: 2.5 (0.7%), poll_dns_idle: 0.55 (0.1%), tests_pri_10:
 2.1 (0.6%), tests_pri_500: 9 (2.4%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH RESEND v3 6/6] powerpc/signal: Use
 unsafe_copy_siginfo_to_user()
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
Cc: linux-kernel@vger.kernel.org, hch@infradead.org,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Use unsafe_copy_siginfo_to_user() in order to do the copy
> within the user access block.
>
> On an mpc 8321 (book3s/32) the improvment is about 5% on a process
> sending a signal to itself.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v3: Don't leave compat aside, use the new unsafe_copy_siginfo_to_user32()
> ---
>  arch/powerpc/kernel/signal_32.c | 8 +++-----
>  arch/powerpc/kernel/signal_64.c | 5 +----
>  2 files changed, 4 insertions(+), 9 deletions(-)
>
> diff --git a/arch/powerpc/kernel/signal_32.c b/arch/powerpc/kernel/signal_32.c
> index ff101e2b3bab..3a2db8af2d65 100644
> --- a/arch/powerpc/kernel/signal_32.c
> +++ b/arch/powerpc/kernel/signal_32.c
> @@ -710,9 +710,9 @@ static long restore_tm_user_regs(struct pt_regs *regs, struct mcontext __user *s
>  }
>  #endif
>  
> -#ifdef CONFIG_PPC64
> +#ifndef CONFIG_PPC64
>  
> -#define copy_siginfo_to_user	copy_siginfo_to_user32
> +#define unsafe_copy_siginfo_to_user32	unsafe_copy_siginfo_to_user
>  
>  #endif /* CONFIG_PPC64 */

Any particular reason to reverse the sense of this #ifdef?

Otherwise this change looks much cleaner.

Eric


>  
> @@ -779,15 +779,13 @@ int handle_rt_signal32(struct ksignal *ksig, sigset_t *oldset,
>  		asm("dcbst %y0; sync; icbi %y0; sync" :: "Z" (mctx->mc_pad[0]));
>  	}
>  	unsafe_put_sigset_t(&frame->uc.uc_sigmask, oldset, failed);
> +	unsafe_copy_siginfo_to_user32(&frame->info, &ksig->info, failed);
>  
>  	/* create a stack frame for the caller of the handler */
>  	unsafe_put_user(regs->gpr[1], newsp, failed);
>  
>  	user_access_end();
>  
> -	if (copy_siginfo_to_user(&frame->info, &ksig->info))
> -		goto badframe;
> -
>  	regs->link = tramp;
>  
>  #ifdef CONFIG_PPC_FPU_REGS
> diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/signal_64.c
> index d80ff83cacb9..56c0c74aa28c 100644
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
