Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C652DEC76
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 01:43:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CyRmD3Cx5zDqbc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Dec 2020 11:43:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.50;
 helo=mo4-p01-ob.smtp.rzone.de; envelope-from=chzigotzky@xenosoft.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=xenosoft.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=xenosoft.de header.i=@xenosoft.de header.a=rsa-sha256
 header.s=strato-dkim-0002 header.b=GuL8Itr1; 
 dkim-atps=neutral
X-Greylist: delayed 175 seconds by postgrey-1.36 at bilbo;
 Sat, 19 Dec 2020 11:41:51 AEDT
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de
 [85.215.255.50])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CyRkl2HMrzDqXC
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Dec 2020 11:41:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1608338506;
 s=strato-dkim-0002; d=xenosoft.de;
 h=In-Reply-To:Date:Message-ID:References:Cc:To:From:Subject:From:
 Subject:Sender;
 bh=2Y7tFTJ4i1K8ORfqa40GM1c1U5XK7dp3ah/oXjYQKNc=;
 b=GuL8Itr1v21w4tv/y4266GbLMi8wQBcbxymuX7h6eVWoyxp4FS/DjFW9HmJtEhzawV
 rhzIdNFUkGWiXQb9P4LZjGT6m8DRpS6LA4bVyD1+Z0uLg14cqP5OnkhlntceRHrQg4Ky
 qMqCjeKEd+CUXMiACmqMiuNPa+t52B+VcH81X4YJdXrOCJFlQao7gr+ZnJJzZwbHhRNw
 JqcTqbvgQEEPZnLq8GoESVoMwdDaO971aSyz4SZN1nQ9WmRjC5/zWhy+ZGHk8jNqj1YT
 CFvTcIehfYjZGVoKGUXKJoYYzCzV5Pu5GMtp+HPZI8nQfzVxJOA+I6NTT5eZnwIXtAX1
 hpPg==
X-RZG-AUTH: ":L2QefEenb+UdBJSdRCXu93KJ1bmSGnhMdmOod1DhGM4l4Hio94KKxRySfLxnHfJ+Dkjp5DdBJSrwuuqxvPgBL+NzCe1/qJuHXg+BWx9zIxDDPQ=="
X-RZG-CLASS-ID: mo00
Received: from Christians-iMac.fritz.box by smtp.strato.de (RZmta 47.9.3 AUTH)
 with ESMTPSA id e00d04wBJ0cf2y5
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
 (Client did not present a certificate);
 Sat, 19 Dec 2020 01:38:41 +0100 (CET)
Subject: Re: GIT kernel with the PowerPC updates 5.11-1 doesn't boot on a FSL
 P5040 board and in a virtual e5500 QEMU machine
From: Christian Zigotzky <chzigotzky@xenosoft.de>
To: Denis Kirjanov <kda@linux-powerpc.org>
References: <a546bc22-1e18-8e71-e973-65cf7095594a@xenosoft.de>
 <CAOJe8K3+j3kGHYhSfjyywXcSQFca0Y370LiAa2uVsW5znUPsAA@mail.gmail.com>
 <ad682b81-60f6-4e13-46f4-39539de2be72@xenosoft.de>
Message-ID: <3589f28f-58c3-d8e4-7462-5d559d477e2e@xenosoft.de>
Date: Sat, 19 Dec 2020 01:38:41 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <ad682b81-60f6-4e13-46f4-39539de2be72@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: de-DE
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
Cc: Darren Stevens <darren@stevens-zone.net>,
 mad skateman <madskateman@gmail.com>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 18 December 2020 at 11:49pm, Christian Zigotzky wrote:
