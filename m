Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87B9C4097F8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 17:55:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7WKJ3WDRz2yxm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 01:55:32 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7WJm2kcGz2xs0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 01:55:02 +1000 (AEST)
Received: from in01.mta.xmission.com ([166.70.13.51]:60820)
 by out02.mta.xmission.com with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mPoIK-00BaeR-Fi; Mon, 13 Sep 2021 09:54:56 -0600
Received: from ip68-227-160-95.om.om.cox.net ([68.227.160.95]:45470
 helo=email.xmission.com)
 by in01.mta.xmission.com with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <ebiederm@xmission.com>)
 id 1mPoII-004igE-Vg; Mon, 13 Sep 2021 09:54:56 -0600
From: ebiederm@xmission.com (Eric W. Biederman)
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <1718f38859d5366f82d5bef531f255cedf537b5d.1631537060.git.christophe.leroy@csgroup.eu>
 <e1b94e52688cd99ed4a3ab86170cd9ec48849291.1631537060.git.christophe.leroy@csgroup.eu>
Date: Mon, 13 Sep 2021 10:54:35 -0500
In-Reply-To: <e1b94e52688cd99ed4a3ab86170cd9ec48849291.1631537060.git.christophe.leroy@csgroup.eu>
 (Christophe Leroy's message of "Mon, 13 Sep 2021 17:19:08 +0200")
Message-ID: <87r1dspj2c.fsf@disp2133>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-XM-SPF: eid=1mPoII-004igE-Vg; ; ; mid=<87r1dspj2c.fsf@disp2133>; ; ;
 hst=in01.mta.xmission.com; ; ; ip=68.227.160.95; ; ; frm=ebiederm@xmission.com;
 ; ; spf=neutral
X-XM-AID: U2FsdGVkX1/oQU6ydp2sSUdMT2UjfVzHvAEgbZdCyJ0=
X-SA-Exim-Connect-IP: 68.227.160.95
X-SA-Exim-Mail-From: ebiederm@xmission.com
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on sa01.xmission.com
X-Spam-Level: ***
X-Spam-Status: No, score=3.2 required=8.0 tests=ALL_TRUSTED,BAYES_50,
 DCC_CHECK_NEGATIVE,T_TM2_M_HEADER_IN_MSG,T_TooManySym_01,
 T_TooManySym_02,T_TooManySym_03,XMGappySubj_01,XMGappySubj_02,
 XMSubLong,XM_B_SpammyTLD,XM_B_SpammyWords autolearn=disabled
 version=3.4.2
X-Spam-Virus: No
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
 *      [score: 0.4990] *  1.0 XMGappySubj_02 Gappier still
 *  0.5 XMGappySubj_01 Very gappy subject
 *  0.7 XMSubLong Long Subject
 *  0.0 T_TM2_M_HEADER_IN_MSG BODY: No description available.
 * -0.0 DCC_CHECK_NEGATIVE Not listed in DCC
 *      [sa01 1397; Body=1 Fuz1=1 Fuz2=1]
 *  0.0 T_TooManySym_03 6+ unique symbols in subject
 *  0.2 XM_B_SpammyWords One or more commonly used spammy words
 *  0.0 T_TooManySym_01 4+ unique symbols in subject
 *  0.0 T_TooManySym_02 5+ unique symbols in subject
 *  1.0 XM_B_SpammyTLD Contains uncommon/spammy TLD
X-Spam-DCC: XMission; sa01 1397; Body=1 Fuz1=1 Fuz2=1 
X-Spam-Combo: ***;Christophe Leroy <christophe.leroy@csgroup.eu>
X-Spam-Relay-Country: 
X-Spam-Timing: total 858 ms - load_scoreonly_sql: 0.03 (0.0%),
 signal_user_changed: 3.4 (0.4%), b_tie_ro: 2.3 (0.3%), parse: 1.11
 (0.1%), extract_message_metadata: 12 (1.4%), get_uri_detail_list: 4.6
 (0.5%), tests_pri_-1000: 9 (1.0%), tests_pri_-950: 1.03 (0.1%),
 tests_pri_-900: 0.85 (0.1%), tests_pri_-90: 142 (16.6%), check_bayes:
 140 (16.3%), b_tokenize: 17 (1.9%), b_tok_get_all: 10 (1.1%),
 b_comp_prob: 2.0 (0.2%), b_tok_touch_all: 108 (12.6%), b_finish: 0.71
 (0.1%), tests_pri_0: 676 (78.8%), check_dkim_signature: 0.55 (0.1%),
 check_dkim_adsp: 2.4 (0.3%), poll_dns_idle: 0.79 (0.1%), tests_pri_10:
 1.70 (0.2%), tests_pri_500: 7 (0.8%), rewrite_mail: 0.00 (0.0%)
Subject: Re: [PATCH RESEND v3 4/6] signal: Add unsafe_copy_siginfo_to_user32()
X-SA-Exim-Version: 4.2.1 (built Sat, 08 Feb 2020 21:53:50 +0000)
X-SA-Exim-Scanned: Yes (on in01.mta.xmission.com)
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

> In the same spirit as commit fb05121fd6a2 ("signal: Add
> unsafe_get_compat_sigset()"), implement an 'unsafe' version of
> copy_siginfo_to_user32() in order to use it within user access blocks.
>
> To do so, we need inline version of copy_siginfo_to_external32() as we
> don't want any function call inside user access blocks.

I don't understand.  What is wrong with?

#define unsafe_copy_siginfo_to_user32(to, from, label)	do {		\
	struct compat_siginfo __user *__ucs_to = to;			\
	const struct kernel_siginfo *__ucs_from = from;			\
	struct compat_siginfo __ucs_new;				\
									\
	copy_siginfo_to_external32(&__ucs_new, __ucs_from);		\
	unsafe_copy_to_user(__ucs_to, &__ucs_new,			\
			    sizeof(struct compat_siginfo), label);	\
} while (0)

Your replacement of "memset(to, 0, sizeof(*to))" with
"struct compat_siginfo __ucs_new = {0}".  is actively unsafe as the
compiler is free not to initialize any holes in the structure to 0 in
the later case.

Is there something about the unsafe macros that I am not aware of that
makes it improper to actually call C functions?  Is that a requirement
for the instructions that change the user space access behavior?

From the looks of this change all that you are doing is making it so
that all of copy_siginfo_to_external32 is being inlined.  If that is not
a hard requirement of the instructions it seems like the wrong thing to
do here. copy_siginfo_to_external32 has not failures so it does not need
to be inlined so you can jump to the label.

Eric

>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  include/linux/compat.h |  83 +++++++++++++++++++++++++++++-
>  include/linux/signal.h |  58 +++++++++++++++++++++
>  kernel/signal.c        | 114 +----------------------------------------
>  3 files changed, 141 insertions(+), 114 deletions(-)
>
> diff --git a/include/linux/compat.h b/include/linux/compat.h
> index 8e0598c7d1d1..68823f4b86ee 100644
> --- a/include/linux/compat.h
> +++ b/include/linux/compat.h
> @@ -412,6 +412,19 @@ int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
>  #ifndef copy_siginfo_to_user32
>  #define copy_siginfo_to_user32 __copy_siginfo_to_user32
>  #endif
> +
> +#ifdef CONFIG_COMPAT
> +#define unsafe_copy_siginfo_to_user32(to, from, label)	do {		\
> +	struct compat_siginfo __user *__ucs_to = to;			\
> +	const struct kernel_siginfo *__ucs_from = from;			\
> +	struct compat_siginfo __ucs_new = {0};				\
> +									\
> +	__copy_siginfo_to_external32(&__ucs_new, __ucs_from);		\
> +	unsafe_copy_to_user(__ucs_to, &__ucs_new,			\
> +			    sizeof(struct compat_siginfo), label);	\
> +} while (0)
> +#endif
> +
>  int get_compat_sigevent(struct sigevent *event,
>  		const struct compat_sigevent __user *u_event);
>  
> @@ -992,15 +1005,81 @@ static inline bool in_compat_syscall(void) { return false; }
>   * appropriately converted them already.
>   */
>  #ifndef compat_ptr
> -static inline void __user *compat_ptr(compat_uptr_t uptr)
> +static __always_inline void __user *compat_ptr(compat_uptr_t uptr)
>  {
>  	return (void __user *)(unsigned long)uptr;
>  }
>  #endif
>  
> -static inline compat_uptr_t ptr_to_compat(void __user *uptr)
> +static __always_inline compat_uptr_t ptr_to_compat(void __user *uptr)
>  {
>  	return (u32)(unsigned long)uptr;
>  }
>  
> +static __always_inline void
> +__copy_siginfo_to_external32(struct compat_siginfo *to,
> +			     const struct kernel_siginfo *from)
> +{
> +	to->si_signo = from->si_signo;
> +	to->si_errno = from->si_errno;
> +	to->si_code  = from->si_code;
> +	switch(__siginfo_layout(from->si_signo, from->si_code)) {
> +	case SIL_KILL:
> +		to->si_pid = from->si_pid;
> +		to->si_uid = from->si_uid;
> +		break;
> +	case SIL_TIMER:
> +		to->si_tid     = from->si_tid;
> +		to->si_overrun = from->si_overrun;
> +		to->si_int     = from->si_int;
> +		break;
> +	case SIL_POLL:
> +		to->si_band = from->si_band;
> +		to->si_fd   = from->si_fd;
> +		break;
> +	case SIL_FAULT:
> +		to->si_addr = ptr_to_compat(from->si_addr);
> +		break;
> +	case SIL_FAULT_TRAPNO:
> +		to->si_addr = ptr_to_compat(from->si_addr);
> +		to->si_trapno = from->si_trapno;
> +		break;
> +	case SIL_FAULT_MCEERR:
> +		to->si_addr = ptr_to_compat(from->si_addr);
> +		to->si_addr_lsb = from->si_addr_lsb;
> +		break;
> +	case SIL_FAULT_BNDERR:
> +		to->si_addr = ptr_to_compat(from->si_addr);
> +		to->si_lower = ptr_to_compat(from->si_lower);
> +		to->si_upper = ptr_to_compat(from->si_upper);
> +		break;
> +	case SIL_FAULT_PKUERR:
> +		to->si_addr = ptr_to_compat(from->si_addr);
> +		to->si_pkey = from->si_pkey;
> +		break;
> +	case SIL_FAULT_PERF_EVENT:
> +		to->si_addr = ptr_to_compat(from->si_addr);
> +		to->si_perf_data = from->si_perf_data;
> +		to->si_perf_type = from->si_perf_type;
> +		break;
> +	case SIL_CHLD:
> +		to->si_pid = from->si_pid;
> +		to->si_uid = from->si_uid;
> +		to->si_status = from->si_status;
> +		to->si_utime = from->si_utime;
> +		to->si_stime = from->si_stime;
> +		break;
> +	case SIL_RT:
> +		to->si_pid = from->si_pid;
> +		to->si_uid = from->si_uid;
> +		to->si_int = from->si_int;
> +		break;
> +	case SIL_SYS:
> +		to->si_call_addr = ptr_to_compat(from->si_call_addr);
> +		to->si_syscall   = from->si_syscall;
> +		to->si_arch      = from->si_arch;
> +		break;
> +	}
> +}
> +
>  #endif /* _LINUX_COMPAT_H */
> diff --git a/include/linux/signal.h b/include/linux/signal.h
> index 70ea7e741427..637260bc193d 100644
> --- a/include/linux/signal.h
> +++ b/include/linux/signal.h
> @@ -65,6 +65,64 @@ enum siginfo_layout {
>  	SIL_SYS,
>  };
>  
> +static const struct {
> +	unsigned char limit, layout;
> +} sig_sicodes[] = {
> +	[SIGILL]  = { NSIGILL,  SIL_FAULT },
> +	[SIGFPE]  = { NSIGFPE,  SIL_FAULT },
> +	[SIGSEGV] = { NSIGSEGV, SIL_FAULT },
> +	[SIGBUS]  = { NSIGBUS,  SIL_FAULT },
> +	[SIGTRAP] = { NSIGTRAP, SIL_FAULT },
> +#if defined(SIGEMT)
> +	[SIGEMT]  = { NSIGEMT,  SIL_FAULT },
> +#endif
> +	[SIGCHLD] = { NSIGCHLD, SIL_CHLD },
> +	[SIGPOLL] = { NSIGPOLL, SIL_POLL },
> +	[SIGSYS]  = { NSIGSYS,  SIL_SYS },
> +};
> +
> +static __always_inline enum
> +siginfo_layout __siginfo_layout(unsigned sig, int si_code)
> +{
> +	enum siginfo_layout layout = SIL_KILL;
> +
> +	if ((si_code > SI_USER) && (si_code < SI_KERNEL)) {
> +		if ((sig < ARRAY_SIZE(sig_sicodes)) &&
> +		    (si_code <= sig_sicodes[sig].limit)) {
> +			layout = sig_sicodes[sig].layout;
> +			/* Handle the exceptions */
> +			if ((sig == SIGBUS) &&
> +			    (si_code >= BUS_MCEERR_AR) && (si_code <= BUS_MCEERR_AO))
> +				layout = SIL_FAULT_MCEERR;
> +			else if ((sig == SIGSEGV) && (si_code == SEGV_BNDERR))
> +				layout = SIL_FAULT_BNDERR;
> +#ifdef SEGV_PKUERR
> +			else if ((sig == SIGSEGV) && (si_code == SEGV_PKUERR))
> +				layout = SIL_FAULT_PKUERR;
> +#endif
> +			else if ((sig == SIGTRAP) && (si_code == TRAP_PERF))
> +				layout = SIL_FAULT_PERF_EVENT;
> +			else if (IS_ENABLED(CONFIG_SPARC) &&
> +				 (sig == SIGILL) && (si_code == ILL_ILLTRP))
> +				layout = SIL_FAULT_TRAPNO;
> +			else if (IS_ENABLED(CONFIG_ALPHA) &&
> +				 ((sig == SIGFPE) ||
> +				  ((sig == SIGTRAP) && (si_code == TRAP_UNK))))
> +				layout = SIL_FAULT_TRAPNO;
> +		}
> +		else if (si_code <= NSIGPOLL)
> +			layout = SIL_POLL;
> +	} else {
> +		if (si_code == SI_TIMER)
> +			layout = SIL_TIMER;
> +		else if (si_code == SI_SIGIO)
> +			layout = SIL_POLL;
> +		else if (si_code < 0)
> +			layout = SIL_RT;
> +	}
> +	return layout;
> +}
> +
>  enum siginfo_layout siginfo_layout(unsigned sig, int si_code);
>  
>  /*
> diff --git a/kernel/signal.c b/kernel/signal.c
> index 23f168730b7e..0d402bdb174e 100644
> --- a/kernel/signal.c
> +++ b/kernel/signal.c
> @@ -3249,22 +3249,6 @@ COMPAT_SYSCALL_DEFINE2(rt_sigpending, compat_sigset_t __user *, uset,
>  }
>  #endif
>  
> -static const struct {
> -	unsigned char limit, layout;
> -} sig_sicodes[] = {
> -	[SIGILL]  = { NSIGILL,  SIL_FAULT },
> -	[SIGFPE]  = { NSIGFPE,  SIL_FAULT },
> -	[SIGSEGV] = { NSIGSEGV, SIL_FAULT },
> -	[SIGBUS]  = { NSIGBUS,  SIL_FAULT },
> -	[SIGTRAP] = { NSIGTRAP, SIL_FAULT },
> -#if defined(SIGEMT)
> -	[SIGEMT]  = { NSIGEMT,  SIL_FAULT },
> -#endif
> -	[SIGCHLD] = { NSIGCHLD, SIL_CHLD },
> -	[SIGPOLL] = { NSIGPOLL, SIL_POLL },
> -	[SIGSYS]  = { NSIGSYS,  SIL_SYS },
> -};
> -
>  static bool known_siginfo_layout(unsigned sig, int si_code)
>  {
>  	if (si_code == SI_KERNEL)
> @@ -3286,42 +3270,7 @@ static bool known_siginfo_layout(unsigned sig, int si_code)
>  
>  enum siginfo_layout siginfo_layout(unsigned sig, int si_code)
>  {
> -	enum siginfo_layout layout = SIL_KILL;
> -	if ((si_code > SI_USER) && (si_code < SI_KERNEL)) {
> -		if ((sig < ARRAY_SIZE(sig_sicodes)) &&
> -		    (si_code <= sig_sicodes[sig].limit)) {
> -			layout = sig_sicodes[sig].layout;
> -			/* Handle the exceptions */
> -			if ((sig == SIGBUS) &&
> -			    (si_code >= BUS_MCEERR_AR) && (si_code <= BUS_MCEERR_AO))
> -				layout = SIL_FAULT_MCEERR;
> -			else if ((sig == SIGSEGV) && (si_code == SEGV_BNDERR))
> -				layout = SIL_FAULT_BNDERR;
> -#ifdef SEGV_PKUERR
> -			else if ((sig == SIGSEGV) && (si_code == SEGV_PKUERR))
> -				layout = SIL_FAULT_PKUERR;
> -#endif
> -			else if ((sig == SIGTRAP) && (si_code == TRAP_PERF))
> -				layout = SIL_FAULT_PERF_EVENT;
> -			else if (IS_ENABLED(CONFIG_SPARC) &&
> -				 (sig == SIGILL) && (si_code == ILL_ILLTRP))
> -				layout = SIL_FAULT_TRAPNO;
> -			else if (IS_ENABLED(CONFIG_ALPHA) &&
> -				 ((sig == SIGFPE) ||
> -				  ((sig == SIGTRAP) && (si_code == TRAP_UNK))))
> -				layout = SIL_FAULT_TRAPNO;
> -		}
> -		else if (si_code <= NSIGPOLL)
> -			layout = SIL_POLL;
> -	} else {
> -		if (si_code == SI_TIMER)
> -			layout = SIL_TIMER;
> -		else if (si_code == SI_SIGIO)
> -			layout = SIL_POLL;
> -		else if (si_code < 0)
> -			layout = SIL_RT;
> -	}
> -	return layout;
> +	return __siginfo_layout(sig, si_code);
>  }
>  
>  int copy_siginfo_to_user(siginfo_t __user *to, const kernel_siginfo_t *from)
> @@ -3389,66 +3338,7 @@ void copy_siginfo_to_external32(struct compat_siginfo *to,
>  {
>  	memset(to, 0, sizeof(*to));
>  
> -	to->si_signo = from->si_signo;
> -	to->si_errno = from->si_errno;
> -	to->si_code  = from->si_code;
> -	switch(siginfo_layout(from->si_signo, from->si_code)) {
> -	case SIL_KILL:
> -		to->si_pid = from->si_pid;
> -		to->si_uid = from->si_uid;
> -		break;
> -	case SIL_TIMER:
> -		to->si_tid     = from->si_tid;
> -		to->si_overrun = from->si_overrun;
> -		to->si_int     = from->si_int;
> -		break;
> -	case SIL_POLL:
> -		to->si_band = from->si_band;
> -		to->si_fd   = from->si_fd;
> -		break;
> -	case SIL_FAULT:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -		break;
> -	case SIL_FAULT_TRAPNO:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -		to->si_trapno = from->si_trapno;
> -		break;
> -	case SIL_FAULT_MCEERR:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -		to->si_addr_lsb = from->si_addr_lsb;
> -		break;
> -	case SIL_FAULT_BNDERR:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -		to->si_lower = ptr_to_compat(from->si_lower);
> -		to->si_upper = ptr_to_compat(from->si_upper);
> -		break;
> -	case SIL_FAULT_PKUERR:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -		to->si_pkey = from->si_pkey;
> -		break;
> -	case SIL_FAULT_PERF_EVENT:
> -		to->si_addr = ptr_to_compat(from->si_addr);
> -		to->si_perf_data = from->si_perf_data;
> -		to->si_perf_type = from->si_perf_type;
> -		break;
> -	case SIL_CHLD:
> -		to->si_pid = from->si_pid;
> -		to->si_uid = from->si_uid;
> -		to->si_status = from->si_status;
> -		to->si_utime = from->si_utime;
> -		to->si_stime = from->si_stime;
> -		break;
> -	case SIL_RT:
> -		to->si_pid = from->si_pid;
> -		to->si_uid = from->si_uid;
> -		to->si_int = from->si_int;
> -		break;
> -	case SIL_SYS:
> -		to->si_call_addr = ptr_to_compat(from->si_call_addr);
> -		to->si_syscall   = from->si_syscall;
> -		to->si_arch      = from->si_arch;
> -		break;
> -	}
> +	__copy_siginfo_to_external32(to, from);
>  }
>  
>  int __copy_siginfo_to_user32(struct compat_siginfo __user *to,
