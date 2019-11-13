Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E76C8FBB00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 22:43:11 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Cylc4QKQzDrPn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 08:43:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.74; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CyjR5sxDzF72Z
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 08:41:14 +1100 (AEDT)
Received: from mail-qt1-f179.google.com ([209.85.160.179]) by
 mrelayeu.kundenserver.de (mreue106 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1MVMNF-1iLpoo2OCl-00SQeu for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov
 2019 22:41:09 +0100
Received: by mail-qt1-f179.google.com with SMTP id r20so4269507qtp.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 13:41:09 -0800 (PST)
X-Gm-Message-State: APjAAAUsR8/yrC6uaDJXcgIRLnOC932Dz8lGGiCrlszBF8TusIKqtW2E
 ldrie1fpMdy6546v0+lzrjyy88n57smRsR/v1fc=
X-Google-Smtp-Source: APXvYqyjRd+a6foxC3+k9qUEopPf1CRknFxQHbHw9aZuys53MC+zVt0jx9JeruKLHIsAWsaGcA9LllqlMRQxiR5o4ug=
X-Received: by 2002:a37:4f0a:: with SMTP id d10mr4703334qkb.286.1573681267104; 
 Wed, 13 Nov 2019 13:41:07 -0800 (PST)
MIME-Version: 1.0
References: <20191108210236.1296047-1-arnd@arndb.de>
In-Reply-To: <20191108210236.1296047-1-arnd@arndb.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 13 Nov 2019 22:40:50 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1CbDaPqNsOVOuq2UDPSOwzd2U_WEmmXBMwCOhv1=iaSQ@mail.gmail.com>
Message-ID: <CAK8P3a1CbDaPqNsOVOuq2UDPSOwzd2U_WEmmXBMwCOhv1=iaSQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] y2038 cleanups
To: y2038 Mailman List <y2038@lists.linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:W3bjDzLZF1tKQIYe9JIKsdzbwIL417VikqiVHsmR8O4T2ax7MV1
 V+oSCkKpf+J4iMBGxbeNSayOknLodWaYeC2yyNh9Z4bJ3Nce5Zrg9KFf2dSiOhRVIr0Fn87
 BHops8fdr4rx8oMXKxTaqQwgHFz3aTZl5jSBLdUR09IhckuNYlvc4YQPVNb3SAleZPXcJ5v
 MU6djQPcG4BkmyHMqtqLw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:g+8iPcENPrk=:S9TCojgPgq2dlzpMsy5RW1
 BkgD0NPWxZDPkw2ERzVe/JFzgg30ALwc04zvDNgLj8De9Nxxrunox3+QURmatDJs3kFLqTErC
 vRq9g+blw3j9ISWpSNb9KXd77wVTi40A8/8PIL/C0EXo/tXHYIvE29QteLmfpbMinauGS5NQA
 39enBYSKwC94c9lfoCTkRiwPvpUiLRmrlunHUhjn7t6lc5SDooEiB23ns4Ui0rDQ7UbHkpI2H
 3KxT1p1C3XGK5lB+vQf6SwScLt/c2gyHoivNBG/xldmgsqNGPXArmJfif5pqFK4K6h0/3eEog
 0FPlhb4tq8hhejxtUrQl+A8aS3tZlYFdJx0yT9zOnoqxqCbwsqYQQeTUOGHUoeS/w5I9gABch
 5RLAeZ5rTmTXFnbGd/tQekcubZx3d7TwsKpVNXAtViZ5iD8nTa+hGq5rdXL+rZIUPIQHI8VHc
 ubOkVpix0UrdKEbAzp+F4RtQdIOMZW60+W49d1lOEhXOZRNhBEaiVj+guBucYF1+UW/g5432T
 x19zzLxlxRxRe1Cx4Q/Gs14Gip/iFPdubTOiDgzs9MLSTtP0syQx4Yx/iXpkdzVEte4KTESeH
 WWPDics8++MbiBcoMKkRQYssnBwhXyT5Lgims5PzzkwJbYrXISCYhJu2zQjNPNZEsCiUxqNui
 df9hWD71S3Lttdfh1fZCItujFUNnvtl2YD13LmutpUFZeU4aQ1mcvolCEAWOL/t8uOUPkb78y
 ZUMnhTFSKJZ2eTqC6eCEtHPuMv/XdZcJ3s8Pu4GR7wxTE0ZFY+Ry0co+vuC+bIcHfj71Yrhz0
 TvqHRTcuCOodG1GxDLDJmAubmjEPVAC1WQFo6Fq1YDadZ92KANXmrN7SxWSd9XFhdyFTDGgfu
 qoiAaixGZfU2J+m1lCFg==
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
Cc: linux-aio <linux-aio@kvack.org>, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-mips@vger.kernel.org,
 Networking <netdev@vger.kernel.org>, Deepa Dinamani <deepa.kernel@gmail.com>,
 sparclinux <sparclinux@vger.kernel.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>, Paul Moore <paul@paul-moore.com>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Stephen Smalley <sds@tycho.nsa.gov>, SElinux list <selinux@vger.kernel.org>,
 Jeff Dike <jdike@addtoit.com>, alpha <linux-alpha@vger.kernel.org>,
 linux-um@lists.infradead.org, Steven Rostedt <rostedt@goodmis.org>,
 John Stultz <john.stultz@linaro.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Eric Paris <eparis@parisplace.org>, Thomas Gleixner <tglx@linutronix.de>,
 Christian Brauner <christian@brauner.io>, Richard Henderson <rth@twiddle.net>,
 Tony Luck <tony.luck@intel.com>, Parisc List <linux-parisc@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Linux API <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Benjamin LaHaise <bcrl@kvack.org>,
 "Eric W . Biederman" <ebiederm@xmission.com>,
 Richard Weinberger <richard@nod.at>,
 Linux FS-devel Mailing List <linux-fsdevel@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Miller <davem@davemloft.net>, Greentime Hu <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 8, 2019 at 10:04 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> This is a series of cleanups for the y2038 work, mostly intended
