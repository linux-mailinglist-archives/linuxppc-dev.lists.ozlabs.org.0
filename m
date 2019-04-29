Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1D0DED6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 11:11:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44szRp548LzDqQR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Apr 2019 19:11:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44szNf6B0QzDqPG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 19:08:50 +1000 (AEST)
Received: by mail-ot1-f47.google.com with SMTP id b18so1664362otq.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Apr 2019 02:08:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2VWJO2MGiduBgVwh+y0rSMdiohlU2hlJmSsmX8IMxNI=;
 b=M++RhD0uq23pzaFCVgcGqv8ccid/Nx3rEt75y1R2kdcpeZAFyAzdU5vP27ud+6ReMe
 9WVVO7SepZgXwmRrmjddv9B420tLAxFBdirYeMZpcRQs0iP/lNPklViU41skegrudA3Q
 SSbqXYXChW+EmRPJYFUL61co74vaDH0+q+TBg/QppcTxkridmA4KqNejfk86tRHBFlGl
 vWyrdVEKfWJnei7eHPSjzVnv7P4nyaeYlbLlJtV7N8sIan2jd7KDzzUlP5WJ9jwrQZy6
 +1ros1bWr/5fQNjHpV++ayUqXwyRoKth48M6/He/T3YMm1tUJmJK3Mebnc1iwftgnwVu
 /nwg==
X-Gm-Message-State: APjAAAVvhz/YWYTDMGqwYeVdp/VD8o5yCwIohb0Cyl3NcRymIbf7ntTS
 ZvnOJkzOdN6iJhvFWXC1pLE2qpSxH9iq8lTDxJQ=
X-Google-Smtp-Source: APXvYqxhvgorRjOjGR5KwL0tVgrlRLyMivMC1DNNtT60AWmSWUv/MAR76xN6ZmJSFy/scEaQioWysRLnEkElcaBCY80=
X-Received: by 2002:a9d:6e17:: with SMTP id e23mr7531429otr.65.1556528928156; 
 Mon, 29 Apr 2019 02:08:48 -0700 (PDT)
MIME-Version: 1.0
References: <5fdabbb9-0a62-4802-f1ca-f83584f935fa@molgen.mpg.de>
 <CAJZ5v0gobp60Pn5cdh0CohGAXSBs-EvntNqKc_dj_UTnOiogkQ@mail.gmail.com>
 <c4c2f89f-9af7-01de-9144-9f11a8dafd58@molgen.mpg.de>
In-Reply-To: <c4c2f89f-9af7-01de-9144-9f11a8dafd58@molgen.mpg.de>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 29 Apr 2019 11:08:37 +0200
Message-ID: <CAJZ5v0jhrtaRmb9_n_=hpqZU0iFvEsV8FKoZ1v7QANXq-dWVFQ@mail.gmail.com>
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PM <linux-pm@vger.kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 29, 2019 at 10:50 AM Paul Menzel <pmenzel@molgen.mpg.de> wrote:
>
> Dear Rafael,
>
>
> On 04/29/2019 09:17 AM, Rafael J. Wysocki wrote:
> > On Sat, Apr 27, 2019 at 12:54 PM Paul Menzel <pmenzel@molgen.mpg.de> wr=
ote:
>
> >> Updating an IBM S822LC from Ubuntu 18.10 to 19.04 some user space stuf=
f
> >> seems to have changed, so that going into sleep/suspend is enabled.
> >>
> >> That raises two questions.
> >>
> >> 1.  Is suspend actually supported on a POWER8 processor?
> >
> > Suspend-to-idle is a special variant of system suspend that does not
> > depend on any special platform support.  It works by suspending
> > devices and letting all of the CPUs in the system go idle (hence the
> > name).
> >
> > Also see https://www.kernel.org/doc/html/latest/admin-guide/pm/sleep-st=
ates.html#suspend-to-idle
>
> Thanks. I guess I mixed it up with the new S0ix-states [1].

Those can be entered via suspend-to-idle, if supported and actually
reachable on a given platform, but suspend-to-idle is more general
than that.

