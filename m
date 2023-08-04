Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96AF877059F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 18:07:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AMUKG0O3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHVwp1773z3d8s
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 02:07:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=AMUKG0O3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHVvs0MrCz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 02:06:48 +1000 (AEST)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c93638322so209586066b.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 09:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691165201; x=1691770001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iO5rwUzHdvsTta4AYoM7PZm/e8fMyDOqZiTH6w2WucI=;
        b=AMUKG0O3ZHryKLr0tnTo/WTbH6EIhzWu2/l3KbipyDRSvc4gTMborJHpukGwA9PrV/
         2vL1fAteIN2zhSb8OrF3fDoffz9wHnACihFdMSwHU+PJLv1tWJqlym5Yikhypq+ZjtH5
         XvAFdLNHmEGqT0fEZ+4UyKWvd0dD4G7ZOzrc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691165201; x=1691770001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iO5rwUzHdvsTta4AYoM7PZm/e8fMyDOqZiTH6w2WucI=;
        b=l6mp8AhwzjtX+GtuKr24ePV8YibsINU9Dn9c+bcDjmLy7lAkFUXjjK8akCTADmC6L5
         Dhc6kXdUJtxFbrpF40mw/yLsmQuS5D5NIo5t7X3K3s4E/5Njb+rwPvMhxJ0opkv5tjMh
         Vv5bGYm+6Zs3UguIpUcEJu5vx65Ddo5NIiaVzkk+PdWUUvCjpZYKzohKd03ZP/OE3VC8
         XsdYfqp4iORVeMKdQ25ss2kG6XFoxTZf+eRh6ABuXJhBV+AppH2djklKHrYTkZ75yr+Z
         qyr2GCFnEF7y7tmw6TEon+cxK1xkcV5L+dHdlBkbzvFJJoJsb4bLX2KxvKSEgTlTMguy
         dkEQ==
X-Gm-Message-State: AOJu0YzRuF6SB+Vm27oWOo4Cz/pw7kQ1TIUqfuYEB1bfES3wRqJ9lV/P
	KV66G3UDxfVxAHbABYlifAlQzmzC2Ni1K+kVRHBUgFvu
X-Google-Smtp-Source: AGHT+IEOJ4PBxd2b/GGuckLpC1igHkbkZBg4b2twEPZKTcPqXqpBvgEgFyv9ADUgJH9NrS0oInWLCw==
X-Received: by 2002:a17:906:cc47:b0:993:d632:2c3 with SMTP id mm7-20020a170906cc4700b00993d63202c3mr139326ejb.21.1691165201406;
        Fri, 04 Aug 2023 09:06:41 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id s5-20020a170906168500b00999bb1e01dfsm1479447ejd.52.2023.08.04.09.06.41
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 09:06:41 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-3fe2a116565so87925e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 09:06:41 -0700 (PDT)
X-Received: by 2002:a50:d0dd:0:b0:522:2dd2:afa5 with SMTP id
 g29-20020a50d0dd000000b005222dd2afa5mr73563edf.7.1691165180310; Fri, 04 Aug
 2023 09:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230803160649.v3.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
 <ZMytyEoCARgP9VR8@dhcp22.suse.cz> <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
 <ZM0S9gKBBiu83kFq@dhcp22.suse.cz>
In-Reply-To: <ZM0S9gKBBiu83kFq@dhcp22.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Aug 2023 09:06:07 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XhksUsBKjkD08YxdmxvvbgoZH-va7WnPptkYA6EOpPsg@mail.gmail.com>
Message-ID: <CAD=FV=XhksUsBKjkD08YxdmxvvbgoZH-va7WnPptkYA6EOpPsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] nmi_backtrace: Allow excluding an arbitrary CPU
To: Michal Hocko <mhocko@suse.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>, "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Jinyang He <hejinyang@loongson.cn>, Lecopzer Chen <lecopzer.chen@mediatek.com>, Peter Zijlstra <peterz@infradead.org>, "Darrick J. Wong" <djwong@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, Qing Zhang <zhangqing@loongson.cn>, Pingfan Liu <kernelfans@gmail.com>, linux-mips@vger.kernel.org, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Gaosheng Cui <cuigaosheng1@huawei.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Valentin Schneider <vschneid@redhat.com>, "Paul E. McKenney" <paulmck@kernel.org>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Tom Rix <trix@redhat.com>, Ulf Hansson <ulf.hansson@linaro.org>, Petr Mladek <pmladek@suse.com>, Kees Cook <keescook@chromium.org>, Arnd Ber
 gmann <arnd@arndb.de>, Nicholas Piggin <npiggin@gmail.com>, Jianmin Lv <lvjianmin@loongson.cn>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, Thomas Gleixner <tglx@linutronix.de>, Josh Poimboeuf <jpoimboe@kernel.org>, linux-arm-kernel@lists.infradead.org, x86@kernel.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On Fri, Aug 4, 2023 at 8:02=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrote=
:
>
> > > It would have been slightly safer to modify arch_trigger_cpumask_back=
trace
> > > by switching arguments so that some leftovers are captured easier.
> >
> > I'm not sure I understand. Oh, you're saying make the prototype of
> > arch_trigger_cpumask_backtrace() incompatible so that if someone is
> > directly calling it then it'll be a compile-time error?
>
> exactly. bool to int promotion would be too easy to miss while the
> pointer to int would complain loudly.
>
> > I guess the
> > hope is that nobody is calling that directly and they're calling
> > through the trigger_...() functions.
>
> Hope is one thing, being preventive another.
>
> > For now I'm going to leave this alone.
>
> If you are going to send another version then please consider this. Not
> a hard requirement but better.

If I do send another version, do you have any suggestions for how to
change this to make it incompatible? I guess swapping the order of the
parameters would be best? I considered doing that for v4 but I felt
like long term the current order of the parameters was better. I also
considered a rename, but that different problems. ;-) If I rename both
the #define and the function then if someone has an out-of-tree patch
adding arch_trigger_cpumask_backtrace() for another architecture, like
say arm64, then there would be no compile-time failure indicating that
the out-of-tree patch needs updating. I could rename the functions but
_not_ the #define, I guess?
