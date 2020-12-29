Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4C62E6CCB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 01:32:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D4b3B1MhlzDqGP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 11:32:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=f5OovboT; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D4b1W48RdzDqB5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Dec 2020 11:30:55 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8E1F222227
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Dec 2020 00:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609201852;
 bh=yV4j/cRgE8H7aOVGN5jCQGtvZBZobooTVQ66898JI4I=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=f5OovboTlW7EYpT8oivw2g8c4aQCg45IJs780xMsZVv9BXlppqEZqy3983beo0x51
 kFMuwRgSh0/pRPeHHA20PsWMQmrb9zMZ6QqyMI/pLw0gOiomHhkRC7FHT0chpCeFj0
 QWCj2/OWKlLN3lFN+EQ8jvqmX67Op9swBowXWGtd1BIrwQkdP/5XH+oR4o5a74MF+d
 4BHKEJlBKCraDuT70SOJkWP8mxSfeiGcFCmj2MxMhIxG2DAuhYkqV06UPt8Iw3reyP
 0RVrPJOloYf8YlLTPvAgv1smAbWsM3TS3YPalrnRrPy9vni75J5C/h+t61dUR/GoRh
 K4yiWQpZEE7+A==
Received: by mail-wm1-f46.google.com with SMTP id r4so793789wmh.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 16:30:52 -0800 (PST)
X-Gm-Message-State: AOAM533t3r1sD6kGOoCxeuC+91+pLiXR79aWuPjmHELrzk/M4FeHaMYA
 NdIFrrGAHIJrAoOPswaJXfri1wgZ+714mofdiCGQYQ==
X-Google-Smtp-Source: ABdhPJyTSyI1fcHiawazSCE0V3NGTirXlbcKcNazoOxkfqoxtb4dfAOpbR4IJMj2HYqQ9DARh1IpAW6OOBL8GRTvWuI=
X-Received: by 2002:a1c:2188:: with SMTP id h130mr1080293wmh.176.1609201851177; 
 Mon, 28 Dec 2020 16:30:51 -0800 (PST)
MIME-Version: 1.0
References: <bf59ecb5487171a852bcc8cdd553ec797aedc485.1609093476.git.luto@kernel.org>
 <1836294649.3345.1609100294833.JavaMail.zimbra@efficios.com>
 <CALCETrVdcn2r2Jvd1=-bM=FQ8KbX4aH-v4ytdojL7r7Nb6k8YQ@mail.gmail.com>
 <1670059472.3671.1609189779376.JavaMail.zimbra@efficios.com>
In-Reply-To: <1670059472.3671.1609189779376.JavaMail.zimbra@efficios.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 28 Dec 2020 16:30:39 -0800
X-Gmail-Original-Message-ID: <CALCETrWaYU26z6RzHCN+VsTvS-uhApjr+jahS85de6WB_V37Tg@mail.gmail.com>
Message-ID: <CALCETrWaYU26z6RzHCN+VsTvS-uhApjr+jahS85de6WB_V37Tg@mail.gmail.com>
Subject: Re: [RFC please help] membarrier: Rewrite sync_core_before_usermode()
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 paulmck <paulmck@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 x86 <x86@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, "Russell King,
 ARM Linux" <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 Paul Mackerras <paulus@samba.org>, stable <stable@vger.kernel.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 28, 2020 at 1:09 PM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Dec 27, 2020, at 4:36 PM, Andy Lutomirski luto@kernel.org wrote:
>
> [...]
>
> >> You seem to have noticed odd cases on arm64 where this guarantee does not
> >> match reality. Where exactly can we find this in the code, and which part
> >> of the architecture manual can you point us to which supports your concern ?
> >>
> >> Based on the notes I have, use of `eret` on aarch64 guarantees a context
> >> synchronizing
> >> instruction when returning to user-space.
> >
> > Based on my reading of the manual, ERET on ARM doesn't synchronize
> > anything at all.  I can't find any evidence that it synchronizes data
> > or instructions, and I've seen reports that the CPU will happily
> > speculate right past it.
>
> Reading [1] there appears to be 3 kind of context synchronization events:
>
> - Taking an exception,
> - Returning from an exception,
> - ISB.

My reading of [1] is that all three of these are "context
synchronization event[s]", but that only ISB flushes the pipeline,
etc.  The little description of context synchronization seems to
suggest that it only implies that certain register changes become
effective.

>
> This other source [2] adds (search for Context synchronization operation):
>
> - Exit from Debug state
> - Executing a DCPS instruction
> - Executing a DRPS instruction
>
> "ERET" falls into the second kind of events, and AFAIU should be context
> synchronizing. That was confirmed to me by Will Deacon when membarrier
> sync-core was implemented for aarch64. If the architecture reference manuals
> are wrong, is there an errata ?
>
> As for the algorithm to use on ARMv8 to update instructions, see [2]
> B2.3.4  Implication of caches for the application programmer
> "Synchronization and coherency issues between data and instruction accesses"

This specifically discusses ISB.

Let's wait for an actual ARM64 expert to chime in, though.
