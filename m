Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF0829837F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Oct 2020 21:27:46 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CK8fP0JqczDqMd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Oct 2020 07:27:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=kernelfans@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f3NbGeK+; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CJwLM5cpWzDqSt
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Oct 2020 22:12:57 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id b15so6968568iod.13
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Oct 2020 04:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TFkX+ZerAmd8hm3G9ObErPm+YgVkEx8CRGWjFIckLIQ=;
 b=f3NbGeK+6ZtbJFn78qe4TBYAxMxAh1+TJc804ela0OLJTQw2JEKf1SkDA8eVf9brkR
 mkLQeYkcGVKrjSHSDPcgQfXWRVFBd3xw1z55/3d2QdheAA0lxY+MqSwtS1VWDMkU6gfi
 POo9W4DMsNEsyMHN8QHjPnd88b/qTMU1mts1m8Y911y/G1rceY85Trw6aiqI3lezE6ex
 ybrLhG4vEq7vy3JKBwPWAMPRF7h53KM55YZ8Pdu1XY+9KaTq4z8mfpSTzlF0l7fl5UQk
 qeM8+X0riyiWK+c6Bn5smz3P9q9uSyVC73BxA7j+VYtPw+51XiuQJw2T6feDufCAZBsv
 xO0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TFkX+ZerAmd8hm3G9ObErPm+YgVkEx8CRGWjFIckLIQ=;
 b=jR//p1nez96oaF/IZLskdkSdLO1uw6wKxxp/kJIvN4dDpogxkoxkNTFGkM1F7+r5y6
 JwU1F+FICq98tXS1Doohgr1yJncGQbXcPsO3CnhASw78bcPt0OCq5Slrqlo1+7yRP4CI
 wDkyACjma+prXxSW+gfcfL+INVpyrU0EhLmgIZtS6EmJrucdBN5pKAbDBv5MM5SrFAQm
 SmyNQUsCpjImjAVgwblj4JAwA4MpYj+Ry1Amt6upEqeb8Xiew9w4j9Wjm5gcifLbS/LM
 eL1MGvZCLYLMjJr9rIrb9fqrbM20tNYehLjruY8t13vDgxQvOXeDxBwhK3a7pqNM4YDu
 1ODw==
X-Gm-Message-State: AOAM5328xqOH/8O4d5HEs4BhFWeOmknAzUXS2+b5m6MumAKbWH23aGct
 S4QW51N9FLYVj5zAX+yJGNc0aZDTkwC4okxzUQ==
X-Google-Smtp-Source: ABdhPJyZD9Zz+IOM7rNg+RoAMaAduHW8YbNrNxUEVG0hEHoPcu1GLzdc08/YxotEW1/Ji2X/IlcELqgPdfyTZiD8Hfo=
X-Received: by 2002:a6b:8b95:: with SMTP id n143mr7598620iod.36.1603624372449; 
 Sun, 25 Oct 2020 04:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <1603346163-21645-1-git-send-email-kernelfans@gmail.com>
 <871rhq7j1h.fsf@nanos.tec.linutronix.de>
In-Reply-To: <871rhq7j1h.fsf@nanos.tec.linutronix.de>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Sun, 25 Oct 2020 19:12:41 +0800
Message-ID: <CAFgQCTvFwvvtPE0Eow4cebCEe5OD5OhgAQarckpbFc38Bphaag@mail.gmail.com>
Subject: Re: [PATCH 0/3] warn and suppress irqflood
To: Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 26 Oct 2020 07:26:15 +1100
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
Cc: Maulik Shah <mkshah@codeaurora.org>, Petr Mladek <pmladek@suse.com>,
 Oliver Neukum <oneukum@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Peter Zijlstra <peterz@infradead.org>, Marc Zyngier <maz@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 "Guilherme G. Piccoli" <gpiccoli@canonical.com>, linux-doc@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Lina Iyer <ilina@codeaurora.org>,
 Jisheng Zhang <Jisheng.Zhang@synaptics.com>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Al Viro <viro@zeniv.linux.org.uk>, Andrew Morton <akpm@linux-foundation.org>,
 afzal mohammed <afzal.mohd.ma@gmail.com>,
 Kexec Mailing List <kexec@lists.infradead.org>,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Oct 22, 2020 at 4:37 PM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> On Thu, Oct 22 2020 at 13:56, Pingfan Liu wrote:
> > I hit a irqflood bug on powerpc platform, and two years ago, on a x86 platform.
> > When the bug happens, the kernel is totally occupies by irq.  Currently, there
> > may be nothing or just soft lockup warning showed in console. It is better
> > to warn users with irq flood info.
> >
> > In the kdump case, the kernel can move on by suppressing the irq flood.
>
> You're curing the symptom not the cause and the cure is just magic and
> can't work reliably.
Yeah, it is magic. But at least, it is better to printk something and
alarm users about what happens. With current code, it may show nothing
when system hangs.
>
> Where is that irq flood originated from and why is none of the
> mechanisms we have in place to shut it up working?
The bug originates from a driver tpm_i2c_nuvoton, which calls i2c-bus
driver (i2c-opal.c). After i2c_opal_send_request(), the bug is
triggered.

But things are complicated by introducing a firmware layer: Skiboot.
This software layer hides the detail of manipulating the hardware from
Linux.

I guess the software logic can not enter a sane state when kernel crashes.

Cc Skiboot and ppc64 community to see whether anyone has idea about it.

Thanks,
Pingfan
