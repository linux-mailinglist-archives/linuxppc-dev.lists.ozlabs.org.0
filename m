Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C31DE13D6AE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 10:21:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47yzGN6LfNzDqZH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 20:21:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=hsinyi@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=WJ5IKs9f; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47yzCj0GrPzDq5y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 20:19:12 +1100 (AEDT)
Received: by mail-io1-xd43.google.com with SMTP id k24so20946262ioc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 01:19:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEmkOKqY6q6hAhtGO8c8rmA8wwGHpO5BilLXpdIbB7I=;
 b=WJ5IKs9fiBTVp8BuvxnKOBaru2rIXqED/Rq0yyQSdyRNzvJcbIJ8kJqtCUd+rcV6nn
 EhI+mwh5Bq9EkGM1UCZoYtKiXQJb5mUkVbl5DEbwzwiQ5eWJf/1j5Inwc5mtqTXN+8cZ
 lQKMTkatnFRaRzda7WRLP3JId4g6ZavROmaK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEmkOKqY6q6hAhtGO8c8rmA8wwGHpO5BilLXpdIbB7I=;
 b=oBVjNVVMggfvzeVUHQ4kvoPbTVod5HLtSsjAV64GnQeD62FtGLytkaGbJejVKx/rsa
 7axl5jm9ZCbgaPFXeMOo07bhQY2mXGvjXh6MRBsWzq0yjgrCWmkkKlcLAq+CA3yuF+uE
 b+zUfxNxKOg6Twjd5HsugH1kFwVh6Y7TNqLjYQN2opyw+O+vgizNVwnvEPB2bXR21uyX
 EOtT3RGCEG2718A0uVAJVniMplOnlgX92mSlfrXFoVnL6Nj4QCv7g12OpwIKTwleELY9
 vobdn584r++jhVwztLhcknekRAAXCZq8+0RyxRwG7Nhc9YZGkdg2678OnUEbFdaHjyug
 VEtg==
X-Gm-Message-State: APjAAAXmOYyYr+PbPg/jN3m1fB//8z1Ud+CNzYhFnAx9A3phGW8mVSxX
 dmHBevp0rFZyaQGwBGFtw8R8BecpSxG6M44vnSP7xw==
X-Google-Smtp-Source: APXvYqzvaPrf1c/2YOtkHJqp95C4MJl+/6ictlNKs5rwIJmJYisKHyfz84aFv8nqE5MyfIb9iebBJBW44B4PJSvB2Ns=
X-Received: by 2002:a5d:8cd6:: with SMTP id k22mr24400602iot.283.1579166348214; 
 Thu, 16 Jan 2020 01:19:08 -0800 (PST)
MIME-Version: 1.0
References: <20200115063410.131692-1-hsinyi@chromium.org>
 <8736cgxmxi.fsf@nanos.tec.linutronix.de>
In-Reply-To: <8736cgxmxi.fsf@nanos.tec.linutronix.de>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 16 Jan 2020 17:18:41 +0800
Message-ID: <CAJMQK-jDi+AACE1Cv_hKSMq8VhGTBeh+kyHO2U4sx9w=9bO2mA@mail.gmail.com>
Subject: Re: [PATCH v5] reboot: support offline CPUs before reboot
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 lkml <linux-kernel@vger.kernel.org>, sparclinux@vger.kernel.org,
 Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vger.kernel.org,
 linux-csky@vger.kernel.org, Aaro Koskinen <aaro.koskinen@nokia.com>,
 Fenghua Yu <fenghua.yu@intel.com>, Linux PM <linux-pm@vger.kernel.org>,
 linux-xtensa@linux-xtensa.org, Stephen Boyd <swboyd@chromium.org>,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Pavankumar Kondeti <pkondeti@codeaurora.org>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-parisc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, Jiri Kosina <jkosina@suse.cz>,
 Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 16, 2020 at 8:30 AM Thomas Gleixner <tglx@linutronix.de> wrote:
>
> Hsin-Yi Wang <hsinyi@chromium.org> writes:
>
> > Currently system reboots uses architecture specific codes (smp_send_stop)
> > to offline non reboot CPUs. Most architecture's implementation is looping
> > through all non reboot online CPUs and call ipi function to each of them. Some
> > architecture like arm64, arm, and x86... would set offline masks to cpu without
> > really offline them. This causes some race condition and kernel warning comes
> > out sometimes when system reboots.
>
> 'some race condition and kernel warning' is pretty useless information.
> Please describe exactly which kind of issues are caused by the current
> mechanism. Especially the race conditions are the interesting part (the
> warnings are just a consequence).
>
> > This patch adds a config ARCH_OFFLINE_CPUS_ON_REBOOT, which would
> > offline cpus in
>
> Please read Documentation/process/submitting-patches.rst and search for
> 'This patch'.
>
> > migrate_to_reboot_cpu(). If non reboot cpus are all offlined here, the loop for
> > checking online cpus would be an empty loop.
>
> This does not make any sense. The issues which you are trying to solve
> are going to be still there when CONFIG_HOTPLUG_CPU is disabled.
>
> > If architecture don't enable this config, or some cpus somehow fails
> > to offline, it would fallback to ipi function.
>
> This is really a half baken solution which keeps the various pointlessly
> different pseudo reboot/kexec offlining implementations around. So with
> this we have yet more code which only works depending on kernel
> configuration and has the issue of potentially not being able to offline
> a CPU. IOW this is going to fail completely in cases where a system is
> in a state which prevents regular hotplug.
>
> The existing pseudo-offline functions have timeouts and eventually a
> fallback, e.g. the NMI fallback on x86. With this proposed regular
> offline solution this will just get stuck w/o a chance to force
> recovery.
>
> While I like the idea and surely agree that the ideal solution is to
> properly shutdown the CPUs on reboot, we need to take a step back and
> look at the minimum requirements for a regular shutdown/reboot and at
> the same time have a look at the requirements for emergency shutdown and
> kexec/kcrash. Having proper information about the race conditions and
> warnings you mentioned would be a good starting point.
>

