Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C86065A42EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 08:04:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGKf84kb3z3fgC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 16:04:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XY395wkd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1129; helo=mail-yw1-x1129.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=XY395wkd;
	dkim-atps=neutral
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGKZY1gKlz3fR1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 16:01:39 +1000 (AEST)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-324ec5a9e97so170359807b3.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Aug 2022 23:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=GcD+HCTsL9PhfIoNQS6OfBy4IaHMHLVbPkWLbk6HzGE=;
        b=XY395wkduWKer9JhMF4//DaIUGT8Tpq+rJg8KPi7+iDqC3nEL76fphCBKa0TADUs5Y
         Pe+d0UGynDBtTe1J4PaLOJkDrEoC6fKoRDinEw6wRmRJHf6OGEM8g/81+ISe+2YWe4/f
         1FWlDKRedxpgzo/cXaHo7N0rN/NxKV13AkVrqJheYKc921pnefWieUUjI0/9PMLyrkYF
         +54ESHy7T0wT56qYZ/EujWYUASmbOawas8ItKc1fhdlWD/UOebAoskL9awaewc41GQKB
         hW7U8lvsupulNrvPERA4OlUGCBbSW501Y9m1mOYt4Krbsw3K+dGc1Ps8S/bVkskF8+pe
         c50w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=GcD+HCTsL9PhfIoNQS6OfBy4IaHMHLVbPkWLbk6HzGE=;
        b=qeWJwy9QKlpjNAQhKXVDmr9t/2BuLzm4aDU0cTwO94ow5O+RI43YdcUwy1WLh2ZkDZ
         o+4FPgwhUpJTwhfs2+SOPejRzk1zNJ9JMQoBsxj1+DhgwITqJ3c61NKgV8yGXcVjRGVf
         m5XH8UI9+5UibaF37m/Nn/2snIre2X2fkokEjigKGGkKPZQc+Yzgs1eKSlO+Wvwip4DW
         HG/8RuZzg3nrzYksqXKki4oaeEGPzAMHMVyMsCwlElyVd6HLX57frWB+Z+Tvw/ODLX5u
         0oo/YYrFrWD5VWdccW5V71Z9RPS/8bY+fnte82PFbZ51+A4Xi5oC4MXvqZU38as4wWs5
         n9ig==
X-Gm-Message-State: ACgBeo01sv7vHfd2aSQdY2+diEEsX6R1AV5l2TzzxBmsc2NsC1x4Vm5S
	yCn8J8UlazZ1vbMofYoR/PdduiKXNZ6YrBry8OMa9w==
X-Google-Smtp-Source: AA6agR4OkRBDBHVTlnL+FH4iL1r8QAUgTcU+5pqwP3zJY+yINE0mXfWAktGCQb8zpFBt1Kxb6U4Hazqq5HVKOejO/UE=
X-Received: by 2002:a0d:ea49:0:b0:33d:bce7:25c2 with SMTP id
 t70-20020a0dea49000000b0033dbce725c2mr8651338ywe.267.1661752896882; Sun, 28
 Aug 2022 23:01:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220704150514.48816-1-elver@google.com> <20220704150514.48816-11-elver@google.com>
 <YvzjeEHYX9d5dhAt@worktop.programming.kicks-ass.net>
In-Reply-To: <YvzjeEHYX9d5dhAt@worktop.programming.kicks-ass.net>
From: Marco Elver <elver@google.com>
Date: Mon, 29 Aug 2022 08:00:00 +0200
Message-ID: <CANpmjNPSOnMN3Fc4yxoArTytQcW4n6sPCN-LnisTn58xLU=4HA@mail.gmail.com>
Subject: Re: [PATCH v3 10/14] locking/percpu-rwsem: Add percpu_is_write_locked()
 and percpu_is_read_locked()
To: Peter Zijlstra <peterz@infradead.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 17 Aug 2022 at 14:48, Peter Zijlstra <peterz@infradead.org> wrote:
> On Mon, Jul 04, 2022 at 05:05:10PM +0200, Marco Elver wrote:
> > +bool percpu_is_read_locked(struct percpu_rw_semaphore *sem)
> > +{
> > +     return per_cpu_sum(*sem->read_count) != 0;
> > +}
> > +EXPORT_SYMBOL_GPL(percpu_is_read_locked);
>
> I don't think this is correct; read_count can have spurious increments.
>
> If we look at __percpu_down_read_trylock(), it does roughly something
> like this:
>
>         this_cpu_inc(*sem->read_count);
>         smp_mb();
>         if (!sem->block)
>                 return true;
>         this_cpu_dec(*sem->read_count);
>         return false;
>
> So percpu_is_read_locked() needs to ensure the read_count is non-zero
> *and* that block is not set.

I shall go and fix. v4 incoming (if more comments before that, please shout).

> That said; I really dislike the whole _is_locked family with a passion.
> Let me try and figure out what you need this for.

As in the other email, it's for the dbg_*() functions for kgdb's
benefit (avoiding deadlock if kgdb wants a breakpoint, while we're in
the process of handing out a breakpoint elsewhere and have the locks
taken).

Thanks,
-- Marco
