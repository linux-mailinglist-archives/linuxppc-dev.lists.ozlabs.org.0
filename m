Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BC0A3293348
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 04:46:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFdLL3qNkzDqSn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 13:46:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.87;
 helo=se18-4.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se18-4.privateemail.com (se18-4.privateemail.com
 [198.54.127.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFdHL3pt2zDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 13:43:58 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se18.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kUhcu-0001UC-Ic; Mon, 19 Oct 2020 19:43:56 -0700
Received: from MTA-07-1.privateemail.com (unknown [10.20.147.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 0AA00A6F;
 Tue, 20 Oct 2020 02:43:52 +0000 (UTC)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id E176560045;
 Mon, 19 Oct 2020 22:43:51 -0400 (EDT)
Received: from localhost (unknown [10.20.151.217])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id AD00460043;
 Tue, 20 Oct 2020 02:43:51 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 8/8] powerpc/signal64: Rewrite rt_sigreturn() to
 minimise uaccess switches
Date: Mon, 19 Oct 2020 21:45:29 -0500
Message-Id: <C6HDH3AKKHUD.3C5S97EK5PB6M@geist>
In-Reply-To: <bdc30b81-65bd-1cc0-b31a-61300e8c010a@csgroup.eu>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.01)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0acxlbLX9+ibl6ixChE10xOpSDasLI4SayDByyq9LIhV2mqiLQfChLqm
 81rPlbMjKETNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kwi4BXSuOO65HxJws2e+QTrd8
 cnMVGQoZ8W9SqygcY4DfgwIv96ey3i8S2kDiV4NFL0mKUVqHu+m9KLsR0ilyGUGlz8CJSOMrvzx9
 TVg3RkUE6pMdQgwGqm99HoQ/RD4Tp8jZ4AoGBlDR94YkH0RjFRfL4EkKxU9ObJV0pa6ww8AiiPMZ
 yTxq5Zj1313L44OSS1ueBonkNzcqLq2LIe51i/Dk3+iNqiYKhZaJO2iXygjDQWjOmI87Lh7Y8XsC
 bZWVvRkWzsAgaWolxIxCj2GHto6atsxaFkWS/KO9ggVt7y11v0HCq9Ij3WgoQoezM+scaWWR7drM
 d0qbJIo1RVCXie2VXGdtLyog7ui50fJvZPWymVBEglNuNDdi9xAbizrH5OsVdOhXIGZEKBBVfrNX
 IVS7yrN4xA/q5McvR31SN9iB8Wsvf3buc8teJ1RiHNMvIwZgYFwjw1mzO+UJiTlJpdvpo2UgV9PP
 0GtOSQCD3Wp6EipRzMVZ5LqwTx7Vvn9SWQRihqWRcCaa7yMGNcHiKrDnA3wXPkA2INjAw9EFTL5a
 N+0K6h40WonnpV9qY037Cf6hcJZCbT5tFBudtqXUR4Zq/muJOV3x5A/auIVQo8oD3WbML0pHvwic
 IIZgSSF9KjOelVZXLMA29DfEruL6DYsEMysPur9wmiDBurOy6iTDrd0x+3YQnB0RHLi/vQmrViIQ
 n70lBYH88dpo7a4LbekM690Hp1o42UVCv6oJ9s/Ib8PuBRWc7HMyv15KB1aRctgzcDoFd+96Xw4Q
 UNtTnTj+sNQbfmTcbCI4bP4Q2wTKDIqtF9zdULrTh6VP35X/OeA38wHfD4EgRY6r4dAy/Ob9MbqY
 98fRJO0WnyWriaVOP34VGRo5L8M2MA2Zvy07Qp3F8cjyBYzOHeaMieHYbzkjHv8L1XCo8f/lClCd
 nQEV4c33O1R/KGaKK9RjaKoDpQVQQrINKHxdrweiF9kFyBNoYrJRVwuktqDPF7HQoew=
X-Report-Abuse-To: spam@se5.registrar-servers.com
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Oct 16, 2020 at 11:07 AM CDT, Christophe Leroy wrote:
>
>
> Le 15/10/2020 =C3=A0 17:01, Christopher M. Riedl a =C3=A9crit :
> > From: Daniel Axtens <dja@axtens.net>
> >=20
> > Add uaccess blocks and use the 'unsafe' versions of functions doing use=
r
> > access where possible to reduce the number of times uaccess has to be
> > opened/closed.
> >=20
> > Signed-off-by: Daniel Axtens <dja@axtens.net>
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >   arch/powerpc/kernel/signal_64.c | 23 +++++++++++++++--------
> >   1 file changed, 15 insertions(+), 8 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index 3b97e3681a8f..0f4ff7a5bfc1 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -779,18 +779,22 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >   	 */
> >   	regs->msr &=3D ~MSR_TS_MASK;
> >  =20
> > -	if (__get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR]))
> > +	if (!user_read_access_begin(uc, sizeof(*uc)))
> >   		goto badframe;
> > +
> > +	unsafe_get_user(msr, &uc->uc_mcontext.gp_regs[PT_MSR], badframe_block=
);
> > +
> >   	if (MSR_TM_ACTIVE(msr)) {
> >   		/* We recheckpoint on return. */
> >   		struct ucontext __user *uc_transact;
> >  =20
> >   		/* Trying to start TM on non TM system */
> >   		if (!cpu_has_feature(CPU_FTR_TM))
> > -			goto badframe;
> > +			goto badframe_block;
> > +
> > +		unsafe_get_user(uc_transact, &uc->uc_link, badframe_block);
> > +		user_read_access_end();
>
> user_access_end() only in the if branch ?
>
> >  =20
> > -		if (__get_user(uc_transact, &uc->uc_link))
> > -			goto badframe;
> >   		if (restore_tm_sigcontexts(current, &uc->uc_mcontext,
> >   					   &uc_transact->uc_mcontext))
> >   			goto badframe;
> > @@ -810,12 +814,13 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >   		 * causing a TM bad thing.
> >   		 */
> >   		current->thread.regs->msr &=3D ~MSR_TS_MASK;
> > +
> > +#ifndef CONFIG_PPC_TRANSACTIONAL_MEM
> >   		if (!user_read_access_begin(uc, sizeof(*uc)))
>
> The matching user_read_access_end() is not in the same #ifndef ? That's
> dirty and hard to follow.
> Can you re-organise the code to avoid all those nesting ?

Yes, thanks for pointing this out. I really wanted to avoid changing too
much of the logic inside these functions. But I suppose I ended up
creating a mess - I will fix this in the next spin.

>
> > -			return -EFAULT;
> > -		if (__unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext))=
 {
> > -			user_read_access_end();
> >   			goto badframe;
> > -		}
> > +#endif
> > +		unsafe_restore_sigcontext(current, NULL, 1, &uc->uc_mcontext,
> > +					  badframe_block);
> >   		user_read_access_end();
> >   	}
> >  =20
> > @@ -825,6 +830,8 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >   	set_thread_flag(TIF_RESTOREALL);
> >   	return 0;
> >  =20
> > +badframe_block:
> > +	user_read_access_end();
> >   badframe:
> >   	signal_fault(current, regs, "rt_sigreturn", uc);
> >  =20
> >=20
>
> Christophe

