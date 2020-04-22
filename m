Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5A41B377E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 08:22:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 496Vj63TzXzDqxV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Apr 2020 16:22:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pN77i6lZ; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 496VgW5jnCzDql9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Apr 2020 16:21:09 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id ay1so548619plb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Apr 2020 23:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=DDzVWBAakB7pHADYPx9zmts8A8Rz3T/f/hz2xmvu+fc=;
 b=pN77i6lZqCvj5IXnXLd1pSEKdnbqy6rrKNrEB8ppSFh2852tRlBodSI8YzxN4hHL54
 VYMaaEFwhqnNAkB+m+sr8ldFF8UhLnvvOvyiLmKHwstSBTWZuQ8yweAnBdd18NlCpJ9P
 I50odX1AVRrnMsm2xU3urvPK4H+frHfNwfUcH/Pb4WzF37317rqutwQJe284VMmLRZzR
 fKnC9IHKopdm9YXQvAMA5MgBfaa4wfRyH6yQZ+SAkM8ltKhHu4IRN4VS/1VyQYvpwogN
 rw3klj5VybjaNA82hVhiP91D1bCX0m4Z+M++kuC8KwFVmw49jtow682GzvzriuWTCMIb
 aL4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=DDzVWBAakB7pHADYPx9zmts8A8Rz3T/f/hz2xmvu+fc=;
 b=Kn1/GorWseRDZP1/HySjlf4LfVLT3CBMQDEuDgL/TwJ0+J7cVm3JBq42x0Vf/hytCH
 oH9GJoEiqYqtZz6y6FZxrMoo/i/DJbIIQ6jt4dxc55Yfd4EXZHxfFbD+joQA3l6aWjkl
 9tVWZJMEjLHCWYtmf14LyWMFozqe/vL/+llXAr2yKV8yeFMT9RxfGVHlCRuu+ZNe2jUs
 47NhH1xK6JG+9NwlQywkJSnB5XMPKKUZax9P+OzFQcquDjkOvPvfIjsB4VNJVtIz4NmL
 eVM9ZLSwvJLmcIvO/29ZI5s/WnIViFE2svx2FUaNfwIqmz2XRtn6J1pWBiglQzJM4I1K
 UTow==
X-Gm-Message-State: AGi0PuZQvr6UhugduArmd5Waoe+WOgNIxmBFHgyJsK/ZKQS67W8J7tYd
 rFwej2+4mGustoDTC707AfI=
X-Google-Smtp-Source: APiQypJ8qq1ZaCCyMqYWNlu3hSzxD45C0h7ZFmJNJ+MkCzAuMNXqNoIoxiRjw139kxs9EQcTL+SoKQ==
X-Received: by 2002:a17:902:8d91:: with SMTP id
 v17mr23804402plo.53.1587536465879; 
 Tue, 21 Apr 2020 23:21:05 -0700 (PDT)
Received: from localhost ([203.185.249.170])
 by smtp.gmail.com with ESMTPSA id f74sm16244912pje.3.2020.04.21.23.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2020 23:21:05 -0700 (PDT)
Date: Wed, 22 Apr 2020 16:18:36 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: Rich Felker <dalias@libc.org>
References: <20200416153756.GU11469@brightrain.aerifal.cx>
 <4b2a7a56-dd2b-1863-50e5-2f4cdbeef47c@linaro.org>
 <20200416175932.GZ11469@brightrain.aerifal.cx>
 <4f824a37-e660-8912-25aa-fde88d4b79f3@linaro.org>
 <20200416183151.GA11469@brightrain.aerifal.cx>
 <1587344003.daumxvs1kh.astroid@bobo.none>
 <20200420013412.GZ11469@brightrain.aerifal.cx>
 <1587348538.l1ioqml73m.astroid@bobo.none>
 <20200420040926.GA11469@brightrain.aerifal.cx>
 <1587356128.aslvdnmtbw.astroid@bobo.none>
 <20200420172715.GC11469@brightrain.aerifal.cx>
