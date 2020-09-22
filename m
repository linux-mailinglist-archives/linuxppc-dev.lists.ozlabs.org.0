Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 36AAF273BC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 09:26:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwXsy6DN9zDqbw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 17:26:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.187; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwXqR737gzDqsx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 17:24:01 +1000 (AEST)
Received: from mail-qv1-f42.google.com ([209.85.219.42]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MbAtM-1krUUl3pSC-00bZMS for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep
 2020 09:23:56 +0200
Received: by mail-qv1-f42.google.com with SMTP id j10so8963860qvk.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 00:23:54 -0700 (PDT)
X-Gm-Message-State: AOAM5302oGREmrmbP8eQVbpeCbGgn/JXI1wenbI3iFi6YU0Ty8vAeFZU
 S39+LIDWgqtfTyicroqub18racuqWLfnVNTRQlw=
X-Google-Smtp-Source: ABdhPJx2+lYoTA/KUzOktg9GCEROrxWzhLaiei0nYKlXvAWkeVBXqnjogbknJct+KWfdqdHtsSEC4gKbjbjELvczheY=
X-Received: by 2002:ad4:4594:: with SMTP id x20mr4471122qvu.4.1600759433835;
 Tue, 22 Sep 2020 00:23:53 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a2Mi+1yttyGk4k7HxRVrMtmFqJewouVhynqUL0PJycmog@mail.gmail.com>
 <D0791499-1190-4C3F-A984-0A313ECA81C7@amacapital.net>
 <563138b5-7073-74bc-f0c5-b2bad6277e87@gmail.com>
 <486c92d0-0f2e-bd61-1ab8-302524af5e08@gmail.com>
 <CALCETrW3rwGsgfLNnu_0JAcL5jvrPVTLTWM3JpbB5P9Hye6Fdw@mail.gmail.com>
 <d5c6736a-2cb4-4e22-78da-a667bda5c05a@gmail.com>
 <CALCETrUEC81va8-fuUXG1uA5rbKxnKDYsDOXC70_HtKD4LAeAg@mail.gmail.com>
 <e0a1b4d1-ff47-18d1-d535-c62812cb3105@gmail.com>
In-Reply-To: <e0a1b4d1-ff47-18d1-d535-c62812cb3105@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 22 Sep 2020 09:23:37 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2-6JNS38EbZcLrk=cTT526oP=Rf0aoqWNSJ-k4XTYehQ@mail.gmail.com>
Message-ID: <CAK8P3a2-6JNS38EbZcLrk=cTT526oP=Rf0aoqWNSJ-k4XTYehQ@mail.gmail.com>
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
To: Pavel Begunkov <asml.silence@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:VF8ouRdGC7vuG2N+cACBmC19pklncoEF1JOgNnHf/pQGqSRyKbc
 SB3iHpVvX8IeJNxKNBEGkXkLyJHH56iooq/9UwhkeQicPedR9fNvoEBCYl28/6O/cmWTI5/
 E8Rzd/4HBeHkppWRgICyMTLoUPovVM0JnoYSLTbyQFPzwl2zOo5KMW2BzfUpIIvi7E7RitI
 ridOHKbUqR+UY0MR7MonQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:biHs+uBDJ6E=:h8G1PvxaBM9GQbx4SkPXxs
 yOxWB+Pp2CPFIq92A7JHJqVPLlzYBDZaae+TloIqYcaDQpil8/n6Vrt/3gtgDI7YSZEldfZKd
 McNqQm0rkGqcoYipy3RlFlSIEoWOKIiYIbazHL0EuicFof55C+naNa4VgB0jY69pPCnGA1Zl8
 izQjzA/Rtlf06s2kgm6IzdBOYswSdHuULP9BvrF1uBpzzsmy3FtFAMHmfRQep95OPj8Rv17+6
 4ZMSaLqurUA5IYGNKFEfs4N2fTtBWUWJ+2Jmcu1uFqDnrAPrphW4XyKA+uDttAEAl4gkBHb41
 L3/p9Dj2zsGeLtNpVQJ6QgM4JvNPW6iXekG8cKiaKg3r+Jxnb/evsqIc9Q4S1BPlX4XTV7fsu
 HT771TWYMgRHjUrRJLozPa/i5eFZGSL3gGw7WUouNYkbTunGN+F2jSEAkkdcsNjdoJTnaFi21
 ErjZXecsjvNrwczaxb3mqkErmVkBNQVwcKuO/tRVefqaWQ8YmWFlif+mqdRHJPOUXEa0rVH9X
 YbyKNk30EnM+m7/Ljcaax7lOQ0wUIfkz7lktRbUproQSA3DADPzp7XN2MNhwxgX2XW8aaLuFj
 uKPlrv7Oj/rv3Y9HapK2sUwSBQJJLehhrZKrrWqvSnftMoQsYUALPnaaOyfrNtog3IidWwCxH
 zOtAfuEQybim5o04IWjjh7HNdEg9ewU9XGARTqzhmOHCM6IlCm8KwTVUHcTcdYh0mLBVTCNwC
 ej/SOpFnWHoXUWwXDJehsv+bgtfgsySZ6GTNLvvOrOV9eIvR9ac98W/bbzXTR5qOA9Le1BNe5
 wmJ6UeoDe1In6fchnFjUIWupsi+UqrkuxjWbP3zUrT3ZX7qTPBxP8h4WnC5F0UMPCYwpoq5
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, io-uring@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 22, 2020 at 8:32 AM Pavel Begunkov <asml.silence@gmail.com> wrote:
> On 22/09/2020 03:58, Andy Lutomirski wrote:
> > On Mon, Sep 21, 2020 at 5:24 PM Pavel Begunkov <asml.silence@gmail.com> wrote:
> > I may be looking at a different kernel than you, but aren't you
> > preventing creating an io_uring regardless of whether SQPOLL is
> > requested?
>
> I diffed a not-saved file on a sleepy head, thanks for noticing.
> As you said, there should be an SQPOLL check.
>
> ...
> if (ctx->compat && (p->flags & IORING_SETUP_SQPOLL))
>         goto err;

Wouldn't that mean that now 32-bit containers behave differently
between compat and native execution?

I think if you want to prevent 32-bit applications from using SQPOLL,
it needs to be done the same way on both to be consistent:

   if ((!IS_ENABLED(CONFIG_64BIT) || ctx->compat) &&
        (p->flags & IORING_SETUP_SQPOLL))
            goto err;

I don't really see how taking away SQPOLL from 32-bit tasks is
any better than just preventing access to the known-broken files
as Al suggested, or adding the hack to make it work as in
Christoph's original patch.

Can we expect all existing and future user space to have a sane
fallback when IORING_SETUP_SQPOLL fails?

      Arnd
