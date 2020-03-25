Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61080192DC8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 17:04:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nXy03rWYzDqfB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Mar 2020 03:04:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nXvl63f9zDqQM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Mar 2020 03:02:59 +1100 (AEDT)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1jH8Ts-0005AG-4C; Wed, 25 Mar 2020 17:02:12 +0100
Date: Wed, 25 Mar 2020 17:02:12 +0100
From: Sebastian Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: Documentation/locking/locktypes: Further clarifications and
 wordsmithing
Message-ID: <20200325160212.oavrni7gmzudnczv@linutronix.de>
References: <20200323025501.GE3199@paulmck-ThinkPad-P72>
 <87r1xhz6qp.fsf@nanos.tec.linutronix.de>
 <20200325002811.GO19865@paulmck-ThinkPad-P72>
 <87wo78y5yy.fsf@nanos.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <87wo78y5yy.fsf@nanos.tec.linutronix.de>
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
Cc: linux-usb@vger.kernel.org, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 linux-acpi@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Jonathan Corbet <corbet@lwn.net>, linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 paulmck@kernel.org, linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Greentime Hu <green.hu@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 platform-driver-x86@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 kbuild test robot <lkp@intel.com>, Felipe Balbi <balbi@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Nick Hu <nickhu@andestech.com>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Davidlohr Bueso <dbueso@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-03-25 13:27:49 [+0100], Thomas Gleixner wrote:
> The documentation of rw_semaphores is wrong as it claims that the non-own=
er
> reader release is not supported by RT. That's just history biased memory
> distortion.
>=20
> Split the 'Owner semantics' section up and add separate sections for
> semaphore and rw_semaphore to reflect reality.
>=20
> Aside of that the following updates are done:
>=20
>  - Add pseudo code to document the spinlock state preserving mechanism on
>    PREEMPT_RT
>=20
>  - Wordsmith the bitspinlock and lock nesting sections
>=20
> Co-developed-by: Paul McKenney <paulmck@kernel.org>
> Signed-off-by: Paul McKenney <paulmck@kernel.org>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

> --- a/Documentation/locking/locktypes.rst
> +++ b/Documentation/locking/locktypes.rst
=E2=80=A6
> +rw_semaphore
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +rw_semaphore is a multiple readers and single writer lock mechanism.
> +
> +On non-PREEMPT_RT kernels the implementation is fair, thus preventing
> +writer starvation.
> +
> +rw_semaphore complies by default with the strict owner semantics, but th=
ere
> +exist special-purpose interfaces that allow non-owner release for reader=
s.
> +These work independent of the kernel configuration.

This reads funny, could be my English. "This works independent =E2=80=A6" m=
aybe?

Sebastian
