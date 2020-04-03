Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E37D19D11F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 09:21:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48trwL6SdqzDqMw
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 18:21:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=B+j0ye36; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48trpW6lh5zDqQD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 18:16:51 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id c21so3070068pfo.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 00:16:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=/Min6FGvBBhn5d4HChhwbbt9mp9eJSWu4vYPC1VQ1bY=;
 b=B+j0ye362hcPnhZvtHnMeAMi7Fq/7tt9Ul0Z/nqH/1E7RzI235255HyBwfcMANOo5B
 iqZf6D3D5aDpQ1HZwmyaEOJXVPYejenKImr0QoaKpsS0LA490f2TUAjg8jUcR+XG68gP
 J0c8NqwMaRwCsbVn0D9L+hgcykeyUrEEUSZl4QLkLVXk9A3aExcW5R7YC+t7Wu4AP61v
 c89J31eelZaffV4YhP9kRx+wKrNFGX7eJFJQ7KD6cgnYrj79ppY5Uh4R2PoX76fftjzl
 //1+w85/olJJkRfJke3aecSd8VRSVDP6KlJcDsyjmPBoPbc/M3FFoAlte1+7fS5NFt5K
 +KlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=/Min6FGvBBhn5d4HChhwbbt9mp9eJSWu4vYPC1VQ1bY=;
 b=AiKoxOPiLebVFiqETW57EBblAkKnkKFEx/Zmo1UzuM5Bg57cXRrk2gi6geInrFfkys
 F6KQtuGhxtenx4hsn5NtQ8Dvra/c2e22QW+ZTN+cNFxIsa19bR5e77NwyrVj/HThulw5
 dJpTnny6b6uQCosd4xo9b9JqvNzVtTaqiEqJEhsmIZzm8BMRn3bjf60CNTZ/aLZu1Vwp
 ZtS9KIqd8Gb0Oa8TukFBFI80KWmHwj/YCa75CDFv1yoYr9EVtJu4BPGZ+l5cQ5ujIUkW
 oEMw/NljuQ4OHhKAEfHM2C9C9J66ie0KOrFcXXiN5nyTBvlqw0ZHWA2eLxc7Yxg0L/H2
 xOkA==
X-Gm-Message-State: AGi0PuaHz2jvibwB2aKDt57q1MPXrGSYLfOhCr2Cbk9Eq8D8Z8jgATzO
 IcZdMo6gKUfPvR2gK9nlXEE=
X-Google-Smtp-Source: APiQypI29WpLJ7yRRLDxGnJ1qIIkGrkN4zERLo3YJfqcNCW07ekUordv1tE/e0nwGNZDivwYK5G7qA==
X-Received: by 2002:aa7:97a7:: with SMTP id d7mr7097386pfq.194.1585898209651; 
 Fri, 03 Apr 2020 00:16:49 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id b70sm5265916pfb.6.2020.04.03.00.16.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 00:16:48 -0700 (PDT)
Date: Fri, 03 Apr 2020 17:16:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v11 5/8] powerpc/64: make buildable without CONFIG_COMPAT
To: Michal =?iso-8859-1?q?Such=E1nek?= <msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <4b7058eb0f5558fb7e2cee1b8f7cf99ebd03084e.1584620202.git.msuchanek@suse.de>
 <1585039733.dm1rivvych.astroid@bobo.none>
 <20200324193055.GG25468@kitsune.suse.cz>
In-Reply-To: <20200324193055.GG25468@kitsune.suse.cz>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585898018.8y4vw9c8hc.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jordan Niethe <jniethe5@gmail.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>, Eric Richter <erichte@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Such=C3=A1nek's on March 25, 2020 5:30 am:
> On Tue, Mar 24, 2020 at 06:54:20PM +1000, Nicholas Piggin wrote:
>> Michal Suchanek's on March 19, 2020 10:19 pm:
>> > diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal=
.c
>> > index 4b0152108f61..a264989626fd 100644
>> > --- a/arch/powerpc/kernel/signal.c
>> > +++ b/arch/powerpc/kernel/signal.c
>> > @@ -247,7 +247,6 @@ static void do_signal(struct task_struct *tsk)
>> >  	sigset_t *oldset =3D sigmask_to_save();
>> >  	struct ksignal ksig =3D { .sig =3D 0 };
>> >  	int ret;
>> > -	int is32 =3D is_32bit_task();
>> > =20
>> >  	BUG_ON(tsk !=3D current);
>> > =20
>> > @@ -277,7 +276,7 @@ static void do_signal(struct task_struct *tsk)
>> > =20
>> >  	rseq_signal_deliver(&ksig, tsk->thread.regs);
>> > =20
>> > -	if (is32) {
>> > +	if (is_32bit_task()) {
>> >          	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
>> >  			ret =3D handle_rt_signal32(&ksig, oldset, tsk);
>> >  		else
>>=20
>> Unnecessary?
>>=20
>> > diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/sy=
scall_64.c
>> > index 87d95b455b83..2dcbfe38f5ac 100644
>> > --- a/arch/powerpc/kernel/syscall_64.c
>> > +++ b/arch/powerpc/kernel/syscall_64.c
>> > @@ -24,7 +24,6 @@ notrace long system_call_exception(long r3, long r4,=
 long r5,
>> >  				   long r6, long r7, long r8,
>> >  				   unsigned long r0, struct pt_regs *regs)
>> >  {
>> > -	unsigned long ti_flags;
>> >  	syscall_fn f;
>> > =20
>> >  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>> > @@ -68,8 +67,7 @@ notrace long system_call_exception(long r3, long r4,=
 long r5,
>> > =20
>> >  	local_irq_enable();
>> > =20
>> > -	ti_flags =3D current_thread_info()->flags;
>> > -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
>> > +	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
>> >  		/*
>> >  		 * We use the return value of do_syscall_trace_enter() as the
>> >  		 * syscall number. If the syscall was rejected for any reason
>> > @@ -94,7 +92,7 @@ notrace long system_call_exception(long r3, long r4,=
 long r5,
>> >  	/* May be faster to do array_index_nospec? */
>> >  	barrier_nospec();
>> > =20
>> > -	if (unlikely(ti_flags & _TIF_32BIT)) {
>> > +	if (unlikely(is_32bit_task())) {
>>=20
>> Problem is, does this allow the load of ti_flags to be used for both
>> tests, or does test_bit make it re-load?
>>=20
>> This could maybe be fixed by testing if(IS_ENABLED(CONFIG_COMPAT) &&
> Both points already discussed here:

Agh, I'm hopeless.

I don't think it really resolves this issue. But probably don't have time
to look at generated asm, and might never because it won't really hit
LE unless we add a 32-bit ABI. It's pretty minor though either way.

Sorry for being difficult, I really do like your patches :)

Thanks,
Nick
=
