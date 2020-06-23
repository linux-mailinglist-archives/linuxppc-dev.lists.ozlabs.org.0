Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B01206717
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 00:18:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s0yz2HWczDqcy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 08:18:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=telus.net (client-ip=209.171.16.91; helo=cmta18.telus.net;
 envelope-from=dsmythies@telus.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=telus.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=telus.net header.i=@telus.net header.a=rsa-sha256
 header.s=neo header.b=rBKHO9KS; dkim-atps=neutral
X-Greylist: delayed 233 seconds by postgrey-1.36 at bilbo;
 Wed, 24 Jun 2020 03:59:36 AEST
Received: from cmta18.telus.net (cmta18.telus.net [209.171.16.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rvDm32yVzDqVj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 03:59:35 +1000 (AEST)
Received: from dougxps ([173.180.45.4]) by cmsmtp with SMTP
 id nn7yjynjsVEJfnn7zj4JZr; Tue, 23 Jun 2020 11:54:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=telus.net; s=neo;
 t=1592934881; bh=B4rltPCrYDATZ3jKMgrnW3cKHjW7tbQI6WbcVyYwP8M=;
 h=From:To:Cc:References:In-Reply-To:Subject:Date;
 b=rBKHO9KSVyembk0vyrn59MfJQAo2WjL9+iOu31FxctTKrrpnmXMu12KSKyvDO80wZ
 YhdjmRp0XX1tfgzTtVZv/Hrr1HId2N1foJPq2ZsZR4xiRaPLFEtVSgp/TKHSnze92J
 E+zjqstk2kT84mnsBMOVuDqWd4qbb7NOA4Apt7GZ7EurcbVyVUDe2VuuIVHV044w1E
 Yx1N4MvR9QXdn09EaXXuKck2Mx4FDIRw2toDyRX4s+b5Hck9TtTvLzOnT08BlaVEBv
 p0c4IdPOJjNeorlrsJXvrcg7yKqoJGVYHTRKHAL65p6tTkSwG3oOYkyyopHCCG3iTa
 OSyCAOG0QBEyQ==
X-Telus-Authed: none
X-Authority-Analysis: v=2.3 cv=KIck82No c=1 sm=1 tr=0
 a=zJWegnE7BH9C0Gl4FFgQyA==:117 a=zJWegnE7BH9C0Gl4FFgQyA==:17
 a=Pyq9K9CWowscuQLKlpiwfMBGOR0=:19 a=IkcTkHD0fZMA:10 a=Y1XEqrXkt80nLp6DE-UA:9
 a=7Zwj6sZBwVKJAoWSPKxL6X1jA+E=:19 a=QEXdDO2ut3YA:10
From: "Doug Smythies" <dsmythies@telus.net>
To: "'Quentin Perret'" <qperret@google.com>
References: <20200623142138.209513-1-qperret@google.com>
In-Reply-To: <20200623142138.209513-1-qperret@google.com>
Subject: RE: [PATCH v2 0/2] cpufreq: Specify the default governor on command
 line
Date: Tue, 23 Jun 2020 10:54:33 -0700
Message-ID: <002201d64987$5dc93b90$195bb2b0$@net>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AdZJaaHcP5RdUeGMRwewlXzPV6L8fwAGk87g
Content-Language: en-ca
X-CMAE-Envelope: MS4wfJu2yqI8bRMr3UvgLSZTDIOmbcCsPGfJ6bFMtvxEaoYm2d6MHbeS6knNu9stKr4x3M2WemFcg+T8r+YcHHN7Xm9m2GVRbnx9rrulnY0dOdo50fpRI8bF
 L8C+gFGAN5a+pWPiW+Lf7UlIJ5vgUuvY4Cia10wb5tuYjUhIsibPUqw8CtQDcQqUnRl8B0KfSFDePVIoUmbQ+JP42QAcGEVgYvnmEUq8hjSuq5YyzzLJg+S4
 5Fcz0YvOEMWWgZVKttfvUWNGdLsN4rUHUfHwDGKQKKrmd0MseovLCT5Ct4yz58lEkF5A8wEKz95upfBi7W5Vvz+8xuLTG+OlxGl3Mggol+9Ou87f8VvCTkpp
 MZb6MBTz4VxxT08r+nRm66fKbyVlBuaJGRasoLoU4k7l92Nq+bfvfslIeLAtCpMwrTeoYdOXA4Ja+xgivuKozyPRdJ/nVg9uqnzqpKUe/48c25TFhUM083Vx
 HnGW8Ja+bMyxKQo+djKsm9SU1N8JLmaiNF49RPK0m8E1ynsnyZ+RXk47RWITIM0Ztd76eT17vo0Sm1nbdFM9ZJB+7G93bqcfXyKGMKHh9MCG/CVjyOPLnkaZ
 lTrKtzC6oA/opqTaIoMj3H2FtUtOfU4fnXj1CYWgsW/ZbU+T/7O1jN6STF3HfSYYsuAwbgtAsqsVT08FfG+FGU7Pnm5X23RFcXsQe30uC5oNMjus53Cfzoo8
 iKufS4H/2mc=
X-Mailman-Approved-At: Wed, 24 Jun 2020 08:12:44 +1000
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
Cc: juri.lelli@redhat.com, kernel-team@android.com, vincent.guittot@linaro.org,
 arnd@arndb.de, linux-pm@vger.kernel.org, peterz@infradead.org,
 adharmap@codeaurora.org, rafael@kernel.org, rjw@rjwysocki.net,
 linux-kernel@vger.kernel.org, viresh.kumar@linaro.org, mingo@redhat.com,
 paulus@samba.org, linuxppc-dev@lists.ozlabs.org, tkjos@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020.06.23 07:22 Quentin Perret wrote:
>=20
> This series enables users of prebuilt kernels (e.g. distro kernels) to
> specify their CPUfreq governor of choice using the kernel command =
line,
> instead of having to wait for the system to fully boot to userspace to
> switch using the sysfs interface. This is helpful for 2 reasons:
>   1. users get to choose the governor that runs during the actual =
boot;
>   2. it simplifies the userspace boot procedure a bit (one less thing =
to
>      worry about).
>=20
> To enable this, the first patch moves all governor init calls to
> core_initcall, to make sure they are registered by the time the =
drivers
> probe. This should be relatively low impact as registering a governor
> is a simple procedure (it gets added to a llist), and all governors
> already load at core_initcall anyway when they're set as the default
> in Kconfig. This also allows to clean-up the governors' init/exit =
code,
> and reduces boilerplate.
>=20
> The second patch introduces the new command line parameter, inspired =
by
> its cpuidle counterpart. More details can be found in the respective
> patch headers.
>=20
> Changes in v2:
>  - added Viresh's ack to patch 01
>  - moved the assignment of 'default_governor' in patch 02 to the =
governor
>    registration path instead of the driver registration (Viresh)
>=20
> Thanks,
> Quentin
>=20
> Quentin Perret (2):
>   cpufreq: Register governors at core_initcall
>   cpufreq: Specify default governor on command line
>=20
>  .../admin-guide/kernel-parameters.txt         |  5 ++++
>  Documentation/admin-guide/pm/cpufreq.rst      |  6 ++---
>  .../platforms/cell/cpufreq_spudemand.c        | 26 =
++-----------------
>  drivers/cpufreq/cpufreq.c                     | 23 ++++++++++++----
>  drivers/cpufreq/cpufreq_conservative.c        | 22 ++++------------
>  drivers/cpufreq/cpufreq_ondemand.c            | 24 +++++------------
>  drivers/cpufreq/cpufreq_performance.c         | 14 ++--------
>  drivers/cpufreq/cpufreq_powersave.c           | 18 +++----------
>  drivers/cpufreq/cpufreq_userspace.c           | 18 +++----------
>  include/linux/cpufreq.h                       | 14 ++++++++++
>  kernel/sched/cpufreq_schedutil.c              |  6 +----
>  11 files changed, 62 insertions(+), 114 deletions(-)
>=20
> --
> 2.27.0.111.gc72c7da667-goog

Hi Quentin,

Because I am lazy and sometimes do not want to recompile
the distro source, I have a need/desire for this.

Tested these two grub command lines:

GRUB_CMDLINE_LINUX_DEFAULT=3D"ipv6.disable=3D1 consoleblank=3D300 =
intel_pstate=3Ddisable cpufreq.default_governor=3Dschedutil =
cpuidle_sysfs_switch cpuidle.governor=3Dteo"

And

#GRUB_CMDLINE_LINUX_DEFAULT=3D"ipv6.disable=3D1 consoleblank=3D450 =
intel_pstate=3Dpassive cpufreq.default_governor=3Dschedutil =
cpuidle_sysfs_switch cpuidle.governor=3Dteo"

And all worked as expected. I use Ubuntu as my distro, and also had to =
disable a startup script that switches to "ondemand", or similar, after =
1 minute.

As a side note (separate subject, but is one reason I tried it):
My i5-9600K based computer seems to hit a power limit during boot =
approximately 3 seconds after kernel selection on grub.
This had no effect on that issue (even when selecting powersave =
governor).

... Doug


