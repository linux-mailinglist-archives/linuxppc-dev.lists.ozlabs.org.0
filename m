Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0E521DAC5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 17:51:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B57R84zMYzDqWw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 01:51:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=u/HSfMU9; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B57NK1PxRzDqTD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 01:48:32 +1000 (AEST)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
 [209.85.221.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 80EF22083B
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594655309;
 bh=FiLSo9R0STPJ54NQ+j4cquzz90YqRrZ+tVdT8FICfPw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=u/HSfMU9F7rxmTiqX4sRr4Pk8VxlDbewsgkjIe6pG2nB4ATgq01e1Xrr0clJ4LJmf
 KF6xr1Xv2GX82a28cw4dDUZuiL8A6ohB3EUIdPA0Gz22eJVXxmjte4lc3XkjzocFbw
 v5Jvv0F2fEGEoQbUjFwMLPV7iO/JAL2dOHC42qck=
Received: by mail-wr1-f42.google.com with SMTP id z2so17087845wrp.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 08:48:29 -0700 (PDT)
X-Gm-Message-State: AOAM533gMOiGVpyy3mTo33hX66D2pvg7cSKtEGBMptFtWoOkxZWQQsDv
 z4BsrWUNdNHaHVkaUEYuqFIsH+w5gjXdAvmHlKpoTQ==
X-Google-Smtp-Source: ABdhPJx0toL1Ye0o0H7c4Y3A41BrSlbEq0nHhnxAApxWZf2y0+ABJ/8JMUZOzKNFFHuITvPQPnyOqJdLGjq2hZLzWb4=
X-Received: by 2002:adf:a111:: with SMTP id o17mr79174967wro.257.1594655308027; 
 Mon, 13 Jul 2020 08:48:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200710015646.2020871-1-npiggin@gmail.com>
 <20200710015646.2020871-5-npiggin@gmail.com>
 <CALCETrVqHDLo09HcaoeOoAVK8w+cNWkSNTLkDDU=evUhaXkyhQ@mail.gmail.com>
 <1594613902.1wzayj0p15.astroid@bobo.none>
 <1594647408.wmrazhwjzb.astroid@bobo.none>
 <284592761.9860.1594649601492.JavaMail.zimbra@efficios.com>
In-Reply-To: <284592761.9860.1594649601492.JavaMail.zimbra@efficios.com>
From: Andy Lutomirski <luto@kernel.org>
Date: Mon, 13 Jul 2020 08:48:16 -0700
X-Gmail-Original-Message-ID: <CALCETrUHsYp0oGAiy3N-yAauPyx2nKqp1AiETgSJWc77GwO-Sg@mail.gmail.com>
Message-ID: <CALCETrUHsYp0oGAiy3N-yAauPyx2nKqp1AiETgSJWc77GwO-Sg@mail.gmail.com>
Subject: Re: [RFC PATCH 4/7] x86: use exit_lazy_tlb rather than
 membarrier_mm_sync_core_before_usermode
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Peter Zijlstra <peterz@infradead.org>, x86 <x86@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, linux-mm <linux-mm@kvack.org>,
 Andy Lutomirski <luto@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 13, 2020 at 7:13 AM Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> ----- On Jul 13, 2020, at 9:47 AM, Nicholas Piggin npiggin@gmail.com wrote:
>
> > Excerpts from Nicholas Piggin's message of July 13, 2020 2:45 pm:
> >> Excerpts from Andy Lutomirski's message of July 11, 2020 3:04 am:
> >>> Also, as it stands, I can easily see in_irq() ceasing to promise to
> >>> serialize.  There are older kernels for which it does not promise to
> >>> serialize.  And I have plans to make it stop serializing in the
> >>> nearish future.
> >>
> >> You mean x86's return from interrupt? Sounds fun... you'll konw where to
> >> update the membarrier sync code, at least :)
> >
> > Oh, I should actually say Mathieu recently clarified a return from
> > interrupt doesn't fundamentally need to serialize in order to support
> > membarrier sync core.
>
> Clarification to your statement:
>
> Return from interrupt to kernel code does not need to be context serializing
> as long as kernel serializes before returning to user-space.
>
> However, return from interrupt to user-space needs to be context serializing.
>

Indeed, and I figured this out on the first read through because I'm
quite familiar with the x86 entry code.  But Nick somehow missed this,
and Nick is the one who wrote the patch.

Nick, I think this helps prove my point.  The code you're submitting
may well be correct, but it's unmaintainable.  At the very least, this
needs a comment explaining, from the perspective of x86, *exactly*
what exit_lazy_tlb() is promising, why it's promising it, how it
achieves that promise, and what code cares about it.  Or we could do
something with TIF flags and make this all less magical, although that
will probably end up very slightly slower.

--Andy
