Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A21802C5EE0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 04:14:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj08s4x0wzDrSN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 14:14:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::644;
 helo=mail-ej1-x644.google.com; envelope-from=morbo@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=tgCdr1PR; dkim-atps=neutral
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com
 [IPv6:2a00:1450:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChxQq6N1WzDrRd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 12:11:14 +1100 (AEDT)
Received: by mail-ej1-x644.google.com with SMTP id bo9so5251195ejb.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Nov 2020 17:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0x4nnMkHcynIez1nPznTtPoKd0WmmPj/YGGV6xq0FUE=;
 b=tgCdr1PRZnQAPP3RhQdUpBOOHDOJzOuR4vk/r34HGPr/R0ayg1kjfsD81VCdEBK3Wn
 rhrTYCGhNmoxfoQ60/4maRUQ9Xah9REElwhfvsFLvohbJOUV3CqTQrzAcgWUBfXMHMhN
 fpECI5dWaBaNb8DOungnsz3JeWL5WwUWo9ga9EUMFColH5G1zgx3yDqK3+myK41DqFXq
 zGfa2MkJLBJNXf65u1UREI7IuoIAE4r6ZmWpZOvl6KrgA7HKJL6C4O1TsJq88SlTMOnT
 8NmilErB1/UEZoqiFjucErdR5jImebtAXod1AH4193L4L3SS7ewryyvzpXywME3EdGMB
 GUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0x4nnMkHcynIez1nPznTtPoKd0WmmPj/YGGV6xq0FUE=;
 b=q1sME+leKDEONYQGmKH+Q2KdvhcASz9QsM2Q/8KkoDdzvZb9bEM0SmnG3zYgek8r80
 egTSQF5kG+zs4ZgObTfQvV+kGwhKJRZlUcy/X8DqOZCyfDJqIroMDWj1ZlEj9DgQ5ewY
 4qYmoDG06PgFjI7MCJEywcZEtZgqdoYH1hqNDfZvPcLHmjpzjTkCL48fdrQjn5p1IgH7
 YCSvYmfoDa+i0lq+gngxMEduLDijb1NlzBAmir4umHBXtQeBkAna7PDquDcAkczedjxJ
 HYhvS6nokMonGYzmE9ORk7zv2+tW6XPixfvO/528Koz0+vvlPMrVysllHfUdhQwckm8E
 JaNA==
X-Gm-Message-State: AOAM5316y7O0BAALrRW5zc+yGX3tFMDEi4B/8L8KQMtdS8bNkFNYGSuF
 Zaa56byq9xCywD63ledlgg1UvlmO6rE0AacOnxDx
X-Google-Smtp-Source: ABdhPJx7DPhieTAUdX6zqWDIbfUxbJF1apdounJSq6WQT/TnnHw9MaKco2Njpec35HFlgipTbuKnjzHdGAGfGRK2b28=
X-Received: by 2002:a17:906:4704:: with SMTP id
 y4mr5067521ejq.449.1606439469517; 
 Thu, 26 Nov 2020 17:11:09 -0800 (PST)
MIME-Version: 1.0
References: <20201118223513.2704722-1-morbo@google.com>
 <20201120224034.191382-1-morbo@google.com>
 <20201120224034.191382-4-morbo@google.com> <87d0041vaf.fsf@mpe.ellerman.id.au>
 <20201123063432.GG2672@gate.crashing.org>
 <CAGG=3QVjSAwU+ebvH=Lk5YVMxW7=ThvkJXGPw+95nYxxuurMig@mail.gmail.com>
 <20201123195622.GI2672@gate.crashing.org>
 <CAGG=3QXR=Yfh8PNa4m-kQLTBP4YKD8OGm_6fSUgeasQ1ar9b2g@mail.gmail.com>
 <20201123200846.GJ2672@gate.crashing.org>
 <CAGG=3QUeXTU+8jqw40W_rhatsHCRiuTboL3enz9bpt_jaJC3TA@mail.gmail.com>
 <87zh37zaf4.fsf@mpe.ellerman.id.au>
 <CAGG=3QUSF4UwcZQHhFE-PW6As7GVJknsyGkgVMENDXghABzy5A@mail.gmail.com>
 <87ft4vy5jp.fsf@mpe.ellerman.id.au>
In-Reply-To: <87ft4vy5jp.fsf@mpe.ellerman.id.au>
From: Bill Wendling <morbo@google.com>
Date: Thu, 26 Nov 2020 17:10:57 -0800
Message-ID: <CAGG=3QVXaHucF02k6F9jrvGe3iSjCcGu4SFRTp-aPM4OVArThg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] powerpc/64s: feature: Work around inline asm issues
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: multipart/alternative; boundary="000000000000ef922505b50c55c3"
X-Mailman-Approved-At: Fri, 27 Nov 2020 14:12:45 +1100
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--000000000000ef922505b50c55c3
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 26, 2020, 5:03 PM Michael Ellerman <mpe@ellerman.id.au> wrote:

