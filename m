Return-Path: <linuxppc-dev+bounces-6350-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0B5A3C080
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 14:50:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yyd7s2rLzz2yvq;
	Thu, 20 Feb 2025 00:50:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::836"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739973033;
	cv=none; b=KmJI6khgzYbJ/hYurEikQtBvGN0DDLUdamyyp9AhH6G9SYtg7JsD/y2FcteTfJ2xQg5jqD+eD38YFR1uXMGW1Juqac3uBSw05dBE2gDq20B7aUns6EkTWPIjeO7dy9D5OO/ab3rrwqWpcIFFm0HW1JDwpf5C7xLj0m5mkRILtyLZ6pSsETWT4MTFAzSWOmGdXMgITtykScb7BzUm5GF07vI08ubnPuR707f1wnH833JzQplo63ozKREKLlS8gSvNoSapQ9fzyF61mnbkflbxY9q6QeGmFa4tbGe3RbIBKDzp3aLUctHJ/nrIjHlbFPSVcNvQrAe/Oa09VWXNwsv8GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739973033; c=relaxed/relaxed;
	bh=cpRpVwT6nybSiQD8y0Vvf6uWA9zfVLaJVGGslB/AiT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HisFd5vVoct0jsMUIgIuGiJU5L19y3uZ2htZu7bot8lP0GtYgb4Luko/vQN+zkZVEpnQA3YPrLLsJP9bE/0pJNvX5zsXQt4qRJ0dlVTAzX4JOJG0x3xBuTMXLwK1rC/cUINCS7AgRTR30z87CVhyfWeaWeGN49bEy9bHA8q5oFt/SlgRCrtt/43C5U9ouu/Wn+Wtg3wGYY8fbrkgGozQ1uKIi/4pXqFCwPBwkILJIzZKcaRUc48+m8vE7R5QI5q/kzWLF98eMsPKAC3/iSLD9GnXlqvEZ9VHr5qL/fEXGMGNj3deB2sOM2E1+E7phqVK1IwDoOg6wpsoHGZ0i8pRwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=h80Cucvn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=jackmanb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=h80Cucvn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::836; helo=mail-qt1-x836.google.com; envelope-from=jackmanb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yyd7q5DdZz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 00:50:30 +1100 (AEDT)
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-471fa3b19bcso605421cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 05:50:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739973027; x=1740577827; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cpRpVwT6nybSiQD8y0Vvf6uWA9zfVLaJVGGslB/AiT0=;
        b=h80CucvnJIw2Xgo8FFYAZXQ4NNoTKm3VGEZQlCkErNiT+IPxlaFe0ZnB8bnVPWaMwk
         mZX8q03E3hlbZl83+YGeYG3NG726aSMGqP3vAgJf7pbdEETCpZWQsAfwSGTE9EXziGMT
         P4dWT9CuzWD52ThvjHbeQ6y2ooaS5ARqh8ZAh5uxDVx2/OulM7qSR0onXDbpSpp6i+31
         sKIkOgmySrtDc7isz7iPsiqPUrGw9z84UY2y/2ALtbVbHfBkBVIIVVo6833k6MNhxmQy
         t8Cg7WtAVzWyUjuSeRLvPP1R9xGCM5EGM0YAWPmtTY3VYfqc67TiJQpn0rKeLSU+FZ1j
         zY0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973027; x=1740577827;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cpRpVwT6nybSiQD8y0Vvf6uWA9zfVLaJVGGslB/AiT0=;
        b=PE01PFJUFwwhr48iLROPb2Z6rIzainU7mBP5hZeNw0i0mHz31BXR/3tpg4ALc6pbyD
         4mGV0QPBUxjtYA+HQSSGAyltGRQkNWa+vertkt486rb0UhMatwIXtRK5THXID1A9XHVE
         d8VGpOBcdUMJzO54s2F6zWAXbkeRwb86ZufB6Cplb0i9F5yyBX9s6Xv45azwBBDuNL0h
         fMdrUDtrf85xUigcc3+TQKeaKgBEvMUE0o5KBTBvAbMxDJr96zCoysfSHp8XAyyOsMuw
         7MRPvIloA/lOOKAS7G2ef+YXWjiRxtP0aRseWOk66sWbcJuv0Eu8Prm3h43MkVFAosft
         wYoA==
