Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 021FDDCB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 09:18:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44swxr3bRwzDqGZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 17:18:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.196; helo=mail-oi1-f196.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com
 [209.85.167.196])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44swwV4x6fzDqBZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 17:17:44 +1000 (AEST)
Received: by mail-oi1-f196.google.com with SMTP id n187so7495677oih.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 00:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=U0ILNQQnANwDaULFq9BnSLE4JegKbYYRqIG6pRQ8vEk=;
 b=cSgu98tHj1fnaN3VrXul56eLAc35mxPtU7UjsMlJ+8MO3+kO2IKpCyzMta9gh5oJNh
 LzZV/sL0Omq4h6xws5GaWb0VyUpTmsM4HvH1B5QhsQg/fCNMjAJ4dslgQ5Cgp3M4tNFq
 cRbSPYRxb6CAEmGQ2/aNvfAEzmcq/iL2z6vWQK55feJATK/9eeg00+cQWNPI+NbrDANp
 DJM5UIvslIfef03QuVxfk0Gvjlw8WOoY/v8L9tYM9vihU2r+ZiNpeDQwm5u61ib3C5sa
 A3uFUP/kx3sjOyDoxFF5lqTr0pOn7XWt1IC1tXeHi6XtqzaezH3v2xscuxA8XBs93fXX
 SMng==
X-Gm-Message-State: APjAAAWBvyHHI8ExjblOe5BxM66/TQ16F1Yp4IyH279V8ttIri7bDsIt
 HNJAaFoi86w5U/EYKK0OLtWo6cCaFgJcLMucIWA=
X-Google-Smtp-Source: APXvYqwr1JzPOuSpeIEP+9sUUFOH+slhC9WrQ3DVJQkPqRABjuPtCwtvgu2tX7fhE9UKdsflW3QhNDNgQMdTGy0lX/Q=
X-Received: by 2002:aca:4a8a:: with SMTP id x132mr7422695oia.68.1556522262049; 
 Mon, 29 Apr 2019 00:17:42 -0700 (PDT)
MIME-Version: 1.0
References: <5fdabbb9-0a62-4802-f1ca-f83584f935fa@molgen.mpg.de>
In-Reply-To: <5fdabbb9-0a62-4802-f1ca-f83584f935fa@molgen.mpg.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 29 Apr 2019 09:17:26 +0200
Message-ID: <CAJZ5v0gobp60Pn5cdh0CohGAXSBs-EvntNqKc_dj_UTnOiogkQ@mail.gmail.com>
Subject: Re: Why is suspend with s2idle available on POWER8 systems?
To: Paul Menzel <pmenzel@molgen.mpg.de>
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 27, 2019 at 12:54 PM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Linux folks,
>
>
> Updating an IBM S822LC from Ubuntu 18.10 to 19.04 some user space stuff
> seems to have changed, so that going into sleep/suspend is enabled.
>
> That raises two questions.
>
> 1.  Is suspend actually supported on a POWER8 processor?

Suspend-to-idle is a special variant of system suspend that does not
depend on any special platform support.  It works by suspending
devices and letting all of the CPUs in the system go idle (hence the
name).

Also see https://www.kernel.org/doc/html/latest/admin-guide/pm/sleep-states=
.html#suspend-to-idle

>
> > Apr 27 10:18:13 power NetworkManager[7534]: <info>  [1556353093.7224] m=
anager: sleep: sleep requested (sleeping: no  e
> > Apr 27 10:18:13 power systemd[1]: Reached target Sleep.
> > Apr 27 10:18:13 power systemd[1]: Starting Suspend...
> > Apr 27 10:18:13 power systemd-sleep[82190]: Suspending system...
> > Apr 27 10:18:13 power kernel: PM: suspend entry (s2idle)
> > -- Reboot --
>
> > $ uname -m
> > ppc64le
> > $ more /proc/version
> > Linux version 5.1.0-rc6+ (joey@power) (gcc version 8.3.0 (Ubuntu 8.3.0-=
6ubuntu1)) #1 SMP Sat Apr 27 10:01:48 CEST 2019
> > $ more /sys/power/mem_sleep
> > [s2idle]
> > $ more /sys/power/state
> > freeze mem
> > $ grep _SUSPEND /boot/config-5.0.0-14-generic # also enabled in Ubuntu=
=E2=80=99s configuration
> > CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> > CONFIG_SUSPEND=3Dy
> > CONFIG_SUSPEND_FREEZER=3Dy
> > # CONFIG_SUSPEND_SKIP_SYNC is not set
> > # CONFIG_PM_TEST_SUSPEND is not set
>
> Should the Kconfig symbol `SUSPEND` be selectable? If yes, should their
> be some detection during runtime?
>
> 2.  If it is supported, what are the ways to getting it to resume? What
> would the IPMI command be?

That would depend on the distribution.

Generally, you need to set up at least one device to generate wakeup interr=
upts.

The interface to do that are the /sys/devices/.../power/wakeup files,
but that has to cause enble_irq_wake() to be called for the given IRQ,
so some support in the underlying drivers need to be present for it to
work.

USB devices generally work as wakeup sources if the controllers reside
on a PCI bus, for example.

Thanks,
Rafael