> >>> Apr 27 10:18:13 power NetworkManager[7534]: <info>  [1556353093.7224]=
 manager: sleep: sleep requested (sleeping: no  e
> >>> Apr 27 10:18:13 power systemd[1]: Reached target Sleep.
> >>> Apr 27 10:18:13 power systemd[1]: Starting Suspend...
> >>> Apr 27 10:18:13 power systemd-sleep[82190]: Suspending system...
> >>> Apr 27 10:18:13 power kernel: PM: suspend entry (s2idle)
> >>> -- Reboot --
> >>
> >>> $ uname -m
> >>> ppc64le
> >>> $ more /proc/version
> >>> Linux version 5.1.0-rc6+ (joey@power) (gcc version 8.3.0 (Ubuntu 8.3.=
0-6ubuntu1)) #1 SMP Sat Apr 27 10:01:48 CEST 2019
> >>> $ more /sys/power/mem_sleep
> >>> [s2idle]
> >>> $ more /sys/power/state
> >>> freeze mem
> >>> $ grep _SUSPEND /boot/config-5.0.0-14-generic # also enabled in Ubunt=
u=E2=80=99s configuration
> >>> CONFIG_ARCH_SUSPEND_POSSIBLE=3Dy
> >>> CONFIG_SUSPEND=3Dy
> >>> CONFIG_SUSPEND_FREEZER=3Dy
> >>> # CONFIG_SUSPEND_SKIP_SYNC is not set
> >>> # CONFIG_PM_TEST_SUSPEND is not set
> >>
> >> Should the Kconfig symbol `SUSPEND` be selectable? If yes, should thei=
r
> >> be some detection during runtime?
> >>
> >> 2.  If it is supported, what are the ways to getting it to resume? Wha=
t
> >> would the IPMI command be?
> >
> > That would depend on the distribution.
> >
> > Generally, you need to set up at least one device to generate wakeup
> > interrupts.
> >
> > The interface to do that are the /sys/devices/.../power/wakeup files,
> > but that has to cause enble_irq_wake() to be called for the given IRQ,
> > so some support in the underlying drivers need to be present for it to
> > work.
> >
> > USB devices generally work as wakeup sources if the controllers reside
> > on a PCI bus, for example.
>
> ```
> $ find /sys/devices/ -name wakeup | xargs grep enabled
> /sys/devices/pci0021:00/0021:00:00.0/0021:01:00.0/0021:02:09.0/0021:0d:00=
.0/usb1/1-3/1-3.4/power/wakeup:enabled
> /sys/devices/pci0021:00/0021:00:00.0/0021:01:00.0/0021:02:09.0/0021:0d:00=
.0/power/wakeup:enabled
> $ lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=3Droot_hub, Driver=3Dxhci_hcd/4p, 480M
>     |__ Port 3: Dev 2, If 0, Class=3DHub, Driver=3Dhub/5p, 480M
>         |__ Port 1: Dev 3, If 0, Class=3DMass Storage, Driver=3Dusb-stora=
ge, 480M
>         |__ Port 2: Dev 4, If 0, Class=3DMass Storage, Driver=3Dusb-stora=
ge, 480M
>         |__ Port 3: Dev 5, If 0, Class=3DMass Storage, Driver=3Dusb-stora=
ge, 480M
>         |__ Port 4: Dev 6, If 0, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 1.5M
>         |__ Port 4: Dev 6, If 1, Class=3DHuman Interface Device, Driver=
=3Dusbhid, 1.5M
> $ lsusb
> Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> Bus 001 Device 006: ID 046b:ff10 American Megatrends, Inc. Virtual Keyboa=
rd and Mouse
> Bus 001 Device 005: ID 046b:ff31 American Megatrends, Inc.
> Bus 001 Device 004: ID 046b:ff40 American Megatrends, Inc.
> Bus 001 Device 003: ID 046b:ff20 American Megatrends, Inc.
> Bus 001 Device 002: ID 046b:ff01 American Megatrends, Inc.
> Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
> ```

I'm not really sure what you wanted to say here, but it looks like
system wakeup is not enabled for device 6 on bus 1 which is probably
what you want.
