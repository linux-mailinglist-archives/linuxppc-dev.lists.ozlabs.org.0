Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC9E44D438
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 10:40:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqcCY2MPxz3c4h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 20:40:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=gkiWiOX8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::333;
 helo=mail-ot1-x333.google.com; envelope-from=elver@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=gkiWiOX8; dkim-atps=neutral
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqcBv6ySmz2x9H
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 20:40:05 +1100 (AEDT)
Received: by mail-ot1-x333.google.com with SMTP id
 h16-20020a9d7990000000b0055c7ae44dd2so8034591otm.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 01:40:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6/bKopAPmkHa57hfJnxgSr31+HwEgFYE/Py/TQAdG68=;
 b=gkiWiOX8zlm9XT8Og6moU9xIJyu8+w/wkXHcSyju6P6MfcJ+1eMp46rl/6GcYATuSD
 2lPIpohCRFh7xvqOYiub6Ne4RHSEdGx9iFmYpyAsiq3v8QkHfNUJorlkCpu59ecFoyDX
 5cQ+gXFtQLFy6nzBtySiGlpS4F3A0n+VJS6gxzp6HcokIb00BTd0Hc6kjoNNwCCC2c/w
 ZdaDUyw/oqZOrPVWQ0w/HvLeXtkQbp1Qk8FLjaPH5u8mH1zES5uW7Hh7l8usP8LoHwFM
 rbM/lILsGVEEwAsxpEXLBi0WLmXQFnRPjUj7OPMUk81PvcRFPIE0OTrfSX25AJlr9m4G
 0XHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6/bKopAPmkHa57hfJnxgSr31+HwEgFYE/Py/TQAdG68=;
 b=UvZQQEc0sGlfxGGfNais79/z8hJT6PPKMFoEJqKjt6358ShJoOXKoyZXjzf7EEMNpN
 /kWpbh9agF4eheBv+e4xaDumwLbqmxw88J/DzYYmdfFURLTKTzQAUt3O+fZbLRQg5k0f
 RFMJzoFw6c/V4dFPWhKCjrdHHdLnLj8s89TraMOtP7wNR3/M2n0cX0V/6r8r/EtOjHdw
 c1PJywzCcKbuxxwF7H3Tu4FMJUBwGx8r3aepV7t4teZcWcypg8vcL2HbJom42tccOI2d
 tPidOdCvObXLmMFNUE3fMzDH9dSUEPZytJXgcaIoIrsgsVyBI2kAKM7ETiB4dkPS5I3i
 OTww==
X-Gm-Message-State: AOAM531UzvJcHUkeCgYbuigvzXTbkmcUPQmqx7E57r0mtKSfUj7FH3uu
 Mxn17Z9oULoEk4FQZHg91T31+BIjGPFSeMUlyWF1A7DvU6U=
X-Google-Smtp-Source: ABdhPJwHNib4Izwq5VRvwx+F+i/iw/cbi3VPdxj/5KCILWR5ZipAgx6octOLOllqAzJpni78t8/MutpmCyKpGH1Zi1I=
X-Received: by 2002:a9d:77d1:: with SMTP id w17mr4805850otl.329.1636623600901; 
 Thu, 11 Nov 2021 01:40:00 -0800 (PST)
MIME-Version: 1.0
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-5-valentin.schneider@arm.com>
 <YYzeOQNFmuieCk3T@elver.google.com>
In-Reply-To: <YYzeOQNFmuieCk3T@elver.google.com>
From: Marco Elver <elver@google.com>
Date: Thu, 11 Nov 2021 10:39:49 +0100
Message-ID: <CANpmjNPvYZSSLnsg_BGfzb=Yu4bTvCp+N14FHcJfUDjDgzrywg@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] kscan: Use preemption model accessors
To: Valentin Schneider <valentin.schneider@arm.com>
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
Cc: Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masahiro Yamada <masahiroy@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 11 Nov 2021 at 10:11, Marco Elver <elver@google.com> wrote:
>
> Subject s/kscan/kcsan/
>
> On Wed, Nov 10, 2021 at 08:24PM +0000, Valentin Schneider wrote:
> > Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
> > preemption model of the live kernel. Use the newly-introduced accessors
> > instead.
> >
> > Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
>
> Reviewed-by: Marco Elver <elver@google.com>
>
> Though it currently doesn't compile as a module due to missing
> EXPORT_SYMBOL of is_preempt*().
>
> > ---
> >  kernel/kcsan/kcsan_test.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/kernel/kcsan/kcsan_test.c b/kernel/kcsan/kcsan_test.c
> > index dc55fd5a36fc..14d811eb9a21 100644
> > --- a/kernel/kcsan/kcsan_test.c
> > +++ b/kernel/kcsan/kcsan_test.c
> > @@ -1005,13 +1005,13 @@ static const void *nthreads_gen_params(const void *prev, char *desc)
> >       else
> >               nthreads *= 2;
> >
> > -     if (!IS_ENABLED(CONFIG_PREEMPT) || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {
> > +     if (!is_preempt_full() || !IS_ENABLED(CONFIG_KCSAN_INTERRUPT_WATCHER)) {

In case you introduce the 5th helper I suggested
(is_preempt_full_or_rt() or whatever you'll call it), this one can be
switched, because this check really does want to know if "at least
full preemption" and not "precisely full preemption".

Thanks,
-- Marco
