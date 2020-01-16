Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B5113FB0E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:07:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zGwp6tQgzDr0m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:07:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=ZBNmytBW; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zF944n6xzDqZW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 06:47:52 +1100 (AEDT)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 098B12077C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 19:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579204070;
 bh=iWPOEPrLhN/0dUzUlwpw4/5CopjoSgUDgsorKgvcJmw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZBNmytBWuC0U8dtoZhF+ykaCrw12X24OzwI/4jlMPsTBRD4Skon1q/5BmRHCR7j36
 U0SG46PBe9dZfmajYfQMP3/t6SsA/c/cTCxLI/yJ5fRxBdrzdYEx5a5LO34zOO6yIp
 MHsX6faaZ9XilvurLWm/Gziak4DDpI+m16cZOi68=
Received: by mail-wr1-f52.google.com with SMTP id z7so20368258wrl.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 11:47:49 -0800 (PST)
X-Gm-Message-State: APjAAAXlFwub5XVdv3M7+DQfJte5Lkv7lU9yMKEixSM6Pk4PZjE01lH9
 oY475MgkLdrh2NbOnjbPYZhEIeVqSogFH4A0v15ywg==
X-Google-Smtp-Source: APXvYqz0S0n0mRf01AI9EVOJj9fh0guO9GsXoYIoeeHWqI3bcsdwUWPoJm22gBkYEqJCyt4y4xlERS5rQnr9jvHcuRE=
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr4976488wrn.75.1579204068445;
 Thu, 16 Jan 2020 11:47:48 -0800 (PST)
MIME-Version: 1.0
References: <cover.1579196675.git.christophe.leroy@c-s.fr>
 <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr>
In-Reply-To: <c8ce9baaef0dc7273e4bcc31f353b17b655113d1.1579196675.git.christophe.leroy@c-s.fr>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 16 Jan 2020 11:47:36 -0800
X-Gmail-Original-Message-ID: <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
Message-ID: <CALCETrWJcB9=MuSw5yx6arcb_np=E=awTyLRSi=r8BJySf_aXw@mail.gmail.com>
Subject: Re: [RFC PATCH v4 10/11] lib: vdso: Allow arches to override the ns
 shift operation
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 16, 2020 at 9:58 AM Christophe Leroy
<christophe.leroy@c-s.fr> wrote:
>
> On powerpc/32, GCC (8.1) generates pretty bad code for the
> ns >>= vd->shift operation taking into account that the
> shift is always < 32 and the upper part of the result is
> likely to be nul. GCC makes reversed assumptions considering
> the shift to be likely >= 32 and the upper part to be like not nul.
>
> unsigned long long shift(unsigned long long x, unsigned char s)
> {
>         return x >> s;
> }
>
> results in:
>
> 00000018 <shift>:
>   18:   35 25 ff e0     addic.  r9,r5,-32
>   1c:   41 80 00 10     blt     2c <shift+0x14>
>   20:   7c 64 4c 30     srw     r4,r3,r9
>   24:   38 60 00 00     li      r3,0
>   28:   4e 80 00 20     blr
>   2c:   54 69 08 3c     rlwinm  r9,r3,1,0,30
>   30:   21 45 00 1f     subfic  r10,r5,31
>   34:   7c 84 2c 30     srw     r4,r4,r5
>   38:   7d 29 50 30     slw     r9,r9,r10
>   3c:   7c 63 2c 30     srw     r3,r3,r5
>   40:   7d 24 23 78     or      r4,r9,r4
>   44:   4e 80 00 20     blr
>
> Even when forcing the shift with an &= 31, it still considers
> the shift as likely >= 32.
>
> Define a vdso_shift_ns() macro that can be overriden by
> arches.

Would mul_u64_u64_shr() be a good alternative?  Could we adjust it to
assume the shift is less than 32?  That function exists to benefit
32-bit arches.

--Andy