X-Forwarded-Encrypted: i=1; AJvYcCXsRWuKV5cApXr+DPZwWwQ5Qa9s9PJIMpnqrXbsez6LIPrAfr1aGs2tXpAKhQNLQH12V/zmVKpM+4r965s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyvhea8DEEfAnRnf5g1iSCrAFPvuueY8NOH1Ja+sWh0bCkHHfPK
	oLzpkRpHvplIqoDcPtff4crOeijM2vC9H81gw8iD39ymYNdqv8wdWpAQVDZ95dLLvPpURPUgFd2
	7fHXEXjbw0Duq269rTqGPGRzHAg++jJakh4lq
X-Gm-Gg: ASbGncvAuGoBaAtlJLGlHEaIeW4d/hmceDQIuMvHoogd74SXnHhht7bQaJ1lN7Ueu7t
	0McUzrZYts+3OWXBo1tGicvMWRhxivk7Cr84q7pNCwrlckx5mi7ow8ddy7KJ7t/q4PhtzxvrswK
	trROS3psZG7rL+vcJnplBgg+MQx+4=
X-Google-Smtp-Source: AGHT+IGxA0ST0+Qs2En53BsPu4c7HcNH6zxgVPUvf4A/emGOU6uwfm55gzfEizcmtTiC/0i6qUTM3HoPfZ3vHe3EBBI=
X-Received: by 2002:a05:622a:1984:b0:471:812b:508 with SMTP id
 d75a77b69052e-4720965d0d5mr3550131cf.14.1739973026785; Wed, 19 Feb 2025
 05:50:26 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-3-8419288bc805@google.com> <20250219105503.GKZ7W4h6QW1CNj48U9@fat_crate.local>
In-Reply-To: <20250219105503.GKZ7W4h6QW1CNj48U9@fat_crate.local>
From: Brendan Jackman <jackmanb@google.com>
Date: Wed, 19 Feb 2025 14:50:15 +0100
X-Gm-Features: AWEUYZkwkfdbftDgaNmZfIEB1SbLThhdC5JS-Qi6ViHsp1K5UHegLhk89BGfq9g
Message-ID: <CA+i-1C3Ei=dNRUaHThaBr3hPy8=5O+ocRHgw=YLkX6goJWw4ow@mail.gmail.com>
Subject: Re: [PATCH RFC v2 03/29] mm: asi: Introduce ASI core API
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Richard Henderson <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, 
	Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>, 
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Stafford Horne <shorne@gmail.com>, 
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Rich Felker <dalias@libc.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
	"David S. Miller" <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Chris Zankel <chris@zankel.net>, 
	Max Filippov <jcmvbkbc@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, 
	Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Christoph Hellwig <hch@infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Mike Rapoport <rppt@kernel.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@linux.com>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Ard Biesheuvel <ardb@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, 
	linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org, 
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-sh@vger.kernel.org, sparclinux@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-arch@vger.kernel.org, linux-mm@kvack.org, 
	linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	kvm@vger.kernel.org, linux-efi@vger.kernel.org, 
	Ofir Weisse <oweisse@google.com>, Junaid Shahid <junaids@google.com>
Content-Type: multipart/alternative; boundary="0000000000002ec785062e7f0a0e"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	HTML_MESSAGE,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

--0000000000002ec785062e7f0a0e
Content-Type: text/plain; charset="UTF-8"

On Wed, 19 Feb 2025 at 11:57, Borislav Petkov <bp@alien8.de> wrote:

