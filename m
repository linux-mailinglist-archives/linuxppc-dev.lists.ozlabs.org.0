Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2969212E5B7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2020 12:32:06 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47pQqR1Tb2zDqB0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jan 2020 22:32:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.13; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47pQmg5FnwzDq99
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jan 2020 22:29:37 +1100 (AEDT)
Received: from mail-qv1-f41.google.com ([209.85.219.41]) by
 mrelayeu.kundenserver.de (mreue108 [212.227.15.145]) with ESMTPSA (Nemesis)
 id 1M8QJq-1irMNe1zk0-004Ozd for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan
 2020 12:29:30 +0100
Received: by mail-qv1-f41.google.com with SMTP id l14so14872544qvu.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2020 03:29:29 -0800 (PST)
X-Gm-Message-State: APjAAAXY4RMgoTkyLBiO30iAQEp3beZ8K3WGiH7savuIpgf+IijRjw5v
 GHLYxO1gg6/4kdGA5+KnmMUwNcNgVv5WCbsTh7k=
X-Google-Smtp-Source: APXvYqzptO5odenMl+S0N7s3GQhlwCDgPJBBw4XLujkDNgUOvvmeI6k+bBQkXgHWdkBmH6M+qYLFWJ1uMC5oWigZUtc=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr63056221qvg.197.1577964568705; 
 Thu, 02 Jan 2020 03:29:28 -0800 (PST)
MIME-Version: 1.0
References: <cover.1577111363.git.christophe.leroy@c-s.fr>
 <47701b5fb73cf536db074031db8e6e3fa3695168.1577111365.git.christophe.leroy@c-s.fr>
 <CAK8P3a0QGtjygLJUWX_1-s1vfCzE6UoOzrb+OZWwjaBdh=RpVQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0QGtjygLJUWX_1-s1vfCzE6UoOzrb+OZWwjaBdh=RpVQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 2 Jan 2020 12:29:12 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1gHvW2XEMDSHCcdOQ8NSs3iHk9GpujwkWZnnZ0dnw96w@mail.gmail.com>
Message-ID: <CAK8P3a1gHvW2XEMDSHCcdOQ8NSs3iHk9GpujwkWZnnZ0dnw96w@mail.gmail.com>
Subject: Re: [RFC PATCH v2 01/10] lib: vdso: ensure all arches have 32bit
 fallback
To: Christophe Leroy <christophe.leroy@c-s.fr>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:RRCSu8LaEPC5fIu/JjFLQsxBjGqv7dwDQfyqVTAcZGsGqse7Nu7
 UjisbR2ud3sWb/J0A3G1LnnQ8lONe5KwIGafb0T0RFryx4LoQvA19STScC/Jaxwxo8fYDsJ
 HMtjbjv6WM6dWuAw3RTMRjWkr61rdbSHqBvj1anV3ymPfJo3DWXCMkF4Hi2C6SeaLk/QBsw
 hl8c9BNSGF7Zj63eLL5Eg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:flXPmYDafLA=:vGmrKevn7YiqpeaGBiod7b
 7KrL0IH20lj7l5UrRWb37enJeT4KKizOW9vJ8ns/vZAvUmBnWqxj0/QGWQo308Zl+smGY9A+T
 TW3s1NSTzwAVKfMSyoB/QOwIqq/oXjx9fYULxCJ+ExS9Cm8wLOAsGw1gkjMnYp+pGUhMuJuXW
 8UJ9pkyzukJq2sfEzjzrTGeqOS+BV/gKDO2YYC3qePuKGEYDIwHP5yYeTSKunjXSCsT1mrp7p
 hnFCPJG3D0iQXlATw9Fe2BET7naLV++r0pQO85hCI4fZBg54QDvHKqxB5fKCocc+ASgy1bTQy
 DgjNgzeP7SQGCaMipJfQ8VgLch/tsIWqxC5+/yMnIlf7v64SPp6v+IqX6gZ7RX43kzGpBuQ3u
 sP6sQYjTz218r/muftwUWAJSBW77/t9POa53TyJu41GwNq/EpkRy7nQxyxQrAUoh04+94IoEB
 wa5nFnVxxTSLR91ciEwmAPxxXDcbfODtRciO7JzBDAOYbYcBu22VfTFFGccMAGX+1KBpQdH04
 aF0YNOd8VpONFtt6+BuXgBlh7EqfR2/qORNCq3zK9hHjk7zyv/W9Z58YyhF3RB0BazWmWTADG
 PRWbTwTBKyHZIpKgKDCaiFytfQNV2oJ9GOVte4CuYM8CQJ1XR4lNoYwmuxvT+7BKFSmHxfe1e
 AUNZdBq2kqtcWU0raOyw+fEy80LmiTaq63hPBxVcGV5vuj8ApR+fGHRV7SDoiMhXVC+ou0apJ
 9vDZCJYu0jhHnDy3LkD90Xk+YE5Zaz10iosr0RQJ9RrqLqweKyIfblTDYRVUEzEIqj1OggVmo
 Dp8R+K7cZzeyqKb4x/8d8YI7EemxcxDln5j+Cw/i86BuZYtbtROxnnwrexU3jcjPqRFCvW7DW
 ZvBT05lER3uqjcF8kh/A==
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
Cc: the arch/x86 maintainers <x86@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 30, 2019 at 1:27 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Mon, Dec 23, 2019 at 3:31 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > +static __always_inline
> > +long clock_getres32_fallback(clockid_t _clkid, struct old_timespec32 *_ts)
> > +{
> > +       struct __kernel_timespec ts;
> > +       int ret = clock_getres_fallback(clock, &ts);
> > +
> > +       if (likely(!ret && _ts)) {
> > +               _ts->tv_sec = ts.tv_sec;
> > +               _ts->tv_nsec = ts.tv_nsec;
> > +       }
> > +       return ret;
> > +}
>
> Please change these to call __NR_clock_gettime and __NR_clock_getres_time
> instead of __NR_clock_gettime64/__NR_clock_getres_time64 for multiple reasons.
>
> - When doing migration between containers, the vdso may get copied into
>   an application running on a kernel that does not support the time64
>   variants, and then the fallback fails.
>
> - When CONFIG_COMPAT_32BIT_TIME is disabled, the time32 syscalls
>   return -ENOSYS, and the vdso version should have the exact same behavior
>   to avoid surprises. In particular an application that checks clock_gettime()
>   to see if the time32 are in part of the kernel would get an incorrect result
>   here.
>
> arch/arm64/include/asm/vdso/compat_gettimeofday.h already does this,
> I think you can just copy the implementation or find a way to share it.

There was a related discussion on this after a vdso regression on mips,
and I suggested to drop the time32 functions completely from the
vdso when CONFIG_COMPAT_32BIT_TIME is disabled, such as

diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S
b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 00c025ba4a92..605f259fa24c 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -145,10 +145,12 @@ VERSION

                __kernel_get_syscall_map;
 #ifndef CONFIG_PPC_BOOK3S_601
+#ifdef CONFIG_COMPAT_32BIT_TIME
                __kernel_gettimeofday;
                __kernel_clock_gettime;
                __kernel_clock_getres;
                __kernel_time;
+#endif
                __kernel_get_tbfreq;
 #endif
                __kernel_sync_dicache;

Any opinions on this? If everyone agrees with that approach, I can
send a cross-architecture patch to do this everywhere. It's probably
best though if Christophe adds that to his series as it touches a lot
of the same files and I would prefer to avoid conflicting changes.

       Arnd
