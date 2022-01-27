Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F06EC49E558
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 16:02:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jl3jX6wXPz3bPR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 02:02:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=a2Sc8CgE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=ardb@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=a2Sc8CgE; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl3hr1mXqz30Qt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 02:02:04 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 289D7B8226E
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 15:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0E8BC340EE
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 15:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643295716;
 bh=D9pZPNALxzUy2MOE5m871kxKJx0h8nCXhJyu4D4OTYA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=a2Sc8CgEcZ1Zvl9d0gTkFv1hQln7Fll428ccc7hHQ0RwG4mqwb2crRrbYlQ21zevi
 EEtlYqt9keoxTBEWNkmLkVVQ691N5vQlqmNeIDusHclBNXT5/r+Mie7k21v+Ooh+sW
 iupHCvVXuWRxCz9erwNE81CjejF9j96LXhBMi5AfJo9ILpso32eKJ6MJOI7qCkQHfF
 l5uEYidMqAvxZjiWsJiqlUOlM0yy1bUZyxL/4qWA3GVpGBzfyA5Q4+q9RHZMy8YO+L
 CzvZG2Lw27+nQm5RGZVF01iPjUXNKojo08pM6fmWFlg1Ep+xkiShXpdk04+QD99wgb
 2vX1sjtRVlqkw==
Received: by mail-lj1-f169.google.com with SMTP id j14so4753294lja.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 07:01:55 -0800 (PST)
X-Gm-Message-State: AOAM532fzPxyeBU+g1iyfKhKPv2CdNEBLx+3O/Z5l1qF7l3Im231rXse
 HcrlSX8/Uj7mc9E/m+0XlmUziPxkWJgPcdjdM7w=
X-Google-Smtp-Source: ABdhPJzcLRdCLHzw1a3IBl+G877pZwFu5rFJbH+uriNAzcI+IssD+8p2HA5o3bUPvQcsnTQOg7au+CtoF0Lb/JLSCyk=
X-Received: by 2002:a2e:a17c:: with SMTP id u28mr1570447ljl.115.1643295713848; 
 Thu, 27 Jan 2022 07:01:53 -0800 (PST)
MIME-Version: 1.0
References: <0fa0daec-881a-314b-e28b-3828e80bbd90@linux.alibaba.com>
 <YfFclROd+0/61q2d@FVFF77S0Q05N> <YfKGKWW5UfZ15kCW@FVFF77S0Q05N>
 <CAMj1kXHgpr0KYx5PYO_SpqaN8Ar2kfmc9Pb-d26uaYDpjwTz9w@mail.gmail.com>
 <YfKOENgR6sLnHQmA@FVFF77S0Q05N>
 <CAMj1kXGsmK9pBmgwmMEr302eCHtL=cqs4jqM_jOiK-bLO2gQog@mail.gmail.com>
 <YfKXM0wBfTh0V8+L@FVFF77S0Q05N>
 <CAMj1kXF3Fg2O=5prQnUWeNFeCqojP1z2zDXMwxFdcNtWLfL7Vg@mail.gmail.com>
 <YfKc8MDwenS1iXqQ@FVFF77S0Q05N>
 <CAMj1kXHnQcHmxRrTBQmj0Z2JJ6iWvNCQqSjvPqG_oedWpikfSA@mail.gmail.com>
 <YfKyNwYl/pkmVmDm@FVFF77S0Q05N>
In-Reply-To: <YfKyNwYl/pkmVmDm@FVFF77S0Q05N>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Jan 2022 16:01:42 +0100
X-Gmail-Original-Message-ID: <CAMj1kXETdD_Ezh9rervebLOrExzUqX+4Gk8EBgX1e1Kacvd19Q@mail.gmail.com>
Message-ID: <CAMj1kXETdD_Ezh9rervebLOrExzUqX+4Gk8EBgX1e1Kacvd19Q@mail.gmail.com>
Subject: Re: [powerpc] ftrace warning kernel/trace/ftrace.c:2068 with
 code-patching selftests
To: Mark Rutland <mark.rutland@arm.com>
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
Cc: Kees Cook <keescook@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Sachin Sant <sachinp@linux.ibm.com>,
 Yinan Liu <yinan@linux.alibaba.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 27 Jan 2022 at 15:55, Mark Rutland <mark.rutland@arm.com> wrote:
>
> On Thu, Jan 27, 2022 at 02:59:31PM +0100, Ard Biesheuvel wrote:
> > On Thu, 27 Jan 2022 at 14:24, Mark Rutland <mark.rutland@arm.com> wrote:
> > >
> > > On Thu, Jan 27, 2022 at 02:07:03PM +0100, Ard Biesheuvel wrote:
> > > > I suppose that on arm64, we can work around this by passing
> > > > --apply-dynamic-relocs to the linker, so that all R_AARCH64_RELATIVE
> > > > targets are prepopulated with the link time value of the respective
> > > > addresses. It does cause some bloat, which is why we disable that
> > > > today, but we could make that dependent on ftrace being enabled.
> > >
> > > We'd also need to teach the build-time sort to update the relocations, unless
> > > you mean to also change the boot-time reloc code to RMW with the offset?
> >
> > Why would that be necessary? Every RELA entry has the same effect on
> > its target address, as it just adds a fixed offset.
>
> Currently in relocate_kernel() we generate the absolute address from the
> relocation alone, with the core of the relocation logic being as follows, with
> x9 being the pointer to a RELA entry, and x23 being the offset relative to the
> default load address:
>
>         ldp     x12, x13, [x9], #24
>         ldr     x14, [x9, #-8]
>
>         add     x14, x14, x23                   // relocate
>         str     x14, [x12, x23]
>
> ... and (as per another reply), a sample RELA entry currently contains:
>
>         0xffff8000090b1ab0      // default load VA of pointer to update
>         0x0000000000000403      // R_AARCH64_RELATIVE
>         0xffff8000090b6000      // default load VA of addr to write
>
> So either:
>
> * That code stays as-is, and we must update the relocs to correspond to their
>   new sorted locations, or we'll blat the sorted values with the original
>   relocs as we do today.
>
> * The code needs to change to RMW: read the existing value, add the offset
>   (ignoring the content of the RELA entry's addend field), and write it back.
>   This is what I meant when I said "change the boot-time reloc code to RMW with
>   the offset".
>
> Does that make sense, or have I misunderstood?
>

No you're right. We'd have to use different sequences here depending
on whether the relocation target is populated or not, which currently
we don't care about.
