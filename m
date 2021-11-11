Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A72F44D42A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 10:37:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hqc7R27hhz3bjC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 20:37:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=UpJAsHH3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::32f;
 helo=mail-ot1-x32f.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=UpJAsHH3; dkim-atps=neutral
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hqc6l138Kz2yNp
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 20:36:30 +1100 (AEDT)
Received: by mail-ot1-x32f.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so8096100otl.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 01:36:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FQNotspdE85/ckyfVd22yizASeOICaHxBSL2D6Rwwpw=;
 b=UpJAsHH3wXt4nQODZVjA9FrGKUqqDF32IatYTS1SYxwoDbaRut+X6zfgkOHGkn0yt0
 CNegVOkjnK2sjy9Nms1243+zJFMjwFxKJ0owcLdYwK4/PjI+gpArN+24oajV3xi/bhAy
 y4ZTyZR4eWiJ2OqOTzZEw2+igo64Nc8xI9URhaWwqZL/ND7O6tYzZtsA/GOBw2sWuoEm
 +sywwDbjeG7T5ZEbZY9f9HgkehvolqW8JKcnjE2AosQdOyQoLdVupvgtXCV4bh2itKzF
 r4pIhz+pgijcQhHbDC5rWqcGvaxt/0sD85qniaK0p3CW+j8Sz9/u8rlcxct8jbsPhSNe
 rQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FQNotspdE85/ckyfVd22yizASeOICaHxBSL2D6Rwwpw=;
 b=7dqEWJGRzFLfIVyrKnfTOh/usDXTnGCpki8kXgUUwsKOj33jn9R8OyBY1/ENFxnqYl
 kdZEww7UbBwui7J0MU60dWQ9DqcP/nYAc0l10229z0JoP7lETUYJgt+xap8ktHVXCecu
 0xxe+OXeiMTWT1nYQhq/fcVg1CJ+Im88UiZVczadhXVCzWXl9YecdNSVvicE74ngyTHB
 dQNmW0hQP1XxDdHPpyu2+3iiC02xgxJS12yh6pWy6dmbnvNyZ+RGta11gSmZr4tHgg7B
 vrftBuya19EVyI4Igj17J0N+xJJ9VdcIuNohGMcjn8+gHmy3wWd+mjCAQy/WqfNU5UEV
 uzgA==
X-Gm-Message-State: AOAM531TcEsLmAj6/058yQ5cXCNtQ0bplpPCB0H3Zqb2cgkeWql1DGb4
 AGnFpjqiMLmaHT/8l4je2kiszWKxqLpaYqBGJQYcMw==
X-Google-Smtp-Source: ABdhPJyQO1Ypmss7F9JtBJvfyJ2T6gA/zHz3aGDcxE2LvRHMlB0JEESu8sJ8bZ99S47xs/37ijAQqTB+ACr333KyuJw=
X-Received: by 2002:a9d:77d1:: with SMTP id w17mr4791136otl.329.1636623388618; 
 Thu, 11 Nov 2021 01:36:28 -0800 (PST)
MIME-Version: 1.0
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-3-valentin.schneider@arm.com>
 <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
 <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de>
 <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
In-Reply-To: <a7febd8825a2ab99bd1999664c6d4aa618b49442.camel@gmx.de>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Nov 2021 10:36:17 +0100
Message-ID: <CANpmjNPeRwupeg=S8yGGUracoehSUbS-Fkfb8juv5mYN36uiqg@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
To: Mike Galbraith <efault@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Ingo Molnar <mingo@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Steven Rostedt <rostedt@goodmis.org>,
 Masahiro Yamada <masahiroy@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Valentin Schneider <valentin.schneider@arm.com>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Nov 2021 at 04:47, Mike Galbraith <efault@gmx.de> wrote:
>
> On Thu, 2021-11-11 at 04:35 +0100, Mike Galbraith wrote:
> > On Thu, 2021-11-11 at 04:16 +0100, Mike Galbraith wrote:
> > > On Wed, 2021-11-10 at 20:24 +0000, Valentin Schneider wrote:
> > > >
> > > > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > > > index 5f8db54226af..0640d5622496 100644
> > > > --- a/include/linux/sched.h
> > > > +++ b/include/linux/sched.h
> > > > @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
> > > >  #endif
> > > >  }
> > > >
> > > > +#ifdef CONFIG_PREEMPT_DYNAMIC
> > > > +
> > > > +extern bool is_preempt_none(void);
> > > > +extern bool is_preempt_voluntary(void);
> > > > +extern bool is_preempt_full(void);
> > > > +
> > > > +#else
> > > > +
> > > > +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
> > > > +#define is_preempt_voluntary()
> > > > IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
> > > > +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
> > >
> > > I think that should be IS_ENABLED(CONFIG_PREEMPTION), see
> > > c1a280b68d4e.
> > >
> > > Noticed while applying the series to an RT tree, where tglx
> > > has done that replacement to the powerpc spot your next patch
> > > diddles.
> >
> > Damn, then comes patch 5 properly differentiating PREEMPT/PREEMPT_RT.
>
> So I suppose the powerpc spot should remain CONFIG_PREEMPT and become
> CONFIG_PREEMPTION when the RT change gets merged, because that spot is
> about full preemptibility, not a distinct preemption model.
>
> That's rather annoying :-/

I guess the question is if is_preempt_full() should be true also if
is_preempt_rt() is true?

Not sure all cases are happy with that, e.g. the kernel/trace/trace.c
case, which wants to print the precise preemption level.

To avoid confusion, I'd introduce another helper that says true if the
preemption level is "at least full", currently that'd be "full or rt".
Something like is_preempt_full_or_rt() (but might as well write
"is_preempt_full() || is_preempt_rt()"), or is_preemption() (to match
that Kconfig variable, although it's slightly confusing). The
implementation of that helper can just be a static inline function
returning "is_preempt_full() || is_preempt_rt()".

Would that help?
