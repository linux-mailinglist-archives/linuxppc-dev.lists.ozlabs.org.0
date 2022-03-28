Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74DA74EA303
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 00:32:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KS6ry2zfPz3c2q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Mar 2022 09:32:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256 header.s=google header.b=lgbawv4c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82a;
 helo=mail-qt1-x82a.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=jms.id.au header.i=@jms.id.au header.a=rsa-sha256
 header.s=google header.b=lgbawv4c; dkim-atps=neutral
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com
 [IPv6:2607:f8b0:4864:20::82a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KS6rG5fZLz2xTs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 09:31:56 +1100 (AEDT)
Received: by mail-qt1-x82a.google.com with SMTP id c4so13779740qtx.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 15:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=BYbE5ultDd7ocSRftvKgW60rNwB4DPzrNN76MatCGuk=;
 b=lgbawv4cevnQKnHX2UzD8S0LhBnLK6AZ3q0Wevpiy1r8pnVPchTYoXeSufoa4ctofk
 K6OLKy1QfoUsSKvQ1lkRnthBRdf/9WdH8YXuuMyhbP0vOX03JyzUrtyDiPNytmQIFVrn
 L2T3peOXBlK95e+njy19Zh0VlRliUBjOg6BXU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BYbE5ultDd7ocSRftvKgW60rNwB4DPzrNN76MatCGuk=;
 b=1Yi/i64WF0Xp7Infv/Ross6VA9A+jjuJShA7wecC4FJeKS+1ogMxhvRDEIY9lfdc0P
 Zi1O2tmy+Mkg0ZbszS95ga43uTqz4nHaqu8oB4xl428Z2bP6CY8L9mlZECjVmJhJs5tY
 Cr9EosQ5O7P+B8l0dlHE+aeq1Xyf99CtzLaEeVHSVAiiu8dT8YI2o4YX7dAd6ROvS6n/
 RuVk00oBAT1Pc5B0dV1n5IJbkC8Ze8ivn967WpPUscj27OKBzzLqXCHfup8jEaxc74D7
 vBWfKbcSPc0W8asaBbEuKjiADxIxqopcdOo2YttlJk519+f8EDYQlCHmTVD+Bsnhoe78
 75fw==
X-Gm-Message-State: AOAM533njnklw9yhWK1t6CLGijKpW0s4cqYvV+1pq+drNjkoYdFAtoWJ
 jXkokUg1or+sM5BfhrEcDfIJH4bgzUGrexywQd0=
X-Google-Smtp-Source: ABdhPJxuqdwd1O+dPIY2XND9VHw20cQ0fzGLQhlk5XL/gb0f5mmplZ0b0indblsMbC81Cu/UgQ/jWw97Oo76wTaaB5A=
X-Received: by 2002:a05:622a:4cd:b0:2e1:ec2f:8c22 with SMTP id
 q13-20020a05622a04cd00b002e1ec2f8c22mr24918845qtx.494.1648506712819; Mon, 28
 Mar 2022 15:31:52 -0700 (PDT)
MIME-Version: 1.0
References: <cd0f6bdfdf1ee096fb2c07e7b38940921b8e9118.1637764848.git.christophe.leroy@csgroup.eu>
 <efc0e15e-fc93-fb59-068d-602f96ec7431@csgroup.eu>
 <20211129124355.52474d90@gandalf.local.home>
 <0b901c6f-9d42-11f6-4e44-df3bb1587456@csgroup.eu>
In-Reply-To: <0b901c6f-9d42-11f6-4e44-df3bb1587456@csgroup.eu>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 28 Mar 2022 22:31:40 +0000
Message-ID: <CACPK8XcM9LAWrc-eiir5gUN0Vb2Ca_ZMR-xF1Z_FoyWK8eqYbA@mail.gmail.com>
Subject: Re: [PATCH] recordmcount: Support empty section from recent binutils
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 29 Nov 2021 at 22:43, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
>
>
> Le 29/11/2021 =C3=A0 18:43, Steven Rostedt a =C3=A9crit :
> > On Fri, 26 Nov 2021 08:43:23 +0000
> > LEROY Christophe <christophe.leroy@csgroup.eu> wrote:
> >
> >> Le 24/11/2021 =C3=A0 15:43, Christophe Leroy a =C3=A9crit :
> >>> Looks like recent binutils (2.36 and over ?) may empty some section,
> >>> leading to failure like:
> >>>
> >>>     Cannot find symbol for section 11: .text.unlikely.
> >>>     kernel/kexec_file.o: failed
> >>>     make[1]: *** [scripts/Makefile.build:287: kernel/kexec_file.o] Er=
ror 1
> >>>
> >>> In order to avoid that, ensure that the section has a content before
> >>> returning it's name in has_rel_mcount().
> >>
> >> This patch doesn't work, on PPC32 I get the following message with thi=
s
> >> patch applied:
> >>
> >> [    0.000000] ftrace: No functions to be traced?
> >>
> >> Without the patch I get:
> >>
> >> [    0.000000] ftrace: allocating 22381 entries in 66 pages
> >> [    0.000000] ftrace: allocated 66 pages with 2 groups
> >
> > Because of this report, I have not applied this patch (even though I wa=
s
> > about to push it to Linus).
> >
> > I'm pulling it from my queue until this gets resolved.
> >
>
> I have no idea on how to fix that for the moment.
>
> With GCC 10 (binutils 2.36) an objdump -x on kernel/kexec_file.o gives:
>
> 0000000000000000 l    d  .text.unlikely 0000000000000000 .text.unlikely
> 0000000000000000  w    F .text.unlikely 0000000000000038
> .arch_kexec_apply_relocations_add
> 0000000000000038  w    F .text.unlikely 0000000000000038
> .arch_kexec_apply_relocations
>
>
> With GCC 11 (binutils 2.37) the same gives:
>
> 0000000000000000  w    F .text.unlikely 0000000000000038
> .arch_kexec_apply_relocations_add
> 0000000000000038  w    F .text.unlikely 0000000000000038
> .arch_kexec_apply_relocations
>
>
> The problem is that recordmcount drops weak symbols, and it doesn't find
> any non-weak symbol in .text.unlikely
>
> Explication given at
> https://elixir.bootlin.com/linux/v5.16-rc2/source/scripts/recordmcount.h#=
L506
>
> I have no idea on what to do.

Did you end up finding a solution for this issue?

Cheers,

Joel
