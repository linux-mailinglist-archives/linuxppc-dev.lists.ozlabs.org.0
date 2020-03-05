Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C0317A1D7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 10:04:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y4ZS1308zDqtZ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 20:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=canonical.com
 (client-ip=91.189.89.112; helo=youngberry.canonical.com;
 envelope-from=po-hsu.lin@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=canonical.com
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y4XS3yYHzDqQZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 20:03:02 +1100 (AEDT)
Received: from mail-lf1-f72.google.com ([209.85.167.72])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <po-hsu.lin@canonical.com>) id 1j9mPB-0006da-SL
 for linuxppc-dev@lists.ozlabs.org; Thu, 05 Mar 2020 09:02:57 +0000
Received: by mail-lf1-f72.google.com with SMTP id o25so128140lfb.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Mar 2020 01:02:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zrSbYIRTjXPuBmdlG/mjTUYNkZeuzj3eG/1piLNpOjc=;
 b=Y/n3N5tTO2NUqaN2gVOhst9ZLShtflbKQ5djfRdb3Rk4YtJvAkc2ysiVmZ5vKxEAxD
 2m9GdLcxnw8bS1C2awIwZOG1fHNfET9N9DdItZnCttsi5l4cddNPPAvJpejw/7Ksz+sm
 /qW7dn2PxTygDVPnIYG6nT5Tae5zEVpF/7lyGx8rekZxXoxE8u4syptNCDeitf4Llsmc
 7SUJyXCqZlWSarozLgCwR67+i5duAZHhaJku4ekegYy8pgipmwmKxc/xcXWhLRX9bDln
 ARRVShgG+fPUd+nxn4XY0gO/ck7ADMPBz98a7P/WH3Q7SJazFQ0EUw8eWbzdhcBfHW5T
 DOhg==
X-Gm-Message-State: ANhLgQ0GCt+293u52ekAUG4c+wCsL/HxT6ce1NXBi6AQrA2LB/A5vdet
 dN0eHOLlS3J5SQLl9uYShM4PnMFsjlIQ+3sjUzduk7/QbxrdqRoli6Ro6b04YwA+VEe+AghpvRg
 NNpN7bGhfE10kzI1Kk0mwKzxxBEkLB5v+1npz7qsLoPvMUh6Cg3krLisfHQ==
X-Received: by 2002:a2e:570f:: with SMTP id l15mr4709797ljb.236.1583398977201; 
 Thu, 05 Mar 2020 01:02:57 -0800 (PST)
X-Google-Smtp-Source: ADFU+vt6qfV8GneO9Qxk/ML5cwfUpdwGUMAQ9cLA99DbdPFD0fdAYfOPF1pIXzb0KzrNtVpg5u6CW/KNa/X3H2JyZa4=
X-Received: by 2002:a2e:570f:: with SMTP id l15mr4709770ljb.236.1583398976762; 
 Thu, 05 Mar 2020 01:02:56 -0800 (PST)
MIME-Version: 1.0
References: <20200304131553.27582-1-po-hsu.lin@canonical.com>
 <87zhcvp89e.fsf@mpe.ellerman.id.au>
In-Reply-To: <87zhcvp89e.fsf@mpe.ellerman.id.au>
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
Date: Thu, 5 Mar 2020 17:02:45 +0800
Message-ID: <CAMy_GT9fr9cq3FrxUEjv+UhFuduqwPzBjeOL25Kp_EPAAmpU2g@mail.gmail.com>
Subject: Re: [PATCH] selftests/powerpc: Turn off timeout setting for
 benchmarks, dscr, signal, tm
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, linux-kselftest@vger.kernel.org, shuah <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 5, 2020 at 3:32 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Po-Hsu Lin <po-hsu.lin@canonical.com> writes:
> > Some specific tests in powerpc can take longer than the default 45
> > seconds that added in commit 852c8cbf (selftests/kselftest/runner.sh:
> > Add 45 second timeout per test) to run, the following test result was
> > collected across 2 Power8 nodes and 1 Power9 node in our pool:
> >   powerpc/benchmarks/futex_bench - 52s
> >   powerpc/dscr/dscr_sysfs_test - 116s
> >   powerpc/signal/signal_fuzzer - 88s
> >   powerpc/tm/tm_unavailable_test - 168s
> >   powerpc/tm/tm-poison - 240s
> >
> > Thus they will fail with TIMEOUT error. Disable the timeout setting
> > for these sub-tests to allow them finish properly.
>
> I run the powerpc tests with run-parts, rather than the kselftest
> script, we already have our own test runner with a 120s timeout.
>
> I didn't think the kselftests runner actually worked with the powerpc
> tests? Because we override RUN_TESTS.
>
Hello Michael,

I have done a small experiment with timeout=1 in settings and use
run-parts to run the executables, it looks like this change won't
affect run-parts.

Not quite sure about the RUN_TESTS you mentioned here, we're testing
it with command like:
sudo make -C linux/tools/testing/selftests TARGETS=powerpc run_tests
And the timeout setting will take effect with this.

Thanks

