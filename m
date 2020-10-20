Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6962932E9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 03:59:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFcHj49Y6zDqVv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 12:59:13 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFcGC1TgDzDqMf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 12:57:54 +1100 (AEDT)
Received: from new-01-3.privateemail.com ([198.54.122.47])
 by se14.registrar-servers.com with esmtpsa (TLSv1.2:AES128-GCM-SHA256:128)
 (Exim 4.92) (envelope-from <cmr@codefail.de>)
 id 1kUguD-0000C1-Eq; Mon, 19 Oct 2020 18:57:51 -0700
Received: from MTA-08-1.privateemail.com (unknown [10.20.147.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by NEW-01-3.privateemail.com (Postfix) with ESMTPS id 588F7A72;
 Tue, 20 Oct 2020 01:57:39 +0000 (UTC)
Received: from MTA-08.privateemail.com (localhost [127.0.0.1])
 by MTA-08.privateemail.com (Postfix) with ESMTP id 42E296003E;
 Mon, 19 Oct 2020 21:57:39 -0400 (EDT)
Received: from localhost (unknown [10.20.151.214])
 by MTA-08.privateemail.com (Postfix) with ESMTPA id 0E69260038;
 Tue, 20 Oct 2020 01:57:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 3/8] powerpc: Mark functions called inside uaccess
 blocks w/ 'notrace'
From: "Christopher M. Riedl" <cmr@codefail.de>
Date: Mon, 19 Oct 2020 20:59:52 -0500
Message-Id: <C6HCI5ZCNOK7.38L522D7VL2QR@geist>
In-Reply-To: <30d9ccba-20a5-37b4-1629-d0f9e0da4c84@csgroup.eu>
X-Virus-Scanned: ClamAV using ClamSMTP
X-Originating-IP: 198.54.122.47
X-SpamExperts-Domain: o3.privateemail.com
X-SpamExperts-Username: out-03
Authentication-Results: registrar-servers.com;
 auth=pass (plain) smtp.auth=out-03@o3.privateemail.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: SB/global_tokens (0.00023020979305)
X-Recommended-Action: accept
X-Filter-ID: Mvzo4OR0dZXEDF/gcnlw0acxlbLX9+ibl6ixChE10xOpSDasLI4SayDByyq9LIhVdoCmd7d8XIQ6
 RgdxWoJK+kTNWdUk1Ol2OGx3IfrIJKyP9eGNFz9TW9u+Jt8z2T3Kwi4BXSuOO65HxJws2e+QTrd8
 cnMVGQoZ8W9SqygcY4DfgwIv96ey3i8S2kDiV4NFL0mKUVqHu+m9KLsR0ilyGUGlz8CJSOMrvzx9
 TVg3RkVvtszCBXJ+SJ3GQRXVcU0Op8jZ4AoGBlDR94YkH0RjFRfL4EkKxU9ObJV0pa6ww8AiiPMZ
 yTxq5Zj1313L44OSSUJOjKBJNHzJF8ycSHMaEvDk3+iNqiYKhZaJO2iXygjDQWjOmI87Lh7Y8XsC
 bZWVvRkWzsAgaWolxIxCj2GHto6atsxaFkWS/KO9ggVt7y11v0HCq9Ij3WgoQoezM+scaWWR7drM
 d0qbJIo1RVCXie2VXGdtLyog7ui50fJvZPWymVBEglNuNDdi9xAbizrHQe+bc+r9MxWEuItVKVsO
 chW6PYU7vZf9hpAifuf5iKzfX8TdqEXkwxwMjsp2mNAp/RfNE82Z0j/SGVOKzpZStLLrEkdjWooj
 rxhIwxLjxK3LgKffTIgl7nuGO/IJU1342OUMeHyTpNN0eXybX/w7/4a+Zyc1sUYlckMDbruAhxcr
 zyR3yXPdggqRch5qYBgdiEv3LcyF4PeZ2Kcbyk5JAruiXLLmj1s/Ik6HjO34HfVogUE8PQu6GTAc
 nRPAXQn76cR0wOIgRm2hJfLmYEHLuNO6UlGm0ycQh0Ylbt1+Ear3Y80OmAux3oN13+ztUzne3jdp
 YBMFjVxNUx8bpJ4bPiG/x2hyPJvsEORuxUz9b6ETMFFQ36qcvKwKb8V+SJ+wsNsIDXCdzswXjwto
 Hmi4tVz1pRXWhjh9fdbl44I0Df2OsG3EZZg2uoCaGUazTdO7HUifxNxi/vr+xe0awpy3/ac9nHrO
 TNZtkVLPUrmUqzE1N30qb7V+5A0U/gKkK9k9/8Rp6VG8MMj91VO6Xp0YgpWAX6frP3SxSkEBDMTz
 FORFgwmpUOXPcPeresbPjCmptaly/uPaPGs4IuAYIIDnnqEO+NQBOd/FKlhsdD5U1GS+QVH2BVkH
 vSrZKgwA8kr3
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

On Fri Oct 16, 2020 at 4:02 AM CDT, Christophe Leroy wrote:
>
>
> Le 15/10/2020 =C3=A0 17:01, Christopher M. Riedl a =C3=A9crit :
> > Functions called between user_*_access_begin() and user_*_access_end()
> > should be either inlined or marked 'notrace' to prevent leaving
> > userspace access exposed. Mark any such functions relevant to signal
> > handling so that subsequent patches can call them inside uaccess blocks=
.
>
> Is it enough to mark it "notrace" ? I see that when I activate KASAN,
> there are still KASAN calls in
> those functions.
>

Maybe not enough after all :(

> In my series for 32 bits, I re-ordered stuff in order to do all those
> calls before doing the
> _access_begin(), can't you do the same on PPC64 ? (See
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/f6eac65781b4a5722=
0477c8864bca2b57f29a5d5.1597770847.git.christophe.leroy@csgroup.eu/)
>

Yes, I will give this another shot in the next spin.

> Christophe
>
> >=20
> > Signed-off-by: Christopher M. Riedl <cmr@codefail.de>
> > ---
> >   arch/powerpc/kernel/process.c | 20 ++++++++++----------
> >   arch/powerpc/mm/mem.c         |  4 ++--
> >   2 files changed, 12 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/proces=
s.c
> > index ba2c987b8403..bf5d9654bd2c 100644
> > --- a/arch/powerpc/kernel/process.c
> > +++ b/arch/powerpc/kernel/process.c
> > @@ -84,7 +84,7 @@ extern unsigned long _get_SP(void);
> >    */
> >   bool tm_suspend_disabled __ro_after_init =3D false;
> >  =20
> > -static void check_if_tm_restore_required(struct task_struct *tsk)
> > +static void notrace check_if_tm_restore_required(struct task_struct *t=
sk)
> >   {
> >   	/*
> >   	 * If we are saving the current thread's registers, and the
> > @@ -151,7 +151,7 @@ void notrace __msr_check_and_clear(unsigned long bi=
ts)
> >   EXPORT_SYMBOL(__msr_check_and_clear);
> >  =20
> >   #ifdef CONFIG_PPC_FPU
> > -static void __giveup_fpu(struct task_struct *tsk)
> > +static void notrace __giveup_fpu(struct task_struct *tsk)
> >   {
> >   	unsigned long msr;
> >  =20
> > @@ -163,7 +163,7 @@ static void __giveup_fpu(struct task_struct *tsk)
> >   	tsk->thread.regs->msr =3D msr;
> >   }
> >  =20
> > -void giveup_fpu(struct task_struct *tsk)
> > +void notrace giveup_fpu(struct task_struct *tsk)
> >   {
> >   	check_if_tm_restore_required(tsk);
> >  =20
> > @@ -177,7 +177,7 @@ EXPORT_SYMBOL(giveup_fpu);
> >    * Make sure the floating-point register state in the
> >    * the thread_struct is up to date for task tsk.
> >    */
> > -void flush_fp_to_thread(struct task_struct *tsk)
> > +void notrace flush_fp_to_thread(struct task_struct *tsk)
> >   {
> >   	if (tsk->thread.regs) {
> >   		/*
> > @@ -234,7 +234,7 @@ static inline void __giveup_fpu(struct task_struct =
*tsk) { }
> >   #endif /* CONFIG_PPC_FPU */
> >  =20
> >   #ifdef CONFIG_ALTIVEC
> > -static void __giveup_altivec(struct task_struct *tsk)
> > +static void notrace __giveup_altivec(struct task_struct *tsk)
> >   {
> >   	unsigned long msr;
> >  =20
> > @@ -246,7 +246,7 @@ static void __giveup_altivec(struct task_struct *ts=
k)
> >   	tsk->thread.regs->msr =3D msr;
> >   }
> >  =20
> > -void giveup_altivec(struct task_struct *tsk)
> > +void notrace giveup_altivec(struct task_struct *tsk)
> >   {
> >   	check_if_tm_restore_required(tsk);
> >  =20
> > @@ -285,7 +285,7 @@ EXPORT_SYMBOL(enable_kernel_altivec);
> >    * Make sure the VMX/Altivec register state in the
> >    * the thread_struct is up to date for task tsk.
> >    */
> > -void flush_altivec_to_thread(struct task_struct *tsk)
> > +void notrace flush_altivec_to_thread(struct task_struct *tsk)
> >   {
> >   	if (tsk->thread.regs) {
> >   		preempt_disable();
> > @@ -300,7 +300,7 @@ EXPORT_SYMBOL_GPL(flush_altivec_to_thread);
> >   #endif /* CONFIG_ALTIVEC */
> >  =20
> >   #ifdef CONFIG_VSX
> > -static void __giveup_vsx(struct task_struct *tsk)
> > +static void notrace __giveup_vsx(struct task_struct *tsk)
> >   {
> >   	unsigned long msr =3D tsk->thread.regs->msr;
> >  =20
> > @@ -317,7 +317,7 @@ static void __giveup_vsx(struct task_struct *tsk)
> >   		__giveup_altivec(tsk);
> >   }
> >  =20
> > -static void giveup_vsx(struct task_struct *tsk)
> > +static void notrace giveup_vsx(struct task_struct *tsk)
> >   {
> >   	check_if_tm_restore_required(tsk);
> >  =20
> > @@ -352,7 +352,7 @@ void enable_kernel_vsx(void)
> >   }
> >   EXPORT_SYMBOL(enable_kernel_vsx);
> >  =20
> > -void flush_vsx_to_thread(struct task_struct *tsk)
> > +void notrace flush_vsx_to_thread(struct task_struct *tsk)
> >   {
> >   	if (tsk->thread.regs) {
> >   		preempt_disable();
> > diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> > index ddc32cc1b6cf..da2345a2abc6 100644
> > --- a/arch/powerpc/mm/mem.c
> > +++ b/arch/powerpc/mm/mem.c
> > @@ -378,7 +378,7 @@ static inline bool flush_coherent_icache(unsigned l=
ong addr)
> >    * @start: the start address
> >    * @stop: the stop address (exclusive)
> >    */
> > -static void invalidate_icache_range(unsigned long start, unsigned long=
 stop)
> > +static void notrace invalidate_icache_range(unsigned long start, unsig=
ned long stop)
> >   {
> >   	unsigned long shift =3D l1_icache_shift();
> >   	unsigned long bytes =3D l1_icache_bytes();
> > @@ -402,7 +402,7 @@ static void invalidate_icache_range(unsigned long s=
tart, unsigned long stop)
> >    * @start: the start address
> >    * @stop: the stop address (exclusive)
> >    */
> > -void flush_icache_range(unsigned long start, unsigned long stop)
> > +void notrace flush_icache_range(unsigned long start, unsigned long sto=
p)
> >   {
> >   	if (flush_coherent_icache(start))
> >   		return;
> >=20