We saw this issue on regular reboot (not panic) on arm64: If tick
broadcast and smp_send_stop() happen together and the first broadcast
arrives to some idled CPU that hasn't already executed reboot ipi to
run in spinloop, it would try to broadcast to another CPU, but that
target CPU is already marked as offline by set_cpu_online() in reboot
ipi, and a warning comes out since tick_handle_oneshot_broadcast()
would check if it tries to broadcast to offline cpus. Most of the time
the CPU getting the broadcast interrupt is already in the spinloop and
thus isn't going to receive interrupts from the broadcast timer.

[   27.032080] Set kernel.core_pattern before fs.suid_dumpable.
[   27.978628] reboot: Restarting system
[   27.978919] WARNING: CPU: 3 PID: 0 at
/mnt/host/source/src/third_party/kernel/v4.19/kernel/time/tick-broadcast.c:652
tick_handle_oneshot_broadcast+0x1f8/0x214
[   27.978932] Modules linked in: rfcomm uinput bridge stp llc
nf_nat_tftp nf_conntrack_tftp nf_nat_ftp nf_conntrack_ftp esp6 ah6
xfrm6_mode_tunnel xfrm6_mode_transport xfrm4_mode_tunnel
xfrm4_mode_transport ip6t_REJECT ip6t_ipv6header hci_uart btqca
bluetooth ipt_MASQUERADE ecdh_generic lzo_rle lzo_compress zram fuse
cros_ec_sensors_sync cros_ec_sensors_ring cros_ec_light_prox
cros_ec_sensors industrialio_triggered_buffer kfifo_buf
cros_ec_sensors_core ath10k_sdio ath10k_core ath mac80211 cfg80211
asix usbnet mii joydev
[   27.979102] CPU: 3 PID: 0 Comm: swapper/3 Tainted: G S
  4.19.56 #79
[   27.979113] Hardware name: MediaTek krane sku176 board (DT)
[   27.979127] pstate: 00000085 (nzcv daIf -PAN -UAO)
[   27.979140] pc : tick_handle_oneshot_broadcast+0x1f8/0x214
[   27.979154] lr : tick_handle_oneshot_broadcast+0x108/0x214
[   27.979162] sp : fffffff85c851610
[   27.979171] x29: fffffff85c851670 x28: ffffff9082785510
[   27.979187] x27: ffffff90822da700 x26: ffffff90826169c8
[   27.979202] x25: ffffff9082616000 x24: 0000000000000001
[   27.979217] x23: ffffff90827854f8 x22: 000000067a6599b8
[   27.979232] x21: 0000000000000000 x20: 7fffffffffffffff
[   27.979248] x19: ffffff9082785508 x18: 0000000000000000
[   27.979263] x17: 0000000000000000 x16: 0000000000000000
[   27.979278] x15: 0000000000000000 x14: fffffff85bf08040
[   27.979293] x13: ffffff9082785000 x12: 0000000000000069
[   27.979308] x11: ffffff9082785000 x10: 0000000000000018
[   27.979323] x9 : 0000000000000010 x8 : ffffff9082615000
[   27.979338] x7 : 0000000000000000 x6 : 000000000000003f
[   27.979353] x5 : 0000000000000040 x4 : 0000000000000102
[   27.979367] x3 : 0000000000000000 x2 : 0000000000000007
[   27.979383] x1 : 0000000000000008 x0 : 0000000000000008
[   27.979399] Call trace:
[   27.979413]  tick_handle_oneshot_broadcast+0x1f8/0x214
[   27.979429]  mtk_syst_handler+0x34/0x44
[   27.979443]  __handle_irq_event_percpu+0x134/0x254
[   27.979454]  handle_irq_event_percpu+0x34/0x8c
[   27.979465]  handle_irq_event+0x48/0x78
[   27.979478]  handle_fasteoi_irq+0xd0/0x1a4
[   27.979492]  __handle_domain_irq+0x84/0xc4
[   27.979505]  gic_handle_irq+0x154/0x1a4
[   27.979516]  el1_irq+0xb0/0x128
[   27.979531]  cpuidle_enter_state+0x298/0x328
[   27.979543]  cpuidle_enter+0x30/0x40
[   27.979557]  do_idle+0x154/0x270
[   27.979569]  cpu_startup_entry+0x24/0x28
[   27.979584]  secondary_start_kernel+0x15c/0x168
[   27.979594] ---[ end trace 57ed1d1fade60372 ]---

If system supports hotplug, _cpu_down() would properly handle tasks
termination such as remove CPU from timer broadcasting by
tick_offline_cpu()...etc, as well as some interrupt handling.

https://lore.kernel.org/patchwork/patch/1117201/ is a previous attempt
to solve this issue by introducing another mask in reboot ipi function
to avoid the cpu_online_mask being looked up in too many different
places.

> > Opt in this config for architectures that support CONFIG_HOTPLUG_CPU.
>
> This is not opt-in. You force that on all architectures which support
> CONFIG_HOTPLUG_CPU. The way we do this normally is to provide the
> infrastructure first and then have separate patches (one per
> architecture) enabling this, which allows the architecture maintainers
> to decide individually.

Acked, thanks.

>
> Thanks,
>
>         tglx