> > + * Runtime usage:
> > + *
> > + * 1. Call asi_enter() to switch to the restricted address space. This
> can't be
> > + *    from an interrupt or exception handler and preemption must be
> disabled.
> > + *
> > + * 2. Execute untrusted code.
> > + *
> > + * 3. Call asi_relax() to inform the ASI subsystem that untrusted code
> execution
> > + *    is finished. This doesn't cause any address space change. This
> can't be
> > + *    from an interrupt or exception handler and preemption must be
> disabled.
> > + *
> > + * 4. Either:
> > + *
> > + *    a. Go back to 1.
> > + *
> > + *    b. Call asi_exit() before returning to userspace. This immediately
> > + *       switches to the unrestricted address space.
>
> So only from reading this, it does sound weird. Maybe the code does it
> differently - I'll see soon - but this basically says:
>
> I asi_enter(), do something, asi_relax() and then I decide to do something
> more and to asi_enter() again!? And then I can end it all with a *single*
> asi_exit() call?
>
> Hm, definitely weird API. Why?
>

OK, sounds like I need to rewrite this explanation! It's only been read
before by people who already knew how this thing worked so this might take
a few attempts to make it clear.

Maybe the best way to make it clear is to explain this with reference to
KVM. At a super high level, That looks like:

ioctl(KVM_RUN) {
    enter_from_user_mode()
    while !need_userspace_handling() {
        asi_enter();  // part 1
        vmenter();  // part 2
        asi_relax(); // part 3
    }
    asi _exit(); // part 4b
    exit_to_user_mode()
}

So part 4a is just referring to continuation of the loop.

This explanation was written when that was the only user of this API so it
was probably clearer, now we have userspace it seems a bit odd.

With my pseudocode above, does it make more sense? If so I'll try to think
of a better way to explain it.

/*
>  * Leave the "tense" state if we are in it, i.e. end the critical section.
> We
>  * will stay relaxed until the next asi_enter.
>  */
> void asi_relax(void);
>
> Yeah, so there's no API functions balance between enter() and relax()...
>

asi_enter() is actually balanced with asi_relax(). The comment says "if we
are in it" because technically if you call this asi_relax() outside of the
critical section, it's a nop. But, there's no reason to do that, so we
could definitely change the comment and WARN if that happens.


> > +#define ASI_TAINT_OTHER_MM_CONTROL   ((asi_taints_t)BIT(6))
> > +#define ASI_NUM_TAINTS                       6
> > +static_assert(BITS_PER_BYTE * sizeof(asi_taints_t) >= ASI_NUM_TAINTS);
>
> Why is this a typedef at all to make the code more unreadable than it
> needs to
> be? Why not a simple unsigned int or char or whatever you need?
>

My thinking was just that it's nicer to see asi_taints_t and know that it
means "it holds taint flags and it's big enough" instead of having to
remember the space needed for these flags. But yeah I'm fine with making it
a raw integer type.

