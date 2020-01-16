Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27A1013D8C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 12:14:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47z1my1FhwzDqN9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 22:14:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47z1j03wPqzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 22:11:16 +1100 (AEDT)
Received: from [5.158.153.52] (helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1is33A-00050C-K7; Thu, 16 Jan 2020 12:10:56 +0100
Received: by nanos.tec.linutronix.de (Postfix, from userid 1000)
 id 3D46D101B66; Thu, 16 Jan 2020 12:10:56 +0100 (CET)
From: Thomas Gleixner <tglx@linutronix.de>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Subject: Re: [PATCH v5] reboot: support offline CPUs before reboot
In-Reply-To: <CAJMQK-jDi+AACE1Cv_hKSMq8VhGTBeh+kyHO2U4sx9w=9bO2mA@mail.gmail.com>
References: <20200115063410.131692-1-hsinyi@chromium.org>
 <8736cgxmxi.fsf@nanos.tec.linutronix.de>
 <CAJMQK-jDi+AACE1Cv_hKSMq8VhGTBeh+kyHO2U4sx9w=9bO2mA@mail.gmail.com>
Date: Thu, 16 Jan 2020 12:10:56 +0100
Message-ID: <87h80vwta7.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain
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

Hsin-Yi Wang <hsinyi@chromium.org> writes:
> On Thu, Jan 16, 2020 at 8:30 AM Thomas Gleixner <tglx@linutronix.de> wrote:
> We saw this issue on regular reboot (not panic) on arm64: If tick
> broadcast and smp_send_stop() happen together and the first broadcast
> arrives to some idled CPU that hasn't already executed reboot ipi to
> run in spinloop, it would try to broadcast to another CPU, but that
> target CPU is already marked as offline by set_cpu_online() in reboot
> ipi, and a warning comes out since tick_handle_oneshot_broadcast()
> would check if it tries to broadcast to offline cpus. Most of the time
> the CPU getting the broadcast interrupt is already in the spinloop and
> thus isn't going to receive interrupts from the broadcast timer.

The timer broadcasting is obviously broken by the existing reboot unplug
mechanism as the outgoing CPU should remove itself from the broadcast.

Just addressing the broadcast issue is not sufficient as there are tons
of other places which rely on consistency of the various cpu masks.

> If system supports hotplug, _cpu_down() would properly handle tasks
> termination such as remove CPU from timer broadcasting by
> tick_offline_cpu()...etc, as well as some interrupt handling.

Well, emphasis on 'if system supports hotplug'. If not, then you are
back to square one. On ARM64 hotplug is selectable by a config option.

So either we mandate HOTPLUG_CPU for SMP and get rid of all the
ifdeffery or we need to have a mechanism which works on !HOTPLUG_CPU as
well.

That whole reboot/shutdown stuff is an unpenetrable mess of notifiers
and architecture hackery, so something generic and understandable is
really required.

Thanks,

        tglx