> On 18 December 2020 at 10:25pm, Denis Kirjanov wrote:
> >
> >
> > On Friday, December 18, 2020, Christian Zigotzky 
> <chzigotzky@xenosoft.de> wrote:
> >
> >     Hello,
> >
> >     I compiled the latest Git kernel with the new PowerPC updates 
> 5.11-1 [1] today. Unfortunately this kernel doesn't boot on my FSL 
> P5040 board [2] and in a virtual e5500 QEMU machine [3].
> >
> >     I was able to revert the new PowerPC updates 5.11-1 [4] and 
> after a new compiling, the kernel boots without any problems on my FSL 
> P5040 board.
> >
> >     Please check the new PowerPC updates 5.11-1.
> >
> >
> > Can you bisect the bad commit?
> >
> Hello Denis,
>
> I have bisected [5] and d0e3fc69d00d1f50d22d6b6acfc555ccda80ad1e 
> (powerpc/vdso: Provide __kernel_clock_gettime64() on vdso32) [6] is 
> the first bad commit.
>
> I was able to revert this bad commit and after a new compiling, the 
> kernel boots without any problems.
>
> Thanks,
> Christian
>
> [5] https://forum.hyperion-entertainment.com/viewtopic.php?p=52077#p52077
> [6] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d0e3fc69d00d1f50d22d6b6acfc555ccda80ad1e
>
> >
> >
> >
> >     Thanks,
> >     Christian
> >
> >
> >     [1] 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a5be36b9303ae167468d4f5e1b3c090b9981396
> >     [2] http://wiki.amiga.org/index.php?title=X5000
> >     [3] qemu-system-ppc64 -M ppce500 -cpu e5500 -m 1024 -kernel 
> uImage -drive format=raw,file=MintPPC32-X5000.img,index=0,if=virtio 
> -netdev user,id=mynet0 -device virtio-net-pci,netdev=mynet0 -append 
> "rw root=/dev/vda" -device virtio-vga -usb -device usb-ehci,id=ehci 
> -device usb-tablet -device virtio-keyboard-pci -smp 4 -vnc :1
> >     [4] git revert 8a5be36b9303ae167468d4f5e1b3c090b9981396 -m 1
> >
>
Hello,

I created a patch for reverting the bad commit. I can boot the latest 
Git kernel compiled with this patch on my FSL P5040 board and in a 
virtual e5500 QEMU machine.

------
diff -rupN a/arch/powerpc/include/asm/vdso/gettimeofday.h 
b/arch/powerpc/include/asm/vdso/gettimeofday.h
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h    2020-12-19 
00:01:16.825846606 +0100
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h    2020-12-19 
00:00:38.213374736 +0100
@@ -187,8 +187,6 @@ int __c_kernel_clock_getres(clockid_t cl
  #else
  int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
                   const struct vdso_data *vd);
-int __c_kernel_clock_gettime64(clockid_t clock, struct 
__kernel_timespec *ts,
-                   const struct vdso_data *vd);
  int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 
*res,
                  const struct vdso_data *vd);
  #endif
diff -rupN a/arch/powerpc/kernel/vdso32/gettimeofday.S 
b/arch/powerpc/kernel/vdso32/gettimeofday.S
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S    2020-12-19 
00:01:16.829846652 +0100
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S    2020-12-19 
00:00:37.817369691 +0100
@@ -35,15 +35,6 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
      cvdso_call __c_kernel_clock_gettime
  V_FUNCTION_END(__kernel_clock_gettime)

-/*
- * Exact prototype of clock_gettime64()
- *
- * int __kernel_clock_gettime64(clockid_t clock_id, struct __timespec64 
*ts);
- *
- */
-V_FUNCTION_BEGIN(__kernel_clock_gettime64)
-    cvdso_call __c_kernel_clock_gettime64
-V_FUNCTION_END(__kernel_clock_gettime64)

  /*
   * Exact prototype of clock_getres()
diff -rupN a/arch/powerpc/kernel/vdso32/vdso32.lds.S 
b/arch/powerpc/kernel/vdso32/vdso32.lds.S
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S    2020-12-19 
00:01:16.829846652 +0100
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S    2020-12-19 
00:00:38.209374686 +0100
@@ -118,7 +118,6 @@ VERSION
          __kernel_get_syscall_map;
          __kernel_gettimeofday;
          __kernel_clock_gettime;
-        __kernel_clock_gettime64;
          __kernel_clock_getres;
          __kernel_time;
          __kernel_get_tbfreq;
diff -rupN a/arch/powerpc/kernel/vdso32/vgettimeofday.c 
b/arch/powerpc/kernel/vdso32/vgettimeofday.c
--- a/arch/powerpc/kernel/vdso32/vgettimeofday.c    2020-12-19 
00:01:16.829846652 +0100
+++ b/arch/powerpc/kernel/vdso32/vgettimeofday.c    2020-12-19 
00:00:37.817369691 +0100
@@ -10,12 +10,6 @@ int __c_kernel_clock_gettime(clockid_t c
      return __cvdso_clock_gettime32_data(vd, clock, ts);
  }

-int __c_kernel_clock_gettime64(clockid_t clock, struct 
__kernel_timespec *ts,
-                   const struct vdso_data *vd)
-{
-    return __cvdso_clock_gettime_data(vd, clock, ts);
-}
-
  int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct 
timezone *tz,
                  const struct vdso_data *vd)
  {

------
