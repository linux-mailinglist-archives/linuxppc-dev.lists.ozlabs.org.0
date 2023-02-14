Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE87696E1E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 20:49:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGWy070VCz3cXf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 06:49:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gr6T/uMm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=jcmvbkbc@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Gr6T/uMm;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGWx62g6wz3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 06:48:57 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id z3so4814543pfw.7
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 11:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3KPvoJ4GnlMgsohhv5ZFTkjPNgvE0397TI0CYAnCxqM=;
        b=Gr6T/uMmQW0P2TPA5kU2B0SezfYIPng0GmMu1nbsnL7n4Qhw9RF68MIXO9T2lIb4Vd
         9XqzWMo3zWupmo7DDnQIRZvSJhGTc3cJrOSj6qnw7ZLFMuv1jhehz7SDmTyxss5IvAuF
         ITBMuNHAK1NOe9nMNVZ11QjpI/ucBxZuVeSuDtnc42j7aN5Y3/LFY0jJey9dm6rJdUJ4
         LHKBtyEUPuxrQMMdOfkgTlii7etUm1Jsa4u0tgyMoqTav4keZsI205xjLS15k/6dNP48
         pxdBRqWKGSlZs5JtldCGgNcu4SmZfcR6VtsRIgsyLA6/xT3/Y75dtU4bMody4IfGBQxC
         Gv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3KPvoJ4GnlMgsohhv5ZFTkjPNgvE0397TI0CYAnCxqM=;
        b=P1u2O0vNMv3D42TxULLiq88XqMBFEcxH4gYmvsRm2v9I5uaGixCnOc6reR53hLnT4P
         nbHSGNhIqY1vJiFXuczV8c6KURmEKCuFNdEIf/npgbn3HNnYCEsBFkBx2GoYZCVyoKPO
         gPox9fyJBrTzNFn6ktdZ+rKjog/ugRGQM0iWv858KkCu9xL3C9lSkJugt3IDeqMRttW8
         spP81VwtRrXGsuW+Pj2j9C85U6PgljGVgulXKulj8Xa1G9OXyJvLZESY4zx+gb48tONh
         Jy6eqzDKPF8unQfU9VJMzFFfhwmV2IEGjeysy//OD0YZNrSe1QxG+EUfe1muK8NpyyLs
         IeWA==
X-Gm-Message-State: AO0yUKUoQO2Ameo/iPdUr6oqbDybdhFiBzrfCv/RP4kA10uCb6ZMTnLQ
	sLWMNlnmsuKGsFnsCiY/GewUmBkbkXWdSdgzkG4=
X-Google-Smtp-Source: AK7set/RjysGRw6Tb1OUrwUKy/GM2o6xSEOZ9Hy3VBjfC8/RJ69CUMocJn0vWTmElSm33m/BGVWvbyqYG1s66BcSQYs=
X-Received: by 2002:aa7:9591:0:b0:5a8:65e5:b1ba with SMTP id
 z17-20020aa79591000000b005a865e5b1bamr740284pfj.29.1676404133096; Tue, 14 Feb
 2023 11:48:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1676358308.git.jpoimboe@kernel.org> <cca346b5c87693499e630291d78fb0bf12c24290.1676358308.git.jpoimboe@kernel.org>
 <1b4afd82-83cb-0060-7cab-8e16d2e69ff9@linaro.org> <20230214182322.r5tyeowxzloiuh72@treble>
In-Reply-To: <20230214182322.r5tyeowxzloiuh72@treble>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Tue, 14 Feb 2023 11:48:41 -0800
Message-ID: <CAMo8BfLzV0Oe_i-QrMzE-BE028s6GNvOd827N5+tteELidjpvA@mail.gmail.com>
Subject: Re: [PATCH v2 19/24] xtensa/cpu: Make sure cpu_die() doesn't return
To: Josh Poimboeuf <jpoimboe@kernel.org>
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
Cc: juri.lelli@redhat.com, dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, peterz@infradead.org, catalin.marinas@arm.com, dave.hansen@linux.intel.com, x86@kernel.org, jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org, bsegall@google.com, guoren@kernel.org, hpa@zytor.com, sparclinux@vger.kernel.org, kernel@xen0n.name, will@kernel.org, vschneid@redhat.com, f.fainelli@gmail.com, vincent.guittot@linaro.org, ysato@users.sourceforge.jp, chenhuacai@kernel.org, linux@armlinux.org.uk, linux-csky@vger.kernel.org, mingo@redhat.com, bcm-kernel-feedback-list@broadcom.com, mgorman@suse.de, mattst88@gmail.com, linux-xtensa@linux-xtensa.org, paulmck@kernel.org, richard.henderson@linaro.org, npiggin@gmail.com, ink@jurassic.park.msu.ru, rostedt@goodmis.org, loongarch@lists.linux.dev, tglx@linutronix.de, dietmar.eggemann@arm.com, linux-arm-kernel@lists.infradead.org, jgross@suse.com, chris@zankel.net, tsbogend@alpha.franken.de, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@
 linaro.org>, bristot@redhat.com, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 14, 2023 at 10:23 AM Josh Poimboeuf <jpoimboe@kernel.org> wrote=
:
> On Tue, Feb 14, 2023 at 08:55:32AM +0100, Philippe Mathieu-Daud=C3=A9 wro=
te:
> > Can you update the documentation along? Currently we have:
> >
> >   /*
> >    * Called from the idle thread for the CPU which has been shutdown.
> >    *
> >    * Note that we disable IRQs here, but do not re-enable them
> >    * before returning to the caller. This is also the behaviour
> >    * of the other hotplug-cpu capable cores, so presumably coming
> >    * out of idle fixes this.
> >    */
>
> void __ref cpu_die(void)
> {
>         idle_task_exit();
>         local_irq_disable();
>         __asm__ __volatile__(
>                         "       movi    a2, cpu_restart\n"
>                         "       jx      a2\n");
>
>         BUG();
> }
>
> Hm, not only is the comment wrong, but it seems to be branching to
> cpu_restart?  That doesn't seem right at all.

Perhaps the name is a bit misleading. The CPU that enters 'cpu_restart'
loops there until a call to 'boot_secondary' releases it, after which it go=
es
to '_startup'. So it is a restart, but not immediate.

--=20
Thanks.
-- Max
