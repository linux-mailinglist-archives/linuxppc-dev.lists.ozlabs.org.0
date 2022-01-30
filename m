Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 720B84A3600
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 12:37:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jmq102r6sz3bTT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jan 2022 22:37:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.126.135; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jmq0X6kRZz30DX
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 22:36:44 +1100 (AEDT)
Received: from mail-oi1-f176.google.com ([209.85.167.176]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MiJIk-1mZ14Q10RK-00fOx6 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan
 2022 12:36:40 +0100
Received: by mail-oi1-f176.google.com with SMTP id q8so6884591oiw.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jan 2022 03:36:39 -0800 (PST)
X-Gm-Message-State: AOAM532juseyF2biPbLOj2IgfhkOKPD1j3Ttxh+P0zSGrj5RYiUhZsBr
 0nLzaPXaZrK3t1bNWkR6y7tPpWkRm3Sl4zeFv3E=
X-Google-Smtp-Source: ABdhPJx02/VRPT+lHqxP4cUEJpaptHk8IWYJlq+IlqFxgivaG7fXilNMey5++lAxG71rgAwjbfrXcV/NpMPlqrdhT2Y=
X-Received: by 2002:aca:f03:: with SMTP id 3mr10491465oip.102.1643542598876;
 Sun, 30 Jan 2022 03:36:38 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-7-guoren@kernel.org>
 <CAK8P3a3_kVB78-26sxdsEjb3MMcco6U55tc7siCBFZbJjyH6Sw@mail.gmail.com>
 <CAJF2gTThb8_-T0iOFVZoJrvZqeFvjfWB+AdFyOwtGhN9aG-MQQ@mail.gmail.com>
In-Reply-To: <CAJF2gTThb8_-T0iOFVZoJrvZqeFvjfWB+AdFyOwtGhN9aG-MQQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Sun, 30 Jan 2022 12:36:22 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3A9AMyv7ABRpUgrTo3sg+SogoDSG5cudR87iK+PifU4g@mail.gmail.com>
Message-ID: <CAK8P3a3A9AMyv7ABRpUgrTo3sg+SogoDSG5cudR87iK+PifU4g@mail.gmail.com>
Subject: Re: [PATCH V4 06/17] riscv: compat: Add basic compat date type
 implementation
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:cWXTtDhpZB+hkFRkCkdPdhey+VoKCOcj7Y8Rv2SNnW2MV6wudy/
 8i6aiH0hJDBrwsmSzX8ApKEozW2TlizR/19jjYl+VIRC4NYcmzjGTey72WMjFadwgCYnE3H
 7b5O1PbF+Br1xkna97Pe/x9onlQLpfEFjzHAeHm261l7baN0hpXkryXI6TKQMxk6z9XVuhO
 CUOtvlF1gHhy0L0ABk7CA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:nAiWGni/E00=:x+G8jBKtVVEN4vo08scJpY
 iWg5n4pfH/hzMlflA58mSVHnELLl8FF1tlGF+rmmNoRbTa0gooV5WQI7ry8iUng3VnsKVhNi/
 LKnFGkgFfi8Glard+COaxdRgsaNEn/hMU0SpxjoCMAZB0SDLvrDzfZF0aVHJsFfCAg5aCz2yW
 9MctMCoo5OPmp789NGjZy76Qu4gLrYQO0UaFRPTP4oozjLmDjBiVQsNHBYCRZS+7cGCRd1Da7
 KwN4a09gZrFXLgEdhO+IqhR20/E4wJlf/kcEy/yBg5szl+KEOgNegK+YEcGZH/Dtz2EjBkUB0
 LqyCz7ANq+8O8hsZY7/vWfKMCCfquojw4AUXSh0SDz41icc832cA39POdtrJaxEJe+y8Bz3TE
 LvVWMqjWttsxpSob3YPH5nf3x3T9xHRK32kPnlzDHazfEfqmRW7zxGo+49rRXS1X8xOJs/3Kb
 3nEZR6cXph+RBx48ehlmNQw2jntbs//NEvn0PbSwT2G+MwQoQm6SvgPLsCwDA0AEL/0nwHV1e
 y+K3sAQktTeYiglAHTvdGU1fGp+eqsHD3uH71Pvj1WHzghuXITj3VKjeUPpTKQjhb4SZQrox2
 eKvKDcPmttuBlks5MarKy+vp81hMYdiT57JHBavja8zzeIwAzslBIiKUkWBeUPoLAEmmo+0/k
 2Yb/BSN1RF0Z+5PbT7Y8vbQbdrHEgqBfPKUl5xlJXmZGVvNtEwxI2Kq3TnpRhuSuA7hR0citO
 n3XRqxTT0bXbqtotQfH2Vg9ofqmX2qzl/hUsVWyxVkv0D0TtrDgzNbWDJwR+WnF+gPUfA9l8J
 J0Ek3NCUZDF4jjg9ItBOfp2gCsSntqBQehpkXWW7LtKW2SBZWY=
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
Cc: Guo Ren <guoren@linux.alibaba.com>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, Christoph Hellwig <hch@lst.de>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Anup Patel <anup@brainfault.org>,
 the arch/x86 maintainers <x86@kernel.org>, linux-csky@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Parisc List <linux-parisc@vger.kernel.org>,
 Drew Fustini <drew@beagleboard.org>, gregkh <gregkh@linuxfoundation.org>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, liush <liush@allwinnertech.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 30, 2022 at 6:47 AM Guo Ren <guoren@kernel.org> wrote:
>
> On Sun, Jan 30, 2022 at 5:56 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Sat, Jan 29, 2022 at 1:17 PM <guoren@kernel.org> wrote:
> > > +
> > > +#define COMPAT_RLIM_INFINITY   0x7fffffff
> > >
> > > +#define F_GETLK64      12
> > > +#define F_SETLK64      13
> > > +#define F_SETLKW64     14
> >
> > These now come from the generic definitions I think. The flock definitions
> > are just the normal ones,
> Yes, it could be removed after Christoph Hellwig's patch merged.

Rgiht, I keep forgetting that this is a separate series, so this is fine.

> > and AFAICT the RLIM_INIFINITY definition here
> > is actually wrong and should be the default 0xffffffffu to match the
> > native (~0UL) definition.
> Yes, native rv32 used ~0UL, although its task_size is only 2.4GB.

The rlimit range has very little to do with the virtual memory address
limits, it is used for a number of other things that are typically more
limited in practice.

> I would remove #define COMPAT_RLIM_INFINITY   0x7fffffff

Ok.

       Arnd