> +#define ASI_TAINTS_CONTROL_MASK \
> > +     (ASI_TAINT_USER_CONTROL | ASI_TAINT_GUEST_CONTROL |
> ASI_TAINT_OTHER_MM_CONTROL)
> > +
> > +#define ASI_TAINTS_DATA_MASK \
> > +     (ASI_TAINT_KERNEL_DATA | ASI_TAINT_USER_DATA |
> ASI_TAINT_OTHER_MM_DATA)
> > +
> > +#define ASI_TAINTS_GUEST_MASK (ASI_TAINT_GUEST_DATA |
> ASI_TAINT_GUEST_CONTROL)
> > +#define ASI_TAINTS_USER_MASK (ASI_TAINT_USER_DATA |
> ASI_TAINT_USER_CONTROL)
> > +
> > +/* The taint policy tells ASI how a class interacts with the CPU taints
> */
> > +struct asi_taint_policy {
> > +     /*
> > +      * What taints would necessitate a flush when entering the domain,
> to
> > +      * protect it from attack by prior domains?
> > +      */
> > +     asi_taints_t prevent_control;
>
> So if those necessitate a flush, why isn't this var called
> "taints_to_flush"
> or whatever which exactly explains what it is?
>

Well it needs to be disambiguated from the field below (currently
protect_data) but it could be control_to_flush (and data_to_flush).

The downside of that is that having one say "prevent" and one say "protect"
is quite meaningful. prevent_control is describing things we need to do to
protect the system from this domain, protect_data is about protecting the
domain from the system. However, while that difference is meaningful it
might not actually be helpful for the reader of the code so I'm not wed to
it.

Also worth noting that we could just combine these fields. At present they
should have disjoint bits set. But, they're used in separate contexts and
have separate (although conceptually very similar) meanings, so I think
that would reduce clarity.


> Spellchecker please. Go over your whole set.
>

Ack, I've set up a local thingy to spellcheck all my commits so hopefully
you should encounter less of that noise in future.

For the pronouns stuff I will do my best but you might still spot
violations in older text, sorry about that.

> +     /* What taints should be set when entering the domain? */
> > +     asi_taints_t set;
>
>
> So "required_taints" or so... hm?
>

What this field is describing is: when we run the untrusted code, what
happens? I don't mean "what does the kernel do" but what physically happens
on the CPU from an exploit point of view.

For example setting ASI_TAINT_USER_DATA in this field means "when we run
the untrusted code (i.e. userspace), userspace data gets left behind in
sidechannels".

"Should be set" in the comment means "this field should be set to record
that a thing has happened" not "this field being set is a requirement for
some API" or something. So I don't think "required" is right but this is
hard to name.

That commentary should also be expanded I think, since "should be set" is
pretty ambiguous. And maybe if we called it "to_set" it would be more
obvious that "set" is a verb? I'm very open to suggestions.


> > +
> > +void asi_init_mm_state(struct mm_struct *mm);
> > +
> > +int asi_init_class(enum asi_class_id class_id, struct asi_taint_policy
> *taint_policy);
> > +void asi_uninit_class(enum asi_class_id class_id);
>
> "uninit", meh. "exit" perhaps? or "destroy"



> And you have "asi_destroy" already so I guess you can do:
>
> asi_class_init()
> asi_class_destroy()
>
> to have the namespace correct.
>

Yeah, not sure what I was thinking here!


> > +static __always_inline bool asi_is_tense(void)
> > +{
> > +     return !asi_is_relaxed();
> > +}
>
> So can we tone down the silly helpers above? You don't really need
> asi_is_tense() for example. It is still very intuitive if I read
>
>         if (!asi_is_relaxed())
>
> Yep that sounds good.

--0000000000002ec785062e7f0a0e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 19 Feb 2025 at 11:57, Borislav Pe=
tkov &lt;<a href=3D"mailto:bp@alien8.de">bp@alien8.de</a>&gt; wrote:</div><=
div class=3D"gmail_quote gmail_quote_container"><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; + * Runtime usage:<br>
&gt; + *<br>
&gt; + * 1. Call asi_enter() to switch to the restricted address space. Thi=
s can&#39;t be<br>
&gt; + *=C2=A0 =C2=A0 from an interrupt or exception handler and preemption=
 must be disabled.<br>
&gt; + *<br>
&gt; + * 2. Execute untrusted code.<br>
&gt; + *<br>
&gt; + * 3. Call asi_relax() to inform the ASI subsystem that untrusted cod=
e execution<br>
&gt; + *=C2=A0 =C2=A0 is finished. This doesn&#39;t cause any address space=
 change. This can&#39;t be<br>
&gt; + *=C2=A0 =C2=A0 from an interrupt or exception handler and preemption=
 must be disabled.<br>
&gt; + *<br>
&gt; + * 4. Either:<br>
&gt; + *<br>
&gt; + *=C2=A0 =C2=A0 a. Go back to 1.<br>
&gt; + *<br>
&gt; + *=C2=A0 =C2=A0 b. Call asi_exit() before returning to userspace. Thi=
s immediately<br>
&gt; + *=C2=A0 =C2=A0 =C2=A0 =C2=A0switches to the unrestricted address spa=
ce.<br>
<br>
So only from reading this, it does sound weird. Maybe the code does it<br>
differently - I&#39;ll see soon - but this basically says:<br>
<br>
I asi_enter(), do something, asi_relax() and then I decide to do something<=
br>
more and to asi_enter() again!? And then I can end it all with a *single*<b=
r>
asi_exit() call?<br>
<br>
Hm, definitely weird API. Why?<br></blockquote><div><br></div><div>OK, soun=
ds like I need to rewrite this explanation! It&#39;s only been read before =
by people who already knew how this thing worked so this might take a few a=
ttempts to make it clear.<br><br>Maybe the best way to make it clear is to =
explain this with reference to KVM. At a super high level, That looks like:=
<br><br>ioctl(KVM_RUN) {<br>=C2=A0 =C2=A0 enter_from_user_mode()<br>=C2=A0 =
=C2=A0 while !need_userspace_handling() {<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 as=
i_enter();=C2=A0 // part 1<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 vmenter();=C2=A0 =
// part 2<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 asi_relax(); // part 3<br>=C2=A0 =
=C2=A0 }<br>=C2=A0 =C2=A0 asi _exit(); // part 4b<br>=C2=A0 =C2=A0 exit_to_=
user_mode()<br>}</div><div><br>So part 4a is just referring to continuation=
 of the loop.<br><br>This explanation was written when that was the only us=
er of this API so it was probably clearer, now we have userspace it seems a=
 bit odd.<br><br>With my pseudocode above, does it make more sense? If so I=
&#39;ll try to think of a better way to explain it.</div><div><br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
/*<br>
=C2=A0* Leave the &quot;tense&quot; state if we are in it, i.e. end the cri=
tical section. We<br>
=C2=A0* will stay relaxed until the next asi_enter.<br>
=C2=A0*/<br>
void asi_relax(void);<br>
<br>
Yeah, so there&#39;s no API functions balance between enter() and relax()..=
.<br></blockquote><div><br></div><div>asi_enter() is actually balanced with=
 asi_relax(). The comment says &quot;if we are in it&quot; because technica=
lly if you call this asi_relax() outside of the critical section, it&#39;s =
a nop. But, there&#39;s no reason to do that, so we could definitely change=
 the comment and WARN if that happens.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
&gt; +#define ASI_TAINT_OTHER_MM_CONTROL=C2=A0 =C2=A0((asi_taints_t)BIT(6))=
<br>
&gt; +#define ASI_NUM_TAINTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06<br>
&gt; +static_assert(BITS_PER_BYTE * sizeof(asi_taints_t) &gt;=3D ASI_NUM_TA=
INTS);<br>
<br>
Why is this a typedef at all to make the code more unreadable than it needs=
 to<br>
be? Why not a simple unsigned int or char or whatever you need?<br></blockq=
uote><div><br></div><div>My thinking was just that it&#39;s nicer to see as=
i_taints_t and know that it means &quot;it holds taint flags and it&#39;s b=
ig enough&quot; instead of having to remember the space needed for these fl=
ags. But yeah I&#39;m fine with making it a raw integer type.</div><div><br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +#define ASI_TAINTS_CONTROL_MASK \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(ASI_TAINT_USER_CONTROL | ASI_TAINT_GUEST_CONTROL=
 | ASI_TAINT_OTHER_MM_CONTROL)<br>
