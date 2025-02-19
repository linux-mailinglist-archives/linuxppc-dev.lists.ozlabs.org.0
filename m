Return-Path: <linuxppc-dev+bounces-6351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF840A3C09A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 14:53:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YydC21brPz3054;
	Thu, 20 Feb 2025 00:53:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::82c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739973198;
	cv=none; b=jhrqtofGp5V028GvxyOISVPS4ayZc9mB3QtmINHgYWZgNW9iHEmZUh6w2PndfDvqplSyXToDSzhtxbnVwbna6a4hetYter5xBjz+op2sK13u3d8CNLq/PkpCOzb0HUqpySJhcTbq+TQcAvmogYOreOeyui+sBepGpirdjbXAPc6rkYcTI3O2fU2KVq6UO+D20jfV/4IB2J54JE2rGS7NGCsNtBOBk2zSwdHV/UH1p9fUPZXg49pFe2WhOyz+z+API8kIQPpg84ml6PWWqfWMW6bOqKkvVR9sMaMuQ5UZK5dyjLTLXlFqt9nSPO3quwQ0cmzJ4jRLVy/ZLU0QnEjQpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739973198; c=relaxed/relaxed;
	bh=UdmAiMEeKrPEDg3p+jo+2xFKJGKxXYyTYb14zoBH7Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=O0hWilrQe/vSsVfxkrwqCDmkmH3U13VLwS0FvnYK4yaGx96nSpyvfa/TzMpFMN9ahNNgwnnhP8vWW5YtNN1ElCHFeu1EGd1siDDVmUQ8UOWuSAYuAUwVnOc3h9buFThZH8uL5fURW+sykwYG20Y1FENNkcdibsMSF+Nw+pyLsH22pmRX/AVf2qG/MzK8K8p8VXcnwpDB28w4NmBFOr3t8EsjyCVvVAFyo7yDbR1z/UtWfVgwRK5drSnj0CWbNtvkUX7gXfRNdKa0digs9PAiDYzptuFvuQT5X6Jlb8wiIzL15EVEgiZiD8WMQ6VH1kh9rvxDixAVdYU1LfYWs4gvAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aq+13hHH; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=jackmanb@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=aq+13hHH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::82c; helo=mail-qt1-x82c.google.com; envelope-from=jackmanb@google.com; receiver=lists.ozlabs.org)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YydC12Cwdz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 00:53:17 +1100 (AEDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-472098e6e75so311081cf.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 05:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739973195; x=1740577995; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UdmAiMEeKrPEDg3p+jo+2xFKJGKxXYyTYb14zoBH7Bo=;
        b=aq+13hHHVdLFcjOSQ6pyp831oQcfqj1YRO2h76RgOJAt9p46XgyW2CjA9v2TSw5luB
         jXzcwaNf+kUTxfroTFshIW1OSB70waDfdtpxwskbeq6sWMQAsXJVRkks+VXFFNXmDtYF
         JJ3fdQ/v4Nge+ssFay5LVKKcFTGuRNLobuX+JTFdyezkAZHJ9fZ7nYhJ4bXEm/uwkEep
         C/n1yWWHvRTPS8XX+FUiI1F+TtAb+oriShXhmnAZbkAxzqIwlniT2qalfrfuoL9kmSzG
         BiZTM4RVMCwgveJf75QIGiGMAzFPewhZKDWPe66noJ86SMbm9LNcWeac3vOW8qwaoPg+
         /k1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739973195; x=1740577995;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UdmAiMEeKrPEDg3p+jo+2xFKJGKxXYyTYb14zoBH7Bo=;
        b=Hz+K8f4KuuNYHpkaRt8Ii62nd2qt/rWm95AN6ZRd+CHC1rfutAWcpyLxX3Jw2yjX8y
         gr7BU/wELWwCkc4gQTrWm479Uhxp3iJG2vuJ+w45fQR6IDrZflfXwuqN81NfRCTIATIV
         O1Bd7pxHCvSZ09BoE2U9vGbE/I3iIq+1rhmTrpYxWRqXI/wsxl2HqKDm5Jzvm2w55F35
         MjejxJE+tc1RhY5+RQBIwb8Z9FygHrokjr0OxpSR68stq878IZAEVMPF2xE4bpJEUbHJ
         +tZyxviT/QQ5pSsReVAh8un0gKkd2ekvNrdNuzfDRFI6fPKgTDfMC0CCYpI11GOodt1L
         hh4A==
X-Forwarded-Encrypted: i=1; AJvYcCX2X0LuiQ7hbSQuMwyjzg58vMOjl4/mXyMOkYoUvCESoia6ILrOwyptik10wN+q2QGz8Grz21d8gcFVvVc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxXrKsmaQ8VYpO9rh17ixs6rEOjOyvXsm/4b8/YPMUzp0ne8XIq
	lO9c31m2pLApQPuDOHDcVet25RowzwzmuR86FzK7D05d3fRO7QGCo9/C1Psl0zvqv3T0Fa5KVug
	Iwfc0m5wiO+XzJ2MIVbqUgcfD6FTlmB+MpOKx
X-Gm-Gg: ASbGncu/aYWvSZu2vnP2dX22lt/crSxXdvkiQxZFRqrQLiBFPT5+Cnf2iJ7GVXAZxje
	4Rk2YQjAIzaPBll/mZblbSq2Q0pdJtuSqk5pZ7HFgZu/LmcmM3ANZ/yV+rifsgJG+jgUPZGTt+D
	S6NpSOl12T7zc2hZrG3Ew1urUJdvM=
X-Google-Smtp-Source: AGHT+IENNUmIuZuxSQylUApjIg4cKkgEiog4c3mRT0+zySA3cwktAnc8eGuiyh3/xKClKXO5dwBsFhWfn2uiV/6urfI=
X-Received: by 2002:a05:622a:85:b0:471:b772:c717 with SMTP id
 d75a77b69052e-472097c2b32mr3540781cf.26.1739973194577; Wed, 19 Feb 2025
 05:53:14 -0800 (PST)
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
Date: Wed, 19 Feb 2025 14:53:03 +0100
X-Gm-Features: AWEUYZnAiIsbh62TRn4xLoxaltzDiT1dCIBY-Pnf2HWy-DCtrTT9-DxdH-ccpBo
Message-ID: <CA+i-1C2xK8hzMQ8Y-=-7iYy+27nnouQZu1NdWG0qa35t+OQLqw@mail.gmail.com>
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
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Argh, sorry, GMail switched back to HTML mode somehow. Maybe I have to
get a proper mail client after all.

Here's the clean version.

On Wed, 19 Feb 2025 at 11:57, Borislav Petkov <bp@alien8.de> wrote:
>
> > + * Runtime usage:
> > + *
> > + * 1. Call asi_enter() to switch to the restricted address space. This can't be
> > + *    from an interrupt or exception handler and preemption must be disabled.
> > + *
> > + * 2. Execute untrusted code.
> > + *
> > + * 3. Call asi_relax() to inform the ASI subsystem that untrusted code execution
> > + *    is finished. This doesn't cause any address space change. This can't be
> > + *    from an interrupt or exception handler and preemption must be disabled.
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


OK, sounds like I need to rewrite this explanation! It's only been
read before by people who already knew how this thing worked so this
might take a few attempts to make it clear.

Maybe the best way to make it clear is to explain this with reference
to KVM. At a super high level, That looks like:

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

This explanation was written when that was the only user of this API
so it was probably clearer, now we have userspace it seems a bit odd.

With my pseudocode above, does it make more sense? If so I'll try to
think of a better way to explain it.

> /*
>  * Leave the "tense" state if we are in it, i.e. end the critical section. We
>  * will stay relaxed until the next asi_enter.
>  */
> void asi_relax(void);
>
> Yeah, so there's no API functions balance between enter() and relax()...


asi_enter() is actually balanced with asi_relax(). The comment says
"if we are in it" because technically if you call this asi_relax()
outside of the critical section, it's a nop. But, there's no reason to
do that, so we could definitely change the comment and WARN if that
happens.

>
> > +#define ASI_TAINT_OTHER_MM_CONTROL   ((asi_taints_t)BIT(6))
> > +#define ASI_NUM_TAINTS                       6
> > +static_assert(BITS_PER_BYTE * sizeof(asi_taints_t) >= ASI_NUM_TAINTS);
>
> Why is this a typedef at all to make the code more unreadable than it needs to
> be? Why not a simple unsigned int or char or whatever you need?


My thinking was just that it's nicer to see asi_taints_t and know that
it means "it holds taint flags and it's big enough" instead of having
to remember the space needed for these flags. But yeah I'm fine with
making it a raw integer type.

> > +#define ASI_TAINTS_CONTROL_MASK \
> > +     (ASI_TAINT_USER_CONTROL | ASI_TAINT_GUEST_CONTROL | ASI_TAINT_OTHER_MM_CONTROL)
> > +
> > +#define ASI_TAINTS_DATA_MASK \
> > +     (ASI_TAINT_KERNEL_DATA | ASI_TAINT_USER_DATA | ASI_TAINT_OTHER_MM_DATA)
> > +
> > +#define ASI_TAINTS_GUEST_MASK (ASI_TAINT_GUEST_DATA | ASI_TAINT_GUEST_CONTROL)
> > +#define ASI_TAINTS_USER_MASK (ASI_TAINT_USER_DATA | ASI_TAINT_USER_CONTROL)
> > +
> > +/* The taint policy tells ASI how a class interacts with the CPU taints */
> > +struct asi_taint_policy {
> > +     /*
> > +      * What taints would necessitate a flush when entering the domain, to
> > +      * protect it from attack by prior domains?
> > +      */
> > +     asi_taints_t prevent_control;
>
> So if those necessitate a flush, why isn't this var called "taints_to_flush"
> or whatever which exactly explains what it is?


Well it needs to be disambiguated from the field below (currently
protect_data) but it could be control_to_flush (and data_to_flush).

The downside of that is that having one say "prevent" and one say
"protect" is quite meaningful. prevent_control is describing things we
need to do to protect the system from this domain, protect_data is
about protecting the domain from the system. However, while that
difference is meaningful it might not actually be helpful for the
reader of the code so I'm not wed to it.

Also worth noting that we could just combine these fields. At present
they should have disjoint bits set. But, they're used in separate
contexts and have separate (although conceptually very similar)
meanings, so I think that would reduce clarity.

>
> Spellchecker please. Go over your whole set.


Ack, I've set up a local thingy to spellcheck all my commits so
hopefully you should encounter less of that noise in future.

For the pronouns stuff I will do my best but you might still spot
violations in older text, sorry about that.

> > +     /* What taints should be set when entering the domain? */
> > +     asi_taints_t set;
>
>
> So "required_taints" or so... hm?


What this field is describing is: when we run the untrusted code, what
happens? I don't mean "what does the kernel do" but what physically
happens on the CPU from an exploit point of view.

For example setting ASI_TAINT_USER_DATA in this field means "when we
run the untrusted code (i.e. userspace), userspace data gets left
behind in sidechannels".

"Should be set" in the comment means "this field should be set to
record that a thing has happened" not "this field being set is a
requirement for some API" or something. So I don't think "required" is
right but this is hard to name.

That commentary should also be expanded I think, since "should be set"
is pretty ambiguous. And maybe if we called it "to_set" it would be
more obvious that "set" is a verb? I'm very open to suggestions.

>
> > +
> > +void asi_init_mm_state(struct mm_struct *mm);
> > +
> > +int asi_init_class(enum asi_class_id class_id, struct asi_taint_policy *taint_policy);
> > +void asi_uninit_class(enum asi_class_id class_id);
>
> "uninit", meh. "exit" perhaps? or "destroy"


>
> And you have "asi_destroy" already so I guess you can do:
>
> asi_class_init()
> asi_class_destroy()
>
> to have the namespace correct.


Yeah, not sure what I was thinking here!

>
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
Yep that sounds good.

