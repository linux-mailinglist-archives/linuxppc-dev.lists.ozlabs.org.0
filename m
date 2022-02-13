Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BABC74B394C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 05:18:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JxDcd29Smz3cR2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 15:18:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SJ6s05Ho;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::634;
 helo=mail-ej1-x634.google.com; envelope-from=zhouzhouyi@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=SJ6s05Ho; dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxDby6NpJz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 15:18:05 +1100 (AEDT)
Received: by mail-ej1-x634.google.com with SMTP id hw13so2260324ejc.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 20:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+Ti2nk4zjdGL9qCHPI+wkzn/Zj6E+wju9LT/x+vfYco=;
 b=SJ6s05Ho3VIte1Mhbqxs8Q947UYeapNKgS4LOd6Axu7Z8VB6gv8gJZ9AINJY1KcmOH
 h36FRJQk0+lQUzhfc62qbJmbP+xH3+aWmiVe+Jj7U22WCA3UXwIEauB5ZElfOFAgryyx
 yfhhEwpu2SM4gF7Gq38FM8mJszOxGLFqOjEwq3Ll/qeMlQLbRvCsB3VkLDaovvSoRX87
 jlaEfHDD8lmDMWXLrVl3dar/7CbcBtrd/EEss3XFvivZBEmZSd1IHF9YCRbSyE4biYiY
 kVy0u87wlNNfdYFK0DHxCsS0FEURSP9j5NVjvuHqdFRNUJ8GPXMOxkSXKonydSxM4Kiv
 xDCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+Ti2nk4zjdGL9qCHPI+wkzn/Zj6E+wju9LT/x+vfYco=;
 b=A4EJ2wjyDEH9m/Lza+pfA8uxRaz7485MkfG+xFXvXWRBHC6B23nRkkoOHJx50Wtg+/
 YG0/B5BeWdSGkKqnCmaBLQJ4tGVMU0cGxGImlBQ1gvg5Q8SITAxxOp3GcrHG0PtCwUgM
 RooCLcea6GPSjQ532H0xxLlI9wRz1xFqZ2wjuUpuE/lNgXnNgpCTo4R9Jfz0GVyTnbEu
 ImUsuc9OwWHBW/bK6np3g8ocMOu3dSqmlAeq/XhS5wCfA4o4+rdsLNtmetMYTJJkrKgm
 EOtPRhQqii40fSIFL4JizySxeCQjRhN7yk6GoCFb8ilgMkfTd98/3b5BXTcjFo2LN0S3
 r5cw==
X-Gm-Message-State: AOAM531JyguNM5niJjxeiRgyZkgLmyd2VfFfJ1eUtC8cNN8NLk1hRrK5
 3Ms65XT9RYyMb7hB3OA3GDWrqP7aJLhIOzQoFDw=
X-Google-Smtp-Source: ABdhPJwxvsg2Ij6Z1o4x4TJvJwWJbP3hliNKXgonsOvcal8S7E6rhGePIR3CkCEEU3tglVkveoHAxt8qUGlZFAWHAJI=
X-Received: by 2002:a17:906:77d5:: with SMTP id
 m21mr1660225ejn.486.1644725882017; 
 Sat, 12 Feb 2022 20:18:02 -0800 (PST)
MIME-Version: 1.0
References: <244218af-df6a-236e-0a52-268247dd8271@molgen.mpg.de>
 <CAABZP2ycCjiZ0CySc2Lgr_DnUfuDf1iagEKnWwNEkVkR9-gADA@mail.gmail.com>
 <YgiEeHzz4JZFszJD@casper.infradead.org>
In-Reply-To: <YgiEeHzz4JZFszJD@casper.infradead.org>
From: Zhouyi Zhou <zhouzhouyi@gmail.com>
Date: Sun, 13 Feb 2022 12:17:50 +0800
Message-ID: <CAABZP2wNEUpM0OyhpKb+EtKY2RynpeU2N2tu9Jw_9B6iv6jGNQ@mail.gmail.com>
Subject: Re: BUG: sleeping function called from invalid context at
 include/linux/sched/mm.h:256
To: Matthew Wilcox <willy@infradead.org>
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
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 "Paul E. McKenney" <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, rcu <rcu@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Jason Baron <jbaron@akamai.com>,
 Josh Poimboeuf <jpoimboe@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thank Matthew for correcting me

On Sun, Feb 13, 2022 at 12:09 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Sun, Feb 13, 2022 at 11:19:09AM +0800, Zhouyi Zhou wrote:
> > I think the key to the problem lies in your attached console.log
> > (pasted below), at times 0.014987 and 0.015995, I see there are two
> > locks (cpu_hotplug_lock and jump_label_mutex)  holded while
> > kmem_cache_alloc calls __might_resched (0.023356).
>
> Those are both sleeping locks (a percpu_rwsem and mutex, respectively).
> There is no problem with sleeping while holding a mutex or rwsem.
From console.log, I see
[    0.012154][    T1] BUG: sleeping function called from invalid
context at include/linux/sched/mm.h:256
[    0.013128][    T1] in_atomic(): 0, irqs_disabled(): 1, non_block:
0, pid: 1, name: swapper/0
From ___might_sleep, I see

9506         if ((preempt_count_equals(preempt_offset) && !irqs_disabled() &&
9507              !is_idle_task(current) && !current->non_block_count) ||
9508             system_state == SYSTEM_BOOTING || system_state >
SYSTEM_RUNNING ||
9509             oops_in_progress)
9510                 return;

I guess it is irq_disable which cause the bug.

Thanks
Zhouyi