&gt; +<br>
&gt; +#define ASI_TAINTS_DATA_MASK \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0(ASI_TAINT_KERNEL_DATA | ASI_TAINT_USER_DATA | AS=
I_TAINT_OTHER_MM_DATA)<br>
&gt; +<br>
&gt; +#define ASI_TAINTS_GUEST_MASK (ASI_TAINT_GUEST_DATA | ASI_TAINT_GUEST=
_CONTROL)<br>
&gt; +#define ASI_TAINTS_USER_MASK (ASI_TAINT_USER_DATA | ASI_TAINT_USER_CO=
NTROL)<br>
&gt; +<br>
&gt; +/* The taint policy tells ASI how a class interacts with the CPU tain=
ts */<br>
&gt; +struct asi_taint_policy {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0/*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * What taints would necessitate a flush when ent=
ering the domain, to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 * protect it from attack by prior domains?<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0asi_taints_t prevent_control;<br>
<br>
So if those necessitate a flush, why isn&#39;t this var called &quot;taints=
_to_flush&quot;<br>
or whatever which exactly explains what it is?<br></blockquote><div><br>Wel=
l it needs to be disambiguated from the field below (currently protect_data=
) but it could be control_to_flush (and data_to_flush).<br><br>The downside=
 of that is that having one say &quot;prevent&quot; and one say &quot;prote=
ct&quot; is quite meaningful. prevent_control is describing things we need =
to do to protect the system from this domain, protect_data is about protect=
ing the domain from the system. However, while that difference is meaningfu=
l it might not actually be helpful for the reader of the code so I&#39;m no=
t wed to it.<br><br>Also worth noting that we could just combine these fiel=
ds. At present they should have disjoint bits set. But, they&#39;re used in=
 separate contexts and have separate (although conceptually very similar) m=
eanings, so I think that would reduce clarity.<br></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">
Spellchecker please. Go over your whole set.<br></blockquote><div><br>Ack, =
I&#39;ve set up a local thingy to spellcheck all my commits so hopefully yo=
u should encounter less of that noise in future.<br><br>For the pronouns st=
uff I will do my best but you might still spot violations in older text, so=
rry about that.<br><br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
&gt; +=C2=A0 =C2=A0 =C2=A0/* What taints should be set when entering the do=
main? */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0asi_taints_t set;<br>
<br>
<br>
So &quot;required_taints&quot; or so... hm?<br></blockquote><div><br></div>=
<div>What this field is describing is: when we run the untrusted code, what=
 happens? I don&#39;t mean &quot;what does the kernel do&quot; but what phy=
sically happens on the CPU from an exploit point of view.=C2=A0<br><br>For =
example setting ASI_TAINT_USER_DATA in this field means &quot;when we run t=
he untrusted code (i.e. userspace), userspace data gets left behind in side=
channels&quot;.<br><br>&quot;Should be set&quot; in the comment means &quot=
;this field should be set to record that a thing has happened&quot; not &qu=
ot;this field being set is a requirement for some API&quot; or something. S=
o I don&#39;t think &quot;required&quot; is right but this is hard to name.=
<br><br>That commentary should also be expanded I think, since &quot;should=
 be set&quot; is pretty ambiguous. And maybe if we called it &quot;to_set&q=
uot; it would be more obvious that &quot;set&quot; is a verb? I&#39;m very =
open to suggestions.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
&gt; +<br>
&gt; +void asi_init_mm_state(struct mm_struct *mm);<br>
&gt; +<br>
&gt; +int asi_init_class(enum asi_class_id class_id, struct asi_taint_polic=
y *taint_policy);<br>
&gt; +void asi_uninit_class(enum asi_class_id class_id);<br>
<br>
&quot;uninit&quot;, meh. &quot;exit&quot; perhaps? or &quot;destroy&quot;</=
blockquote><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
And you have &quot;asi_destroy&quot; already so I guess you can do:<br>
<br>
asi_class_init()<br>
asi_class_destroy()<br>
<br>
to have the namespace correct.<br></blockquote><div><br></div>Yeah, not sur=
e what I was thinking here!<br><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
&gt; +static __always_inline bool asi_is_tense(void)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 =C2=A0return !asi_is_relaxed();<br>
&gt; +}<br>
<br>
So can we tone down the silly helpers above? You don&#39;t really need<br>
asi_is_tense() for example. It is still very intuitive if I read<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!asi_is_relaxed())<br>
<br></blockquote><div>Yep that sounds good.=C2=A0</div><div><br></div></div=
></div>

--0000000000002ec785062e7f0a0e--