In-Reply-To: <20200420172715.GC11469@brightrain.aerifal.cx>
MIME-Version: 1.0
Message-Id: <1587531042.1qvc287tsc.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, musl@lists.openwall.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Rich Felker's message of April 21, 2020 3:27 am:
> On Mon, Apr 20, 2020 at 02:31:58PM +1000, Nicholas Piggin wrote:
>> Excerpts from Rich Felker's message of April 20, 2020 2:09 pm:
>> > On Mon, Apr 20, 2020 at 12:32:21PM +1000, Nicholas Piggin wrote:
>> >> Excerpts from Rich Felker's message of April 20, 2020 11:34 am:
>> >> > On Mon, Apr 20, 2020 at 11:10:25AM +1000, Nicholas Piggin wrote:
>> >> >> Excerpts from Rich Felker's message of April 17, 2020 4:31 am:
>> >> >> > Note that because lr is clobbered we need at least once normally
>> >> >> > call-clobbered register that's not syscall clobbered to save lr =
in.
>> >> >> > Otherwise stack frame setup is required to spill it.
>> >> >>=20
>> >> >> The kernel would like to use r9-r12 for itself. We could do with f=
ewer=20
>> >> >> registers, but we have some delay establishing the stack (depends =
on a
>> >> >> load which depends on a mfspr), and entry code tends to be quite s=
tore
>> >> >> heavy whereas on the caller side you have r1 set up (modulo stack=20
>> >> >> updates), and the system call is a long delay during which time th=
e=20
>> >> >> store queue has significant time to drain.
>> >> >>=20
>> >> >> My feeling is it would be better for kernel to have these scratch=20
>> >> >> registers.
>> >> >=20
>> >> > If your new kernel syscall mechanism requires the caller to make a
>> >> > whole stack frame it otherwise doesn't need and spill registers to =
it,
>> >> > it becomes a lot less attractive. Some of those 90 cycles saved are
>> >> > immediately lost on the userspace side, plus you either waste icach=
e
>> >> > at the call point or require the syscall to go through a
>> >> > userspace-side helper function that performs the spill and restore.
>> >>=20
>> >> You would be surprised how few cycles that takes on a high end CPU. S=
ome=20
>> >> might be a couple of %. I am one for counting cycles mind you, I'm no=
t=20
>> >> being flippant about it. If we can come up with something faster I'd =
be=20
>> >> up for it.
>> >=20
>> > If the cycle count is trivial then just do it on the kernel side.
>>=20
>> The cycle count for user is, because you have r1 ready. Kernel does not=20
>> have its stack ready, it has to mfspr rX ; ld rY,N(rX); to get stack to=20
>> save into.
>>=20
>> Which is also wasted work for a userspace.
>>=20
>> Now that I think about it, no stack frame is even required! lr is saved=20
>> into the caller's stack when its clobbered with an asm, just as when=20
>> it's used for a function call.
>=20
> No. If there is a non-clobbered register, lr can be moved to the
> non-clobbered register rather than saved to the stack. However it
> looks like (1) gcc doesn't take advantage of that possibility, but (2)
> the caller already arranged for there to be space on the stack to save
> lr, so the cost is only one store and one load, not any stack
> adjustment or other frame setup. So it's probably not a really big
> deal. However, just adding "lr" clobber to existing syscall in musl
> increased the size of a simple syscall function (getuid) from 20 bytes
> to 36 bytes.

Yeah I had a bit of a play around with musl (which is very nice code I
must say). The powerpc64 syscall asm is missing ctr clobber by the way. =20
Fortunately adding it doesn't change code generation for me, but it=20
should be fixed. glibc had the same bug at one point I think (probably=20
due to syscall ABI documentation not existing -- something now lives in=20
linux/Documentation/powerpc/syscall64-abi.rst).

Yes lr needs to be saved, I didn't see any new requirement for stack
frames, and it was often already saved, but it does hurt the small=20
wrapper functions.

I did look at entirely replacing sc with scv though, just as an=20
experiment. One day you might make sc optional! Text size impoves by=20
about 3kB with the proposed ABI.

Mostly seems to be the bns+ ; neg sequence. __syscall1/2/3 get
out-of-lined by the compiler in a lot of cases. Linux's bloat-o-meter=20
says:

add/remove: 0/5 grow/shrink: 24/260 up/down: 220/-3428 (-3208)
Function                                     old     new   delta
fcntl                                        400     424     +24
popen                                        600     620     +20
times                                         32      40      +8
[...]
alloc_rev                                    816     784     -32
alloc_fwd                                    812     780     -32
__syscall1.constprop                          32       -     -32
__fdopen                                     504     472     -32
__expand_heap                                628     592     -36
__syscall2                                    40       -     -40
__syscall3                                    44       -     -44
fchmodat                                     372     324     -48
__wake.constprop                             408     360     -48
child                                       1116    1064     -52
checker                                      220     156     -64
__bin_chunk                                 1576    1512     -64
malloc                                      1940    1860     -80
__syscall3.constprop                          96       -     -96
__syscall1                                   108       -    -108
Total: Before=3D613379, After=3D610171, chg -0.52%

Now if we go a step further we could preserve r0,r4-r8. That gives the=20
kernel r9-r12 as scratch while leaving userspace with some spare=20
volatile GPRs except in the uncommon syscall6 case.

  static inline long __syscall0(long n)
  {
      register long r0 __asm__("r0") =3D n;
      register long r3 __asm__("r3");
      __asm__ __volatile__("scv 0"
      : "=3Dr"(r3)
      : "r"(r0)
      : "memory", "cr0", "cr1", "cr5", "cr6", "cr7", "lr", "ctr", "r9", "r1=
0", "r11", "r12"
      return r3;
  }

That saves another ~400 bytes, reducing some of the register shuffling=20
for futex loops etc:

[...]
__pthread_cond_timedwait                     964     944     -20
__expand_heap                                592     572     -20
socketpair                                   292     268     -24
__wake.constprop                             360     336     -24
malloc                                      1860    1828     -32
__bin_chunk                                 1512    1472     -40
fcntl                                        424     376     -48
Total: Before=3D610171, After=3D609723, chg -0.07%

As you say, the compiler doesn't do a good job of saving lr in a spare=20
GPR unfortunately. Saving it ourselves to eliminate the lr clobber is no=20
good because it's almost always already saved. At least having=20
non-clobbered volatile GPRs could let a future smarter compiler take=20
advantage.

If we go further and try to preserve r3 as well by putting the return=20
value in r9 or r0, we go backwards about 300 bytes. It's good for the=20
lock loops and complex functions, but hurts a lot of simpler functions=20
that have to add 'mr r3,r9' etc. =20

Most of the time there are saved non-volatile GPRs around anyway though,=20
so not sure which way to go on this. Text size savings can't be ignored
and it's pretty easy for the kernel to do (we already save r3-r8 and
zero them on exit, so we could load them instead from cache line that's
should be hot).

So I may be inclined to go this way, even if we won't see benefit now.

Thanks,
Nick
