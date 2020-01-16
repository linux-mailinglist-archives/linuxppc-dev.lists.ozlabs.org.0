Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EC2C13FB65
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:27:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zHMp2FGWzDr84
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:27:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=luto@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=WjiY6Fz2; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zFxY05ntzDqpp
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 07:22:57 +1100 (AEDT)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F8742077C
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 20:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1579206174;
 bh=AWTq77yPH1eJXFHw5c/ihwZ/W+ttmiGY+qYVIL2DNXo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=WjiY6Fz2v1BRFwTw8CEV+ZGeTVwybGg7qEvOG+e6kceB8oCBxevUtjC+sxHFejHAw
 +oKShNXbfNSUG124nEjNg9pxFVCYhjNP142xTdOd2FqkhnrKlA/xPHMGsS+TxqWkRE
 U5OV05EgZIcNAZu83S6Cza9kPCZDXt9/fFQCjNYE=
Received: by mail-wm1-f43.google.com with SMTP id u2so5192845wmc.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 12:22:54 -0800 (PST)
X-Gm-Message-State: APjAAAUUQytdK3RARy8Z2B327IGOw/nuCYXIq/jJhjEPsR0sIpOLvW2a
 Q6BYcR+zwffRhCTGmAm1TLnXWI1K0Fex0JM6ClYwwQ==
X-Google-Smtp-Source: APXvYqye2EDj0a90ApFnSVIDyfTmrBlVCmi50h4FuEffTXlFfhQYLFZAcgiL0SS3ilsUicD1HIv6uxzlc43xpc781uA=
X-Received: by 2002:a05:600c:20c7:: with SMTP id
 y7mr802627wmm.21.1579206173156; 
 Thu, 16 Jan 2020 12:22:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1578934751.git.christophe.leroy@c-s.fr>
 <381e547dbb3c48fd39d6cf208033bba38ad048fb.1578934751.git.christophe.leroy@c-s.fr>
 <87ftghbpuu.fsf@nanos.tec.linutronix.de>
 <d2de3211-9d7c-513e-fe0f-8bdce623fb65@c-s.fr>
 <b5fddcf8-99ff-fc0d-40c0-0eb81ad4e94a@c-s.fr>
 <87k15rwuxm.fsf@nanos.tec.linutronix.de>
In-Reply-To: <87k15rwuxm.fsf@nanos.tec.linutronix.de>
From: Andy Lutomirski <luto@kernel.org>
Date: Thu, 16 Jan 2020 12:22:41 -0800
X-Gmail-Original-Message-ID: <CALCETrWOENu2k3aGNO-oiY1Sj8=cG9mMZ8eOepHOzdu25vFVVA@mail.gmail.com>
Message-ID: <CALCETrWOENu2k3aGNO-oiY1Sj8=cG9mMZ8eOepHOzdu25vFVVA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 08/12] lib: vdso: allow arches to provide vdso data
 pointer
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
Cc: Arnd Bergmann <arnd@arndb.de>, X86 ML <x86@kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andrew Lutomirski <luto@kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 16, 2020 at 2:35 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> static __maybe_unused int
> __cvdso_data_clock_gettime(clockid_t clock, struct __kernel_timespec *ts,
>                            const struct vdso_data *vd)
> {
>         .....
> }
>
> static __maybe_unused int
> __cvdso_clock_gettime(clockid_t clock, struct __kernel_timespec *ts)
> {
>         const struct vdso_data *vd = __arch_get_vdso_data();
>
>         return __cvdso_data_clock_gettime(clock, ts, vd);
> }
>
> and then use __cvdso_data_clock_gettime on PPC and let the other archs
> unmodified.
>
>

FWIW, I did some experiments on x86 with gcc 9.2.  gcc 9.2 uses
rip-relative accesses if I simplify the config enough and otherwise
materializes the pointer.  Presumably it decides that the code size
reduction is worth it if there are a lot of accesses.

I suspect that tglx's suggestion will be fine or at worst will add
negligible overhead on x86_64.
