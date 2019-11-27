Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B7510B077
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Nov 2019 14:42:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NMQ75Hk9zDqSj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 00:42:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NMHz01xMzDqvR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 00:36:43 +1100 (AEDT)
Received: from mail-qv1-f43.google.com ([209.85.219.43]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M3UhQ-1iZPGK3iIE-000Ykh for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov
 2019 14:36:35 +0100
Received: by mail-qv1-f43.google.com with SMTP id n4so8861878qvq.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 05:36:33 -0800 (PST)
X-Gm-Message-State: APjAAAUO4rePnRYOY1twRAP5pFDQwNN4GhYePE9DyjMIvDHj6sRpzqfe
 MoZEdmBhwJ8bqZj0UjAK55ofOQq9BQ+zIHqzyMk=
X-Google-Smtp-Source: APXvYqwUVmlbP6tTKdotoXt7sMSzYysgUm0qCCKzhXxwlbPreRA7jD6rjDUldB+HlyZ0ZqvnSdV20QuuMxN452E7DOw=
X-Received: by 2002:ad4:404e:: with SMTP id r14mr4979402qvp.4.1574861792782;
 Wed, 27 Nov 2019 05:36:32 -0800 (PST)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 27 Nov 2019 14:36:16 +0100
X-Gmail-Original-Message-ID: <CAK8P3a38Q_yhiyODpFd6ZqLv=QyKRmCm8FOMuSr4RPvGtWNPYw@mail.gmail.com>
Message-ID: <CAK8P3a38Q_yhiyODpFd6ZqLv=QyKRmCm8FOMuSr4RPvGtWNPYw@mail.gmail.com>
Subject: [GIT PULL] y2038: syscall implementation cleanups
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:+AYaEvSiOZwvG+XHD/igs5zYIG5iAmqWOxNFZ0PeYSZ58cp9Qbt
 Qlu39axOWq8Mw03FNT7GdSNlDPx19DG4+jnacMFcyQptDEH0zan6tlv7g3jz6zT57DAr7Mo
 zjqU7jyGx/vBCInK/sJzCVb9yIgRkLvWFa3O73zlT5azBQalev8IZSCZKRdQ4HWi6JKcOOh
 k13ML1wZGdB7PvWBgxh1g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OpPHJCCaqPU=:0z5ddDa5euFa4mXmnKD8Au
 ZH3vsfqL7cwxnPU+dpXU1DUtx+qHl6oARthMnoQrA81YKHniwCWqG2Q1WOEeHtgsz0jzJF0oX
 iKO4PaC6DVftvIdiG8djVZvYlM9sIuZfI9hNS3ny87x0JkcWbCtI2qRmDpChff+uE/yY69jG1
 dlJPNgooJG0Vp8ODtxV2Luel0SR2SAUsc3GsX2IE6QG8LYnc2xAZbAhzWqFLBL94vsKEzlkIw
 gw7jy95miVl0iQFmiHY+LdahL8VORNgE8lRP7qrsc5OdeRu0Lvt7veTZxDl+xEmjHt2Uscpi5
 LtJcUDf/kTcrdhl/OO0578SpnhIhrfnPsfDUZVgTRgtylEVZTpfZ0mBIyH6T1cDQ1OKDUb8dZ
 xVToIXQYtuR2gxLbLgpxWuCxTOfpx3KeJVeH/gtTmUzAxHhsuzR+fjxXSTaEFEkzssaZiDjWg
 svgdoFoySWmlWk0REwHYzB9Aw87QURJazmd/VlcpYbhrhgbRzKZlu49r9fzukZVaZYM84QGPP
 gaFh5McMC4CTCyn+f5GXVN5b3UXIzHKSnrN+jp/A+eTEjr1jPJcbVtGX7HZ2PuSoIrg/PciwF
 9JH2H9IWaUMJ/SZwvXN9drHCOYrPERU04FkDDa8UdpTHO5jlAdVkr8W5v0aVuknITwvVMmNpS
 +zeH3O37eaVwfLcixj6yYRgZk3UvC9OJgy/ll21Xec7vbV4e5KLD0jit0NxgJdf0SN8jgRY/7
 nwzJvGlaJDWZUA2HrrxG1D6b+DbldxFzksFVB1sSFO9eyYKDeaGnut/dFkjL4BKJEuE9cyHTJ
 C/nre7bdgQupyjUH8RXdwNxeseGysTujTcHiWIDE1Gzsn2OzAolgAfmSGm3TcWQkyuHaAu+a3
 upi4TNn7G7uQaIhPzlhA==
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
Cc: y2038 Mailman List <y2038@lists.linaro.org>,
 Linux API <linux-api@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The following changes since commit a99d8080aaf358d5d23581244e5da23b35e340b9:

  Linux 5.4-rc6 (2019-11-03 14:07:26 -0800)

are available in the Git repository at:

  git://git.kernel.org:/pub/scm/linux/kernel/git/arnd/playground.git
tags/y2038-cleanups-5.5

for you to fetch changes up to b111df8447acdeb4b9220f99d5d4b28f83eb56ad:

  y2038: alarm: fix half-second cut-off (2019-11-25 21:52:35 +0100)

----------------------------------------------------------------
y2038: syscall implementation cleanups

This is a series of cleanups for the y2038 work, mostly intended
for namespace cleaning: the kernel defines the traditional
time_t, timeval and timespec types that often lead to y2038-unsafe
code. Even though the unsafe usage is mostly gone from the kernel,
having the types and associated functions around means that we
can still grow new users, and that we may be missing conversions
to safe types that actually matter.

There are still a number of driver specific patches needed to
get the last users of these types removed, those have been
submitted to the respective maintainers.

Link: https://lore.kernel.org/lkml/20191108210236.1296047-1-arnd@arndb.de/
Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Arnd Bergmann (26):
      y2038: remove CONFIG_64BIT_TIME
      y2038: add __kernel_old_timespec and __kernel_old_time_t
      y2038: vdso: change timeval to __kernel_old_timeval
      y2038: vdso: change timespec to __kernel_old_timespec
      y2038: vdso: change time_t to __kernel_old_time_t
      y2038: vdso: nds32: open-code timespec_add_ns()
      y2038: vdso: powerpc: avoid timespec references
      y2038: ipc: remove __kernel_time_t reference from headers
      y2038: stat: avoid 'time_t' in 'struct stat'
      y2038: uapi: change __kernel_time_t to __kernel_old_time_t
      y2038: rusage: use __kernel_old_timeval
      y2038: syscalls: change remaining timeval to __kernel_old_timeval
      y2038: socket: remove timespec reference in timestamping
      y2038: socket: use __kernel_old_timespec instead of timespec
      y2038: make ns_to_compat_timeval use __kernel_old_timeval
      y2038: elfcore: Use __kernel_old_timeval for process times
      y2038: timerfd: Use timespec64 internally
      y2038: time: avoid timespec usage in settimeofday()
      y2038: itimer: compat handling to itimer.c
      y2038: use compat_{get,set}_itimer on alpha
      y2038: move itimer reset into itimer.c
      y2038: itimer: change implementation to timespec64
      y2038: allow disabling time32 system calls
      y2038: fix typo in powerpc vdso "LOPART"
      y2038: ipc: fix x32 ABI breakage
      y2038: alarm: fix half-second cut-off

 arch/Kconfig                              |  11 +-
 arch/alpha/kernel/osf_sys.c               |  67 +----------
 arch/alpha/kernel/syscalls/syscall.tbl    |   4 +-
 arch/ia64/kernel/asm-offsets.c            |   2 +-
 arch/mips/include/uapi/asm/msgbuf.h       |   6 +-
 arch/mips/include/uapi/asm/sembuf.h       |   4 +-
 arch/mips/include/uapi/asm/shmbuf.h       |   6 +-
 arch/mips/include/uapi/asm/stat.h         |  16 +--
 arch/mips/kernel/binfmt_elfn32.c          |   4 +-
 arch/mips/kernel/binfmt_elfo32.c          |   4 +-
 arch/nds32/kernel/vdso/gettimeofday.c     |  61 +++++-----
 arch/parisc/include/uapi/asm/msgbuf.h     |   6 +-
 arch/parisc/include/uapi/asm/sembuf.h     |   4 +-
 arch/parisc/include/uapi/asm/shmbuf.h     |   6 +-
 arch/powerpc/include/asm/asm-prototypes.h |   3 +-
 arch/powerpc/include/asm/vdso_datapage.h  |   6 +-
 arch/powerpc/include/uapi/asm/msgbuf.h    |   6 +-
 arch/powerpc/include/uapi/asm/sembuf.h    |   4 +-
 arch/powerpc/include/uapi/asm/shmbuf.h    |   6 +-
 arch/powerpc/include/uapi/asm/stat.h      |   2 +-
 arch/powerpc/kernel/asm-offsets.c         |  18 ++-
 arch/powerpc/kernel/syscalls.c            |   4 +-
 arch/powerpc/kernel/time.c                |   5 +-
 arch/powerpc/kernel/vdso32/gettimeofday.S |   6 +-
 arch/powerpc/kernel/vdso64/gettimeofday.S |   8 +-
 arch/sparc/include/uapi/asm/msgbuf.h      |   6 +-
 arch/sparc/include/uapi/asm/sembuf.h      |   4 +-
 arch/sparc/include/uapi/asm/shmbuf.h      |   6 +-
 arch/sparc/include/uapi/asm/stat.h        |  24 ++--
 arch/sparc/vdso/vclock_gettime.c          |  36 +++---
 arch/x86/entry/vdso/vclock_gettime.c      |   6 +-
 arch/x86/entry/vsyscall/vsyscall_64.c     |   4 +-
 arch/x86/include/uapi/asm/msgbuf.h        |   6 +-
 arch/x86/include/uapi/asm/sembuf.h        |   4 +-
 arch/x86/include/uapi/asm/shmbuf.h        |   6 +-
 arch/x86/um/vdso/um_vdso.c                |  12 +-
 fs/aio.c                                  |   2 +-
 fs/binfmt_elf.c                           |  12 +-
 fs/binfmt_elf_fdpic.c                     |  12 +-
 fs/compat_binfmt_elf.c                    |   4 +-
 fs/select.c                               |  10 +-
 fs/timerfd.c                              |  14 +--
 fs/utimes.c                               |   8 +-
 include/linux/compat.h                    |  19 +--
 include/linux/skbuff.h                    |   7 +-
 include/linux/syscalls.h                  |  16 +--
 include/linux/time.h                      |   9 +-
 include/linux/time32.h                    |   2 +-
 include/linux/types.h                     |   2 +-
 include/trace/events/timer.h              |  16 +--
 include/uapi/asm-generic/msgbuf.h         |  12 +-
 include/uapi/asm-generic/posix_types.h    |   1 +
 include/uapi/asm-generic/sembuf.h         |   7 +-
 include/uapi/asm-generic/shmbuf.h         |  12 +-
 include/uapi/linux/cyclades.h             |   6 +-
 include/uapi/linux/elfcore.h              |   8 +-
 include/uapi/linux/errqueue.h             |   7 ++
 include/uapi/linux/msg.h                  |   6 +-
 include/uapi/linux/ppp_defs.h             |   4 +-
 include/uapi/linux/resource.h             |   4 +-
 include/uapi/linux/sem.h                  |   4 +-
 include/uapi/linux/shm.h                  |   6 +-
 include/uapi/linux/time.h                 |   6 +-
 include/uapi/linux/time_types.h           |   5 +
 include/uapi/linux/utime.h                |   4 +-
 ipc/syscall.c                             |   2 +-
 kernel/compat.c                           |  24 ----
 kernel/power/power.h                      |   2 +-
 kernel/sys.c                              |   4 +-
 kernel/sys_ni.c                           |  23 ++++
 kernel/time/hrtimer.c                     |   2 +-
 kernel/time/itimer.c                      | 189 +++++++++++++++++++++---------
 kernel/time/time.c                        |  32 +++--
 lib/vdso/gettimeofday.c                   |   4 +-
 net/compat.c                              |   2 +-
 net/core/scm.c                            |   6 +-
 net/ipv4/tcp.c                            |  28 +++--
 net/socket.c                              |   4 +-
 security/selinux/hooks.c                  |  10 +-
 79 files changed, 472 insertions(+), 468 deletions(-)
