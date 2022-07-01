Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 711D9563078
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 11:42:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ9Gm2nR4z3dt0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 19:42:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o/icSX7E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::b34; helo=mail-yb1-xb34.google.com; envelope-from=elver@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=o/icSX7E;
	dkim-atps=neutral
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ9G72Gm1z3cfD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 19:42:06 +1000 (AEST)
Received: by mail-yb1-xb34.google.com with SMTP id l11so3028475ybu.13
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Jul 2022 02:42:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=7WkaE4UplPR9g6PXITQSoGxqocYmDuMj7V8IXNG4nHE=;
        b=o/icSX7EYaDr5CQtcNGx2zhumstPfDHcBFWg+on1+8CGEhnmQUB86cqAxXNMAFUUYP
         MkiPmIY82JD9hW60FTI9nyiZl/taPYZGVyMbgAX5mmoCiokjtSiB3EUiP6ncWaFXQasV
         f5DXC87Sp7HMHIM5Db5Bu0pIIb2wdZWrq5p9F2JccFYjppf3+lg5PSzjCgCHCV1PO4uf
         sfj1PId5y4l1HNhL+6rlz04kTFQtat0PnjxGgfqZ9jjwJmS1TGXuosAb3QWfuctC4off
         p+975vNhN2+WZkNwfZFN1n9dHsM7dklac1kBCIRt6DBgI6A0PzWOyP7XHUlkntzsDamH
         sSeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=7WkaE4UplPR9g6PXITQSoGxqocYmDuMj7V8IXNG4nHE=;
        b=4G5uX4jGlni2qNvDOjpPRv4KSCHwEMI6s9+Z8SstmAArRLN7LERZa+HN7/cIk2553h
         i6G6RqUTNbQaq73OA3bm2JkUsP7bJxYenjWnPI9+L3ywVOHGb88ObMhhV8pdAqylPNsl
         VO/bxy8uVq5UF9NfaXmCRB3Q+BLbrQ0WjIeUfs0IHBg1ITMGv6kGYxMDZoC8rOx+f96+
         TXQELK8MWu64TCD9qSQ/qjQocfdTxdZmj2ImYnhEY25cR9DPNCjcFcJEp9T0AI3Os69r
         fgOmnr4t8CuM9BlgR1Sv1L/aahfsIhwFj3FaQmy/plESA/ThHsp0+gK3O2smCXrtpcNx
         fxOw==
X-Gm-Message-State: AJIora8V/rl8pOZv0r27o/yaEkZrFIajIreGHV5Nvb0sO9Uz5eurZFYs
	X38izCZ9sMZepvqyiUkPUF1flSsLlJCkB9z2a+5q5A==
X-Google-Smtp-Source: AGRyM1vGyRnUQaQ2a9Cl91wMlrhSEkd/ZeG5HlS8zoLj0GJa+tXHl0U3awLZiSPBVgIXdFQYboQuB7lYervCr/HAOs0=
X-Received: by 2002:a25:94a:0:b0:668:df94:fdf4 with SMTP id
 u10-20020a25094a000000b00668df94fdf4mr13606867ybm.425.1656668521567; Fri, 01
 Jul 2022 02:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220628095833.2579903-1-elver@google.com> <20220628095833.2579903-9-elver@google.com>
 <045a825c-cd7d-5878-d655-3d55fffb9ac2@csgroup.eu>
In-Reply-To: <045a825c-cd7d-5878-d655-3d55fffb9ac2@csgroup.eu>
From: Marco Elver <elver@google.com>
Date: Fri, 1 Jul 2022 11:41:25 +0200
Message-ID: <CANpmjNOeyZ0MZ_esOnR7TUE1R5Vf+_Ejt5JRQ1AoAmhkCrVrBA@mail.gmail.com>
Subject: Re: [PATCH v2 08/13] powerpc/hw_breakpoint: Avoid relying on caller synchronization
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Mark Rutland <mark.rutland@arm.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@redhat.com>, Frederic Weisbecker <frederic@kernel.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnaldo Carvalho de Melo <acme@kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 1 Jul 2022 at 10:54, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi Marco,
>
> Le 28/06/2022 =C3=A0 11:58, Marco Elver a =C3=A9crit :
> > Internal data structures (cpu_bps, task_bps) of powerpc's hw_breakpoint
> > implementation have relied on nr_bp_mutex serializing access to them.
> >
> > Before overhauling synchronization of kernel/events/hw_breakpoint.c,
> > introduce 2 spinlocks to synchronize cpu_bps and task_bps respectively,
> > thus avoiding reliance on callers synchronizing powerpc's hw_breakpoint=
.
>
> We have an still opened old issue in our database related to
> hw_breakpoint, I was wondering if it could have any link with the
> changes you are doing and whether you could handle it at the same time.
>
> https://github.com/linuxppc/issues/issues/38
>
> Maybe it is completely unrelated, but as your series modifies only
> powerpc and as the issue says that powerpc is the only one to do that, I
> thought it might be worth a hand up.

I see the powerpc issue unrelated to the optimizations in this series;
perhaps by fixing the powerpc issue, it would also become more
optimal. But all I saw is that it just so happens that powerpc relied
on the nr_bp_mutex which is going away.

This series will become even more complex if I decided to add a
powerpc rework on top (notwithstanding the fact I don't have any ppc
hardware at my disposal either). A separate series/patch seems much
more appropriate.

Thanks,
-- Marco
