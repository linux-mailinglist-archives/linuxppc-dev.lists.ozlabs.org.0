Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A4A9E4A5954
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 10:36:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jp0FF3fKcz3cR2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 20:36:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=212.227.17.10; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jp0Dn4jc0z2xY6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 20:36:24 +1100 (AEDT)
Received: from mail-ot1-f51.google.com ([209.85.210.51]) by
 mrelayeu.kundenserver.de (mreue108 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MXGzQ-1mjLdi2kms-00YeOW for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb
 2022 10:36:20 +0100
Received: by mail-ot1-f51.google.com with SMTP id
 l12-20020a0568302b0c00b005a4856ff4ceso7496166otv.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Feb 2022 01:36:20 -0800 (PST)
X-Gm-Message-State: AOAM532e9dAur5w5rXhdtN4BcjOM/DBHQ9h5Nv3L3OBYywQQkgi/nY5C
 W0N/RnLGa3rPi1AKGyQI4wBa+/irzQLgvm4CsX8=
X-Google-Smtp-Source: ABdhPJzjYk9dm3bFjvGFwtGU979wMDH3XPeFI40ue70UVOPzI4lwptcfGFngzaOKSdB77TE70F1nIEDki5MDfbq8Q+A=
X-Received: by 2002:a9d:654f:: with SMTP id q15mr13934011otl.119.1643708178915; 
 Tue, 01 Feb 2022 01:36:18 -0800 (PST)
MIME-Version: 1.0
References: <20220129121728.1079364-1-guoren@kernel.org>
 <20220129121728.1079364-17-guoren@kernel.org>
 <YffVZZg9GNcjgVdm@infradead.org>
 <CAJF2gTRXDotO1L1FMojQs6msrqvCzA782Pux8rg3AfZgA=y0ew@mail.gmail.com>
 <20220201074457.GC29119@lst.de>
 <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
In-Reply-To: <CAJF2gTTc=zwD__zXwYbO8vmup5evWJtzyiAF9Pm-UVHLJRc5hQ@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 1 Feb 2022 10:36:01 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2C7nDGQvopYzi1fe_LWyosp8t9dcBsduYK5k_s_OrCaA@mail.gmail.com>
Message-ID: <CAK8P3a2C7nDGQvopYzi1fe_LWyosp8t9dcBsduYK5k_s_OrCaA@mail.gmail.com>
Subject: Re: [PATCH V4 16/17] riscv: compat: Add COMPAT Kbuild skeletal support
To: Guo Ren <guoren@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:6DEymp1UVc9Wj/rW7VdkyA0iTVEtLFstFSYpYqAT/qb/6H49qLS
 7OaqE6eR/E1JKDDoJjS0EdXhOTQ4Aa3E1ji+T/GyfPXppBOoJqfgwKCYZPW2OkcwvOZqU6h
 Z4grtjJEo9hAE5gqd41IqrQv4C+hmgl/dn2PJzOq/53ySgp0RJY+2mIIaRNtofuDvKFoUMq
 4TYtU0i7FymfWnt9TK4WQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HKAjYtsHFzA=:5gRuz/A0uQlLhc1PeIfBYz
 wiKvtrMOKTGPftglJ3xiDJdBrhTu2OKh5F6pBd3NmIdQpLErZXJczNau5Sue9iFisVi8OvIfj
 2vTyoGy3DBTWUN6UwQ52VAYfbPQV+lUcdpOg40L9RHuhYGbirkkHNYLA6s4qJQNoxRKE2RNsX
 zPmSlZVPF4FjHJ/tv/DiooZWktCBYnkZQrEs+zvJD+Qv+6OZAbG9qyletoc8V1eY4B67YvPXe
 VoF8G4UZDOtHxZgyGuBkpQyMUMKIw6rfgkmyIWdBaksPi8g8G7VvZr3F1QfZaAcdVpfR/eTmC
 G/V26xPP6u3+LaOmCqA8AK6Y3GuwdBY359Y6S2+GTPXJ3oPmznpn1yfZBdgVm5A3WUjdGHT8o
 FvZ5Tx+MLeO881LOaoF1Fb0cQDXkdzAtBnTqWMNMJLe8zdsLVTKVRYnQBFyZnGBXuBq3XRA+E
 LcI5QYPWEVQJdcXYZiTNhZ0ooxCfRpVAQukjJuX1oG4Hy9O9pzX0bRS+aQDUUG2kk08MOp7Ut
 imuXzwz8g8rQTM22DotHxZvOSOtKRFs1eWcOMdB+IYDID+Deb3m3iZV7mJRdS/gOfNO60/0kB
 /qKcBOUZRgOgp2qhtDy/WiG6xLfAjVr81dAegMnoeUc9YRNvPOIInJAbIdu5b6L3ZkXa4JV3T
 gWuXv+nrzVf1gnCboipOlbg5Rxjz0e3ju0FboTGS5RtqFb20VH9eN+LVpx3tJfk0Ei2JKvXAC
 zrMB4sXKW10XOXQkw6nWMzRSD1r0UyPPaM0pIKGQuzqLQyk8ZO9ktFesPxbj78xYd/vKX51ez
 aDqa8shNf7k5Nz73OIOOFYwUwHfOdkq7rTn/MUn+0qzP8LegdU=
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
 Drew Fustini <drew@beagleboard.org>, liush <liush@allwinnertech.com>,
 Wang Junqiang <wangjunqiang@iscas.ac.cn>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wei Fu <wefu@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 1, 2022 at 10:13 AM Guo Ren <guoren@kernel.org> wrote:
> On Tue, Feb 1, 2022 at 3:45 PM Christoph Hellwig <hch@lst.de> wrote:
> > On Mon, Jan 31, 2022 at 09:50:58PM +0800, Guo Ren wrote:
> > > On Mon, Jan 31, 2022 at 8:26 PM Christoph Hellwig <hch@infradead.org> wrote:
> > > >
> > > > Given that most rv64 implementations can't run in rv32 mode, what is the
> > > > failure mode if someone tries it with the compat mode enabled?
> > > A static linked simple hello_world could still run on a non-compat
> > > support hardware. But most rv32 apps would meet different userspace
> > > segment faults.
> > >
> > > Current code would let the machine try the rv32 apps without detecting
> > > whether hw support or not.
> >
> > Hmm, we probably want some kind of check for not even offer running
> > rv32 binaries.  I guess trying to write UXL some time during early
> > boot and catching the resulting exception would be the way to go?
>
> Emm... I think it's unnecessary. Free rv32 app running won't cause
> system problem, just as a wrong elf running. They are U-mode
> privileged.

While it's not a security issue, I think it would be helpful to get a
user-readable error message and a machine-readable /proc/cpuinfo
flag to see if a particular system can run rv32 binaries rather than
relying on SIGILL to kill a process.

        Arnd