> Bill Wendling <morbo@google.com> writes:
> > On Mon, Nov 23, 2020 at 7:44 PM Michael Ellerman <mpe@ellerman.id.au>
> wrote:
> >> Bill Wendling <morbo@google.com> writes:
> >> > On Mon, Nov 23, 2020 at 12:10 PM Segher Boessenkool
> >> > <segher@kernel.crashing.org> wrote:
> >> >> On Mon, Nov 23, 2020 at 12:01:01PM -0800, Bill Wendling wrote:
> >> >> > On Mon, Nov 23, 2020 at 11:58 AM Segher Boessenkool
> >> >> > <segher@kernel.crashing.org> wrote:
> >> >> > > > On Sun, Nov 22, 2020 at 10:36 PM Segher Boessenkool
> >> >> > > > <segher@kernel.crashing.org> wrote:
> >> >> > > > > "true" (as a result of a comparison) in as is -1, not 1.
> >> >> > >
> >> >> > > On Mon, Nov 23, 2020 at 11:43:11AM -0800, Bill Wendling wrote:
> >> >> > > > What Segher said. :-) Also, if you reverse the comparison,
> you'll get
> >> >> > > > a build error.
> >> >> > >
> >> >> > > But that means your patch is the wrong way around?
> >> >> > >
> >> >> > > -       .ifgt (label##4b- label##3b)-(label##2b- label##1b);    \
> >> >> > > -       .error "Feature section else case larger than body";    \
> >> >> > > -       .endif;                                                 \
> >> >> > > +       .org . - ((label##4b-label##3b) >
> (label##2b-label##1b)); \
> >> >> > >
> >> >> > > It should be a + in that last line, not a -.
> >> >> >
> >> >> > I said so in a follow up email.
> >> >>
> >> >> Yeah, and that arrived a second after I pressed "send" :-)
> >> >>
> >> > Michael, I apologize for the churn with these patches. I believe the
> >> > policy is to resend the match as "v4", correct?
> >> >
> >> > I ran tests with the change above. It compiled with no error. If I
> >> > switch the labels around to ".org . + ((label##2b-label##1b) >
> >> > (label##4b-label##3b))", then it fails as expected.
> >>
> >> I wanted to retain the nicer error reporting for gcc builds, so I did it
> >> like this:
> >>
> >> diff --git a/arch/powerpc/include/asm/feature-fixups.h
> b/arch/powerpc/include/asm/feature-fixups.h
> >> index b0af97add751..c4ad33074df5 100644
> >> --- a/arch/powerpc/include/asm/feature-fixups.h
> >> +++ b/arch/powerpc/include/asm/feature-fixups.h
> >> @@ -36,6 +36,24 @@ label##2:
> \
> >>         .align 2;                                       \
> >>  label##3:
> >>
> >> +
> >> +#ifndef CONFIG_CC_IS_CLANG
> >> +#define CHECK_ALT_SIZE(else_size, body_size)                   \
> >> +       .ifgt (else_size) - (body_size);                        \
> >> +       .error "Feature section else case larger than body";    \
> >> +       .endif;
> >> +#else
> >> +/*
> >> + * If we use the ifgt syntax above, clang's assembler complains about
> the
> >> + * expression being non-absolute when the code appears in an inline
> assembly
> >> + * statement.
> >> + * As a workaround use an .org directive that has no effect if the
> else case
> >> + * instructions are smaller than the body, but fails otherwise.
> >> + */
> >> +#define CHECK_ALT_SIZE(else_size, body_size)                   \
> >> +       .org . + ((else_size) > (body_size));
> >> +#endif
> >> +
> >>  #define MAKE_FTR_SECTION_ENTRY(msk, val, label, sect)          \
> >>  label##4:                                                      \
> >>         .popsection;                                            \
> >> @@ -48,9 +66,7 @@ label##5:
>          \
> >>         FTR_ENTRY_OFFSET label##2b-label##5b;                   \
> >>         FTR_ENTRY_OFFSET label##3b-label##5b;                   \
> >>         FTR_ENTRY_OFFSET label##4b-label##5b;                   \
> >> -       .ifgt (label##4b- label##3b)-(label##2b- label##1b);    \
> >> -       .error "Feature section else case larger than body";    \
> >> -       .endif;                                                 \
> >> +       CHECK_ALT_SIZE((label##4b-label##3b), (label##2b-label##1b)); \
> >>         .popsection;
> >>
> >>
> >>
> >> I've pushed a branch with all your patches applied to:
> >>
> >>   https://github.com/linuxppc/linux/commits/next-test
> >>
> > This works for me. Thanks!
>
> Great.
>
> >> Are you able to give that a quick test? It builds clean with clang for
> >> me, but we must be using different versions of clang because my branch
> >> already builds clean for me even without your patches.
> >>
> > You may need to set LLVM_IAS=1 to get the behavior I'm seeing. That
> > turns on clang's integrated assembler, which I think is disabled by
> > default.
>
> Yep that does it.
>
> But then I get:
>   clang: error: unsupported argument '-mpower4' to option 'Wa,'
>   clang: error: unsupported argument '-many' to option 'Wa,'
>
> So I guess I'm still missing something?
>

I've seen that too. I'm not entirely sure what's causing it, but I'll look
into it. I've got a backlog of things to work on still. :-) It's probably a
clang issue. There's another one that came up having to do with the format
of some PPC instructions. I have a clang fix on review for those.

> Note that with clang's integrated assembler, arch/powerpc/boot/util.S
> > fails to compile. Alan Modra mentioned that he sent you a patch to
> > "modernize" the file so that clang can compile it.
>
> Ah you're right he did, it didn't go to patchwork so I missed it. Have
> grabbed it now.
>

Thanks!
-bw

>

--000000000000ef922505b50c55c3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Thu, Nov 26, 2020, 5:03 PM Michael Ellerman &lt;<a =
href=3D"mailto:mpe@ellerman.id.au">mpe@ellerman.id.au</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">Bill Wendling &lt;<a href=3D"mailto:morbo=
@google.com" target=3D"_blank" rel=3D"noreferrer">morbo@google.com</a>&gt; =
writes:<br>
&gt; On Mon, Nov 23, 2020 at 7:44 PM Michael Ellerman &lt;<a href=3D"mailto=
:mpe@ellerman.id.au" target=3D"_blank" rel=3D"noreferrer">mpe@ellerman.id.a=
u</a>&gt; wrote:<br>
&gt;&gt; Bill Wendling &lt;<a href=3D"mailto:morbo@google.com" target=3D"_b=
lank" rel=3D"noreferrer">morbo@google.com</a>&gt; writes:<br>
&gt;&gt; &gt; On Mon, Nov 23, 2020 at 12:10 PM Segher Boessenkool<br>
&gt;&gt; &gt; &lt;<a href=3D"mailto:segher@kernel.crashing.org" target=3D"_=
blank" rel=3D"noreferrer">segher@kernel.crashing.org</a>&gt; wrote:<br>
&gt;&gt; &gt;&gt; On Mon, Nov 23, 2020 at 12:01:01PM -0800, Bill Wendling w=
rote:<br>
&gt;&gt; &gt;&gt; &gt; On Mon, Nov 23, 2020 at 11:58 AM Segher Boessenkool<=
br>
&gt;&gt; &gt;&gt; &gt; &lt;<a href=3D"mailto:segher@kernel.crashing.org" ta=
rget=3D"_blank" rel=3D"noreferrer">segher@kernel.crashing.org</a>&gt; wrote=
:<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; On Sun, Nov 22, 2020 at 10:36 PM Segher Bo=
essenkool<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &lt;<a href=3D"mailto:segher@kernel.crashi=
ng.org" target=3D"_blank" rel=3D"noreferrer">segher@kernel.crashing.org</a>=
&gt; wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; &gt; &quot;true&quot; (as a result of a co=
mparison) in as is -1, not 1.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; On Mon, Nov 23, 2020 at 11:43:11AM -0800, Bill =
Wendling wrote:<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; What Segher said. :-) Also, if you reverse=
 the comparison, you&#39;ll get<br>
&gt;&gt; &gt;&gt; &gt; &gt; &gt; a build error.<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; But that means your patch is the wrong way arou=
nd?<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.ifgt (label##4b- l=
abel##3b)-(label##2b- label##1b);=C2=A0 =C2=A0 \<br>
&gt;&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.error &quot;Featur=
e section else case larger than body&quot;;=C2=A0 =C2=A0 \<br>
&gt;&gt; &gt;&gt; &gt; &gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.endif;=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; &gt;&gt; &gt; &gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.org . - ((label##4=
b-label##3b) &gt; (label##2b-label##1b)); \<br>
&gt;&gt; &gt;&gt; &gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; &gt; It should be a + in that last line, not a -.<br=
>
&gt;&gt; &gt;&gt; &gt;<br>
&gt;&gt; &gt;&gt; &gt; I said so in a follow up email.<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt;&gt; Yeah, and that arrived a second after I pressed &quot;sen=
d&quot; :-)<br>
&gt;&gt; &gt;&gt;<br>
&gt;&gt; &gt; Michael, I apologize for the churn with these patches. I beli=
eve the<br>
&gt;&gt; &gt; policy is to resend the match as &quot;v4&quot;, correct?<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; I ran tests with the change above. It compiled with no error.=
 If I<br>
&gt;&gt; &gt; switch the labels around to &quot;.org . + ((label##2b-label#=
#1b) &gt;<br>
&gt;&gt; &gt; (label##4b-label##3b))&quot;, then it fails as expected.<br>
&gt;&gt;<br>
&gt;&gt; I wanted to retain the nicer error reporting for gcc builds, so I =
did it<br>
&gt;&gt; like this:<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/arch/powerpc/include/asm/feature-fixups.h b/arch/powe=
rpc/include/asm/feature-fixups.h<br>
&gt;&gt; index b0af97add751..c4ad33074df5 100644<br>
&gt;&gt; --- a/arch/powerpc/include/asm/feature-fixups.h<br>
&gt;&gt; +++ b/arch/powerpc/include/asm/feature-fixups.h<br>
&gt;&gt; @@ -36,6 +36,24 @@ label##2:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.align 2;=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt;=C2=A0 label##3:<br>
&gt;&gt;<br>
&gt;&gt; +<br>
&gt;&gt; +#ifndef CONFIG_CC_IS_CLANG<br>
&gt;&gt; +#define CHECK_ALT_SIZE(else_size, body_size)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.ifgt (else_size) - (body_size);=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.error &quot;Feature section else case=
 larger than body&quot;;=C2=A0 =C2=A0 \<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.endif;<br>
&gt;&gt; +#else<br>
&gt;&gt; +/*<br>
&gt;&gt; + * If we use the ifgt syntax above, clang&#39;s assembler complai=
ns about the<br>
&gt;&gt; + * expression being non-absolute when the code appears in an inli=
ne assembly<br>
&gt;&gt; + * statement.<br>
&gt;&gt; + * As a workaround use an .org directive that has no effect if th=
e else case<br>
&gt;&gt; + * instructions are smaller than the body, but fails otherwise.<b=
r>
&gt;&gt; + */<br>
&gt;&gt; +#define CHECK_ALT_SIZE(else_size, body_size)=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0.org . + ((else_size) &gt; (body_size)=
);<br>
&gt;&gt; +#endif<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 #define MAKE_FTR_SECTION_ENTRY(msk, val, label, sect)=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 label##4:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.popsection;=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
&gt;&gt; @@ -48,9 +66,7 @@ label##5:=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0\<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FTR_ENTRY_OFFSET label##2b-label#=
#5b;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FTR_ENTRY_OFFSET label##3b-label#=
#5b;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0FTR_ENTRY_OFFSET label##4b-label#=
#5b;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<=
br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.ifgt (label##4b- label##3b)-(label##2=
b- label##1b);=C2=A0 =C2=A0 \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.error &quot;Feature section else case=
 larger than body&quot;;=C2=A0 =C2=A0 \<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0.endif;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0CHECK_ALT_SIZE((label##4b-label##3b), =
(label##2b-label##1b)); \<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0.popsection;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; I&#39;ve pushed a branch with all your patches applied to:<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0<a href=3D"https://github.com/linuxppc/linux/commits/n=
ext-test" rel=3D"noreferrer noreferrer" target=3D"_blank">https://github.co=
m/linuxppc/linux/commits/next-test</a><br>
&gt;&gt;<br>
&gt; This works for me. Thanks!<br>
<br>
Great.<br>
<br>
&gt;&gt; Are you able to give that a quick test? It builds clean with clang=
 for<br>
&gt;&gt; me, but we must be using different versions of clang because my br=
anch<br>
&gt;&gt; already builds clean for me even without your patches.<br>
&gt;&gt;<br>
&gt; You may need to set LLVM_IAS=3D1 to get the behavior I&#39;m seeing. T=
hat<br>
&gt; turns on clang&#39;s integrated assembler, which I think is disabled b=
y<br>
&gt; default.<br>
<br>
Yep that does it.<br>
<br>
But then I get:<br>
=C2=A0 clang: error: unsupported argument &#39;-mpower4&#39; to option &#39=
;Wa,&#39;<br>
=C2=A0 clang: error: unsupported argument &#39;-many&#39; to option &#39;Wa=
,&#39;<br>
<br>
So I guess I&#39;m still missing something?<br></blockquote></div></div><di=
v dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ve seen that too. I&#39;m =
not entirely sure what&#39;s causing it, but I&#39;ll look into it. I&#39;v=
e got a backlog of things to work on still. :-) It&#39;s probably a clang i=
ssue. There&#39;s another one that came up having to do with the format of =
some PPC instructions. I have a clang fix on review for those.</div><div di=
r=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">
&gt; Note that with clang&#39;s integrated assembler, arch/powerpc/boot/uti=
l.S<br>
&gt; fails to compile. Alan Modra mentioned that he sent you a patch to<br>
&gt; &quot;modernize&quot; the file so that clang can compile it.<br>
<br>
Ah you&#39;re right he did, it didn&#39;t go to patchwork so I missed it. H=
ave<br>
grabbed it now.<br></blockquote></div></div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Thanks!</div><div dir=3D"auto">-bw</div><div dir=3D"auto"><d=
iv class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"></blockquote></div>=
</div></div>

--000000000000ef922505b50c55c3--