> for namespace cleaning: the kernel defines the traditional
> time_t, timeval and timespec types that often lead to y2038-unsafe
> code. Even though the unsafe usage is mostly gone from the kernel,
> having the types and associated functions around means that we
> can still grow new users, and that we may be missing conversions
> to safe types that actually matter.
>
> As there is no rush on any of these patches, I would either
> queue them up in linux-next through my y2038 branch, or
> Thomas could add them to the tip tree if he wants.
>
> As mentioned in another series, this is part of a larger
> effort to fix all the remaining bits and pieces that are
> not completed yet from the y2038 conversion, and the full
> set can be found at:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git/log/?h=y2038-endgame
>
> Maintainers, please review and provide Acks.
>
> Let me know if you have any opinion on whether we should do
> the include last two patches of this series or not.
>
>      Arnd
>
> Arnd Bergmann (23):
>   y2038: remove CONFIG_64BIT_TIME
>   y2038: add __kernel_old_timespec and __kernel_old_time_t
>   y2038: vdso: change timeval to __kernel_old_timeval
>   y2038: vdso: change timespec to __kernel_old_timespec
>   y2038: vdso: change time_t to __kernel_old_time_t
>   y2038: vdso: nds32: open-code timespec_add_ns()
>   y2038: vdso: powerpc: avoid timespec references
>   y2038: ipc: remove __kernel_time_t reference from headers
>   y2038: stat: avoid 'time_t' in 'struct stat'
>   y2038: uapi: change __kernel_time_t to __kernel_old_time_t
>   y2038: rusage: use __kernel_old_timeval
>   y2038: syscalls: change remaining timeval to __kernel_old_timeval
>   y2038: socket: remove timespec reference in timestamping
>   y2038: make ns_to_compat_timeval use __kernel_old_timeval
>   y2038: elfcore: Use __kernel_old_timeval for process times
>   y2038: timerfd: Use timespec64 internally
>   y2038: time: avoid timespec usage in settimeofday()
>   y2038: itimer: compat handling to itimer.c
>   y2038: use compat_{get,set}_itimer on alpha
>   y2038: move itimer reset into itimer.c
>   y2038: itimer: change implementation to timespec64
>   [RFC] y2038: itimer: use ktime_t internally
>   y2038: allow disabling time32 system calls

I've dropped the "[RFC] y2038: itimer: use ktime_t internally" patch
for the moment,
and added two other patches from other series:

y2038: remove CONFIG_64BIT_TIME
y2038: socket: use __kernel_old_timespec instead of timespec

Tentatively pushed out the patches with the Acks I have received so
far to my y2038 branch on git.kernel.org so it gets included in linux-next.

If I hear no complaints, I'll send a pull request for the merge window,
along with the compat-ioctl series I have already queued up in the same
branch.

    Arnd
