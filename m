Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5745293344
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 04:42:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFdFq1YmYzDqT5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 13:42:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=codefail.de (client-ip=198.54.127.69;
 helo=se14-2.privateemail.com; envelope-from=cmr@codefail.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=codefail.de
Received: from se14-2.privateemail.com (se14-2.privateemail.com
 [198.54.127.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFdD0506JzDqRM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 13:41:04 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se14.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kUha6-0009ba-1x; Mon, 19 Oct 2020 19:41:01 -0700
Received: from MTA-07-1.privateemail.com (unknown [10.20.147.17])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 12C20A6F;
 Tue, 20 Oct 2020 02:40:57 +0000 (UTC)
Received: from MTA-07.privateemail.com (localhost [127.0.0.1])
 by MTA-07.privateemail.com (Postfix) with ESMTP id F1CC560043;
 Mon, 19 Oct 2020 22:40:56 -0400 (EDT)
Received: from localhost (unknown [10.20.151.225])
 by MTA-07.privateemail.com (Postfix) with ESMTPA id AD99D60045;
 Tue, 20 Oct 2020 02:40:56 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Subject: Re: [PATCH 6/8] powerpc/signal64: Replace setup_trampoline() w/
 unsafe_setup_trampoline()
From: "Christopher M. Riedl" <cmr@codefail.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Date: Mon, 19 Oct 2020 21:42:06 -0500
Message-Id: <C6HDEHRYN1HT.16V34IHMSGUK8@geist>
In-Reply-To: <c447ee06-a581-1f5f-42c7-814a1f570fe0@csgroup.eu>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00403869464108)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0acxlbLX9+ibl6ixChE10xOpSDasLI4SayDByyq9LIhV4s58yQiUp5Yg
 Dju8HQ1kvETNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kv5Hkyx+J97b+o9P3S0pLZ/Mp
 AFfZKu6jiKhfDEdeK2Dn98dacUsL66kgvenDmrmPkbNQWAhniA2nZ6Uf9X6bEYSGaQOYvUz3Qyrl
 0TYKe/LS6SVcTDfu4zA3T/zuN4cDJgulB/yq8PwMQlVtAeEpxrk5JPeAOPgn+kMHnHQHwyxJf1OL
 05gxFbhTnU32bkEaVWMlqXXd+RxAnk9GBmPz0QiZvPgV2a3WEfKXnN3tGyuXDO5DCb49DrBLGBuh
 WUgNrEoBPa5iwIbD+Ed7E28GGEpCHkq3t2QWc5y7R2vgTKTvxnrnHtOKPp7r4O3DezwNkL/+h1aL
 2OqtpSX2AHJEJUCbUeEMVjDon5rfSznEF9Wn0xds8xzlI9bNNBd60UaawOdYtt/eE4r9wJTVwPfY
 y4ljc3cdkir05kMDTgrRv8/dAGQ93WWVSHcYlg6mr/IfPd0rEuGjFyZoidhtHm+Wob6mgd/Zma/L
 hZdebzz8Axcatd1bXT2D6UAyQBvI2WhODZAR62S8fTT/GafqgXnPyyS4Hh8s12ybj3OcYQ7BbVHJ
 pP5+GeY+Zn45S5XkEzp7LLlWjrE6IX2XGQJt2ZBm5BDe+6hn6JcOTrtzMkvsUtCxS03pl3iQmE2c
 s7thUuOe14lz/GPGiMHexzKgYd2IaO1NcsBz14JUbrLxxNJ5B1HDEd6Yplvh+oay7O24oTPn3Z/n
 KLrE+foBRgHDmjSepV3wAvAL66Saq2Jrxe6pDvjnFL/NV+urNmku+ljA/fSspASU8nI0l2AWwkUS
 z/3cxZshUV/RtKXq9IlYqP0RAAPkCcj7ATESLZldlzAWaP8bAPyjSh4bXhC4zacckC+XHiHr1bo6
 e7Y539UsOzwj0MWyLsz3qNj4PRhN4XJKt2sCqXf0vqTZTyCZtOKU+Z570AJj69weJGANpikz+V2q
 yj5aUOJArqP2Qk28NEXtBK9f8OTf6I2qJgqFlok7aJfKCJLJWvvP93Jgzk6YSAusWc8pZPjaS96K
 QivKH02x1SD0OHz81N3dNrb/kl0y4ehmVTEvuGslKTrRIXcXpFg5ivY=
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Oct 16, 2020 at 10:56 AM CDT, Christophe Leroy wrote:
>
>
> Le 15/10/2020 =C3=A0 17:01, Christopher M. Riedl a =C3=A9crit :
> > From: Daniel Axtens <dja@axtens.net>
> >=20
> > Previously setup_trampoline() performed a costly KUAP switch on every
> > uaccess operation. These repeated uaccess switches cause a significant
> > drop in signal handling performance.
> >=20
> > Rewrite setup_trampoline() to assume that a userspace write access
> > window is open. Replace all uaccess functions with their 'unsafe'
> > versions to avoid the repeated uaccess switches.
> >=20
> > Signed-off-by: Daniel Axtens <dja@axtens.net>
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >   arch/powerpc/kernel/signal_64.c | 32 +++++++++++++++++++-------------
> >   1 file changed, 19 insertions(+), 13 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/signal_64.c b/arch/powerpc/kernel/sign=
al_64.c
> > index bd92064e5576..6d4f7a5c4fbf 100644
> > --- a/arch/powerpc/kernel/signal_64.c
> > +++ b/arch/powerpc/kernel/signal_64.c
> > @@ -600,30 +600,33 @@ static long restore_tm_sigcontexts(struct task_st=
ruct *tsk,
> >   /*
> >    * Setup the trampoline code on the stack
> >    */
> > -static long setup_trampoline(unsigned int syscall, unsigned int __user=
 *tramp)
> > +#define unsafe_setup_trampoline(syscall, tramp, e) \
> > +	unsafe_op_wrap(__unsafe_setup_trampoline(syscall, tramp), e)
> > +static long notrace __unsafe_setup_trampoline(unsigned int syscall,
> > +					unsigned int __user *tramp)
> >   {
> >   	int i;
> > -	long err =3D 0;
> >  =20
> >   	/* bctrl # call the handler */
> > -	err |=3D __put_user(PPC_INST_BCTRL, &tramp[0]);
> > +	unsafe_put_user(PPC_INST_BCTRL, &tramp[0], err);
> >   	/* addi r1, r1, __SIGNAL_FRAMESIZE  # Pop the dummy stackframe */
> > -	err |=3D __put_user(PPC_INST_ADDI | __PPC_RT(R1) | __PPC_RA(R1) |
> > -			  (__SIGNAL_FRAMESIZE & 0xffff), &tramp[1]);
> > +	unsafe_put_user(PPC_INST_ADDI | __PPC_RT(R1) | __PPC_RA(R1) |
> > +			  (__SIGNAL_FRAMESIZE & 0xffff), &tramp[1], err);
> >   	/* li r0, __NR_[rt_]sigreturn| */
> > -	err |=3D __put_user(PPC_INST_ADDI | (syscall & 0xffff), &tramp[2]);
> > +	unsafe_put_user(PPC_INST_ADDI | (syscall & 0xffff), &tramp[2], err);
> >   	/* sc */
> > -	err |=3D __put_user(PPC_INST_SC, &tramp[3]);
> > +	unsafe_put_user(PPC_INST_SC, &tramp[3], err);
> >  =20
> >   	/* Minimal traceback info */
> >   	for (i=3DTRAMP_TRACEBACK; i < TRAMP_SIZE ;i++)
> > -		err |=3D __put_user(0, &tramp[i]);
> > +		unsafe_put_user(0, &tramp[i], err);
> >  =20
> > -	if (!err)
> > -		flush_icache_range((unsigned long) &tramp[0],
> > -			   (unsigned long) &tramp[TRAMP_SIZE]);
> > +	flush_icache_range((unsigned long)&tramp[0],
> > +			   (unsigned long)&tramp[TRAMP_SIZE]);
>
> This flush should be done outside the user_write_access block.
>

Hmm, I suppose that means setup_trampoline() cannot be completely
"unsafe". I'll see if I can re-arrange the code which calls this
function to avoid an additional uaccess block instead and push the
start()/end() into setup_trampoline() directly.

> >  =20
> > -	return err;
> > +	return 0;
> > +err:
> > +	return 1;
> >   }
> >  =20
> >   /*
> > @@ -888,7 +891,10 @@ int handle_rt_signal64(struct ksignal *ksig, sigse=
t_t *set,
> >   	if (vdso64_rt_sigtramp && tsk->mm->context.vdso_base) {
> >   		regs->nip =3D tsk->mm->context.vdso_base + vdso64_rt_sigtramp;
> >   	} else {
> > -		err |=3D setup_trampoline(__NR_rt_sigreturn, &frame->tramp[0]);
> > +		if (!user_write_access_begin(frame, sizeof(struct rt_sigframe)))
> > +			return -EFAULT;
> > +		err |=3D __unsafe_setup_trampoline(__NR_rt_sigreturn, &frame->tramp[=
0]);
> > +		user_write_access_end();
> >   		if (err)
> >   			goto badframe;
> >   		regs->nip =3D (unsigned long) &frame->tramp[0];
> >=20
>
> Christophe

