Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EACE232E5B4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 11:06:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsNgd035bz3dJm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 21:06:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.131; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsNgH00Lmz30J6
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 21:06:33 +1100 (AEDT)
Received: from mail-oi1-f173.google.com ([209.85.167.173]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1M8hlZ-1lMoJm2eAL-004mmi for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar
 2021 11:06:27 +0100
Received: by mail-oi1-f173.google.com with SMTP id x78so1940804oix.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 02:06:27 -0800 (PST)
X-Gm-Message-State: AOAM532gNeceY2NafdoSUki866/Hxi6d9Bf4l60hnE/hj7WIDFJ9uaZC
 1McLXhl7jexUN7+D7GoK64FPsMHAFQlUKmL0Q7Y=
X-Google-Smtp-Source: ABdhPJwzyOO7oekaLxVCuYpCBrhMK4PzMy38JZ7xjbD74JT6jclKDiqZP1kKYyYJiRiPAwfQ+NkcFWiabrQ66QAV4CE=
X-Received: by 2002:a05:6808:3d9:: with SMTP id
 o25mr6442482oie.4.1614938786377; 
 Fri, 05 Mar 2021 02:06:26 -0800 (PST)
MIME-Version: 1.0
References: <f08ef2b6f339ba19987cfef4307a4dd26b2faf97.1614933479.git.christophe.leroy@csgroup.eu>
In-Reply-To: <f08ef2b6f339ba19987cfef4307a4dd26b2faf97.1614933479.git.christophe.leroy@csgroup.eu>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 5 Mar 2021 11:06:09 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2b+u+8smkKWB-V2Non+nnZmNG4dNi6cGpM8weYuY5j6A@mail.gmail.com>
Message-ID: <CAK8P3a2b+u+8smkKWB-V2Non+nnZmNG4dNi6cGpM8weYuY5j6A@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc/32: remove bogus ppc_select syscall
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:ECmvxo4EZF2C6wqu1qXSTSQqjhrKyzy+Xr8knTSu0WzuUMFPV9f
 qf+PcF/Y4j5WLXDnukZxcPaLl3qq7p+rX1bDJ80nrgxjudR/FEJM4KL2m/uRpEFgQ72eTfh
 8j41ifAKlPvQie0BAJYC7b3cJn60xF8qMlgtPWCUwcS9uhsYm0rOIirO4b2Y1PwvjiueCQQ
 0Aq//RHB7LBf/SHwpVBig==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UMorT1T0Z2Y=:njb46D23dvb0DoI/QokGXP
 7tWV2PllqDqSO6BM0JP1dmwEzE3W7L8u5LhZRFaxyCuYHsq46HS2VbwYorR3qiI4FQEmPPTWr
 SOH55OXn0pt0hnnFYiCSSEYt4ZTv7u3IiEd8FdHe3KGXx3djEDAXkSNfVV5acrPcA8XUQ+nE6
 909H5NCbeoSFy7URFQzk2Jt4D5ge0/lR7ib0cM0u5foHDA8Lxo5Z6+vlhBt1N/WLYVRFIIk6j
 Z0BvRF5y2VpC0frH55ZmyMb7WhBfVRXeSJowX7xoZOoUGwfzkvtXv/P4BUlaXMhBsSqbQ5APR
 8rmcqC5ftm8CgHvbM4QaYCAS1Jrj3Zi9XJuVkeRe+h1/ABX2HcrJaEsIq8JhMonyWG7LC6dsY
 /5Li+C2yFcTOAXCdOG9A9wtstc0Qkbnv3seJuO46h/U1tf918cjmcdENDywU/uz4gZeFV2A46
 /T6u8ucBr6PcZQHmHpBJunmuAR+zwurmwGgQY5jnJPhot2pe321F
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 5, 2021 at 9:40 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The ppc_select function was introduced in linux-2.3.48 in order to support
> code confusing the legacy select() calling convention with the standard one.
> Even 24 years ago, all correctly built code should not have done this and
> could have easily been phased out. Nothing that was compiled later should
> actually try to use the old_select interface, and it would have been broken
> already on all ppc64 kernels with the syscall emulation layer.
>
> This patch brings the 32 bit compat ABI and the native 32 bit ABI for
> powerpc into a consistent state, by removing support for both the
> old_select system call number and the handler for it.

The description still seems wrong, please drop all the nonsense I wrote
back then and explain what is actually going on.

This is what I can see from the linux-history tree:

- The original ppc32 port (linux-1.3.45) had a regular '__NR_select/sys_select'
  syscall at #82 and an unusable '__NR__newselect/sys_panic' syscall at #142,
  while i386 had the indirect '__NR_select/sys_oldselect' syscall at #82
  and the regular '__NR__newselect/sys_select' version at #142. This was
  rather confusing.

- linux-2.1.48 changed both #82 and #142 to the ppc_select() version that
  tries to guess whether the x86 __NR_select/sys_oldselect() behavior or
  the regular __NR__newselect/sys_select() behavior is used.

- linux-2.5.5 added ppc64 support, with a compat version of ppc_select()
  on both #82 and #142 that would either use the __NR__newselect/sys_select
  semantics or panic() when passed an invalud 'n'. The native ppc64
  port started out with just __NR__newselect/sys_select() on #142

- linux-2.5.19 changed ppc64 compat mode to no longer panic(), making
  both #82 and #142 behave like __NR__newselect/sys_select().

- glibc support for ppc32 gets merged during the linux-2.5 days, supporting
  only #142 with the new behavior.

- linux-2.5.41 dropped support for #82 on ppc64 in compat mode but not
  native ppc32.

- linux-2.6.14 merged the two architecture ports but kept the behavior
  unchanged for both.

- linux-2.6.32 changed the native ppc32 #142 __NR__newselect to
  behave the same as compat mode and no longer emulate the
  x86 oldselect, but #82 remained unchanged.

So we have changed behavior multiple times in the past, and the
current state still theoretically allows running non-glibc binaries that
ran on kernels before 2.1.48 that used either the original powerpc
select or the i386 compatible oldselect semantics. Chances are that
those binaries are broken for some other reason now.

          Arnd
