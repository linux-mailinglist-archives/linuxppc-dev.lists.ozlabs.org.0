Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E430770285
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Aug 2023 16:04:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O+TbuIR/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RHSBT048mz3cb6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  5 Aug 2023 00:04:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=O+TbuIR/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RHS9Z4mJqz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Aug 2023 00:03:30 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4fe48d0ab0fso3533481e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 07:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1691157805; x=1691762605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fQEI9Tt3LPX/UCb4Pxuia74BKZS5am/oZbLnhTBeH5c=;
        b=O+TbuIR/XdsgxuqkZR2gism9IEPUt8sM/s7ty8wX1LrgWoRquFvLcjMPQEvV2Znbc3
         I5JxsIjbfM1VHBAEXMXVfu5mpIg55EJWlS2dLKzFjEgzWjC6bM2CF530bf/BB8rmYgdV
         PT2H2WfRPJSUDtpdpJ2pKW9KwfNVjnSt/BXCs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691157805; x=1691762605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fQEI9Tt3LPX/UCb4Pxuia74BKZS5am/oZbLnhTBeH5c=;
        b=S/xBBzK4kpGW6GlFy5h7gY+bkQkV9sCPz7B9/NYB9XZjsITiuVIOX5VEUZLeHl2zgZ
         Ak2OIX5QcBFlHyr+Q2YgkJPl6L0+njIya8eBUK8ceab/E56Qt+SV2qrmbhmosxKks007
         pJL8R+4V5S0KN3NPQiDT54WDLJaj89O8/l1gO1O990TiN2afr+BfB5il26S+A59FSnYF
         k619ALvq35wYKYtWuBAFdNEx5c4HIwcjIVY8QwhxvVIl5ywXsGtHNMDGKv2fe1Or38kw
         e8uaD3BUsgcRac2RbX3vtnfz6ndzRs13xxR8hOobNQKXSCeKgckiG9/qlOPCjrJ4K/0i
         BTUQ==
X-Gm-Message-State: AOJu0YyGepzEDtq1YZ9nMWT8WgnULMQjSGG+FcaSFHTTjq9niHxOkBa7
	E/hpcSw4KTe+x7d+WhiKVS5kj3aRqfYBpZ76GHxoTCsN
X-Google-Smtp-Source: AGHT+IEB3BAmCZEWrp4B0Wo3oRFR6q4eVbOtqDj4hdKhgSo2/oUmThVfWlJ2k4bAuUYxEMBYOZX/BQ==
X-Received: by 2002:a05:6512:6d1:b0:4f9:5396:ed1b with SMTP id u17-20020a05651206d100b004f95396ed1bmr1584995lff.28.1691157805259;
        Fri, 04 Aug 2023 07:03:25 -0700 (PDT)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id g3-20020a50ee03000000b0052314366967sm1279125eds.80.2023.08.04.07.03.24
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Aug 2023 07:03:24 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-521e046f6c7so9422a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Aug 2023 07:03:24 -0700 (PDT)
X-Received: by 2002:a05:600c:1f90:b0:3f1:9a3d:4f7f with SMTP id
 je16-20020a05600c1f9000b003f19a3d4f7fmr49358wmb.1.1691157423841; Fri, 04 Aug
 2023 06:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230803160649.v3.1.Ia35521b91fc781368945161d7b28538f9996c182@changeid>
 <ZMytyEoCARgP9VR8@dhcp22.suse.cz>
In-Reply-To: <ZMytyEoCARgP9VR8@dhcp22.suse.cz>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 4 Aug 2023 06:56:51 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
Message-ID: <CAD=FV=UQ18JG-sMBJHrhXByCWYSgOpCq8tL=3R8pT8CnFEa=pA@mail.gmail.com>
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

On Fri, Aug 4, 2023 at 12:50=E2=80=AFAM Michal Hocko <mhocko@suse.com> wrot=
e:
>
> On Thu 03-08-23 16:07:57, Douglas Anderson wrote:
> > The APIs that allow backtracing across CPUs have always had a way to
> > exclude the current CPU. This convenience means callers didn't need to
> > find a place to allocate a CPU mask just to handle the common case.
> >
> > Let's extend the API to take a CPU ID to exclude instead of just a
> > boolean. This isn't any more complex for the API to handle and allows
> > the hardlockup detector to exclude a different CPU (the one it already
> > did a trace for) without needing to find space for a CPU mask.
> >
> > Arguably, this new API also encourages safer behavior. Specifically if
> > the caller wants to avoid tracing the current CPU (maybe because they
> > already traced the current CPU) this makes it more obvious to the
> > caller that they need to make sure that the current CPU ID can't
> > change.
>
> Yes, this looks like the best way forward.
>
> It would have been slightly safer to modify arch_trigger_cpumask_backtrac=
e
> by switching arguments so that some leftovers are captured easier.

I'm not sure I understand. Oh, you're saying make the prototype of
arch_trigger_cpumask_backtrace() incompatible so that if someone is
directly calling it then it'll be a compile-time error? I guess the
hope is that nobody is calling that directly and they're calling
through the trigger_...() functions.

For now I'm going to leave this alone.


> You also have this leftover
> diff --git a/include/linux/nmi.h b/include/linux/nmi.h
> index 00982b133dc1..9f1743ee2b28 100644
> --- a/include/linux/nmi.h
> +++ b/include/linux/nmi.h
> @@ -190,10 +190,6 @@ static inline bool trigger_all_cpu_backtrace(void)
>  {
>         return false;
>  }
> -static inline bool trigger_allbutself_cpu_backtrace(void)
> -{
> -       return false;
> -}

Ah yes. I missed that case. Let me send a quick v4.


>  static inline bool trigger_cpumask_backtrace(struct cpumask *mask)
>  {
>         return false;
>
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Anyway
> Acked-by: Michal Hocko <mhocko@suse.com>

Thanks!