> cheers
>
>
> > https://bugs.launchpad.net/bugs/1864642
> > Signed-off-by: Po-Hsu Lin <po-hsu.lin@canonical.com>
> > ---
> >  tools/testing/selftests/powerpc/benchmarks/Makefile | 2 ++
> >  tools/testing/selftests/powerpc/benchmarks/settings | 1 +
> >  tools/testing/selftests/powerpc/dscr/Makefile       | 2 ++
> >  tools/testing/selftests/powerpc/dscr/settings       | 1 +
> >  tools/testing/selftests/powerpc/signal/Makefile     | 2 ++
> >  tools/testing/selftests/powerpc/signal/settings     | 1 +
> >  tools/testing/selftests/powerpc/tm/Makefile         | 2 ++
> >  tools/testing/selftests/powerpc/tm/settings         | 1 +
> >  8 files changed, 12 insertions(+)
> >  create mode 100644 tools/testing/selftests/powerpc/benchmarks/settings
> >  create mode 100644 tools/testing/selftests/powerpc/dscr/settings
> >  create mode 100644 tools/testing/selftests/powerpc/signal/settings
> >  create mode 100644 tools/testing/selftests/powerpc/tm/settings
> >
> > diff --git a/tools/testing/selftests/powerpc/benchmarks/Makefile b/tools/testing/selftests/powerpc/benchmarks/Makefile
> > index d40300a..a32a6ab 100644
> > --- a/tools/testing/selftests/powerpc/benchmarks/Makefile
> > +++ b/tools/testing/selftests/powerpc/benchmarks/Makefile
> > @@ -2,6 +2,8 @@
> >  TEST_GEN_PROGS := gettimeofday context_switch fork mmap_bench futex_bench null_syscall
> >  TEST_GEN_FILES := exec_target
> >
> > +TEST_FILES := settings
> > +
> >  CFLAGS += -O2
> >
> >  top_srcdir = ../../../../..
> > diff --git a/tools/testing/selftests/powerpc/benchmarks/settings b/tools/testing/selftests/powerpc/benchmarks/settings
> > new file mode 100644
> > index 0000000..e7b9417
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/benchmarks/settings
> > @@ -0,0 +1 @@
> > +timeout=0
> > diff --git a/tools/testing/selftests/powerpc/dscr/Makefile b/tools/testing/selftests/powerpc/dscr/Makefile
> > index 5df4763..cfa6eed 100644
> > --- a/tools/testing/selftests/powerpc/dscr/Makefile
> > +++ b/tools/testing/selftests/powerpc/dscr/Makefile
> > @@ -3,6 +3,8 @@ TEST_GEN_PROGS := dscr_default_test dscr_explicit_test dscr_user_test \
> >             dscr_inherit_test dscr_inherit_exec_test dscr_sysfs_test  \
> >             dscr_sysfs_thread_test
> >
> > +TEST_FILES := settings
> > +
> >  top_srcdir = ../../../../..
> >  include ../../lib.mk
> >
> > diff --git a/tools/testing/selftests/powerpc/dscr/settings b/tools/testing/selftests/powerpc/dscr/settings
> > new file mode 100644
> > index 0000000..e7b9417
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/dscr/settings
> > @@ -0,0 +1 @@
> > +timeout=0
> > diff --git a/tools/testing/selftests/powerpc/signal/Makefile b/tools/testing/selftests/powerpc/signal/Makefile
> > index 113838f..153fafc 100644
> > --- a/tools/testing/selftests/powerpc/signal/Makefile
> > +++ b/tools/testing/selftests/powerpc/signal/Makefile
> > @@ -5,6 +5,8 @@ CFLAGS += -maltivec
> >  $(OUTPUT)/signal_tm: CFLAGS += -mhtm
> >  $(OUTPUT)/sigfuz: CFLAGS += -pthread -m64
> >
> > +TEST_FILES := settings
> > +
> >  top_srcdir = ../../../../..
> >  include ../../lib.mk
> >
> > diff --git a/tools/testing/selftests/powerpc/signal/settings b/tools/testing/selftests/powerpc/signal/settings
> > new file mode 100644
> > index 0000000..e7b9417
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/signal/settings
> > @@ -0,0 +1 @@
> > +timeout=0
> > diff --git a/tools/testing/selftests/powerpc/tm/Makefile b/tools/testing/selftests/powerpc/tm/Makefile
> > index b15a1a3..7b99d09 100644
> > --- a/tools/testing/selftests/powerpc/tm/Makefile
> > +++ b/tools/testing/selftests/powerpc/tm/Makefile
> > @@ -7,6 +7,8 @@ TEST_GEN_PROGS := tm-resched-dscr tm-syscall tm-signal-msr-resv tm-signal-stack
> >       $(SIGNAL_CONTEXT_CHK_TESTS) tm-sigreturn tm-signal-sigreturn-nt \
> >       tm-signal-context-force-tm tm-poison
> >
> > +TEST_FILES := settings
> > +
> >  top_srcdir = ../../../../..
> >  include ../../lib.mk
> >
> > diff --git a/tools/testing/selftests/powerpc/tm/settings b/tools/testing/selftests/powerpc/tm/settings
> > new file mode 100644
> > index 0000000..e7b9417
> > --- /dev/null
> > +++ b/tools/testing/selftests/powerpc/tm/settings
> > @@ -0,0 +1 @@
> > +timeout=0
> > --
> > 2.7.4
