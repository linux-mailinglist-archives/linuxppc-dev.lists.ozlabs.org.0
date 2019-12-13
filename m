Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3848D11E474
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 14:22:23 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZBCv4kRRzDr6v
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 00:22:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZB6P6Ym9zDrCN
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 00:17:31 +1100 (AEDT)
Received: from mail-qv1-f44.google.com ([209.85.219.44]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1M5Qhx-1igZdL0Xtl-001P2P for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec
 2019 14:17:26 +0100
Received: by mail-qv1-f44.google.com with SMTP id p2so789298qvo.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 05:17:25 -0800 (PST)
X-Gm-Message-State: APjAAAULEWx+zYXO+jHyG9nt+l4v0keHHegRx+nwIu30ck4vYU6zykrG
 CUv7dDPk9o/DaIahQmDDT7ywrVrAXtGwpPEf+Ww=
X-Google-Smtp-Source: APXvYqzFwFcYikxJ28kBoN0UCn5sg1VzXwQF4a8L8BwcmPohvWspCPfGhWeuKWhSDV04mg28v6cq323o0FLTlhBpJL4=
X-Received: by 2002:ad4:4021:: with SMTP id q1mr12702039qvp.211.1576243044500; 
 Fri, 13 Dec 2019 05:17:24 -0800 (PST)
MIME-Version: 1.0
References: <87blslei5o.fsf@mpe.ellerman.id.au>
 <20191206131650.GM2827@hirez.programming.kicks-ass.net>
 <875zimp0ay.fsf@mpe.ellerman.id.au>
 <20191212080105.GV2844@hirez.programming.kicks-ass.net>
 <20191212100756.GA11317@willie-the-truck>
 <20191212104610.GW2827@hirez.programming.kicks-ass.net>
 <CAHk-=wjUBsH0BYDBv=q36482G-U7c=9bC89L_BViSciTfb8fhA@mail.gmail.com>
 <20191212180634.GA19020@willie-the-truck>
 <CAHk-=whRxB0adkz+V7SQC8Ac_rr_YfaPY8M2mFDfJP2FFBNz8A@mail.gmail.com>
 <20191212193401.GB19020@willie-the-truck>
 <CAHk-=wiMuHmWzQ7-CRQB6o+SHtA-u-Rp6VZwPcqDbjAaug80rQ@mail.gmail.com>
In-Reply-To: <CAHk-=wiMuHmWzQ7-CRQB6o+SHtA-u-Rp6VZwPcqDbjAaug80rQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 Dec 2019 14:17:08 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2QYpT_u3D7c_w+hoyeO-Stkj5MWyU_LgGOqnMtKLEudg@mail.gmail.com>
Message-ID: <CAK8P3a2QYpT_u3D7c_w+hoyeO-Stkj5MWyU_LgGOqnMtKLEudg@mail.gmail.com>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:d0lF46rXOr8ET59Wh14KT5WJV6vq3eAKKwrkq/BB/TOcZLxIWPU
 K91d7y8SvULBlhxiT2PnB6ULcPan1dVFl+NUUeCTTTKgG2ngWGxllXkn+iCZnXOZVKWGNht
 DR5SRMdQPg4QbZaupuPyzFjer1VU/YA4Wjo+MnQzUQd4EpHWj1sxBSN6Px9VhsskhGadP2M
 TxI8BSqUAjrJCv+bzkNaw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:fPbOIvT4g5I=:E8TRONiKlUJopFNvX12juV
 u5ceSnO8X/X36DdrJsL6DfWNzaOK5v2hMoY2+Mqm85i34zakqLdJmI8aPzzcdgx0BvDt4UEzi
 AvvFWjQ2M3kTl4RB2ZIbdPYX97zWeKODwRNmpyVyWt8u3Xlptpn+TrLWUzzUJMeX4Q+7JoFO7
 Amb/Z94lrVagwpCFpzV88QhevRKmjoxBP5GXJcX4jvTxEuLw0B03tfDj+2Azpb5TV2CxmlXns
 j5gvPuxopWGzMhvLhR8CYgHtDqhgB7NaiqLzIjeLPBhPG27YHYpvk4lNW9HZ/XVVI2Cz+qKMu
 hcoowXttVSQD2+2P/XY1JnMMJdKtYv6QSgSjFJ/r55QWjYkh9vOwT2BX88Pt4eq9HQbJcVd86
 LYz+mU1huP0MA+paszIMZ44YWnd0oDKZz2nQlBbCPKsct3v+KrEVzqUp73LEEC6vwUdty/JwV
 4uuTxqgrRoYOaKMtD4XDx+HTOSnXxfbpYmd8J1zdIi8mFkdujdOBlX3VpU0PXxsNQes9JgyTC
 6NILotQ3uH2xdRWW9xttlupa4BFwGY3kv0QOvU9DW78sw+Sq9mGsbeUYmSnUYyrmZdID0r/Jo
 0RIwmw0JUBNKgiQa/KrrAwc1f7Y/kgd2kwIRID4PYaw7QJJYEMBxgQ0aup7HA6i9kayPNdFyg
 MqkGhLzakNI+smLa7eoSgbAG9WMO0Y1Dg4/X2Le0vLr6veNQv76MhCUIwjxOtTIfKB8/svEKM
 7ds23lNw/l3ThCusZEzPyh4syq1ElhCQTgePTqE2d/EmIyT0AOPRS0AHeEmi/7SB0hMH4SXOZ
 6Mx5nG8n2ZSCL8NMDEpj0ICNcbO8uEoQPhMjOumD0r61kz0lJ7zwsplvk5gf431s3AKJfhHHE
 JNYuC3XYLfxckvAqtjPA==
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
Cc: linux-arch <linux-arch@vger.kernel.org>, Will Deacon <will@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 12, 2019 at 9:50 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
> On Thu, Dec 12, 2019 at 11:34 AM Will Deacon <will@kernel.org> wrote:
> > The root of my concern in all of this, and what started me looking at it in
> > the first place, is the interaction with 'typeof()'. Inheriting 'volatile'
> > for a pointer means that local variables in macros declared using typeof()
> > suddenly start generating *hideous* code, particularly when pointless stack
> > spills get stackprotector all excited.
>
> Yeah, removing volatile can be a bit annoying.
>
> For the particular case of the bitops, though, it's not an issue.
> Since you know the type there, you can just cast it.
>
> And if we had the rule that READ_ONCE() was an arithmetic type, you could do
>
>     typeof(0+(*p)) __var;
>
> since you might as well get the integer promotion anyway (on the
> non-volatile result).
>
> But that doesn't work with structures or unions, of course.
>
> I'm not entirely sure we have READ_ONCE() with a struct. I do know we
> have it with 64-bit entities on 32-bit machines, but that's ok with
> the "0+" trick.

I'll have my randconfig builder look for instances, so far I found one,
see below. My feeling is that it would be better to enforce at least
the size being a 1/2/4/8, to avoid cases where someone thinks
the access is atomic, but it falls back on a memcpy.

      Arnd

diff --git a/drivers/xen/time.c b/drivers/xen/time.c
index 0968859c29d0..adb492c0aa34 100644
--- a/drivers/xen/time.c
+++ b/drivers/xen/time.c
@@ -64,7 +64,7 @@ static void xen_get_runstate_snapshot_cpu_delta(
        do {
                state_time = get64(&state->state_entry_time);
                rmb();  /* Hypervisor might update data. */
-               *res = READ_ONCE(*state);
+               memcpy(res, state, sizeof(*res));
                rmb();  /* Hypervisor might update data. */
        } while (get64(&state->state_entry_time) != state_time ||
                 (state_time & XEN_RUNSTATE_UPDATE));
diff --git a/include/linux/compiler.h b/include/linux/compiler.h
index 5e88e7e33abe..f4ae360efdba 100644
--- a/include/linux/compiler.h
+++ b/include/linux/compiler.h
@@ -179,6 +179,8 @@ void ftrace_likely_update(struct
ftrace_likely_data *f, int val,

 #include <uapi/linux/types.h>

+extern void __broken_access_once(void *, const void *, unsigned long);
+
 #define __READ_ONCE_SIZE                                               \
 ({                                                                     \
        switch (size) {                                                 \
@@ -187,9 +189,7 @@ void ftrace_likely_update(struct
ftrace_likely_data *f, int val,
        case 4: *(__u32 *)res = *(volatile __u32 *)p; break;            \
        case 8: *(__u64 *)res = *(volatile __u64 *)p; break;            \
        default:                                                        \
-               barrier();                                              \
-               __builtin_memcpy((void *)res, (const void *)p, size);   \
-               barrier();                                              \
+               __broken_access_once((void *)res, (const void *)p,
size);       \
        }                                                               \
 })

@@ -225,9 +225,7 @@ static __always_inline void
__write_once_size(volatile void *p, void *res, int s
        case 4: *(volatile __u32 *)p = *(__u32 *)res; break;
        case 8: *(volatile __u64 *)p = *(__u64 *)res; break;
        default:
-               barrier();
-               __builtin_memcpy((void *)p, (const void *)res, size);
-               barrier();
+               __broken_access_once((void *)p, (const void *)res, size);
        }
 }
