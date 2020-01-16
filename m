Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 313AB13FB5D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:23:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zHHm4ltqzDqfr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:23:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=JwJh0aad; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zFvb64YHzDqlc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 07:21:15 +1100 (AEDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B214F207FF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 20:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579206073;
 bh=OJ3J83vIabY7xpZcvf2DhJwhjwaTMS+skFpIApuBtEg=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JwJh0aadu+1koOsCzuKbeJgCqbsIVa6wXIh8eamq0w+FvzAqXxq1gzv8bKewX5JJr
 0LAd9SvjVMiaRKM5KNjw31n84OCJ2j4cgsYpXVB0SkUt2m3i7hsGJGrA4rHRu2s8jX
 GTY3J7+SCPPk/KJcvWhkGBpCaGlX6oQ/4joEhUUo=
Received: by mail-wr1-f53.google.com with SMTP id j42so20464317wrj.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:21:12 -0800 (PST)
X-Gm-Message-State: APjAAAUw0qBv8QCIgR450+CL00YzHhE51qgBuR8p12wW2Il6RUei8Wg0
 0f9dihlmTUZf25uSv+oJW6TPfwTAWVuv9jLeA0KlHQ==
X-Google-Smtp-Source: APXvYqyJFUWBWMkFpVuosDSd8/lQDbzy6zF5xwHRHcZ1pdoSXL/YmNp4uOFO1NJDoLptUYmOV9mv1qxrQ7fzMgsykOE=
X-Received: by 2002:adf:8041:: with SMTP id 59mr4939370wrk.257.1579206071239; 
 Thu, 16 Jan 2020 12:21:11 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
 <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr>
 <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
 <877e1rfa40.fsf@nanos.tec.linutronix.de>
In-Reply-To: <877e1rfa40.fsf@nanos.tec.linutronix.de>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 16 Jan 2020 12:20:59 -0800
X-Gmail-Original-Message-ID: <CALCETrX5B0SEJN2WG7rzuzbGhWa_dEwVVpMu6deXof3H+K_LdQ@mail.gmail.com>
Message-ID: <CALCETrX5B0SEJN2WG7rzuzbGhWa_dEwVVpMu6deXof3H+K_LdQ@mail.gmail.com>
Subject: Re: [RFC PATCH v4 10/11] lib: vdso: Allow arches to override the ns
 shift operation
To: Thomas Gleixner <tglx@linutronix.de>
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
Cc: nathanl@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>,
 X86 ML <x86@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 16, 2020 at 11:57 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Andy Lutomirski <luto@kernel.org> writes:
> > On Thu, Jan 16, 2020 at 9:58 AM Christophe Leroy
> >
> > Would mul_u64_u64_shr() be a good alternative?  Could we adjust it to
> > assume the shift is less than 32?  That function exists to benefit
> > 32-bit arches.
>
> We'd want mul_u64_u32_shr() for this. The rules for mult and shift are:
>

That's what I meant to type...

>      1 <= mult <= U32_MAX
>
>      1 <= shift <= 32
>
> If we want to enforce a shift < 32 we need to limit that conditionally
> in the calculation/registration function.
>
> Thanks,
>
>         tglx
>
