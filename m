Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93CA613FB41
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:20:55 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zHDN1rSBzDr3M
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:20:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=L+rMfwJV; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zFtJ4s9JzDqmC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 07:20:07 +1100 (AEDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0364D2077C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 20:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579206004;
 bh=oko1vr6NZIkbqblBi6ADclwFu8hYoUF6zOgs+mmCjwY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=L+rMfwJVUI9W+d2CoFvavrawmV6XxbnS/C5pFOW3GNaz/dDJWJPZM8duGoLOAL4lG
 Z02NHO/8MGKmfFb7GIu6L6UBs5VQJuL2gCzfJtQIf5HIZsqZ0+yd6MnHhIphnFuyoZ
 f3RLMs/ybk1B0MMAwdTLCraQ7qACz4TRbZO2ykR0=
Received: by mail-wm1-f46.google.com with SMTP id p9so5148698wmc.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:20:03 -0800 (PST)
X-Gm-Message-State: APjAAAXMluc1HgnL8mRprcQqCkTS8jJUed9KlGR9vI7LpR5qQJGKSjmE
 t0/t786efgF0LVEpeaDDHKs3GoiSFVFVYA1vImK2aA==
X-Google-Smtp-Source: APXvYqy/LKhOLCc4c+qZpvX/KQlnVohcy3HlKPdTJR43s7e+TgAW2p8Y+rne7KnqV+o60SXTwTHEOrPWPUde8RosJLE=
X-Received: by 2002:a05:600c:20c7:: with SMTP id
 y7mr794016wmm.21.1579206002474; 
 Thu, 16 Jan 2020 12:20:02 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
 <1b278bc1f6859d4df734fb2cde61cf298e6e07fd.1579196675.git.christophe.leroy@c-s.fr>
 <874kwvf9by.fsf@nanos.tec.linutronix.de>
In-Reply-To: <874kwvf9by.fsf@nanos.tec.linutronix.de>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 16 Jan 2020 12:19:50 -0800
X-Gmail-Original-Message-ID: <CALCETrX9+PZ1h6xex2WZcSqNT7W-6R-E95jv9hLhSdAzhMCrTA@mail.gmail.com>
Message-ID: <CALCETrX9+PZ1h6xex2WZcSqNT7W-6R-E95jv9hLhSdAzhMCrTA@mail.gmail.com>
Subject: Re: [RFC PATCH v4 08/11] lib: vdso: allow fixed clock mode
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

On Thu, Jan 16, 2020 at 12:14 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
>
> Can you please adjust the prefix for future patches to lib/vdso: and
> start the sentence after the colon with an uppercase letter?
>
> > On arches like POWERPC, the clock is always the timebase, it
>
> Please spell out architectures. Changelogs are not space constraint.
>
> > cannot be changed on the fly and it is always VDSO capable.
>
> Also this sentence does not make sense as it might suggests that
> architectures with a fixed compile time known clocksource have something
> named timebase. Something like this is more clear:
>
> Some architectures have a fixed clocksource which is known at compile
> time and cannot be replaced or disabled at runtime, e.g. timebase on
> PowerPC. For such cases the clock mode check in the VDSO code is
> pointless.
>

I wonder if we should use this on x86 bare-metal if we have
sufficiently invariant TSC.  (Via static_cpu_has(), not compiled in.)
Maybe there is no such x86 machine.

I really really want Intel or AMD to introduce machines where the TSC
pinky-swears to count in actual nanoseconds.

--Andy
