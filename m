Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D89DF20FBEB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 20:40:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xCpf6CyZzDqnK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 04:40:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=rjwysocki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xCmx21w7zDqPC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 04:38:55 +1000 (AEST)
Received: by mail-ot1-f67.google.com with SMTP id k15so19195810otp.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 11:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U4CE/0puyHhDFR+hvTXHPqKihS4zRWzdZIBdwpMjjPI=;
 b=c2qL0C/nu1Dzm1iT5P929S03uKZ1tssmhRrR+wibZVw4k58P5SE3EJrOP0EmYyL1Oy
 We+z8io46slq16Jw5ecGIorrNttsV0AbTse67afCc687wboU9vAKEAqsiJwefkXI57Qq
 4k+MBox89W+WzDZsw7IRnDWttlM3PeTOL689CUmlXD2oDnUpNnQhHF+wiXE92SpcuDlS
 vr0cWgkkllyGy2WSHv24KVcyKydhIal1wqigttiSlUJsud6LG8ZVI7R7hu6P8MTMLVQk
 oicCbn54OWt1hO6tZxaIkUeTshoH0PKqOsqKUsfO4OuPXzpXi3rQkS1OwuEOnh2L4doW
 DXsw==
X-Gm-Message-State: AOAM533YDp260wa1nRKnG5yzsTZ2SMYowpl24h1PlamufeFoWzTl8iJd
 WhCGpgzG8gpfme7GcCgx0EbXBkaFnv+32nu6Sww=
X-Google-Smtp-Source: ABdhPJySOGPpCYIMPEpa4NqaFUumrZMT0Y1q+t1uhnyYXYD7Q0zC+lTmDJBQPsveJWJkDKW5dW8oyRZX6fbr/yadk7A=
X-Received: by 2002:a9d:1c82:: with SMTP id l2mr1714092ota.167.1593542332362; 
 Tue, 30 Jun 2020 11:38:52 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1593418662.git.viresh.kumar@linaro.org>
In-Reply-To: <cover.1593418662.git.viresh.kumar@linaro.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 30 Jun 2020 20:38:41 +0200
Message-ID: <CAJZ5v0jmYDmSRX4UkXGH7HrnrRX-9ZGF6G-Z2LQuVyTWMp8eww@mail.gmail.com>
Subject: Re: [PATCH V4 0/3] cpufreq: Allow default governor on cmdline and fix
 locking issues
To: Viresh Kumar <viresh.kumar@linaro.org>
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
Cc: Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Peter Zijlstra <peterz@infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, adharmap@codeaurora.org,
 Linux PM <linux-pm@vger.kernel.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Quentin Perret <qperret@google.com>,
 Ben Segall <bsegall@google.com>, Ingo Molnar <mingo@redhat.com>,
 Mel Gorman <mgorman@suse.de>, "Cc: Android Kernel" <kernel-team@android.com>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Todd Kjos <tkjos@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 29, 2020 at 10:58 PM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> Hi,
>
> I have picked Quentin's series over my patch, modified both and tested.
>
> V3->V4:
> - Do __module_get() for cpufreq_default_governor() case as well and get
>   rid of an extra variable.
> - Use a single character array, default_governor, instead of two of them.
>
> V2->V3:
> - default_governor is a string now and we don't set it on governor
>   registration or unregistration anymore.
> - Fixed locking issues in cpufreq_init_policy().
>
> --
> Viresh
>
> Original cover letter fro Quentin:
>
> This series enables users of prebuilt kernels (e.g. distro kernels) to
> specify their CPUfreq governor of choice using the kernel command line,
> instead of having to wait for the system to fully boot to userspace to
> switch using the sysfs interface. This is helpful for 2 reasons:
>   1. users get to choose the governor that runs during the actual boot;
>   2. it simplifies the userspace boot procedure a bit (one less thing to
>      worry about).
>
> To enable this, the first patch moves all governor init calls to
> core_initcall, to make sure they are registered by the time the drivers
> probe. This should be relatively low impact as registering a governor
> is a simple procedure (it gets added to a llist), and all governors
> already load at core_initcall anyway when they're set as the default
> in Kconfig. This also allows to clean-up the governors' init/exit code,
> and reduces boilerplate.
>
> The second patch introduces the new command line parameter, inspired by
> its cpuidle counterpart. More details can be found in the respective
> patch headers.
>
> Changes in v2:
>  - added Viresh's ack to patch 01
>  - moved the assignment of 'default_governor' in patch 02 to the governor
>    registration path instead of the driver registration (Viresh)
>
> Quentin Perret (2):
>   cpufreq: Register governors at core_initcall
>   cpufreq: Specify default governor on command line
>
> Viresh Kumar (1):
>   cpufreq: Fix locking issues with governors
>
>  .../admin-guide/kernel-parameters.txt         |  5 ++
>  Documentation/admin-guide/pm/cpufreq.rst      |  6 +-
>  .../platforms/cell/cpufreq_spudemand.c        | 26 +-----
>  drivers/cpufreq/cpufreq.c                     | 87 ++++++++++++-------
>  drivers/cpufreq/cpufreq_conservative.c        | 22 ++---
>  drivers/cpufreq/cpufreq_ondemand.c            | 24 ++---
>  drivers/cpufreq/cpufreq_performance.c         | 14 +--
>  drivers/cpufreq/cpufreq_powersave.c           | 18 +---
>  drivers/cpufreq/cpufreq_userspace.c           | 18 +---
>  include/linux/cpufreq.h                       | 14 +++
>  kernel/sched/cpufreq_schedutil.c              |  6 +-
>  11 files changed, 100 insertions(+), 140 deletions(-)
>
> --

All three patches applied as 5.9 material, thanks!
