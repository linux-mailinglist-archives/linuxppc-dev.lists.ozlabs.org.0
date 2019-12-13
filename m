Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 187A211ECF2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2019 22:34:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ZP8H2DmNzDrH8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Dec 2019 08:34:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.130; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ZP6L04MszDrFn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Dec 2019 08:33:12 +1100 (AEDT)
Received: from mail-qv1-f51.google.com ([209.85.219.51]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MEC8L-1iWIBb25sD-00AAsL for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec
 2019 22:33:06 +0100
Received: by mail-qv1-f51.google.com with SMTP id o18so349655qvf.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2019 13:33:05 -0800 (PST)
X-Gm-Message-State: APjAAAXYV3JfH0ZVo8pnb5sJ1e1NXsj22QFWBeo5kohAKt9I03kloxxD
 sS6oUODPbxQf2g3F+PG2yUAmN1g0pmU/Ntq6N3k=
X-Google-Smtp-Source: APXvYqwCzGhbymffr0MJ0HPN+piVHm6ukpyasxZTu0jrENW0TrLwxdmw8hoOi0tCS69BkfRXSZvzHOqSymJ6CdsWGV8=
X-Received: by 2002:a0c:aca2:: with SMTP id m31mr15739114qvc.222.1576272784583; 
 Fri, 13 Dec 2019 13:33:04 -0800 (PST)
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
 <CAK8P3a2QYpT_u3D7c_w+hoyeO-Stkj5MWyU_LgGOqnMtKLEudg@mail.gmail.com>
In-Reply-To: <CAK8P3a2QYpT_u3D7c_w+hoyeO-Stkj5MWyU_LgGOqnMtKLEudg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 13 Dec 2019 22:32:48 +0100
X-Gmail-Original-Message-ID: <CAK8P3a014U76S+t3rKyPghepOT_fYHBExuMC27MoGMNffjczEw@mail.gmail.com>
Message-ID: <CAK8P3a014U76S+t3rKyPghepOT_fYHBExuMC27MoGMNffjczEw@mail.gmail.com>
Subject: Re: READ_ONCE() + STACKPROTECTOR_STRONG == :/ (was Re: [GIT PULL]
 Please pull powerpc/linux.git powerpc-5.5-2 tag (topic/kasan-bitops))
To: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:TGt8SMK++1Eqjof00YdGGjmEJz9TkBzo4vg6b97z5KFfwPrkXSW
 jnDLdvHpJDL/e+l6cIuiDRhtw2/xAySjvEvvlWVXUgDkvrlVDJlPIMfPzNZ4MsHZKU2C1iQ
 dCPIj9r9z9266sF4EtiTjSpOzH9dumvxVAhv9rHGssNqVOQoIYiooQ4Ths6R/HKx0j434gt
 uBf4v5AlZEFEGXGJY7eFQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Ds5O4DOc4hI=:Gg9BM7ra0nDyeKfr/VOkOR
 TM0E2D9QpkQGN+1zR1ONi12Mv69fSDRZ8BzFt2tC9ocUcl3bH3MXGmGObbRTNdzTzpyisJpJU
 fOPEJN3fmSreqz48fcmOmYa5nx2/iFRHqVxgOPhXw/QVh+CcuGHeEnqp9w1da7RJvm4QW85g9
 Ue74XLQGjlH9qowgW4R8LQVDzkImsbb2PfjUM0XMVipHXU697DWmtGAQMuXMzuqR/CWAaatHZ
 YdRe+lOysOdGHsu+PS4HUCzvGKEzbXIDLh/F4ZO4Fdg+mtrYH0iNdhDT17V97wNFRaIUw5nHx
 Shth0I9r9l0pDga6bP6FmqEn/yP9PHHECf5dmDHZ4J9Ha2SDFNyBNpZZ6qvtVizUlM0G2D3dt
 C4KB26XrxBdvMgImsSn13CgvF/Y0roEMhgJfi5w5fTLkMqK8pSB7aeWw9G2rZu8N3FDe5W/Zc
 C/LO3yFeyarFThiM6/Sz7gAgBSc3vBlVlaBbB0rEnATRYhOWEICbqmZW5eK9l1QzF/v1DY9P7
 vMYQKhlgiv/AxhwAobLI6JgKgHeLZPT7GGMiScADoYybb7AK7YoX5f4P0EO/1grgBVaCS0Oba
 IwNvitcxFDd9QaVDI+4ZhCB/5MksEVqrXZ06KYJDnUfbVoPD6hqfh0bHySrLIBzcF/BroGaB3
 haxFH0R02wcvwNzzPLdsaiODaHuiuAPDlzPn4gnWVTgksW7l+a9SZu75cuzEnVca2f5+0KXnD
 B8DJu0v4puapm5slifaHm17paYwmCWmBcyt2Whm4LakFBiJt46tzJhOWtBV1WMgPmQprGOJEP
 T9a6tic7S8dPlSKXLxvUOcc03gnMKxO4hANt8JTNOSe7bkfi4QqAws2GkAJlDKEbeFqmKEqN7
 8Qoe1D1vYWUO7ZI/IBHw==
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

On Fri, Dec 13, 2019 at 2:17 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Thu, Dec 12, 2019 at 9:50 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> I'll have my randconfig builder look for instances, so far I found one,
> see below. My feeling is that it would be better to enforce at least
> the size being a 1/2/4/8, to avoid cases where someone thinks
> the access is atomic, but it falls back on a memcpy.
>
>       Arnd
>
> diff --git a/drivers/xen/time.c b/drivers/xen/time.c
> index 0968859c29d0..adb492c0aa34 100644
> --- a/drivers/xen/time.c
> +++ b/drivers/xen/time.c
> @@ -64,7 +64,7 @@ static void xen_get_runstate_snapshot_cpu_delta(
>         do {
>                 state_time = get64(&state->state_entry_time);
>                 rmb();  /* Hypervisor might update data. */
> -               *res = READ_ONCE(*state);
> +               memcpy(res, state, sizeof(*res));
>                 rmb();  /* Hypervisor might update data. */
>         } while (get64(&state->state_entry_time) != state_time ||
>                  (state_time & XEN_RUNSTATE_UPDATE));


A few hundred randconfig (x86, arm32 and arm64) builds later I
still only found one other instance:

diff --git a/net/xdp/xsk_queue.h b/net/xdp/xsk_queue.h
index eddae4688862..1c1f33447e96 100644
--- a/net/xdp/xsk_queue.h
+++ b/net/xdp/xsk_queue.h
@@ -304,7 +304,9 @@ static inline struct xdp_desc
*xskq_validate_desc(struct xsk_queue *q,
                struct xdp_rxtx_ring *ring = (struct xdp_rxtx_ring *)q->ring;
                unsigned int idx = q->cons_tail & q->ring_mask;

-               *desc = READ_ONCE(ring->desc[idx]);
+               barrier();
+               memcpy(desc, &ring->desc[idx], sizeof(*desc));
+               barrier();
                if (xskq_is_valid_desc(q, desc, umem))
                        return desc;

       Arnd
